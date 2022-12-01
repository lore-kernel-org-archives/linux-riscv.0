Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B445C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg6yPDOn2DmkCAvmFd2QZblgaDv1zduB7Eb+vl2b+gw=; b=HMg6XYPeXl27Tk
	0BNmYm376Z6n9WFxgiKLdpN8zl3bcDdHkUl+z08OHRXo98SWQLMwvgexuENX+bdPFpecNmY1jrLhN
	f/cm5PLKvAp2LgB9vOCwEwSn6rtfhC3FgnryChYd39H1TU+yeHB2EbhLRzfTrs1Tt4CbBQW3ord1i
	CZtkGI44EeA2dxcwcYNWdyYkaDBat5XfHHcNkgX3vc6hojWVyEDDkCA5qGkxBnJAphyrNBdt/lQ6L
	CvqibAfo3g3kK20mnuHmMPlhcqzQ5qIJmoMlA6Q5zEMp21j68SzbKVu8wnussPXaeAC2K60SJ17tP
	UV23JRmYrwJh3RFPDeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h7K-006pu0-N3; Thu, 01 Dec 2022 10:48:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0h7G-006psT-VZ
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 10:48:33 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0h7F-0000rr-68; Thu, 01 Dec 2022 11:48:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, aou@eecs.berkeley.edu, conor@kernel.org, corbet@lwn.net, guoren@kernel.org, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Date: Thu, 01 Dec 2022 11:48:28 +0100
Message-ID: <113066935.nniJfEyVGO@diego>
In-Reply-To: <20221130234125.2722364-3-conor@kernel.org>
References: <20221130234125.2722364-1-conor@kernel.org> <20221130234125.2722364-3-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_024831_036970_8FAF5E91 
X-CRM114-Status: GOOD (  10.18  )
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

Am Donnerstag, 1. Dezember 2022, 00:41:25 CET schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Ordering between each and every list of extensions is wildly
> inconsistent. Per discussion on the lists pick the following policy:
> 
> - The array defining order in /proc/cpuinfo follows a narrow
>   interpretation of the ISA specifications, described in a comment
>   immediately presiding it.
> 
> - All other lists of extensions are sorted alphabetically.
> 
> This will hopefully allow for easier review & future additions, and
> reduce conflicts between patchsets as the number of extensions grows.
> 
> Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
