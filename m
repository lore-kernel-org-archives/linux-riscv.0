Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14238CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BErtOqM9TlxHav2GfjggXHJCs+Zc9i6xRJUhpnt9MP4=; b=nVetLO6vMGM1tf
	18nEspaWOeiQS10cX8DqVvzxl68DRDchRCHgYTYvMIVrlZuJN6VjDEFR3bv3/+V6AB1+gxlxPQpjP
	H82gUMOAv+OnbRcjMgDC5emxHQOxG/rDZww/8rEs/s4iFmnkKJ9mxrI9Nwx6KYskJ1fM7z19mZJ/A
	V7jDUxTomMb2TH7SaXLmgbkyZJ8p2kBdukOcAGK3LBcC/2Aya2MJL1C2xkHtv9UabPUbcJE7lmOVU
	Dv9isMLliW/V9mvXqr639ljBprkhAR6xMS78rGDmdFfMKETYstjdw4fKTL4WhqAZ6r7FCKQQSDHqR
	nEDGopgn9SUsZeJJp7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPkz-00A1jb-1l;
	Mon, 16 Oct 2023 15:43:49 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPkw-00A1iu-19
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:43:47 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-4a403fdebedso1840680e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471024; x=1698075824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=LBMKawQeDwk52ejt7dNWCr/6Iys5BGfksMkLMqRCNEABTYywZuKr/kJoe2gOGpoFvZ
         l7tcwUPSvsgLNnbVI/2g8IjYt436Y1+Hs3XKlV5NMtWX9kQHc4Cb1DGyIAaoL3fhCdZl
         qVwEOySlytsHa6jrZ4Yi+AEFFWw8h4y9GMRKh2f/ZmpIdhSzeSF2b+vQD7h/w41/wpeN
         s2+Kk9k7NTDDZuEe8C+YbFpkLuHTAO4s7sGsC6v0ApHzZtn/pP/IcVRsRwcB2WWGSW/t
         98agnpdTzGWfkofLJrt+yIvqHOgtBWOJAZUSfH7dXDUstStS5UrgFIZbYjZDLi1aTtRp
         IYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471024; x=1698075824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=fGlTHLz2hnxXGu44LkJ9ZQ4v5CFrao8zVkBAXPyH5JzN5Rj61vqaO0JStpndzb+07+
         +MDyQMiaJcnyXZbKc9wpPUqpYlJ+tCKJg0jWYubRT434Hd8cqtN1Erl5uIMefdAIf3MF
         fC5aYFGmh3BDRcEKJQkeCy+sPcgbLvJ5Kvky2U6Ej8C+t3gCOt2O4K8fgt+2cB7xapUs
         DwJLKtuuKDnrj1IPlDC2hSvSTEksKcLUWDfmqiEj/Et3OQCSSnx5F/nEgKF7s0QuExOy
         VeJikVAYAlizFilYuzlAAtIzPOZoYCP+zG5Doeb/TdpuQVXVZL93RvVGz3HFXItd7LGO
         toiw==
X-Gm-Message-State: AOJu0YyRHjz2PMCFcT30K2bSxn6+tFuqO8fSfYSwOP+N2jzrbfq7/Y0K
	uR+W95Lh8n/yontFMQPjcC2fA258tDqiqWyOojA=
X-Google-Smtp-Source: AGHT+IG/WMjMrGYCGsuwhthBEKZ8VCVuxCi3PoeLoYHu5J1bxDK0qcF2TAbbJo60X/pGsL22e+tEj0vGdiYsm/MFMMM=
X-Received: by 2002:a1f:e404:0:b0:49a:1a56:945c with SMTP id
 b4-20020a1fe404000000b0049a1a56945cmr28517495vkh.13.1697471023853; Mon, 16
 Oct 2023 08:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Oct 2023 16:42:27 +0100
Message-ID: <CA+V-a8skxbuRkU9PKUZRkQkp-y0PKeYx4WhVcJtktAT-VEgmCA@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_084346_390234_FF8F96AF 
X-CRM114-Status: GOOD (  13.45  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNjo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IFNlbGVjdGluZyBETUFfR0xPQkFMX1BPT0wgd2l0aG91dCB0aGUg
cmVzdCBvZiB0aGUgbm9uLWNvaGVyZW50IERNQQo+IGluZnJhc3RydWN0dXJlIGRvZXMgbm90IG1h
a2Ugc2Vuc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVz
YXMvS2NvbmZpZyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZwo+IGluZGV4IGYxNjk2ZDNi
NTAxOGQwLi5lYTQ3M2I0MTUwZGZhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2Fz
L0tjb25maWcKPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiBAQCAtMzM4LDYg
KzMzOCw3IEBAIGNvbmZpZyBBUkNIX1I5QTA3RzA0Mwo+ICAgICAgICAgc2VsZWN0IEFSQ0hfUlpH
MkwKPiAgICAgICAgIHNlbGVjdCBBWDQ1TVBfTDJfQ0FDSEUKPiAgICAgICAgIHNlbGVjdCBETUFf
R0xPQkFMX1BPT0wKPiArICAgICAgIHNlbGVjdCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKQ2FuIHdl
IGtlZXAgdGhpcyBhbHBoYWJldGljYWwgc29ydGVkIHBsZWFzZSwgd2l0aCB0aGF0IGZpeGVkOgoK
UmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+ICAgICAgICAgc2VsZWN0IEVSUkFUQV9B
TkRFUyBpZiBSSVNDVl9TQkkKPiAgICAgICAgIHNlbGVjdCBFUlJBVEFfQU5ERVNfQ01PIGlmIEVS
UkFUQV9BTkRFUwo+Cj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
