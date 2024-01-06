Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E374AC47077
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jan 2024 03:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYfS6LMsYbZXdbumJ1p1xo0i9R6ZQh0HdXz3Q3DWBVY=; b=TzDGKGhM2v+euj
	n7+RmMzCS0Mhb31JR40CtP+mUk0xd/bo3Qso6spTzpp5V/NlEkRaK5H/pa0jgDXnJRc9/GCCc6+8V
	ZV782FaBLvYW4qolffwVuWgJhs4I8ZaT+TKw0xsIVndo8EnRHpletTbh5VVt3d1dON7zPimU+A5IK
	Lpkoy1JuCFE305msWoukAH4HBzD/nYJrKI90q5Y3En6f0hbmWozuO4A8i4mMYaM6I7J334nOUQlAS
	zp7pZh2rvDmNUo3sidIxuZOY8NsjjiO6bDNq+fhFTzCrRhePFTlSLxVw7o8Zf8sWP8lEDguFINPVc
	jaf2C0UvShtyql3O4KAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLxk7-000hQz-0f;
	Sat, 06 Jan 2024 03:53:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLxk3-000hQJ-2U
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jan 2024 03:53:01 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-59502aa878aso128403eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jan 2024 19:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704513178; x=1705117978; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X2aOIl4UNnpRK6RyeoDnHpQHzACVL3QRju2SnuNTBm0=;
        b=own5nzUKd+HwQRW6kTUYve+V70NSwyRMelEBmovoEb+sAtdMP7h7ToxmcJ5eyi5qxB
         yk0e1wlEFRuqBEa0/cxlte8FZo3dbMAyIjmgYnh1CUvsCbfAJUnC9cchWXXBSxdpYWXJ
         Wj8fsyIb0FWDvcsBr4d/yZ/bmCvqNr4YZR0LkXau6EiUhBeSjnNT8RGsMpWyIzMyrQD+
         9vCkZUTgHR2yt1xWjW4TCd0El+Lj1oU/m+EGcFLTSXxH8MIVG0w591Ivtb1clW3Wsp1G
         7b5VFdHraXkXkXVyUQ6wM2410gIskcuMZMdV5kYeSj9SXHZzmMgODai/+tDgwnLcPrd2
         GlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704513178; x=1705117978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2aOIl4UNnpRK6RyeoDnHpQHzACVL3QRju2SnuNTBm0=;
        b=E3YbjcJPKDX/5ymaiH89qPH+hRFRglXo+mkaPpB3Ba8YwaqxJ6oZ9se3a6XzaAs4ve
         ClU6E2nGHbpbh7DDBYs/qCXJO+pHIyA9T3l6vBxRf8U8ITv9iwxUrm3XLemoqRvYtLLa
         pfkvBYLTIiQhJwFg3+gf78qfyXscfdR8sGohb+uIAK6pWvHoFuhHEYA/eOSpMKoZ8rd8
         opqu/uCJoOM3DVJ3bZdwR+k/aexpiPXedsKFb5BZf+C6LFhI+Q3mNCPvXIjeNGzF3wgD
         Ovgb0HcQAb/Xk4ejmadAh7aEPUVjkny/+GyKU2z1GTY1Bu/0G+H27yhpu/+e1RAedVI5
         WX5Q==
X-Gm-Message-State: AOJu0Yxz6k7ypGJ++HkiFHLdQLQPkAkSgDcB/U96WVvmXuZUtF/junfM
	DCYs2btNvGsuxsq1UkxW1OuQ029jmkr9UA==
X-Google-Smtp-Source: AGHT+IFZdiX5/Chz2pb3J2lpmWZK0wj7liYYlV3sycKkqbhQFnl4yRMsyYKAzwdDC9bujM3U8Qb0KA==
X-Received: by 2002:a05:6358:4406:b0:172:e3d3:4906 with SMTP id z6-20020a056358440600b00172e3d34906mr489239rwc.34.1704513178245;
        Fri, 05 Jan 2024 19:52:58 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:73c:7a5f:bc03:fe77])
        by smtp.gmail.com with ESMTPSA id mv2-20020a17090b198200b0028c361b5c7csm2079193pjb.23.2024.01.05.19.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 19:52:57 -0800 (PST)
