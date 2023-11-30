Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C7C07CA9
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/lUjA5uATopli6To5qtbemTu8J0MNKWd5IrGdnMKFw=; b=Eqfk+nY9SfQ9C8
	svLF2SuuL/CL340AnuXq/vcyQOKykk3emHit4zlVLTUZMaLCcz+3lTFP0LFXs+mmhaAGkKlvBXvpg
	mG1dfyIoJcpkcd1Ei1o6QNUpFeUStC1Tz1X2euHOorxtwsfxZZw1aqHfh7Kn41+yst3UV+I+WcSjm
	1ML0No0x9ZtzBPqD1t6oLxWiqojvJyoEJnG8Bp0NcZSPEbafybJz8jU17+X822loastmxSsvaMW41
	KFeBqSJkNcC1CbwExqIfaqeZgTSqFwkFGw1yAwemC2OuAljIXl4wvjzeiqI8aQGeuN6WMFaQhjqF6
	Bz8puhvJn2PsaT4afE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fxQ-00AocH-1Y;
	Thu, 30 Nov 2023 12:15:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8fxM-00AobQ-2r
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04CCD61E7C;
	Thu, 30 Nov 2023 12:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124E7C433C9;
	Thu, 30 Nov 2023 12:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701346547;
	bh=HmEvOH8Vmsy9AJOG2aGCmYoPEIzruRbAiBD2YtmkRA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9Q5rmh9aU+KSwsXTUbDjhEslkwGTLJuD4YuvMKZRNk1vid8BLmrfcxYmm5rGC3Sv
	 3AeVL2U4xQD8iGEf5sdIVwqG8VKvcfyZToF3GOVR1N4xhpz29fHpZm5WjQkfPxU/oa
	 NCIH9i21TD6fDUvf90zs0Vqn3/6daJEmcrRSwFQ8oI+U15yf5TPwVfQ+GFsAvZ5xB9
	 98WoVjgKVInr3rBkHlBzIN1C3133mWV+BOx8BiXkxuU6OA5K0fL28TAZGaO+4cntvL
	 IzXdGCWDKjhi25Jgr7pupYTgq9xbvkppQ6jSgaejO4vPumm4hCoJIer45JZzZLvtKq
	 q6hQGZqNk3T1Q==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Song Shuai <suagrfillet@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	songshuaishuai@tinylab.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v12 for-next 1/4] riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Thu, 30 Nov 2023 13:15:28 +0100
Message-Id: <20231130121531.1178502-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130121531.1178502-1-bjorn@kernel.org>
References: <20231130121531.1178502-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_041548_964585_973466BB 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgoKSW4gY29tbWl0IGFmYzc2
YjhiODAxMSAoInJpc2N2OiBVc2luZyBQQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkgaW5zdGVhZApv
ZiBNQ09VTlQiKSBSSVNDLVYgYWRkZWQgc3VwcG9ydCBmb3IgLWZwYXRjaGFibGUtZnVuY3Rpb24t
ZW50cnksIHdoaWNoCnJlbW92ZXMgdGhlIG5lZWQgZm9yIHJlY29yZG1jb3VudC4KClNlbGVjdCBG
VFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVOQ1RJT05fRU5UUlkgdG8gdGVsbCB0aGUgYnVp
bGQKc3lzdGVtIG5vdCB0byBydW4gcmVjb3JkbWNvdW50LgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWozRWFrOXZVNnhiQXcwelB1b2gwMHJoOHY1QzJV
M2ZlUGtva1pGaWJXczJnQG1haWwuZ21haWwuY29tL1QvI3QKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvWTRqdGZySnQrJTJGUTVuTU96QHNwdWQvClNpZ25lZC1vZmYt
Ynk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5k
ZXggOTVhMmEwNmFjYzZhLi42OWM5NWU0MmJlOWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2Nv
bmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTY4LDYgKzY4LDcgQEAgY29uZmlnIFJJ
U0NWCiAJc2VsZWN0IENQVV9QTSBpZiBDUFVfSURMRSB8fCBISUJFUk5BVElPTgogCXNlbGVjdCBF
REFDX1NVUFBPUlQKIAlzZWxlY3QgRlJBTUVfUE9JTlRFUiBpZiBQRVJGX0VWRU5UUyB8fCAoRlVO
Q1RJT05fVFJBQ0VSICYmICFEWU5BTUlDX0ZUUkFDRSkKKwlzZWxlY3QgRlRSQUNFX01DT1VOVF9V
U0VfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIGlmIERZTkFNSUNfRlRSQUNFCiAJc2VsZWN0IEdF
TkVSSUNfQVJDSF9UT1BPTE9HWQogCXNlbGVjdCBHRU5FUklDX0FUT01JQzY0IGlmICE2NEJJVAog
CXNlbGVjdCBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVCBpZiBTTVAKLS0gCjIuNDAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
