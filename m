Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165CAC27C78
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKuTSW7gPevUq0rBw3qCaMCCZz4MkqUIzGILgdkIvOw=; b=MIqP5c4gJ6Q8rM
	3il56ISENnv28m6l45JIsGTmGR7ywnwBzNLHos3BuRHXbsSvlUXkCJdgsA6OT/louk1hrCMSrxJqU
	0aZk9niPF5AjHTdaqq9FxOWiUNH5v/ZcvHVCkNORV2MsBpGLfujRdGrK0qofRB1iZUKhseEmyUMNX
	Ift64UEThbJ0ncF8vY9wRwJi/wm2viHMyjIMkcvdcNPrKWM/lOZhyjeGHLek7/2qfhjfOkdvzOwBU
	n9ga87OEIcfp+iJLDtAuW79woZq/OanXN8Kzz4eW0iM5RnEZM4N/QHLQo1NJkNwWRYXPZ4myRhBx5
	gVtHoS18bLaYxbhuIxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnpF-0000000HRys-0Tk0;
	Thu, 13 Jun 2024 17:01:25 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnpB-0000000HRxB-1Hxa
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:01:22 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7eb85e80661so49209839f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718298080; x=1718902880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXgRk1tU//tFI0/4EBA3Dtf7/hVOKmlMTOUM0+rp8Mc=;
        b=Bapb/ib3ahcDAi1hcbu5XT96RuHUz38hpsie8izof2VCrhtnsbdhos5lLH3w/BiLPT
         q1oBgGUmm/JlM4SggVmgozWb3qO2u1m3GtqDuCs/eDeHHq1tP7nNv8uXNVK84m2XLf7U
         bzfp1tHZtmUuUalVMpQ5jH655+VMs1sd+plwveykwxUZ7VfRM6TPmsoCmP8Ew+6CXpzP
         rgCiltJLdnlGQm25qRHdqxtRGmO+wvh4PkNluQm7BPefaYDFlMVIkOVk0Eg8JOHQy2Xn
         hjIwTO9d0uHHfW5jLfijRS3/rsTImmEruUo1E8wY/YIH7yleN9La2HfaJgL53aO0X04I
         mPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298080; x=1718902880;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXgRk1tU//tFI0/4EBA3Dtf7/hVOKmlMTOUM0+rp8Mc=;
        b=geiuDp49ikMm2SiGS5MNCqpsRxrkOG+A/FE3FEVFm6a2cISjvCWTu4kP6JGbsCBfly
         1mJEI1DiQHoGDkWcMWdilqUPsXoD8HA9Pxr4NNkaCJx29EA6m2Nqjz7rI2GUw88nSK0Z
         k0nSUjSeoOhjX7NR2Hau0QJS5Ou9F1sT0fKPOY94liPK1Xo5ZGn8MKM4eVDFVzrddnjd
         McnnxIz3L8CatDmph5Jj0b0XAS5aVoPmleuDEHQPaXrtLGAudmzipBHC6sYep2VPj5ci
         ctIHoP7nJO+iq4RW7P+z69E2hj2RH89jGhFTsLqKAbfou8WI03HltyC335dN0hZ+A0j+
         Wrng==
X-Gm-Message-State: AOJu0YxU9fGMWGLhYkAczvPefskpCt4KMdLo45OE7H/tto+MMw5biGC4
	0m7flzpvqw/SKet0vsRfCP7qFHalgjIAEkzkQAhxkReWtmAHKN3bd9v38iFo0zU=
X-Google-Smtp-Source: AGHT+IG5tU0xWTgcG9SKUXHYg/s/bHtvZgR61ZCm0hnc0Gjrp6KBhXa5jceqwo/n9HtldwaweEX36A==
X-Received: by 2002:a05:6602:13c6:b0:7eb:81d6:c929 with SMTP id ca18e2360f4ac-7ebeb49936fmr9110339f.1.1718298079597;
        Thu, 13 Jun 2024 10:01:19 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ebdba37b01sm38068739f.12.2024.06.13.10.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:01:19 -0700 (PDT)
Message-ID: <75ade6bc-ce34-4a2c-9768-2754830caf5c@sifive.com>
Date: Thu, 13 Jun 2024 12:01:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] riscv: Per-thread envcfg CSR support
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20240605205658.184399-1-samuel.holland@sifive.com>
 <ZmODR+EMn5zW2Iu1@debug.ba.rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <ZmODR+EMn5zW2Iu1@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_100121_382443_908CA6D0 
