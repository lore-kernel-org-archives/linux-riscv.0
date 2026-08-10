Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8996C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=stlJ/h3IwfoLUd7NqDWTAXy1FEXD0OvllzuhneSRslM=; b=W7CZ93Sqfdc+fbXlK/E3mUAVDr
	ke1yvsNoELOCatxEHOm11HDkcmQ4wntViZnBQupI6hp2IebQ93/Zv56/5kEW11e9f7Y1Tmy9SzaCO
	mlCVxqAYJb1mQcoQEJv8Vdp5MY89BbzSlocrDzLBn2/Zwwln/O+3skMTwuFzIFN53tQ/8xXEgBvCu
	9TtAmi40h1yqg8l4TFXyWkM282t+BJ+TWnVx9hViUgSrGl5GWkjp8EM5Ka7r+S3ddvcF6/giKr7AB
	dWch/BJj3GGTDTxVBiexHBT11A+5lsRsiyBTkD7Gosn2kw8cM24TRdJMY93yO6ErCCb34Vd8lzQFg
	Yme57xLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT8I-0000000CR3a-1NiL;
	Mon, 10 Aug 2026 16:45:50 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtT8C-0000000CR2X-0NBb
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 16:45:48 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 60C4C14000EE;
	Mon, 10 Aug 2026 12:45:37 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 12:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786380335;
	 x=1786466735; bh=lpxjE5U8J1K3KxaaMGrkfg/EbIve1p16Oa+TwcKUQJw=; b=
	fVRPtGdow0C9/90EWbNdadH+EGbiMHOFZLkeHD8eg+p7vuVYvDe+P67slQZZPxYk
	ks/HpwB2kgKDlSahkJIBwQEvkXA/hNGn3YergZM9In/1PDFcqhur1NZgiWQQ8RM6
	1rynD85Lyb6i7tl6MppiT9DknY1A0XlAgaZWrJj1b3u7NoFVdozIb3AUXYkatWqt
	M5f4u3mvmnMJVO3qXiItZonxbEMyUSTN3G9w1yO189uAUeUqqaljvCiS07VSXY2d
	exd8Vs5wGgWB4O03obOy3T8s8xHyxSc1CPlYkvwaA3EfzWTDqFINw7b/a5zp8/fU
	v+EI91H/aE40P1beJIUSyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786380335; x=
	1786466735; bh=lpxjE5U8J1K3KxaaMGrkfg/EbIve1p16Oa+TwcKUQJw=; b=A
	p+DSVmkR9hn9qbnmhH6a/tKP+BRmsJz/KO9EHE7RhEUe4vc1WWb1dR+yE7zCpsW5
	4wi4kj7ZQFot7nsV+ZjaoOGPr/maOZybnAsMjOJPcLDTEjode69OTWGDUvkZPzdV
	IWnYV9exbbPzEnayMU64sq+qPseHddHG9EjRdNkXIRNJ2mS95OsR4SNwZnEP/tCi
	XD8tnWi6rKLYmeoXJaENmIshfWfkdB4aZAAsGpWZO3FZgsccbbNlloENDOCgj3f7
	cD1uXAAvu41yYKRcUQPZIebZcLkX/lWbFCfdVdUhUMBzMLl9K5I2gCPdScdKjqup
	RPtwos+NeCdbGWWqmXWCA==
X-ME-Sender: <xms:KgB6alLxXu6lMZ_S0ZcgTilhUxbIaHgSPoQLcXaENgyxfw_kP3MyRQ>
    <xme:KgB6ar8_YzrQaxLGxIdNZehkkF3E87ljzYf_-San8cxnDVa17Lss596neBjUigwRW
    AAp_u1wTHIYvTPrXGbTkE1bOo2eOpWnKSFVY1slLgE0XIfBMeHgKAE>
X-ME-Proxy-Cause: dmFkZTE6+zm0femYuKAaBiSTN3t/qVF2PQ4JVfHQ2fZoZuE0cyTUNsP2k6o5+nHfuCMH95
    mJxixU1Oiy8PJb69mxdjfMUBKXaIz6Uc0GEQ/R197Zy5LtCLtKsJ3zWJP6tqbur5ehJ9w5
    XChmra6Hf6+1/snHFuUGuOKMET6DoW6nSydO2qnV/4PN66GoBy1qetVCuZGUeMIUcxE1A4
    7RvwaVZf8JHBa26e35oQgVsYLL9VbPvI3Gy0+WrCD8xcy7J2RYjQbHFgXZJMmV0vDHMxdA
    VifjCmZeujfc4bc72AI03xaqjT8rh1dAE9EPQlxk9J9UnuKwYCnPPEZB6XTteyVLzObeGS
    0c1BA8p63m/a71VRo4HymxfhNqW/6v4J7lJZYLs0SEzt4pjNQqoBth+hNt6/mNfxuOsxAp
    Uvex3vA9KUkjDnLYN0wk3tbpMlg4LmuolHC61SDXOsWQyMW+tlQ9yvuEVotkmwymH9gxTu
    NFVqMFJbfLULIZHuVMfQ2eZENgpm5GLGucUdGdwJDEUP2u2S27FBB7ckEQ6JZ3BwoVFghk
    L8YufGDA20V8GvqA42O5B3OuS//SRluF5G+4TD76yIfvsucwQYNMNUEGs0xI20lFnVk30J
    aVpgh9W8RButhqYbCD/dZosSLczykYNjVLmX4HJG5p8ELr7UxReGoQwGNV8w
X-ME-Proxy: <xmx:LAB6ahLkkOgmyHutDAG2nqvtGK20Ns5asWK_CI84SHnsY3EbrRfHyw>
    <xmx:LAB6apJF6e_t5lEk6oyKulKiltTMKp5ZWGy3n-ZG7FSOaujKh42BOA>
    <xmx:LAB6ar4bL_wYc_yPStCPb3hTojtcalRnKjUgzC5t54Bduxoi3MscSQ>
    <xmx:LAB6ajdk1zyDXjn19c8vGCeAjRezAE6uCElwdh8hLI2YGoUhaLGlAw>
    <xmx:LwB6arLPuL1NMgCL3IiPXbKUgA06cDfXBNnf1aGP17VoGqj5vxnlzhIF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4D5DC32A0066; Mon, 10 Aug 2026 12:45:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: APVFqOvuG48w
Date: Mon, 10 Aug 2026 18:45:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yixun Lan" <dlan@kernel.org>, soc@kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Message-Id: <93faefb2-5cd4-439c-a4a5-842ca5407975@app.fastmail.com>
In-Reply-To: <20260802024052-KYC1424545@kernel.org>
References: <20260802024052-KYC1424545@kernel.org>
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_094545_588332_58B36FE0 
X-CRM114-Status: UNSURE (   4.74  )
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

On Sun, Aug 2, 2026, at 04:42, Yixun Lan wrote:

> Troy Mitchell (1):
>       riscv: dts: spacemit: k3: add i2s0-i2s5 nodes

This commit caused a build failure, so I reverted it for the 7.3
merge window:

    Lexical error: ../arch/riscv/boot/dts/spacemit/k3.dtsi:1181.20-39 Unexpected 'CLK_MPMU_I2S_SYSCLK'

Please make sure that each pull request you send is free of
build failures and warnings and works on its own.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
