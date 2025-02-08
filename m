Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858D6C02198
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Feb 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1lMwfzCx4FvwvySCeYtooKR+geLQAScx4scMSG6fRM=; b=zNBJOBwetb/WDf
	c8EeT0BYBVlUgPc7bwB+ls+IH1w+PL6s34ux541a90dy9oRWlVirNqbism3QbwBrFUaLQNvBQkueN
	LyZhCpubW3GGj8l/Cw1jSTt4MjcLYnbR6EVJCfFD9Tm5Ct3u2tuhCL5i4hlnj6MSU28BNsIhqaQGm
	rIRBvlSnBuV8K4UAjxHwZZ2k2plg/+RaTeO65VgcAnzAsKRIzz+fZ0PpisKHP3Ih0OZV3ODVLW/bC
	MOYtG7suoXFXVOLk2ICZG6ApqS+j09uyMh4hmFCEjOFSiWc89BijPUrtjdcJmx9bHpElbtvxNWTs2
	g8EdXxab9Nz4q+JsAIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgfks-0000000CRVW-0v4r;
	Sat, 08 Feb 2025 07:59:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgfkq-0000000CRUv-2fbl
	for linux-riscv@lists.infradead.org;
	Sat, 08 Feb 2025 07:59:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54410d769f7so2792414e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739001594; x=1739606394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTUTp09J3TkHO04+OyZOFWnP6EILcwwOXh/jpiP4ZkI=;
        b=KZUhR71CSX2caJe4nz6qm9z7OYNlmZMXi/cpRTrrBD/iku5sWnXOJ6JcUdawq/MAQy
         NeDdQJ85NgUh++05+/pw769O695QzFDy9a6RxF0/KBCrFQcAxV9IbtVt8vR4XcI3jhzF
         mfStFXImcWOBmxYAlXR1ZbYCe72FhICDA6iSC5KhqpbP9oKg90DJwipFMNATTNW+mkou
         HUkfIr1NIufNHdlKlYmxRzlEXFmC9gHRkdwyxsE6DSSsTltwyDKZRUfLMe8SV7NX34Ks
         A2i8ylRaN6TCKQLUrfCBrEb1k8triwQ8NNbxpMJSVwhdx9zDvoq8RCkVc3W8glZ0Oo5K
         /YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739001594; x=1739606394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTUTp09J3TkHO04+OyZOFWnP6EILcwwOXh/jpiP4ZkI=;
        b=gB26KJ32GyqgEHawZ8NJsIOnU8ZeCp6JiAnigz2CFh9qVEZBwUGbVrOrIOVjPZNMyz
         OQDSMLs6Gaf1hJNbin5cdJ+Km6805wXwCAvOcnGeQprYeDI3xTcCXV2J6QJ01tuh3jm1
         48OH0PwltsjTQD7RO/oPxM437eZS9Ln8rPNjjSG6LM9SSAPCQnp+tVTuaHW5OQavqIbf
         fmhxr1Cn5s+n3z1+fYDGWC5ZxC1i89S2ze7LFQV+qGb80kobTJz7sxkcktRMQp0Va27M
         DP4XCoagz7Op2+EZ3CtHylNrLSOTyPGzCApM/EMliCuPavUDg05YQxHrs8ATWmJxZyEZ
         vv8Q==
X-Gm-Message-State: AOJu0YxlAfS9deaNVtF0+BkJarwjk+JyyUuIVbW2jmGX9TlEdBGt4w2c
	lq4HjKczu3/zTIbzwAaJVDqf5SkKCyGL002xCx/J9oY8UD+2ea595TpEEvthnFTA2Gzo1PGJVVb
	Ncbkm8c6F/VOMsbPgAoHmn+EFqvtsXXZUGUytWg==
X-Gm-Gg: ASbGncsV8qqWfjE8vQaRkQkBSwyviVsgeY8VbGoWxCE55R35KL9TNmCSk1+KtcSTLgi
	+O7nK4S966/kwr5ExbgD0ut01hQTSxXH1vzGAkHDPT+h35Wntfp8jqqhLh4+gZNSne90ZJ+8aGw
	==
X-Google-Smtp-Source: AGHT+IHNBKUgdG3mmVsHbFdl3uVr3Q+JzefEbNXajL5yy04QQ9tefqJ/8k1ddeV63n4noi5xHd5M27eZroWTkogbhas=
X-Received: by 2002:a05:6512:1195:b0:542:6d01:f55c with SMTP id
 2adb3069b0e04-54414a962c4mr2450193e87.3.1739001594018; Fri, 07 Feb 2025
 23:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20250207161939.46139-11-ajones@ventanamicro.com>
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 8 Feb 2025 13:29:42 +0530
X-Gm-Features: AWEUYZl3rnfE8vIlzOiLWPcC_pZ4X13tmZnTiRHW3C1wZw-naFaGo4PPV4QFVxE
Message-ID: <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, 
	jesse@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_235956_677069_40DA802F 
