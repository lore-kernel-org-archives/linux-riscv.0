Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459BC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6pOWAmqft65lmub2CtoulDObycjPfEoLkv70W+Bz0Q=; b=tdOYpSjShStf9/
	THfiLDxChXqaHQtUzA4HKPoEwPePwaoBEkaryCHxsWDCgMGpcSXid3flEw9AGWcHmUCajgns74Blp
	MwreKvlyQ2aQziXe16h2RfqByCW+Xeyn8N6GIKMJOm7D4GzA3adTXOJ+XG8LwBt/ov6+y7ptjZFs5
	XzASdoHJxZgIZpvYZca2gWHUJlK3jEGgly5ov423xWup4JusdyIlXr6/LO4mMHv6fp85IrhIs09Fa
	xDVMH2jwqbYbsVQvWMyJAofdwPMk3jfKbliYMMBOvIVize7QFAb7on4ogg4VDyr+aLI77fdSwsKy+
	v7742ZrOKXCueFbNelVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv3GG-00BuJy-1W;
	Fri, 05 May 2023 21:46:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv3GC-00BuHm-0t;
	Fri, 05 May 2023 21:46:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2FF1FB;
	Fri,  5 May 2023 14:47:17 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42D1D3F64C;
	Fri,  5 May 2023 14:46:30 -0700 (PDT)
Date: Fri, 5 May 2023 22:46:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
Message-ID: <20230505224611.00c281f6@slackpad.lan>
In-Reply-To: <CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
	<20230505105805.548d1a1b@donnerap.cambridge.arm.com>
	<CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
	<20230505170015.664c18bc@donnerap.cambridge.arm.com>
	<CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_144640_365968_65EF2E58 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 6 May 2023 01:25:02 +0400
Maxim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maxim,

> > Can you please try these patches, and use:
> > compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
> > for the compatible string?  
> 
> I tested my patch (with compatible prop changed to
> allwinner,sun50i-r329-spi) on top of these patches and it works fine
> for me.
> 
> > If possible, you could revive this series, and add the D1/T113s support on
> > top: just add the compatible string combo to the binding document.  
> 
> Just one question. Should I do it now, or is it better to wait while
> Icenowy Zheng finishes work on the next revision of this series?

This series is over a year old, I doubt she will jump on this again any
time soon. So it would be great if you could rebase the patches, keeping
her authorship and Signed-off-by:, adding your Signed-off-by: and
posting them.
I might take a deep breath and try to solder some NOR SPI on my MQ-R to
test it later on....

Many thanks!
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
