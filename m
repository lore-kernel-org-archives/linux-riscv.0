Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F88C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 05:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naYFzaASN9absLMb6cA9Q85kUzwcB+ZMycNmk306/Jc=; b=3n0LEQYNO17O+0
	Y2YXnHXaQ1JeUHIZw4vwRNkepww2+e0LclrRUo51LDc24pN1+2UfP0nrT2/2sxqx0CvvFikmMi4WW
	5350/PTyLe+3RF91VFu0oVoLNuVUQpyU+hGHt09G+lD6BSVLxxOEMY2Ov3g+QTP/ql0Pf3d2Rw7KP
	PY6TFYA8+2WBDTCTNCYyTs3rmuVR03bzRqOwnodIxMBJfAVtN8+Xc28aEqNnyxtkZbOWb6IkDYIjR
	FMcLSVRcW8xHG+ejchF62z4UAwsM9QAB66PClAOzlPE3yoIsdHDyMjDol7QYYj1SbOQcsaTSGK+QQ
	us/IerBJvHqw6tkW/7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1QD-0000000FQgf-02N7;
	Wed, 12 Aug 2026 05:22:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1QB-0000000FQgK-2lIL
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 05:22:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2E29601E0;
	Wed, 12 Aug 2026 05:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B1E1F000E9;
	Wed, 12 Aug 2026 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786512154;
	bh=ZPBb4cAV5MPrzvf4K070sFW5PaFLurQzUak2P3Vdyz8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=QPveumX/9BAkYMdtgUZyMe0989p35NJ/zMIOCea5t/w+G7+lZExnI/ehRI03M4gVW
	 yLvHNzpxMKU5WWJQKJXkqYwgJBKlm9fNNVtm/m/GiQImqJN84qAdvnaG1Z36uHeFjI
	 0wJ0bJMOhxtC/HfTdWSedxjAu64DjdOWxh66P2dL58iylcrBTxSB/Mg1MJJV0mUEIV
	 69at9EczkRFgnU0LnQzMkFT5sRxprN9+MBUauxK3FRo6oN3WntIZR5TCHVx7ccCV/R
	 hTF4lDo0TwbzKI5tXy0OWPt8nrqYEzTnepYJLfSrciaWH2PBkStpzmvLFYn+wI5Ta5
	 SazDDbmTaOKwQ==
MIME-Version: 1.0
In-Reply-To: <20260802014217-KYC2734409@kernel.org>
References: <20260802014217-KYC2734409@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Tue, 11 Aug 2026 22:22:32 -0700
Message-ID: <178651215252.5862.4480686966770442690@lazor>
User-Agent: alot/0.12
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

Quoting Yixun Lan (2026-08-01 18:42:52)
> Hi Stephen,
> 
>    Please pull SpacemiT's clock changes for v7.3
> 
> Yixun Lan
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-for-7.3-1
> 
> for you to fetch changes up to 8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485:
> 
>   clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers (2026-07-29 02:42:06 +0000)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