X-CRM114-Status: GOOD (  18.37  )
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

T24gRnJpLCBGZWIgNywgMjAyNSBhdCA5OjQ54oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZmlyc3Qgc2l4IHBhdGNoZXMgb2YgdGhpcyBz
ZXJpZXMgYXJlIGZpeGVzIGFuZCBjbGVhbnVwcyBvZiB0aGUKPiB1bmFsaWduZWQgYWNjZXNzIHNw
ZWVkIHByb2JpbmcgY29kZS4gVGhlIG5leHQgdHdvIHBhdGNoZXMgaW50cm9kdWNlCj4gc3VwcG9y
dCB0byBza2lwIHByb2JpbmcgYnkgbWF0Y2hpbmcgdmVuZG9yL2FyY2gvaW1wIGlkcyBhbmQgY2hl
Y2tpbmcgYQo+IHRhYmxlIGZvciB0aGUgYWNjZXNzIHNwZWVkIHR5cGUuIFRoZSBsYXN0IHBhdGNo
IGFwcGxpZXMgdGhlIG5ldyBza2lwCj4gc3VwcG9ydCB0byBWZW50YW5hIGhhcnRzLgoKQWx0ZXJu
YXRpdmVseSwgd2UgY2FuIGFsc28gc2tpcCBwcm9iaW5nIG1pc2FsaWduZWQgYWNjZXNzIHdoZW4g
WmljY2xzbQpleHRlbnNpb24gaXMgcHJlc2VudCBpbiB0aGUgSVNBIHN0cmluZy4gVGhlIFppY2Ns
c20gZXh0ZW5zaW9uIGlzIGRlZmluZWQKYXMgcGFydCBvZiB0aGUgcmF0aWZpZWQgUlZBMjMgcHJv
ZmlsZS4KClJlZ2FyZHMsCkFudXAKCj4KPiAoSSdkIGJlIGhhcHB5IHRvIHNwbGl0IHRoZSBmaXhl
cyBmcm9tIHRoZSBuZXcgc2tpcCBzdXBwb3J0IGlmIHdlIHdhbnQgdG8KPiBkaXNjdXNzIHRoZSBz
a2lwIHN1cHBvcnQgaW5kZXBlbmRlbnRseSwgYnV0IEkgd2FudCB0byBiYXNlIG9uIHRoZSBmaXhl
cwo+IGFuZCBJJ20gbm90IHN1cmUgaWYgcGF0Y2h3b3JrIHN1cHBvcnRzIEJhc2VkLW9uOiAkTUVT
U0FHRV9JRC8kTE9SRV9VUkwKPiBvciBub3QgYXQgdGhlIG1vbWVudCwgc28gSSdtIGp1c3QgcG9z
dGluZyB0b2dldGhlciBmb3Igbm93IGluIG9yZGVyIHRvCj4gYmUgYWJsZSB0byBjaGVjayBmb3Ig
bXkgcGF0Y2h3b3JrIGdyZWVuIGxpZ2h0cyEpCj4KPiBUaGFua3MsCj4gZHJldwo+Cj4gQW5kcmV3
IEpvbmVzICg5KToKPiAgIHJpc2N2OiBBbm5vdGF0ZSB1bmFsaWduZWQgYWNjZXNzIGluaXQgZnVu
Y3Rpb25zCj4gICByaXNjdjogRml4IHJpc2N2X29ubGluZV9jcHVfdmVjCj4gICByaXNjdjogRml4
IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXMKPiAgIHJpc2N2OiBDaGFuZ2UgY2hlY2tf
dW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1cyB0byB2b2lkCj4gICByaXNjdjogRml4IHNl
dCB1cCBvZiBjcHUgaG90cGx1ZyBjYWxsYmFja3MKPiAgIHJpc2N2OiBGaXggc2V0IHVwIG9mIHZl
Y3RvciBjcHUgaG90cGx1ZyBjYWxsYmFjawo+ICAgcmlzY3Y6IFByZXBhcmUgZm9yIHVuYWxpZ25l
ZCBhY2Nlc3MgdHlwZSB0YWJsZSBsb29rdXBzCj4gICByaXNjdjogSW1wbGVtZW50IGNoZWNrX3Vu
YWxpZ25lZF9hY2Nlc3NfdGFibGUKPiAgIHJpc2N2OiBBZGQgVmVudGFuYSB1bmFsaWduZWQgYWNj
ZXNzIHRhYmxlIGVudHJpZXMKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUu
aCAgICAgICAgfCAgIDQgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JpZF9saXN0
LmggICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jICAg
ICAgIHwgIDE0ICstCj4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
YyB8IDI3OCArKysrKysrKysrKysrKy0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMDAgaW5z
ZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDguMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
