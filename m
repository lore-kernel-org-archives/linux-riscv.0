Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C9DC352A1
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4blRTyWwMItdRbHlKU5r5fhxWliPLdFoRTCEUbhWtpY=; b=cZJ0Z+SS9mzyd7
	a402z9u35u8x3TxTgFkXAKP+TLJq3DPNt8Lpy45qw3lUjbT3FufEnp31DjVgoUjkQzU5jft7Jow1S
	1vKwroy9YqFXPD7l4f8+BlAVdGc3JtkZoOfi5XPBkwBB5R57LgWnZ3q1XpbkUhipKBsofLd9qcoY2
	GhV5Qr9vJ1C6dBh+zlb8EmGnoMo1DJ7uOVQApz7Wl9lzDDtCGlbe6Kb6QfqQ+pAVeeoWqnMxFIL8a
	+rHxLRvHy7MOypI6Pp+NPZKGG78fUNUfxkaUw8QhDJvE4gDrD48CI21swEXXn2qs1/7iWgT9k2qtI
	nl/PvY3cr7iQgXmquNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Lm8-002aKZ-MJ; Sat, 03 Dec 2022 06:13:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Lm3-002aJh-4J
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 06:13:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so6950809pjg.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 22:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5yDOHLL9ze+d0HRPvZyCxALaBNkR8+lAJSzL28YezYA=;
        b=iWHWjx91hVGItCFd5fzXv0MHJpDwn2f/kM3pQtwchQVVHbgS+UrtapZV+klTJ5sCuc
         er1qccXL27ysHwjZsxnAZLByvb2GS5TRbBFy3SzzvYGXdwn9SUeKWJFx26upSNfk0fxZ
         bKpRpQGROVLlQTzENKRIaJp6sKiLzCY++c935r5c8M0P7HtEhAqBBfYZTxnFiwzpMrjD
         KDg+iBptE49jbO1TKjEx0+IXNmGodrTnPixOIv8SvFPtuBuEvT9f6xmfd6xGlb/mYzM0
         P3/fSlwYgOZXzblioDiZc6+nnwTs4DZve0RS5AxncFunZH4jU8Kgu5wd/h9WCY1GvuI2
         ya5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yDOHLL9ze+d0HRPvZyCxALaBNkR8+lAJSzL28YezYA=;
        b=c5vt63jTwXN6y7ATEO58ppvyW7Rw0jWoJprrP1NDeDE4+rJmPea/DRSuLiygeYViI6
         Zm6NAYljg0NUigtIZZ41tTvg5buf4KkVb1wR3zLtiO7i20JpvhYbpUYq9tZogehsW2n+
         lHkZjlfNNkN9WoeRVtmtZji7UxrqXEBlF4ATEYQwjMD6kY5SKlMIdKDsFD4w3Cnkfv1y
         Y5uWCQb/kffIGQCklfeJmmm9CfPf3yM7TIF0lmzDB/AIWW/GVkHjW45rBCyCnTeVVFyN
         lFeOQyRVWzELpr2sDW1BIhWXzuR7nhS6g78CZ7g+Mq0HzU1IXL9bnAkzoI4U72GUvdNl
         zWTQ==
X-Gm-Message-State: ANoB5pm7vslIEfqwF6QkCM7Zs0QjcXDkNJtWH9WNNemHCuJogTqqahT/
	P5zv9s795PhZWK00TWaMeCsvcmtWt6v+NFAsJy3KX7HQG75Gkg==
X-Google-Smtp-Source: AA0mqf6v3t9HXTieHg3WKAbD67/H3agkd58t6kzZXqP1QYEy5B0yFlLTC2Bv9w7z7DsDo4k8htRHSVD3WI5KnbEFaLU=
X-Received: by 2002:a17:902:6a86:b0:188:cfc6:31fb with SMTP id
 n6-20020a1709026a8600b00188cfc631fbmr67931214plk.150.1670047985006; Fri, 02
 Dec 2022 22:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Dec 2022 11:42:52 +0530
Message-ID: <CAK9=C2VZTJC=OMc5=erf2MNZXRG99AiuGz6RAFw+c3vdKcha9Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_221321_571946_6EB87BC7 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Palmer,

On Mon, Nov 14, 2022 at 2:36 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The Linux NVDIMM PEM drivers require arch support to map and access the
> persistent memory device. This series adds RISC-V PMEM support using
> recently added Svpbmt and Zicbom support.
>
> First two patches are fixes and remaining two patches add the required
> PMEM support for Linux RISC-V.
>
> These patches can also be found in riscv_pmem_v6 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v5:
>  - Rebased on Linux-6.1-rc5
>  - Directly add pmem.o in obj-y of PATCH3
>  - Dropped PATCH1 since this is already merged.
>
> Changes since v4:
>  - Simplify PATCH2 by implementing RISC-V specific arch_memremap_wb()
>
> Changes since v3:
>  - Pickup correct version of Drew's patch as PATCH1
>
> Changes since v2:
>  - Rebased on Linux-6.1-rc1
>  - Replaced PATCH1 with the patch proposed by Drew
>
> Changes since v1:
>  - Fix error reported by test bot
>    https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/
>
> Anup Patel (3):
>   RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
>   RISC-V: Implement arch specific PMEM APIs
>   RISC-V: Enable PMEM drivers

Can this series be considered for Linux-6.2 ?

Regards,
Anup

>
>  arch/riscv/Kconfig           |  1 +
>  arch/riscv/configs/defconfig |  1 +
>  arch/riscv/include/asm/io.h  |  5 +++++
>  arch/riscv/mm/Makefile       |  1 +
>  arch/riscv/mm/pmem.c         | 21 +++++++++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/mm/pmem.c
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
