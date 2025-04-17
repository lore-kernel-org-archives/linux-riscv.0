Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA55C369B2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c2DagVomlXt/Z5DRpz4FJLuvTqD29dD+3txQ516XnWk=; b=QONEojqKiiDNpj
	DbIkgCgJyNwk7nDuZMtGktc8RV7L824yd7lqETzqkKM0T5SpGkAi6vDv8axXNPiSUBpfAHDvtmd1F
	ilhqI/l+uDnPwWaM6ioaUuzeEu9qrXrn96iYWOf16G1XF2ww0AgOmVsM4DcZeTZAxSkHqN+O0cvLD
	l1uGFHly5n4KVEUoTfvZHfhmBOLZLicNbUOdYxGg+WVZDY6UZiE9r7sCXCrckX7K70j6B8fptiQv5
	dH/EzSc9/fRKP13ZvT5xMpimnvDdTWz3WhBBDLFmzU2rvah1bHvsESo57yOoLPIHjXMHeP20t+2UE
	votSsXJD942tFNEoegCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K4l-0000000CBM4-1h5b;
	Thu, 17 Apr 2025 07:54:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5K0b-0000000CAbm-1iez
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 07:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AEAA45265;
	Thu, 17 Apr 2025 07:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25047C4CEE4;
	Thu, 17 Apr 2025 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744876204;
	bh=Sye1tJDPd/uimiJvlKKSnJsoABxzjc348sGOhJsGs+4=;
	h=From:To:Cc:Subject:Date:From;
	b=nrcRw7XekbGfUAVDSfpBsKPyJ/5pPZ+vkENqqp9hDZx4nCUjRunZUyAn2nhLWPqUj
	 UWM8nqjiOu8bXCqqUG4MlWWJnv8GG4rxAVEwav5qk4pJarMMwQambB8J008Lwnc0MP
	 UGMjHHCmUEUu+4I69fvTRV+tbKslZY3lKwa+jw1lmzC68pQJrB+dISBf4+b7QQ3kSL
	 IkPPS51lNABVrtkHaI25xtt1wsUIz4UDlr/0es21HsByfvCeXulyBzn4bviGvFoVoa
	 2Dgd2L33FctkY7p3TByzs7/I3chEjn85GWehhrnL/ezwyW5rw/EEv+hJtZ/Hk81VX7
	 TEMhVWqWFki9w==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH fixes] riscv: uprobes: Add missing fence.i after building the XOL buffer
Date: Thu, 17 Apr 2025 09:49:49 +0200
Message-ID: <20250417074952.1315641-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_005005_469776_A42AB68D 
X-CRM114-Status: GOOD (  10.85  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFhPTCAoZXhlY3V0
ZSBvdXQtb2YtbGluZSkgYnVmZmVyIGlzIHVzZWQgdG8gc2luZ2xlLXN0ZXAgdGhlCnJlcGxhY2Vk
IGluc3RydWN0aW9uKHMpIGZvciB1cHJvYmVzLiBUaGUgUklTQy1WIHBvcnQgd2FzIG1pc3Npbmcg
YQpwcm9wZXIgZmVuY2UuaSAoaSQgZmx1c2hpbmcpIGFmdGVyIGNvbnN0cnVjdGluZyB0aGUgWE9M
IGJ1ZmZlciwgd2hpY2gKY2FuIHJlc3VsdCBpbiBpbmNvcnJlY3QgZXhlY3V0aW9uIG9mIHN0YWxl
L2Jyb2tlbiBpbnN0cnVjdGlvbnMuCgpUaGlzIHdhcyBmb3VuZCBydW5uaW5nIHRoZSBCUEYgc2Vs
ZnRlc3RzICJ0ZXN0X3Byb2dzOgp1cHJvYmVfYXV0b2F0dGFjaCwgYXR0YWNoX3Byb2JlIiBvbiB0
aGUgU3BhY2VtaXQgSzEvWDYwLCB3aGVyZSB0aGUKdXByb2JlcyB0ZXN0cyByYW5kb21seSBibGV3
IHVwLgoKRml4ZXM6IDc0Nzg0MDgxYWFjOCAoInJpc2N2OiBBZGQgdXByb2JlcyBzdXBwb3J0ZWQi
KQpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyB8IDkgKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy91cHJvYmVzLmMKaW5kZXggNGIzZGM4YmVhZjc3Li40ZmFlZjkyZGQ3NzEgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL3Vwcm9iZXMuYwpAQCAtMTc2LDEzICsxNzYsNiBAQCB2b2lkIGFyY2hfdXByb2Jl
X2NvcHlfaXhvbChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJKih1
cHJvYmVfb3Bjb2RlX3QgKilkc3QgPSBfX0JVR19JTlNOXzMyOwogCX0KIAorCWZsdXNoX2ljYWNo
ZV9yYW5nZSgodW5zaWduZWQgbG9uZylkc3QsICh1bnNpZ25lZCBsb25nKWRzdCArIGxlbik7CiAJ
a3VubWFwX2F0b21pYyhrYWRkcik7Ci0KLQkvKgotCSAqIFdlIHByb2JhYmx5IG5lZWQgZmx1c2hf
aWNhY2hlX3VzZXJfcGFnZSgpIGJ1dCBpdCBuZWVkcyB2bWEuCi0JICogVGhpcyBzaG91bGQgd29y
ayBvbiBtb3N0IG9mIGFyY2hpdGVjdHVyZXMgYnkgZGVmYXVsdC4gSWYKLQkgKiBhcmNoaXRlY3R1
cmUgbmVlZHMgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCBpdCBjYW4gZGVmaW5lCi0JICogaXRz
IG93biB2ZXJzaW9uIG9mIHRoZSBmdW5jdGlvbi4KLQkgKi8KLQlmbHVzaF9kY2FjaGVfcGFnZShw
YWdlKTsKIH0KCmJhc2UtY29tbWl0OiAxYTFkNTY5YTc1ZjNhYjI5MjNjYjYyZGFmMzU2ZDEwMmU0
ZGYyYjg2Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
