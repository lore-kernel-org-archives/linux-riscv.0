Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD04EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eEYdgXmZ+uwNl3lt+F8aDVQnvuIR16JDxqwRamv5oo=; b=yd5I0TFfGTco6o
	1fusDmn0H8vzQqWqNfENlZsz7tgOgKQ0Po5a7jpqjZALojuewfe/WolOYGUAh5uKNVF7s89H/RRTK
	IBy2LthrhTsZFEJOPuJTYZwH8CfQ5RIGlMmMFsZa8euXnpwlHnLofuh3PbvsyBDf07dBFsOuv1s4k
	Zr/7fqm2iort4j0aOePhvK+xrz/Nspp8Eh/sVkxtUpamrCsf/6EwC9JwKReoZtLU3d+Q5x6rs13iN
	5cT1y3Xe5QPrdIjNZqyAFNZiITRp3vpW3Dc3lIZMNo4vf4NMyjZnvkOAz2eM4dZPzj8N2Sd1lsuYF
	Hd6Rcg5aBk2w6IeF+yjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJEd-00Aa4r-2n;
	Mon, 03 Jul 2023 13:04:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJEb-00Aa43-1t
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:04:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc244d386so46638065e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688389492; x=1690981492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d6ih/kmwpjX+tH1Xu9YvN1lziwh3aCHo89EB9XkjqU=;
        b=RN6y0gy31NmpuKelrbC/HzNL00R0snetDTfDwY1NkrB1uDrkwdBiyYeFBGnwwNtRZp
         dtucuAkLDSvD/PdAfaeDTuT42i3tPpXFwJe0u+mD8f3E5mBbasbh3FFi3J1DkgmrzYzY
         UwV5lbmTyFELEuoYeVjuZzxJajX2wCwmjr76jeody1tPpDT/pfUvL0o2tlAflzBqniSA
         +gLa0Tx9s4FBhu0c/UrbUtEP5/G7KqW8oCdCgTkF1s7MrxhJYlzf+nVqu1lPBEqoLm/e
         AlIDv85bhTaTOyEs608kDyFGxGcqL/h5/X07iOm4XT2Tc1zWr0x5FqkUJFe/T03WQfj+
         M+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389492; x=1690981492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3d6ih/kmwpjX+tH1Xu9YvN1lziwh3aCHo89EB9XkjqU=;
        b=R1Zv4TnJr9O2E6cCzb7V9ZLLKq/zF6XiurIiTAhKEwghwZWeDNGutRcFHaXxYI8m5V
         aPETsrGGOry1F+yiNb0LAAJrFWbTdlpdCbxP3Pajp6XZIu/Y5vqsHy1euA77MiSWpXyi
         cWe6Yot016cBH93lyog9yNT49yBn0RWSAg8M6FRed8CNuz7/F+A6e+X98LOGo7S1Uc+8
         QtIgQZkzQtAcLzFe3CHsuDODMd/FaHQDgRP4slVwJvdA2pwoYQXGGWTeogcV7YbWWyLH
         Xk37E65PQJvwUZhx+wZARKcT1XD+V+XaUqLb8U+pqWbMASX+70+BtPerv6sSWd5k+jkj
         IRmA==
X-Gm-Message-State: AC+VfDyk6WaCbz9ZR/PMuXBQY69l/hMG9ol0iIoCySu0lnxwyJ1rNWic
	qZo/AD3ufdbLRXZOAnkuknmyYy1wpfNWuaRQYGdUlQ==
X-Google-Smtp-Source: ACHHUZ6t2qo8tIjShnZO9/FXBBpcQJeQTs/al+vYFLGivJfJj8gprGTPoGGfvUDO7fZ5igBLzHW1X8xoFUJPhsmtHAk=
X-Received: by 2002:a05:600c:3792:b0:3fb:c417:5e6 with SMTP id
 o18-20020a05600c379200b003fbc41705e6mr7953949wmr.23.1688389491911; Mon, 03
 Jul 2023 06:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230702-headway-dreamlike-d7ba39ac4910@spud>
 <CAEEQ3wnzf=iDDHJATo2vdVz-SDNYRGBEEb7sXUyGojgP4ZAgaA@mail.gmail.com>
 <20230703-glorified-headless-16e998608eaa@wendy> <CAEEQ3wnjYK+Jj9Ce_yEHPL_z3eYn4OKP85YLXnVeaPd+SA3DJw@mail.gmail.com>
 <20230703-handstand-prototype-733d702c946c@wendy>
