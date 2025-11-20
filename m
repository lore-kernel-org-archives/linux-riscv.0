Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA9CF8855
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nr1egqP0cNFhImJtA4XLT36PpnpLoD9uPS6ByuvkiQM=; b=NfsogRDX8aZxmESkSRqC2ytq8A
	WXtMc2ycF3e3v7J9+p+k8GbEXjvLgP8f1Sc+/h1klJjjtWzou+x/wH2+210dnaDDxqsp9tJvthire
	iaeC12uDE+d+WAFuECI2/+6EbDhZ4yDtB6VQOLr0cY14l8hYQSq8lwhorMytFVv0+vTdwFoc4SRZ+
	bTzqd0HlMUA4duBGoXTy+UZ+5JJ2XJZ935v3k3btnPyzU8vA0w8IwPKIzQmQcoSV0rncGLp0SBKNO
	4MPclwkcYEYGK3Bv+lf9GHpuEvnUjr114W3ar/+N7EETbOLPMVm9rhJuz/RY9pLLGpnhL072uNrKb
	zWcEcJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4ZL-00000006inw-2emr;
	Thu, 20 Nov 2025 13:19:27 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4ZJ-00000006ina-3HCj
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 13:19:26 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-594270ec7f9so740455e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Nov 2025 05:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763644763; x=1764249563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+Pvs/P8yaAJcomIF/27w9FonmnRzGGcQEOUpMwbtSc=;
        b=WvtHlXn1crtGR+E5BbRQXTjLTDeW1PSEFYG8/9HSLSWdtp5hrcHxMLkzZSJ1m7z91V
         dqhBdiouALvxKgO7uoE41I5lJM51IIsqEUkqYb/5zxLgoJTvetaZlVkzvKTFi/Vvp/Cj
         bYaQJK86KO1fTlD/1U+r41HHAGY+nzQ1HmT6LRhJzyYRI537V6BlhfIrPBEqnNBkkaEb
         gH86cMjmRt+ntZqPEXKivKVAO/kJA9uAf9D5ladHGCEc5KD5wXZZg8MQ1dxLTjVlQXoz
         2bcEPJ/IRAbLBMJ6AkqkTIP/8yISea21xjirx3Gro9yX3gv1BjiUrz7kGmw8IMM4g+aM
         lM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763644763; x=1764249563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+Pvs/P8yaAJcomIF/27w9FonmnRzGGcQEOUpMwbtSc=;
        b=DAzIxtKsGwqz+Mj4IB3pmFhw7+M4k1cEbDrwir7P7kOzsy8qYVlvk0KbP+cy2ZzN/W
         W5vkqM8uQrH/S06PhAc0dRzj+vo7W7uPsPXQP3aGgrjYyuXY/Y55Vn1+yk+WUiW7d88a
         aziw5vVH8J5SkH+SljBSJWQC8Na2E8ByqT4CRd5OPuqyO2EnJQgIefPtDcwh5vxHQGA3
         /qB6AjC9J2dOXCnYICBJbUlPKeONH6ee+YP/Mcze0MemSemiTHVWOHocj1/RXlHLWFP0
         z4ZdTIHPgpdCc5zGebiIwuG+B8KkKCO67pvdkJcBmHVFFYp2YEPOCrFJYfYHm4kimkAu
         Mb4g==
X-Forwarded-Encrypted: i=1; AJvYcCUOYJm72UZiuDjxBVQxczvJo9qdmDwZEn+vok6gDMnlEnEwgx7WhPLGL5YqbgTkSkM4ZLZMvXfdIFnYrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9eEkqwmGfFIhU0en05yQABH9r5CJL2lGdp8bpSaycy+sy0pzj
	OMVbyZxRE1Ch8KVd12+VIfZe7oE2yGZGSkJEygPMVUUh3oYSfXqHGp1lzXSfyaw2eCU0Oj/n4sx
	ckd/hBfECNF2SG3sDdUWt/7LWw5E522bCuREHQVCb2Q==
X-Gm-Gg: ASbGncss0x/XuSGLWJHhfsh9XxhLp20H22+BR5IuRAG4LmmXsQb1VXTM1nyid3g/jjW
	0vktrKbKJcu9BxNzPvVqRAMfQm4YocBNeg1Kv8VqhUKU3087VvK1FvE+mmL0tZDvEfj834FuKyA
	xWmwSy2npLQ+hyYFzoPGw4lPP7pojujqh/iLiMKPGyRawrixSJ8NN1u4LsAXWUCqAbiqwskhM6x
	HNB0B71KtSpDB+mrt4arnAWLGgQPcXGyOMxLCy8c5JUJB6N22c34q5jqJWXtzEGx3S+sKnE0yUb
	y8Fsyc2UocWhVUp4QRsuPa2S1A==
X-Google-Smtp-Source: AGHT+IEQ5Of/pwZQALzGabgNx2iK3YUlSn5cLYElEN96Nu9WW+rH8ZIKADzTHUZ2rHI3X/Cck3HhjRldNNCydiLySOs=
X-Received: by 2002:a05:6512:12c7:b0:595:81ba:fb4 with SMTP id
 2adb3069b0e04-5969e31aeeemr1132843e87.47.1763644763516; Thu, 20 Nov 2025
 05:19:23 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 05:19:22 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Nov 2025 05:19:22 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
