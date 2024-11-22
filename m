Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E0FE69191
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2024 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEAU4QK+lfjERDtrpXhV/4pTq085fQqUl3/178J5fYc=; b=dIzHk0afz94Jhw
	sds+Y1a5UvbrygM+avTBxDllmPoqIgxL0OJDQ5pyIFdlyYfxQ7eFW0KMdOIKNUaNz2Kew87DqXZ4r
	dyCl3nQDQ7gIPbf4xKFWXDVAn642jp3uYmlAD1WIUuwEZljvLq6/Omb30XekQtXbqp9FeZtRaBOsJ
	ZMJi+nK0oCXEEp8Bvgs+EVyaCjZTC3pkh2PBCjPeztJuFB9R6JtabPBgWaB8wfXwgXWYxzP17Yb8X
	GcZFK8PyN3DgwCSiaHTzP4vEdZ+5Yh2BoscpmMmECNeZKE21EyhZKAwx3QSqZukqm5GdBRvuP0g0D
	AgBPz+Av9aCgC9Y26qrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaMx-00000003HlE-2oD0;
	Fri, 22 Nov 2024 20:35:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEaLx-00000003HdU-3KzT;
	Fri, 22 Nov 2024 20:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FE76A40B50;
	Fri, 22 Nov 2024 20:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA21C4CECE;
	Fri, 22 Nov 2024 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732307648;
	bh=TcHCg6aN8mkh9HyNHFWkSQK0mjWOBxhwbHsro+MsW9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PNH98kde2U4k7sWcPZ9YIaMv+tnRyZSc8CpRzqTc0v3Fi0c1xYzlDNqBgclHUe6gu
	 U0tGVF/m8dBOKa5bkseWM3FduuOojhl3z2USAN8/pSwjfPClDkwOs2NViQLFIbLWg3
	 OiDHfNg34qczlG5DSqWxZpWKzhfATuDViBxednrqQeOvstr9yFaM4BO/dpIqh2HiTp
	 0DvoNFV7EpsoE1S6H65/FrU2jiPfrg4jKDEEwBh9NVNiV/ZCXy3ZkeecrpZ7qTzcjd
	 pGhxgUa+4sFH4nWuiyX5DI4xBDQNOKwT6xlSK7Rxx6lUIapqQBZqwVHqZt8H/8bSfS
	 kC6IMmiO65FKA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2965e65ce89so1706585fac.3;
        Fri, 22 Nov 2024 12:34:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa/9JmyCJJuiFGYeepjOMjMpsJkoCjC83NkzH7cmYDBuy/LwqRzyW2vA902tD7ObP1PlE8/xZVBZtHLos=@lists.infradead.org, AJvYcCXbIjsOJ2ISNWMqyoZQGQAKiXsJtcdhiAQ4zELi2ET/4o941wLxnzHQcM+nkGycMiz9qoHNxY+djRnqXwUKJOK2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7inE7Xr0pP8D4Gx0xRIpKx4gz4Ad8W3lEMlzEwHrGGOlXKOi4
	gOtGLAhmcaRHUqcUgR0N5CQoD5qfL2fxhLvrGF5w4ZFpXpwetJMq2aXOSS2li7GgyUpkPpgaJx9
	pFfVVZmCtEJNY2UsnLD2G9eJ9Wqw=
X-Google-Smtp-Source: AGHT+IGXWpH3f+Kr55W7HkdCqx5mQR/15zrCInu/7hL9xRBP/V3xL9ZNnuFy+ofcmgd6X8E/49jQLyy2xHXJ99+oHj0=
X-Received: by 2002:a05:6870:4192:b0:296:e00e:22e9 with SMTP id
 586e51a60fabf-29720e5f19amr4285335fac.36.1732307647677; Fri, 22 Nov 2024
 12:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20241121-intro-acpi-arch-init-v4-1-b1fb517e7d8b@gmail.com>
