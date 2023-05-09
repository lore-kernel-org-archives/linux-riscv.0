Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84328C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gns0eUgVt518dBm5GonNgEcL0SWdrbl2l57nDgbmysA=; b=MKKpVZ0vgTgx5Q
	Mg6pxZCYDv1nkyn5Fxpj0ogApV/dJNiNHmwN7Ps5zAPrBM0fGK02hQphKhfkxhLHxCS2b5Hm7cmWw
	FwLrWZtn4ecxBnTQAEF8XlKdc70u+wC/I8FZWmJiZUg0oPLqyTDtFDyxWgrewcPsoTwhMWhSeiFKG
	I5XS5U05NYuGsySrgdRb0OtL3TMzZ+jhYq1l31qU+qY63H9R25D+iBhCzzsgp+jwx/Qgd7XdrQr7D
	Ai3RyNk0PniE1lsRXiGqyh3GlblW45j22DNLmasPxkYXpRAL/UFnFTkPcuJpdUHoiSx+6T9Byhc45
	fIN9HuOwkToDRmURegXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPx2-003m7B-2s;
	Tue, 09 May 2023 16:12:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPx0-003m3O-1e
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 16:12:32 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f25d79f6bfso699674e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683648717; x=1686240717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzJaCG/OMHNYElGBgmenbpg63aufpuFPkDUabCgItGk=;
        b=NULj4O+JGNCyV+KeDufbKevReeAkOh7DxA0aRU6bN8QhLySM+6jIo5iqkqaG6aBi28
         ifeMXOg4uMKXZNnl/rABuo8Ka9OtvX8VUtoZ5e8rV6FPmd2iGqcMmgJPnIpjY1CEikA5
         MPoqPJVPvrcmmWPewXY4Agq0vrKIl1/un6jQ1ZEhgrIVKeDD/4MWnfp+Rz39uGh2I4Hi
         HyrnETJGvsMkBvNnaSTjZcNjrv0cn1PkOH7q+GGkwTHJSuyfHBJUV30zwaP7ItAzYuK2
         DD81XoptwZ/zPGbl0K/4UzMelFipgCBVonGCpF33HGPBd+l/zRrNi30Kwyk9Lc4L1rpR
         NJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648717; x=1686240717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzJaCG/OMHNYElGBgmenbpg63aufpuFPkDUabCgItGk=;
        b=WQQCerJ8y3OpEwxAxRWik4xXtPUYC7Uo+ZJ8q/AIpfo4TCq28+zBig2eRAX8cAb2Y+
         JyeD/UqcxpHkAWWAspAxyKEc2T43RH/sDsPur5z2X+2H86s0tsO7U/prYzI1GMYskguM
         qM5Evr0VDo0QAK8CHHgzljaqWmm28lInRSSuGApFG4oyufLoKKSekRBjrpGebDkthdxI
         Os4B0mh85Cp/vvSf1Hhyfwuj2Cpd0x7krkIF02/CweYfHsOCDaRNHJ5eodnk7a2DtGLo
         c/eeCpxnVJvZZLyg3IRSSPNYEW2DqEyPMLmd+hB8QQdku1nGFuXKEQ3nQVmI0EyTej4g
         PQcA==
X-Gm-Message-State: AC+VfDxt8bcTVlc5Ozrsyty477EVLfUvClcctbPdydU33hTcl9fhld4w
	/3RTIfbLvGu0SLeuTLQk4BFISOPlnACnI9bl9gyqgQ==
X-Google-Smtp-Source: ACHHUZ7k+XfWXUIUB2Ybwk1N7tPL7s5PtmEBH8IA+vRwsIaa2j8CzaAvd0SnMu2S+nE+4iNIdWuT/6miQKkzsm1wjs8=
X-Received: by 2002:ac2:5599:0:b0:4eb:d8d:6c13 with SMTP id
 v25-20020ac25599000000b004eb0d8d6c13mr872822lfg.9.1683648716955; Tue, 09 May
 2023 09:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-1-andy.chiu@sifive.com> <20230509103033.11285-21-andy.chiu@sifive.com>
 <2629220.BddDVKsqQX@diego>
