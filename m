Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4202BC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D2A61263
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D2A61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XjbUMNjbQRt/EXq7Kc0oc8LHN96BbuFN4ahewNpvVr4=; b=SukhVNgA5ReDWnYhQUI76Kns0a
	FLdkQv8PRLJ29wH5zZbJ41SXVJDwxI6DGT8kGhoLSV2FoRAD+/usOExdFQxX2GC9pXliYTazqKqfD
	GONMNqLOrBmKjfhtefTUxY9fvT3a+fnhdcEqYxfQkAkuod15iu6VkU6dEidK2bgiBp98yHbfZFBDS
	rxlhmGC/fFy9dgyBVQh3Sd/vLjDsxUHfwL/X3Fp/4YW9h1upYv31cYaSaNsJi4pMk9xezwh9+Yyww
	Z9KO184+npfhl8EDjTo6ko2/kMihqAMmrK+Heew3Bb8AmGT9wEuk11odYchjzJr00weUYu1qL37g/
	mTACEOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lruzu-007lqt-75; Sat, 12 Jun 2021 04:11:50 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lruzq-007lq4-RM
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 04:11:48 +0000
Received: by mail-pf1-f171.google.com with SMTP id y15so6049543pfl.4
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 21:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9zYa8J6wQxJeEDNOAWQ9y3FpPL8Sz/tefgUpUGTN/xo=;
 b=02VVvA/Uq/gcMCjjjY8Um81Aq6ED5rfna/eCzXCA2I8yk42zo3L++MppEv/YXKqtf5
 5B3hX0UR2rDdpIeinTYhS3rouE9r4trXrFQPt5J+pyKVRziJValPsY3RTUfwyJE0nH4M
 NSxxORdDCkQJ5eVOxg8P8xwMBm6bbBXbJEQkAEciT4uq7QrEXg0IbswtOqRr2Rvs+WV7
 aoN6LxKqRSaRgHjQVC4Le+PuaY1LVWCAzqI3lPGpRxa8bfzczhx0N8gshUVa/qivKTK/
 F+prgbKvi1ZVvVIajKXXzVtDe/vowzuS7+Sqmvbhlt2TzlF6LUbDBVGnyOSSVsHqk9Iq
 SzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9zYa8J6wQxJeEDNOAWQ9y3FpPL8Sz/tefgUpUGTN/xo=;
 b=AEmxpgGIWALuwITypA6wP9rjXyECPD+VmotqxmliLK/bi6Bm+WtXijmSF0X/ofHCjF
 IyspQMtvL1vqrEY0I18eM8E7jn78E4ndT7jp0cONuedhJ8ePywP9s+6cgh18jOy5z8dl
 r70uKUb2ps7BSC4CLG5wTQp+Oejv3V2h4YfGm0FMIea2v3ga5yaPpU0UIed+uidwPTOw
 9nlAzAyloQkRfLAi2aKAD/5k6At/RFPIpYlpLLROUWEkLj3iQQPKsQfS9QoA2Jm18TN/
 8GDIkqyDR5A84HPytC2gHCp/51KbPL4kGgfsPJnvbY7jef7SofVvzXwEhlsoxlj3fkb0
 s2Hw==
X-Gm-Message-State: AOAM533pvE39IHo7VOXDTgG0Fz1EU6XUIsjX1xXBverfBbvj9xXbpS9z
 sQsXXB7QLCYj5M3qU+XWLhxknA==
X-Google-Smtp-Source: ABdhPJx1BXBhU/6LoUmveppHdpAeCJ8GHfGuluUDmcFaIgIddgExNbLjp/IPBh1MZXEaYbM0pnM9JQ==
X-Received: by 2002:a63:e507:: with SMTP id r7mr2444072pgh.435.1623471045980; 
 Fri, 11 Jun 2021 21:10:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n23sm6601743pgv.76.2021.06.11.21.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 21:10:45 -0700 (PDT)
