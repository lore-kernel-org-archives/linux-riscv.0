Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BF8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKibaQ56LktA0BSvqd6NAt0H+xmomLCdXeC7Z0EBmsU=; b=RvLdNn8QX7NBPT
	2Ls6i4rYL8trskTUn5x/v9PHSC8KnDru5i2o6dH+BrNF+ydaDiakK6JCYq8D5pevPaN2rWmkKzQxH
	r1VRa2UNxRrnd0yxzAkhtn+9Y7dlJeadPSS5S3+P8JPGjHQI4htsE8t1v+udeXAsz7cfNVx5hGvNS
	IjtaBb9V3zWe67BshnwWNgqfh1kYXtw5udlypotJkgu0r2ajLno4AYP/Hr+RcYRqnMTcLHr7zvOCq
	bgCq7PdyxaS8bDidnfk/qD0Th7Qqh3qUVoRkdo3+vZ+N42r5Ue4V9DIwqOb38B3OT+UXUDDw94Kxi
	97e96EXoWjzvkXpJVg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osO5G-005MMT-HE; Tue, 08 Nov 2022 12:52:06 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osO5D-005MLM-Cp
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 12:52:05 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id ACA975C00CD;
	Tue,  8 Nov 2022 07:51:58 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 08 Nov 2022 07:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667911918; x=1667998318; bh=sHZw9c0S7+
	040MEW27mcXzSOhH0nluqzkCZq3pEorpM=; b=RANKIYPKCPOmGyaXcbIv9vT1vu
	r1J3fbfci0+lnkg/1DZxe6HveVhRNGLuhtB0UKIGhfR757U2HKcodz44xfUSTPSs
	9oqNQu6P1emZPI/DH9uUGKilRomtGb8LX4EopH7oz1Cw6uqx2ZuApe9b4fG1OpIe
	kGaksJmtdDdlKCq6kpWRyIETmRskAmrfu40WMHrdJbUJ3f45ZEdEkLB0ammM9v7+
	RL1XR/eCdPeHwa4dKJber24i9NMaPv0Hd4pH5SvVvCoxHdGwEfQnANKBwp8l0Yvz
	oVfW9clgUvj6V9ISrypz6vNsgYT3sxUHJPf+muGS9ED1xpKiwXIp7h7rr30w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667911918; x=1667998318; bh=sHZw9c0S7+040MEW27mcXzSOhH0n
	luqzkCZq3pEorpM=; b=iJ0ytTxJBjYKlHSXsFV67916Fy29XrL56ggpf6egQXhQ
	rkr1BYnNVFvytpogiGyj2lBD1Ie1LpZg2Ow7OYkITNPwipcD9aI/H6m+U021N4hE
	Mtq8x+lXJnm9HzmY4VXeL4J0rkXUpruWckcYmAE5rE3spm35RRyXBZiV4YOWAVQa
	iSZC7ikdfywBdyOOd3A79wGFyakZUxOjkU+dihaz6d5jQtlL73Cf5iHkzjHyH/wN
	qhq5+1aNwM2mhplHw/DEhhsljV4CBiX8AwXanaYEXhcy8p6UH9tjPdKj1KvNKPTg
	mvLPnAjqWR/6OYSl90W/a9g+wQrX5kf00J3YAlPSuw==
X-ME-Sender: <xms:7lBqY3cUYhpkMA5t5ri_BRxc0SAVO5gWlMroGFKj0EtIJZQ1rlr2NQ>
    <xme:7lBqY9O8z7Ef5t8xPMlCWOUWyk1PcwKi_RkRH1uAZrUCf9yrLyI8GoM5d1FKGtEb_
    O_Ew8BEKZDKQ37o2VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:7lBqYwhQ_VxZTcFCnALrsYJ0pkGI0eW6Kl8PJ212JX0IqVE6hodyyQ>
    <xmx:7lBqY4-vBSqxDgV5hZH0rlsk9iZz3slzT_GFtdTDsaNemtqCrg5Org>
    <xmx:7lBqYzv-PRasWPeT_xiomELWV2SFhQmYj_5lFlR20VK1fKO5MQs3GA>
    <xmx:7lBqY3iFaQgHHBOWzC_OY3sYqtpJfv2MZUuKSNr25Rre-Zqqj66kaQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1075BB60086; Tue,  8 Nov 2022 07:51:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <f98d5faf-dd4e-46c0-ba55-9438615b434f@app.fastmail.com>