In-Reply-To: <2629220.BddDVKsqQX@diego>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 10 May 2023 00:11:45 +0800
Message-ID: <CABgGipXN2vsdEMJFX-e8EgVNvnDr7v6zixyWErfaq31ghWkGRw@mail.gmail.com>
Subject: Re: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace
 vector management
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_091230_597778_82D1C76C 
X-CRM114-Status: GOOD (  24.43  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, atishp@atishpatra.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Joey Gouly <joey.gouly@arm.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, anup@brainfault.org, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Stefan Roesch <shr@devkernel.io>, vineetg@rivosinc.com, Josh Triplett <josh@joshtriplett.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jordy Zomer <jordyzomer@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, Vincent Chen <vincent.chen@sifive.com>, palmer@dabbelt.com, "Eric W. Biederman" <ebiederm@xmission.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCA3OjE04oCvUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4KPiBIaSwKPgo+IG5lZWQgdG8gcG9rZSB0aGlzIG1vcmUsIGJ1dCBv
bmUgaXNzdWUgcG9wcGVkIHVwIGF0IGZpcnN0IGNvbXBpbGUuCj4KPiBBbSBEaWVuc3RhZywgOS4g
TWFpIDIwMjMsIDEyOjMwOjI5IENFU1Qgc2NocmllYiBBbmR5IENoaXU6Cj4gPiBUaGlzIHBhdGNo
IGFkZCB0d28gcmlzY3Ytc3BlY2lmaWMgcHJjdGxzLCB0byBhbGxvdyB1c2VzcGFjZSBjb250cm9s
IHRoZQo+ID4gdXNlIG9mIHZlY3RvciB1bml0Ogo+ID4KPiA+ICAqIFBSX1JJU0NWX1ZfU0VUX0NP
TlRST0w6IGNvbnRyb2wgdGhlIHBlcm1pc3Npb24gdG8gdXNlIFZlY3RvciBhdCBuZXh0LAo+ID4g
ICAgb3IgYWxsIGZvbGxvd2luZyBleGVjdmUgZm9yIGEgdGhyZWFkLiBUdXJuaW5nIG9mZiBhIHRo
cmVhZCdzIFZlY3Rvcgo+ID4gICAgbGl2ZSBpcyBub3QgcG9zc2libGUgc2luY2UgbGlicmFyaWVz
IG1heSBoYXZlIHJlZ2lzdGVyZWQgaWZ1bmMgdGhhdAo+ID4gICAgbWF5IGV4ZWN1dGUgVmVjdG9y
IGluc3RydWN0aW9ucy4KPiA+ICAqIFBSX1JJU0NWX1ZfR0VUX0NPTlRST0w6IGdldCB0aGUgc2Ft
ZSBwZXJtaXNzaW9uIHNldHRpbmcgZm9yIHRoZQo+ID4gICAgY3VycmVudCB0aHJlYWQsIGFuZCB0
aGUgc2V0dGluZyBmb3IgZm9sbG93aW5nIGV4ZWN2ZShzKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEdyZWVu
dGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogVmluY2Vu
dCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPgo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4g
aW5kZXggOTYwYTM0Mzc5OWM2Li4xNmNjYjM1NjI1YTkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMK
PiA+IEBAIC05LDYgKzksNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiA+
ICsjaW5jbHVkZSA8bGludXgvcHJjdGwuaD4KPiA+Cj4gPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRf
aW5mby5oPgo+ID4gICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gPiBAQCAtMTksNiArMjAs
OCBAQAo+ID4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9idWcu
aD4KPiA+Cj4gPiArc3RhdGljIGJvb2wgcmlzY3Zfdl9pbXBsaWNpdF91YWNjID0gIUlTX0VOQUJM
RUQoQ09ORklHX1JJU0NWX1ZfRElTQUJMRSk7Cj4gPiArCj4gPiAgdW5zaWduZWQgbG9uZyByaXNj
dl92X3ZzaXplIF9fcmVhZF9tb3N0bHk7Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwocmlzY3Zfdl92
c2l6ZSk7Cj4gPgo+ID4gQEAgLTkxLDExICs5NCw1MSBAQCBzdGF0aWMgaW50IHJpc2N2X3ZfdGhy
ZWFkX3phbGxvYyh2b2lkKQo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICsjZGVm
aW5lIFZTVEFURV9DVFJMX0dFVF9DVVIoeCkgKCh4KSAmIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxf
Q1VSX01BU0spCj4gPiArI2RlZmluZSBWU1RBVEVfQ1RSTF9HRVRfTkVYVCh4KSAoKCh4KSAmIFBS
X1JJU0NWX1ZfVlNUQVRFX0NUUkxfTkVYVF9NQVNLKSA+PiAyKQo+ID4gKyNkZWZpbmUgVlNUQVRF
X0NUUkxfTUFLRV9ORVhUKHgpICgoKHgpIDw8IDIpICYgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9O
RVhUX01BU0spCj4gPiArI2RlZmluZSBWU1RBVEVfQ1RSTF9HRVRfSU5IRVJJVCh4KSAoISEoKHgp
ICYgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9JTkhFUklUKSkKPiA+ICtzdGF0aWMgaW5saW5lIGlu
dCByaXNjdl92X2dldF9jdXJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPiA+ICt7Cj4g
PiArICAgICByZXR1cm4gVlNUQVRFX0NUUkxfR0VUX0NVUih0c2stPnRocmVhZC52c3RhdGVfY3Ry
bCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IHJpc2N2X3ZfZ2V0X25leHRf
Y3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gVlNU
QVRFX0NUUkxfR0VUX05FWFQodHNrLT50aHJlYWQudnN0YXRlX2N0cmwpOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3Zfdl90ZXN0X2N0cmxfaW5oZXJpdChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRzaykKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gVlNUQVRFX0NUUkxfR0VU
X0lOSEVSSVQodHNrLT50aHJlYWQudnN0YXRlX2N0cmwpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0
aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl9zZXRfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywg
aW50IGN1ciwgaW50IG54dCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIGluaGVyaXQpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBjdHJsOwo+ID4gKwo+
ID4gKyAgICAgY3RybCA9IGN1ciAmIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfQ1VSX01BU0s7Cj4g
PiArICAgICBjdHJsIHw9IFZTVEFURV9DVFJMX01BS0VfTkVYVChueHQpOwo+ID4gKyAgICAgaWYg
KGluaGVyaXQpCj4gPiArICAgICAgICAgICAgIGN0cmwgfD0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RS
TF9JTkhFUklUOwo+ID4gKyAgICAgdHNrLT50aHJlYWQudnN0YXRlX2N0cmwgPSBjdHJsOwo+ID4g
K30KPiA+ICsKPiA+ICtib29sIHJpc2N2X3ZfdXNlcl9hbGxvd2VkKHZvaWQpCj4gPiArewo+ID4g
KyAgICAgcmV0dXJuIHJpc2N2X3ZfZ2V0X2N1cl9jdHJsKGN1cnJlbnQpID09IFBSX1JJU0NWX1Zf
VlNUQVRFX0NUUkxfT047Cj4gPiArfQo+Cj4gRVhQT1JUX1NZTUJPTChyaXNjdl92X3VzZXJfYWxs
b3dlZCk7CgpJdCdzIGEgc2hhbWUuIEtWTSBpcyBhIGJ1aWx0aW4gb24gbXkgdGVzdCBwbGF0Zm9y
bSBzbyBJIG1pc3NlZCB0aGlzCm9idmlvdXMgdGhpbmcuIE9yLCBtYXliZSB3ZSBzaG91bGQgbWFr
ZSB0aGVtIGlubGluZSBmdW5jdGlvbnMgb3IKbWFjcm9zIGF0IHRoZSBoZWFkZXIgZmlsZSBiZWNh
dXNlIG9mIHRoZSBzaXplLiBBbmQgYmVjYXVzZSBvdGhlcgptb2R1bGVzIG1heSByYXJlbHkgdXNl
IHRoZW0uCgo+Cj4ga3ZtIGlzIGFsbG93ZWQgdG8gYmUgYnVpbHQgYXMgbW9kdWxlLCBzbyB5b3Ug
Y291bGQgZW5kIHVwIHdpdGg6Cj4KPiBFUlJPUjogbW9kcG9zdDogInJpc2N2X3ZfdXNlcl9hbGxv
d2VkIiBbYXJjaC9yaXNjdi9rdm0va3ZtLmtvXSB1bmRlZmluZWQhCj4gbWFrZVsyXTogKioqIFsu
Li9zY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTM2OiBNb2R1bGUuc3ltdmVyc10gRmVobGVyIDEK
PiBtYWtlWzFdOiAqKiogWy9ob21lL2RldmVsL2hzdHVlYm5lci8wMF9naXQtcmVwb3MvbGludXgt
cmlzY3YvTWFrZWZpbGU6MTk3ODogbW9kcG9zdF0gRmVobGVyIDIKPiBtYWtlWzFdOiBWZXJ6ZWlj
aG5pcyDigJ4vaG9tZS9kZXZlbC9oc3R1ZWJuZXIvMDBfZ2l0LXJlcG9zL2xpbnV4LXJpc2N2L19i
dWlsZC1yaXNjdjY04oCcIHdpcmQgdmVybGFzc2VuCj4gbWFrZTogKioqIFtNYWtlZmlsZToyMjY6
IF9fc3ViLW1ha2VdIEZlaGxlciAyCj4KPgo+IEhlaWtvCj4KPgo+CgpUaGFua3MsCkFuZHkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
