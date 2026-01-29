Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF60D61015
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sKfp/zkRty4unWackVd3sNcVnmJwmnH/+rEIHBAMgc=; b=iAUErFlSz4Ji72
	sKmI3bKAd7mWdi8euTG8DxtcRFgo1s99uElzdv+DhbKlbkB/J1j/R7/dEMm5zeSwxP9QWNSYK9//w
	cMhoCa+raDBRII4fP8mFKEpaVsHYNeCQvvFVUbIBuelfYon4pTZW9DItEKBR6cyi55jEUxs04HwYL
	1qWcgePthzEfttZ5bgQmMpmpqsWs+U/I40KWeN3/EWJWPkjViAs4Xd9bLg8G6TaVMXcnZhTZzsrBG
	UwCj3QMuEkfCzQNKdDHtCX+31btrANZzCtgbACAwmBZVPFWwhdGDlWxZZdRHxEB+Jc4CUF7TUm51f
	uzQCUMnrBOo0BLrxQ9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSPJ-00000000B1H-1fUP;
	Thu, 29 Jan 2026 13:50:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSPF-00000000Azn-1CDe
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 13:50:00 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so527696b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 05:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1769694595; x=1770299395; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVJS0XZnQdJSuFRyO9cJopaQzPSIm6FDGJq3O2WzR/w=;
        b=N/QacoK4YcEJXUrNfsXcDOR4cYw7z+bV7KZFgbMAaB5daP9vpTBocHPNrlPp785iEJ
         qD08yRNzVHJA5Ysv8JZ+udKkTzacjl8NPuMv1wJsNzEs+Q0e0gEnMQywtUvWi+ICR/4X
         tGjK7MeQnpOvY17jQG1M8ViQFKWEGCfA1sawxLEdX3Oznwsa0vrxLU46PEY5+Ncs9iLL
         DI+UqU/HTGmL2lYFmbyiTCNUToWsZ8A2SAxOIqCd0Da9enkSo2DZXAp79aMpHIa6roed
         fKqiilFWIEoa8v+KRvcPm7Is+UwsZst8dQ/anXdtLgU+9uZc1bzvzIBahadgg+MhKwbw
         tA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769694595; x=1770299395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVJS0XZnQdJSuFRyO9cJopaQzPSIm6FDGJq3O2WzR/w=;
        b=Umn0wkW/njl0LVTzBqguJgRKwD7OngpHzXeaer4+GeHaW7E/Nlx20lJVa3cb1Z1XBM
         YYzQ8jmVEJIed1jgjrRRnFM72yS8Bpvd5ODxk1z0yj/scyOdatcjsa4H092Vl5w/TtlD
         zDRL1HeqxyDsFbWNC8xDe1+b1swF3OisR8a1EO62DI5az4V9jIdnSlGsREavtdpp/h4E
         GQfR4A02b2QXyOu3Alj+E+2DS8C45BA7uorRdveDuutHigwnFdn0a1glmWj4QITFYoC2
         xIkbgRKDKpu6+fv36AnXgb1BagOyocwklOMsqdHuB8k5CXQVboBB6uaemkxegFP22moQ
         vYig==
X-Forwarded-Encrypted: i=1; AJvYcCXgk9FCDCFJATpc7HlILcY83N1JcZm9zZS77/c3REDJEvxmuJ6yBX/CcOSWobO7j2aIXqQtMGCuzNr16g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnnXu47ubIlumHqYeqwUwLav1n+b7lzSqSCrI/eUKDoWiGCEZy
	tK8jDT/ePzBGyxYJruS2JZRxQlu6+1r8OIbz7tP8CQsAEfXbpuMBb1xXfjWJb/PYyVo=
X-Gm-Gg: AZuq6aJGJR/ZPwKFGx+R2/9SscAHhWI717EM49oIArRsYxX9byaQafhS73C5g+xpezS
	sV18mjVe6Mfxf+r7qhV+Sr91DTI0GlKawvuWkfBJyjOd8Bhfi0tG69PIGjfrDNkIafrsKW8h/XE
	zFJyz+Xi1Ei49DtG41kbI8SOOzT890LZRZpgEgg4WAb4wbN/r2KY5GscqrH7VBwWXJ2LvAu36jI
	bH0S0Sp2etyFs/WHibonfN3NcPlxwxAvTM0XYeOrmRxqPvKwU3nxZZEUlFsb7e0veVMFGcmhyGv
	fhJdJurQ8fhH9EOajZHHuSeBKl68L5DPBlpT0p4M5Lz4kNPjN6NzXttx9846Cdm2GAw9YauBCuX
	M0IGGyxpsJuxEpZ6LerP66Eyf/U0NHsW+rYt1vQ/sKy8OLuOBFwv1LBHMTh7HUWowZa74QvitCo
	gLHFynPfa7pAtJmKkc4w==
