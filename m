Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7105C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9xUMRqbAgsYpPQjCL6xd7moCn//qO388+wO6Ry14RU=; b=d1YhUfq0gC2zCb
	DBsoe5Ox4CU3XRDRt1wr//JZoSa2k3gBjg0M6uG4AEKEU32cjnyBw6qpK544bznc9cA6QGvB5lMZY
	rHdvOCdzXfhmDBVabYjc+YLCnrEZW8ZLAfxnsAAxk0N5GrIX8zpHdQ+6U5W8IAchK1Ixdjpc+2U5G
	oRp+QD9jBL986dycA8RiUlWKrvcwCmU9hn0Ab/3cKDh8gZpuj4so3Uask9HR/JXxMp3WC+pL+IRzA
	ck2xZPf9IcK/9V+iWRQtQvoZCj6Hq+zV9NWy0mF5UC558q2w7im99Qcn2AqQ+E6vTlw/268LqnDQ6
	NWPGD01PfTHtRgR0D4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PRv-000BNq-1e; Wed, 30 Nov 2022 15:56:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PRq-000BC3-NC
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:56:38 +0000
Received: by mail-ej1-x630.google.com with SMTP id n21so42379053ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjXJYB7hCGcThjRCbrJ5g/OHo65uAJNzUXUxOIMl6/g=;
        b=TB4kc/oiAhq63CaYuMUxTQBaUafSxPNfvozkDroNfLffzj39lTHsPIXsmRbCmbmanZ
         qGS8hdpeOnKygSFi+QQ5toCok3x0R1+c1so0AaZAA3kJ9t2g6XWwJZs4PPeUgsaYrIqQ
         UCiuNk8hgEoOCIYWbHBwtdJOOa1ZUuf3G+cpXpM+51CNSYNwW8FSGjSa7FxzSfNx5xUR
         Hbp2Ks06oAEeDrTh+ftl1azKl2eY9g6+HTTMfPwrshGrRRA64FZUJ/qcf1a+SPNvOFbg
         unK5m6iAB+VX36ZQCTXSQU0zuqLKXhAxBBgXq4phDHUbEqfT0NQe0bpkj60+PigD2uK0
         RNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjXJYB7hCGcThjRCbrJ5g/OHo65uAJNzUXUxOIMl6/g=;
        b=PxEWZm6hyaoahIuNoxc/1qqx55RGibB8UzBvrZbJ/5iamAPm2Dh+cJBz1nyQ0z5pXR
         7KrVvEru0GBKlOPGmpiSovKaWnHXWiRsU5lJrCLuXj/wmragytTitAX1QGUxZMoP7Hy1
         BIylEPcOk1OeKS1ddQhkfJv8Tx8dTiYwkbEo0LuDUPP0KHVcEsFF8U9/8eA0s9lVtoHl
         Zx6DN1o3UKBsv3trkQd6YPf6JuI1E0+KD1CFAn+9Ea1r5ZYvqLaAr2RNL9DvtC2uJU2p
         YrUO+alnKH7psTO2XWUkTBbZFfaMyl794g6E2RuUwpXmQXqRh0SR12hibzoag78RizLU
         CAbA==
X-Gm-Message-State: ANoB5pl4vK0iq0rVH2UYEmPLhCvuXoeGSQCYshVngRz0v6FuDZ0F9WXj
	fRpOJyq4ZH+SGqkf6Em1S8VAKA==
X-Google-Smtp-Source: AA0mqf7C+rmE5qxu8NELnG9mklyOm04C5LtW/7gcWjbPruS+4F1qbvF4Ls1O+zmNyFYpjJC72fwlmw==
X-Received: by 2002:a17:906:fcd0:b0:7ad:b8c0:3057 with SMTP id qx16-20020a170906fcd000b007adb8c03057mr53116215ejb.440.1669823793264;
        Wed, 30 Nov 2022 07:56:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id c5-20020a1709060fc500b007ae10525550sm791199ejk.47.2022.11.30.07.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:56:32 -0800 (PST)
Date: Wed, 30 Nov 2022 16:56:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 07/13] RISC-V: add auipc elements to parse_asm header
Message-ID: <20221130155631.62srybfzlq5hxell@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-8-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_075634_782368_A75A2536 
X-CRM114-Status: GOOD (  10.84  )
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

On Mon, Nov 28, 2022 at 11:26:26AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> We will want to use the opcode parsing outside kdb as well and need
> at least the auipc element there.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
