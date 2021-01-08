Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B09C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 01:36:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5E02368A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 01:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C5E02368A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Maq3l5agyjEyQx7/iWmE2VJ7nF5xCieMuVaFO/+ER0o=; b=Ws48rZIE745MLsGGCP1PWdBmW
	V5zUa89h8Gk/q5Rj2T5QZqSoe1VXCcT9XUniuZDoKtwvg7ERQuBu6eRwWaU+VfZJxEeU+EHjpGEOJ
	2OhW01hmD9662jOyWUmIi3jAo/BF+5vdPGxPyipdBSHU8nMCQrHjhUiv+oeFFVhv+7kYvDEGu8MyR
	JZXdbjBui/Zoi6fWxB/HA2gV2c6sT4trQ9pemCiULe5JuWwz7O+isHLU0kHlFQ6AQVxtSjd5UQ9dI
	KByAfszsiTzzWFfKAZPv6/pUUW0wp6ZIPgVBYk1tP7JTdzg1nlbmzDuqjp4R5vrlrQ+lBOQbIHMme
	Nj7FqCjPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxghY-0002D8-Ir; Fri, 08 Jan 2021 01:36:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxghV-0002Ce-Oc
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 01:36:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id be12so4837420plb.4
 for <linux-riscv@lists.infradead.org>; Thu, 07 Jan 2021 17:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1J3DUdWcOQx0bVUfuDnHN7QMPqvsEtCtXv4CCI/gFU=;
 b=We21GKe5c5ppvnQ5+V38BX7N59HJaXyZsmnSGyVb9vsePRAy0GYDEpFLfzJV2P/64U
 G1LQ4IfjlcpaNkahgKsq/VBl8dJvlvTT9W55gtIhXSDT1SlLL6ULEs/6Xb9ifjQVfmZ3
 W+XsaM+OCL/DBmLRMvmvn8hJSLGSZj4fi9b91Q6CHepgQn+dpF98gLfBykCvZNA5aByP
 lhDkvbNxaYcTQgnBJdE3HHi2jHDSdXnYfR9mNdTfIKBHwSI3ypZFvvtFFzK0k/XDsq9r
 V+auQg9QfQtpGJ4Rb5m2mMZFWFDMVqaPUgerlEf7WLVzZ3NUTIVkrgCc1CayrVy/lpVJ
 fcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Y1J3DUdWcOQx0bVUfuDnHN7QMPqvsEtCtXv4CCI/gFU=;
 b=uelHBhXShMIToHktbdmeqJzjLWMrkjdPmTrWu2/xTlZpwXx1zsovcRZmh4NZ+7dBQ9
 BnDKe7DpP1onVHQUStnFkZCuq5zydMBqiFeY99j4ilRomKWPVdnuDz10EVhex5U4khI8
 5Kore5w2pWFAohva4+qeYilx59Oa85R2ScFN9t1pjHoXNr1r0Edw4J+bGGh7wOJNC1mh
 dJL3tjakU9JM+X1Xie7NdV6oZ8QwKFrD5yLwIVRYYAV/ukXZNny2r7cy/L7HMM22o/6e
 8EQlttzt4llg1lQzyk6DC9IjkRfwJRDOPH/YFiv2SiciMLzySuZiCIlV4ep+xDkKZCS0
 s3lw==
X-Gm-Message-State: AOAM533T9lAviCE0VpT1bgi58KdKbEJgSN52MWDVisNLHKNo9NpcNUQH
 MNA2u+tzNPj/BdoJTPYJmLSB0A==
X-Google-Smtp-Source: ABdhPJwTQMFJXBOd42SE6blUoubNT5H3NxGBzcRFMuHBbDHQRNAJzbKlAUEqkL9CnagoK8T0LCnxRA==
X-Received: by 2002:a17:90a:5793:: with SMTP id
 g19mr1274178pji.32.1610069779086; 
 Thu, 07 Jan 2021 17:36:19 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c18sm6735984pfj.200.2021.01.07.17.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:36:18 -0800 (PST)
Date: Thu, 07 Jan 2021 17:36:18 -0800 (PST)
X-Google-Original-Date: Thu, 07 Jan 2021 17:28:44 PST (-0800)
Subject: Re: [PATCH v3 0/2] riscv: sifive_l2_cache: Add support for SiFive
 FU740 SoC
In-Reply-To: <1607596083-81480-1-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-18249e76-3632-4347-b9f1-73e1cc39683a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_203625_926123_988FE926 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 wsa@kernel.org, sachin.ghadi@sifive.com, yash.shah@sifive.com,
 robh+dt@kernel.org, sagar.kadam@sifive.com, Jonathan.Cameron@huawei.com,
 linux-riscv@lists.infradead.org, bp@suse.de, sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 02:28:01 PST (-0800), yash.shah@sifive.com wrote:
> Add support for additional interrupt present in SiFive FU740 chip.
>
> Changes:
> v3:
> - Rename the subject line of dt-binding patch
> - Add the additional interrupt "DirFail" as the last entry so as to keep
>   the order of all previous index same.
>
> v2:
> - Changes as per Rob Herring's request on v1
>
> Yash Shah (2):
>   dt-bindings: riscv: Update l2 cache DT documentation to add support
>     for SiFive FU740
>   RISC-V: sifive_l2_cache: Update L2 cache driver to support SiFive
>     FU740
>
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 34 +++++++++++++++++++---
>  drivers/soc/sifive/sifive_l2_cache.c               | 27 +++++++++++++++--
>  2 files changed, 54 insertions(+), 7 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
