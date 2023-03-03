Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A835FC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzA2A4CKvdzB2AtaotoHoYP7JMnSKV3mtFRyZ4PbTrc=; b=LWner2B8wuVuBI
	JFf2VssJr08ZponznoIzWU2yiNjrCLp2tntJkyi9haD1zISTKh6X5BC5wHrGlGDTIG90mSafXUYGM
	vwVdEA8T5uLRPKdFzjh5NXdgitcik9lE8WCCBLjoiFF75FxeGuiNTFngddSb6plrZXXJ4/VoYAcIf
	BMEK51GCWmusYgIo8HiIWNuHsBb4X/4s6eXbXNpZBPNl1QXXZ2FaI+koJaJDcKZ6dFYZiyCUWP1ax
	STeOtADUmrT8NA/0oW1AiMRorP+x/3Upjtw+0Pg6wfcZq0/Py++P9CVwFmtvWRq7g7nbA/dgA9yG9
	Jhd1uIlzXFjed5fDSy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8Bc-006nya-Up; Fri, 03 Mar 2023 16:23:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8Ba-006ny9-7c
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:23:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id o15so12296559edr.13
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ryeAsxysbo6DUGxfiuPOI8CvtI+vb6NelPj5oYksPo=;
        b=EzNCK3RZSJsJUeQFEWK8SnOi6P6PWK6BpIgChisWP1NzSH3VJqAhxv3yOHN49QZqxg
         V0BotQn335MAGYgJxAnQgTh9LVMsDSCDQ/xWw3H3ctNOmg8JAYT3/m7yFa9i2bJjF+ra
         ZttoECnbnJngdAr0peRBlCURcv4DOeWZMJr+UQInSQrH5dYL06UB85PPFrccZC8J4Gc5
         GpnECND/KUp0C2V8VxmBWE1aa+V5hB2gD6L4RrqZCHoc7p7UMC3cQOhZQQWzF3fnvlrH
         EbZbRFIvnTrDSVhUBd5gKFA+hE6u/UKpArsqB8YWOidtWPdOHOWOxQg2ufuiPbrJWj+4
         TIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ryeAsxysbo6DUGxfiuPOI8CvtI+vb6NelPj5oYksPo=;
        b=oMbo8EKbOxhfqI94SvINQzzwXVsjqKvXrvXloLraSYfj5q3HTgYfawZF3DDApTUQiq
         8SO39LeLTRZY/997kfqPzQT2JFakl6eoZ9T3YG3oZQb69i7mMAn9NzPx1y6tR9JkbaBA
         KeCtNeKsGyXq4w0a2fp1nJaQ63ceuFBwuseuZ7v+eT0M/ihSoZkEKG8Lpgi9nw+rSJcN
         tZqonaJe/nuf+2EpHD1t/0OtkTRq6PW7KEO44hjBJPwJ2eTZdR2GxUpM7uPZZ+xwDWjd
         cAFwJoxGNPB7H8IHix9ry1VvzB88RdhaS04H3bLMLoRNptT1ei48MhWzobL2lHYOs9ZS
         egUg==
X-Gm-Message-State: AO0yUKXIX23FpgAA8p73saH7g2wkolp+xJ2pozFmBND4f54Xm56BUBRH
	w2M9k9sX3MidropbFj3wiE9pZW/ql63ECTKH
X-Google-Smtp-Source: AK7set+GMkAPdilJi56mUnW0fX32evecSe24CxSroekBxpjdNIx8xTEeM5pLsOlf4df3VzOOhkydOg==
X-Received: by 2002:aa7:cfc2:0:b0:4bf:f9f4:9b1e with SMTP id r2-20020aa7cfc2000000b004bff9f49b1emr2272745edy.4.1677860588730;
        Fri, 03 Mar 2023 08:23:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b2-20020a50b402000000b004be64b284b2sm1338509edh.3.2023.03.03.08.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:23:08 -0800 (PST)
Date: Fri, 3 Mar 2023 17:23:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 19/20] RISC-V: Enable ACPI in defconfig
Message-ID: <20230303162307.zz5amah65gjme7da@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-20-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_082310_316126_147D6B6D 
X-CRM114-Status: GOOD (  13.14  )
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

On Fri, Mar 03, 2023 at 07:06:46PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..8822b49ddb59 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> +CONFIG_ACPI=y
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
