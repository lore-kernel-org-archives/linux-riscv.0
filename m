Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAD4C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5998764FB9
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5998764FB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nIGUwklCGHJGimdV11lRalsLq9sGGq/jsvWNgQp68k8=; b=fH9FpvpgfvyJvYIth7RfDkDid
	OSNeaISLpKgblQPoiN4aCCvKXp1Wa+uvxbOyFpa2rtReiQ/Zc+GMIXBsaQ5n1FBqDR+1vyn1xQLzy
	MPGajBcg+qWlnnYq+p5T7nqlpz+hsx5j8JwAjNdJhaHbdrxp3jgSAxak2mpKF5EtFq0Iu/NKv1f4M
	AXeDprcsj0YfxE6P6+B1Fp+h+iJiP9s8sw/7KTLeG5byBDl0K7wex99ronnPN81shkuqkRr5lNR/v
	DkrNWedHA4vABOWlIM2Vsnh144NTElAzC2ZHZqCKjTb+PVFuBaWEPzL5UClxI6zpjhiZxf59Ko/SJ
	6ez8pq0jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l874Y-0003sn-K4; Fri, 05 Feb 2021 19:47:18 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l874U-0003sT-Vo
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 19:47:15 +0000
Received: by mail-ot1-f43.google.com with SMTP id v1so7995063ott.10
 for <linux-riscv@lists.infradead.org>; Fri, 05 Feb 2021 11:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ii5iHucEL6kK0ePeaCgZfhVcz7zPyqdUMGbV2GreKgg=;
 b=gx1gbgglP4GZPRPho+Mm3fDI+x9ZuvF3EnqZq3oNPQUHMBN51tIN/lwXpoyeic2WfY
 +V/8QLZWmHk+Q9VMmKrGwzG+SDvDS8rcX2ZcQMo8vxog9VJSiH4vt9hJVUjrqa4jznB2
 kCukbBrPAYDndkxPgNgpXd0M/RV6BNhKd3eZD7fcNN+vw6h+SqF9PJhvZ/MJlZL6cKGQ
 esPGIWHsNR7opJofwAy2WOhUyJvuVfztw2c1NZhTld8gzgPCK3Z1TofeHGE1W33C/Gt/
 l1cUE5QMrtOEkRn3b8B6WiGJeq6gt9syb9sDUXqdKpTMuL+1CfbUOvEceXqTh5nfqgGV
 9d3Q==
X-Gm-Message-State: AOAM533rjLnMBiepokNT7TywpIW7ZvRN37nSxX96cDyZ8eqBLeekY6cw
 5s5l6lLhVRBOLagu3VCokA==
X-Google-Smtp-Source: ABdhPJxTyYSkBCg5+vXUfmMAKNcY1pA6POTIcqW2OEQhLTBZsaKDoKp3H9llCmN4h4Rfs7DXl574+Q==
X-Received: by 2002:a9d:4b07:: with SMTP id q7mr4421349otf.270.1612554433661; 
 Fri, 05 Feb 2021 11:47:13 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w2sm591994otq.9.2021.02.05.11.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 11:47:12 -0800 (PST)
Received: (nullmailer pid 3597172 invoked by uid 1000);
 Fri, 05 Feb 2021 19:47:11 -0000
Date: Fri, 5 Feb 2021 13:47:11 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v16 03/16] dt-bindings: update risc-v cpu properties
Message-ID: <20210205194711.GA3597111@robh.at.kernel.org>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-4-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205065827.577285-4-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_144715_064065_2011CDD2 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 05 Feb 2021 15:58:14 +0900, Damien Le Moal wrote:
> The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
> version using a draft verion of the RISC-V ISA specifications. To avoid
> any confusion with CPU cores using stable specifications, add the
> compatible string "canaan,k210" for this SoC CPU cores.
> 
> Also add the "riscv,none" value to the mmu-type property to allow a DT
> to indicate that the CPU being described does not have an MMU or that
> it has an MMU that is not usable (which is the case for the K210 SoC).
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
