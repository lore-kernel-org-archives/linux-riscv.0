Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE8C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 05:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEp+PSSnGCqk20gTFPfZoj02qU5ohEI8uI5BhIgrzCc=; b=H0H37GpY9ujx5m
	ZupZKnVg1dmnMNKMPkpb5XN1px+3bydfz//5gxszKpXJMTOH2cPNxzOTtgOFnlW4GaHTqjPRGJxls
	Q7RYg8GPLfioacMhElvPR29ymkrmBnfgZo+Y1t8gFq0RLAt16JtPPuTA8tynWMDFVkQs8NK2YD8e9
	HUx4WQpJaTKao67XG+Z5cPARwkiQl/SefYbo1hiDUgskMryPh0w9QtJoqdvqL98IBRyaDkV+TwJJ0
	pc+Ikl12KL9TumnlwvET9dng09kc9DqnbaBtNWC8Xi8pRMGazZYiF7swtaz1iHYTmphOxab/axiwZ
	EvcKMNt1rCIa5FTSIYJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9jO-001tuT-22;
	Fri, 12 Jan 2024 05:05:22 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9jM-001tu4-0F
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 05:05:21 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3606f3f2f37so33756755ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 21:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705035918; x=1705640718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8rappFKRLNOmh48iN1mvyDH+G2PtYqO6EungDZP0OA=;
        b=nphQ23sq3UCpyerVgVxb3VxkIWpYy7OVI6MzLjcoKyQnOFq9NW3KW+pUb1IgoLtysc
         PtKssQy2DaTZk97c86gFZajms04YhmYHO5+9oaKb1y5Arc5/2WeOe/Sb0jU4FcULLMTy
         Gl3wwgdd3kM+aIjvnn+Fw8FH2EGFZzZJ84QJSlI8YiWqfGprvDKcsU7xp7X3neGlKcpw
         rr+VXg1NK3XgggKRalyYOqdmy6S6W7GBvvZzobFZHi05Dv07+arjvNbxmjtXFRCcuisV
         heH7/glirfgT8ZTRLGwwN9E01tjq2wKL+LgBH9abffS3UktU2O4H5ZVAreuop3srzvVj
         e4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705035918; x=1705640718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8rappFKRLNOmh48iN1mvyDH+G2PtYqO6EungDZP0OA=;
        b=L+JpXUTcyLYyOPof0ctmI0V/U00KJVbp3eE/RnAMnNZuhviSCFn7jr3nGCZm7ZhMU7
         QFj/4rWcA3BjMyr2S7IGoNtolGHTYSedhEuaCAZKZU5WICta9rfnAZfXtaGgRv8/bUhk
         d+fnhjapgBTBvilwa0+LN0ZN8sIC8ONaYL5RFwFfWWQRZ4SpPYvgV12Wz0GBTWRIEPIv
         uVavC5MFBWbRJUvjzPwVb480xIDmiZNORMeYxtQF08MW0VtRRihLHnQOC39lyPbFQpFL
         RpGC0LCst6xje6ehk37+ykE+gc9tILC7BMU2n0abG69hjdhVcSTd3E/2c4xJL7eJ5Hsg
         wTiQ==
X-Gm-Message-State: AOJu0YxH/pfBIp5dXzGXE5/2TOyidnGELZqbtPQxjngyukuie5PG+ejP
	4Fqh24Y+EoSUuFgL9YGzYMp4eQM/qKj7JFzYyyy9mCQ1iBVujw==
X-Google-Smtp-Source: AGHT+IGCR28IRbastME/z+5U6vMfxuvFQ4GIlL0eywubg6xedGxnSa839M5nymwISZxw5wbZTYlIBpblsPmMoFP5VFI=
X-Received: by 2002:a05:6e02:20e8:b0:360:a0fc:cbdb with SMTP id
 q8-20020a056e0220e800b00360a0fccbdbmr582188ilv.66.1705035918451; Thu, 11 Jan
 2024 21:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20240111093058.121838-1-sunilvl@ventanamicro.com> <20240111093058.121838-3-sunilvl@ventanamicro.com>
