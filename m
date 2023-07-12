Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAA7EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBx0iEUllS4BaiqZusInSejyPKGtlrjuYkrIMsSluJ8=; b=HcVax1KOFWHUKZ
	vG6PtQpmaRuFcqFpqyZ0Dvbag7KtlF5XpjnUdGfF+qvlbftLyGU3elK2pe/m3tVm1wZola+uTBrW4
	ebXkP0fy+1IsPA09CzdGqpBdgQ+AeMEDBC/upfofB3gAXwSvHutLrq+mJOikvOE7DdsTTdb3XzKIR
	+mWYu6QqMEDf57ozwAwpiux3SBf/9mYHYldIvIQXxbSOkwiz2vNq2evAlvMHk2CZ1OlYC/BcVHcrL
	O8RLbEXI4Dg4t2woXx52XDvE2cRTDxGYMthW2OdlNZ8ohXMdEImxK/qG7Fw/4ZXofl2SGkZ7MfosX
	vyDWERjOOmyWBM6w7Hag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTYy-00Ghlm-2Z;
	Wed, 12 Jul 2023 06:43:00 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTYv-00Ghl1-19
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 06:42:58 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-78363cc070aso299049939f.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 23:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689144167; x=1691736167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWfOSMrv6do4PAbxZtLX2gDNrKPpyct3TAi/IYd4WYM=;
        b=Hw3Ob/+Yca4KTN3qdRPzFpwgrFDjP8sfy07Z33AABHGClFhVX6UYE1MammcWVscMir
         8n4Nliv5JgZZHfjaxFTBijG/ZAVgEWmafu1isleFjWACqIeDDFhT7w5w8mHN87RzVUCZ
         yVoTRkyXLTHCc7Yc8bFXeWlv5XnnrERq42SrN7DpU6CUOzOCH2SYtuKAhAKJBMsVSRiw
         5RgriE8ZfTyHNr2wnm0e2s47CS0l38xItxBOdR7FGpuvKq2jN+mpaTnOg+zBP6FMLL/c
         AeoWkmE1YQZM0RdZGy0M/d9uCLyLJNNLeiPslnXfDcaBUeenAnevW54WtoYOxiU1UfEr
         hoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689144167; x=1691736167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWfOSMrv6do4PAbxZtLX2gDNrKPpyct3TAi/IYd4WYM=;
        b=UWHZh4J1f7KZBS6HARhc1ORQGmIvhGF4T/XpA8MdDdW9G3CABJ0/Ev9mZBs8exq8Fp
         vEparDxwsTtdxvtXBPNLIiBp3R6esXhqQLhEoGz9Nkmkw7y1FOq2oZXwLvewIAGkmQtQ
         B6JnxoUNPVgH0T1IFcPsuP7uOrL9eepFV8eWRxW3fhp/8NwfGm/a9nCfsiJjcA+/DxL+
         VFBhs+Xee+HCh8M4DDszEOmbTKTN3YxIR403up9uOH17TQP96xaPaNQDMAoSxrJBj5ho
         vCnNT0oYtQyF+JFvkgoX9IEcHAdGfkJzPS91N94nmmrLkSRfyTkzZVZ3LB55gu/h1jD2
         uXJQ==
X-Gm-Message-State: ABy/qLZWN0YLnT4VIDDkv+4CowAUUynOOXIDgAVJ4kLVtAOVwGa5zHFk
	5OR0Bc3L4Tr/K/BSp0odk6AQmQ==
X-Google-Smtp-Source: APBJJlGEvuxhL5L8C2Zwfrw9CRqcNzRA6M8IHu9gQ0y7YWiEP67ewnRtBRT1y1ssYvl/ZpHqbrdUKQ==
X-Received: by 2002:a5d:950e:0:b0:783:72d4:8c38 with SMTP id d14-20020a5d950e000000b0078372d48c38mr18434142iom.13.1689144167545;
        Tue, 11 Jul 2023 23:42:47 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id h22-20020a02c736000000b0042b48d372aasm1038592jao.100.2023.07.11.23.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 23:42:47 -0700 (PDT)
Date: Wed, 12 Jul 2023 12:12:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
Message-ID: <ZK5LYcQ0ZTmkiP4y@sunil-laptop>
References: <20230711224600.10879-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711224600.10879-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_234257_424311_86FBB1A6 
X-CRM114-Status: GOOD (  18.98  )
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

On Tue, Jul 11, 2023 at 03:46:00PM -0700, Palmer Dabbelt wrote:
> ACPI ISA strings are based on a specification after Zicsr and Zifencei
> were split out of I, so we shouldn't be treating them as part of I.  We
> haven't release an ACPI-based kernel yet, so we don't need to worry
> about compatibility with the old ISA strings.
> 
> Fixes: 396c018332a1 ("RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
LGTM. I agree with Conor that Fixes tag should point to 07edc32779e3.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks,
Sunil
>  arch/riscv/kernel/cpufeature.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..a8f66c015229 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -317,19 +317,14 @@ void __init riscv_fill_hwcap(void)
>  #undef SET_ISA_EXT_MAP
>  		}
>  
> -		/*
> -		 * Linux requires the following extensions, so we may as well
> -		 * always set them.
> -		 */
> -		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> -		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> -
>  		/*
>  		 * These ones were as they were part of the base ISA when the
>  		 * port & dt-bindings were upstreamed, and so can be set
>  		 * unconditionally where `i` is in riscv,isa on DT systems.
>  		 */
>  		if (acpi_disabled) {
> +			set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> +			set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
>  			set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