MIME-Version: 1.0
References: <20251119150049.13537-1-jszhang@kernel.org> <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
Date: Thu, 20 Nov 2025 05:19:22 -0800
X-Gm-Features: AWmQ_bkIlwbTZgGoZosO65uRCBe6I-MO9GZQWGgQg5fS3X-qe8cV74I6WtFGmbU
Message-ID: <CAMRc=McJz-omnKZsFLN+us00811bM1Q8Y-jodL5gtCp=OEsEEA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_051925_859092_D3BA9E62 
X-CRM114-Status: GOOD (  17.70  )
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

T24gV2VkLCAxOSBOb3YgMjAyNSAxODo1MzoyMCArMDEwMCwgQW5keSBTaGV2Y2hlbmtvCjxhbmRy
aXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHNhaWQ6Cj4gT24gV2VkLCBOb3YgMTksIDIwMjUgYXQg
MTE6MDA6NDlQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4gRm9sZCBkd2FwYl9jb250
ZXh0IGludG8gc3RydWN0IGR3YXBiX2dwaW9fcG9ydCB0byBmdXJ0aGVyIHNpbXBsaWZ5Cj4+IHRo
ZSBjb2RlLiBTdXJlIHRoaXMgYnJpbmdzIGEgdGlueSAzNiBieXRlcyBkYXRhIG92ZXJoZWFkIGZv
cgo+PiAhUE1fU0xFRVAuIEFmdGVyIGdyZXBwaW5nIHRoZSBhcm0vYXJtNjQvcmlzY3YgZHRzIGRp
ciwgdGhlIG1heCBkd2FwYgo+PiBncGlvIHBvcnQgbnVtYmVyIGlzIDYodGhlIGJlcmxpbjJxIHNv
YyBmYW1pbHkpLCBzbyB0aGlzIG1lYW5zIHdlIHdpbGwKPgo+IEdQSU8KPgo+ICphbmQgSSBiZWxp
ZXZlIHRoaXMgaXMgbGltaXRhdGlvbiBieSBTeW5vcHN5cyBpbiBIVywgYnV0IEknbSBub3QgZ29p
bmcgdG8gY2hlY2sKPiB0aGUgZGF0YXNoZWV0IHJpZ2h0IG5vdy4KPgo+PiB3YXN0ZSAyMTYgYnl0
ZXMgbWVtb3J5IGluIHRvdGFsIHdoaWNoIGlzIHRyaXZpYWwgY29tcGFyZWQgdG8gdGhlCj4+IHN5
c3RlbSBtZW1vcnkuCj4+Cj4+IEZyb20gYW5vdGhlciBzaWRlLCBhcyBNaWNoYWVsIG1lbnRpb25l
ZDoKPj4gIlRoZSBkcml2ZXIgY3VycmVudGx5IGFsbG9jYXRlcyB0aGUgc3RydWN0IHdpdGgga3ph
bGxvYyBhbmQgc3RvcmVzIGEKPj4gcG9pbnRlciB0byBpdCBpbiBjYXNlIG9mIFBNPXkuCj4+IFNv
IHRoaXMgcHJvYmFibHkgaGFzIGFuIG92ZXJoZWFkIGluIHRoZSBzYW1lIG9yZGVyIG9mIG1hZ25p
dHVkZQo+PiAocG9pbnRlciArIG1hbGxvYyBvdmVyaGVhZC9hbGlnbm1lbnQvZnJhZ21lbnRhdGlv
bikgaW4gY2FzZSBvZiBQTT15Cj4+IG5vdy4iCj4+Cj4+IFNvIGxldCdzIEZvbGQgZHdhcGJfY29u
dGV4dCBpbnRvIHN0cnVjdCBkd2FwYl9ncGlvX3BvcnQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPgo+PiBDQzogTWljaGFlbCBCw7xzY2gg
PG1iQGJ1ZXMuY2g+Cj4KPiBQbGVhc2UsIHVzZSAtLWNjIG9yIG1vdmUgQ2MgbGlzdCBiZWxvdy4u
Lgo+Cj4+IC0tLQo+Cj4gLi4udGhpcyBjdXR0ZXIgbGluZS4gSXQgd2lsbCBoYXZlIHRoZSBzYW1l
IGVmZmVjdCBvbiB0aGUgZW1haWxzLCBidXQgaXQgd2lsbAo+IHJlZHVjZSB0aGUgbm9pc2UgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlLgo+Cj4+IE5PVEU6IHRoaXMgcGF0Y2ggaXMgYXBwbGllZCBhZ2Fp
bnN0IHRoZSBmb2xsb3dpbmcgc2VyaWVzOgo+PiBbUEFUQ0ggdjMgMDAvMTVdIGdwaW86IFVzZSBt
b2Rlcm4gUE0gbWFjcm9zCj4KPiBJdCdzIGJldHRlciB0byBqdXN0IHB1dCBhIGxpbmsgdG8gbG9y
ZS5rZXJuZWwub3JnIG9yIGF0IGxlYXN0IG1lc3NhZ2UtaWQuCj4KPiAuLi4KPgo+IEkgaGF2ZSBh
IG1peGVkIGZlZWxpbmdzIGFib3V0IHRoaXMsIGJ1dCBpZiBtYWludGFpbmVycyBnbyB3aXRoIGl0
LAo+IGxldCBpdCBiZSB0aGVuLgo+CgpJIGRvbid0IG1pbmQgaXQgc28gcGxlYXNlIHJlc2VuZCBp
dCB3aXRoIHRoZSBpc3N1ZXMgYWRkcmVzc2VkLCBKaXNoZW5nLgoKQmFydAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