In-Reply-To: <20240111093058.121838-3-sunilvl@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jan 2024 10:35:07 +0530
Message-ID: <CAAhSdy22JrFOS8V-FC=ZCQiybhcJCszxy_TsnGAzuzYA06Mw7Q@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] cpuidle: RISC-V: Add ACPI LPI support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_210520_327899_DF8DCA3A 
X-CRM114-Status: GOOD (  21.20  )
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

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMzowMeKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFkZCByZXF1aXJlZCBjYWxsYmFja3MgdG8gc3VwcG9y
dCBMb3cgUG93ZXIgSWRsZSAoTFBJKSBvbiBBQ1BJIGJhc2VkCj4gUklTQy1WIHBsYXRmb3Jtcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyB8IDc4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgYi9k
cml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IGluZGV4IGU4MDk0ZmM5MjQ5MS4u
Y2VhNjdhNTRhYjM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2
LXNiaS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBAQCAt
NjMyLDMgKzYzMiw4MSBAQCBzdGF0aWMgaW50IF9faW5pdCBzYmlfY3B1aWRsZV9pbml0KHZvaWQp
Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICBkZXZpY2VfaW5pdGNhbGwoc2JpX2NwdWlkbGVf
aW5pdCk7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX0FDUElfUFJPQ0VTU09SX0lETEUKPiArCj4gKyNp
bmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gKyNpbmNsdWRlIDxhY3BpL3Byb2Nlc3Nvci5oPgo+ICsK
PiArI2RlZmluZSBSSVNDVl9GRkhfTFBJX1RZUEVfTUFTSyAgICAgICAgICAgICAgICAweDEwMDAw
MDAwMDAwMDAwMDBVTEwKPiArI2RlZmluZSBSSVNDVl9GRkhfTFBJX1JTVkRfTUFTSyAgICAgICAg
ICAgICAgICAweDBGRkZGRkZGMDAwMDAwMDBVTEwKPiArCj4gK3N0YXRpYyBpbnQgYWNwaV9jcHVf
aW5pdF9pZGxlKHVuc2lnbmVkIGludCBjcHUpCj4gK3sKPiArICAgICAgIGludCBpOwo+ICsgICAg
ICAgc3RydWN0IGFjcGlfbHBpX3N0YXRlICpscGk7Cj4gKyAgICAgICBzdHJ1Y3QgYWNwaV9wcm9j
ZXNzb3IgKnByID0gcGVyX2NwdShwcm9jZXNzb3JzLCBjcHUpOwo+ICsKPiArICAgICAgIGlmICh1
bmxpa2VseSghcHIgfHwgIXByLT5mbGFncy5oYXNfbHBpKSkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFRoZSBTQkkgSFNNIHN1
c3BlbmQgZnVuY3Rpb24gaXMgb25seSBhdmFpbGFibGUgd2hlbjoKPiArICAgICAgICAqIDEpIFNC
SSB2ZXJzaW9uIGlzIDAuMyBvciBoaWdoZXIKPiArICAgICAgICAqIDIpIFNCSSBIU00gZXh0ZW5z
aW9uIGlzIGF2YWlsYWJsZQo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoc2JpX3NwZWNfdmVy
c2lvbiA8IHNiaV9ta192ZXJzaW9uKDAsIDMpIHx8Cj4gKyAgICAgICAgICAgIXNiaV9wcm9iZV9l
eHRlbnNpb24oU0JJX0VYVF9IU00pKSB7Cj4gKyAgICAgICAgICAgICAgIHByX3dhcm4oIkhTTSBz
dXNwZW5kIG5vdCBhdmFpbGFibGVcbiIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAocHItPnBvd2VyLmNvdW50IDw9IDEpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDE7
IGkgPCBwci0+cG93ZXIuY291bnQ7IGkrKykgewo+ICsgICAgICAgICAgICAgICB1MzIgc3RhdGU7
Cj4gKwo+ICsgICAgICAgICAgICAgICBscGkgPSAmcHItPnBvd2VyLmxwaV9zdGF0ZXNbaV07Cj4g
Kwo+ICsgICAgICAgICAgICAgICAvKiBWYWxpZGF0ZSBFbnRyeSBNZXRob2QgYXMgcGVyIEZGSCBz
cGVjLgo+ICsgICAgICAgICAgICAgICAgKiBiaXRzWzYzOjYwXSBzaG91bGQgYmUgMHgxCj4gKyAg
ICAgICAgICAgICAgICAqIGJpdHNbNTk6MzJdIHNob3VsZCBiZSAweDAKPiArICAgICAgICAgICAg
ICAgICogYml0c1szMTowXSByZXByZXNlbnQgYSBTQkkgcG93ZXJfc3RhdGUKPiArICAgICAgICAg
ICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlmICghKGxwaS0+YWRkcmVzcyAmIFJJU0NWX0ZG
SF9MUElfVFlQRV9NQVNLKSB8fAo+ICsgICAgICAgICAgICAgICAgICAgKGxwaS0+YWRkcmVzcyAm
IFJJU0NWX0ZGSF9MUElfUlNWRF9NQVNLKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBy
X3dhcm4oIkludmFsaWQgTFBJIGVudHJ5IG1ldGhvZCAlI2xseFxuIiwgbHBpLT5hZGRyZXNzKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAg
ICAgfQo+ICsKPiArICAgICAgICAgICAgICAgc3RhdGUgPSBscGktPmFkZHJlc3M7Cj4gKyAgICAg
ICAgICAgICAgIGlmICghc2JpX3N1c3BlbmRfc3RhdGVfaXNfdmFsaWQoc3RhdGUpKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiSW52YWxpZCBTQkkgcG93ZXIgc3RhdGUgJSN4
XG4iLCBzdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiAr
fQo+ICsKPiAraW50IGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfcHJvYmUodW5zaWduZWQgaW50IGNw
dSkKPiArewo+ICsgICAgICAgcmV0dXJuIGFjcGlfY3B1X2luaXRfaWRsZShjcHUpOwo+ICt9Cj4g
Kwo+ICtpbnQgYWNwaV9wcm9jZXNzb3JfZmZoX2xwaV9lbnRlcihzdHJ1Y3QgYWNwaV9scGlfc3Rh
dGUgKmxwaSkKPiArewo+ICsgICAgICAgdTMyIHN0YXRlID0gbHBpLT5hZGRyZXNzOwo+ICsKPiAr
ICAgICAgIGlmIChzdGF0ZSAmIFNCSV9IU01fU1VTUF9OT05fUkVUX0JJVCkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIENQVV9QTV9DUFVfSURMRV9FTlRFUl9QQVJBTShzYmlfc3VzcGVuZCwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBscGktPmlu
ZGV4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXRlKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIENQVV9QTV9D
UFVfSURMRV9FTlRFUl9SRVRFTlRJT05fUEFSQU0oc2JpX3N1c3BlbmQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxwaS0+aW5k
ZXgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0YXRlKTsKPiArfQo+ICsKPiArI2VuZGlmCgpMZXRzIGtlZXAgdGhlIGNwdWlk
bGUtcmlzY3Ytc2JpLmMgZHJpdmVyIGZvY3VzZWQgb24gRFQgb25seS4gSW5zdGVhZCwKSSB3b3Vs
ZCBzdWdnZXN0IG1vdmluZyB0aGUgcmVxdWlyZWQgZnVuY3Rpb24gZnJvbSBjcHVpZGxlLXJpc2N2
LXNiaS5jCnRvIGFyY2gvcmlzY3YgYW5kIGhhdmUgYSBzZXBhcmF0ZSBkcml2ZXIgdW5kZXIgZHJp
dmVyL2FjcGkvcmlzY3YgZm9yCkxQSSBzdGF0ZXMuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