In-Reply-To: <20230703-handstand-prototype-733d702c946c@wendy>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Mon, 3 Jul 2023 21:04:40 +0800
Message-ID: <CAEEQ3wkmX6N2b8fftixJ2Ev-DOc_VfbxQM9g66OpVLuL8mVZbA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_060453_637297_F74CF209 
X-CRM114-Status: GOOD (  25.72  )
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
Cc: mark.rutland@arm.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, lpieralisi@kernel.org, jdelvare@suse.com, linux-riscv@lists.infradead.org, ardb@kernel.org, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, paul.walmsley@sifive.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, rminnich@gmail.com, palmer@dabbelt.com, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3IsCgpPbiBNb24sIEp1bCAzLCAyMDIzIGF0IDg6MjDigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDAzLCAy
MDIzIGF0IDA2OjE2OjA3UE0gKzA4MDAsIOi/kOi+ieW0lCB3cm90ZToKPiA+IEhpIENvbm9yLAo+
Cj4gPiBUaGlzIG5lZWRzIHRvIGJlIGNvbmZpcm1lZCB3aXRoIHlvdToKPgo+ID4gQ29udGludWUg
dG8gZm9sbG93IHRoZSBjdXJyZW50IGNvZGUgc3RydWN0dXJlLCBwYXRjaCAxLzMgaXMgcGxhY2Vk
IGluCj4gPiBhcmNoL3Jpc2N2LywgYW5kIDIvMyBpcyBwbGFjZWQgdW5kZXIgZHJpdmVyL2Zpcm13
YXJlPwo+Cj4gWW91IGRvIHdhbnQgdGhlIFNNQklPUyBzdHVmZiB0byBiZSBjcm9zcyBhcmNoaXRl
Y3R1cmUsIHJpZ2h0Pwo+IElmIHNvLCBrZWVwaW5nIHRoZSBjb2RlIGFzLWlzIHNlZW1zIHRvIG1h
a2UgdGhlIG1vc3Qgc2Vuc2UgdG8gbWUuCgpPa2F5LCBvdGhlciBhcmNoZXMgbWF5IHVzZSBGRkkg
aW4gdGhlIGZ1dHVyZS4gS2VlcCB0aGUgY29kZSBhcy1pcyBzZWVtcy4KCj4gPiBIb3cgYWJvdXQg
Y2hhbmdpbmcgdGhlIGNvbW1pdCBsb2cgdG8gdGhlIGZvbGxvd2luZz8KPiA+Cj4gPiByaXNjdjog
b2J0YWluIEFDUEkgUlNEUCBmcm9tIGRldmljZXRyZWUuCj4gPgo+ID4gT24gUklTQy1WLCB3aGVu
IHVzaW5nIENvcmVib290IHRvIHN0YXJ0LCBzaW5jZSBDb3JlYm9vdCBvbmx5IHN1cHBvcnRzCj4g
PiBEVFMgYnV0IG5vdCBFRkksIGFuZAo+ID4gUklTQy1WIGRvZXMgbm90IGhhdmUgYSByZXNlcnZl
ZCBhZGRyZXNzIHNlZ21lbnQuCj4gPiBXaGVuIHRoZSBzeXN0ZW0gZW5hYmxlcyBBQ1BJLCBBQ1BJ
IFJTRFAgbmVlZHMgdG8gYmUgcGFzc2VkIHRocm91Z2ggRFRTCj4KPiBJIHdvdWxkIHByb2JhYmx5
IHdyaXRlIHNvbWV0aGluZyBsaWtlOgo+ICAgICAgICAgT24gUklTQy1WLCBDb3JlYm9vdCBkb2Vz
IG5vdCBzdXBwb3J0IGJvb3RpbmcgdXNpbmcgRUZJLCBvbmx5IGRldmljZXRyZWUKPiAgICAgICAg
IG5vciBkb2VzIFJJU0MtViBoYXZlIGEgcmVzZXJ2ZWQgYWRkcmVzcyBzZWdtZW50Lgo+ICAgICAg
ICAgVG8gYWxsb3cgdXNpbmcgQ29yZWJvb3Qgb24gcGxhdGZvcm1zIHRoYXQgcmVxdWlyZSBBQ1BJ
LCB0aGUgQUNQSSBSU0RQCj4gICAgICAgICBuZWVkcyB0byBiZSBwYXNzZWQgdG8gc3VwZXJ2aXNv
ciBtb2RlIHNvZnR3YXJlIHVzaW5nIGRldmljZXRyZWUuCj4gICAgICAgICBBZGQgc3VwcG9ydCBm
b3IgcGFyc2luZyB0aGUgImNvbmZpZ3RibHMiIGRldmljZXRyZWUgbm9kZSB0byBmaW5kIHRoZQo+
ICAgICAgICAgQUNQSSBlbnRyeSBwb2ludCBhbmQgdXNlIHdpcmUgdXAgYWNwaV9hcmNoX2dldF9y
b290X3BvaW50ZXIoKS4KPiAgICAgICAgIFRoaXMgZmVhdHVyZSBpcyBrbm93biBhcyBGRFQgRmly
bXdhcmUgSW50ZXJmYWNlIChGRkkpLgoKR3JlYXQsICBJIGhhdmUgdG8gbGVhcm4gZnJvbSBpdC4K
Cj4gPiA+ID4gPiA+ICtleHRlcm4gdTY0IGFjcGlfcnNkcDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAv
c3R1ZmYvbGludXgvZHJpdmVycy9hY3BpL29zbC5jOjE3ODoyMjogZXJyb3I6IHJlZGVmaW5pdGlv
biBvZiAnYWNwaV9yc2RwJyB3aXRoIGEgZGlmZmVyZW50IHR5cGU6ICd1bnNpZ25lZCBsb25nJyB2
cyAndTY0JyAoYWthICd1bnNpZ25lZCBsb25nIGxvbmcnKQo+ID4gPiA+ID4KPiA+ID4gPiA+IEZh
aWxzIHRvIGJ1aWxkIHdoZW4gS2V4ZWMgaXMgZW5hYmxlZC4KPiA+ID4gPgo+ID4gPiA+IFJlbmFt
ZSBteSBhY3BpX3JzZHAgdG8gYXJjaF9hY3BpX3JzZHA/IFdEWVQ/Cj4gPiA+Cj4gPiA+IFlvdSBj
b3VsZCBkbyBzL2FyY2gvcmlzY3YvIGVpdGhlciwgdGhhdCdkIG1hdGNoIHdoYXQgd2UgcHJlZml4
IGEgbG90IG9mCj4gPiA+IHN0dWZmIHdpdGguCj4gPgo+ID4gIFNvcnJ5LCBJIGRvbid0IHF1aXRl
IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gQ291bGQgeW91IHRlbGwgbWUgaW4gZGV0YWlsPwo+
Cj4gV2hhdCBJIG1lYW50IGlzIHRoYXQgdmFyaWFibGVzICYgZnVuY3Rpb25zIGluIC9hcmNoL3Jp
c2N2IGFyZSBvZnRlbgo+IHByZWZpeGVkIHdpdGggcmlzY3ZfLiBJIHdhcyBzYXlpbmcgdGhhdCB5
b3UgY291bGQgY2hhbmdlICJhcmNoX2FjcGlfcnNkcCIKPiB0byAicmlzY3ZfYWNwaV9yc2RwIi4K
Ck9oLCB0aGF0J3Mgd2hhdCBpdCBtZWFucywgb2theSwgSSdsbCB1cGRhdGUgaXQgb24gdjMuCgo+
Cj4gVGhhbmtzLAo+IENvbm9yLgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
