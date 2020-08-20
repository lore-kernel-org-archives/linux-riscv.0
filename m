Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B3AC433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABBC207BB
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ku3BpDDx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="W94gZcQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABBC207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=y92Lyjqb2aDbHQ5yc90MBuhJi/zfEz2Y1I0zhF9hSZg=; b=Ku3BpDDxWFtkatgyNrINoUNjq
	ht6+occJN423t4/8IjgZE3h7OSykPZQZ0P+JmvEbqmID8tCgTMvw4Cn6tiVd6KyNOn5E+cjSp/Npi
	JBjA1iDxf30J3kYTbwFpzuUtDoNDJXK0zjYqmIpqEMCoSW8vBkg489PoxgdC/KyoU12feHr2RD0WJ
	lg0R4NhB69gLDry4lUt8YovezFdJ0I2W9iDXQOVXMJK10P5ftnvO29FkZRwINuZeyONVBlHpn6dY8
	o9NxI2jlpC7IdeeEm2G4niCXqzT4s5OL4PoiYHvX9gNZU2eOhjIzOyeC92aN1Z2S2Dt0xrJobejA9
	gou3/i9XQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8rQj-0001SS-J1; Thu, 20 Aug 2020 20:45:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8rQh-0001Rb-1L
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 20:45:00 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t6so1505489pjr.0
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=54ABhVyW2hfQecEnwMQxuYRtT1ryW088E7woHqdZaXY=;
 b=W94gZcQeRoABCsOVtsMwPlJecPyyC9T29k5GLRV7ZJlrnVuSzmQqnfd96ZLHu18XD7
 TpdOUZuNjFfS+knX1eRiy2ZbFNQu3bn584apOPv5PiGDgCmqUXaRiGvyHy15cUsjxuoO
 nT9MAnh/2CcmfNqvYh6a364pYdH/RwbjYTux3pW7cUOgfH9feUnCem0tjPyEW2S62oeh
 DGiB4d1HNWa/3KpuMk+I9AuwoL3MMAReZhNH57d2RF+d1uQMFdFbIXgG3PcGFrmNq/o5
 pRnBXa9E184SV9KgLOWXA2KgJdl4hPhyd9fLkig7NZd28AQ4VjXCMrsSf4OshVtiZYUg
 hGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=54ABhVyW2hfQecEnwMQxuYRtT1ryW088E7woHqdZaXY=;
 b=tnkH2PoIc4HMLqvTKsTY6JQVpRp+J06YkrAiv0VtnPlViaawY7p8Q+NdhC4PyTEAdv
 DthMMljIfWPzR306Nyq3kqxseVgtime8M0L9vzwI9TMKwDhiGSFIIkQRVGbxrzorVCdC
 Y+BaUUZTOY1/R26Yr6a2OUBg2wVt6G8mkl4dT9vgd6qVI7V9x9YEn7DxBvgEItQlS4U7
 r6G079/ifP+C6t+6rCtZIQv1iPlAzs4laZXkz+X1KJEdCqNggec2aumbu1DRJ+K1DNgM
 WCghPL8kwt7Ia+jdoTk0BA8e7M5hko0KOOghI+ElYWtyZ3VZyOVsLBeacW9YXVeocMzt
 4Y3A==
X-Gm-Message-State: AOAM5322ORufY3bsNM3BPWw/jETwhSv6zg1tD5ibv82Xys7wBl/C//cg
 NUMFIxGP9oe3aqZrhZqDdTVu6A==
X-Google-Smtp-Source: ABdhPJwqU+99F74bSw1tb/ADlJjEt4yJRkSqYxno9vow94VLDSADcJF13NgH0u6R+z2QFvSFGv2aMw==
X-Received: by 2002:a17:90a:7348:: with SMTP id j8mr51736pjs.137.1597956296618; 
 Thu, 20 Aug 2020 13:44:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q2sm3590625pgs.90.2020.08.20.13.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 13:44:56 -0700 (PDT)
