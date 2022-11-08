Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C491C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BH4yamZEQNgKubycW6ClZa749xwqr4MOJbAi7Nw32oc=; b=dJ5IL+e7UitXi6
	9z35s0diomlpWEGYasLAhNB35LNnJS5iaOYZTEP1UUEm7hLgv3nE3CT1e9MBROhP7b5pEWs4NVNDK
	q6g26HyhDQ6tb70pGhBxsUuIZqzTlDsYczm7367AHqTfG9q1k5kC3MpFzAC+OSAf7fktBqo5OCBda
	MoPUkmnRGOSNfb2TzLPLXnLis1rxg8SQDTtggaTO3XvSw30UexyfUHAH28vTqrUgywDBVB4MNHnsX
	cbnlRxZ+J/imIf357wVMbz4LZMUNRCnv8rhvn3YhpSIkY/CMyUE0Q3jijHkiwLyHJihkkBxc68I3R
	qJ0t8KGdmEYsmot+HvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUHb-007qcE-7J; Tue, 08 Nov 2022 19:29:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osUHY-007qbj-Q6
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 19:29:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1518961730;
	Tue,  8 Nov 2022 19:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54715C433D6;
	Tue,  8 Nov 2022 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667935751;
	bh=nG53Ngx8dZxQ0QPTeQv9gyI7E0KrRpZ8mTEGFAPa2Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQG4SOZWhO7Jaszq6PVDU7ix/7bZ7v8dy1GPwsNtoN/+u2l4CRoEO9BoBVBxntrT5
	 5LH6IZjVnaxhnJLlILQn8+aMX7U1+RSlyWYzBWQ94BuDZWwgEyPgCdtGgngP6HcnzA
	 yRbEvaZR+F97w5exFjB7jiNUcPHXUHZRBlPuzwSOOGBYFFB79JydSERhKWJYPHsymt
	 mNt0s5CtcsNKVDhuqZs+0LG2LRTjfDKwh/81rUNhjs4lYJQD1Qlmai/w0NZ7wLVFdI
	 OqU+mM8pliwA9ehKOS1qQAw4nNmKiBGuzDMTOMeca1MK06ZSXfydY7I/PiZsYadz0F
	 hg6qZF/XhPo2g==
Date: Tue, 8 Nov 2022 19:29:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
Message-ID: <Y2quAB1zSGAvOFzD@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud>
 <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
 <Y17+pHAg/SBJAEXq@spud>
 <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
 <CA+V-a8utoDSKcZFdtJ0BKwvPfcvf0WVH2Va-Fv_-pKC1FOOVsQ@mail.gmail.com>
 <Y2lLpCRpTQL+0dsR@spud>
 <CAMuHMdXjZGTNM7pUqxwXd08bjuPEFUuUwKFGx01FVCqOGnc6hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjZGTNM7pUqxwXd08bjuPEFUuUwKFGx01FVCqOGnc6hQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_112912_905776_9331E25C 
X-CRM114-Status: GOOD (  17.79  )
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

On Tue, Nov 08, 2022 at 05:02:57PM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
> On Mon, Nov 7, 2022 at 7:17 PM Conor Dooley <conor@kernel.org> wrote:
> > Geert, are you waiting for an ack from Palmer?
> 
> I can take:
>   - [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
> Renesas RZ/Five SoC
>   - [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas
> RZ/Five SMARC EVK
>   - [PATCH v5 6/7] MAINTAINERS: Add entry for Renesas RISC-V
> (4/7 and 5/7 depend on my renesas-arm-dt-for-v6.2 branch) and funnel
> them to the SoC-people.
> 
> I can take
>   - [PATCH v5 3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
>   - [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
> with an ack from Palmer.
> 
> The rest
>   - [PATCH v5 1/7] dt-bindings: riscv: Sort the CPU core list alphabetically
>   - [PATCH v5 2/7] dt-bindings: riscv: Add Andes AX45MP core to the list
> should probably go through the riscv tree, to avoid merge conflicts
> when support for other SoCs is added?

Or depending on the outcome of [0], maybe I take the dt-binding stuff?

Either way, looks like an ack from Palmer is needed for 3 & 7. I can do
the video call version of a ping on that tomorrow at the pw sync thing.

[0] - https://lore.kernel.org/linux-riscv/Y2puchRvbo6+YJSy@wendy/T/#me49f1e779dee210d3ab6fc4bc308dbaed036e1a8

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