Date: Fri, 11 Jun 2021 21:10:45 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 21:06:57 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
In-Reply-To: <5d3a00d1-9e45-398a-39cf-1e6e9924eb18@ghiti.fr>
CC: Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-10244c1f-e77f-4b81-80ef-1b6d1a73c095@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_211146_907132_3D926C1E 
X-CRM114-Status: GOOD (  19.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwNiBKdW4gMjAyMSAwMDo0MDozNCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSA1LzA2LzIwMjEgw6AgMTM6MDAsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoK
Pj4gT24gU2F0LCBKdW4gNSwgMjAyMSBhdCA4OjM3IEFNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGku
ZnI+IHdyb3RlOgo+Pj4gTGUgNC8wNi8yMDIxIMOgIDE1OjA4LCBBcm5kIEJlcmdtYW5uIGEgw6lj
cml0IDoKPj4+PiBPbiBGcmksIEp1biA0LCAyMDIxIGF0IDI6MDYgUE0gQWxleGFuZHJlIEdoaXRp
IDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+Pj4KPj4+Pj4gRml4IEJVSUxUSU5fRFRCIGNvbmZp
ZyB3aGljaCByZXN1bHRlZCBpbiBhIGR0YiB0aGF0IHdhcyBhY3R1YWxseSBub3QgYnVpbHQKPj4+
Pj4gaW50byB0aGUgTGludXggaW1hZ2U6IGluIHRoZSBzYW1lIG1hbm5lciBhcyBDYW5hYW4gc29j
IGRvZXMsIGNyZWF0ZSBhbiBvYmplY3QKPj4+Pj4gZmlsZSBmcm9tIHRoZSBkdGIgZmlsZSB0aGF0
IHdpbGwgZ2V0IGxpbmtlZCBpbnRvIHRoZSBMaW51eCBpbWFnZS4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+Pj4+Cj4+Pj4gQWxvbmcg
dGhlIHNhbWUgbGluZXMgYXMgdGhlIGNvbW1lbnQgdGhhdCBKaXNoZW5nIFpoYW5nIG1hZGUgb24g
dGhlIGZpeGVkCj4+Pj4gYWRkcmVzcywgYnVpbGRpbmcgYSBkdGIgaW50byB0aGUga2VybmVsIGl0
c2VsZiBmdW5kYW1lbnRhbGx5IGJyZWFrcyBnZW5lcmljCj4+Pj4ga2VybmVsIGltYWdlcy4KPj4+
Pgo+Pj4+IEkgY2FuIHVuZGVyc3RhbmQgdXNpbmcgaXQgb24gSzIxMCwgd2hpY2ggaXMgZXh0cmVt
ZWx5IGxpbWl0ZWQgYW5kIHdvdWxkbid0Cj4+Pj4gcnVuIGEgZ2VuZXJpYyBrZXJuZWwgYW55d2F5
LCBidXQgZm9yIG5vcm1hbCBwbGF0Zm9ybXMgbGlrZSBtaWNyb2NoaXAgYW5kCj4+Pj4gc2lmaXZl
LCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZGlzYWxsb3cgQ09ORklHX0JVSUxUSU5fRFRCIGluIEtj
b25maWcKPj4+PiBhbmQgcmVxdWlyZSBhIG5vbi1icm9rZW4gYm9vdCBsb2FkZXIuCj4+Pgo+Pj4g
SSBraW5kIG9mIGRpc2FncmVlIGJlY2F1c2UgaWYgSSB3YW50IHRvIGJ1aWxkIGEgY3VzdG9tIGtl
cm5lbCBmb3IgdGhvc2UKPj4+IHBsYXRmb3JtcyB3aXRoIGEgYnVpbHRpbiBkdGIgZm9yIHNvbWUg
cmVhc29ucyAoZGVidWcsIGRldmVsb3BtZW50Li5FdGMpLAo+Pj4gSSB0aGluayBJIHNob3VsZCBi
ZSBhYmxlIHRvIGRvIHNvLgo+Pgo+PiBIb3cgaXMgdGhlIGJ1aWx0aW4gZHRiIGJldHRlciB0aGFu
IGFwcGVuZGVkIGR0Yiwgb3IgcGFzc2luZyB0aGUgZHRiIHRvIHRoZQo+PiBib290IGxvYWRlciBp
biB0aGF0IGNhc2U/Cj4KPiBBaCBuZXZlciBzYWlkIGl0IHdhcyBiZXR0ZXIsIGp1c3QgaXQgd2Fz
IGF2YWlsYWJsZSBzbyB0aGVyZSBpcyBubyByZWFzb24KPiB3ZSBjb3VsZCBub3QgYWxsb3cgaXQg
OikKCkkgYWdyZWU6IEknbSBub3QgcmVhbGx5IGEgZmFuIG9mIEJVSUxUSU5fRFRCIChhbmQgSSB0
cmllZCBwcmV0dHkgaGFyZCAKbm90IHRvIGhhdmUgaXQgaW4gdGhlIGZpcnN0IHBsYWNlKSwgYnV0
IHdoYXRldmVyIHdlIGhhdmUgc2hvdWxkbid0IGJlIApicm9rZW4uCgpUaGlzIGlzIG9uIGZpeGVz
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
