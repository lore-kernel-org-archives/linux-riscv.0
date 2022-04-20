Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG5leig50k3gvPRqV+Sk1ebWBbiRPN9O9NaaRAcX2WY=; b=t7g91sTeVfwAW9
	Cc8DryBFgrTH7cLKfyg+LyZMajWaU6i6P8NcWgLwPKAI11c+r95KAUp9wj61MeSZcSDVL6FOs6RZw
	pjExfc+xq8IOO8hryhhxY/tLUmL6AEvCniVhV8NDWUd155fnVh/0iSNs+KNupcDLujh1r+7uzz+ea
	mBwHjfc5JrsmuISLvK9QXKRQRHTcCIOfYB9BcXSwBJHxpbrKVquYZJPKeEkO5AoODVAsejyRIJMOe
	h/+lJybDQTTs5O5h17Umiti3NdG/0nM0SbwBDhps7Rx1cv67nlZopJaar0twd2lTxiPh7Y1sQedk4
	GcnGpP/66FVcyvHAjv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBHY-009OVf-C2; Wed, 20 Apr 2022 14:26:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBHU-009OTq-Mv
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8751A61797
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 14:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB514C385AE
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650464765;
 bh=VBenOZQnhKSaKTDnmTU7YPn2Kk85+5G1iSKwpEyGiww=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m7rZBwv9aWdNJd6Loy0eH5cEhgp+IzTLxDZNPLz2lHP3oHFa5kNcf6/YxolvF1KxG
 z7U/uiM2NQS1fZGGrbOAnLb1vts3dQpamCubqiMxPflwZAUrQ4ecKNnnZ7ysQJTnFh
 KmjPa7Ev/p/Q1/A5nrP+oMpyC41Suc8EDjKknK2oqNfcWcUAmbXEC2wl1ygieoWE7w
 eES15iHNN/CLXTq66bL2zyCiR5So+Zz0H2UjqvItPYVIPWxmFjv9jkPYDwM0JFk6qe
 Ccu+jIsxbEp37nootcADrepZ2FZsh82W4B+EpGpKmfMt1OTSWwj94cJKKGZ7HzX2S5
 pIw0f4X2L8SCQ==
Received: by mail-pg1-f173.google.com with SMTP id k29so1741684pgm.12
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 07:26:05 -0700 (PDT)
X-Gm-Message-State: AOAM531O2tZJOyZol6MbGAT9TJ6YacXr0OwUqrEIZBYE91LT2NWLFpgl
 1BEjiRzrUkkaDzkmc8QFSeegvuGaKcXz5fX6TQ==
X-Google-Smtp-Source: ABdhPJxoI0QtEfC8n4+Ln+gp0b3QXWDDvTicJkjQ1klYrRPpw4OnJYVmtCTwaMTxb74RYk3qNMBwj0W1ciQ/08DtuWU=
X-Received: by 2002:a63:e70e:0:b0:3a9:eb7f:96c9 with SMTP id
 b14-20020a63e70e000000b003a9eb7f96c9mr15011577pgi.85.1650464765346; Wed, 20
 Apr 2022 07:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <CANXhq0r15Z9NZj+xr7K_2Tt5VbK2r4+f7Fpg-f9BY98ufgKxcw@mail.gmail.com>
 <mhng-75e55594-c878-4fad-9ffc-dc552111208e@palmer-ri-x1c9>
In-Reply-To: <mhng-75e55594-c878-4fad-9ffc-dc552111208e@palmer-ri-x1c9>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 20 Apr 2022 09:25:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+5TbfFxD3p4ckvNw=jFweuvjQPRQfjmvPqZJga25o0pA@mail.gmail.com>
Message-ID: <CAL_Jsq+5TbfFxD3p4ckvNw=jFweuvjQPRQfjmvPqZJga25o0pA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Zong Li <zong.li@sifive.com>, Vinod <vkoul@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_072608_859936_CB9C56BD 
X-CRM114-Status: GOOD (  24.14  )
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

On Tue, Apr 19, 2022 at 7:18 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 11 Apr 2022 04:43:35 PDT (-0700), zong.li@sifive.com wrote:
> > On Mon, Apr 11, 2022 at 6:48 PM Vinod Koul <vkoul@kernel.org> wrote:
> >>
> >> On 11-04-22, 10:51, Zong Li wrote:
> >> > On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
> >> > >
> >> > > On 28-03-22, 17:52, Zong Li wrote:
> >> > > > The PDMA driver currently assumes there are four channels by default, it
> >> > > > might cause the error if there is actually less than four channels.
> >> > > > Change that by getting number of channel dynamically from device tree.
> >> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> >> > > > is no 'dma-channels' information in dts.
> >> > >
> >> > > Applied patch 1 & 4 to dmaengine-next, thanks
> >> >
> >> > Hi Vinod,
> >> > Thanks for your help and review. For patch 2 and 3, does it mean that
> >> > we should go through the riscv tree?
> >>
> >> Yes
> >>
> >
> > Hi Palmer,
> > Could you please help me to pick up the patch 2 and 3. Thanks :)
>
> Sorry about that, I forgot about this one.  I just put them on for-next,
> there was a minor merge conflict but it looks pretty simple.

Looks like you applied patch 1 too which Vinod already applied to the
dmaengine tree. And you changed the 1st line removing the "# " before
the SPDX tag which results in:

make[1]: *** Deleting file
'Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py",
line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py",
line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 718, in _ruamel_yaml.CParser.get_single_node
ruamel.yaml.composer.ComposerError: expected a single document in the stream
  in "<unicode string>", line 1, column 1
but found another document
  in "<unicode string>", line 2, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts]
Error 1
./Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml:1:1:
[error] missing document start "---" (document-start)


Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
