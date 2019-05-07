Return-Path: <SRS0=HYxj=TH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAABC04AAD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 May 2019 15:27:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0C7A206BF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 May 2019 15:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="beyNV8El";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kt9Gf4+Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0C7A206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC7bPs4O9STmof5i2o74SCEGxYwsGqztGiNOkgxPE84=; b=beyNV8ElSEhqvG
	vlGe7Mi2obEWAYLve1J8vw0P5wdnqjHUx8Yg1DYhv0vLKWxf7Ac0lR/Pqx/PelaylybBkMV7lm26z
	NypYJUx3/YqcBT6EbPdcAVt2lMCiNLEThoISMnPMk2wfAjwODzvTcpM9FFtUaHwWOy+3QVXTLFYNM
	HgNBbbxhNuHYtc977ic/6EqcHIs5+j3NsyPCunu6kX4FNTb+F4LLLyVTvam/HUKfCAezb73PacZpo
	/iEuk3gNB3IdDuYugbw/I+tOfhOJTSRdbzTEC8IdFgUx+D4pDthepCH0lKtarDR92KakGSJ7ZCi37
	nmcCHPjwoi2P53gefHaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO20E-0005PS-Kz; Tue, 07 May 2019 15:27:34 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO209-0005Jn-4M
 for linux-riscv@lists.infradead.org; Tue, 07 May 2019 15:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hYYkSXMEcEBMKHDB90Je/x8ZZZjEKeotZ0mixjMK64g=; b=kt9Gf4+ZTrnA7nLbv4sc7uXpX5
 fR01d6vMlSFr0ZCtOCi6xc51xhgy4yzS9nstdzEYAMbhvCRhS+tPsbxxIDUZagjzNhV8Xz61WROhJ
 wXc4OPSXvPQCJkESOzc/gEPACCEXRgR1Gtze/ioMOuX6UmEm+m7aQUosPz9p7n6L41o0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hO205-0001DO-Ho; Tue, 07 May 2019 17:27:25 +0200
Date: Tue, 7 May 2019 17:27:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 v2 0/3] Extend dt bindings to support I2C on sifive
 devices and a fix broken IRQ in polling mode.
Message-ID: <20190507152725.GE25013@lunn.ch>
References: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557242108-13580-1-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_082729_319348_723F9D2C 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, peter@korsgaard.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> The information transmitted is intended only for the person or entity to 
> which it is addressed and may contain confidential and/or privileged 
> material. If you are not the intended recipient of this message please do 
> not read, copy, use or disclose this communication and notify the sender 
> immediately. It should be noted that any review, retransmission, 
> dissemination or other use of, or taking action or reliance upon, this 
> information by persons or entities other than the intended recipient is 
> prohibited.

You need to remove this. It is nonsense anyway. You are mailing to a
public list....

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