Date: Fri, 5 Jan 2024 19:52:55 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Message-ID: <ZZjOl1zDhUYbzpF9@ghost>
References: <20231213-fencei-v3-0-b75158238eb7@rivosinc.com>
 <20231213-fencei-v3-2-b75158238eb7@rivosinc.com>
 <CAOnJCULhAMmz22bH6A5AXv7aaJpH8SVGBATQyx-bfKAn4eFxsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULhAMmz22bH6A5AXv7aaJpH8SVGBATQyx-bfKAn4eFxsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_195259_811753_363DA9E9 
X-CRM114-Status: GOOD (  41.41  )
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

T24gRnJpLCBKYW4gMDUsIDIwMjQgYXQgMDY6NTI6MTJQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMjo0OOKAr1BNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFByb3ZpZGUgZG9jdW1lbnRhdGlv
biB0aGF0IGV4cGxhaW5zIGhvdyB0byBwcm9wZXJseSBkbyBDTU9EWCBpbiByaXNjdi4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdCB8IDk4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2luZGV4LnJzdCB8ICAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4
LnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjIwZjMyN2Q4NTExNgo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdAo+ID4g
QEAgLTAsMCArMSw5OCBAQAo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4gPiArCj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiArQ29uY3VycmVudCBNb2RpZmlj
YXRpb24gYW5kIEV4ZWN1dGlvbiBvZiBJbnN0cnVjdGlvbnMgKENNT0RYKSBmb3IgUklTQy1WIExp
bnV4Cj4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiArCj4gPiArQ01PRFggaXMgYSBwcm9n
cmFtbWluZyB0ZWNobmlxdWUgd2hlcmUgYSBwcm9ncmFtIGV4ZWN1dGVzIGluc3RydWN0aW9ucyB0
aGF0IHdlcmUKPiA+ICttb2RpZmllZCBieSB0aGUgcHJvZ3JhbSBpdHNlbGYuIEluc3RydWN0aW9u
IHN0b3JhZ2UgYW5kIHRoZSBpbnN0cnVjdGlvbiBjYWNoZQo+ID4gKyhpY2FjaGUpIGlzIG5vdCBn
dWFyYW50ZWVkIHRvIGJlIHN5bmNocm9uaXplZCBvbiBSSVNDLVYgaGFyZHdhcmUuIFRoZXJlZm9y
ZSwgdGhlCj4gPiArcHJvZ3JhbSBtdXN0IGVuZm9yY2UgaXRzIG93biBzeW5jaG9uaXphdGlvbiB3
aXRoIHRoZSB1bnByaXZpbGVnZWQgZmVuY2UuaS8KPiAKPiAvcy9zeW5jaG9uaXphdGlvbi9zeW5j
aHJvbml6YXRpb24KPiAKPiA+ICtpbnN0cnVjdGlvbi4KPiA+ICsKPiA+ICtIb3dldmVyLCB0aGUg
ZGVmYXVsdCBMaW51eCBBQkkgcHJvaGliaXRzIHRoZSB1c2Ugb2YgZmVuY2UuaSBpbiB1c2Vyc3Bh
Y2UKPiA+ICthcHBsaWNhdGlvbnMuIEF0IGFueSBwb2ludCB0aGUgc2NoZWR1bGVyIG1heSBtaWdy
YXRlIGEgdGFzayBvbnRvIGEgbmV3IGhhcnQuIElmCj4gPiArbWlncmF0aW9uIG9jY3VycyBhZnRl
ciB0aGUgdXNlcnNwYWNlIHN5bmNocm9uaXplZCB0aGUgaWNhY2hlIGFuZCBpbnN0cnVjdGlvbgo+
ID4gK3N0b3JhZ2Ugd2l0aCBmZW5jZS5pLCB0aGUgaWNhY2hlIHdpbGwgbm8gbG9uZ2VyIGJlIGNs
ZWFuLiBUaGlzIGlzIGR1ZSB0byB0aGUKPiA+ICtiZWhhdmlvciBvZiBmZW5jZS5pIG9ubHkgYWZm
ZWN0aW5nIHRoZSBoYXJ0IHRoYXQgaXQgaXMgY2FsbGVkIG9uLiBUaHVzLCB0aGUgaGFydAo+ID4g
K3RoYXQgdGhlIHRhc2sgaGFzIGJlZW4gbWlncmF0ZWQgdG8sIG1heSBub3QgaGF2ZSBzeW5jaHJv
bml6ZWQgaW5zdHJ1Y3Rpb24KPiA+ICtzdG9yYWdlIGFuZCBpY2FjaGUuCj4gPiArCj4gPiArVGhl
cmUgYXJlIHR3byB3YXlzIHRvIHNvbHZlIHRoaXMgcHJvYmxlbTogdXNlIHRoZSByaXNjdl9mbHVz
aF9pY2FjaGUoKSBzeXNjYWxsLAo+ID4gK29yIHVzZSB0aGUgYGBQUl9SSVNDVl9TRVRfSUNBQ0hF
X0ZMVVNIX0NUWGBgIHByY3RsKCkuIFRoZSBzeXNjYWxsIHNob3VsZCBiZSB1c2VkCj4gPiArd2hl
biB0aGUgYXBwbGljYXRpb24gdmVyeSByYXJlbHkgbmVlZHMgdG8gZmx1c2ggdGhlIGljYWNoZS4g
SWYgdGhlIGljYWNoZSB3aWxsCj4gCj4gVGhlIHN5c2NhbGwgaXMgYSBvbmUgdGltZSBvcGVyYXRp
b24gd2hpbGUgcHJjdGwgaXMgc3RpY2t5Lgo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHdlIGNhbiBh
ZGQgYSBsaXR0bGUgbW9yZSBjb250ZXh0IHdoeSB0aGUgc3lzY2FsbAo+IGJlaGF2ZXMgdGhpcyB3
YXkgY29tcGFyZWQgdG8gcHJjdGwuCgpJIGNhbiBoaWdobGlnaHQgdGhlIHBvaW50IHRoYXQgdGhl
IHByY3RsIGlzIHN0aWNreSBhbmQgdGhlIHN5c2NhbGwgaXMKbm90LgoKQXMgZm9yICJ3aHkiLCB0
aGV5IHNpbXBseSBmaWxsIGRpZmZlcmVudCByb2xlcy4gSXQgaXMgdXNlZnVsIHRvIGhhdmUKYm90
aCBhIHN0aWNreSBhbmQgYSBub24tc3RpY2t5IG9wdGlvbi4gSSBjaG9zZSB0aGUgc3RpY2t5IG9w
ZXJhdGlvbiB0bwpiZSBhIHByY3RsIHJhdGhlciB0aGFuIGEgZ2VuZXJpYyBzeXNjYWxsIGJlY2F1
c2UgdGhlIHNlbWFudGljcyBvZiBwcmN0bAppcyB0aGF0IHRoZXkgb3BlcmF0ZSBvbiBwcm9jZXNz
IG9yIHRocmVhZCBzY29wZWQgYmVoYXZpb3Igd2hpY2ggaXMgd2hhdAp3YXMgbmVlZGVkLgoKLSBD
aGFybGllCgo+IAo+ID4gK25lZWQgdG8gYmUgZmx1c2hlZCBtYW55IHRpbWVzIGluIHRoZSBsaWZl
dGltZSBvZiB0aGUgYXBwbGljYXRpb24sIHRoZSBwcmN0bAo+ID4gK3Nob3VsZCBiZSB1c2VkLgo+
ID4gKwo+ID4gK1RoZSBwcmN0bCBpbmZvcm1zIHRoZSBrZXJuZWwgdGhhdCBpdCBtdXN0IGVtaXQg
c3luY2hyb25pemluZyBpbnN0cnVjdGlvbnMgdXBvbgo+ID4gK3Rhc2sgbWlncmF0aW9uLiBUaGUg
cHJvZ3JhbSBpdHNlbGYgbXVzdCBlbWl0IHN5bmNob25pemluZyBpbnN0cnVjdGlvbnMgd2hlbgo+
IAo+IC9zL3N5bmNob25pemluZy9zeW5jaHJvbml6aW5nCj4gCj4gPiArbmVjZXNzYXJ5IGFzIHdl
bGwuCj4gPiArCj4gPiArMS4gIHByY3RsKCkgSW50ZXJmYWNlCj4gPiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gPiArCj4gPiArQmVmb3JlIHRoZSBwcm9ncmFtIGVtaXRzIHRoZWlyIGZpcnN0IGlj
YWNoZSBmbHVzaGluZyBpbnN0cnVjdGlvbiwgdGhlIHByb2dyYW0KPiA+ICttdXN0IGNhbGwgdGhp
cyBwcmN0bCgpLgo+ID4gKwo+ID4gKyogcHJjdGwoUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9D
VFgsIHVuc2lnbmVkIGxvbmcgY3R4LCB1bnNpZ25lZCBsb25nIHBlcl90aHJlYWQpCj4gPiArCj4g
PiArICAgICAgIFNldHMgdGhlIGljYWNoZSBmbHVzaGluZyBjb250ZXh0LiBJZiBwZXJfdGhyZWFk
IGlzIDAsIGNvbnRleHQgd2lsbCBiZQo+ID4gKyAgICAgICBhcHBsaWVkIHBlciBwcm9jZXNzLCBv
dGhlcndpc2UgaWYgcGVyX3RocmVhZCBpcyAxIGNvbnRleHQgd2lsbCBiZQo+ID4gKyAgICAgICBw
ZXItdGhyZWFkLiBBbnkgb3RoZXIgbnVtYmVyIHdpbGwgaGF2ZSB1bmRlZmluZWQgYmVoYXZpb3Iu
Cj4gPiArCj4gPiArICAgICAgICogOmM6bWFjcm86YFBSX1JJU0NWX0NUWF9TV19GRU5DRUlgOiBB
bGxvdyBmZW5jZS5pIHRvIGJlIGNhbGxlZCBpbgo+ID4gKyAgICAgICAgIHVzZXJzcGFjZS4KPiA+
ICsKPiA+ICtFeGFtcGxlIHVzYWdlOgo+ID4gKwo+ID4gK1RoZSBmb2xsb3dpbmcgZmlsZXMgYXJl
IG1lYW50IHRvIGJlIGNvbXBpbGVkIGFuZCBsaW5rZWQgd2l0aCBlYWNoIG90aGVyLiBUaGUKPiA+
ICttb2RpZnlfaW5zdHJ1Y3Rpb24oKSBmdW5jdGlvbiByZXBsYWNlcyBhbiBhZGQgd2l0aCAwIHdp
dGggYW4gYWRkIHdpdGggb25lLAo+ID4gK2NhdXNpbmcgdGhlIGluc3RydWN0aW9uIHNlcXVlbmNl
IGluIGdldF92YWx1ZSgpIHRvIGNoYW5nZSBmcm9tIHJldHVybmluZyBhIHplcm8KPiA+ICt0byBy
ZXR1cm5pbmcgYSBvbmUuCj4gPiArCj4gPiArY21vZHguYzo6Cj4gPiArCj4gPiArICAgICAgICNp
bmNsdWRlIDxzdGRpby5oPgo+ID4gKyAgICAgICAjaW5jbHVkZSA8c3lzL3ByY3RsLmg+Cj4gPiAr
Cj4gPiArICAgICAgIGV4dGVybiBpbnQgZ2V0X3ZhbHVlKCk7Cj4gPiArICAgICAgIGV4dGVybiB2
b2lkIG1vZGlmeV9pbnN0cnVjdGlvbigpOwo+ID4gKwo+ID4gKyAgICAgICBpbnQgbWFpbigpCj4g
PiArICAgICAgIHsKPiA+ICsgICAgICAgICAgICAgICBpbnQgdmFsdWUgPSBnZXRfdmFsdWUoKTsK
PiA+ICsgICAgICAgICAgICAgICBwcmludGYoIlZhbHVlIGJlZm9yZSBjbW9keDogJWRcbiIsIHZh
bHVlKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAvLyBDYWxsIHByY3RsIGJlZm9yZSBmaXJz
dCBmZW5jZS5pIGlzIGNhbGxlZCBpbnNpZGUgbW9kaWZ5X2luc3RydWN0aW9uCj4gPiArICAgICAg
ICAgICAgICAgcHJjdGwoUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFgsIFBSX1JJU0NWX0NU
WF9TV19GRU5DRUksIDApOwo+ID4gKyAgICAgICAgICAgICAgIG1vZGlmeV9pbnN0cnVjdGlvbigp
Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIHZhbHVlID0gZ2V0X3ZhbHVlKCk7Cj4gPiArICAg
ICAgICAgICAgICAgcHJpbnRmKCJWYWx1ZSBhZnRlciBjbW9keDogJWRcbiIsIHZhbHVlKTsKPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gK2Ntb2R4
LlM6Ogo+ID4gKwo+ID4gKyAgICAgICAub3B0aW9uIG5vcnZjCj4gPiArCj4gPiArICAgICAgIC50
ZXh0Cj4gPiArICAgICAgIC5nbG9iYWwgbW9kaWZ5X2luc3RydWN0aW9uCj4gPiArICAgICAgIG1v
ZGlmeV9pbnN0cnVjdGlvbjoKPiA+ICsgICAgICAgbHcgYTAsIG5ld19pbnNuCj4gPiArICAgICAg
IGx1aSBhNSwlaGkob2xkX2luc24pCj4gPiArICAgICAgIHN3ICBhMCwlbG8ob2xkX2luc24pKGE1
KQo+ID4gKyAgICAgICBmZW5jZS5pCj4gPiArICAgICAgIHJldAo+ID4gKwo+ID4gKyAgICAgICAu
c2VjdGlvbiBtb2RpZmlhYmxlLCAiYXd4Igo+ID4gKyAgICAgICAuZ2xvYmFsIGdldF92YWx1ZQo+
ID4gKyAgICAgICBnZXRfdmFsdWU6Cj4gPiArICAgICAgIGxpIGEwLCAwCj4gPiArICAgICAgIG9s
ZF9pbnNuOgo+ID4gKyAgICAgICBhZGRpIGEwLCBhMCwgMAo+ID4gKyAgICAgICByZXQKPiA+ICsK
PiA+ICsgICAgICAgLmRhdGEKPiA+ICsgICAgICAgbmV3X2luc246Cj4gPiArICAgICAgIGFkZGkg
YTAsIGEwLCAxCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4
LnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QKPiA+IGluZGV4IDRkYWIw
Y2I0YjkwMC4uZWVjZjM0N2NlODQ5IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2luZGV4LnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4
LnJzdAo+ID4gQEAgLTEzLDYgKzEzLDcgQEAgUklTQy1WIGFyY2hpdGVjdHVyZQo+ID4gICAgICBw
YXRjaC1hY2NlcHRhbmNlCj4gPiAgICAgIHVhYmkKPiA+ICAgICAgdmVjdG9yCj4gPiArICAgIGNt
b2R4Cj4gPgo+ID4gICAgICBmZWF0dXJlcwo+ID4KPiA+Cj4gPiAtLQo+ID4gMi40My4wCj4gPgo+
ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKPiAKPiAKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IEF0aXNoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
