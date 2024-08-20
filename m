Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7886BC531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEE9T0N/VeW6xfudpxH5EIcVsuStAsvNr0O4URLu8Ug=; b=FsAfmz39Y+i6U6
	q9jCrozc+ieW4k8O34XlfBYT5+PNsfEx0A/UREW9M+H7dRG4REt1mVHnn5sFMyjt3vW4JpUwbP8MQ
	eGHi5N6wbYOXFmprTGZrDrq5oNUchTSFomFp3HysupUFoCii0Bh/SpUV/5OEM9kmcsSiJi6T6XM+4
	MLsry7dwX+TUuHLxMaz1Pn1Z1Xur5BHI1ZMGU+uhibpMMwjtlJqk4nk0+1Q4hCD64AY93flc8hxdk
	f+pH3ndN9Z8nTPC9JNFNsqxB/vHCNcH4e8FbF1jdBSaGc6dva+SZIjejDtj9oE43y0uW3Ee4aVsaw
	1z0PS5FZ2jRasp753c6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNNV-0000000543o-46dn;
	Tue, 20 Aug 2024 11:50:22 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgNNS-0000000543O-2LeA
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 11:50:20 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso5703469276.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 04:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724154617; x=1724759417; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pRSlm9qQOknEuQv0nGHCbr6Vtei0tCHogVBnyLHAIdY=;
        b=svUbzqY91qUIwk7YDoT7pRu1Po7g73383aalrYy/i5SnwsIbyOP8trZBsg8MoT8m+y
         zWJjCHRqdkJxcZ/157cvZ53VRItySeXfxXucGCi3Pcpn46ZGs+Vx8aenfOprED+4hZxZ
         FaQnPovRnVyIag5yc69tG1aaylMfmNthImYH9zqYL+RJ+r2zIJNhNysym4IbN5QlMFvI
         +Hvf4InJR5Z3XU/va0t8zT/DMMnn5RL0/m027PjRSPIH9AKxzbiVBb4uhkk3l2Ce8ngy
         JoHVrnLTLz64y+BDl5MIg1LmAn+mX2MIIp2qO+qCV0P+OvXb89SsCT0Ofsv6rvw1a9Yf
         2D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724154617; x=1724759417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRSlm9qQOknEuQv0nGHCbr6Vtei0tCHogVBnyLHAIdY=;
        b=r2H53envDE/hfX8sEq1bOq/IeGzBXoiK9T7BSc973Yk6cLIQDllgFUV1I4gPfvWEuA
         SBnl5qHnyF94Mvb1OhsF/suc8apjNo/GYA0RgCI7uXJ5qTqTFrLnBXRpDJwYGOhn2GpU
         Sn7SeFMiHiTlJTr6J45RHcTBe3YYNJanZR8ZouspWj1ChhRXpqUFrZU9nwlGkIE66KH0
         ohqzfwrtmZLqDVL+sVTyUXLk5Tu6YVgntFxzoUc2HqX9BLMOe/YVthhawksAMpnvpr1x
         shfHjK3lVwoESXeO8RrD4xUykak+5bPVACXnqj8SihulNw9z/GPJvKHc7lar4oxFyMt6
         NQTg==
X-Forwarded-Encrypted: i=1; AJvYcCV9smVBvCVk5ycpDGXxi8G385uTmN7D22aV0oju8rKidkSjjLp9+o6dkJbYEHkd+mRb6ZfoRrQvrE7RTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk47456bTijNOSKUvKvS/M3JwLsDUU1UsY9XcX+Lgg4cTJnv64
	vpZkT+gJZMGN8Zji1PrsYjBUgg8aUp1s+llNshxgfJ156glUR5eiD7kKdIUY98/OjbfRPih7euS
	XlL6vv4jP6bIOhpBDYKj0LD0GJKBtzu3V6R8pTA==
X-Google-Smtp-Source: AGHT+IG1yqC54I7oa3M5j2AOrh0P76AlYO5oE0hU3etb8Dtrle6m44vkqVuSm1KJj7xzuFntbTl9xYb+/IGGk1CL6jY=
X-Received: by 2002:a05:6902:1027:b0:e11:6f62:2290 with SMTP id
 3f1490d57ef6-e1180ef44b0mr17580897276.24.1724154617395; Tue, 20 Aug 2024
 04:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1722847198.git.unicorn_wang@outlook.com>
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 13:49:41 +0200
Message-ID: <CAPDyKFqGGAzgLFJOKmOpLVT8ai4ymHXUbva85U6JtEd=M9kb4Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com, 
	Chen Wang <unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_045018_654162_84AC4296 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, 5 Aug 2024 at 11:15, Chen Wang <unicornxw@gmail.com> wrote:
>
> From: Chen Wang <unicorn_wang@outlook.com>
>
> This patchset is composed of two parts:
> - one is the improvement of the sdhci-of-dwcmshc framework,
> - the other is the support for sg2042 based on the improvement of the
>   framework.
> The reason for merging the two parts into one patchset is mainly to
> facilitate review, especially to facilitate viewing why we need to
> improve the framework and what benefits it will bring to us.
>
> When I tried to add a new soc(SG2042) to sdhci-of-dwcmshc, I found
> that the existing driver code could be optimized to facilitate expansion
> for the new soc. Patch 1 ~ Patch 5 is for this.
>
> Patch 6 ~ 7 are adding support for the mmc controller for Sophgo SG2042.
> Adding corresponding new compatible strings, and implement
> custom callbacks for SG2042 based on new framework.
>
> Patch 8 is the change for DTS.
>
> By the way, although I believe this patch only optimizes the framework
> of the code and does not change the specific logic, simple verification
> is certainly better. Since I don't have rk35xx/th1520 related hardware,
> it would be greatly appreciated if someone could help verify it.
>
> ---
>
> Changes in v6:
>
>   The patch series is based on latest 'next' branch of [mmc-git].
>
>   - Some minor improvements based on Adrian's review suggestions.
>   - Added Reviewed-by and Tested-by signatures from Conor/Drew/Inochi.
>

Patch 1 -> 7 applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
