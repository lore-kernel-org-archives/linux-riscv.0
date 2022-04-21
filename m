Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0438FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 01:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=edkNbwLhbMynqr6I5QcjN8vIUzKxmSXvzLPPlMoF1oI=; b=SEnQCyB963pwBo
	B4fV3KevoZJTsA83lK+SFzZe4b7bp3JhYeUlzTQRbV5eedcE829L0WZp0AfeqCqnG9VRER4dvG1N6
	D8wV1EDCxWGllFUHEdoR4MDUIzRMe5S/jy5dONATaVxGDeooBvtE4H2ogrMiqvl+NzMiulODfT9qM
	pqawrSezLdUGSQCn6mED5Az3NkUQLODzsyk4gBVDml/heTUMCi1vSEE4SP8nui2WeT0R6eVhs3xa8
	D2umbKmFMdJQ8WQmYmMAGK/0KdKAqRRBfkDqcEqKqkEnmBoZugQ5dLdi6TrKS+HQOimraXQEFH58J
	KrVnlUXcq08Q+eTei0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhLIx-00B0wB-VR; Thu, 21 Apr 2022 01:08:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhLIv-00B0uf-2A
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 01:08:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id w19so5964646lfu.11
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 18:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PaUnbNt+lm1u9yE5wisBRk3m4mxTkfso+o7EcsoYb9U=;
 b=mMgyk5nz/Y8n1Lj6vrQUNd5iJAn2E+0233wITVfUWqbApNDLFv2P7b27+6eSzJoWDL
 t0nahvOc6wJ15MiIpsKeWs0NrqXR9RXJkkBDs3+5092owdZdTLhhNj+VLA8H1rGYQhNB
 lXc9cpxs8m5Z3IuIVwneY0LQqDwM8QSs17KSD3OaJ5Hkkhve7Yzrv8XLkplj9scNw0Mh
 op+UpykXWdb3gRwDuvNZCqSStJBVDMmlmxRoZdim+0kJtGzaUFQ7AOdKSmt9q22xGyfy
 hzxcH+ZtySQMf/xAuovtiEg2lwqVUhpujH0WofcH75OafGIP6rnLjPmoGN7EKHwffPF2
 oQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PaUnbNt+lm1u9yE5wisBRk3m4mxTkfso+o7EcsoYb9U=;
 b=untF8cKyGM4QoCKP7jkbJbBW4MXJFLqNGcMczxcpUioxlD4jvwzA4gVpFYX7+oXf4V
 PVS/ch4vvVIb8Lfp6MqOHhkrKfEmPHuLYPqNxDwcAUkYva3kcU0H4ZtcnIihAYmc1ZB2
 iapqE41emJiHNRv8tXdUwe4sI0tpzw/lTs3/TDTqnGiBMBCVVkE00gaa50VAnJug1h6I
 /zWLGmc/FwMrXO3LjINricMBzADTZNsvcAVW5m1qWKD4NG4qYmWoBHCiq/l81tSz2B+w
 gIcbw6zttE/ue56uF/YPfgLfxh0fgUF/GG1s5ff+HroZ26JGPF4KRbw6XbQ7MsvOFaMk
 dDGA==
X-Gm-Message-State: AOAM533pHG+y7p9x6Ornz+lD95gyb6PvevNJA+xMXY5/u8N36Bn4Fvqa
 KJjV7L0RACMoFUV1zkTGIz0IJ9K8yQ9Es2l+ahTlPg==
X-Google-Smtp-Source: ABdhPJxhKAUyCkkPAjGWEELWh3qbbbzQYB5MSQk5Ht/V6TTVpoiQIzNDZ4iAXo0PDGcIqt8h6lJKcUanUp/MHHUasws=
X-Received: by 2002:a05:6512:1155:b0:471:4c94:97c with SMTP id
 m21-20020a056512115500b004714c94097cmr13816995lfg.338.1650503291055; Wed, 20
 Apr 2022 18:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANXhq0r15Z9NZj+xr7K_2Tt5VbK2r4+f7Fpg-f9BY98ufgKxcw@mail.gmail.com>
 <mhng-75e55594-c878-4fad-9ffc-dc552111208e@palmer-ri-x1c9>
 <CAL_Jsq+5TbfFxD3p4ckvNw=jFweuvjQPRQfjmvPqZJga25o0pA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+5TbfFxD3p4ckvNw=jFweuvjQPRQfjmvPqZJga25o0pA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 21 Apr 2022 09:07:59 +0800
Message-ID: <CANXhq0rYBCQyGK-zfKdU51y03dSD9XsPwtCqg8a7xvxYV3LL+A@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Rob Herring <robh+dt@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Vinod <vkoul@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_180817_131379_3AA7F06D 
X-CRM114-Status: GOOD (  26.09  )
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

On Wed, Apr 20, 2022 at 10:26 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Apr 19, 2022 at 7:18 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Mon, 11 Apr 2022 04:43:35 PDT (-0700), zong.li@sifive.com wrote:
> > > On Mon, Apr 11, 2022 at 6:48 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >>
> > >> On 11-04-22, 10:51, Zong Li wrote:
> > >> > On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >> > >
> > >> > > On 28-03-22, 17:52, Zong Li wrote:
> > >> > > > The PDMA driver currently assumes there are four channels by default, it
> > >> > > > might cause the error if there is actually less than four channels.
> > >> > > > Change that by getting number of channel dynamically from device tree.
> > >> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > >> > > > is no 'dma-channels' information in dts.
> > >> > >
> > >> > > Applied patch 1 & 4 to dmaengine-next, thanks
> > >> >
> > >> > Hi Vinod,
> > >> > Thanks for your help and review. For patch 2 and 3, does it mean that
> > >> > we should go through the riscv tree?
> > >>
> > >> Yes
> > >>
> > >
> > > Hi Palmer,
> > > Could you please help me to pick up the patch 2 and 3. Thanks :)
> >
> > Sorry about that, I forgot about this one.  I just put them on for-next,
> > there was a minor merge conflict but it looks pretty simple.
>
> Looks like you applied patch 1 too which Vinod already applied to the
> dmaengine tree. And you changed the 1st line removing the "# " before
> the SPDX tag which results in:

Hi Palmer,
Many thanks for helping me to pick them into riscv-tree, It seems like
we need to pick patch 2 and 3 in riscv tree, instead of patch 1 and 2.
:)

>
> make[1]: *** Deleting file
> 'Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts'
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 52, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py",
> line 434, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py",
> line 119, in get_single_data
>     node = self.composer.get_single_node()
>   File "_ruamel_yaml.pyx", line 718, in _ruamel_yaml.CParser.get_single_node
> ruamel.yaml.composer.ComposerError: expected a single document in the stream
>   in "<unicode string>", line 1, column 1
> but found another document
>   in "<unicode string>", line 2, column 1
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26:
> Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.example.dts]
> Error 1
> ./Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml:1:1:
> [error] missing document start "---" (document-start)
>
>
> Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
