Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EAEC47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ULYZzoHIw5KzSPW1ZhjyMUYmMc/uYZap6NISRMTcOg=; b=o0zjuCPzjlLFut
	w/nS5CY8FqNPyaTBi0Hnd0+N8TPLMuhQ6PJ8BhsJv5rNiorTYYCJ+fBEFmkorFJMM5xHKqFRRPS3o
	Z371Exv1UNyaD1C1MgiePGL8xhznLgP3AlkyHbPytoQw7CBUvoE64ufYGgiCDiH03DaBfMpH8NDS5
	0QFhVfe+2Faz2bk1KENgXs4nBMDKM1xlDFEA4LHaHD8q+WdLJxvvNAwnhNv5cOyIu6v2tx0ipsMLg
	AUEblSu+lRu6cAiBQX11CPZqja7p1+t5oaA+TC84xiyUCCpdehbU/Z8bKQiNQZDHicxTulXwTar7L
	Dfphb/P40AaoKhqctuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpub-00B7Cu-1F;
	Mon, 22 Jan 2024 08:44:09 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpuY-00B7C6-2N
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:44:08 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-21424f34003so426993fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705912985; x=1706517785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvVrC+f35N01r8aPfRDm4pbZkjSq9nuQifRbMlHzeSQ=;
        b=hXPVYuEew0BYYmYv9g9GTbv6xC9morvx++DI3lkgieuGep7d5dYqf+XNm3VnrieN+Q
         GGOu0eAKpUaS1Ou/LQ5UrUYZuqOGhOxhqIPAnRuHEx5wtho/HBp1pBhDShfEs6yWH5ES
         aLX3QG/RkkBv7OS+OKvbpl4vQfodTqQFt3qXfuxbn94vAwAgkK/KeF9Xf7V/nThqc1zV
         FCQE1aKKvleVW4vrdt44t041nhjgt4h/UoNPleXxyHVfodcxZEKr+RebTgoHVrcseHrs
         V3VjNSeqz//Qa/sIshj4ld1WfYsPS5T7IF0TIrqtcPCajEWR+EjoHTyIVmAD/FMOtf/+
         UOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912985; x=1706517785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvVrC+f35N01r8aPfRDm4pbZkjSq9nuQifRbMlHzeSQ=;
        b=pafjzOrdLRlYT7EH9WajYkGS8Et2UAG+oNq57H9nHbeMFXFyhQOSB06UOi/va/WU5n
         EwgpoerGbq2esqL1TdikXbf+t9C4tb48w0CGHmZ5BLV6YHw8kQ3giYYWl82weyUoOW20
         vhicU4XtLfBjAfCnRJz+wDvgxw0P6o1zrMn1s2VTv3avV88k4VUv2XNcozqRwUW3p2kh
         qz5F7040RrfNNmpplHNVIDKcYRYdxgg0LnR3dGhBNv4QvBOnWA+y5MLEQ37WDEai9bX8
         2SdjYs3IXBdXYoAWv5tXxTFLq3bltFaXvtOdwXgyJl3zVW+dqwPW71r6PGWIbFz0PaDd
         V2EA==
X-Gm-Message-State: AOJu0YyrCr4NmDolk5YKrby1rQu48xIaJkcBiqVbULyaPjbxIQfn29sb
	VNUzM3d3RIEyzCICg3yWUbFx2go5rVTXH3U3WA5HVT48Y6i+iEnLb9Yfp6HFgAmbKAXBbyLFvUD
	KQGxObTyk+GCBB9kORESra3kQQi0=
X-Google-Smtp-Source: AGHT+IGO5jrrZtbYOiVQIVGyuNjgvRWaxekfSQGoJMFUsTLosSs7KRyYuQS/Sq24qmG5IJnhKHCJRFaIq5fdWNYON4o=
X-Received: by 2002:a05:6870:b30e:b0:210:b602:5b75 with SMTP id
 a14-20020a056870b30e00b00210b6025b75mr2072119oao.42.1705912984419; Mon, 22
 Jan 2024 00:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
 <20240122081722868bdda5@mail.local> <CAJRtX8QU8iHY1oQJ1uDN3YOmCeN7SH+vPC8nD29WS5+2DT1oKQ@mail.gmail.com>
 <fcd64bbb-9f3c-4e62-96a4-84cb1e3ac59d@linaro.org>
In-Reply-To: <fcd64bbb-9f3c-4e62-96a4-84cb1e3ac59d@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 22 Jan 2024 16:42:53 +0800
Message-ID: <CAJRtX8R9bZZyU_6XZ+G_rctRu3TTEAUamVbq1h8q+Fzzd6SZiw@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_004406_769706_9F5596F5 
X-CRM114-Status: GOOD (  14.01  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNDozN+KAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMi8wMS8yMDI0IDA5
OjM0LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDQ6MTfi
gK9QTSBBbGV4YW5kcmUgQmVsbG9uaQo+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29t
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIyLzAxLzIwMjQgMTY6MDY6MzArMDgwMCwgSmluZ2JhbyBR
aXUgd3JvdGU6Cj4gPj4+IEltcGxlbWVudCB0aGUgUlRDIGRyaXZlciBmb3IgQ1YxODAwLCB3aGlj
aCBhYmxlIHRvIHByb3ZpZGUgdGltZSBhbGFybQo+ID4+PiBhbmQgY2FsaWJyYXRlIGZ1bmN0aW9u
YWxpdHkuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxxaXVqaW5nYmFv
LmRsbXVAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4KPiA+Pj4gRGVwZW5kcyBvbiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1M0M3NzRENDFFREYxRUFEQjZFQzE4QkI2
RDJASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29tLwo+ID4+Cj4gPj4gV2hh
dCBpcyB0aGUgZGVwZW5kZW5jeT8KPiA+Pgo+ID4KPiA+IFRoYW5rIHlvdSwgdGhpcyBkcml2ZXIg
cmVxdWlyZXMgc3VwcG9ydCBmcm9tIHRoZSBDTEsgZHJpdmVyLgo+Cj4gSG93PyBUaGlzIGlzIHJl
YWxseSB1bnVzdWFsLiBKdXN0IHRvIHJlbWluZDogd2UgdGFsayBhYm91dCBidWlsZAo+IGRlcGVu
ZGVuY2llcy4gT3RoZXIgZG8gbm90IG1hdHRlciBmb3IgbmV3IGRyaXZlcnMsIHJpZ2h0PyBPdGhl
cndpc2Ugd2hhdAo+IGlzIGJlaW5nIGJyb2tlbiBhbmQgaG93IGl0IGNvdWxkIGJlIGV2ZW4gYnJv
a2VuPwo+CnllcywgeW91J3JlIHJpZ2h0LiBUaGlzIGlzIHdyb25nLCBJIHdpbGwgZHJvcCBpdC4K
CkJlc3QgcmVnYXJkcywKSmluZ2JhbyBRaXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
