Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0885C12002
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 15:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69126135C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 15:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69126135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3nmsHrpsk9BuR20HqhNBrvYHLrLSd5Tpeh+RNSEyWJw=; b=P1MiDZru5RI0qv19NmhszCNYym
	/fJISdxE0Gg07CB9qawHHqkWANa/wKrIoKD2CNMs+WrAmqhr+5q3PmQTRBWrhhbkJxjjxVKF5IJ1x
	dtVK2COdStjST64TIuZFV8oRffXf/9N3CYwfmwrg8zDLAZJg8vhWDJKPQ/VL+lyEYA9WPYRDkeOvi
	FDc6lyv8bM/W0PD8tiai1ROnNjfHLAxlTsCbX78fhfUD3zwxLrIaVRHbCVJ6jJSxIvmLBb081Jbkf
	wzHP5CMw6eiNgkqVo8QH4mmc0E1dnCn5V7ifS34y2M94VeJ8yRVpWjxO6zRWPDy1i3vd0kvECMh5K
	TsTnwpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5V6S-00A4JH-OI; Mon, 19 Jul 2021 15:22:44 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5V6Q-00A4IR-Gl
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 15:22:43 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 h6-20020a17090a6486b029017613554465so202678pjj.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nvVob/r6aogoYIZPXj3xzusDgNE755/gn+vTBsW74ko=;
 b=RPkxmalK9O2x0tnnD63jkQ1EtIKZ7h7qqYU1CHCCSAGuud+0tDc03Qr561ZcB5P9ta
 2i8hidiCj9YuDDEdqXR0gC7n6pTh3IUhO3eVZDyvfto9Eid4HrFpJXOq8aFNPJgG+mwz
 azvJJGUa2Pfrv5LcWY1YOomimuhASWz7l7EpGEAqAWPABmrfMp6faOb/srC4ebwnVsAr
 twPOayf0xMmviobC7ygj+yLp6qTlIjxnnGKioeszevYnlzo426CbaAt8XiMadYSYofdf
 SoMCq8OVfL9vUPLxBisBbGzNysqPInMIx8DJXVOASFjBIeasi1SA68zz03NxNHneuSG4
 sqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nvVob/r6aogoYIZPXj3xzusDgNE755/gn+vTBsW74ko=;
 b=eBwLq9nbv9NqjC60fzhiaxHiPQZW8tG0NbRmRDTMXzkYBYQeDdCu25QD6VucmuBS7Z
 1IeixstoR44OteyZst5TDfYx4JOS9sO4opO+L/o5gOZnBUUsBmZU6SmxjyO8bnNPoMO0
 hXXQ3mcH8V5yh5y1n/+be5h0NSPjjydUtm7p9Aip91xBRMlGmwy1GP6SOQqWaBmTRK9v
 C3KLJPj7F4ZtqH/chpwhddMoMT5cIonQ8nFZQB1XSKhaxJuvnRBn6LW2gjmbF7yMjawT
 yky0YrAeGhbv0evagiWlft0zKqZfmp3ploTI7W2CvGBdS4AErRe9Yuwtm+cG4Uu5Fopd
 OWIA==
X-Gm-Message-State: AOAM5316X3xn/a8WZS44o/my0JXheelFg9rXx8kpq7WrXYlbMY3h7tba
 gLNvzB3GX7crWtwXEvGRaYU=
X-Google-Smtp-Source: ABdhPJy/lOXC2/EtKPIbuho79iPei4tSqmfJjQhDAOQlSWLSr/7dxEBzOHbcMFV2VFVzJN4KVsqx1g==
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr30847210pjb.137.1626708161753; 
 Mon, 19 Jul 2021 08:22:41 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id w145sm9410903pfc.39.2021.07.19.08.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 08:22:41 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
 <CAMuHMdVMi8zfmSiZ0vnvCcsZQua_LKXpNAQVmRUdBKxNay=f-w@mail.gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <97ee158e-0fe8-cd7a-6ee2-35f9018838de@gmail.com>
Date: Tue, 20 Jul 2021 00:22:37 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVMi8zfmSiZ0vnvCcsZQua_LKXpNAQVmRUdBKxNay=f-w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_082242_612265_D683E426 
X-CRM114-Status: GOOD (  19.79  )
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

