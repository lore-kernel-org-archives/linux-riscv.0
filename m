Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8DEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 05:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIZcADIvOMHxgyFc/vF0fsCfJk+7Qixc4Ny0J+fLv3I=; b=qzxqtdnomK4FdV
	ebFU9vVPxZeH/MEM59N9Ot26IBhXgqFPJXeZOoJnjJ36Pw3ea4Ri1zs9wcfr0ZrhpjbdctpykDvU7
	D4koN45uq3N52j+buK3zjjT4U1mekqMxWy3RhjhBtgZSR+Bc9yCqgRIDmnbMoNdK7BvvoTKPMwRxC
	Q3ryuAEEGthRQvh5sqOaj9rYwgq2D5HX2SBZFCUtOt79vdmUzhIU7i0pTFkFDP9fRuDy5xaz8QPqW
	ncfV/KCmWK7AMFZyjCsi+n5ddczbdwoL13xRBpv7F6wzSdIncOMlJMpxhsnFYPE+3wMHXxBv1wVQq
	rpZTdstMM+QdlgbmAk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfEnh-008lDt-KN; Fri, 15 Apr 2022 05:47:21 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEnd-008lB5-K1
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 05:47:20 +0000
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2eba37104a2so75801067b3.0
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+S0ex0Gmk8XR+HZHfmZwrGjOF8Dda3fikKUL+qrwCA=;
 b=pVBDiBdSvrangewc/J0Wo8xQrAbEWLkPPucthMJqZGiYdMCnJv5tXJgxd3Ee0mrr+d
 VHMNA8zD2X0+0KIhrTnRAnVmSMvOniaOL7O6xtaMdXFNsIboKf3RyAjqFlK3gRQkk5DE
 n1LzKfSRxdOMC5rGWM+nkJ5diYejlN8nnYmiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+S0ex0Gmk8XR+HZHfmZwrGjOF8Dda3fikKUL+qrwCA=;
 b=joASk6nV76MG7DzLi2cSk1hu1nxRDoRcnkv7rT0OUpaEyW2D0lLrdAWSUqxG1PmyHt
 atW3eOAEAdYJmR1e/rsFNw3yMg/odw2fPoWBUQRJBId1LgiCc3qKh3tWv3DOnW+kXAPh
 l0fuPClqcvKWKkbyUvDoNZnyzDZraLEsnzhw4qWwB4wbBUE4894Oj91XhwCz/R05MKax
 6/QmxYcwJ0CiPrOM19dnGawupg0AfBdzsVAR1Keib+XkyO7Y2oknnE8QpdsSNflxiXNT
 nDQ5Xx0YQdeQKZYPFQVp4ZSgua3L9D1OZ6j0dS72zDP2JWzg9VUXtG42yY/5vIw3t3B9
 tH+g==
X-Gm-Message-State: AOAM532tTpATAfhWPobUqVYP1ML/2JQ1jTK2GJXLnMQ+xArzc/Ze9S7P
 sSVywcFwzG0MN8ic6Os59Ktrz1IfdGam1ZEs1vXT
X-Google-Smtp-Source: ABdhPJxvTmOAh1p5L0hp1zJBgO/cplpMgmeLO/Z++i8g7Xe/Vw/VUIitCelofGK1vcH22lkr09B6dnPpt+PN4Di+nHI=
X-Received: by 2002:a81:ad47:0:b0:2ee:927d:ff39 with SMTP id
 l7-20020a81ad47000000b002ee927dff39mr4935600ywk.249.1650001634010; Thu, 14
 Apr 2022 22:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220412033335.1384230-1-apatel@ventanamicro.com>
In-Reply-To: <20220412033335.1384230-1-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 14 Apr 2022 22:47:03 -0700
Message-ID: <CAOnJCUJUy1sE49hu6yyUzdsVwnLMXA0zOPBMzn8MTTYUdSnWtg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having
 Sv57
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_224717_898898_1FA8B2D1 
X-CRM114-Status: GOOD (  15.68  )
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

On Mon, Apr 11, 2022 at 8:34 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> When Sv57 is not available the satp.MODE test in set_satp_mode() will
> fail and lead to pgdir re-programming for Sv48. The pgdir re-programming
> will fail as well due to pre-existing pgdir entry used for Sv57 and as
> a result kernel fails to boot on RISC-V platform not having Sv57.
>
> To fix above issue, we should clear the pgdir memory in set_satp_mode()
> before re-programming.
>
> Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
> Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/mm/init.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 9535bea8688c..b0793dc0c291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -718,6 +718,7 @@ static __init void set_satp_mode(void)
>                 if (!check_l4) {
>                         disable_pgtable_l5();
>                         check_l4 = true;
> +                       memset(early_pg_dir, 0, PAGE_SIZE);
>                         goto retry;
>                 }
>                 disable_pgtable_l4();
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
