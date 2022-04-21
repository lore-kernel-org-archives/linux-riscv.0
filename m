Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5112FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSemEP5DMLY4KW9+RxUP7hZImtLApOvzRrDikX/TfEA=; b=KCLmqyjN3EBejh
	Pv2o/RTMEhix85vUbuA8qtJTD6A4agPbHYsa2Zhn3U4C6goAJkJLiJ29B1+qpORmbAP9B+5ojxMSB
	zRafS6bv4erhe0XhSHGDLJr19ojjyDKfTt7ACno2I/DxhmX5z8maHdDoap7LBBg0alSi5X52j2zYO
	tApFbgUll+7skrWPn2JYRfbUBLVH3dPdei6Q0SR1ShtgV7USYcaQNqOfnqg6VKRTWy3pK9rhDSDe0
	Gi0jMiVnBxwg/qOi0lg40gAniPgf+kdnVfCTnzIQDKpCDjVMGabAs2r1RLMBxIwY1tkikuCtPBrhl
	ARELwBepLJ6PSw2wlXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQH5-00BiS2-Sx; Thu, 21 Apr 2022 06:26:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQH3-00BiQS-1g
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 06:26:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3444616CE
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 06:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC49C385B1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 06:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650522399;
 bh=eASUq5L0Nno4NQmQJ4ufntLP3HwDZGjYeatCzopIFSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uKd64luYGTsaMxRKYeQeh4V1utyo7y4m5ryLkSJ8cH+dOYQgugrLXpu4FXm0riWo1
 aQQzlLcIAawqnr2Ivc9edh3K2gxNZGQl8iksnWP9OuLdMkNGBnn2cSVrqscIfklvWF
 81oXc3wBsEW7xTSPhklJxcHtOl59d2oJDq/EBRKE9UkSSjUKf4arZWXlMWtj707CyL
 Ak/8I//qErHxGoS3B3vDNbX2573xE9+XjgkdBuLEbEFxLNTr09qPXXZM5XxMCw4VW4
 VSu92RVqXrykHAd93Irp1LeJ8EsZ4rd134G3kWpWrg2JaLv4Y6PozdwLXA5nxUHCN3
 qZQTk7wlb1pMA==
Received: by mail-vk1-f171.google.com with SMTP id m203so1828892vke.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 23:26:38 -0700 (PDT)
X-Gm-Message-State: AOAM530y4Ym4M/RL988wanLjJPQWeUylhXmMrurtykt6xWqvNekgXv7a
 k3h6EmdboO3PcoY/GpcfiHnHR8g7I2H33YjyVao=
X-Google-Smtp-Source: ABdhPJyEmGQTQEFgId+gMvpD05ztW7hJbrJQSVqKqTwj1LgijqIgTQNKfp5ziRJ7/nwqVTTW8ZTRCHsm8VZtxW5D8Yk=
X-Received: by 2002:a1f:1b07:0:b0:348:f10f:82b2 with SMTP id
 b7-20020a1f1b07000000b00348f10f82b2mr7251328vkb.8.1650522397713; Wed, 20 Apr
 2022 23:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220420184056.7886-1-palmer@rivosinc.com>
 <20220420184056.7886-3-palmer@rivosinc.com>
In-Reply-To: <20220420184056.7886-3-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Apr 2022 14:26:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTyhN-Y8bH+o67NyGvpGZJawtPq4FPQ=dBCqUXOjjL=KQ@mail.gmail.com>
Message-ID: <CAJF2gTTyhN-Y8bH+o67NyGvpGZJawtPq4FPQ=dBCqUXOjjL=KQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] RISC-V: ignore xipImage
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, jszhang@kernel.org, 
 Vitaly Wool <vitaly.wool@konsulko.com>, gatecat@ds0.me, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>, 
 Mike Rapoport <rppt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_232641_202378_74DDEFB5 
X-CRM114-Status: GOOD (  14.91  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, Apr 21, 2022 at 2:48 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> This built file shows up in "git status" without an explicit ignore.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/boot/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/boot/.gitignore b/arch/riscv/boot/.gitignore
> index 90e66adb7de5..0cea9f7fa9d5 100644
> --- a/arch/riscv/boot/.gitignore
> +++ b/arch/riscv/boot/.gitignore
> @@ -4,3 +4,4 @@ Image.*
>  loader
>  loader.lds
>  loader.bin
> +xipImage
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