SGkgR2VlcnQsCgpPbiA3LzE5LzIwMjEgMTE6NDkgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToKPiBIaSBUc3VrYW1vdG8tc2FuLAo+IAo+IE9uIE1vbiwgSnVsIDE5LCAyMDIxIGF0IDI6NTMg
UE0gQWtpcmEgVHN1a2Ftb3RvCj4gPGFraXJhLnRzdWthbW90b0BnbWFpbC5jb20+IHdyb3RlOgo+
PiBUaGlzIHBhdGNoIHdpbGwgcmVkdWNlIGNwdSB1c2FnZSBkcmFtYXRpY2FsbHkgaW4ga2VybmVs
IHNwYWNlIGVzcGVjaWFsbHkKPj4gZm9yIGFwcGxpY2F0aW9uIHdoaWNoIHVzZSBzeXMtY2FsbCB3
aXRoIGxhcmdlIGJ1ZmZlciBzaXplLCBzdWNoIGFzCj4+IG5ldHdvcmsgYXBwbGljYXRpb25zLiBU
aGUgbWFpbiByZWFzb24gYmVoaW5kIHRoaXMgaXMgdGhhdCBldmVyeQo+PiB1bmFsaWduZWQgbWVt
b3J5IGFjY2VzcyB3aWxsIHJhaXNlIGV4Y2VwdGlvbnMgYW5kIHN3aXRjaCBiZXR3ZWVuIHMtbW9k
ZQo+PiBhbmQgbS1tb2RlIGNhdXNpbmcgbGFyZ2Ugb3ZlcmhlYWQuCj4gCj4gWy4uLl0KPiAKPj4g
U2lnbmVkLW9mZi1ieTogQWtpcmEgVHN1a2Ftb3RvIDxha2lyYS50c3VrYW1vdG9AZ21haWwuY29t
Pgo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKClRoYW5rcyBmb3IgdHJ5aW5nIQoKPiAKPiBB
cyB2MyBpcyBwYXJ0IG9mIHY1LjE0LXJjMSwgYWxsIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMgbmVl
ZCB0byBiZQo+IHNlbmQgYXMgaW5jcmVtZW50YWwgcGF0Y2hlcy4KClllYWgsIEkgd2FzIG5vdCBw
YXlpbmcgYXR0ZW50aW9uIHRvIHY1LjE0LXJjMS4gV2lsbCByZWdlbmVyYXRlIGl0IAp3aGVuIEkg
c3BvdCB0aGUgcmVtYWluaW5nIGJ1ZyBvbiBydjMyLgoKPiAKPiBBZnRlciByZXZlcnRpbmcgY2E2
ZWFhYTIxMGRlZWMwZSAoInJpc2N2OiBfX2FzbV9jb3B5X3RvLWZyb21fdXNlcjoKPiBPcHRpbWl6
ZSB1bmFsaWduZWQgbWVtb3J5IGFjY2VzcyBhbmQgcGlwZWxpbmUgc3RhbGwiKSBhbmQgYXBwbHlp
bmcKPiB2NCwgYm9vdGluZyBsaW51eC1vbi1saXRleC12ZXhyaXNjdiBzdGlsbCBmYWlscywgYnV0
IG5vdyBkaWZmZXJlbnRseQo+IChyZWFsIGNyYXNoKToKClRoaXMgdGltZSBpdCBsb29rcyBsaWtl
IHVuZGVyIGNvcHkgaW5zdGVhZCBvZiBvdmVycnVuIGNvcHkgbGFzdCB0aW1lLgpUaGUgU1pSRUcs
IExHUkVHLCBSRUdfTCBhbmQgUkVHX1Mgc2hvdWxkIGJlZW4gdGFraW5nIGNhcmUgb2YgdGhlIApk
aWZmZXJlbmNlIG9mIHJ2MzIgYW5kIHJ2NjQsIGJ1dCBwcm9iYWJseSBzdGlsbCBmb3JnZXR0aW5n
IGFwcGx5aW5nCnNvbWUgcGxhY2VzLgoKQWtpcmEKCj4gCj4gICAgIC9iae+/ve+/ve+/ve+/ve+/
vVbvv71GLTogYXBwbGV0IG5vdCBmb3VuZAo+ICAgICAyJ++/ve+/ve+/ve+/ve+/vXQ6IGFwcGxl
dCBub3QgZm91bmQKPiAgICAgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0
byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDdmMDAKPiAgICAgQ1BVOiAwIFBJRDogMSBDb21t
OiBpbml0IE5vdCB0YWludGVkCj4gNS4xNC4wLXJjMi1vcmFuZ2VjcmFiLTAxOTMzLWc1Yzk1NzQ4
NjkwMTcgIzM1Nwo+ICAgICBDYWxsIFRyYWNlOgo+ICAgICBVbmFibGUgdG8gaGFuZGxlIGtlcm5l
bCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwYWYwCj4g
ICAgIE9vcHMgWyMxXQo+ICAgICBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQK
PiA1LjE0LjAtcmMyLW9yYW5nZWNyYWItMDE5MzMtZzVjOTU3NDg2OTAxNyAjMzU3Cj4gICAgIGVw
YyA6IHdhbGtfc3RhY2tmcmFtZSsweDExYy8weDEzYwo+ICAgICAgcmEgOiBkdW1wX2JhY2t0cmFj
ZSsweDJjLzB4M2MKPiAgICAgZXBjIDogYzAwMDM5NzAgcmEgOiBjMDAwMzliYyBzcCA6IGMxODM1
ZTIwCj4gICAgICBncCA6IGMwNmE3NjkwIHRwIDogYzE4MzgwMDAgdDAgOiAwMDAwMDAwMAo+ICAg
ICAgdDEgOiAwMDAwMDAwMCB0MiA6IDAwMDAwMDAwIHMwIDogYzE4MzVlNTAKPiAgICAgIHMxIDog
YzA1ZDgxODAgYTAgOiAwMDAwMTAwMCBhMSA6IDAwMDAwMDAwCj4gICAgICBhMiA6IGMwNGRmZDY4
IGEzIDogYzA1ZDgxODAgYTQgOiBhYjFkNGNkYwo+ICAgICAgYTUgOiAwMDAwMTAwMCBhNiA6IGMw
NjdkMjA0IGE3IDogZmZmZmVmZmYKPiAgICAgIHMyIDogMDAwMDAwMDAgczMgOiBjMDVjYzlmNCBz
NCA6IDAwMDAwMDAwCj4gICAgICBzNSA6IGMwNWQ4MTgwIHM2IDogYzA0ZGZkNjggczcgOiAwMDAw
MDAwMQo+ICAgICAgczggOiAwMDAwMDAwMCBzOSA6IDk1YjZmMTU4IHMxMDogMDAwMDAwMDAKPiAg
ICAgIHMxMTogMDAwMDAwMDEgdDMgOiAwMDAwMDAwMCB0NCA6IDAwMDAwMDAxCj4gICAgICB0NSA6
IDAwMDAwMDAwIHQ2IDogMDAwMDAwMDAKPiAgICAgc3RhdHVzOiAwMDAwMDEwMCBiYWRhZGRyOiAw
MDAwMGFmMCBjYXVzZTogMDAwMDAwMGQKPiAgICAgWzxjMDAwMzk3MD5dIHdhbGtfc3RhY2tmcmFt
ZSsweDExYy8weDEzYwo+ICAgICBbPGMwMDAzOWJjPl0gZHVtcF9iYWNrdHJhY2UrMHgyYy8weDNj
Cj4gICAgIFs8YzA0ZGZkZTg+XSBzaG93X3N0YWNrKzB4NDQvMHg1Ywo+ICAgICBbPGMwNGU0Yzk4
Pl0gZHVtcF9zdGFja19sdmwrMHgyYy8weDQwCj4gICAgIFs8YzA0ZTRjYzg+XSBkdW1wX3N0YWNr
KzB4MWMvMHgyYwo+ICAgICBbPGMwNGRmZjNjPl0gcGFuaWMrMHgxM2MvMHgzMzAKPiAgICAgWzxj
MDAwYzc3ND5dIGRvX2V4aXQrMHg4MzAvMHg4YjgKPiAgICAgWzxjMDAwYzg4OD5dIGRvX2dyb3Vw
X2V4aXQrMHg0MC8weGFjCj4gICAgIFs8YzAwMGM5MTg+XSBfX3dha2VfdXBfcGFyZW50KzB4MC8w
eDM0Cj4gICAgIFs8YzAwMDIxMjg+XSByZXRfZnJvbV9zeXNjYWxsKzB4MC8weDQKPiAgICAgLS0t
WyBlbmQgdHJhY2UgZDE0N2YwZjE0Njk4MmIwOCBdLS0tCj4gICAgIG5vdGU6IGluaXRbMV0gZXhp
dGVkIHdpdGggcHJlZW1wdF9jb3VudCAxCj4gICAgIEZpeGluZyByZWN1cnNpdmUgZmF1bHQgYnV0
IHJlYm9vdCBpcyBuZWVkZWQhCj4gCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4gCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
