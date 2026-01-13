Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540A6CF45D4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 02:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSFhpf2e7AL6Mz1wMtUFcWk++v73yH9iurHSXc1jiXc=; b=fbDkDIDjMIESED
	HB6w0CIkNXuXHBV0qff4SmNMBXYGBYEPiV+nWJ/cbl+P3Oh/J9aEqYjyAGDUw4am51QHdB3f0rYpP
	3Bf9jaPvN0PbUafoI9dTtcAIx4eHYp074lAWwtatCZvee3Po5bFmLCoCdM74D5USq3H1klTQ9wHlS
	GIaN6Q1dH7764ncJqSXyJJ/qSMGwnwLX8CsLSl92biSDQYenWDJLxbTRyYBfxMaEvQHD0EryFZvrW
	m6TjfvDF83GcdeaMe6zrAYDQmlgkg1YiobZ12wQrHrIE79roCnB5ucGe7YHmNboMYt1yVzimVObs7
	dTKbVIx4/RbuiIr0p6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUHE-00000006R1c-0837;
	Tue, 13 Jan 2026 02:37:00 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUHA-00000006R0z-2Zwv
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 02:36:59 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-11f3a10dcbbso6401028c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 18:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768271815; x=1768876615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ySOV1qaMnTkxAOEjKtqV21Yq3qmzkn5kZVxToJlMeM=;
        b=TICIcE/zkQ7cn+b9jyBk4+zMLNXaK15uA8R41Eo8wXoqOf5YL9A+xv6pi5a0kynqwZ
         L3He5KBStwcSNp5Jq9n2oXVP/GPk7t7Vl1ecFg0LPu9tCxZfxNV3tGIEma/aLbmVD4ga
         AsqHZNteyWOsdmCfDceRWaO8jQ8RB+ceJGH4PRtHyxHubCPwfUaWu7YcRwSwjRMnoRDC
         /SsXCNT+N7QqnyBSBJGUo4aAwIOuiKv1O3qzqpuOohzg6V8YBTeuGsxclB0KGKTheR1t
         WlhRIkgESGqUgTam8d192t3xBwPbTnsBXfmQrhH/Fg23wTattgKdWYwtSgz7UKDBca4R
         mjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271815; x=1768876615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ySOV1qaMnTkxAOEjKtqV21Yq3qmzkn5kZVxToJlMeM=;
        b=ut+G34MSbmsRftKHpovk0scfpJQuBKKKN0jd1jUoF9BNcsEPjGEDMmngXEZEq9CWet
         saPflT5l+ZjR+ft/B1BtRl8U8l4BwJJOLc5n40eW/Q/zJRzVYdPPT3W7OiDA5t+t3wMw
         lnxphKyIeBFHlkYLfXgPp/TSBRm4GiGejeu/EDTqdVJh5e1pFIT+1fuIPr2EBi6Mb2GE
         ypHO9aOx9Uosx/XmS4xGENylHVsPVVtcoIgvlk5HTd5SjwHOcdPWYlbtVCwDMrL5KNU0
         Uln9TdW6ab3NkFbOkiSl3AklB6c4UKSABj2xEcK165dbOuAGBEukl2iW+6TMpXtUi+Av
         V6Hg==
X-Gm-Message-State: AOJu0Yws9R+mziCZxZWpQkAmPnPYPHxcaOY4nSK8IxJrjgCSrU7jQCke
	V/19sKdUltGeC9bHWWbT/x2ivShb5lHM8FTu0ikMs141pWWZjeTS6M9l
X-Gm-Gg: AY/fxX5a6UA7q8QomdigyjTb0xGWwW5+QEW6p2/80c77r+6QSJRZecUvamekrTBeLSJ
	MYTNxdP0sJHLidwIEmMJRXybfN7luqEMmTe/TwQtf48TyQiVLKYIa6Dlb5Vx4Bc2aHbQ3XfXjeg
	cHaxL0Y8FtUiNcmCwzEJAHxVKHFHPA+20jNOIW8s2IetAqrhkzjw4suWX8P/ZmePNu+VB8TsmFW
	VwovsN8L7GvmnkketJPTP0lrOVUcZSeKxgQm/KTLI84CsAixGrrcuLoENO4Fb/2iNzDzxd9yD4D
	AcwUjGCz+7Fth5uE75NGU1pZH12+Ryg34xfs3vAKKyRgXW1R3VPCotvQLHv0GnqIfrxwjBy0+IN
	vDOPzzzCtYVFMZP5g9unyahnSJC4qDzKGXIe041RvQ+w4fyum1H6wgVSehFzAUNPxf1Z4tma5Ei
	VIgeqiStPeTg==
X-Google-Smtp-Source: AGHT+IGpFCitrEaTw4etF3DikT7lkfaNYnJTI14jlBptzrIbvJlxQxJoE7rmbUdEP06y3VG97kDZXw==
X-Received: by 2002:a05:7022:6096:b0:122:415:25ed with SMTP id a92af1059eb24-1220415265amr14083544c88.49.1768271815354;
        Mon, 12 Jan 2026 18:36:55 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c16fsm26823274c88.10.2026.01.12.18.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:36:54 -0800 (PST)
Date: Tue, 13 Jan 2026 10:36:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: sbi: vendorid_list: Add SpacemiT Technology to
 the vendor list
Message-ID: <aWWvhPHH0_VUbeUY@inochi.infowork>
References: <20260113-spacemit-vendor-id-v1-1-f9650fb8acbc@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113-spacemit-vendor-id-v1-1-f9650fb8acbc@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_183656_653070_4CBF00D9 
X-CRM114-Status: GOOD (  16.54  )
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

On Tue, Jan 13, 2026 at 10:32:21AM +0800, Troy Mitchell wrote:
> Add SpacemiT Technology to the RISC-V vendor list.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/include/asm/vendorid_list.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index 7f5030ee1fcf830b17c6529e9c430fe19ac68b05..5f75408ddee75d1e45c2c72207c66c5905f9b84d 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -9,6 +9,7 @@
>  #define MICROCHIP_VENDOR_ID	0x029
>  #define MIPS_VENDOR_ID		0x127
>  #define SIFIVE_VENDOR_ID	0x489
> +#define SPACEMIT_VENDOR_ID	0x710
>  #define THEAD_VENDOR_ID		0x5b7
>  
>  #endif
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260113-spacemit-vendor-id-841edcdfbf48
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> 

I see no usage, this patch is useless.
Please submit this code with the patch that uses
this ID. Thanks

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
