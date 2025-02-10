Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C0C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjHodBSieofanK6VZBsG4Jn8i61VnyMvKQdfoCFZ/ow=; b=1SqUqTZrlX/RUa
	k7IJh+VgnzLgyH49iPMPdh4XAi2/ggdGoFHfshAef9vZeYtrZthcdMTybNB8srx+cl0woMAeZmvJ7
	fKZITNn1CreMXswxxB06GvrcIqHX2rymMsNznah4Bv6/UDnLcHvrDzqaxwL+0GSFrjxQAd/oxV6fM
	q8OUCEGMuR+hBp94esNwAfZvtytaKDqfG+6lpzLGjCI5MdxTt+WWW8+MDFPjoY/Piwj50gaBtMiyv
	64QcPk6ITV6gqAujw/+5AmM5s1LJYGDFiyCnzLr0GO5HhnDE8n3GDUYfcwJMQG+T+F7H0UJCc7bRF
	2cw/pkdq6+AstEfiVn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUSo-000000004eU-2Tnv;
	Mon, 10 Feb 2025 14:08:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUQX-0000000049w-0y5J
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 14:06:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso1832415f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739196380; x=1739801180; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IrKg/+BbMX221XE9ME81BjtPrEG6eZ+0UQKPsDeAQvI=;
        b=h+lHV9xqrZaadchCx5bP2JyVkuaRMdnlV2BfYWkCw+zYeiW7qQNErZM277ElpL++sg
         tv2RLT/hWdKoKkc6HqQv2UYvyQ7jlRJv8jK85bpYeAwdpdHTt649d3gPpBhRS0DsryI4
         5KkAt+qOpyKNzf7Xwljhgicf2YJhn5VXE3Bdn2J8wxNut2PkwkChXErHAN9KkzmN+mhi
         UXUolnj65w8fdwds+PK1SqO8rPzFtr91DNYh92B6NMWwqQChjT01wfBb/mdCDImHkpRG
         R3YbUpReHlE2qM7jxBZXv/anFWCWES9TzJembwpZldnSP7/TNT4ebe03EAgw9tkFT60i
         5Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196380; x=1739801180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IrKg/+BbMX221XE9ME81BjtPrEG6eZ+0UQKPsDeAQvI=;
        b=oWrAkILJeGou7Q9xswmv7rcqM9SlDKGyOnoLh4EfgyYliny/uGHXXYAp8MpEc4YnV6
         nXCnmLQ06xI+4132OnpKez7QTJotkmOpIcaZ2E3ioT9KSYnR4Lv2KZB+jYZjMinByapJ
         pM23MOXpWg8D9F5CHRcVl1YANIGuHWfrtMdxsBPQq0MKrnljBELDpoOyr4j6UVEL8CL1
         Zzgr1wun59EPdG9IrDYZcEduxV1JLtVKcQZflWZ7DRFbtYBlFKhFr0YzD1JoCHOYDoAr
         7kgxca9BsDfcwR/30mrB3JrcN160U6hZ5K7Bwk4t/TszsyB+I+YZ8pemr6tJOQotKFs3
         48NA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Prk+T77nDkzL+sTFHV+1tuKnrZEmaQdVNmXiyHiv8FLDqnqSuOD76cltj5Kr7iUdaHlVsTF8LtRiwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWuW56LqU14rJlsUPeQG9kQLm/dAq2nwI3yw7k8Bk8r7LXnRMY
	7h5i/4e51miQvfu4H/9ZEF5iseuFg1c/W9mxf5IPV3f+h/llRkZbOen88xU8NnE=
X-Gm-Gg: ASbGncua1UuY4G6I9Wh9Odf/WC1hytfS4fDEiG4THfx3gx3q6l8dmjYb2LaG9z0E6w+
	vEtXfXgoxZoPdWxvueuSWldYFJieFsO7s8uviUf1MvyWzdMSn2aI3OHVUEbq3kDnBUdjx8Faezv
	9liG/m8xWEdkeD+JqxmYyk4KQYhhtibD4rwMz1J1EAc2tuXTOI8EMGbCdSlJFOmb8V794BrSbaF
	TukTi55kNIg26w/98A/k7rPpXsXuz9NyqLdi3zJddV8ADuEx+dajnMB3GJeo/2bs1B7QrAAnf9k
	akc=
