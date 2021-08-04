Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0AAC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BCC3604AC
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BCC3604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=8s/QjPLu3rweaweaZyXAUAuX9WvQE/K0sqdBRqqHa6k=; b=mOT5Rnk7U9SAXgmbsijzXOL6s/
	OsN98ojMSmt+dHUXo/BSFMfDOZfJS2Dip7RaxG2U96FcitzELeYT4L3cGHpITozNgu9OdT/bATLgB
	5oEqfYi69bPuVTCzneYAastUoq+N4EL2BMtgZVoH3smYfNCCB0WUMDK+YY9E/M3mD5/Qv42u9bSib
	wRKDeQtwfFoGFVICwJ6hXpp4EJXJdPy7osv/B9crHZpUlbtczAv7MkE9MKKzq4sqLLBe0EKRUVUPA
	BKB2O2kAR9JEcw93WlkBGW1IS0F0Wcvl1/MnwznggDQfYu7A8s8VEcfwH5Ffa+M1b41zaJf47vHsi
	Q2+Z4KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBNZr-007Pci-MK; Wed, 04 Aug 2021 20:33:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNZo-007Pbu-KQ
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 20:33:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id u2so4328205plg.10
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NA4uKKLEu35msR97qsSolbL54TUPMab0lRjU5+MP5MU=;
 b=w4byOHaK/A9cQ5MbmnQ4szazv+IOXC8YVr5hWXtCamq+eg/3RMJ/zCiE0FJnUB1l9s
 Hhq/YJvU7gQrN6upf+Ch7JKwcDIVn+rPN7AvbDVlE+W4yrcJg4OmNd1ZlKnCzNJcScqZ
 D7Mji1mIAIWcQCOUIYDlq7hj9ctr7ZDEY4dW6UzXfwxd+v82FIHUsRCN5p+YtdfvZADE
 8PfYcLoqsV6MRlzQVcpQDXQt1HpvytMyDMnlvMGQERR9ngPft/qV33vJdtIr2GXxFqaF
 PvKcGrlJxjMSHBvoysPuqzbkPoI+GdlJn3yklmMIF7YPSam0tQkyy9oVVgGSJTh2kjou
 xyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NA4uKKLEu35msR97qsSolbL54TUPMab0lRjU5+MP5MU=;
 b=LGMoP77ndQVC427BKbXJ15uqMXqmoruvSdd0dGC6Begmr3kfZ36F0cj3QGPgzgFQ9I
 fgx7Hxk0mo7h/TR5chPjSsWNOIVSi9rOiFQDlQSOzaBZIxjjTykXAZ5nALWYF05j+zYs
 ccW8AKoSknpFMbUeKjnyShLkFbKZtcEERgz4ITHzf2VjK+naCOmkVL3SUhTwSMnIoDoL
 7fKezPKmW2pgpjVgfoJykhDmH9YziBeL6Q7kaocaAv1T6qpgazlhV9sE2XhsdQuHvzTj
 700VeQ1btWasRmndg1iifMBH4HTuXs223DGuuPqwv52k71zDcHYyWfDhjTeDrLoU8O+U
 wPZw==
X-Gm-Message-State: AOAM533EewbJ5SIEV+81KlZ/qCuI/xycKYdjpmkkj+fSxGJJA2tBBpIs
 QyYwIg2J9vWiHnTCwUsYqQAd7w==
X-Google-Smtp-Source: ABdhPJyAXXQiy83AqTh9rDDTTw1CuU6cvQA4zxN0U/gwDOd1GwIpUzKZSHh27uUSmlXteh20zNPUug==
X-Received: by 2002:a65:524a:: with SMTP id q10mr877620pgp.97.1628109199166;
 Wed, 04 Aug 2021 13:33:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id qe3sm6634969pjb.21.2021.08.04.13.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:33:18 -0700 (PDT)
Date: Wed, 04 Aug 2021 13:33:18 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Aug 2021 10:33:29 PDT (-0700)
Subject: Re: [PATCH 1/3] riscv: Allow forced irq threading
In-Reply-To: <231ce61f-1af6-dea0-bcdb-a8de3c42a3fa@huawei.com>
CC: Christoph Hellwig <hch@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-b7be44bd-61b4-4eb7-a177-2295bf7c66d8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_133320_780459_E462C407 
X-CRM114-Status: GOOD (  18.41  )
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

