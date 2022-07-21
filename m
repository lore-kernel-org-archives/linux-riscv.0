Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C370C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=o/S0DFVE4b4vxEgyFPbYuTIhFbxpp5f/3B555w2A99o=; b=xBBRJfS81JVLL4m8gEydPWl63s
	AZ2EkuKH7asl8DyvAxMuMcYMDj42xXS4UgekV0wn5/kjV+Jim6epNRR5EQRb+JMRqxpQoO385LxBe
	LbI6K8ZZ5QMs9a/43Z6PUzzaozMQHB93WGZueD/SRuMfImymZdTbFmdJe9NLQX0RsCVii8QFKs5Ym
	IN30Ud8zag9YJTqotTF3kls0WOGsbVocthEAxeawnGdaQ8ACfZlW00iVFE5MKuzecItMFfwS9oecq
	9MsTbEuyzM3kJqekSxQ6qL0K5SUrrhrwwR6WyZQuSlvO8rZdVl/VWoH5AZNO4/8d5MCuwj8xfFTe2
	F/CjBdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEcEa-00BtMR-Sr; Thu, 21 Jul 2022 19:53:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEcEY-00BtKb-3j
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 19:53:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id c6so2801969pla.6
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=HsT+SOh6igago54DFk+NR9EMx4G+VOnG1ZM35MOSsdM=;
        b=dZTLC6T8LQqP4RfUYojYXtJS1ACmXZjhKUovfox5ilqKM1trs1sF+9KGWw1NvyVbe4
         Ofm2D9OdwPyNEUdwXZf759WKjMIUbrEb38lzG35mELnSYt05VK4QEdVbHD1pGmfRELQN
         79gmUrFhlT6i0QSApljrs03dmnOawpgRtgHJyhhmxaVJCN4AVP0pPvOB1EGxNzkTotBA
         GFD4j9kFP13RmHkmQwxHz0b4saNNjcM6b6YCSD0MLPyqhv9rWOoJWM+7gmWalUulBsAf
         EfLt03YQjJxc04E4Klm2fRFBGb+8f1PMJxf6Gv4aEDc5r/qRnPXyZn1M6syjTZ8MDjv1
         cUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=HsT+SOh6igago54DFk+NR9EMx4G+VOnG1ZM35MOSsdM=;
        b=YvPmQ6TU54oJMZMqanUxVZR+AtWYzaXsdjxbT5zGWEMDDC37zW1GwEDK5dHxE6IUlq
         fW/iWdWYtBHw9nhaehfwQEKG1LnLA9bZ9yPycNzH8Xvsh14WdxxRZ0JdFQCqQGk4ggUr
         4V2Vj5gJ4w/fJD1pxwioYQFnzWhpiPq31UTfLQtLjr1yz/XZSpPFsUZNy6nVTvdUns93
         bXf7lpgakaywg7Bb8uUmUKe/72iCHLgYQ/Yuw4Wozi3WYI5fe65VPbGdcZhG026mvht6
         Zd9gW8/nSe6aOK0KwwRx467+n63dG34bge7ZL0kdFP2RimZvHJwLQzc1R7t8espWaTOi
         8eFw==
X-Gm-Message-State: AJIora8UL8XKOR/b2oqbgoofY4OFJit1cuwZI2fNF2FmgFjY7svHFRFJ
	cpdtRLRAFrN4cVx8ejCDfZelJg==
X-Google-Smtp-Source: AGRyM1tGJwxbrdSYfu8R3bcKyPvyMTqQUG4QriRETnjQ+o4wsiVmS1vgA0CXW9TUHdLn5ftwQNzpLQ==
X-Received: by 2002:a17:902:cece:b0:16c:3683:8835 with SMTP id d14-20020a170902cece00b0016c36838835mr45821418plg.104.1658433197228;
        Thu, 21 Jul 2022 12:53:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id x2-20020a634a02000000b0040ced958e8fsm1884826pga.80.2022.07.21.12.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 12:53:16 -0700 (PDT)
Date: Thu, 21 Jul 2022 12:53:16 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Jul 2022 12:53:14 PDT (-0700)
Subject: Re: [PATCH] [PATCH v2] riscv: add as-options for modules with assembly compontents
In-Reply-To: <20220529152200.609809-1-ben.dooks@codethink.co.uk>
CC: linux-kernel@lists.codethink.co.uk, linux-riscv@lists.infradead.org,
  aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, ben.dooks@codethink.co.uk,
  Bin Meng <bmeng.cn@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-e9fd43e2-2d5f-40e6-b7ba-cad78f2a118b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_125318_385143_51B2DB9C 
X-CRM114-Status: GOOD (  22.33  )
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

On Sun, 29 May 2022 08:22:00 PDT (-0700), ben.dooks@codethink.co.uk wrote:
> When trying to load modules built for RISC-V which include assembly files
> the kernel loader errors with "unexpected relocation type 'R_RISCV_ALIGN'"
> due to R_RISCV_ALIGN relocations being generated by the assembler.
>
> The R_RISCV_ALIGN relocations can be removed at the expense of code space
> by adding -mno-relax to gcc and as.  In commit 7a8e7da42250138
> ("RISC-V: Fixes to module loading") -mno-relax is added to the build
> variable KBUILD_CFLAGS_MODULE. See [1] for more info.
>
> The issue is that when kbuild builds a .S file, it invokes gcc with
> the -mno-relax flag, but this is not being passed through to the
> assembler. Adding -Wa,-mno-relax to KBUILD_AFLAGS_MODULE ensures that
> the assembler is invoked correctly. This may have now been fixed in
> gcc[2] and this addition should not stop newer gcc and as from working.
>
> [1] https://github.com/riscv/riscv-elf-psabi-doc/issues/183
> [2] https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857
>
> Notes:
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  arch/riscv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 1f5c03082976..fca40511a8c6 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -60,6 +60,7 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>  endif
>
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
> +KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>
>  # GCC versions that support the "-mstrict-align" option default to allowing
>  # unaligned accesses.  While unaligned accesses are explicitly allowed in the

Sorry for being so slow here, I've gotten pretty buried and it wasn't 
clear this was a fix.  I put it in fixes with some tags.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
