Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74307C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KZwP57Ug5VnRMTDFraRn/aZ09efOs4VAW18gVbLh6Q=; b=wznbkrHxi64Isg
	JN3IGO679AE5uk64KN+MakrARao0w5EMS0eKw3b5KxalVajlEW1Q9FmNXXHP0OUfwIjN0+SL16ZFN
	cyp/CTV+CKw/4HYA49s3WKcPcmZ8eZtxu3aH8CYmUhrgviw32trJqD+SIQbU1sOX/V3S3u5wGsKO6
	eP2Jkv/SoZx1yJP7K8anx2joDeUv0lgH2QLKIPeTyGMqvVbKs9zyX5IbCkGJ16A4xhnPWtkTIeN+z
	Pyvon/uXuLV6XwQr8FWArMGMKNXG0SBmk0zcxAlLW6J5WfMV0V6DK4TXlGFkV4oPqVkHh5Ga+5Ewc
	3Y6Ptsg2jmHAWfFMFIAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPm5f-00BNvd-NI; Sun, 21 Aug 2022 14:38:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPm5d-00BNsM-KK
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 14:38:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5859E60ED9
	for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 14:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF1BC433D7
	for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661092686;
	bh=eUoxZaV850V7I73F63glT/eaPAo9OplEnZdMkKkslSM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EJlKZKCtPKg+cXb7k/9Kaen+hy/daM+dup7Wc/aGisTvKGB8lQLOV4hfg91unD7Lk
	 pT08Ibryy6s9Bn5M4KnjxbMJPg79PMHEUFIkQESSb08twLVZWUri5BxAY0+LB+a0QH
	 OHhgBl2+S55C7ad7enraI+tRVXDiRWMR++8dd7/YkEU+F4AeqQvvK1lv5suyaR+UBG
	 1HM3oDqXHXQlkF3LYRGJATJCY84Yn49rK1RGfbmTSS3uQMGhMYp5JxJi238pcIHoTr
	 F96nRUkI+wfBPLdjPXSpAMljHYdh3OOncGpvv/oX7alG/GTdlxu9widC5cpwR3ljy+
	 oU2rNGDFhw8ag==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-11cc7698a18so7093795fac.4
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 07:38:06 -0700 (PDT)
X-Gm-Message-State: ACgBeo0gFgISMuWaXcdzkHRD3m4SCxZLGuQo34AM7qmjXWLDpTOpLbAo
	+6kgBvzgPaGr5SmbZ1Ad0gn3VW1vXx95IMesWBU=
X-Google-Smtp-Source: AA6agR4z+NpywmulN5IWHAE4YVRoE8nrcwnBsgi3VC8DYGMO28oU9w1dHLnzLAfHtwke5YO4pyyFtGCDxKoWTeeNanY=
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id
 ba22-20020a056870c59600b001016409ae62mr10627308oab.112.1661092685876; Sun, 21
 Aug 2022 07:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220821141819.3804-1-jszhang@kernel.org>
In-Reply-To: <20220821141819.3804-1-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 21 Aug 2022 22:37:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTTWP1sWmYgUgJnqwkOhB9F_wOPTGywucvXbjZdrcHdHQ@mail.gmail.com>
Message-ID: <CAJF2gTTTWP1sWmYgUgJnqwkOhB9F_wOPTGywucvXbjZdrcHdHQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat: s/failed/unsupported if compat mode isn't supported
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_073813_752762_F301E892 
X-CRM114-Status: GOOD (  19.55  )
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

On Sun, Aug 21, 2022 at 10:27 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> When compat mode isn't supported(I believe this is the most case now),
> kernel will emit somthing as:
> [    0.050407] riscv: ELF compat mode failed
>
> This msg may make users think there's something wrong with the kernel
> itself, replace "failed" with "unsupported" to make it clear. In fact
Acked-by: Guo Ren <guoren@kernel.org>

> this is the real compat_mode_supported meaning. After the patch, the
> msg would be:
> [    0.050407] riscv: ELF compat mode unsupported
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..b0c63e8e867e 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -105,7 +105,7 @@ static int __init compat_mode_detect(void)
>         csr_write(CSR_STATUS, tmp);
>
>         pr_info("riscv: ELF compat mode %s",
> -                       compat_mode_supported ? "supported" : "failed");
> +                       compat_mode_supported ? "supported" : "unsupported");
>
>         return 0;
>  }
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