T24gV2VkLCAwNyBKdWwgMjAyMSAyMzo0Mjo0NSBQRFQgKC0wNzAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4KPiBPbiAyMDIxLzcvOCAxMzoyOCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4+IE9uIFRodSwgSnVsIDA4LCAyMDIxIGF0IDA5OjU5OjQ3QU0gKzA4MDAsIEtl
ZmVuZyBXYW5nIHdyb3RlOgo+Pj4gVGhlIHRpbWVyIGludGVycnVwdCBhbmQgdGhlIHBlcmYgaW50
ZXJydXB0IG9uIHJpc2N2IGFyZSB3aXRoCj4+PiBJUlFGX1BFUkNQVSwgc28gaXQncyBzYWZlIHRv
IGFsbG93IGZvcmNlZCBpbnRlcnJ1cHQgdGhyZWFkaW5nLgo+PiAiQXJjaGl0ZWN0dXJlIGNvZGUg
bmVlZHMgdG8gc2VsZWN0IENPTkZJR19JUlFfRk9SQ0VEX1RIUkVBRElORyBhZnRlcgo+PiAgIG1h
cmtpbmcgdGhlIGludGVycnVwdHMgd2hpY2ggY2FudCBiZSB0aHJlYWRlZCBJUlFGX05PX1RIUkVB
RC4KPj4gICBBbGwgaW50ZXJydXB0cyB3aGljaCBoYXZlIElSUUZfVElNRVIgc2V0IGFyZSBpbXBs
aWN0IG1hcmtlZAo+PiAgIElSUUZfTk9fVEhSRUFELiBBbHNvIGFsbCBQRVJfQ1BVIGludGVycnVw
dHMgYXJlIGV4Y2x1ZGVkLiIKPj4KPj4gRGlkIHlvdSBkbyB0aGF0IGF1ZGl0Pwo+Cj4gWWVzLCBJ
IGNoZWNrIHRoZSBwZXJmIGFuZCB0aW1lciBvbiBSSVNDViwKPgo+IGFyY2gvcmlzY3Yva2VybmVs
L3BlcmZfZXZlbnQuYwo+Cj4gc3RhdGljIGludCByZXNlcnZlX3BtY19oYXJkd2FyZSh2b2lkKQo+
Cj4gewo+Cj4gIMKgZXJyID0gcmVxdWVzdF9pcnEocmlzY3ZfcG11LT5pcnEsIHJpc2N2X3BtdS0+
aGFuZGxlX2lycSwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBJUlFGX1BFUkNQVSwgInJpc2N2LWJhc2UtcGVyZiIsIE5V
TEwpOwo+Cj4gfQo+Cj4gZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4KPiBzdGF0
aWMgaW50IF9faW5pdCByaXNjdl90aW1lcl9pbml0X2R0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbikK
Pgo+IHsKPgo+ICDCoMKgwqAgZXJyb3IgPSByZXF1ZXN0X3BlcmNwdV9pcnEocmlzY3ZfY2xvY2tf
ZXZlbnRfaXJxLAo+IHJpc2N2X3RpbWVyX2ludGVycnVwdCwKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAicmlzY3YtdGlt
ZXIiLCAmcmlzY3ZfY2xvY2tfZXZlbnQpOwo+Cj4gfQo+Cj4gSXMgdGhpcyBlbm91Z2g/CgpXZSBh
bHNvIGhhdmUgdGhlIGRpcmVjdCBDTElOVCBkcml2ZXIsIGJ1dCB0aGF0J3MgcGVyY3B1IGFzIHdl
bGwuICBJSVVDIAp0aGlzIG1lYW5zIHdlJ3JlIE9LLCBJJ3ZlIHB1dCB0aGlzIChhbmQgdGhlIHJl
c3Qgb2YgdGhlIHBhdGNoIHNldCkgb24gCmZvci1uZXh0LgoKVGhhbmtzIQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
