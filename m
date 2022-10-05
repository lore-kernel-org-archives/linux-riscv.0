Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A1FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1H1jwtzVUdnEJDo+lJHpaKBD56lgXMEKPQ06rLoU64=; b=TzeiJHXUgOMsQA
	qirQy1bsKqlDm/QhFlKHocu9XtOuVoDbQmcZ1dmaFD4DWl7ULGTUosrSXPnriqa9uTbvDkMLGet4f
	CxPhzPyoafce6UDye/eLdS6LOqvOGsRxtr84PRgcJoY2FHkuxJPP5odF9ro1pCk42BgUWKzhvGNxX
	RD30J24yI58rD6fzouXb/LMl1Cb9ENqK7ywXQXIj6/TVa/lOmjfvtCOmoHZlFRt8aEZOVHjeiINaQ
	AUG5h+oMyxTcTX9HzGSS+e+8SU5bHHHs63tPZCe2vmebVRKvKeaCL/Fvhum/rGJUwl1qWFC4I7Kz5
	26AbmBZrxSMsEI3qG0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2RZ-00DlN4-1u; Wed, 05 Oct 2022 11:20:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og2RV-00DlLi-O0
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 11:20:03 +0000
Received: by mail-ed1-x530.google.com with SMTP id e18so22502629edj.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 04:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=nDwYc87OENP2qGSJZT4fezkaOuvBy89eBOveYwbzQSg=;
        b=H/KjYGlYNTVeXlP1ZH3RoJtOmUC7lKJZIyU7AtBZZ4dm2KkSB0J8IQr6owHSzFbp7J
         G3BK11bYyoxKa1rFGHP0KI938nCi6NN/jlet2QV1t/aTtf8PmWiAGBToZLIzaX2DJ13a
         5swhqNGrx7crd9ct8Ska1OMH/0L3mrDK2sxSToVtTmae7TXxNQRlQkC62Jj5oeUuaNmP
         URxkZCMM8kGisMnWhIHInrBp87J7s8xnluaNwvgqTgjcGw0u0PtY7e+vjDH7C7VI7W7E
         zkCyRQSAZkB/V9umThKiBVkhaaiYaixDIxWufpMudetpRX5f07ICkPXq6nP3HNn6J3+E
         /9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nDwYc87OENP2qGSJZT4fezkaOuvBy89eBOveYwbzQSg=;
        b=PaoGDmrOOUdLPUO+OEGZaNEjEGGMxGIb5jvDqtaUSsEZFWB+QAWbEFCPXsGOHB1L73
         DVp6Wm0dMlB8P+XAxtmpS6zTyMNYU+sJ+HmgLHXVyKIhPsp5j0e6Wv55P0yDp2byakex
         BIU4iRaa2JSmgkkm9O2F/X8UrEmxYAwh4YOt/OrIu7Vo5uSnQkyC/TMa4ZB9vZ0yv9eR
         3JbFiJUKp8/G2FOxf10eN7odAintOinib95iDgY+UYFV4aL7j/q8L+9FPUG1qyYSuVBk
         qJSk7DBaV5xlpGUAcycXORb8dCQjq+tE9OQbylvYmHY7/3rvDqeOsDuGwEY1nwCeqQAW
         2RxA==
X-Gm-Message-State: ACrzQf3Oid9vVXi0yGFpCh+cVgYZqCBuvoNN5U8Ft8klJdW9nXwleqwz
	X+sqGAvjZK8x3R4vxwMMzL+ZLg==
X-Google-Smtp-Source: AMsMyM4WRPWDABMOHuqQEI33zOdO1xkv1g2WJRQSsjNfkvtG5CGHdxkg9/UCPwnJX/XwHWYt45N+XA==
X-Received: by 2002:a05:6402:1909:b0:451:ace7:ccbd with SMTP id e9-20020a056402190900b00451ace7ccbdmr27374338edz.276.1664968798989;
        Wed, 05 Oct 2022 04:19:58 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7d805000000b004533fc582cbsm3659923edq.21.2022.10.05.04.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:19:58 -0700 (PDT)
Date: Wed, 5 Oct 2022 13:19:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 2/4] mm: support Svnapot in physical page
 linear-mapping
Message-ID: <20221005111957.ipwsokzrmf4qsfx6@kamzik>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221003134721.1772455-3-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_042001_807004_84D7B29B 
X-CRM114-Status: GOOD (  19.21  )
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

On Mon, Oct 03, 2022 at 09:47:19PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot is powerful when a physical region is going to mapped to a
> virtual region. Kernel will do like this when mapping all allocable
> physical pages to kernel vm space. This commit modifies the
> create_pte_mapping function used in linear-mapping procedure, so the
> kernel can be able to use Svnapot when both address and length of
> physical region are 64KB align. Code here will be executed only when
> other size huge page is not suitable, so it can be an addition of
> PMD_SIZE and PUD_SIZE mapping.
> 
> This commit also modifies the best_map_size function to give map_size
> many times instead of only once, so a memory region can be mapped by
> both PMD_SIZE and 64KB napot size.

I'd prefer to see the best_map_size() change for PMD_SIZE and PAGE_SIZE
be a separate patch. Then, the NAPOT_CONT64KB_SIZE support can be added
on to a ready best_map_size(). In fact, I'd prefer this patch be dropped
from this series and the best_map_size() for PMD_SIZE and PAGE_SIZE patch
be either posted as a first patch of the "use svnapot in early boot"
series or be posted alone, as it's already applicable.

> 
> It is tested by setting qemu's memory to a 262272k region, and the
> kernel can boot successfully.
> 
> Currently, the modified create_pte_mapping will never take use of SVNAPOT,
> because this extension is detected in riscv_fill_hwcap and enabled in
> apply_boot_alternatives(called from setup_arch) which is called
> after setup_vm_final. We will need to support function like
> riscv_fill_hwcap_early to fill hardware capabilities more earlier, and
> try to enable SVNAPOT more earlier in apply_early_boot_alternatives,
> so that we can determine SVNAPOT's presence during setup_vm_final.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
