Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED258109E556
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQC7+4NWPvHOvJ6mxrm2MBasgY5m2Gu3LF6AMjW+x8c=; b=sQR7O1HHc72k4J
	VgaNQbzKF3atLB354se8Mmrl9fQy5VGso/iMCHK8lQy8yqBnRh80d/KdJaG8jH6TMzrU/aVE0XBn2
	FHqGqHLt/Q1MKKHpbkcKW4xQ+OsxqllBbgO41nK6OjsiryP+FL61co3guqI7DVLb7kqWNHbFBdaCv
	CBigtO/6gWjR8Zg+D8ear9Mvq/eSaBzxp9CUSr4iVA6m+/hLgeZdTmD+sqCJ5uZpFjzc9fDT558or
	AKDOhc60pd6McMkPseQUAmERptGuZA8JOIWbOyUrgqUx8A3Np1xmP697/u1gEC0JW8cbLa+hlkuBP
	JJsJ9hA3SQWA5qeT0QtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fF7-00000004wgb-1yyD;
	Thu, 26 Mar 2026 07:35:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fF5-00000004wgA-2KBv
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A25D760053;
	Thu, 26 Mar 2026 07:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF12C116C6;
	Thu, 26 Mar 2026 07:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510498;
	bh=i9G0GSY9TeIGOxDzdr8Ir22Ps+YtLJcsSy7NDz39L5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2EdTM1jIZcDuLvJ/zWbxKykGQvqYDbXRLb2ZNFKKDdyswvTxeXfZjFOdeDQRileN
	 UL2jfl0J4Gp93lVIy1b34lTV0gvnTUfWZ1Pf8QmaSQzwonocfyPDYfVZGXVVulth7J
	 7fMTY/HIayOAdqw0lIvDkDljMlmRL8A8kHZ/JigGMs1NisYOVrxy/1bw8I150RwUAV
	 EL8J8bhLOSyp2VFp1BJYKdhHNIKzI7kv8qjvdUtN1N4HaPpgejk1wCns4yVj0Nl0IM
	 4X0GYI8RkSNjTJhz/LyCd6Tgr9tZsaL/WPMm95FRfIswRHlJUVJvOxm9C/NqdyOv1D
	 XlsnHt7SCGCag==
Date: Thu, 26 Mar 2026 15:34:56 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V
 Jupiter
Message-ID: <20260326073456-GKH777612@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-7-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260322203356.2206927-7-aurelien@aurel32.net>
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

Hi Aurelien, 

On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> Enable the two PCIe controller along with and their associated PHY. They
> are routed to the M.2 M-key connector and to the the PCIe x8 slot.
                                               ~~~~~~drop one
> 
> Add an always-on regulator sourcing 3.3V from the DC-IN input, to power
> the PCIe ports.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Can you re-spin one more version? along with previous bootph-pre-ram
change, you might also wanna adjust the commit message accordingly..

P.S, It's easy for me to pick from the list instead of amending locally

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
