Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5404ECA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 10:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBdFhSB5umJ7Hr4tln44aWDl+PBAGLmFcd/XgXwuixA=; b=bnCUQWZjhyGJc5
	rYK5nceSmgFsZmHSgOVa5uRC9/awodCltEI3qBq9UgSsv1S4sVFz6grI9iHkrhbJuIKRw6sBRRXhb
	7sJAsfTA1Oi3EHllZYmZyCVBgAcJMEd44M0961azQM7Re5vp/hDem4ZFocXpPcTo5chanNkbqCAYY
	EC8s6X861Y1Uwticj4OCczIj8lPwZ1avqpS6KouWHvDcdzMP+iqH3167k4shcJnTiurdl2dnGmADx
	QiVasuGWhiw50YNWA58DYCgoF2H35By1sLCJz4Wyo/kyIy833yYT2KMLpmx6k3YhijGxLtGA/M2Vs
	tCEXzW6wnVM0m7t8ic/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaxQ-0000000BOWY-2r8d;
	Fri, 02 Oct 2026 10:57:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCaxO-0000000BOWR-2mkA
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 10:57:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18B60418E1;
	Fri,  2 Oct 2026 10:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A651F00893;
	Fri,  2 Oct 2026 10:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938658;
	bh=SHg91Ksqvf3Cvh/KCCXM4k6wGGlpfxIC6AG7VPfG8g0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TpAe+mkUIGkt8kLdcOzTU1emWa8UkRZC+zN4io2XOMLrBgeXrNNObzCGWxRuR08lY
	 JpFs0X0Vcrb+8XCcPbBHxVB5u59Mk9TF2EYKOFvQRSMEgf7cbl1qsPpipw5OnUJCiP
	 nZsu5/4zByRyx+XyG7jhgdOME26GynOHiDoGyM2NqTkBBWqpHmPgpEJA94JOWF3CrN
	 PsaseARK/tM70lfG3Ph80rwWnodetTLVi4WgZ26AQO3y9YmfD08Ldq6YrP4CUpGKnC
	 u/Z9HwIHiuPWpcHAbcp2BnSAYoJa483gk7TY+4hHI9Oe3jlMS5zH6Ra3+18C8/bTvZ
	 ZFzh9F7TvFXow==
Date: Fri, 2 Oct 2026 10:57:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Message-ID: <20261002105734-GKE51329@kernel.org>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
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

On 22:49 Mon 28 Sep     , Aurelien Jarno wrote:
> This patchset enables Bluetooth through USB on the K3 Pico ITX board and
> adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
> activated.
> 
> Note that WLAN support (patch 4) is only useful with the following
> patchset, but they can be applied independently:
I will just take this patch, as it doesn't cause any trouble

For the series
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
