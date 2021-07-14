Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44691C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:47:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9066613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9066613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+VrYue83Y4cVkLpWpGbVmkqYuw7gLgGyWzzMzWDs1E=; b=afS34Sxu1TCuh+
	roro0fFH7fEAv/EZLqUpZw496uoRDX6LFMWN38Ehly0aWBxgXseKA7sNk3I+mJGeZUUTrvid3fh45
	aF+7qc/4IZPk45zfRqGqKFaEpW+MfjkFB/Do93nXva6YDN7uOrwvB4ya3AX4n8hqmtXXyR6thMQEJ
	ytOqOB7UnbqY5B0GJvAnBj7WNv7565DRlPMpN003p1A0GpQ4UU3tHx2UZIY9Uz0D8ihyS5Tw1A3pf
	vxaryKovlllDf+qgGjCL7gR3/cdiwLZOv2Dk45tsZ4Qgcq3naqEq0JxuQxrdKz1qD5fK6fePu2ziG
	U4ndEYvxJgmHjW2Kkh5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fDv-00Di6W-PA; Wed, 14 Jul 2021 13:46:51 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fDi-00Di3f-81; Wed, 14 Jul 2021 13:46:39 +0000
Received: by mail-il1-f175.google.com with SMTP id y6so1597608ilj.13;
 Wed, 14 Jul 2021 06:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bylNDni7LUKM7pnvITfXsrZTIr6B2PAmOuvv1NHx8Os=;
 b=AKligXEJntrAYOgAjPJXzAM4ahA+AIQoQrtOJFh962vEzXJnfasttuDRl7TmrXBjwT
 8YgeKx7qdn731i93ck+5KHfQV21ZmOSG87WKkFAUOUeyyW/7UxDEtoG1pY/d3m5trHF6
 nMTBUF3vYZMcudupLbVgF/BWOKyCnqIlSGbLg5Edv8ErRkel/Gx+urp/60mxQbrSPSEs
 vA+e3Zayj/pPaYRzzm7h+6+7KJOPEm9yGpKU0hmrfahZ2lo+OSBoCbzH4lMNigetSmqt
 PdddwF7h5iOvx5XuGwDUiMT1Q8JmmcPo1wRqGQ4iGAnTIMrwlGRuLj3V1TbWYPHoD8QV
 Vo+w==
X-Gm-Message-State: AOAM533pq/o/IuWPDwpshNdG0DUDETz+gX0AbupTRXgJmXtp7tPQdm/C
 9qxgNvL2Nv6KpywQ38Niiw==
X-Google-Smtp-Source: ABdhPJwzly6VLXsrTTboxhXnHeZCdEuUQxDBu27t3pSa2+1X8fR4x8BA5P9eHwkkY5vz+JeKbPGq8A==
X-Received: by 2002:a92:8712:: with SMTP id m18mr6301471ild.132.1626270397009; 
 Wed, 14 Jul 2021 06:46:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id t8sm1178729iog.21.2021.07.14.06.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 06:46:36 -0700 (PDT)
Received: (nullmailer pid 2452887 invoked by uid 1000);
 Wed, 14 Jul 2021 13:46:32 -0000
Date: Wed, 14 Jul 2021 07:46:32 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>,
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] crash_dump: Make elfcorehdr_{addr,size} always
 visible
Message-ID: <20210714134632.GA2441138@robh.at.kernel.org>
References: <cover.1626266516.git.geert+renesas@glider.be>
 <0721f629d5e75b7b7e655458a63cbd767baaa409.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0721f629d5e75b7b7e655458a63cbd767baaa409.1626266516.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_064638_331458_D5253737 
X-CRM114-Status: GOOD (  20.75  )
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

On Wed, Jul 14, 2021 at 02:50:11PM +0200, Geert Uytterhoeven wrote:
> Make the forward declarations of elfcorehdr_addr and elfcorehdr_size
> always available, like is done for phys_initrd_start and
> phys_initrd_size.  Code referring to these symbols can then just check
> for IS_ENABLED(CONFIG_CRASH_DUMP), instead of requiring conditional
> compilation using an #ifdef, thus preparing to increase compile
> coverage.
> 
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4:
>   - New.
> ---
>  include/linux/crash_dump.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> index a5192b718dbe4f9a..ad31893d13d634de 100644
> --- a/include/linux/crash_dump.h
> +++ b/include/linux/crash_dump.h
> @@ -10,13 +10,14 @@
>  
>  #include <linux/pgtable.h> /* for pgprot_t */
>  
> +/* For IS_ENABLED(CONFIG_CRASH_DUMP) */
> +extern unsigned long long elfcorehdr_addr;
> +extern unsigned long long elfcorehdr_size;
> +
>  #ifdef CONFIG_CRASH_DUMP
>  #define ELFCORE_ADDR_MAX	(-1ULL)
>  #define ELFCORE_ADDR_ERR	(-2ULL)

Seems like these could be needed and no need to hide them, so perhaps 
just move the #ifdef down.

>  
> -extern unsigned long long elfcorehdr_addr;
> -extern unsigned long long elfcorehdr_size;
> -
>  extern int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size);
>  extern void elfcorehdr_free(unsigned long long addr);
>  extern ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos);
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