In-Reply-To: <20241121-intro-acpi-arch-init-v4-1-b1fb517e7d8b@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Nov 2024 21:33:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gmDghrLAx_ZpFS0oK8UAPLE8A2Mzt4yVJG7CtYYy0VUw@mail.gmail.com>
Message-ID: <CAJZ5v0gmDghrLAx_ZpFS0oK8UAPLE8A2Mzt4yVJG7CtYYy0VUw@mail.gmail.com>
Subject: Re: [PATCH v4] ACPI: introduce acpi_arch_init
To: shankerwangmiao@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_123409_960172_44052BDC 
X-CRM114-Status: GOOD (  19.86  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMzoyNeKAr1BNIE1pYW8gV2FuZyB2aWEgQjQgUmVsYXkK
PGRldm51bGwrc2hhbmtlcndhbmdtaWFvLmdtYWlsLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
IEZyb206IE1pYW8gV2FuZyA8c2hhbmtlcndhbmdtaWFvQGdtYWlsLmNvbT4KPgo+IFRvIGF2b2lk
IGFyY2gtc3BlY2lmaWMgY29kZSBpbiBnZW5lcmFsIEFDUEkgaW5pdGlhbGl6YXRpb24gZmxvdywK
PiB3ZSBpbnRyb2R1Y2UgYSB3ZWFrIHN5bWJvbCBhY3BpX2FyY2hfaW5pdC4gQ3VycmVudGx5LCBh
cm02NCBhbmQKPiByaXNjdiBjYW4gdXRpbGxpemUgdGhpcyB0byBpbnNlcnQgdGhlaXIgYXJjaC1z
cGVjaWZpYyBmbG93LiBJbgo+IHRoZSBmdXR1cmUsIG90aGVyIGFyY2hpdGVjdHVyZXMgY2FuIGFs
c28gaGF2ZSBjaGFuY2UgdG8gZGVmaW5lCj4gdGhlaXIgb3duIGFyY2gtc3BlY2lmaWMgYWNwaSBp
bml0aWFsaXphdGlvbiBwcm9jZXNzIGlmIG5lY2Vzc2FyeS4KPgo+IFJldmlld2VkLWJ5OiBTdW5p
bCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogU3VkZWVwIEhv
bGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiBBY2tlZC1ieTogSGFuanVuIEd1byA8Z3VvaGFu
anVuQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWlhbyBXYW5nIDxzaGFua2Vyd2FuZ21p
YW9AZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgZnJvbSB2MQo+IC0gQ2hhbmdlIGFjcGlfYXJj
aF9pbml0IGZyb20gYSBzdGF0aWMgaW5saW5lIHN0dWIgdG8gYSB3ZWFrIGZ1bmN0aW9uCj4gICBh
Y2NvcmRpbmcgdG8gSGFpanVuIEd1bydzIGFkdmljZQo+IC0tLQo+IENoYW5nZXMgZnJvbSB2MjoK
PiAtIEFkZCBfX2luaXQgYXR0cmlidXRlIHRvIHRoZSB3ZWFrIGFjcGlfYXJjaF9pbml0IHN0dWIK
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA4MDctaW50cm8t
YWNwaS1hcmNoLWluaXQtdjItMS05MjMxZTIzYTc3MjFAZ21haWwuY29tCj4gLS0tCj4gQ2hhbmdl
cyBpbiB2NDoKPiAtIFJlYmFzZWQgdG8gcmVjZW50IExpbnVzJ3MgdHJlZQo+IC0gQ29uc29saWRh
dGUgYWNwaV9hcm1faW5pdCBhbmQgYWNwaV9yaXNjdl9pbml0IGludG8gYWNwaV9hcmNoX2luaXQK
PiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA4MDgtaW50cm8t
YWNwaS1hcmNoLWluaXQtdjMtMS1iYTUxMDg1OWJhZmZAZ21haWwuY29tCj4gLS0tCj4gIGRyaXZl
cnMvYWNwaS9hcm02NC9pbml0LmMgfCAgMiArLQo+ICBkcml2ZXJzL2FjcGkvYnVzLmMgICAgICAg
IHwgIDUgKysrLS0KPiAgZHJpdmVycy9hY3BpL3Jpc2N2L2luaXQuYyB8ICAyICstCj4gIGluY2x1
ZGUvbGludXgvYWNwaS5oICAgICAgfCAxMiArLS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9hcm02NC9pbml0LmMgYi9kcml2ZXJzL2FjcGkvYXJtNjQvaW5pdC5jCj4gaW5kZXgg
ZDBjOGFlZDkwZmQxNmY5YTdmZTYyYjhjNTUxYzBjZDA5MWNiOTFlYy4uN2E0N2Q4MDk1YTdkZDVm
M2RhYzZlMDc1NGQ2MjcxYmY2ZGUyNjlmZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvYXJt
NjQvaW5pdC5jCj4gKysrIGIvZHJpdmVycy9hY3BpL2FybTY0L2luaXQuYwo+IEBAIC0yLDcgKzIs
NyBAQAo+ICAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ICAjaW5jbHVkZSAiaW5pdC5oIgo+Cj4g
LXZvaWQgX19pbml0IGFjcGlfYXJtX2luaXQodm9pZCkKPiArdm9pZCBfX2luaXQgYWNwaV9hcmNo
X2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0FDUElfQUdE
SSkpCj4gICAgICAgICAgICAgICAgIGFjcGlfYWdkaV9pbml0KCk7Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYWNwaS9idXMuYyBiL2RyaXZlcnMvYWNwaS9idXMuYwo+IGluZGV4IDE2OTE3ZGMzYWQ2
MDRjYzUzN2QwNWJiMmMwMDM0ZmY1YTkxODFmZDAuLjA1ODkxMGFmODJiY2E2ODk1Nzc5MDllODk2
NzA3M2NhMzE5OGIzYzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL2J1cy5jCj4gKysrIGIv
ZHJpdmVycy9hY3BpL2J1cy5jCj4gQEAgLTE0MzQsNiArMTQzNCw4IEBAIHN0YXRpYyBpbnQgX19p
bml0IGFjcGlfYnVzX2luaXQodm9pZCkKPiAgc3RydWN0IGtvYmplY3QgKmFjcGlfa29iajsKPiAg
RVhQT1JUX1NZTUJPTF9HUEwoYWNwaV9rb2JqKTsKPgo+ICt2b2lkIF9fd2VhayBfX2luaXQgYWNw
aV9hcmNoX2luaXQodm9pZCkgeyB9Cj4gKwo+ICBzdGF0aWMgaW50IF9faW5pdCBhY3BpX2luaXQo
dm9pZCkKPiAgewo+ICAgICAgICAgaW50IHJlc3VsdDsKPiBAQCAtMTQ2MSw4ICsxNDYzLDcgQEAg
c3RhdGljIGludCBfX2luaXQgYWNwaV9pbml0KHZvaWQpCj4gICAgICAgICBhY3BpX3Zpb3RfZWFy
bHlfaW5pdCgpOwo+ICAgICAgICAgYWNwaV9oZXN0X2luaXQoKTsKPiAgICAgICAgIGFjcGlfZ2hl
c19pbml0KCk7Cj4gLSAgICAgICBhY3BpX2FybV9pbml0KCk7Cj4gLSAgICAgICBhY3BpX3Jpc2N2
X2luaXQoKTsKPiArICAgICAgIGFjcGlfYXJjaF9pbml0KCk7Cj4gICAgICAgICBhY3BpX3NjYW5f
aW5pdCgpOwo+ICAgICAgICAgYWNwaV9lY19pbml0KCk7Cj4gICAgICAgICBhY3BpX2RlYnVnZnNf
aW5pdCgpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvaW5pdC5jIGIvZHJpdmVy
cy9hY3BpL3Jpc2N2L2luaXQuYwo+IGluZGV4IDVlZjk3OTA1YTcyNzU5ZWEyYWFiMzE5NWU1NmI3
ZWU1ODBlZGVkOTYuLjY3M2U0ZDVkZDc1MjcxOWFlN2VkMDAxN2M4YjViMWM2ODhjZjliNGIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L2luaXQuYwo+ICsrKyBiL2RyaXZlcnMvYWNw
aS9yaXNjdi9pbml0LmMKPiBAQCAtNyw3ICs3LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2FjcGku
aD4KPiAgI2luY2x1ZGUgImluaXQuaCIKPgo+IC12b2lkIF9faW5pdCBhY3BpX3Jpc2N2X2luaXQo
dm9pZCkKPiArdm9pZCBfX2luaXQgYWNwaV9hcmNoX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAg
cmlzY3ZfYWNwaV9pbml0X2dzaV9tYXBwaW5nKCk7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9hY3BpLmggYi9pbmNsdWRlL2xpbnV4L2FjcGkuaAo+IGluZGV4IDdkZDI0YWNkOWZm
ZWVkYmU0N2FjMzkyYmQ5MzkzMDk0MDhjMGFmYTMuLjA1ZjM5ZmJmYTQ4NTZkMmU2YjdkNDVkOTU4
MGNjODI5NjM3NjRkNTUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9hY3BpLmgKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L2FjcGkuaAo+IEBAIC0xNTMwLDE3ICsxNTMwLDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgZmluZF9hY3BpX2NwdV90b3BvbG9neV9oZXRlcm9faWQodW5zaWduZWQgaW50IGNw
dSkKPiAgfQo+ICAjZW5kaWYKPgo+IC0jaWZkZWYgQ09ORklHX0FSTTY0Cj4gLXZvaWQgYWNwaV9h
cm1faW5pdCh2b2lkKTsKPiAtI2Vsc2UKPiAtc3RhdGljIGlubGluZSB2b2lkIGFjcGlfYXJtX2lu
aXQodm9pZCkgeyB9Cj4gLSNlbmRpZgo+IC0KPiAtI2lmZGVmIENPTkZJR19SSVNDVgo+IC12b2lk
IGFjcGlfcmlzY3ZfaW5pdCh2b2lkKTsKPiAtI2Vsc2UKPiAtc3RhdGljIGlubGluZSB2b2lkIGFj
cGlfcmlzY3ZfaW5pdCh2b2lkKSB7IH0KPiAtI2VuZGlmCj4gK3ZvaWQgYWNwaV9hcmNoX2luaXQo
dm9pZCk7Cj4KPiAgI2lmZGVmIENPTkZJR19BQ1BJX1BDQwo+ICB2b2lkIGFjcGlfaW5pdF9wY2Mo
dm9pZCk7Cj4KPiAtLS0KCkFwcGxpZWQgYXMgNi4xMy1yYyBtYXRlcmlhbCwgdGhhbmtzIQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
