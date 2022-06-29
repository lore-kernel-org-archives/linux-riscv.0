Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3020C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2tUb7GTA/ybwWbdMHqXQuoVQAB3tJU+k4AmVMFL+7M=; b=ysb0v2jn6h3Q0K
	1SaFTAMgUoedb9bFpTf6eB7FtKD2LqdDkwqcJwUN8rixf7jz6SP/FI31PijGQ+xSlCFc49psLWkX8
	xeWW8WX+FQiXdqQ0p4ib2QSupB8HOOnoGo5wkkl3F40CvrEdRuszM7c3ZGVwWQmAE+XZd8lYiVC2I
	kLO0L8UpbS+XQRMfvJ7sSwijOE/Sdo0xDTIA6ufr9gAKCH7aZlNYuitep4X6alL3tjenrqTzasNum
	59jw2MRngZGiLOmBUNhy9wwXrke4+r0Buw+b8FQn/iv+hpY/KFwlvrmH8u4vhaRDUvIzwWVoD+ZDp
	cx8lixJARWAY6riqn77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cf8-00DZsd-Ub; Wed, 29 Jun 2022 18:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cex-00DZqC-SM; Wed, 29 Jun 2022 18:43:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 492F11480;
	Wed, 29 Jun 2022 11:43:30 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D24E43F5A1;
	Wed, 29 Jun 2022 11:43:27 -0700 (PDT)
Date: Wed, 29 Jun 2022 19:42:17 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	atishp@atishpatra.org, atishp@rivosinc.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	wangqing@vivo.com, robh+dt@kernel.org, rafael@kernel.org,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, gshan@redhat.com,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Message-ID: <20220629184217.krzt6l7qadymbj6h@bogus>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114331_998282_41A3F27F 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Jun 29, 2022 at 06:18:25PM +0000, Conor.Dooley@microchip.com wrote:
> 
> No, no it doesn't. Not sure what I was thinking there.
> Prob tested that on the the last commit that bisect tested
> rather than the one it pointed out the problem was with.
> 
> Either way, boot is broken in -next.
>

Can you check if the below fixes the issue ? Assuming presenting L1 as
LLC might be causing issue.

Regards,
Sudeep

-->8
diff --git i/drivers/base/cacheinfo.c w/drivers/base/cacheinfo.c
index 167abfa6f37d..a691317f7fdd 100644
--- i/drivers/base/cacheinfo.c
+++ w/drivers/base/cacheinfo.c
@@ -60,7 +60,8 @@ bool last_level_cache_is_valid(unsigned int cpu)

        llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);

-       return (llc->attributes & CACHE_ID) || !!llc->fw_token;
+       return (llc->type == CACHE_TYPE_UNIFIED) &&
+              ((llc->attributes & CACHE_ID) || !!llc->fw_token);

 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
