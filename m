Return-Path: <SRS0=uF1/=UC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B68C04AB5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 17:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD14926FF8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2019 17:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5iyZlQw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NLVEIvLR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD14926FF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UhOL0QILRmkDVFUW/Lm8msYkNmo7JD8QoCCWTxF/oE=; b=q5iyZlQwBFB2JX
	7W/8boQYny53RDmSgauZa/xDUx16/1U4OCySZNz6+lpuMZg5V15lo59jdIo5zo3aUh14YN9b7RB5B
	J8ZeKoS5HeBuUwPuWLf5ax0duq/6lyyDT5923ar/3jVxbsBDGeMphv4+POwcjjowB7/udOo19aOiK
	gjEYHJc5DJuB1aZQHDTXrE0aeeJdpd2uMKi3TAFHX5ssUDadZyqly9lnjJNK1rN6iW1Lq0dQP4dT2
	aiQwgfOV7yxxw1J9xFrQNndXtmJnqTUCvclfCr9zdlPhREvI2MukbBDqRa2gaDqhvCV3idF33dLCI
	xbM9UIS+slAJplE6AS/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXqyx-0008Uk-FR; Mon, 03 Jun 2019 17:42:51 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXqyu-0008U1-I7
 for linux-riscv@lists.infradead.org; Mon, 03 Jun 2019 17:42:49 +0000
Received: by mail-lj1-x242.google.com with SMTP id 16so3473621ljv.10
 for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2019 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BS0Zh3jyjSb17eotilocZwY1GzUHeKUqjyq+4Kft1pQ=;
 b=NLVEIvLReVVSzUzdDGbor2dZ8ubeUlpmhNjUd82WAFgUKIBO7BoTaJIz44rPbkJPrM
 JJz4js2fDKmejIAwjlAnvQUcKyHnNvReqS52dXsAbD52WeR9RocU/fFCzu8ITS9tQb+D
 sjdkFNrjpp4ImFYc4Kuo0V3DKMhlkSDsj4aV0PqjKBhap8WtjQEFx4oGPrufWt9qZt13
 IDkqSzV1VP9Tf7KZJTXe3BxwI+so/wNAIi1UwJ/LM5p+TAe/TOZwfJ7kqtY5LqqbxW1q
 FsUPRQuHOQNPJr0m9+/rAnq/VlACSBwzANEDY+HFEiaFoP6z/PllCBlxwNNdkyJvoWe+
 4odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BS0Zh3jyjSb17eotilocZwY1GzUHeKUqjyq+4Kft1pQ=;
 b=eZqCjuXlPMvI67bc8UiO8S2Qwk+xzw5rdI0cj8Bg1GTKGcPNsBDm7kdzuDGbugqeu7
 z6xX+Yys9xGRAKdvNXFbKXsmDyR3yEsRUTjAVSgMG3MkWKLr+ZixTCmpK+n8i3RdmcHQ
 ZXLN7sNFMqrQvJ+M4ziXYyo0+eHsbCAGd2+UEsOZNVNmLp4v5zSYfwxQE/kUwWCtOaPm
 8EGI240Onm1MjshJM8RVaVCwIR4C6VSwQ2X5/rHlg74I9HPDmsq4e2EfPdzw8kG/Dqn9
 IHMCmp9AKlYwY1w1IJB2YKMBhrDOhebJPsLU6En9z12kr+5uMl+6TegZdz1x2Oqjs8br
 BSxQ==
X-Gm-Message-State: APjAAAUzkLVnqkB9004P/bXL8w4tWVK+Ok5QS+zOGmhPmF/tLQtvvWfx
 mwSBgG6p0fjlbhAsuQ8sicA/bO6NAlNkhUQktKcE4w==
X-Google-Smtp-Source: APXvYqy7436P4CRHoCyJ2XXuGEbIzmE7qmlHxfIe0H476OtQDIN20Vza1a6fj3+LTeOrwhyyTraNzBYtaxJteM56H8U=
X-Received: by 2002:a2e:8587:: with SMTP id b7mr14668645lji.101.1559583766018; 
 Mon, 03 Jun 2019 10:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <1558650258-15050-1-git-send-email-alan.mikhak@sifive.com>
 <305100E33629484CBB767107E4246BBB0A6FAFFD@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxsQ9NXrN7W_8HVrXQBb9HiBd+d1dNfv+cXmoBpXQnLwA@mail.gmail.com>
 <305100E33629484CBB767107E4246BBB0A6FC308@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxL-WYz1BY7yXJ6eKULgVtKeo67XhgHZjvtm5Ka5foKiA@mail.gmail.com>
 <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
 <CABEDWGxLeD-K8PjkD5hPSTFGJKs2hxEaAVO+nE5eC9Nx2yw=ig@mail.gmail.com>
 <75d578c2-a98c-d1ef-1633-6dc5dc3b0913@ti.com>
 <CABEDWGxBxmiKjoPUSUaUBXUhKkUTXVX0U9ooRou8tcWJojb52g@mail.gmail.com>
 <6e692ff6-e64f-e651-c8ae-34d0034ad7b9@ti.com>
In-Reply-To: <6e692ff6-e64f-e651-c8ae-34d0034ad7b9@ti.com>
From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Mon, 3 Jun 2019 10:42:34 -0700
Message-ID: <CABEDWGx2N66L=27JY6Ywbfny78UaxENkxBTqxU37PfuQO-ZMZw@mail.gmail.com>
Subject: Re: [PATCH] PCI: endpoint: Add DMA to Linux PCI EP Framework
To: Kishon Vijay Abraham I <kishon@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_104248_605161_FDE0D5B8 
X-CRM114-Status: GOOD (  17.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, "kjlu@umn.edu" <kjlu@umn.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "wen.yang99@zte.com.cn" <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jun 2, 2019 at 9:43 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi Alan,
> On 31/05/19 11:46 PM, Alan Mikhak wrote:
> > On Thu, May 30, 2019 at 10:08 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
> >> Hi Alan,
> >>> Hi Kishon,
> >>
> >> I still have to look closer into your DMA patch but linked-list mode or single
> >> block mode shouldn't be an user select-able option but should be determined by
> >> the size of transfer.
> >
> > Please consider the following when taking a closer look at this patch.
>
> After seeing comments from Vinod and Arnd, it looks like the better way of
> adding DMA support would be to register DMA within PCI endpoint controller to
> DMA subsystem (as dmaengine) and use only dmaengine APIs in pci_epf_test.

Thanks Kishon. That makes it clear where these pieces should go.

> > In my specific use case, I need to verify that any valid block size,
> > including a one byte transfer, can be transferred across the PCIe bus
> > by memcpy_toio/fromio() or by DMA either as a single block or as
> > linked-list. That is why, instead of deciding based on transfer size,
> > this patch introduces the '-L' flag for pcitest to communicate the
> > user intent across the PCIe bus to pci-epf-test so the endpoint can
> > initiate the DMA transfer using a single block or in linked-list mode.
> The -L option seems to select an internal DMA configuration which might be
> specific to one implementation. As Gustavo already pointed, we should have only
> generic options in pcitest. This would no longer be applicable when we move to
> dmaengine.

Single-block DMA seemed as generic as linked-list DMA and
memcpy_toio/fromio. It remains unclear how else to communicate that
intent to pci_epf_test each time I invoke pcitest.

Regards,
Alan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
