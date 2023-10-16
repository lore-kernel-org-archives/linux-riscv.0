Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E3CCDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZDH4cD32Y9BM+ekBYNae3yqSKUBvlvALEP07G7Ybn4=; b=4hClGn4Wgc7X2S
	TXqe6rln23K1zTPVzL9djFG3IeakqkwIntTJURtYmkw9ZRJp8VeZP4UBnGrXV032R5xIWs4ZPZ0b7
	tGeqOrXy80CqTbMXJopSBGxrHiI8eWKGSeddy+Z0zTu/AWKhxWZYuSPVMv6Gf5W1b+mXMqa15pVm5
	8T3fni/yhC/pV4zm+64tRLil/leCKH2XPNO/IgLrq8vlHKHLxXuPcK2u7bimt+szwXLAwegx5D2cS
	cIWdeAkoioczvRs7OTnrCbgWesmWVV4vmoy0rwb0120RIbla4+dBjaIOg/cAKtfNJnni2YjLolqcW
	gsNl6KwxTJsV8Jol86sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPj4-00A1G9-15;
	Mon, 16 Oct 2023 15:41:50 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPj1-00A1FX-1O
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:41:48 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49dd3bb5348so1773339e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470906; x=1698075706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=CoCCJduqtrUporfBxIpSsM4bdAWSvgo/LN6v5MfF+YRvz/7AOSIW12RHIlwkTBZudO
         XqL/+EuZD1nVCHwq+t61SQ4ZscD5tAsunVkbIcjC+PacodCz/y6UXasHpBlWJEC2ABWk
         vmJty3UiWnyVLuQkh58xORCHK6PT0kKL9HTr0QE01E5VV1wksvq44Nejct5cZ9ZCcDij
         EBGg9yFXHY0nKicrUl8R06fwjUFWg+hdltEHRXRFZ8BXPIrZnu/TTEnKHOHmFWN0AbFo
         OoD/YIXGnesMZOnB1D3SNs1GyVdfEjQ1e99RDo6+oDiwMH8+oRocz+yVHYtHgc+Ol7F5
         g+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470906; x=1698075706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=g3lT/M0YPqspRdUlokbexeAqflaE2DlvZyb0304XD2aFsl5ee8hFlKhxLhY1j8gIVI
         vgmDlmHzhfRUNYOiZX1shcnybDQwYzrSz80Rn6ACJhdjteN+qRoa+qpnA2Za1faMtmZ8
         Pmc+Q3ykJ0ockUyXwYbmT2gXSWpXGdwzPYRoE237pPciJZKFmoJzlDRIxIEdaj/nco3I
         tDVmHANrUDXmGa5PiqfMsyZvQ+cdL0YZrL7lE9bfJNoIYFs95TXfyiWtj2WUYFBTR3gA
         Yq1ukq9ZQxJIAn+RstMwfnRyXYib/fLQzUM9b5yuIKTXAz7REuGF2msY6tD1sL1vMwcv
         6Mgw==
X-Gm-Message-State: AOJu0YxC/5yVWudG+qbqQqcO2GUo/vkKbun4sDQR5KnTQOvF1ts1q2MR
	0zR5gGVshQor90q820rEAL3XCTUDnm/kQ2qQ6I8=
X-Google-Smtp-Source: AGHT+IGux325FOhiB0DGfuNAaDcad8gGCTORm2m4I3eBqk5dFYW6m/Pa7EpUDnkf3lePkwaOdU4GJYHkEbhbyUtux/E=
X-Received: by 2002:a1f:ed41:0:b0:495:dcd0:471 with SMTP id
 l62-20020a1fed41000000b00495dcd00471mr28745613vkh.5.1697470905828; Mon, 16
 Oct 2023 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Oct 2023 16:40:29 +0100
Message-ID: <CA+V-a8sdZa8TiTsjY+u3rywFsXY2yKmZ0vWg900NMxVc_NRX7Q@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
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
X-CRM114-CacheID: sfid-20231016_084147_472776_9E2F1E85 
X-CRM114-Status: GOOD (  14.18  )
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
bHN0LmRlPiB3cm90ZToKPgo+IEFSQ0hfUjlBMDdHMDQzIGhhcyBpdCdzIG93biBub24tc3RhbmRh
cmQgZ2xvYmFsIHBvb2wgYmFzZWQgRE1BIGNvaGVyZW50Cj4gYWxsb2NhdG9yLCB3aGljaCBjb25m
bGljdHMgd2l0aCB0aGUgcmVtYXAgYmFzZWQgUklTQ1ZfSVNBX1pJQ0JPTSB2ZXJzaW9uLgo+IEFk
ZCBhIHByb3BlciBkZXBlbmRlbmN5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgpSZXZpZXdlZC1ieTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJz
LApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZyBi
L2RyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZwo+IGluZGV4IDg4MGM1NDRiYjJkZmRhLi5mMTY5
NmQzYjUwMThkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiAr
KysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiBAQCAtMzM0LDYgKzMzNCw3IEBAIGlm
IFJJU0NWCj4gIGNvbmZpZyBBUkNIX1I5QTA3RzA0Mwo+ICAgICAgICAgYm9vbCAiUklTQy1WIFBs
YXRmb3JtIHN1cHBvcnQgZm9yIFJaL0ZpdmUiCj4gICAgICAgICBkZXBlbmRzIG9uIE5PTlBPUlRB
QkxFCj4gKyAgICAgICBkZXBlbmRzIG9uICFSSVNDVl9JU0FfWklDQk9NCj4gICAgICAgICBzZWxl
Y3QgQVJDSF9SWkcyTAo+ICAgICAgICAgc2VsZWN0IEFYNDVNUF9MMl9DQUNIRQo+ICAgICAgICAg
c2VsZWN0IERNQV9HTE9CQUxfUE9PTAo+IC0tCj4gMi4zOS4yCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
