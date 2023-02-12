Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BB0C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyGfC+ua7WfhiokizzIK22GVSuqOyH4o6JsB8I7yqDU=; b=zia81V3zn8bwkS
	7kb2zjKFuZin/u+jskYx8W2eO1nV2xEgW4PlqhBpQgoiTsY3i1e+ZY03C5Q6cdj0B4d23oUKIwySY
	52OVoQgQMGGCCXujumDL++RBFe6Hjt0R+8ZBq1DONKTq6WCgCWjBXc0BfFBhwKld4r39sGNTIEkH0
	FJ2133RNoopACZ/LWk0qbftfekjHvrQovpSiKTp4ofb1pG0Dzj0YWJ6EqN/6EBcZ9C6l75UdJypNc
	R6U/0gTXQh/KF2f2uQySdznVz5pqd/Q23iaUg9LREGp7MSK1e3GlrssVpe7OZiEMbUVfjvPvUusC9
	VsSflVpWvdd0v2DsjrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFGW-00BsEl-FK; Sun, 12 Feb 2023 16:31:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRFGS-00BsD4-L8
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 16:31:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id qb15so24478034ejc.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 08:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRnNrh0Tp9ZXxpjFA/ywNJuMyWK+ZOFUY36BgSa0sFI=;
        b=Nx1SlVzz+aBsCyvWUEdtlBtjS407l6At6bZQtLStUK75pis/Au5mahXmyfQoOBX7Pm
         xpLasDmyVLp1nfOQxx/av+ZdZG3MGxYkgMeS7CvVi+9tdUC+jFGxYa4ieDyarb8cZONh
         pZorZWDSzz5dUEOlwIINwhEGIRZl9gd6oehd+vJXW7iw1odkYxFWhLyH+z5CVktYftt6
         rg9xodQJ2xOkg5pXDT+vJHc5hn5G/NQueb+/bVlGz1dzCEbK48iuWVWa7lwZYFE/iRKO
         udI5iSvmHqqQ7XgCPmmfTxAvuZEP1EkmNN07WjZQw4puAa0MxbnyLzsmwJ6ZPVEe1UDc
         A3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRnNrh0Tp9ZXxpjFA/ywNJuMyWK+ZOFUY36BgSa0sFI=;
        b=gsDoj1WsIua971be7JQk7T+KX+ix8G+gNibU494YKIdQGOZZZJNe5yjU/2odg5nSPH
         4gHNiU+93Dom+ayHyc+J8PZC2dxgihFmnDnRcvQhULEqSMt7835jaN46MRlvzPtW316D
         bTZ27xvtvlASK3+6w4yzQNkQp4oNtnqOJqcnqHS4loAuGmWZfCOmZdplRBT5lLCYiKkf
         ldpYQG9cf1nlMIvlTCzBeGYXCMwNFbh14dAaP4DLfeHfjZ63Cv6EBbjJ/srA0zQYAhDy
         zUjNwAhNUM+XcoTSv8FPCiasKAsXbQQrVdpC6xXEdGZODkLvGNoHREnhuGTJCttK9zUQ
         lNAg==
X-Gm-Message-State: AO0yUKVb5tniuqsT038Gbl1RFdp6wewQwHnhiOxSh8Jy/yrCFTUz0RMg
	j7vMEwRZD+/SHaHREUwFbUSfTmlOS6E6bkd2ldU=
X-Google-Smtp-Source: AK7set9e8llSTJr2CLKFAlDSEgcVcdigtMmlauBE+/GL5OCHoDDlyoMZHUqxUPVIrmbpdpzGrMWbZA==
X-Received: by 2002:a17:907:6e0f:b0:8ae:6b88:e52d with SMTP id sd15-20020a1709076e0f00b008ae6b88e52dmr20536984ejc.7.1676219499814;
        Sun, 12 Feb 2023 08:31:39 -0800 (PST)
Received: from localhost ([145.224.109.44])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906040400b008448d273670sm5465070eja.49.2023.02.12.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 08:31:39 -0800 (PST)
Date: Sun, 12 Feb 2023 17:31:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: Fix Zbb alternative IDs
Message-ID: <20230212163137.y7ylsgyqlrlripgr@orel>
References: <20230212021534.59121-1-samuel@sholland.org>
 <20230212021534.59121-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212021534.59121-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_083144_709647_09D1562E 
X-CRM114-Status: GOOD (  10.93  )
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

On Sat, Feb 11, 2023 at 08:15:33PM -0600, Samuel Holland wrote:
> Commit 4bf8860760d9 ("riscv: cpufeature: extend
> riscv_cpufeature_patch_func to all ISA extensions") switched ISA
> extension alternatives to use the RISCV_ISA_EXT_* macros instead of
> CPUFEATURE_*. This was mismerged when applied on top of the Zbb series,
> so the Zbb alternatives referenced the wrong errata ID values.
> 
> Fixes: 9daca9a5b9ac ("Merge patch series "riscv: improve boot time isa extensions handling"")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  arch/riscv/include/asm/errata_list.h | 5 -----
>  arch/riscv/lib/strcmp.S              | 2 +-
>  arch/riscv/lib/strlen.S              | 2 +-
>  arch/riscv/lib/strncmp.S             | 2 +-
>  4 files changed, 3 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
