Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7947E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Vg3UP+R/1da2WD8EAYrECf4fjcj5J4L8aQD5Ql19ew=; b=KqqAZEgXFjrXUn
	FWjyRYTI5ODdwF5eERN5bV0BMuwv+QbPpBOgDKEOLrneiX0nNZOJHJSHeDywSF/SafF7UGD3oG7/Q
	3q24czJiWpxoSvfqb/MglgqJmKkazKDjhxWNbfehM4Naq7ErRHr9sYyHe8eMzvIgCXaZ26DfE38tV
	VkaUTyOGK06q9S/XJj2R7R6BZmbWyOjHKD01Q8jV9PU89NyUn+9K7AgBWMRRjDfRcqdMLmCvRuhsJ
	vlCAyEL2P/gOkr5zvHIAaXVlm28xXMJb80GQ9l28NO/z+HIAEfW/BBUWrR8USZwV1HJdAmAZAKOBA
	P0t+suN+rxUGVewMTwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qplsB-00A01Q-0j;
	Mon, 09 Oct 2023 08:44:19 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpls8-009zzJ-1X
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 08:44:17 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59bf1dde73fso51694857b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 01:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841050; x=1697445850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqNLFjHn3fj/AL0iMyf/yawddLiaq23Wu30A3Gzqckk=;
        b=dbdINYVV3OlxVCml3BOEDkgSErL/MgLfytiwsIoMEN8Vs5Y33cNuk913mEFuWR2+aN
         Yoi1uTN6/8rCE1ERslLl8R9K3zb4VllX76CHteX9uXpFMcOhQAchG1KeYMbWsQtRA9cr
         JlC+RrhdgH9Ma+U/q90yWzfmleTYQp3qmdluuWzjXgWJCFJBpgaWquoomA7iy9pwxpP3
         pkCeruRnJPNqKR6Pk/M8jwYv/mUOJuOTjJNjpsHZUHAWPJeh3PwjTRoxrn7bVVnmL0ft
         5KU7Y0mCxeu1LwjN6famTxJX0p5vXYKKEhcl+Sb0wOZVvKgxO0z1EorXTTrPiYMtFEH3
         a05g==
X-Gm-Message-State: AOJu0Yx7fLOtZNkNYeh+0hoATEmDyF+aZbGdUzTZwigWSNSedItVzbKw
	TnJTiHtmy9PjvRfLMfvzFFLRurjSzVtDmw==
X-Google-Smtp-Source: AGHT+IFy+O+4TJvef+/HVYAB/8hY5qOGzitudtJahBYEOD9ITZUrZ4AnJJnNC3GyFzxrjLVecFn9PQ==
X-Received: by 2002:a81:a14b:0:b0:583:6db3:a007 with SMTP id y72-20020a81a14b000000b005836db3a007mr16255631ywg.17.1696841049928;
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id w1-20020a81a201000000b005837633d9cbsm3469384ywg.64.2023.10.09.01.44.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a24b03e22eso51935947b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
X-Received: by 2002:a0d:d808:0:b0:59b:d796:2a55 with SMTP id
 a8-20020a0dd808000000b0059bd7962a55mr17521321ywe.1.1696841049412; Mon, 09 Oct
 2023 01:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
In-Reply-To: <20231009074121.219686-2-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Oct 2023 10:43:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_014416_514278_2941C7A8 
X-CRM114-Status: GOOD (  17.68  )
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

SGkgQ2hyaXN0b3BoLAoKT24gTW9uLCBPY3QgOSwgMjAyMyBhdCA5OjQx4oCvQU0gQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+IENPTkZJR19ETUFfR0xPQkFMX1BPT0wgY2Fu
J3QgYmUgY29tYmluZWQgd2l0aCBvdGhlciBkbWEtY29oZXJlbnQKPiBhbGxvY2F0b3JzLiAgQWRk
IGRlcGVuZGVuY2llcyB0byBLY29uZmlnIHRvIGRvY3VtZW50IHRoaXMsIGFuZCBtYWtlCj4ga2Nv
bmZpZyBjb21wbGFpbiBhYm91dCB1bm1lbnQgZGVwZW5kZW5jaWVzIGlmIHNvbWVvbmUgdHJpZXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClRoYW5r
cyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEva2VybmVsL2RtYS9LY29uZmlnCj4gKysrIGIva2Vy
bmVsL2RtYS9LY29uZmlnCj4gQEAgLTEzNSw2ICsxMzUsOCBAQCBjb25maWcgRE1BX0NPSEVSRU5U
X1BPT0wKPgo+ICBjb25maWcgRE1BX0dMT0JBTF9QT09MCj4gICAgICAgICBzZWxlY3QgRE1BX0RF
Q0xBUkVfQ09IRVJFTlQKPiArICAgICAgIGRlcGVuZHMgb24gIUFSQ0hfSEFTX0RNQV9TRVRfVU5D
QUNIRUQKPiArICAgICAgIGRlcGVuZHMgb24gIURNQV9ESVJFQ1RfUkVNQVAKPiAgICAgICAgIGJv
b2wKPgo+ICBjb25maWcgRE1BX0RJUkVDVF9SRU1BUAoKcmlzY3YgZGVmY29uZmlnICsgQ09ORklH
X05PTlBPUlRBQkxFPXkgKyBDT05GSUdfQVJDSF9SOUEwN0cwNDM9eToKCldBUk5JTkc6IHVubWV0
IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIERNQV9HTE9CQUxfUE9PTAogIERlcGVu
ZHMgb24gW25dOiAhQVJDSF9IQVNfRE1BX1NFVF9VTkNBQ0hFRCBbPW5dICYmICFETUFfRElSRUNU
X1JFTUFQIFs9eV0KICBTZWxlY3RlZCBieSBbeV06CiAgLSBBUkNIX1I5QTA3RzA0MyBbPXldICYm
IFNPQ19SRU5FU0FTIFs9eV0gJiYgUklTQ1YgWz15XSAmJiBOT05QT1JUQUJMRSBbPXldCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgoKLS0KR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
