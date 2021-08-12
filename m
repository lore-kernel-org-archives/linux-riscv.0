Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8BAC4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 05:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498FA60FD7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 05:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 498FA60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=C7dwnyWEmftvP8OnG1qb+gOsWa3BhFTm58ifmwcv1no=; b=M9qtNQfcSsozEBY36mMBR9t1Ef
	zIifBfbmviPh/umewYFicvKZu46X1XWrahw1X4NATDhZrJxraO6KK1+bPoz3f/scr4X0aRtcFg5rk
	tsXbhBKhtNAxdGuddez6EoGM1Njpbe3oBE2V8Q6E8nY+in8BPEedmQTz5tcCeL2Ie173udpCJ/pTg
	nqA1bYwrqoI/8UgiPjXtJHZgBdlttu+igW07ofRaQfrQM82IFwBNoqNZegUJvT2qFGuIfTm9O3BT2
	T36h3N79/a65tzWT3JEY8FuZtgVajYUEAt70JltWePwzdln4zZhfSAL0m5d150hWAdzsRuwqLcoEO
	2WnFcBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE3Bh-008gez-JK; Thu, 12 Aug 2021 05:23:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE3Be-008ge5-8V
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 05:23:27 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so13381231pjn.4
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 22:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bQrl411Cthqt6pIHr/hant9kt/vOifGny5MEgIFUvls=;
 b=T84Kc/z9q+vHcpHvLIkoCJUyMDs96A0EO2OHme82NSs3xI2gKCVBV7ic09BrGiaqfV
 owlWmGhzA877enYL54ze9LYMseOpAmKkSjq4XSaPVjkeYnDkpVcEXyzJQSgFCSmRG0QB
 rFbT5eYN2MY7iAJhl8WIfabRth4JLCwQP/isGczfWhSbeotdeO/NbZMrGXK4tLKA1WYf
 1impM3Ypm18+EYY4p68OCq0GX17xBxmWHs7w1YVn8tzNKf72DygeCQX76T+9cckyjlGA
 1yCIRLncfqyG6noT6hP4AOnIlN5O/2lhVJm6zGF1ij5VfMXV2pZcKqSSTxgj6jINhMoW
 r+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bQrl411Cthqt6pIHr/hant9kt/vOifGny5MEgIFUvls=;
 b=JyTuL0l1nrnT5bBD2D9XJy2RlHmz8tHYYCkI2AkSV82xJJClWy464UzwB/aUA2KCeO
 71A5mqE3OHXTLaqBkn57UPdfjqhOxeGaPG79gmLY6AL47FsY4r2fNUja1BZw1yMRcf14
 ByAqRu5wGbji8HgY5w02DulCavaR7c64Cz701TQgmAzeKxq7AdSp4DMRuRFm5ttcel+h
 b0HdQMfG8Z3KntIEDqH9yhiUNy/Lm95Re1wZFtxSWeKxreAvW+Hj6oeiG0f7dunX0eDc
 wGHtLOeHV9/vvmGw5bPxykDJGr8b4BhfuAJxLs83y5t1fw4njKMIhHI+ClP+RU1SNwNe
 6A3A==
X-Gm-Message-State: AOAM5335MDrZ9rRR3w/nBVNZy5Bb0pq7m1Uw4aOEXIa0lIuo4BBVvBoG
 Yj1yQIMtuTWUIyO0oo2f0+5S1A==
X-Google-Smtp-Source: ABdhPJx3HD960snankcmEtYZ/kpTb1TVul2ICB91HEVhe10nex0sfnUsxnhn3Cd2ImnxMgbSUIzsGA==
X-Received: by 2002:a17:902:e8c4:b029:12d:1c9c:2e77 with SMTP id
 v4-20020a170902e8c4b029012d1c9c2e77mr2218679plg.48.1628745805478; 
 Wed, 11 Aug 2021 22:23:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b9sm663873pfo.175.2021.08.11.22.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 22:23:24 -0700 (PDT)
Date: Wed, 11 Aug 2021 22:23:24 -0700 (PDT)
X-Google-Original-Date: Wed, 11 Aug 2021 21:47:49 PDT (-0700)
Subject: Re: [PATCH -fixes 3/3] riscv: Optimize kernel virtual address
 conversion macro
In-Reply-To: <39a1fa85-1885-effe-1670-ec9cf34099f5@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-48d9e47f-a43b-4dac-808c-61078c2b77d9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_222326_343623_E4FF6FDB 
X-CRM114-Status: GOOD (  16.96  )
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

