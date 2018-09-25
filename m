Return-Path: <SRS0=2CuI=MH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2C5C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:20:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61C712086B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 25 Sep 2018 17:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3JAnSoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZOLDO7/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61C712086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=LWmIRJVBh2RQ5qKb/xksHcBcvp/bT9fex84Xaja+JpI=; b=d3JAnSoVapFNOxDT7lSAPkvOU
	PJ3yJJJdpv/k9MSdgjTo082CXq2TiagWVn2botD3sZY64AJwwfrMuroWY+EF2gPbZACnN32oAYObQ
	wFSCD3Yn1LLbv6GaJP3k2TnfTNIe0Uyxu0weKtwnaLpP9SR0/V5Dv27VUPTAbpMZfQKViyf38bwHA
	+XAGCImmv0Rhm5Fz1gpZtFunR2yS9E3dO/sh0Fs9I/XN+WB1eto44pKko1XB6V9cBxzeIVcupGXtL
	M04UXSWPLEoIWlaz9whI3GMT8/XlaSvf5divNAXRwb2OasJorWCrngbmoFJentVDz7Gt4J4hunOfJ
	lon2tnnDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g4r0W-0007RG-9a; Tue, 25 Sep 2018 17:20:20 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4r04-0007J1-5N
 for linux-riscv@lists.infradead.org; Tue, 25 Sep 2018 17:19:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id d19-v6so12051675pgv.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+K42w9hAoCw3bXE0J05cc60xYmthfUb/628tvNagX78=;
 b=ZOLDO7/ajuarS58qVuWOa1VUlpT0ijP2FvWUx3k1MYDcYPxCSthL92f96XKsCw8BdJ
 Or414jIdi4MeokOSm44kEHZvLb9pu9wyh8bdjmJjlsySwGFLFQ04ihjqhqccmDXk07hL
 aG3UCiZmKcH0njlykcqK2c+Nvyjnln8NndEYcqXilqmFSfns3HaxScu2n1ARstOcc3hr
 3FvY+CGy46B7xp2Cuu7NmHK2ADP8PXxx5bEgNsV4IrBtetywYK7b1mybNGh6nikkgwec
 XQNz/8G4hyNkYehtUKxN2ibXZ0oP7thADFuRZx+ywlA+4FlFE19DPQ9TrHDUyvrNGhy8
 NtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+K42w9hAoCw3bXE0J05cc60xYmthfUb/628tvNagX78=;
 b=IqbQqSnT71PkiyvLWPuHwroYPpejBCqu47ufitrOE8ARPYsSZ/1EQtQYVqxc45v536
 QoPjJSWXYfayYvOfMUAY9O8MSTWLcuLawlSY797IlCFZhrVyAuepaRMLbYZi9rpO0Abe
 YGA654kqUS55U39SnqwOuvmivAsvZVcT7oJmCgFo1QxFdqhKA4E+VlVZYwaGAjKltboM
 jdstaTd5U0awLIuXLiG0MJpKZguJ7aHFh+o64keC64bQt8W+v3FjlsitNxus6DPDV7B3
 C1qLs7LCITibRRosTyGWFWpO//PgXdf/qyBL/Bsndjjf5OfKlA9e5sRQDAvGYGkq0c7f
 BljA==
X-Gm-Message-State: ABuFfoiiah/z4BjGnaoRLntw3t5GtW39dJpp9mtN1I5CUtHqECyUatR2
 1Bz9aL17HSOE3DiJisiAncXi0A==
X-Google-Smtp-Source: ACcGV63zR3/C4ATCedx9MET4AdW5ULDk02O4wnIeuXEC+pqKRD/kscsegj5j3CTKJyT+yfyImGlTwQ==
X-Received: by 2002:a63:f848:: with SMTP id v8-v6mr1969286pgj.82.1537895965274; 
 Tue, 25 Sep 2018 10:19:25 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c88-v6sm6295725pfe.132.2018.09.25.10.19.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Sep 2018 10:19:24 -0700 (PDT)
Date: Tue, 25 Sep 2018 10:19:24 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Sep 2018 10:12:56 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,
 after}_clear_bit()
In-Reply-To: <20180925121225.9917-2-andrea.parri@amarulasolutions.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: andrea.parri@amarulasolutions.com
Message-ID: <mhng-2c59d90d-9cf9-4462-bfb6-5c90ffa0c6d0@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_101952_200339_27480543 
X-CRM114-Status: GOOD (  11.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrea.parri@amarulasolutions.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180925171924.bDmwpGfrNcU0rYkLiqwPKv-av9Tg9qVhtaEljiapSAM@z>

On Tue, 25 Sep 2018 05:12:24 PDT (-0700), andrea.parri@amarulasolutions.com wrote:
> The barriers are unused; remove their definition.
>
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: <linux-riscv@lists.infradead.org>
> ---
>  arch/riscv/include/asm/bitops.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index f30daf26f08f4..01db98dfd0435 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -23,11 +23,6 @@
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>
> -#ifndef smp_mb__before_clear_bit
> -#define smp_mb__before_clear_bit()  smp_mb()
> -#define smp_mb__after_clear_bit()   smp_mb()
> -#endif /* smp_mb__before_clear_bit */
> -
>  #include <asm-generic/bitops/__ffs.h>
>  #include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls.h>

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Do you want me to take this via the RISC-V tree?  I only ended up with patch 
1/2 in my inbox, and I probably shouldn't take both.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
