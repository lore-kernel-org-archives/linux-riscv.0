Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081EDC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C571923ECE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C571923ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AAF/qNqoHzUyb3mEqj3B5ixezb/G76mCDYqf6kuFDMk=; b=pBlJPSgfb5Ij+PfdETFsPcsvd
	gUyNgSTkA8fGA/T0stBRx9v/81k1jyY2r4qIReQ4kayGECFf96qCwnGyHoj0jk1N8qbxsggGsY7dw
	wmDEQDQU+wRBgQ4B6J3jAUvkol1r8kMhICsMGaXzc35nFNxCG2fTP3Yl6mLfwVZYyBxfL41qbfGGM
	tKNqKiUszn66O3b3UYcrBjalHlf2LocKgn5Ft9h8xnGMkwaqeNwCX8RCY7z00K2TJUPBMHII1ynHc
	SUJ0a9xT6o//gYnGz+hO+8D0AV3FOyedRPueQtKAtb6B49rPxZ69ppMy6bfDx9eRjmPzd/UiGJJ2f
	8ZB2EyFjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZOL-0000Ce-Sa; Fri, 11 Dec 2020 03:46:49 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZOJ-0000C5-R6
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 03:46:48 +0000
Received: by mail-oi1-f194.google.com with SMTP id d189so8361683oig.11
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 19:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iwVzMGtpSHL3nSep40GqM93jnUr637ufBEvmc9oL7BQ=;
 b=sU3fbFWh3JmjTVT1uHmT4VUgz/nFNz0ajo3zSUHNAzcCfio0SiF5t+K+MxktG4+9I3
 6K35dWT8hN0jitLqNEiGZ7EsbPQZgxtPtdWpHXWRaStZaUcKEuUZB6JcyJ1W/T590UZJ
 7828eN11E4zUrKOIGvuKPrM4CwoLYIcV9+iTXx5uVdaKUtkhUT34MX1uZ2WvfkTgHSAW
 Rk85AWjIMP0/Samj2E6betaqs3NSSpcQTtAXUa/2nPgo35r41uVgyjrQwKmjucGkeTW1
 RGQ2CKSuEm6FJOOfYdLQqZcvKxbOMCAL1XEcjz/ljdXNL/B6lfn3JgxTeTMb8+JuV1HF
 lRzQ==
X-Gm-Message-State: AOAM5335KHglw8JPkfJ5wQ295QSVLQurk+zMeFGUWFmOvjMiNBz3SC47
 bn1g06kLOy79zg1APffODw==
X-Google-Smtp-Source: ABdhPJxbn2bDUr56MHJSyIKL8JYbMykYRWoRV70y5sdY/tAEPi8Rt3Ge/B+Dd2pOmwAWcSlh6S+KsQ==
X-Received: by 2002:aca:ad85:: with SMTP id w127mr7853659oie.102.1607658407097; 
 Thu, 10 Dec 2020 19:46:47 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s26sm1583997otd.8.2020.12.10.19.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:46:45 -0800 (PST)
Received: (nullmailer pid 3603005 invoked by uid 1000);
 Fri, 11 Dec 2020 03:46:44 -0000
Date: Thu, 10 Dec 2020 21:46:44 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: Update l2 cache DT
 documentation to add support for SiFive FU740
Message-ID: <20201211034644.GA3602957@robh.at.kernel.org>
References: <1607596083-81480-1-git-send-email-yash.shah@sifive.com>
 <1607596083-81480-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607596083-81480-2-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_224647_894449_FA3EC354 
X-CRM114-Status: GOOD (  10.37  )
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
 Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 sachin.ghadi@sifive.com, robh+dt@kernel.org, palmer@dabbelt.com,
 sagar.kadam@sifive.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, bp@suse.de, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 15:58:02 +0530, Yash Shah wrote:
> The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
> compared to 3 in FU540. Update the DT documentation accordingly with
> "compatible" and "interrupt" property changes.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 34 +++++++++++++++++++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
