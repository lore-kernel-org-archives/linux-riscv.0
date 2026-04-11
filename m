Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03245F36BA5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DKEAN1vD/ykkHHoOXzxAA85WPln4T4B5o9kAj2XHlY=; b=AVNFzfbRAcTrWI
	MYnV1nHzF71dfjdvH5hEGCyJYt9E+aXqNMlLHcwmkPOun9kR3acCvFJvaiJHgcANc9FgVAGpp8UKD
	KO6avwH0HikXC4Rzi3fSGkZgaWQAVEYCipNsifphObZmr1Cee/zoGkvvWgZwnArnuMfv8w70qXNRV
	VyrTktgrkvSZ1fFOyUD2vw5p+WTH65BisZQ2dxl0Pe254kujMZzLO+k7jIUQ2pTlnnVntwXflLnmi
	fzqAUxFD95+KWcrFCFsqNEYaP5f382xAbV78vmfxN631TAew8/+H8JmFUIKddBtMQisz8DUtCrDLH
	EAmV7MFWbwELhUJ3nFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTlG-0000000DGzX-09Fc;
	Sat, 11 Apr 2026 08:32:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTlE-0000000DGzR-1AtD
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 08:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B692160141
	for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 08:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF560C4CEF7;
	Sat, 11 Apr 2026 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775896331;
	bh=HmgsdVZSABtANDAREGCwmrAh8TC6aMqoBTlAENcPbuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1dSmwFQ/FnspaYaXCoh4AMby4Bl96nEoP//0DL836WeRau6zooB5SxS0GMiJ49Pc
	 Z6UCTzWxoENdEsqt/9xL2wM7kkiNU+jOE36HAppSsrv3XMwCceavXbEPEalkX4RJPd
	 9gnwtFLXN7fcG2FNIyhdHqSrIX/1QBfY90IlHkwnT5oqKrybPXpaB1NRbwxcFJ5Djz
	 IhmWdMerMIhIwe4bEBpdGrR4b6yKLyHTRb0/c12DyPqIKjue2PePeMcRQwoupe3sKU
	 tc5/NsROtgRghzmL5l+5gwQll+n09JtRGCrB5/y1uTgkyUzb6qFebbG2mgdriqK+CS
	 /wIs8GwmcI1MA==
Date: Sat, 11 Apr 2026 10:32:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V soc drivers for v7.1
Message-ID: <20260411-meaty-wolf-of-glee-eb7f5d@quoll>
References: <20260406-spearmint-request-b71f627dc08c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260406-spearmint-request-b71f627dc08c@spud>
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

On Mon, Apr 06, 2026 at 11:35:15AM +0100, Conor Dooley wrote:
> Hey folks,
> 
> Please pull my driver updates for 7.1.
> 
> Thanks,
> Conor.
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-soc-drivers-for-v7.1
> 
> for you to fetch changes up to bd34cdd6d214f815570986ce55978fd7ddd8d8ac:
> 
>   soc: microchip: add mpfs gpio interrupt mux driver (2026-03-31 14:13:14 +0100)
> 
> ----------------------------------------------------------------
> RISC-V soc drivers for v7.1
> 
> Microchip:
> Add coverage for the pic64gx in the system controller and syscons.
> Add a interrupt mux driver (akin to the one that Renesas recently added)
> that fixes a problem where the platform never properly modelled gpio
> interrupts. There's a gpio driver change here that Bartosz has acked
> that adds the interrupt support to the GPIO driver itself.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, applied

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