X-CRM114-Status: GOOD (  16.84  )
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

SGkgRGVlcGFrLAoKT24gMjAyNC0wNi0wNyA1OjAxIFBNLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4g
SGkgU2FtdWVsLAo+IAo+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGVzZS4KPiBQYXRjaGVzIGxv
b2tzIGdvb2QgdG8gbWUuIEkndmUgZ2l2ZW4gc29tZSBzdWdnZXN0aW9uIGZvciBwYXRjaCBvcmdh
bml6YXRpb24KPiBhbmQgc3F1YXNoaW5nLiBZb3UgY2FuIHRha2UgaXQgb3IgbGVhdmUgaXQuCgpU
aGFua3MgZm9yIHRoZSByZXZpZXchIEknZCBsaWtlIHRvIGtlZXAgdGhlIHBhdGNoZXMgc2VwYXJh
dGUgc28gaXQgaXMgY2xlYXIKd2hpY2ggcGFydCBpcyB0aGUgYmVoYXZpb3IgY2hhbmdlIChwYXRj
aCAxKSwgYW5kIHdoaWNoIHBhcnQgaXMgdGhlIG5ldwpmdW5jdGlvbmFsaXR5IChwYXRjaCAyKS4K
ClJlZ2FyZHMsClNhbXVlbAoKPiBPdGhlciB0aGFuIHRoYXQuCj4gCj4gUmV2aWV3ZWQtQnk6IERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IAo+IE9uIFdlZCwgSnVuIDA1LCAyMDI0
IGF0IDAxOjU2OjQ0UE0gLTA3MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBUaGlzIHNlcmll
cyAob3IgZXF1aXZhbGVudCkgaXMgYSBwcmVyZXF1aXNpdGUgZm9yIGJvdGggdXNlci1tb2RlIHBv
aW50ZXIKPj4gbWFza2luZyBhbmQgQ0ZJIHN1cHBvcnQsIGFzIHRob3NlIGFyZSBwZXItdGhyZWFk
IGZlYXR1cmVzIGFyZSBjb250cm9sbGVkCj4+IGJ5IGZpZWxkcyBpbiB0aGUgZW52Y2ZnIENTUi4g
VGhlc2UgcGF0Y2hlcyBhcmUgYmFzZWQgb24gdjEgb2YgdGhlCj4+IHBvaW50ZXIgbWFza2luZyBz
ZXJpZXNbMV0sIHdpdGggc2lnbmlmaWNhbnQgaW5wdXQgZnJvbSBib3RoIERlZXBhayBhbmQKPj4g
QW5kcmV3LiBCeSBzZW5kaW5nIHRoaXMgYXMgYSBzZXBhcmF0ZSBzZXJpZXMsIGhvcGVmdWxseSB3
ZSBjYW4gY29udmVyZ2UKPj4gb24gYSBzaW5nbGUgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBmdW5j
dGlvbmFsaXR5Lgo+Pgo+PiBbMV06Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2LzIwMjQwMzE5MjE1OTE1LjgzMjEyNy02LXNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20vCj4+
Cj4+Cj4+IFNhbXVlbCBIb2xsYW5kICgzKToKPj4gwqByaXNjdjogRW5hYmxlIGNiby56ZXJvIG9u
bHkgd2hlbiBhbGwgaGFydHMgc3VwcG9ydCBaaWNib3oKPj4gwqByaXNjdjogQWRkIHN1cHBvcnQg
Zm9yIHBlci10aHJlYWQgZW52Y2ZnIENTUiB2YWx1ZXMKPj4gwqByaXNjdjogQ2FsbCByaXNjdl91
c2VyX2lzYV9lbmFibGUoKSBvbmx5IG9uIHRoZSBib290IGhhcnQKPj4KPj4gYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggfMKgIDIgKy0KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaMKgIHzCoCAxICsKPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hf
dG8uaMKgIHzCoCA4ICsrKysrKysrCj4+IGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuY8Kg
wqDCoMKgwqAgfCAxMyArKysrKysrKystLS0tCj4+IGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3Qu
Y8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0KPj4gYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5j
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCj4+IDYgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gLS3CoAo+PiAyLjQ0LjEKPj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
