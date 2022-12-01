Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E5C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr7ZVd8ihlMkjzEa9wl/z5xOORHFBKn94fbogtehoKs=; b=pTwf5TSDIYfN1f
	IM2CxEGS/Vq2uLZc+InNg5HzM9bhWFdQKjh8RfOzyURQizRItf6KV/cZW8MT4RORxVn7JDZROKz+J
	yGwDtSP3hZYZbfJP1NXMYZh+DbWzszEvpIKCg+HDuTJAnkPn+D+Ga3RkYK4aWCRXNNgiyafDo4Nmp
	dCK/YQT0Ru5VqgkMz45R008utq3U10vPO0lJJrljoie+Q04aVp2pnQxcTIGMiBL3bWMCrNVzgum3Y
	q+4EGaOxiSqZmkYWwiLPpPYS/2gjLIxw06YXnRlIgIh2rMuFaVR99L2PsC7Dy1ptxWE9Ojk4uLaFv
	7PiDx4BxAw+n+hALbMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nTy-0093ty-S8; Thu, 01 Dec 2022 17:36:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nTj-0093nH-Ov
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:36:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id b2so5888751eja.7
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUiLP3HVj8YH4yBupV/yT3BIND3qN3UqTt2dNtLnLzw=;
        b=hUjtsP8/e5c4Bddq51PrhsmWWxj5MdmVAyoi3rGLKdr8xD9RNL95k+pAlKATPWC0q8
         73PpZBRfoaEm/0zUsHuY/0OIzOkEa5l/TfHg4NN5FfYyH+TjqXdUUjtdtgeTX0G47MSa
         L5qOay1X5rKz+YiDI1pzJLKGiEG5wIrDPLQ1lIGvdZEXUi4HeGTvMYzNNeZlSmu3Q5X3
         S98cbMY1iIb4fc4ecz9F0I4yh9FnhI7zzHL8IiRjiHdM8YH+upx9zdZ5jd2g8LFiSS6w
         ZyLHOrXMC42eDWjy8/O/LaNRI21QRI/MvCK1FT5U19fLe7OKmSAHWNxBIbs619x5xanz
         j9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUiLP3HVj8YH4yBupV/yT3BIND3qN3UqTt2dNtLnLzw=;
        b=HkhHwx9ferzmzhdIFg/lcZgmoReCfYIu8QonGJkiv5IawGa7FByhNPvyM5+VfysGZz
         iQMLA+46Mz/psFm1ctRdKvol1rl6p+2SutiCdC83LyRlqyAPKp4DNTc1ById1fRjXRwI
         QjIee0Yj8J+FqrRCwuvszqg+ZfERv5hR35/wbJBARhfuLa9AHf726o2hYfXy+MhXz5IV
         Bk6RKbc1KIDi4ehQ4SIrsclJfcObQ9aJl420yhRQ83K3ifUkfknWNZGjBRkj0a7nA9gL
         sYvGyjvp3hU23jgmzYDFNXJpGytBhqPrUzMNbNDTV2gbG+xkzeWstV67WoOqCWBucGzf
         VhPg==
X-Gm-Message-State: ANoB5pkTwSd1b89SEveKoZYNvITgegFEjo3A+SjDMt0ONeRsq167HnfR
	l4HSLXLJxgBJ0L0lcr1JU8fXzA9h0WjkQA==
X-Google-Smtp-Source: AA0mqf6+VGfYLPuKuiOL3rmwlDbKY6bwok1PYqxvj6c+XUM9aWCNSdeL/ujG+mkQ5M5LKkbI81Wg/w==
X-Received: by 2002:a17:906:2692:b0:789:d492:89f5 with SMTP id t18-20020a170906269200b00789d49289f5mr59194395ejc.103.1669916164173;
        Thu, 01 Dec 2022 09:36:04 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b007adf2e4c6f7sm1980516ejh.195.2022.12.01.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:36:03 -0800 (PST)
Date: Thu, 1 Dec 2022 18:36:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, ardb@kernel.org,
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 03/14] RISC-V: detach funct-values from their offset
Message-ID: <20221201173602.6slgaxk2qdkfatxm@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221130225614.1594256-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130225614.1594256-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_093607_924030_B2C97EE8 
X-CRM114-Status: GOOD (  11.87  )
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

On Wed, Nov 30, 2022 at 11:56:03PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Rather than defining funct3, funct4, etc values pre-shifted to their
> target-position in an instruction, define the values themselves and
> only shift them where needed.
> 
> This allows using these funct-values in other places as well, for example
> when decoding functions.
> 
> At the same time also reduces the use of magic numbers, one would need
> a spec manual to understand.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 100 +++++++++++++++++------------
>  1 file changed, 59 insertions(+), 41 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
