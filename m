Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E2DE7E622
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECRo6ebEDGu7s0BmzNx9LFLMYKezIc6Wg0CH2wL9UT0=; b=GBuohliFJgdfL3
	e60NoNMRp3qxiOK5x74jjm3ke3wulMtUDiZjbTGVaBG7ZePobHJUBzgZ+uJ2iNzF2ip2hgv0c9wz1
	hpmB7N0EsQdS0uFuFeTcDJJ73Qq+Z2CQrKSLz1jw3ZL3/ksKANwt5Bdmr1nngpDDHs7MpiDtrDgPa
	K4chtNaT07IMvWx1p2EVtWbMo+q457+2idCB8RMm+H++i9ZMBHm9KZEp/eLYfdTL2Ce8YJg95iRL7
	id/1dFpfR/mprzhdU+2d7xEpplcCJ2HB6FuLxMZkh9ZLmSbId4gKLlxtr28uULj+Oie6czQLQq26b
	xj8I60LssFPfQpk8v17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6BP-00GFty-2E;
	Tue, 26 Sep 2023 11:24:51 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6BM-00GFtA-2M
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 11:24:50 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 27AAC320091E;
	Tue, 26 Sep 2023 07:24:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 26 Sep 2023 07:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695727482; x=1695813882; bh=8e
	yX8AE9ekmLAMHsyT0GeS5BenFeWtINVJaFHwwMKHA=; b=cx8XGgkMMAcNeF+sP0
	Xg3n1R6IWF1+SXDGfWQApF4gZU9gK98wjZ0TUjZLFzYcgq8P2RRJCuEdBdODa4hG
	LwKYI47Zd+dAN2sC7uN5feNdegP+GZb7mb4cJX3pFg4zNHKKCNFUQVkLrJt7eOGy
	av9AhHq7+EzE3QAK4jK325rz1w3OUvVLfAw7DSQa/RpNs7kW2gOSTtEgEjLwdWtt
	7feAoyTVZ6ZTf8BytvH5XSxMWdPKa/nb5dXvC6xyPHZVayjpYoBqiW4jAorTVJja
	tKWHNOJnDGBH7Oyl+MKk4DD1HRisrJ2FlsDSQ2niXV/P7ghs31CB4+l+dtJ2ytA4
	zyTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695727482; x=1695813882; bh=8eyX8AE9ekmLA
	MHsyT0GeS5BenFeWtINVJaFHwwMKHA=; b=pKJsOAmfVoi/4sfxkVCOWL4nh8SdI
	vTNfaOPB2+Cy4Ja/lQ3Dgdcqqf/JHimuqu1zmUPu1MzuyGpR4BlyFO2fOSqdBrJD
	dG/SXyM6XoU2sGTJ/NWIMZUJyoecgPZl0b6nkj8lpNQjaLInMfKBHXpPk9o0zZ8N
	f2+asD/QlnYjipjgbC2xO89dl7+ZJh/tBYo16z1ZVbUowwfDtPnG8XSWj18p/jjv
	meBDvYSJBIu94daupGg0yGr0/hZUoiL/siu6JSFMX15KLH3A7lYiXNIDrCUb5iLE
	h/XNs2TVtz2eqKBcgk+145ybDYVcHPe7ZyW0WxZitiwz6DTkzvjhbteiw==
X-ME-Sender: <xms:eb8SZZEcaTZMFMpYAflPbP6DpBY0f9Jbgp7wKzhigFCtCYXkqvNtBg>
    <xme:eb8SZeWLDfYUwqlJ229zBamM2dVDiNCtnh-GLyX9v_isYz0AZO3tkJodHRo2fUQWA
    X280YTNERWABvT2jh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddtgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:eb8SZbKm8HNdpZENOy-r1jGJ0F1fTPCpY5PTtvi6CyNDh_zlLriqNg>
    <xmx:eb8SZfFRNuDq8yK_KKFGXpTKP27IkbOjDlPtYdTHBP_Y0-oiCUp86w>
    <xmx:eb8SZfUtLwmWAwAlUgE5KB6vkv-NwyElt2tvY67MHACBpgfWmUA18Q>
    <xmx:er8SZSON_9QoBQ-aD3tFSwDaNYnpnNe3yTR1YBLYE5qoeHqhQ02ViQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 716E8B60089; Tue, 26 Sep 2023 07:24:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <a08e1cee-05e0-447a-b25b-6c2ebb116e8d@app.fastmail.com>
In-Reply-To: <fbb6f526-0db9-4bbe-9635-8cb55b4335ee@app.fastmail.com>
References: <cover.1695679700.git.falcon@tinylab.org>
 <fbb6f526-0db9-4bbe-9635-8cb55b4335ee@app.fastmail.com>
Date: Tue, 26 Sep 2023 13:24:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, paulburton@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Willy Tarreau" <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Tim Bird" <tim.bird@sony.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Nicolas Pitre" <nico@fluxnic.net>
Subject: Re: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support, part1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_042448_946491_78DA5C09 
X-CRM114-Status: GOOD (  11.52  )
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

On Tue, Sep 26, 2023, at 09:14, Arnd Bergmann wrote:
> On Tue, Sep 26, 2023, at 00:33, Zhangjin Wu wrote:
>
> It would be nice to include some size numbers here for at least
> one practical use case. If you have a defconfig for a shipping
> product with a small kernel, what is the 'size -B' output you
> see comparing with and without DCE and, and with DCE+DSE?

To follow up on this myself, for a very rough baseline,
I tried a riscv tinyconfig build with and without 
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION (this is currently
not supported on arm, so I did not try it there), and
then another build with simply *all* system calls stubbed
out by hacking asm/syscall-wrapper.h:

$ size build/tmp/vmlinux-*
   text	   data	    bss	     dec    hex	filename
  754772  220016  71841	 1046629  ff865	vmlinux-tinyconfig
  717500  223368  71841	 1012709  f73e5	vmlinux-tiny+nosyscalls
  567310  176200  71473	  814983  c6f87	vmlinux-tiny+gc-sections
  493278  170752  71433	  735463  b38e7	vmlinux-tiny+gc-sections+nosyscalls
10120058 3572756 493701	14186515 d87813	vmlinux-defconfig
 9953934 3529004 491525	13974463 d53bbf	vmlinux-defconfig+gc
 9709856 3500600 489221	13699677 d10a5d	vmlinux-defconfig+gc+nosyscalls

This would put us at an upper bound of 10% size savings (80kb) for
tinyconfig, which is clearly significant. For defconfig, it's
still 2.0% or 275kb size reduction when all syscalls are dropped.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