X-Received: by 2002:a05:6a00:2e2a:b0:800:8fdf:1a54 with SMTP id d2e1a72fcca58-82369275931mr8476106b3a.34.1769694595607;
        Thu, 29 Jan 2026 05:49:55 -0800 (PST)
Received: from sunil-laptop ([106.51.192.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfcaadsm6072882b3a.37.2026.01.29.05.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:49:54 -0800 (PST)
Date: Thu, 29 Jan 2026 19:19:43 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, huyuye <huyuye812@163.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Robert Moore <robert.moore@intel.com>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn, guo.chang2@zte.com.cn,
	liu.qingtao2@zte.com.cn, wu.jiabao@zte.com.cn,
	lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn, zuo.jiang@zte.com.cn,
	li.kunpeng@zte.com.cn, Sunil V L <sunilvl@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
Message-ID: <aXtld38sQ9qFoNKk@sunil-laptop>
References: <CAJZ5v0iZukqD0atbdfBnmZAxUzNB6sTcJ1YUeAo5a8NRn-emEg@mail.gmail.com>
 <20260127194648.GA368841@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127194648.GA368841@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_054957_352093_C3BB960F 
X-CRM114-Status: GOOD (  22.20  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDE6NDY6NDhQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwNjo1MDoyNFBNICswMTAwLCBSYWZhZWwg
Si4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDY6MjbigK9QTSBC
am9ybiBIZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEph
biAyNywgMjAyNiBhdCAwNDowMDo0OVBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToK
PiA+ID4gPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAzOjE34oCvUE0gaHV5dXllIDxodXl1eWU4
MTJAMTYzLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgpbLi4uXQoKPiA+IE5vdCByZWFsbHkuCj4gPiAK
PiA+IGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygpIGlzIHJlbGF0ZWQgdG8gdGhlIHdheSBM
aW51eCB1c2VzIF9ERVAKPiA+IHdoaWNoIGlzIHRvIGRlZmVyIHRoZSBlbnVtZXJhdGlvbiBvZiBk
ZXBlbmRlbnQgZGV2aWNlcyB1bnRpbCB0aGUKPiA+IGRldmljZXMgdGhleSBkZXBlbmQgb24gYXJl
IHJlYWR5Lgo+ID4gCj4gPiBTbyBieSBjYWxsaW5nIGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2ll
cygpIHRoZSBkcml2ZXIgYmFzaWNhbGx5Cj4gPiBhbGxvd3Mgb3RoZXIgZHJpdmVycyB0byBiaW5k
IHRvIGRldmljZXMuCj4gCj4gSSBhc3N1bWVkIHRoZSBkZXBlbmRlbmN5IGV4cHJlc3NlZCBieSBf
REVQIHdvdWxkIGJlIHNhdGlzZmllZCBieSB0aGUKPiBleGVjdXRpb24gb2Ygc29tZSBvdGhlciBB
Q1BJIG1ldGhvZC4gIEUuZy4sIHRoZSBkZXBlbmRlbmN5IG1pZ2h0IGJlCj4gc2F0aXNmaWVkIHdo
ZW4gYSBfUkVHIG1ldGhvZCBtYWtlcyBhbiBvcHJlZ2lvbiBhdmFpbGFibGUgKGFsdGhvdWdoIHRo
ZQo+IHNwZWMgc2VlbXMgdG8gc3VnZ2VzdCB0aGF0J3Mgb25seSBvbmUgb2YgdGhlIHBvc3NpYmxl
IGRlcGVuZGVuY2llcykuCj4gCj4gQnV0IGluIHRoaXMgY2FzZSBpdCBzb3VuZHMgbGlrZSBSSVND
LVYgaXMgdXNpbmcgX0RFUCBub3QgYmVjYXVzZSBvZgo+IGFueSBBQ1BJLXJlbGF0ZWQgb3JkZXJp
bmcgcmVxdWlyZW1lbnQsIGJ1dCBzaW1wbHkgdG8gZW5mb3JjZSB0aGUgT1MKPiBlbnVtZXJhdGlv
biBvcmRlciAoYW5kIHRoZXJlZm9yZSBuYW1pbmcpLiAgSSBndWVzcyB0aGlzIHJlZmVycyB0byBQ
Q0kKPiBkZXZpY2UgbmFtaW5nLCBzbyBJIHN1cHBvc2UgdGhhdCBkZXBlbmRlbmN5IGlzIG9uCj4g
cGNpX2FjcGlfc2Nhbl9yb290KCkuCj4gClJpZ2h0LiBEZXZpY2VzIHRoYXQgdXNlIHdpcmVkIGlu
dGVycnVwdHMgKG9yIEdTSXMpIGRlcGVuZCBvbiB0aGUgQVBMSUMKaW50ZXJydXB0IGNvbnRyb2xs
ZXIgYmVpbmcgcHJvYmVkIGZpcnN0LiBBQ1BJIHVzZXMgdGhlIF9ERVAgbWVjaGFuaXNtIHRvCmVu
Zm9yY2UgdGhpcyBwcm9iZSBvcmRlci4gSG93ZXZlciwgd2hlbiBtdWx0aXBsZSBkZXBlbmRlbnQg
UENJIGJyaWRnZXMKYXJlIHByZXNlbnQgaW4gdGhlIHN5c3RlbSwgdGhlcmUgaXMgbm8gZ3VhcmFu
dGVlIHRoYXQgdGhleSB3aWxsIGJlCnByb2JlZCBpbiB0aGUgc2FtZSBvcmRlciBvbiBldmVyeSBy
ZWJvb3QuIFRoaXMgcGF0Y2ggYWRkcmVzc2VzIHRoZSBpc3N1ZQpieSBhZGRpbmcgX0RFUCByZWxh
dGlvbnNoaXBzIGJldHdlZW4gdGhlIFBDSSBicmlkZ2Ugbm9kZXMgaW4gdGhlCnBsYXRmb3JtLCBl
bnN1cmluZyB0aGF0IHRoZXkgYXJlIGFsd2F5cyBwcm9iZWQgaW4gYSBkZXRlcm1pbmlzdGljCm9y
ZGVyLgoKPiBJIHRob3VnaHQgdWRldiB3YXMgc3VwcG9zZWQgdG8gYmUgdGhlIHJlYWwgc29sdXRp
b24gZm9yIGNvbnNpc3RlbnQKPiBuYW1pbmcuICBJcyB0aGlzIHNvcnQgb2YgYSB3b3JrYXJvdW5k
IHRvIGFjY29tcGxpc2ggdGhlIHNhbWUgZW5kPwo+ClllcywgTWFyYyBoYWQgc3VnZ2VzdGVkIHRo
aXMgYXMgd2VsbCwgYnV0IGl0IGxvb2tzIGxpa2UgaXTigJlzIG5vdCBlYXN5IHRvCnVzZSBpbiB0
aGlzIGVudmlyb25tZW50IFsxXS4KCj4gSW4gYW55IGNhc2UsIHlvdXIgSVNfRU5BQkxFRChDT05G
SUdfUklTQ1YpIHByb3Bvc2FsIHNlZW1zIGZpbmUgdG8gbWUuCj4gSSB0aGluayBpdCdzIG5pY2Ug
aWYgd2UgY2FuIGF2b2lkIGFkZGluZyBhbm90aGVyIF9fd2VhayBmdW5jdGlvbi4KPiAKSSBhZ3Jl
ZS4gQnV0IEkgYW0gbm90IHN1cmUgaWYgQVJNIGFsc28gY2FuIGdldCBpbnRvIHRoaXMgc2l0dWF0
aW9uIHdpdGgKR0lDdjUuIEFkZGluZyBMb3JlbnpvLgoKWzFdIC0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyNTExMjYxNjE1NDAuNjQ2MC0xLW5pX2xpcWlhbmdAMTI2LmNv
bS8KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