X-Google-Smtp-Source: AGHT+IH37wNkEhz3Kh3Sg+JvAHzqc4n3gX2HNxkJEROvKoGeOgsvuEujhAparcHpL/6WFVp/9Yf81w==
X-Received: by 2002:a5d:6d0e:0:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-38dc9ba41e1mr8530261f8f.26.1739196379198;
        Mon, 10 Feb 2025 06:06:19 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd511e626sm6694401f8f.74.2025.02.10.06.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:06:18 -0800 (PST)
Date: Mon, 10 Feb 2025 15:06:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250210-e6a2dfcd7995ffc8a6d918e4@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_060621_271202_2EAB1003 
X-CRM114-Status: GOOD (  28.59  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTI6MDc6NDBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDEwLzAyLzIwMjUgMTE6MTYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4g
PiBPbiBTYXQsIEZlYiA4LCAyMDI1IGF0IDY6NTPigK9BTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIEZyaSwgRmViIDA3LCAyMDI1IGF0
IDA1OjE5OjQ3UE0gKzAxMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+Pj4gUHJvYmluZyB1bmFs
aWduZWQgYWNjZXNzZXMgb24gYm9vdCBpcyB0aW1lIGNvbnN1bWluZy4gUHJvdmlkZSBhCj4gPj4+
IGZ1bmN0aW9uIHdoaWNoIHdpbGwgYmUgdXNlZCB0byBsb29rIHVwIHRoZSBhY2Nlc3MgdHlwZSBp
biBhIHRhYmxlCj4gPj4+IGJ5IGlkIHJlZ2lzdGVycy4gVmVuZG9ycyB3aGljaCBwcm92aWRlIHRh
YmxlIGVudHJpZXMgY2FuIHRoZW4gc2tpcAo+ID4+PiB0aGUgcHJvYmluZy4KPiA+Pgo+ID4+IFRo
ZSBhY2Nlc3MgY2hlY2tlciBpbiBteSBleHBlcmllbmNlIGlzIG9ubHkgdGltZSBjb25zdW1pbmcg
b24gc2xvdwo+ID4+IGhhcmR3YXJlLiBIYXJkd2FyZSB0aGF0IHN1cHBvcnRzIGZhc3QgdW5hbGln
bmVkIGFjY2Vzc2VzIGlzbid0IHJlYWxseQo+ID4+IGltcGFjdGVkIGJ5IHRoaXM/IEF2b2lkaW5n
IGEgbGlzdCBvZiBoYXJkd2FyZSB0aGF0IGhhcyBzbG93L2Zhc3QKPiA+PiB1bmFsaWduZWQgYWNj
ZXNzZXMgaW4gdGhlIGtlcm5lbCB3YXMgdGhlIG1haW4gcmVhc29uIGZvciBkeW5hbWljYWxseQo+
ID4+IGNoZWNraW5nLiBXZSBkaWQgaW50cm9kdWNlIHRoZSBjb25maWcgb3B0aW9uIHRvIGNvbXBp
bGUgdGhlIGtlcm5lbCB3aXRoCj4gPj4gYXNzdW1lZCBzbG93L2Zhc3QgYWNjZXNzZXMsIHdoaWNo
IG9mIGNvdXJzZSBoYXMgdGhlIGRvd25zaWRlIG9mCj4gPj4gcmVjb21waWxpbmcgdGhlIGtlcm5l
bCBhbmQgSSBhc3N1bWUgdGhhdCB5b3UgYWxyZWFkeSBjb25zaWRlcmVkIHRoYXQuCj4gPiAKPiA+
IFRoZSBrY29uZmlnIG9wdGlvbiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZSB2aXNpb24gb2YgcnVu
bmluZyB0aGUgc2FtZQo+ID4ga2VybmVsIGltYWdlIGFjcm9zcyBwbGF0Zm9ybXMuCj4gCj4gSSdk
IHdvdWxkIGJlIGFkdm9jYXRpbmcgdG8gcmVtb3ZlIGNvbXBpbGUgdGltZSBvcHRpb25zIGFzIHdl
bGwgYW5kIHVzZQo+IGFub3RoZXIgd2F5IHRvIHNraXAgdGhlIHByb2JlIChzZWUgYmVsb3cpLgo+
IAo+ID4gCj4gPj4KPiA+PiBJbnN0ZWFkIG9mIGhhdmluZyBhIHRhYmxlIGluIHRoZSBrZXJuZWws
IHNvbWV0aGluZyB0aGF0IHdvdWxkIGJlIG1vcmUKPiA+PiBwbGF0Zm9ybSBhZ25vc3RpYyB3b3Vs
ZCBiZSB0byBoYXZlIGFuIGV4dGVuc2lvbiB0aGF0IHNpZ25hbHMgdGhpcwo+ID4+IGluZm9ybWF0
aW9uLiBUaGF0IHNlZW1zIGxpa2UgaXQgd291bGQgYWNjb21wbGlzaCB0aGUgc2FtZSBnb2FsIGFu
ZAo+ID4+IGxldmVyYWdlIHRoZSBleGlzdGluZyBpbmZyYXN0cnVjdHVyZSBpbiB0aGUga2VybmVs
LCBhbGJlaXQgd2l0aCB0aGUgbmVlZAo+ID4+IHRvIG1ha2UgYSBuZXcgZXh0ZW5zaW9uLgo+ID4+
Cj4gPiAKPiA+IElNTywgZXhwZWN0aW5nIGFuIElTQSBleHRlbnNpb24gdG8gYmUgZGVmaW5lZCBm
b3IgYWxsIHBvc3NpYmxlCj4gPiBtaWNyb2FyY2hpdGVjdHVyYWwgY2hvaWNlcyBpcyBub3QgZ29p
bmcgdG8gc2NhbGUgc28gaXQgaXMgYmV0dGVyCj4gPiB0byBoYXZlIGluZnJhc3RydWN0dXJlIGlu
IGtlcm5lbCBpdHNlbGYgdG8gaW5mZXIgbWljcm9hcmNoaXRlY3R1cmFsCj4gPiBjaG9pY2VzIGJh
c2VkIG9uIFJJU0MtViBpbXBsZW1lbnRhdGlvbiBJRC4KPiAKPiBTaW5jZSBhZGRpbmcgYW4gZXh0
ZW5zaW9uIHNlZW1zIHF1aXRlIHVubGlrZWx5LCBhbmQgdGhhdCBhIGRldmljZS10cmVlCj4gcHJv
cGVydHkgaXMgbGlrZWx5IERUIGNlbnRyaWMgYW5kIG5vdCBhcHBsaWNhYmxlIHRvIEFDUEkgYXMg
d2VsbCwgd2FzIGEKPiBjb21tYW5kIGxpbmUgYXJndW1lbnQgY29uc2lkZXJlZCA/Cj4KCkkgZGlk
IGNvbnNpZGVyIGFkZGluZyBhIGNvbW1hbmQgbGluZSBvcHRpb24gaW4gYWRkaXRpb24gdG8gdGhl
IHRhYmxlLAphbGxvd2luZyBwbGF0Zm9ybXMgd2hpY2ggbmVpdGhlciBoYXZlIGEgdGFibGUgZW50
cnkgW3lldF0gbm9yIHdhbnQgdG8gZG8KdGhlIHNwZWVkIHRlc3QsIHRvIHNldCB3aGF0ZXZlciB0
aGV5IGxpa2UuIEluIHRoZSBlbmQsIEkgZHJvcHBlZCBpdCwgc2luY2UKSSBkb24ndCBoYXZlIGEg
dXNlIGNhc2UgYXQgdGhpcyB0aW1lLiBIb3dldmVyLCBpZiB3ZSByZWFsbHkgZG9uJ3Qgd2FudCBh
CnRhYmxlLCB0aGVuIEkgY2FuIGxvb2sgaW50byB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBpbnN0
ZWFkLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
