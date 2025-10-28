Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18982CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVf0NjszxGylq6iRWMOZYMwsCurQhtxonk3LuzCxwQg=; b=h6hGCD8yamVMjM
	lk0fMum7KF1+oLsnrRtricUdx7zgaqo3BqLDGKlNs9w9312gs1qXk0/rRGtUktyCqiSBiYGeNfEWr
	LbNN2b+gbTsixPA207nzFJR2DEnksUmF4YEJBLohNmlrnCTOmJeJa46sv7IayXvEZcWhs0cFBc4lF
	9hNBU/GWYYIRZIDUV7UuwULWOgc9Nka3RsePgYemvXG1sHK/S+swe8A6s6Zx479PbsdvDU+2FC8gS
	298u+9pxURdl63f+riAR+Lc6LZMnWDFyWS9CWn5Vy0OgJLPnNBMSJMWG4bXWaODTLU8Xz2mRPCZ+3
	hXSacqMXet/vEf9xFigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqtc-0000000GepM-2IIu;
	Tue, 28 Oct 2025 21:06:24 +0000
Received: from out.bound.email ([141.193.244.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqta-0000000Geov-0qCE
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 21:06:23 +0000
Received: from mail.sventech.com (localhost [127.0.0.1])
	by out.bound.email (Postfix) with ESMTP id 341EF8A0A03;
	Tue, 28 Oct 2025 14:06:19 -0700 (PDT)
Received: by mail.sventech.com (Postfix, from userid 1000)
	id 1C913160036F; Tue, 28 Oct 2025 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erdfelt.com;
	s=default; t=1761685579;
	bh=MG2CHoxJgPs5SpTo/dvhA7IRWSaF2xM68nlYgIMcDJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcn4Qm+0JCJsdorJ1JBiojYDHyMW7YVNCTmSHHHY/FrNV4YTHwhpO+kiX5dWW2tXs
	 KFzHhV5TWX0wT97cjNNlL937Bgtwe3Yp1QXofXDtpA81ulz7ppYxfxYOE9H4Pegqib
	 Z7fXwUy0Fyyf5PSq0/KK2pYIjzY0JiEvYCMCgxN0=
Date: Tue, 28 Oct 2025 14:06:19 -0700
From: Johannes Erdfelt <johannes@erdfelt.com>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
Message-ID: <20251028210619.GO15521@sventech.com>
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_140622_381878_CB72D19D 
X-CRM114-Status: UNSURE (   9.24  )
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

On Wed, Oct 22, 2025, michael.opdenacker@rootcommit.com <michael.opdenacker@rootcommit.com> wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> The OrangePi RV2 board ships two RGMII ethernet ports.
> Each has an external Motorcomm YT8531C PHY attached, the PHY uses GPIO
> for reset pin control.
> 
> Enable PDMA for the SpacemiT K1-based SoC in the OrangePi RV2 board.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> CC: Emil Renner Berthing <emil.renner.berthing@gmail.com>
> CC: Yixun Lan <dlan@gentoo.org>
> CC: Vivian Wang <wangruikang@iscas.ac.cn>

I tested this patch on my RV2 board. I see similar iperf3 results.

Tested-by: Johannes Erdfelt <johannes@erdfelt.com>

JE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
