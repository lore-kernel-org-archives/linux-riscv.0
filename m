Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A8C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvYg8gN3FwJulv66Konkz+DioDXR1xm6gYGS0/aE9Qg=; b=0IygwdXGA6XmMa
	jTvKRKWZpGEp+3khJyVgb3SCZehQiuoW/zi+aIWKUqNC0mXDKnBYThoAWZ1cAcF8bvl2O51T4o98n
	uc6U0BPsYY5CxRhuwUHpzmp1HbYbZB8J2I44EB26NXcIfJ10JElsmRH/yeaKkau92CtlWdiKknKO5
	fXHSKPNQBxYItaS1ao/9QkhsT419zz0BbAQWXDUGtaCynyQiqo3/nzFXv0raga0fkAZH4ZhfQoQGA
	ZzEhntfcceVhDWRCzDQzeuPLplFWHMOu5Pgkad/aMvy+syFePsiHf/gwL14LYM5kZ5OyJzwGqo0ij
	r33EvciF0ijgNubUDIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx2D-00000006BEs-0LL8;
	Mon, 17 Aug 2026 13:05:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvx2C-00000006BEW-2ey1
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 13:05:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F0B56020E
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D3F1F00A3D
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786971947;
	bh=663yyECH2mEJuQUAgQC5SbmtrIGzCW+M3cKjuHH5a4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ONFNmzaLulTjtDoGvTwMBRbnsjZg/3HxU3uOCKuLewN/7IbZsjH6tQY3wgcZv9s1K
	 syrwKkJZEG1pJ05fQbNg1fieA5U9OdtAzLIUFXAFOw0ZOZMC2lY5Zt6fuTBofNzk1I
	 AGo8GqvDX5BPxRZ/zQPmLSnmE66nrp5jcb0qOGbrlbJnS8L60i+GhmquxxGkALQEyR
	 KumT7gqskCo0qrMWc5EegE/3TbcKqnSv117H79x++EeJCk2Kp+y7NXOJE6gpLkQY/l
	 HGz0kq+Cy7wJz0Jp9tqelehpXRyVKufEBCLiDxKkTFbeyVUrgOKZ2MHUoBjb7JRwg0
	 Yzq2yZDPt9sCg==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1840933f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 06:05:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy7J7QP8bcqLilICbFwc4ES+l9SGQ7jm9xEFh4BbuGIGk+6G9N/
	fS224epHet6pCHC8d4MvB19dMJYLqMJro8vzrjUJ8Oa+7OLjNvlnuZHIKFNJnY6xQ+DXSMvdS3y
	LUkcfTPXVDobkoCmiKnSvYP/kx3bB5ZI=
X-Received: by 2002:a05:6000:46db:b0:47f:4ac9:98bc with SMTP id
 ffacd0b85a97d-48160757587mr29614538f8f.24.1786971945681; Mon, 17 Aug 2026
 06:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-6-guoren@kernel.org>
 <e70e9fd19e9ebaec823a8abc518bf935e36938b9.camel@rendec.net>
