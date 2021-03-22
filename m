Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C950C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:05:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50C7E6196B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 06:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C7E6196B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1rLnvb095O/XPnuAS/rdEDklbqnYnFQyQmF8HwyjYWY=; b=OotNDSX2dw7+pCe+Uj2YooJIC
	211fFvkxdjaw/Xz3LqhBg1I76BePKr21CZa6jbYs2RxzavOs2RjSkQ5UFUAnZCqZ0Y+g3ElikAZ5V
	XPYbsYf86f5jTq3rhyNfDIqj2n3xTDlj50gn1cPM+Goi8pEd2Y4QDKEQMaILZaomfCgBaxlBtwTfD
	jH9WSBI2CONfGffmBMuK1WRpegw75YwBASB7Xr0hLN7dT5MD91ohGnHYQLBfKu4cu21XLqkgjXNLC
	kDkv2gYByCncUMjjd424TqIYH1lHpLDLaOze5820Wost+Bv2awUGy+5HZeJFlMfVSQWljEqgwmfO2
	/DmwUdfKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODgh-00Ayo6-W6; Mon, 22 Mar 2021 06:05:16 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODgY-00AyjH-Ro
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 06:05:10 +0000
Received: by mail-yb1-xb36.google.com with SMTP id z1so5353481ybf.6
 for <linux-riscv@lists.infradead.org>; Sun, 21 Mar 2021 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FG1+KPUwtgZN7XZD2JCE4xNXJ7HzuOOFg2FJVhM4QhQ=;
 b=oPnk/Y1ykO+u3txb/44/zCiUU5ZJZYtb3Rr4GzqTyv8t4DW2J1DMnd/5FUGlpWjIxQ
 W/oSo0CKqknuLMj1G5UbP3ohY1Gz7Th3gXWpGWOWP9vqbEOq++7kbP35HwbQTQxTebBH
 /tsmG67csbb4r520awj32c+1Oi2Wjf2fHB01tXtOvLqQoLYrzzZEyBG6gI2m32y/bTrN
 zQRkHdrfNdLUW4lLY78U/yX1ogvElBWce0IA9Mwnxs692BxPKMDM8eb5n3gj4lzCDwmi
 2iJUcMYAIX5yeGRF8SIqkLHqSXBOMffa/DVoKZPB9stDV5pyCFawcjAiyAbJ9pnp/XY3
 4xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FG1+KPUwtgZN7XZD2JCE4xNXJ7HzuOOFg2FJVhM4QhQ=;
 b=r4Xxgsie7m+kVBT/dkZbHymMpPpFR6uG1hQNMydJu/m94JGoTvYFT21zvQwfMYtz3G
 zSCdITXSBC8eF8e5cmbt6ZBr0g1mgl1f8GI7LnpKZYO1CyPnEMJ3C6EIVH0OI1obIfMB
 FVgQrP2rN+DeKaVzlF7yGxKqsf1nEb7s9pyt8BpcVpbow/I902oa2rT2whb5ijo3BBiC
 ct4TYPbWrWrRudgZ2qI4zt60DQUdlyu11hjUHhwpd0GP8jwMi8mSSoZfxzXlYI66il6L
 n7gG+jJTC56poCNvyaf8aBhJf8nvdBCDAlxMRYpM0QDsWqFHqA13JzsjU/LXygitQ9J0
 YKOA==
X-Gm-Message-State: AOAM532yfYL+MENcJ4O0yEdBxZnKo69wahvDhGGcFQuZBvfIPQB3dzcP
 cf7lXXRVLApPbtOTtbegoZ4Be8waGzOifSYLYxM=
X-Google-Smtp-Source: ABdhPJxWgca5VI06/RCVPsjBtrXwQqqxodp7vU6Cewbx3Y20Z6XhZNod70oYZjN+Jz3v0YlBYVtnIYLkvKlLuYsYM2E=
X-Received: by 2002:a25:d28b:: with SMTP id
 j133mr20820720ybg.517.1616393104871; 
 Sun, 21 Mar 2021 23:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <20210303200253.1827553-4-atish.patra@wdc.com>
In-Reply-To: <20210303200253.1827553-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Mar 2021 14:04:53 +0800
Message-ID: <CAEUhbmUYfZ=wnb0L=qgzvo73V5rM-cdKbMshGxKYQ-sph_nSSA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Ivan.Griffin@microchip.com, 
 Lewis.Hanly@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_060507_121005_1E6B10F5 
X-CRM114-Status: GOOD (  10.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 4, 2021 at 8:48 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
>  4 files changed, 404 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
