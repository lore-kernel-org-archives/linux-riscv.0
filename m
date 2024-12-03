Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA76FE64A81
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2bL6C/MjaiYc2WpB499fgYdgjgFKnEvqlccSGBohbI=; b=geSZphqLUUhMgu
	NE9h1RvC7qo5Cis0xGj3A2bo0d5A48JiPo0UBrfNf75TPjZpoo90HZRPOLxXVVbzIiYS33VPUiV8L
	XdYbPt8s/SIzwj/IYzaocNK6+BuRZM22kYQ2jG9e7tEp0Q4FuRA8ChIBAa781APuon5DVUWy+A3gf
	YO9laE+nxCWV7Nenh5re6CVh8JDvuKba18z7bmBeEAcrWDLFJnXjvquk8DKsfyF322UO3+Wgp6s2P
	stmXSvcgQ0V5+HfHhetyKuIspni4QAEE+WxurIWTW0lf1CY0BC00sLGnbmGuzUZSfQO5Cv1GxJjE1
	evEfIYje1Boq2yC/mpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRBS-00000009IPu-3h0w;
	Tue, 03 Dec 2024 11:35:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRBP-00000009IOm-3Iqn
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 11:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B4C65C6C60;
	Tue,  3 Dec 2024 11:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC7EC4CECF;
	Tue,  3 Dec 2024 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733225710;
	bh=3MWjk85NmWlbYMWabiD2fBNYO8K3kUK/Onp9ETA+5Y4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hHI3kOxCigtxutre/XbKF8THCbBA15kF2UzeEXnrSamiyaEFqVM4H3c+96TIZ2v3I
	 HpVLl0bl7MdznOYha2Hc7OVvTbjLuiVZMzAqTxx+ERgiEdIkVs/pCTEQkvtMRCQyLe
	 H0mf7yKzj8unWbqRt7i0h7nFlGz4JXTX754TN7l4wpS8dqXRMW9jffGxoM5SjQRdh6
	 Zv01tQD3eXXzbR8kSvH8wD+zrSXGo5LIQHFCi4NwGDjs8BFDAK66oRovKf3ry8z2bo
	 zpV+LoHnrso1bIivSeWZJBBQIdTGVKZrArvCYv36KO5jZfoKUYZRjAIY42MCc40VXh
	 wUqFRvWrHkh1w==
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
Subject: Re: [PATCH v2 1/2] riscv/ptrace: add new regset to access original
 a0 register
In-Reply-To: <20241203-riscv-new-regset-v2-1-d37da8c0cba6@coelacanthus.name>
References: <20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name>
 <20241203-riscv-new-regset-v2-1-d37da8c0cba6@coelacanthus.name>
Date: Tue, 03 Dec 2024 12:35:07 +0100
Message-ID: <87ed2pdmok.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_033511_912277_06490B12 
X-CRM114-Status: GOOD (  14.48  )
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

Q2VsZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4gd3JpdGVzOgoKPiBUaGUgb3JpZ19h
MCBpcyBtaXNzaW5nIGluIHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IG9mIHJpc2N2LCBhbmQgdGhl
cmUgaXMKPiBubyB3YXkgdG8gYWRkIGl0IHdpdGhvdXQgYnJlYWtpbmcgVUFQSS4gKFNlZSBMaW5r
IHRhZyBiZWxvdykKPgo+IExpa2UgTlRfQVJNX1NZU1RFTV9DQUxMIGRvLCB3ZSBhZGQgYSBuZXcg
cmVnc2V0IG5hbWUgTlRfUklTQ1ZfT1JJR19BMCB0bwo+IGFjY2VzcyBvcmlnaW5hbCBhMCByZWdp
c3RlciBmcm9tIHVzZXJzcGFjZSB2aWEgcHRyYWNlIEFQSS4KPgo+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC81OTUwNTQ2NC1jODRhLTQwM2QtOTcyZi1kNGIyMDU1ZWVhYWNAZ21h
aWwuY29tLwo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2Vs
ZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvcHRyYWNlLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNs
dWRlL3VhcGkvbGludXgvZWxmLmggICB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+IGluZGV4IGVhNjdlOWZiN2E1ODM2ODNiOTIyZmUy
YzAxN2VhNjFmM2JjODQ4ZGIuLjE4Y2UwN2ZmYjI3YmIxMTgwNjY3NzY5ZWVkODAwZjZmZGY5NmMw
ODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+IEBAIC0zMSw2ICszMSw3IEBAIGVudW0gcmlzY3ZfcmVn
c2V0IHsKPiAgI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfU1VQTQo+ICAJUkVHU0VUX1RBR0dFRF9B
RERSX0NUUkwsCj4gICNlbmRpZgo+ICsJUkVHU0VUX09SSUdfQTAsCj4gIH07Cj4gIAo+ICBzdGF0
aWMgaW50IHJpc2N2X2dwcl9nZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsCj4gQEAgLTE4
NCw2ICsxODUsMjkgQEAgc3RhdGljIGludCB0YWdnZWRfYWRkcl9jdHJsX3NldChzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRhcmdldCwKPiAgfQo+ICAjZW5kaWYKPiAgCj4gK3N0YXRpYyBpbnQgcmlzY3Zf
b3JpZ19hMF9nZXQoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsCj4gKwkJCSAgICAgY29uc3Qg
c3RydWN0IHVzZXJfcmVnc2V0ICpyZWdzZXQsCj4gKwkJCSAgICAgc3RydWN0IG1lbWJ1ZiB0bykK
PiArewo+ICsJcmV0dXJuIG1lbWJ1Zl9zdG9yZSgmdG8sIHRhc2tfcHRfcmVncyh0YXJnZXQpLT5v
cmlnX2EwKTsKPiArfQo+ICsKPiArc3RhdGljIGludCByaXNjdl9vcmlnX2EwX3NldChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRhcmdldCwKPiArCQkJICAgICBjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzZXQg
KnJlZ3NldCwKPiArCQkJICAgICB1bnNpZ25lZCBpbnQgcG9zLCB1bnNpZ25lZCBpbnQgY291bnQs
Cj4gKwkJCSAgICAgY29uc3Qgdm9pZCAqa2J1ZiwgY29uc3Qgdm9pZCBfX3VzZXIgKnVidWYpCj4g
K3sKPiArCXVuc2lnbmVkIGxvbmcgb3JpZ19hMCA9IHRhc2tfcHRfcmVncyh0YXJnZXQpLT5vcmln
X2EwOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSB1c2VyX3JlZ3NldF9jb3B5aW4oJnBvcywg
JmNvdW50LCAma2J1ZiwgJnVidWYsICZvcmlnX2EwLCAwLCAtMSk7Cj4gKwlpZiAocmV0KQo+ICsJ
CXJldHVybiByZXQ7Cj4gKwo+ICsJdGFza19wdF9yZWdzKHRhcmdldCktPm9yaWdfYTAgPSBvcmln
X2EwOwo+ICsJcmV0dXJuIHJldDsKCk5pdDogQ291bGQgYmUgcmV0dXJuIDAsIGZvciByZWFkYWJp
bGl0eS4KClJlZ2FyZGxlc3MsClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
