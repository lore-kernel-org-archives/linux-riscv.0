Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0B5CA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIQtJofHqg1wG55Xvhn0e+7QJBsHFjgT3owEGN3UgTE=; b=ZE9L86qy8bUo1M
	vMMf0WoP8nOM2Qi3JeQNgHdEJxoGmKnyjh2txiNSgPG8GRoHFX4xIO8oKv5gmkrMnjuROqxzgJatv
	di90BWz+KRUnZVYBE4aArTYgWKv4QtoYu82HuzFITgZBg9GXYt6WxA6Z8+VMc1QEMWyWX0SDjXFQN
	keVxJbDA3xl+VpQkJvQ6+LMdNKz3T8EaFUY5CDEp9gKvXm7Bger/U2k3+RQ360IFT1Czmuuei/2M0
	vGtb/TOXTP6dkY+SiMEE0q5TXAnYKegdjIj/Icwc+SwYgvr1eZMU0THIZo7PMV03ue64Qq+DorINW
	mXR4DrFEm9BNSJ/01YKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoD3E-00000009Gd6-11mK;
	Tue, 19 Aug 2025 03:30:20 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoD3C-00000009GcT-08Hj
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 03:30:19 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-33418dde187so17336971fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 20:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755574216; x=1756179016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhVUQhRbFoSi2h18eEQkGPOra/e5Kyo+DwjDJYlDYA8=;
        b=CjQtmhW2a+yWTSitQszulSPHUXkDVs/uSgvYHBcY7/uRi70g6/juGe+6jtvWdWe94Q
         JziTcH91l9PR+/MotDnEscUb/zjd6sLcJ+1NRimysN7BzyJPV1G9UXqqjmGj6+ACVXCv
         Yewc3/V/Lb/XE+vmZ1F0w9RQT+PSTWKMgIk2tQpkBp6apyxRzFE7q1nQ3fcbqXNpg8Xd
         92tkQJP1apk9adKcCv3349iyDLCcAHy0ROOYUtAbBc5FZq21WpfHNDeyB9Q2yddtA6m8
         WI12LdJXQKanBt28zLuo97x/4dmuIb9GrMHpZqMZdN0C/9ZvH4gk4ggrf0vPPTs/ajcO
         n1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755574216; x=1756179016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhVUQhRbFoSi2h18eEQkGPOra/e5Kyo+DwjDJYlDYA8=;
        b=nCVNnDpvm0kHpFT1qT3Qs7yWTEeFUtTm0bHBqyaxdaqKXGpsO6uI5mt9jZ1RWUEH5w
         IDEh0wqO/8QUEaS8UGf8fQdaAp+qwQY+7rcGkZVihcSUytNcIvIRcU0l3W6wjKkIXUxb
         GvxZudYHC8+V7sPee+6+LtRvtH362p6lNGwUU1MPf8Ft7LF6XkQb4rJh62bLPeTc0UOP
         hoz8YYh10u5YqHcY+/kg3vtnAK7OmgJUgFBVCqUEIumw4iebannXggNSJzYFSz1t2GhW
         mE1P96MtvU5ri3OrFMSFeJXj5tH8OKpTHMv76x0aJRNol5LTu7HE9CCtriCLFXwAFm2w
         Tn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiPEVXcGIPzcXb0oxYM7DJ0Gw3VFBud35LrTu6X17t7ITyV3znAd5uZ6SLgt+BODCwUyWe4OFSRHVpzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnsrHb+Hq4Qi2zAgMldR5E9Di/SpoNBKZcHROzmqEg7RMhkpK7
	sbGGq0Il19wKW2QEj4qigk98Oow4n3GMZ8LPWQrp+Q6qkL/z/Td7tvrjL6/oHHecyQLR05I5MID
	liZ96r7XMAuxDkQ7cwyxfo/Qte3be2a3P4vCTIKRV0w==
X-Gm-Gg: ASbGncsBiG4+PJgV09avyBEPlPVHxSBPBon4QCCc1IXssFt3FbmuOYc92yW7NKe2+gy
	GU5ZjYrkqHIg7S8822O0DBGRMbQCl0/StI6RKWV6QbldmOk7nsmAuOIfyMGKu1eCuPfRk4sp9WB
	Skw3eFjFNfEHh+L6dquf7Op4EZZ4zqq3Ab1QvSMnIYkXpzUGPA3bOlw//noOLIbCk08ULF8th4r
	r5YfYoiXaaCjRvMIg==
X-Google-Smtp-Source: AGHT+IGVnqZwPZZ7hgdjw/Q7u1vNN+1/ztdFP7S/ua4HnZs+KOgdIAGptOekgKLMoLxA7IyVYjoIfKDqA+WjmTJ71Ns=
X-Received: by 2002:a2e:a99a:0:b0:332:362c:c775 with SMTP id
 38308e7fff4ca-3353026d3edmr2279561fa.0.1755574216021; Mon, 18 Aug 2025
 20:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-3-apatel@ventanamicro.com> <aKPu2g1MOZBBzQbV@pie>