In-Reply-To: <e70e9fd19e9ebaec823a8abc518bf935e36938b9.camel@rendec.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2026 21:05:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTeZohiUrn83d-XrxDdMP-LA2eyjpxyqn_-XOk0ko0qbA@mail.gmail.com>
X-Gm-Features: AcwNN1WQyyD-VPSqOVOu6R4lNaOkTYLvHBLE-lKStmP7hP0Hlv6Dhl6k4dffPm8
Message-ID: <CAJF2gTTeZohiUrn83d-XrxDdMP-LA2eyjpxyqn_-XOk0ko0qbA@mail.gmail.com>
Subject: Re: [PATCH 5/5] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
To: Radu Rendec <radu@rendec.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, anup@brainfault.org, 
	hui.wang@canonical.com, samuel.holland@sifive.com
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMTE6MjjigK9QTSBSYWR1IFJlbmRlYyA8cmFkdUByZW5k
ZWMubmV0PiB3cm90ZToKPgo+IE9uIFN1biwgMjAyNi0wOC0xNiBhdCAwNzowMCArMDAwMCwgR3Vv
IFJlbiB3cm90ZToKPiA+IEZyb206ICJHVU8gUmVuIChYdWFuVGllKSIgPGd1b3JlbkBrZXJuZWwu
b3JnPgo+ID4KPiA+IElNU0lDIHdhcyBkZWZpbmluZyBpdHMgb3duIElNU0lDX05SX0lQSSAoPSA4
KSB3aGljaCBoYXBwZW5lZCB0byBtYXRjaAo+ID4gdGhlIGFyY2hpdGVjdHVyZSdzIElQSV9NQVgu
IE5vdyB0aGF0IElQSV9NQVggaXMgZXhwb3J0ZWQgZnJvbSByaXNjdgo+ID4gYXNtL3NtcC5oLCB1
c2UgdGhlIGFyY2hpdGVjdHVyZSBjb25zdGFudCBhbmQgZHJvcCB0aGUgcHJpdmF0ZSBkZWZpbmUu
Cj4gPgo+ID4gVGhpcyBrZWVwcyB0aGUgbnVtYmVyIG9mIG11bHRpcGxleGVkIElQSXMgaW4gc3lu
YyB3aXRoIHRoZSByZXN0IG9mIHRoZQo+ID4gUklTQy1WIElQSSBpbmZyYXN0cnVjdHVyZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+
Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMgfCA0
ICsrLS0KPiA+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmggfCAxIC0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5j
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gPiBpbmRleCAxMmVm
ZDI0MWNlODguLjgyM2Y1ZjJlY2IzZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1lYXJseS5jCj4gPiBAQCAtNjcsMTIgKzY3LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0
IGltc2ljX2lwaV9kb21haW5faW5pdCh2b2lkKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsK
PiA+Cj4gPiAgICAgICAvKiBDcmVhdGUgSU1TSUMgSVBJIG11bHRpcGxleGluZyAqLwo+ID4gLSAg
ICAgdmlycSA9IGlwaV9tdXhfY3JlYXRlKElNU0lDX05SX0lQSSwgaW1zaWNfaXBpX3NlbmQpOwo+
ID4gKyAgICAgdmlycSA9IGlwaV9tdXhfY3JlYXRlKElQSV9NQVgsIGltc2ljX2lwaV9zZW5kKTsK
PiA+ICAgICAgIGlmICh2aXJxIDw9IDApCj4gPiAgICAgICAgICAgICAgIHJldHVybiB2aXJxIDwg
MCA/IHZpcnEgOiAtRU5PTUVNOwo+ID4KPiA+ICAgICAgIC8qIFNldCB2SVJRIHJhbmdlICovCj4g
PiAtICAgICByaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UodmlycSwgSU1TSUNfTlJfSVBJKTsKPiA+
ICsgICAgIHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZSh2aXJxLCBJUElfTUFYKTsKPiA+Cj4gPiAg
ICAgICAvKiBBbm5vdW5jZSB0aGF0IElNU0lDIGlzIHByb3ZpZGluZyBJUElzICovCj4gPiAgICAg
ICBwcl9pbmZvKCIlcGZ3UDogcHJvdmlkaW5nIElQSXMgdXNpbmcgaW50ZXJydXB0ICVkXG4iLCBp
bXNpYy0+Zndub2RlLCBJTVNJQ19JUElfSUQpOwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtc3RhdGUuaAo+ID4gaW5kZXggYzQyZWUxODBiMzA1Li44NzhjYzE5MmNjZWMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmgKPiA+ICsr
KyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+ID4gQEAgLTEzLDcg
KzEzLDYgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvdGltZXIuaD4KPiA+Cj4gPiAgI2RlZmluZSBJ
TVNJQ19JUElfSUQgICAgICAgICAgICAgICAgICAgICAgICAgMQo+ID4gLSNkZWZpbmUgSU1TSUNf
TlJfSVBJICAgICAgICAgICAgICAgICAgICAgICAgIDgKPiA+Cj4gPiAgc3RydWN0IGltc2ljX3Zl
Y3RvciB7Cj4gPiAgICAgICAvKiBGaXhlZCBkZXRhaWxzIG9mIHRoZSB2ZWN0b3IgKi8KPgo+IFJl
dmlld2VkLWJ5OiBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0PgoKVGhhbmtzIGZvciB0aGUg
cmV2aWV3LCBSYWR1LiBIb3dldmVyLCB0aGlzIHBhdGNoIGRlcGVuZHMgb24gWzFdLiBXb3VsZAp5
b3UgbWluZCBhbHNvIHJldmlld2luZyBbMV0/CgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjYwODE2MDcwMDQ5LjIwOTc0NDItMi1ndW9yZW5Aa2VybmVsLm9yZy8K
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
