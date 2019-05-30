Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76751C28CC2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 17:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5046225ED6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 17:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3FTYcvy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JT/fEl27"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5046225ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R/pz1odV3fd02mqCRCppeLpzvu5jJXcZCLCXagx1eQ=; b=O3FTYcvyDebyO+
	vWWPF4J6mT8cRby8xVB7hgMkdXNtQ4lcknCBMETkOxa8x8Zqq4AcH/SGeqyFQ2qhDC5BN/o5AeSy6
	4qeNmT/Z3WoPpxo+J2OcMQgD1AtEh6usH8mZ+3qt7mBXv4+zdd/HKOS1g4/gXhTXyl6kajXQZ+JAT
	5bs/7ED3dwC8DmHedTKmqNbo1Pdy/sxDkD9R6F6wgIj94WV/7v/bdoDBwqhQY3isQ+aRLMpON/zzG
	Tw89SBpx+H2XIX5vjPpLFsTgJiGhxUte+eav5Ws5dRQTT/lq77+3qo57fPkSJunWP4rDqPpn+Tm+s
	PJB5Thc7QT7mh5KTD8LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWPHw-0002sh-WB; Thu, 30 May 2019 17:56:29 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWPHt-0002rh-PD
 for linux-riscv@lists.infradead.org; Thu, 30 May 2019 17:56:27 +0000
Received: by mail-lf1-x144.google.com with SMTP id l26so5703259lfh.13
 for <linux-riscv@lists.infradead.org>; Thu, 30 May 2019 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kznmoz7C+qs9+fS1R4x2KVGpxZXkzNDQtpMYN/bgS0w=;
 b=JT/fEl27W7OW7rJcwHTFEDIgpayKw/JcKZrccKW+R06f8yFn9Sfmqh1Y1+4eFFmINj
 APEMuKyil8NOFpMdzz9O3cIulvqjkdaZ2tOVr4o7IKRKHWjlMU10TWN403QDqTiF8GE+
 YMUDO7iGJIUsV3W1TTBlJHn341cr9XU4HEjMADWS4Hwpvt+DlNAxnMEGK68wm14STPK3
 V6OlCCKBbjh8qEkuB8VASZ4IEKTRT8ja3iIGVWU1VQ5qEJm8cjXWDNruPlhZRD2G2JfP
 wqXec1kI3sSfJPSkEVYF+NXpHw36TbeTGAPmx4rdsXx16WXyPtJjTNzE5VZuZKQPqe0F
 k/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kznmoz7C+qs9+fS1R4x2KVGpxZXkzNDQtpMYN/bgS0w=;
 b=o6WtSmHx9TKgDFh5qhXKn36GNNQg+fwgtqM7U3QlEssq6m/2w5FHG5NMLUKKWemLOv
 l2oGgpJbLF0sQHHeTpsu8/MmgmS71ns3gZqsLCukO0rOsg5oZUhO2+2X07z3yxskI67W
 wya1fXGUOWBUqU2eMXY7ofIV6wHcx57f2bX6Kj+M2HZKvEC2VrrtZLqDkeV2P79nMcf6
 1s1OF2uZXJ50Lm3lUCmcZAgGfuUkFshXp2jLYP2xM0PhfKPvdqqNMXWI0/NY2KlBTaAj
 MMbPnkkz/A6ZsXSb6nKiavh3pBY2Eiz20+si0Kzy14rXXPCgVEAUJTs+XWL3pwCbyjUi
 ac3Q==
X-Gm-Message-State: APjAAAX4G6teiidlt0micHfOMP6cwB7atu5+A9PgbgkITXYUJyw7lK65
 ccTB4SyuVfIpc1FkdR6dnjbBe9GaJSU8V8iyNOiOPQ==
X-Google-Smtp-Source: APXvYqyQiWOytOWvETmZ/lX6mjAxJtO7J/9HNjyUp8rLndIVDE+TYfD/IMExAYni2I/+EKIHlCwpa/JO2Z2EXi0B4Gc=
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr2829996lfl.1.1559238981944;
 Thu, 30 May 2019 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <1558650258-15050-1-git-send-email-alan.mikhak@sifive.com>
 <305100E33629484CBB767107E4246BBB0A6FAFFD@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxsQ9NXrN7W_8HVrXQBb9HiBd+d1dNfv+cXmoBpXQnLwA@mail.gmail.com>
 <305100E33629484CBB767107E4246BBB0A6FC308@DE02WEMBXB.internal.synopsys.com>
 <CABEDWGxL-WYz1BY7yXJ6eKULgVtKeo67XhgHZjvtm5Ka5foKiA@mail.gmail.com>
 <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
