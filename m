Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TgSOp3V/cGX2ORvAeJLxhF+b/52CsonzTlkH4oJezWA=; b=TB/61z05iea/GQw1xkUCMFZCF0
	OQtQxX/LFXpDkUDzywB9dmwTvmWD7WhOPtA43uYW+3J41bI7gCCuBYbIm+RFR0vJANHUI7xes8iKl
	N2YUF5MuiSZ/9VZZcaMYn2gNbCcPTEfeKkJ4/MgkcHFhkE0DL4cQq3poUvCbYadzhfYvT3ayusGJd
	NsvJA2mtGq/l+deiyIvgSPwTlUi4lnzGW/72ukpEBmPPgmKEW7IKoGxvcyi/lKLcX1dmmsYWzuolh
	IwqDP6PThWLxpiilCXx2UY6+p92X4U+/QMDMyOr5UslS0F5Y1pUFfbSj4wUh7c2DmFZSXmw5WMnxH
	G+CShOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRO0h-002D20-29; Tue, 08 Mar 2022 00:47:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRO0c-002Cyw-1n
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 00:47:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id s42so3312162pfg.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 16:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wypaPIA6ghdghr/IDrb/MsW89Q13oqpEaAH1HD6rl2Q=;
 b=5GWNMF7aPQ5cvEpAtHaiMyRSUVh71/WOgLZl7yJJ4pakehav7XEh0jVVHMqPFQmL12
 AyAht2FPHo8A8lVkzPwGI6OTLH3X03ltJOt0M3fzLULv2J+7KgdCxUtQHMP05dVfqdzN
 dVXM+ulgnr46yoSBZJX7xNYny1cumI3o6ArXCytoJ7gMq38lO2yi7gswSLzoc6z80bGi
 oIX2VZRn22zna8kG48HztWrMOy0DMyyZNAcSh7+0KzU8GW90GM3zNnXuYSONkMHLpbId
 sOwHITm4Q4Y5pVy84DhnRCCZonbkFPa6WrNxn9pCrvArhEIE80yX21BUwEvn97jgJasS
 I5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wypaPIA6ghdghr/IDrb/MsW89Q13oqpEaAH1HD6rl2Q=;
 b=kNKdUG+jIDhtOOfGFMUYyPq+hwuCZ7ptIjnv8nJSrCI1NW+ydohFsfOn0VWOVAuMRy
 vDAhHt6ca2X6EAU10e9Ygd2ij4JConTwxWXL9xJyK74jexHPJNHIMBfeY5J2eEfW7z0j
 ZVmlxWFrAbB4Vha3q62qBV1YNzVpo9pDkgXU+h4/+1V/ogFzaBFRA+VAqxyaCsrAp5QK
 cr7dJAuHTfbH98n08M0RGT3gTOsspkU1tVFOqQg3xN6ww2K1W3cFjToCuNvQaUI7GGJN
 pZAoLvSoL6QTCmvQQudslyXErOpvq2ntbHRHuK1Gp0rV9285HFu4+RP3AmwZAWcYu+24
 AaQg==
X-Gm-Message-State: AOAM531FFBelwP0u9N2BQEakGvafkxmgFrDjWUatf9G1c12qY0ax6kRt
 +1xfP4m6d/qynNNWe504rdDOKg==
X-Google-Smtp-Source: ABdhPJzN0Q+/iTzny+GY7jNEgZYiSy/S/lodFd1M8fC5fiXAiV5Y/3yp0m6imSPSgx/YE1vOCyjQMw==
X-Received: by 2002:a63:1a54:0:b0:375:82eb:7449 with SMTP id
 a20-20020a631a54000000b0037582eb7449mr12141643pgm.341.1646700442479; 
 Mon, 07 Mar 2022 16:47:22 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 t9-20020a056a0021c900b004f72e3838aasm178095pfj.183.2022.03.07.16.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 16:47:21 -0800 (PST)
Date: Mon, 07 Mar 2022 16:47:21 -0800 (PST)
X-Google-Original-Date: Mon, 07 Mar 2022 12:30:04 PST (-0800)
Subject: Re: [PATCH v6 07/14] riscv: prevent compressed instructions in
 alternatives
In-Reply-To: <20220209123800.269774-8-heiko@sntech.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, 
 anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, 
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, 
 cmuellner@linux.com, philipp.tomsich@vrull.eu, heiko@sntech.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-edc0da56-7fc8-4287-8856-9aac0f7465c1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_164726_118821_4CE4D150 
X-CRM114-Status: GOOD (  21.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 09 Feb 2022 04:37:53 PST (-0800), heiko@sntech.de wrote:
> Instructions are opportunistically compressed by the RISC-V assembler
> when possible, but in alternatives-blocks both the old and new content
> need to be the same size, so having the toolchain do somewhat random
> optimizations will cause strange side-effects like
> "attempt to move .org backwards" compile-time errors.
>
> Already a simple "and" used in alternatives assembly will cause these
> mismatched code sizes.

There should probably be a ".option norelax" in here as well, as 
relaxation will trigger exactly the same issues.  That, or we could just 
remove the constraint that these must be the same size (ie, 
automatically pad the smaller one with NOP/jump-to-end).

> So prevent compressed instructions to be generated in alternatives-
> code and use option-push and -pop to only limit this to the relevant
> code blocks
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index c0fb11fad631..3a52884bf23d 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -19,7 +19,10 @@
>  	.popsection
>  	.subsection 1
>  888 :
> +	.option push
> +	.option norvc
>  	\new_c
> +	.option pop
>  889 :
>  	.previous
>  	.org    . - (889b - 888b) + (887b - 886b)
> @@ -29,7 +32,10 @@
>
>  .macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
>  886 :
> +	.option push
> +	.option norvc
>  	\old_c
> +	.option pop
>  887 :
>  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
> @@ -40,7 +46,10 @@
>  .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
>  				  new_c_2, vendor_id_2, errata_id_2, enable_2
>  886 :
> +	.option push
> +	.option norvc
>  	\old_c
> +	.option pop
>  887 :
>  	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> @@ -70,7 +79,10 @@
>  	".popsection\n"							\
>  	".subsection 1\n"						\
>  	"888 :\n"							\
> +	".option push\n"						\
> +	".option norvc\n"						\
>  	new_c "\n"							\
> +	".option pop\n"							\
>  	"889 :\n"							\
>  	".previous\n"							\
>  	".org	. - (887b - 886b) + (889b - 888b)\n"			\
> @@ -79,7 +91,10 @@
>
>  #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
>  	"886 :\n"							\
> +	".option push\n"						\
> +	".option norvc\n"						\
>  	old_c "\n"							\
> +	".option pop\n"							\
>  	"887 :\n"							\
>  	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>
> @@ -89,7 +104,10 @@
>  #define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
>  				  new_c_2, vendor_id_2, errata_id_2, enable_2) \
>  	"886 :\n"							\
> +	".option push\n"						\
> +	".option norvc\n"						\
>  	old_c "\n"							\
> +	".option pop\n"							\
>  	"887 :\n"							\
>  	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