In-Reply-To: <aKPu2g1MOZBBzQbV@pie>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Aug 2025 09:00:03 +0530
X-Gm-Features: Ac12FXzDuQ7Umqrf04wpGpc5VzWEYp9wpAAjguHv23M1BEzrlXyzJmRKwCFKs3o
Message-ID: <CAK9=C2XmDGOz9_euC4vtchOxr+8f+m+9zZYVewCc2s7GZhd4Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203018_077264_D7E6BB35 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgODo1NuKAr0FNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5v
cmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMDg6MDY6MDBQTSArMDUzMCwg
QW51cCBQYXRlbCB3cm90ZToKPiA+IEluIFJJU0MtViwgdGhlcmUgaXMgbm8gQ1NSIHJlYWQvd3Jp
dGUgaW5zdHJ1Y3Rpb24gd2hpY2ggdGFrZXMgQ1NSCj4gPiBudW1iZXIgdmlhIHJlZ2lzdGVyIHNv
IGFkZCBjb21tb24gY3NyX3JlYWRfbnVtKCkgYW5kIGNzcl93cml0ZV9udW0oKQo+ID4gZnVuY3Rp
b25zIHdoaWNoIGFsbG93IGFjY2Vzc2luZyBjZXJ0YWluIENTUnMgYnkgcGFzc2luZyBDU1IgbnVt
YmVyCj4gPiBhcyBwYXJhbWV0ZXIuIFRoZXNlIGNvbW1vbiBmdW5jdGlvbnMgd2lsbCBiZSBmaXJz
dCB1c2VkIGJ5IHRoZQo+ID4gQUNQSSBDUFBDIGRyaXZlciBhbmQgUklTQy1WIFBNVSBkcml2ZXIu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+
Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgICAzICsKPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgIHwgICAxICsKPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9jc3IuYyAgICAgIHwgMTY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
PiAgZHJpdmVycy9hY3BpL3Jpc2N2L2NwcGMuYyAgICB8ICAxNyArKy0tCj4gPiAgZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdS5jICAgICB8ICA1NCArKy0tLS0tLS0tLS0KPiA+ICA1IGZpbGVzIGNoYW5n
ZWQsIDE4NCBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvY3NyLmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+
IGluZGV4IDZmZWQ0MmUzNzcwNS4uMTU0MDYyNmIzNTQwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
c3IuaAo+ID4gQEAgLTU3NSw2ICs1NzUsOSBAQAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgfSkKPiA+Cj4gPiAr
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgY3NyX3JlYWRfbnVtKHVuc2lnbmVkIGxvbmcgY3NyX251bSwg
aW50ICpvdXRfZXJyKTsKPiA+ICtleHRlcm4gdm9pZCBjc3Jfd3JpdGVfbnVtKHVuc2lnbmVkIGxv
bmcgY3NyX251bSwgdW5zaWduZWQgbG9uZyB2YWwsIGludCAqb3V0X2Vycik7Cj4KPiBJIHRoaW5r
IGl0J3MgbW9yZSBjb25zaXN0ZW50IHRvIGRpcmVjdGx5IHJldHVybiB0aGUgZXJyb3IgY29kZSwg
YW5kIGZvcgo+IGNzcl9yZWFkX251bSwgd2UgY291bGQgcGFzcyBvdXQgdGhlIHJlYWQgdmFsdWUg
YnkgYSBwb2ludGVyLiBlLmcuCj4KPiAgICAgICAgIGludCBjc3JfcmVhZF9udW0odW5zaWduZWQg
bG9uZyBjc3JfbnVtLCB1bnNpZ25lZCBsb25nICp2YWwpOwo+ICAgICAgICAgaW50IGNzcl93cml0
ZV9udW0odW5zaWduZWQgbG9uZyBjc3JfbnVtLCB1bnNpZ25lZCBsb25nIHZhbCk7Cj4KPiBUaGlz
IGFsbG93cyB0aGUgY2FsbGVyIHRvIGVsaW1pbmF0ZSBhIHZhcmlhYmxlIGZvciB0ZW1wb3Jhcmls
eSBzdG9yaW5nCj4gdGhlIGVycm9yIGNvZGUgaWYgdGhleSB1c2UgaXQganVzdCBhZnRlciB0aGUg
aW52b2thdGlvbiwgYW5kIGZpdHMgdGhlCj4gY29tbW9uIGNvbnZlbnRpb24gb2YgTGludXggYmV0
dGVyLgoKRHJldyBoYWQgc2ltaWxhciBjb21tZW50cyBzbyBzZWUgbXkgcmVzcG9uc2UgaW4gdGhl
IHByZXZpb3VzCnBhdGNoIHJldmlzaW9uLiAoUmVmZXIsIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0
L2xpc3RzL2tlcm5lbC9tc2c1ODA4MTEzLmh0bWwpCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