In-Reply-To: <Y2lPHzaHvpWjEoll@spud>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
 <Y2lPHzaHvpWjEoll@spud>
Date: Tue, 08 Nov 2022 13:51:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>
Cc: kernel@esmil.dk, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, linux-riscv@lists.infradead.org,
 soc@kernel.org
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_045203_762513_5865199E 
X-CRM114-Status: GOOD (  29.39  )
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

On Mon, Nov 7, 2022, at 19:31, Conor Dooley wrote:
> On Mon, Nov 07, 2022 at 08:46:00AM -0800, Palmer Dabbelt wrote:
>> This has come up a bunch of times, but I don't think we've ever really
>> made a decision.  Historically that's not been such a big deal because
>> the RISC-V device trees were pretty inactive, but that's changed -- both
>> because Conor has been cleaning everything up, and also because there's
>> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
>> this again at plumbers a few times, but Arnd wasn't around it person so
>> I figured it's best to just start an email thread and see how people
>> feel.
>> 
>> A lot of these new SOCs are based on Arm designs and the device trees
>> very much reflect that, so it makes sense to me to just keep the device
>> tree merges via as similar a path as possible.  IIUC that happens via
>> the SOC tree these days, so it makes sense to me that we start handling
>> the RISC-V device trees that way as well.  That would make things easier
>> for contributors, as they'll have one workflow for all their SOCs, but
>> also easier for me as a lot of this SOC stuff touches bits I really
>> don't understand and thus get kind of lost trying to review.
>
> Reviewing the Renesas/Allwinner stuff, it's p apparent to me that they
> need to go via the same tree for RISC-V and ARM.
>
>> Arnd: looks like you're handling most of the merges these days so this
>> would be increasing your workload.  I feel kind of bad just dumping a
>> bunch of stuff on you, but I think at least now the RISC-V DTS are in
>> reasonable shape so hopefully it's not that bad.
>
> Warning free at least... :)

I don't see a problem with merging this through the SoC tree, it
was always the plan to pick up related changes across architectures
where needed.

The MIPS and PowerPC maintainers have so far preferred to handle
the changes through their respective trees, everything else
has been in the noise. Looking at the number of DT changesets since
linux-5.0 per architecture, I see

7748 arch/arm64/boot/dts
6654 arch/arm/boot/dts
197 arch/mips/boot/dts
155 arch/riscv/boot/dts
67 arch/powerpc/boot/dts
35 arch/arc/boot/dts
6 arch/openrisc/boot/dts
5 arch/xtensa/boot/dts
5 arch/nios2/boot/dts
5 arch/microblaze/boot/dts
2 arch/csky/boot/dts
1 arch/loongarch/boot/dts

>> On a somewhat related note, Conor has offered to pick up the otherwise
>> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
>> change over to the SOC tree we might as well just do everything at the
>> same time.
>> 
>> Presumably we'd want to adjust the MAINTAINERS file in a handful of ways
>> to make sure patches end up in the right place.
>
> Arnd mentioned that that should cover stuff in drivers/{soc,firmware} as
> well as the dt, so with the assumption that that MAINTAINERS entry looks
> something like:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f18502372..03e78d2e5cc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17709,6 +17709,16 @@ F:	arch/riscv/
>  N:	riscv
>  K:	riscv
> 
> +RISC-V/MISC SOC SUPPORT
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +Q:	https://patchwork.kernel.org/project/linux-riscv/list/
> +T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	arch/riscv/boot/dts/
> +F:	drivers/soc/microchip/
> +F:	drivers/soc/sifive/

I'd probably make separate entries here, at least for the
drivers/soc/microchip directory, I can see that being shared with
architectures other than RISC-V in the future, and the sifive
directory should probably have at least a reviewer from
sifive.com even if you plan to route the patches my way for
them.

    Ard

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
