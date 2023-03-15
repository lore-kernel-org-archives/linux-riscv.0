Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEACC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yBsjaokWFT732/kwvtNJm4PKLctI9IDOZ7k4Q6eKDQ=; b=oG+V6yT9SQvaEv
	3XxsA/oj3ffvw/cPjIXVyEoP5H26bFYQc+q+MYTb0xTztND6Sq87yPztsjueDv+0WbnvqFqysLIIH
	LobtsyWhgXPERvtVb0lCmGMsBps7brcbWeU+LwXFDrFKmSXf3BPj2xcGcsd7kxwOA/qQarfTT4ysq
	2xOcH1ORfyeY88GzYC+vwpTYpfvwvc7lsmKRowXxrgaYRG1gK6j8yT8PqQPdp0zbbsD+WxG3W/EAs
	/waA/VHnIdMjiOnFIc9sSUzFhFzUCgRrZOpS36ROJ14dl6nXQOjbe3l4ZaNx5l2SApwCTR9sBXyaM
	e71tgYr2mhGeGtDtmJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPY1-00DDYI-2K;
	Wed, 15 Mar 2023 11:44:01 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPXz-00DDXQ-0G
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 11:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678880639; x=1710416639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KST0rCAJhGL/COIU6hqmVN80y0QSSX7J/nA1+/5MpLE=;
  b=XhD118couNGLixAtPC42mUznT/gKH6mrjEwlQd8DuZuB7DdOnvdtFx3d
   LRwpCe/5uCKwwPixc+JZm5pfey7z2F8XbfVXB0iGm2QXvElJU4e0FJFjg
   j0oSMltTpPqhx+UJ7A9VfZoYvfDhlEeuCfiqGz98w15M01SUIcdbp3doW
   ApkY4d9dT+pKk9bX2tvXx7Ooq4Mv3ZKVVbmyDYd4kDTZEiOzeLXKUvf64
   GyE/cwKE6bvVT4DKtA4QtclLBOrtkCbsRogRpkAVKxIqtvyPXVNOuXMPc
   EhLhPurZ+ye5yWjrMvG1FjxHC2OdhdWVVP3qAXPEejIHwQGCXcsYXbGMU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335164806"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335164806"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:43:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="803253335"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="803253335"
Received: from unknown (HELO localhost.localdomain) ([10.237.112.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:43:51 -0700
Date: Wed, 15 Mar 2023 12:43:42 +0100
From: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
To: Durai Manickam KR <durai.manickamkr@microchip.com>
Cc: Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com,
	manikandan.m@microchip.com, varshini.rajendran@microchip.com,
	dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
	balakrishnan.s@microchip.com, claudiu.beznea@microchip.com,
	cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	edumazet@google.com, kuba@kernel.org, richardcochran@gmail.com,
	linux@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	pabeni@redhat.com
Subject: Re: [PATCH 0/2] Add PTP support for sama7g5
Message-ID: <ZBGvbuue5e3vR8Fs@localhost.localdomain>
References: <20230315095053.53969-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315095053.53969-1-durai.manickamkr@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044359_133592_1BDEF9BC 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, Mar 15, 2023 at 03:20:51PM +0530, Durai Manickam KR wrote:
> This patch series is intended to add PTP capability to the GEM and 
> EMAC for sama7g5.
> 
> Durai Manickam KR (2):
>   net: macb: Add PTP support to GEM for sama7g5
>   net: macb: Add PTP support to EMAC for sama7g5
> 
>  drivers/net/ethernet/cadence/macb_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>

Side question, doesn't it need any software implementation? Or it is
already implemented, or it is only hw caps?

> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
