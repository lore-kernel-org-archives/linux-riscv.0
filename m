Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C19C48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:00:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58CD6120A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B58CD6120A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qeoQTeH6MdB0ami/IslgbgsAbl/sVTptjG+bUnqrVdY=; b=0dMFM6OvXtCPrw2IcadoM4pDaC
	AYHSH/CBrqu6rtnu38CNCaEEH85DtSIWWqpt9AKcq9H6+DXqYvcGGZPvYIGiZrP8tjDFo+lVMOWLL
	Z5K+ieT93yfImVFKkBVpQ3cGUChLNMNW04G4PFi+CjzsJzBfmvEFc4/b5yFkT78/OUrM8pAE4Tajt
	svvbiaCMsw+JWZyvrG+fuqRpBLEc/oqDUa2VFBXd3xoOoAce2g6Om/+jsbORY798tqAcNMCkHZk/Z
	QnjMZfDDM1/XWab7BQ0fqG2oyFKZaLfo2Gz1xj4dL10vp7NFx1QLsx/1o3fs9htVE/Zs64z6sqWcX
	GQQsX2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrumP-007kBy-SJ; Sat, 12 Jun 2021 03:57:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrumN-007jrB-Eb
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 03:57:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id e7so3790036plj.7
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XeKsMiBCSivqZqJGijg7smXWpPAkTfjmdDjAR99WSqM=;
 b=oI5h8dC1CGJPDMTJMbIo/MSKy4tkaXw72BAzfrs/q/8G3+cIzWVHc4JQqXzT6HZP2i
 /O1X45uxvkxt+sBzve/17f0B3XhBNjRMweaOSzjfW3rpg8F4EP2lfnT/QpP+e+I0Jjs6
 FC3AFsx8jsicJfOmmxapT8QZ1oSR5OGnsFRTFDWY1WzRkScTd3KgYDpBMi3Gvo9/OU6d
 X/1qQzRDacCNnv6BmFJjI+WY0x2ApO1IpSekik3bWWMNJqZVZwvkRqrLQc+jVzR+jEk9
 r6MIrVKEgbVOeSDhSrwKS3ZxI7Q5piCUcW3DS1oSCVdQLhoAkNT1eC/QTE1ZnFhIwoKu
 pveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XeKsMiBCSivqZqJGijg7smXWpPAkTfjmdDjAR99WSqM=;
 b=O4wdxZgo9xV2BBM/KiehhVYnNhJ9MZp+YhOIm76DvW9DUUZ81LsMX2AfsgRShOMV3t
 hwUbeZ3rYCQQxuZEKo0JwIVBAZIuL30MV0UOAi7UswCjlw1B5tGx8rdKcnirUUW767hh
 vOG9KAw0pdli+TCjW4PBQLcKpoNm9dk8mO7SU8jQXzG4qUkPT1KFQYlKh66bmw+Tbz/3
 pV93lXsXepD1y5YOstHrE7rSnjQPcpUw7ukrO3ILt8pU3yAdQDvhnscRfpWtC8OfJH22
 cZbk5ZXp9uoM22NZ5QhNFEAhPBf03WVI4UWV19MlC+W2zAlXB6N4+WZG47CCOuYJ26eD
 Ra/Q==
X-Gm-Message-State: AOAM531AlCkO1AI2SCy1V6Iabtp+wSBRwkgpPGVXMGUDzsgmyG63BGyw
 8m4hpVrJlF3gB3lTpd1v+4vbsA==
X-Google-Smtp-Source: ABdhPJyY5WLBpy6Dw1/4RcbjdESopxYWIovjgDFCAIodRD6RpWBrA4wtD+HPPgi6Ddz2J6eicsuFKQ==
X-Received: by 2002:a17:90a:c210:: with SMTP id
 e16mr12162010pjt.234.1623470149140; 
 Fri, 11 Jun 2021 20:55:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k1sm6337315pfa.30.2021.06.11.20.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:55:48 -0700 (PDT)
Date: Fri, 11 Jun 2021 20:55:48 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 20:55:33 PDT (-0700)
Subject: Re: [PATCH v2 12/15] riscv: convert to setup_initial_init_mm()
In-Reply-To: <20210604070633.32363-13-wangkefeng.wang@huawei.com>
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-bc2d1e77-3bb8-44a8-83b1-a090c6581369@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_205751_512466_A10BC605 
X-CRM114-Status: GOOD (  14.98  )
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

On Fri, 04 Jun 2021 00:06:30 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> Use setup_initial_init_mm() helper to simplify code.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/setup.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 03901d3a8b02..52396874f859 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -264,10 +264,7 @@ static void __init parse_dtb(void)
>  void __init setup_arch(char **cmdline_p)
>  {
>  	parse_dtb();
> -	init_mm.start_code = (unsigned long) _stext;
> -	init_mm.end_code   = (unsigned long) _etext;
> -	init_mm.end_data   = (unsigned long) _edata;
> -	init_mm.brk        = (unsigned long) _end;
> +	setup_initial_init_mm(_stext, _etext, _edata, _end);
>
>  	*cmdline_p = boot_command_line;

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
