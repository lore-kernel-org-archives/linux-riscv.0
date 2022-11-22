Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BF9C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnBx6UzfiiYfNlnu9bLTFOVaZG06sleBs9eGbuTNcH4=; b=cKk9puzDw6cVLT
	wdARKPTc4JgDUtcrYM9f2yKSHMfzkQO2pLEwGaVXjiVYM7n78ki2iu2U5/YFecOyV7czMhyojeQGV
	IMhu4wHWl2RVz30o+ekCNLpfe3EZILnBzqWWMDI4oHBtiQIzd2gmAneVduY0Fap84845Otcu1lO21
	FXQf6V8P1V5DJOMigbwpN/rqOcXfEDln6uQ5n+v16Qdqz3eFoOauh1rZtmhMP0w/pOjG2sfoN3ixA
	LfmEmSJdE4G1CYHM8yPy5PBR+4c+gJc4s5czAn7KiPR1ZqNVqkQNJNgy/kvg6Xi+lVoDVtnDBTVfZ
	IK9dW+97zybMPhXes0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVpt-00AbiC-Ec; Tue, 22 Nov 2022 16:09:25 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVpY-00Abb9-Jt; Tue, 22 Nov 2022 16:09:08 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C39C95C0227;
	Tue, 22 Nov 2022 11:09:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 11:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669133343; x=1669219743; bh=wZK3t3HJow
	uFDWWGw35sZXrKQvEJ+7CgMyEoa9LFdzU=; b=VJe90TpP8RTK/QIc9GYtYkcCUZ
	+dEh/AVzio7FnM6vOUOGILTy/lJLNmo0eUoaRKaNX7wOMNDcj6PGsLzJdTKWIA1Y
	ocL6zpc+LmWdC42Rv+vRiDp2qo+rMK/XIxkUIA5/5B6moDqi3JA2tIArMAXKVI5Z
	y+w/3ANCtq+anryHgvhan6n7FNKAI/qagkicw5BqSnF58oR1uRSOIDcIKbBJvlMv
	8ZR2kkDXqeCR8yMqw3O1QlH3/xQV1iEva4MJPhWidiQLRRPDRbN/CRPDtgEGRn+r
	yKO+X6qSrDfHn9eMGl51NT10Fy43tHcDMYXosb/i32a5tteD94Bvm/dzxYZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669133343; x=1669219743; bh=wZK3t3HJowuFDWWGw35sZXrKQvEJ
	+7CgMyEoa9LFdzU=; b=syTAPF1p89+UW5y1g6ux+3sD01Vq+0vTrH29QD0K56Q4
	4qlJyDdoP4QdH+3Ne2ukfRXOs7dE9f7PsBchYaHujQSBiQGEfTLGY5WNP/LhSLiw
	MhJwu+fXEAtn8IjpK5r+Jf+vMNN88ucamngzqACpvy7pcDIUgDeVr9jnTS0TnTio
	QmG/fCHy9SSCmedyJ9CvT07WXj4nSYJGyRGfCmfu/DUze087J3thanMdugavbvmx
	ZHfEynqK8XaTfHt+MySem8E94qwhF34IVcJUNto3y7UGAM5raXJ3PC5Z+AbpqmhS
	Ho3RpZX55HGGjD9p/Ymsed1kWAJOOk7g416Ej2kZUQ==
X-ME-Sender: <xms:HPR8Y59nahcNQlPbRSw2ZhLllrILxCqX4KptV1oAoRkZtWv-E8kglA>
    <xme:HPR8Y9sU8UHwlomzmoxPTqd5rvcLHOKcu0mnpWMfPIzxkrAT4b03uBHVruJqPCS7i
    zanDoEMJKY0BG5n52o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:HPR8Y3D7psfHuByn00UQVGrx961x3zFJEapQKjIcu3rqRI0b0FHAVg>
    <xmx:HPR8Y9caIzjjfd0VGUuHaKuBB5_Gb6nO8tKKXtbIUeRx87TMG_X65A>
    <xmx:HPR8Y-Nbh92Kn4Jb2763cnBuB_dd-6WEXdFdZZ3oGRzggfFjaOOV3g>
    <xmx:H_R8Y612vjXIUfBgPxm_w4drjL-43f0_z7tiu2wiEghZoXvTUB-yvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 76F69B6008D; Tue, 22 Nov 2022 11:09:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <9ef883a8-6832-4242-8687-0a07ef8f99d2@app.fastmail.com>
In-Reply-To: <20221121171202.22080-13-vbabka@suse.cz>
References: <20221121171202.22080-1-vbabka@suse.cz>
 <20221121171202.22080-13-vbabka@suse.cz>
Date: Tue, 22 Nov 2022 17:08:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vlastimil Babka" <vbabka@suse.cz>, "Christoph Lameter" <cl@linux.com>,
 "David Rientjes" <rientjes@google.com>,
 "Joonsoo Kim" <iamjoonsoo.kim@lge.com>, "Pekka Enberg" <penberg@kernel.org>
Cc: "Hyeonggon Yoo" <42.hyeyoo@gmail.com>,
 "Roman Gushchin" <roman.gushchin@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Matthew Wilcox" <willy@infradead.org>, patches@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Conor Dooley" <conor@kernel.org>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 12/12] mm, slob: rename CONFIG_SLOB to CONFIG_SLOB_DEPRECATED
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_080904_814272_C001F7FE 
X-CRM114-Status: UNSURE (   7.77  )
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

On Mon, Nov 21, 2022, at 18:12, Vlastimil Babka wrote:
> As explained in [1], we would like to remove SLOB if possible.
> ---
>  arch/arm/configs/clps711x_defconfig            |  3 ++-
>  arch/arm/configs/collie_defconfig              |  3 ++-
>  arch/arm/configs/multi_v4t_defconfig           |  3 ++-
>  arch/arm/configs/omap1_defconfig               |  3 ++-
>  arch/arm/configs/pxa_defconfig                 |  3 ++-
>  arch/arm/configs/tct_hammer_defconfig          |  3 ++-
>  arch/arm/configs/xcep_defconfig                |  3 ++-

These all seem fine to convert to SLUB_TINY

It might be a good idea to go through the arm defconfigs after
6.2 (which will remove a bunch of them) and check which of
the others should use it as well, but that of course is
unrelated to the mechanical conversion you do here.

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
