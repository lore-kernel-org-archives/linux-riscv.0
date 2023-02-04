Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07058C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVVc62AUJO0OCF1vs6QGb1/T1omknX57C+Q7/3pfgoc=; b=2P7xYRZ8hLFaCg
	ja1MBO1ZoYX1mKID/lY8Tpu93mTU9LIzUAnxkorz1gjRsiET4xc0HV+nqNWHuHHnnvkhojUK80pII
	4UZYpbzEvDUncfeM+uzaA5z1tlc+i0BFdYfQ2bGRGDH8NhwUvNFXVh2oIdLF6t0faZbs7vHBsKRr0
	O6UyR3pVOW7eKymWGxzffcOrA0ijXU+/JVIuCtpUBs1Ihs3+5++gt4HL3aU5jbxKkhGfiWczWwjQz
	EMAyhpsTM2rjsRgt3Gu1mTvCrgo6Wv4NbhPfcJB/wbz27m9YzZeJ5l2uZg4rjaN6g/vH3Cx/ZD1hc
	qWP57qgq5Y51uVoyhqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOM9k-005Qpj-Ea; Sat, 04 Feb 2023 17:16:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOM9g-005QpF-PN
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 17:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Rz2wOIqPJZoO1YMR0cT+YJTPsv/AXO3X485DH8BF1nU=; b=fZbe5zpPLTA1Jg2yRN6RjqixfX
	9cTWIUv5vfI1FJpaCr4kPo2trL/AiTmGcL8094Ii4hAgYKjaGRkc+L/sib7PxenptO2Lxt+8LisRl
	tE175eRIFdGTmCPiH50lsXV9Cjo2q99ILChfI5QV4udEmW5QkK5gYMgp1uB409+EHDmI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pOM9c-0046CH-PA; Sat, 04 Feb 2023 18:16:44 +0100
Date: Sat, 4 Feb 2023 18:16:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Conor Dooley <conor@kernel.org>
Cc: yanhong wang <yanhong.wang@starfivetech.com>,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v4 0/7] Add Ethernet driver for StarFive JH7110 SoC
Message-ID: <Y96S/MMzC92cOkbX@lunn.ch>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <Y8h/D7I7/2KhgM00@spud>
 <81217dc9-5673-f7eb-3114-b39de8302687@starfivetech.com>
 <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <958E7B1C-E0FF-416A-85AD-783682BA8B54@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_091648_841661_5F42040C 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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

> >For the patchs of yt8531, see [1]
> >
> >1 - https://patchwork.kernel.org/project/netdevbpf/cover/20230202030037.9075-1-Frank.Sae@motor-comm.com/
> 
> Please put that info into the cover of the next round of your submission then.

These patches just got merged, so it is less of an issue now. Just
make sure you are testing with net-next.

You might need an updated DT blob, the binding for the PHY had a few
changes between the initial version to what actually got merged.

     Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
