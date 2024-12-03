Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB45DE64A82
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf/lAPmo7xDIk/fKUtoyynP7EUrnCjjNvfFjvdg0RMc=; b=NHIZHeBbt77jyj
	jvMGJJaPF028CRsfk5M+ZlCMtROGCZOc1yMU4sO02Mw8Iz4z+W/yF70AGCiJXr4FgqKIHb98InUbW
	xs+BvkY5RGVd+BxgUO23u1eDi3ARogi2kEn3QrlSCn4r167/TW1SnsnLeS3BX0AGZSB75tgFdNHwj
	xFoxj1AHHKqmnzuGxzLnp5pJwdofb/B3ee9uuxgFTmwZQ1+PfbT9BDn9Lc4asoOoc/S+jfJVS+bKp
	GKKvC+BSUcxIPahg+wkufXD7FvSs5aIvxHkU7ZGXbnBb2076AHA5BCxOiJfWCF3fDgG+vLsLhi8as
	osfxGaYZrKz/JJwozVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIREK-00000009Igc-34AN;
	Tue, 03 Dec 2024 11:38:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIREJ-00000009IgB-0AYa
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 11:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1293B5C6C66;
	Tue,  3 Dec 2024 11:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA00C4CED6;
	Tue,  3 Dec 2024 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733225889;
	bh=SOpDD/j8v1BW+RzStopfvCSMdaQOSrVLeT5dQ5ZfMis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kRq2xUlVOdU0klRsEqazpye3CHkPfgh2LXRrkUWPFB3qkELHGfIs5bVkdvpey1Ghd
	 +s3wf03Bgx2ShWfjygtnPTlLMWbCFz+8d93V2QT6HjyuodUl77fftQqZqkt8O95L7D
	 FTP33H0gy0q9/1bAEvOyeTaVZaeMQJyZh/FjmcsKnW+eU0bRR8Um69qYjGbySKD9bO
	 A/ojSCiWlKTXmXWjW0INs2UcKSaQ8Cl3brhqFJj4mFJ7c0x8olSECuhhoXfRFvE3pf
	 TgRJ75P5xW//l2rh5hXsoJAlep0r00PPruwKIs6g1PE+FfDCMyqv9Sh6+IUQ6ozKJV
	 s6b38R6PoUcOQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Shuah Khan
 <shuah@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, Charlie Jenkins
 <charlie@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>, Felix Yan
 <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang
 <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Celeste Liu <uwu@coelacanthus.name>
Subject: Re: [PATCH v2 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
In-Reply-To: <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-2-d37da8c0cba6@coelacanthus.name>
Date: Tue, 03 Dec 2024 12:38:06 +0100
Message-ID: <878qsxdmjl.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_033811_125199_95C36091 
X-CRM114-Status: UNSURE (   6.90  )
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

Q2VsZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4gd3JpdGVzOgoKPiBGcm9tOiBDaGFy
bGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+Cj4gVGhpcyB0ZXN0IGNoZWNrcyB0
aGF0IG9yaWdfYTAgYWxsb3dzIGEgc3lzY2FsbCBhcmd1bWVudCB0byBiZSBtb2RpZmllZCwKPiBh
bmQgdGhhdCBjaGFuZ2luZyBhMCBkb2VzIG5vdCBjaGFuZ2UgdGhlIHN5c2NhbGwgYXJndW1lbnQu
Cj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IENvLWRldmVsb3BlZC1ieTogUXVhbiBa
aG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpo
b3VxdWFuQGlzY2FzLmFjLmNuPgo+IENvLWRldmVsb3BlZC1ieTogQ2VsZXN0ZSBMaXUgPHV3dUBj
b2VsYWNhbnRodXMubmFtZT4KPiBTaWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8dXd1QGNvZWxh
Y2FudGh1cy5uYW1lPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUBy
aXZvc2luYy5jb20+CgpOaWNlIHdpdGggYSBzZWxmdGVzdCEgKERvbid0IHRoaW5rIHRoZSBDYzog
c3RhYmxlIGFwcGxpZXMuLi4gOy0pKQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