In-Reply-To: <192e3a19-8b69-dfaf-aa5c-45c7087548cc@ti.com>
From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Thu, 30 May 2019 10:56:10 -0700
Message-ID: <CABEDWGxLeD-K8PjkD5hPSTFGJKs2hxEaAVO+nE5eC9Nx2yw=ig@mail.gmail.com>
Subject: Re: [PATCH] PCI: endpoint: Add DMA to Linux PCI EP Framework
To: Kishon Vijay Abraham I <kishon@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_105625_966490_85D02C25 
X-CRM114-Status: GOOD (  19.06  )
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

On Wed, May 29, 2019 at 10:48 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
>
> +Vinod Koul
>
> Hi,
>
> >>> On Fri, May 24, 2019 at 1:59 AM Gustavo Pimentel
> >>> <Gustavo.Pimentel@synopsys.com> wrote:
> >>>>
> >>>> Hi Alan,
> >>>>
> >>>> This patch implementation is very HW implementation dependent and
> >>>> requires the DMA to exposed through PCIe BARs, which aren't always the
> >>>> case. Besides, you are defining some control bits on
> >>>> include/linux/pci-epc.h that may not have any meaning to other types of
> >>>> DMA.
> >>>>
> >>>> I don't think this was what Kishon had in mind when he developed the
> >>>> pcitest, but let see what Kishon was to say about it.
> >>>>
> >>>> I've developed a DMA driver for DWC PCI using Linux Kernel DMAengine API
> >>>> and which I submitted some days ago.
> >>>> By having a DMA driver which implemented using DMAengine API, means the
> >>>> pcitest can use the DMAengine client API, which will be completely
> >>>> generic to any other DMA implementation.
>
> right, my initial thought process was to use only dmaengine APIs in
> pci-epf-test so that the system DMA or DMA within the PCIe controller can be
> used transparently. But can we register DMA within the PCIe controller to the
> DMA subsystem? AFAIK only system DMA should register with the DMA subsystem.
> (ADMA in SDHCI doesn't use dmaengine). Vinod Koul can confirm.
>
> If DMA within the PCIe controller cannot be registered in DMA subsystem, we
> should use something like what Alan has done in this patch with dma_read ops.
> The dma_read ops implementation in the EP controller can either use dmaengine
> APIs or use the DMA within the PCIe controller.
>
> I'll review the patch separately.
>
> Thanks
> Kishon

Hi Kishon,

I have some improvements in mind for a v2 patch in response to
feedback from Gustavo Pimentel that the current implementation is HW
specific. I hesitate from submitting a v2 patch because it seems best
to seek comment on possible directions this may be taking.

One alternative is to wait for or modify test functions in
pci-epf-test.c to call DMAengine client APIs, if possible. I imagine
pci-epf-test.c test functions would still allocate the necessary local
buffer on the endpoint side for the same canned tests for everyone to
use. They would prepare the buffer in the existing manner by filling
it with random bytes and calculate CRC in the case of a write test.
However, they would then initiate DMA operations by using DMAengine
client APIs in a generic way instead of calling memcpy_toio() and
memcpy_fromio(). They would post-process the buffer in the existing
manner such as the checking for CRC in the case of a read test.
Finally, they would release the resources and report results back to
the user of pcitest across the PCIe bus through the existing methods.

Another alternative I have in mind for v2 is to change the struct
pci_epc_dma that this patch added to pci-epc.h from the following:

struct pci_epc_dma {
        u32     control;
        u32     size;
        u64     sar;
        u64     dar;
};

to something similar to the following:

struct pci_epc_dma {
        size_t  size;
        void *buffer;
        int flags;
};

The 'flags' field can be a bit field or separate boolean values to
specify such things as linked-list mode vs single-block, etc.
Associated #defines would be removed from pci-epc.h to be replaced if
needed with something generic. The 'size' field specifies the size of
DMA transfer that can fit in the buffer.

That way the dma test functions in pci-epf-test.c can simply kmalloc
and prepare a local buffer on the endpoint side for the DMA transfer
and pass its pointer down the stack using the 'buffer' field to lower
layers. This would allow different PCIe controller drivers to
implement DMA or not according to their needs. Each implementer can
decide to use DMAengine client API, which would be preferable, or
directly read or write to DMA hardware registers to suit their needs.

I would appreciate feedback and comment on such choices as part of this review.

Regards,
Alan Mikhak

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
