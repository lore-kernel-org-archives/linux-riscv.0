Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB9DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 01:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nzv9CWBC3we3scySX/1EBWNOsLRfNtQczHgYzhYM2Tk=; b=VGmMjp7xgyFoHitrDzNfa68RqX
	4W0Yd0u5WoTMZg+F3SUEEMKfDcL2AW/w90g27wlsxIxfu3Zu2UBfK+YSrCAYFb4aqMvI38sTRUv9Z
	f0DMMArXb3q4PnKty1Gip15qYb702km36WvT//42phTnG6Q29iuuI4nxhzqIA2KjjChkdtVg+sct8
	qf2qrcgoDwoYuMmPoa9XurQ0BsR/3rP8WhpoUwMTi6ENWh3H8tytFnaAc3+bKSQ6dj2rFGFxCPklP
	8dzv2dF/CVJ6lFkSIaKfNWJTCgNbdFwdZfe/L9UnXx9DhSYSxv8LdnIpKjXF6GwoC4pH/ESasQhq9
	NvEzcoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMgkk-00CBPz-VU; Wed, 23 Feb 2022 01:47:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMggF-00C9FX-IQ
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 01:43:06 +0000
Received: by mail-pg1-x533.google.com with SMTP id h125so18534088pgc.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 17:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EIgDsKHK/7A3hYjGzuwp0mt1Zx4DqedctDxyTOeLL7s=;
 b=zoYMgTMzBim7kT8E8RtAzBQzMnYT267FbUn9niV42OhWDDak0NhGQ8Ea/WIztMSdKQ
 WSxjG++qNqyUmAc2rFY4lbsG8EtYCif2aWPLPIhNyEZJFdnXyvMGv1g5SNsAeHcVaduN
 3aF9JUoL1uISZZVizP5eOdEs4wFcri1mJ7W2+7jH2qbukUw1tdGNQIlJ7nb9rT4vPg83
 DNDX30kjb/RQrzmTdb3zLlrb9dUO4t3W5ODDYJ1SgNy4mYdShMW01rxlYfOZC4Zw1ELa
 Ncu4htbBSvAwLAgsMrP0ne4wobOp/VZfsAFVcBGt3znGcbkmYmTp/NzzfAR3cyfAxHK5
 q+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EIgDsKHK/7A3hYjGzuwp0mt1Zx4DqedctDxyTOeLL7s=;
 b=uKOAKhrGTMy9wef7jYFxqopuXgiv01X+5XvCGGPa7c0Q8b/AywQTbuZoQojfVxQfMB
 PJXsPq0hXR/oGqH9dylsz9VQLkEqvvcn/A6Hu6jSUPeTUy8tDMg5iDgc/NZWKE3nRNob
 txiLjMvYnPvuCTLiz2hXnktZ44Pr/0N/ignnFGR2J8TGdSLMnxcP4HuWN+I0wzRvN5yc
 SKBeVF5pG7IwaPiea9jR30Gy37suTKUaZZCDWZkIXSS10mxqZk5my8SGWmeXOT7x2cGL
 6yQbrYFJE+62bVzDTXgFKNRe3aERLoRq8dIfienKANDE35v0B5EcIod+VkP4pywXNbPF
 lEKQ==
X-Gm-Message-State: AOAM531Ni6OGcN23I5FGULq3/fEchpZmj01t1pvu1khlPwn5s6rTYVc1
 jNzoJfm8xlIUrrQED20yg3iIRg==
X-Google-Smtp-Source: ABdhPJzyj2zCoiD8VneIC0PIYB0EkFnPoGuLVRxasLol3DuwplyySz8DnRpIoBlUCpRMhRxzsN0fNg==
X-Received: by 2002:a05:6a00:114f:b0:4cd:65d0:7dd5 with SMTP id
 b15-20020a056a00114f00b004cd65d07dd5mr27015541pfm.41.1645580578972; 
 Tue, 22 Feb 2022 17:42:58 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id h7sm18228501pfi.128.2022.02.22.17.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:58 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:58 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:22:39 PST (-0800)
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
In-Reply-To: <20220201150545.1512822-22-guoren@kernel.org>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org,
 Greg KH <gregkh@linuxfoundation.org>, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, 
 wangjunqiang@iscas.ac.cn, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, 
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 
 x86@kernel.org, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-6be88a24-32d7-451d-8a78-b9dcc90ce991@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_174259_687360_63A57719 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, 01 Feb 2022 07:05:45 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Current riscv doesn't support the 32bit KVM API. Let's make it
> clear by not selecting KVM_COMPAT.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  virt/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index f4834c20e4a6..a8c5c9f06b3c 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
>
>  config KVM_COMPAT
>         def_bool y
> -       depends on KVM && COMPAT && !(S390 || ARM64)
> +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
>  config HAVE_KVM_IRQ_BYPASS
>         bool

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming Anup is going to take this as per the discussion, but LMK 
if you want me to take it along with the rest of the series.  There's 
some minor comments outstanding on the other patches.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