Date: Thu, 20 Aug 2020 13:44:56 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 13:35:06 PDT (-0700)
Subject: Re: [PATCH 1/3] riscv: Set more data to cacheinfo
In-Reply-To: <3ca47cfde607516e51f78f1645357ca739e775d0.1593766028.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-cb490336-f234-42e9-b799-c429284963ea@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_164459_264899_2F982F73 
X-CRM114-Status: GOOD (  23.66  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2020 01:57:53 PDT (-0700), zong.li@sifive.com wrote:
> Set cacheinfo.{size,sets,line_size} for each cache node, then we can
> get these information from userland through auxiliary vector.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 59 ++++++++++++++++++++++++++---------
>  1 file changed, 44 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 4c90c07d8c39..cdd35e53fd98 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -8,12 +8,46 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>
> -static void ci_leaf_init(struct cacheinfo *this_leaf,
> -			 struct device_node *node,
> -			 enum cache_type type, unsigned int level)
> +static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
> +			 unsigned int level, unsigned int size,
> +			 unsigned int sets, unsigned int line_size)
>  {
>  	this_leaf->level = level;
>  	this_leaf->type = type;
> +	this_leaf->size = size;
> +	this_leaf->number_of_sets = sets;
> +	this_leaf->coherency_line_size = line_size;
> +
> +	/*
> +	 * If the cache is fully associative, there is no need to
> +	 * check the other properties.
> +	 */
> +	if (!(sets == 1) && (sets > 0 && size > 0 && line_size > 0))
> +		this_leaf->ways_of_associativity = (size / sets) / line_size;
> +}
> +
> +static void fill_cacheinfo(struct cacheinfo **this_leaf,
> +			   struct device_node *node, unsigned int level)
> +{
> +	unsigned int size, sets, line_size;
> +
> +	if (!of_property_read_u32(node, "cache-size", &size)) {
> +		of_property_read_u32(node, "cache-block-size", &line_size);
> +		of_property_read_u32(node, "cache-sets", &sets);

Presumably we should be checking for errors here as well, rather than just
passing arbitrary values to userspace?

> +		ci_leaf_init((*this_leaf)++, CACHE_TYPE_UNIFIED, level, size, sets, line_size);
> +	}
> +
> +	if (!of_property_read_u32(node, "i-cache-size", &size)) {
> +		of_property_read_u32(node, "i-cache-sets", &sets);
> +		of_property_read_u32(node, "i-cache-block-size", &line_size);
> +		ci_leaf_init((*this_leaf)++, CACHE_TYPE_INST, level, size, sets, line_size);
> +	}
> +
> +	if (!of_property_read_u32(node, "d-cache-size", &size)) {
> +		of_property_read_u32(node, "d-cache-sets", &sets);
> +		of_property_read_u32(node, "d-cache-block-size", &line_size);
> +		ci_leaf_init((*this_leaf)++, CACHE_TYPE_DATA, level, size, sets, line_size);
> +	}
>  }
>
>  static int __init_cache_level(unsigned int cpu)
> @@ -66,29 +100,24 @@ static int __populate_cache_leaves(unsigned int cpu)
>  	struct device_node *prev = NULL;
>  	int levels = 1, level = 1;
>
> -	if (of_property_read_bool(np, "cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> -	if (of_property_read_bool(np, "i-cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> -	if (of_property_read_bool(np, "d-cache-size"))
> -		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
> +	/* Level 1 caches in cpu node */
> +	fill_cacheinfo(&this_leaf, np, level);
>
> +	/* Next level caches in cache nodes */
>  	prev = np;
>  	while ((np = of_find_next_cache_node(np))) {
>  		of_node_put(prev);
>  		prev = np;
> +
>  		if (!of_device_is_compatible(np, "cache"))
>  			break;
>  		if (of_property_read_u32(np, "cache-level", &level))
>  			break;
>  		if (level <= levels)
>  			break;
> -		if (of_property_read_bool(np, "cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
> -		if (of_property_read_bool(np, "i-cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
> -		if (of_property_read_bool(np, "d-cache-size"))
> -			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
> +
> +		fill_cacheinfo(&this_leaf, np, level);
> +
>  		levels = level;
>  	}
>  	of_node_put(np);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
