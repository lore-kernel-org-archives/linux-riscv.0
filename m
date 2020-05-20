Return-Path: <SRS0=TnxY=7C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED404C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 May 2020 22:50:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26A6206F1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 May 2020 22:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zzw0LZpk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="EIBjZ/F9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26A6206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QKwUc2R6uw/eDgmTMc7GXVJUbTy1jO4XiUWek83viy0=; b=Zzw0LZpkTi57uT
	okf2is4+1BvkTvg3Q2cKXaBwOem8id+QKzpQsSbHvEZ7q+LnAdNsdKoB7zqIodwuYJDJOcVgAjec7
	6mRWUiHRO2f540bZIp2Ajz24csOdqBCCdpGVKXczLsONT8/eMkxxmyoR1eXs5Kyz85EPCKbq4e5lJ
	r5Wxom+8+WU87LpQw0fwsOoRCBEQ3nrP5u7XZIr8FTXeSRdp5a+FTD8U4ZEs6pMvJlAm+w8zamrO1
	cR7zsA3vTIpq7ZQr6eg7DGnZu/lPnTgtApvp01HhLwGxmMna7f3h38FRSCOW73NhEDRntnXjQBK9l
	b8lKRXordTRP6s8Lh1CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXXF-00022D-Rg; Wed, 20 May 2020 22:50:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbXXD-00020v-TU
 for linux-riscv@lists.infradead.org; Wed, 20 May 2020 22:50:01 +0000
Received: by mail-pf1-x442.google.com with SMTP id 145so2290796pfw.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 May 2020 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QKwUc2R6uw/eDgmTMc7GXVJUbTy1jO4XiUWek83viy0=;
 b=EIBjZ/F9r+i1Uxd18RwcwxXQVkYbaLrUocOByK8WgOLNbFAPUA4PhtM3VxYNkiky2k
 MtKNPT9Z0wI0pYeXs6wByOFK/84soRVDHeVVT8LR3zjhz8I6nHgVtg2Z3FnsthUWh6kw
 +WRp6S34NU0IqRFAjTikS376odk3+3C7tkXaOLxdbKeBNC7UBMG+itCpT+fMUk4bt663
 UQQp/CYHbyYYDCre+cnmgwD7jZ+qjjQg50mxchLOh/uHaCrJVffftMhqqCwb5QT8PcDb
 qwsHRlYMUHyCKHPyJ74Sid+Jcjtv3LXljsr8WlvCb/HWkIflaMCub9W3S6OEPTX1PRtS
 3mYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QKwUc2R6uw/eDgmTMc7GXVJUbTy1jO4XiUWek83viy0=;
 b=taig9kMgdfdyF22oY2C/1iAU5QXk5y7I30y+aiCq1M5c63M1sVfYgHUypli0NsQIjS
 jL5sEm/MhhEJLR9C3DzLT5dvhYwuf7SjxyzpGtndZCepTmdspqRVSNxKFLd0gUGvHQI9
 kqYIOmnPOxZlW9OAZKI01zoL4A8cPeHGyRQg+dhf4e6gdYcc/34t8I3nUZ/K3oiZcF26
 XoZ6heo5lN2UUBZVn4UoQl1U00u8ubOGcxoDtHCTfMUIRfualY/AfEkDHqWZYVQw0I7E
 HqeSj6k3Jf2bAZ0lRtUdieEhKKk5+8G3BP6YbxvtipOra1Kt4yZ3vvEw4Qux629my75f
 ujkw==
X-Gm-Message-State: AOAM532QGKIIPsUhAzaA/6Rd3tRH0v1qWzqBA8R0HeTxxFId+OW9nomm
 cm3Gd81Jz1aLd0wVl1ADTtqLcA==
X-Google-Smtp-Source: ABdhPJyHDWPJOXCR6ItvC+aD357uYMEJiQMYkP/S6dIex9nbbID5CupKL+DroIq9cN3c4VmBEIaiCw==
X-Received: by 2002:aa7:80cf:: with SMTP id a15mr6904139pfn.124.1590014997875; 
 Wed, 20 May 2020 15:49:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d35sm2553068pgd.29.2020.05.20.15.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 15:49:57 -0700 (PDT)
Date: Wed, 20 May 2020 15:49:57 -0700 (PDT)
X-Google-Original-Date: Wed, 20 May 2020 15:46:51 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Fix print_vm_layout build error if NOMMU
In-Reply-To: <20200514115335.110603-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-533eaf79-af8c-4bf7-9a18-0990f22a2efd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_154959_955301_456367C4 
X-CRM114-Status: GOOD (  14.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: wangkefeng.wang@huawei.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, hulkci@huawei.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 May 2020 04:53:35 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> arch/riscv/mm/init.c: In function ‘print_vm_layout’:
> arch/riscv/mm/init.c:68:37: error: ‘FIXADDR_START’ undeclared (first use in this function);
> arch/riscv/mm/init.c:69:20: error: ‘FIXADDR_TOP’ undeclared
> arch/riscv/mm/init.c:70:37: error: ‘PCI_IO_START’ undeclared
> arch/riscv/mm/init.c:71:20: error: ‘PCI_IO_END’ undeclared
> arch/riscv/mm/init.c:72:38: error: ‘VMEMMAP_START’ undeclared
> arch/riscv/mm/init.c:73:20: error: ‘VMEMMAP_END’ undeclared (first use in this function);
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Should CONFIG_DEBUG_VM instead of DEBUG_VM
> - Based on riscv fixes branch
>
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 27a334106708..736de6c8739f 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -47,7 +47,7 @@ static void setup_zero_page(void)
>  	memset((void *)empty_zero_page, 0, PAGE_SIZE);
>  }
>
> -#ifdef CONFIG_DEBUG_VM
> +#if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
>  static inline void print_mlk(char *name, unsigned long b, unsigned long t)
>  {
>  	pr_notice("%12s : 0x%08lx - 0x%08lx   (%4ld kB)\n", name, b, t,

Thanks, this is on fixes.

