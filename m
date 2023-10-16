Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60538CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGrLe7GHc0BqWqGdHrPYjWE/CXv+OgKXlGxM4fT1T+Q=; b=tLztuZsiRZyOc+
	GW2UEVRjFK3+1NV2l1T6/G/WCA5uWQYB2nHAUdWHv090yvr14/g0i/HuZhXAGacHjJH11y71nnhC0
	pdcvHOqa8nNBB38OpOUeu/tvfH6oqRPp9NALsIlIhjNkiPxuSaRE1xxxckKW/jZenNJXd9jUqnREr
	a4p/uQ46Pz8eaOqMTz9Ymi8cLMmM96Z+ScP18Fj71DedjuSga6I+9jZxaRc+5JRWQsnfkQW44qUDh
	YfrLem+6tZwiraaiCOpNFWVZxCzbx0YHFRlfC//ziQmMyWqRw56mbprkw979FZk+HmgQMl6SSTKis
	47rrZRZWYF5fz7O5j00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNc5-009jpE-3D;
	Mon, 16 Oct 2023 13:26:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNc2-009jnr-1l
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 13:26:28 +0000
Date: Mon, 16 Oct 2023 15:26:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697462777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PnR2Spxg+qAwbstIwvkCiT/Z2Jf78hlNE5OSASBp5cA=;
	b=zI+0mF1Qswowds0i5C43J6iq1G+41ReV2qIY+3rexpII2s2Me+iWvv/nzsdrEfCq8TNAm4
	CJHLlEwhdzyXrSr/3NJ4K4lT1q3xJNnvj/vHeTQtqf6INVmxqL66RFmNoAEoZWNWOldOTy
	tzCvqVKBNNJ3wnsV0qiVFAGsRnKvEbRLK+SxTHtq6ib3GShLuynBvSKFfz09Sh6+KzTRIU
	1X4mGV/GgAUbEkP7IjXljgOLnIb7NmPe7sVbM/Y1vA6FF4Nzx13VgB6glDqy4hxWD8ws7G
	9OLRKjC+2xUcSx3LLX5RZGbu5cUT+Sf87qePGpD8cy7z8Vv2HgLpDci2tlME/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697462777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PnR2Spxg+qAwbstIwvkCiT/Z2Jf78hlNE5OSASBp5cA=;
	b=3KHGM2bsnNxuHq6VrbMC80846B1xrqMxhBPYUiiIw+Sb3lFTdIpk9GBjo1CF0wTUcatKp9
	O/GupTTF7UNHd/AA==
From: Nam Cao <namcao@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231016132613.m8o1+AMG@linutronix.de>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
 <20230709-rundown-unsettled-403e8bf5cca5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230709-rundown-unsettled-403e8bf5cca5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_062626_749717_8E58ECED 
X-CRM114-Status: UNSURE (   8.77  )
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

On Sun, Jul 09, 2023 at 11:10:47PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Thu, 25 May 2023 14:18:36 +0800, Jia Jie Ho wrote:
> > Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> > crypto dma engine.
> > 
> > 
> 
> Applied to riscv-soc-for-next, thanks!
> 
> [1/1] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
>       https://git.kernel.org/conor/c/1fcaaa1d489c
> 
> Thanks,
> Conor.

Sorry if it's a stupid question, but did this patch get lost somehow? It
hasn't made it to Linus's tree, and there is this message in your tree:
"Notice: this object is not reachable from any branch."

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