T24gU2F0LCAwNyBBdWcgMjAyMSAxMjozMToyNCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSA3LzA4LzIwMjEgw6AgMTg6MzYsIFBhbG1lciBEYWJiZWx0IGEgw6ljcml0wqA6
Cj4+IE9uIFdlZCwgMjEgSnVsIDIwMjEgMDA6NTk6MzcgUERUICgtMDcwMCksIGFsZXhAZ2hpdGku
ZnIgd3JvdGU6Cj4+PiBUaGUgY3VycmVudCB0ZXN0IGluIGtlcm5lbF9tYXBwaW5nX3ZhX3RvX3Bh
IG9ubHkgYXBwbGllcyB3aGVuCj4+PiBDT05GSUdfWElQX0tFUk5FTCBpcyBzZXQsIHNvIHVzZSBJ
U19FTkFCTEVEIHRvIG9wdGltaXplIHRoaXMgbWFjcm8gYXQKPj4+IGNvbXBpbGUtdGltZSBpbiBz
dGFuZGFyZCBrZXJuZWxzIHRoYXQgZG8gbm90IHJlcXVpcmUgdGhpcyB0ZXN0Lgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KPj4+IC0tLQo+Pj4g
wqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaCB8IDIgKy0KPj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGFnZS5oCj4+PiBpbmRleCBiMGNhNTA1OGU3YWUuLjEwZGMwNjM4NjhmNiAxMDA2NDQKPj4+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhZ2UuaAo+Pj4gQEAgLTEyMyw3ICsxMjMsNyBAQCBleHRlcm4gcGh5c19hZGRy
X3QgcGh5c19yYW1fYmFzZTsKPj4+IMKgI2RlZmluZSBsaW5lYXJfbWFwcGluZ192YV90b19wYSh4
KcKgwqDCoCAoKHVuc2lnbmVkIGxvbmcpKHgpIC0KPj4+IGtlcm5lbF9tYXAudmFfcGFfb2Zmc2V0
KQo+Pj4gwqAjZGVmaW5lIGtlcm5lbF9tYXBwaW5nX3ZhX3RvX3BhKHkpICh7wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiDCoMKgwqDCoCB1bnNpZ25l
ZCBsb25nIF95ID0geTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+Pj4gLcKgwqDCoCAoX3kgPCBrZXJuZWxfbWFwLnZpcnRfYWRkciArIFhJ
UF9PRkZTRVQpID/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+PiAr
wqDCoMKgIChJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVMKSAmJiBfeSA8IGtlcm5lbF9tYXAu
dmlydF9hZGRyICsKPj4+IFhJUF9PRkZTRVQpID/CoMKgwqAgXAo+Pj4gwqDCoMKgwqDCoMKgwqDC
oCAoKHVuc2lnbmVkIGxvbmcpKF95KSAtIGtlcm5lbF9tYXAudmFfa2VybmVsX3hpcF9wYV9vZmZz
ZXQpCj4+PiA6wqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAoKHVuc2lnbmVk
IGxvbmcpKF95KSAtIGtlcm5lbF9tYXAudmFfa2VybmVsX3BhX29mZnNldCAtCj4+PiBYSVBfT0ZG
U0VUKTvCoMKgwqAgXAo+Pj4gwqDCoMKgwqAgfSkKPj4KPj4gSUlVQyB0aGlzIGlzbid0IGFjdHVh
bGx5IGEgZml4P8KgIFRoZSBvdGhlciB0d28gYXJlLCB0aG91Z2gsIHNvIHRoZXkncmUKPj4gb24g
Zml4ZXMuCj4KPiBJbmRlZWQgdGhpcyBpcyBub3QgYSBmaXgsIHRoaXMgaXMgc3ltbWV0cmljYWwg
dG8gd2hhdCBJIGhhdmUgZG9uZSBpbgo+IHBhdGNoIDEgc28gdGhhdCBzZWVtZWQgbmF0dXJhbCB0
byBsYW5kIGluIHRoZSBzYW1lIHBhdGNoc2V0LiBMZXQgbWUga25vdwo+IGlmIHlvdSB3YW50IG1l
IHRvIHJlc2VuZCBpdCBvbiBpdHMgb3duLgoKVGhhdCdzIGZpbmUsIGl0IHdhcyBqdXN0IGV4cGxp
Y2l0bHkgY2FsbGVkIG91dCBhcyBhIGZpeCBpbiB0aGUgc3ViamVjdCAKbGluZSBzbyBJIHdhbnRl
ZCB0byBtYWtlIHN1cmUgSSB3YXNuJ3QgbWlzc2luZyBzb21ldGhpbmcuICBUaGlzIGlzIG9uIApm
b3ItbmV4dC4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
