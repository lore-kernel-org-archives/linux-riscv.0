Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D2C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drJAeL2Zf0qv0FpzY7mmP2b/VlyiSo9e8HdRxM6/9Ss=; b=N6BWqokSo9MPbo
	00PFjMe0Nh/6/TM44E5fLpTDzx8j3dg0VmYfTtfW7WH761Kvhrf7wl0QJFNjRKi+9q9lF/WIBiC0p
	9/PiD13hyt65JNuRfdLIDAJAHTvFL3sBU0G2wvoVehcUgZ5zuP6NfK6jUjBm2/g6hILV/t7jYc6yi
	Taxdkk4b0fmvqHAHxeIeE9x+gP7158Qx3RjH89XODb+DlQ9utm+uP3dYq5Bfv2I7ylSkyTNcIpHuK
	uYoXq9WuhLnNjHDeTENLeQVzNVkPMXWpAeJOXjo9xr2XOcti1ItKr/vz5XKkrq7MdzBALFVYTA42D
	ldvJRKG9ShUEnmkD+Fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbqL-00Bk8o-G2; Wed, 11 Jan 2023 14:12:41 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbqI-00Bk6D-G3
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 14:12:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id co23so15158565wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 06:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aXt4s2lip+WA/lmUg4T5cJqMM6VlHjVoPy2O6/n25ds=;
        b=owT5Z7YsSyvfkk7SD7GhDMameVdIh1ypm2zj/GA3jXJb+LOitrJuC4Ov5VDYJGa2MD
         34NiU/BYRVlU9w/pA+AlPEU7FcK/z0WTvFYxvsIqozVzAp/uIoDzpwzvPkjIyMmLdTgC
         2wX1PdfP2vg7wLHUcgMyRDb9cdysZ84IST1ET7Dzd64zYIEgidCgF6hqJyItyaHUMU9O
         K3mfY2hx7xApx07Hp2WO945MYfaWodKR03UbBPkaF1Qwn5/YJqNU14zGm20G8hxEcoYC
         p1xeYsChi+DdE/pve3GDeIW310+PkM/qhL3CHDfBtGAInDI/uaHxEWePqbKAU9cVDLI7
         xuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXt4s2lip+WA/lmUg4T5cJqMM6VlHjVoPy2O6/n25ds=;
        b=zsrn0TgxS77fRFarKbxzH5zYcGPmTbqFKiRRxwlFq4LJPXx625QiyFkLKJJQPkeBRe
         gYBWXOARgRupnu5Ue8IwSD7QJL7RBhrsq8pviyqo2sHrfe2EcYWLHEiMMpmP9tTYhJyd
         74LYK2LJvBQTz0w7KJ8tiCqmFoXET0s79M9zxu5aek5dAIbslZAcFKNiGh1YzLZBR8TK
         OJ47AlFE3JE513lBgk0nUjidB/0eVNsDf3hhM7FUHm3VTK80jBIDbwe9QqFax/hU3rsk
         TvomxcwUZdInmWjdYIvgb5zMC7kcJpnYY1ARb7ts75ijNIieaOy3pEhhJhwvZfJZHHXI
         PfsQ==
X-Gm-Message-State: AFqh2kpP54lWDweudzvLBhhgGfKwa682n6WiilHScKVez2lkkXkX7scL
	xSa13r2FJB1CsG8iJfn1X56fHQ==
X-Google-Smtp-Source: AMrXdXsxKFj7ZVc3xTe+S4UTkutbibA2rD1cSKyHd0bYG1cVbu9ZIHYY5v8GsFOu+jJHXX5CTsVMrA==
X-Received: by 2002:adf:f20a:0:b0:2ba:bd95:e3af with SMTP id p10-20020adff20a000000b002babd95e3afmr12695642wro.47.1673446345000;
        Wed, 11 Jan 2023 06:12:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k9-20020adfd229000000b002bdbef07f7csm2867288wrh.50.2023.01.11.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:12:24 -0800 (PST)
Date: Wed, 11 Jan 2023 15:12:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 10/13] riscv: alternative: patch alternatives in the
 vDSO
Message-ID: <20230111141223.mib46x54au3n7xpq@orel>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-11-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204174632.3677-11-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_061238_539038_57AE68F9 
X-CRM114-Status: GOOD (  11.79  )
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

On Mon, Dec 05, 2022 at 01:46:29AM +0800, Jisheng Zhang wrote:
> Make it possible to use alternatives in the vDSO, so that better
> implementations can be used if possible.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/vdso.h     |  4 ++++
>  arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
>  arch/riscv/kernel/vdso.c          |  5 -----
>  arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
>  4 files changed, 36 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
