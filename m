Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989F5CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulvFieycfvKeHKHYwNR66RvqqQNsr7OgrmoZmhHvJkI=; b=fWmIy69sRX8IDR
	+gQPdSpwRlccobpdUrR3hlAUbUeGF6xelBHlfowpwgzGH3KrLWavpjjlUHLWLe35mIKWYmR0jeqw2
	Fe4wJ7JiVWdhoefMiVI6pkNa80EJYnr6yVBP5iOGgZho+3Laofw786U/RFzlCRmS8EQG7nNX9JjLo
	5cloM2HixEyXWAit2a1El3kXVTtJ2cv2LwfEizPE/SV9PlFzW/Qg7wYxkDk4Tc+pYNryOR39S482N
	J2Pft9rnTn5hGpx1y+0t4JgEhF1andNiTDR22Qm2kdSCN7f9KaLnoI9nDKeHzj9GeU0eGsN4NzIx6
	LFiodXZugoMCF8C3iZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsez3-00Bc9l-2o;
	Tue, 17 Oct 2023 07:59:21 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsez0-00Bc9G-2T
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 07:59:19 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a86b6391e9so26006367b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 00:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697529557; x=1698134357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9M3vO8TKvpu7sLT3D9MNM+ZNPQeT7q9+/iFi4wqDgU=;
        b=XLGxKwPfzcD2pC3tv3J861Quk1gfuJidDQRol6OLUhX0wAJyZkTMgsc+vlJUt5ryrD
         kRBdHl77igitcDg8TRRIwu/RnoL7j02c5QTUr3fx1LMXWd+Zov7vtN8IKEfx38OSA/Lp
         cVw2FjAWQNNk3h+0CpjctF6ueqvhEMbbsYCQyIx9alCOS3MH5xKFl57+PWKU/m9EFigJ
         1oqk7SeUjSPGFSpKgWogz2/QhMN5zSTAzv9O5t6zdHnLWNg+Q7up+Khgn1XMkeThAjH8
         OY8TsJZh5T2O8Q8ziq4/dxd9kSeXcfpNvRYCW4yBDL63Lfewz5RYGjwLxPWPxCDxiDm8
         GVEA==
X-Gm-Message-State: AOJu0Yx63KD/L9OPEfHSdmajAT0JayDDVXVl50qgcSGGj25sDsD7s9lq
	8iHSkmUmoydCBomR++DOvnMxRB54ermgfw==
X-Google-Smtp-Source: AGHT+IFLfIo1LhHRh5vHnHkexMh2kOXLuich+fiwHLfspAF2d160gjx+XZ/QRJEYM4CDEMaWkbhIXw==
X-Received: by 2002:a0d:dd8f:0:b0:5a7:af86:8d3b with SMTP id g137-20020a0ddd8f000000b005a7af868d3bmr1573182ywe.37.1697529556700;
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id i78-20020a819151000000b0059be6a5fcffsm414349ywg.44.2023.10.17.00.59.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a822f96aedso47252097b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
X-Received: by 2002:a0d:e9c2:0:b0:59b:c6a4:15c7 with SMTP id
 s185-20020a0de9c2000000b0059bc6a415c7mr1352703ywe.46.1697529555871; Tue, 17
 Oct 2023 00:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 09:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_005918_807276_EF2F6407 
X-CRM114-Status: GOOD (  13.98  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBBUkNIX1I5QTA3RzA0MyBoYXMgaXQncyBvd24gbm9uLXN0YW5kYXJk
IGdsb2JhbCBwb29sIGJhc2VkIERNQSBjb2hlcmVudAoKaXRzCgo+IGFsbG9jYXRvciwgd2hpY2gg
Y29uZmxpY3RzIHdpdGggdGhlIHJlbWFwIGJhc2VkIFJJU0NWX0lTQV9aSUNCT00gdmVyc2lvbi4K
PiBBZGQgYSBwcm9wZXIgZGVwZW5kZW5jeS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
