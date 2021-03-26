Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BC3C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 01:06:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAD9619E8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 01:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAD9619E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0y9HMjxi0ynjMvEdvX2/dGfMo3BCdzi6sOSRrNdRIxc=; b=PQNZxmFl6IjyB7KZ8a/eP/9k1
	KNxPXPKBBS/ScDhxOSP9J4XTvXbHBRBm4y4lncDpPgPFLgGCx1l8tKZhW41cjG0s/MJiAzN/Hpzlg
	1x0IVZvzCgiKynVxpc64Zxf+uUKBlCgSlp6Nf7oCSaqTUJQfwYtaFwHWgMnguGz0h5DB43GZG+NHy
	9M8PhPKrvnd4L41M7YhyypyvG9cGvaS4f2mYH0DmdpEgl2Q+DojvDwAIeLMGmcN2HMjRbl/xw2iBA
	CNQiHy+nmBaVuTgK91/Z+3evwhxw9JSh5Ezu7YZLAKtCDEwwdqoRajy7u4Ifwt3uJJ0+RaGS69QBy
	idBCgfzuw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPavJ-002SS1-AQ; Fri, 26 Mar 2021 01:06:01 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPavF-002SRX-Av; Fri, 26 Mar 2021 01:05:59 +0000
Received: by mail-io1-f45.google.com with SMTP id z136so3785924iof.10;
 Thu, 25 Mar 2021 18:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zH0f9upICvGtfhc9K2ovrNfwKuCEFP7sQ4T0LgE5oCE=;
 b=O9oDfmkLpzBADp8tjh/YiAwzXMXfA6mXeXkfuXZiNgTIZyfhYHJSuYgM952puHDeXh
 IMA3cWwncwRi6G/Tr8ywrIBcr+fRRp9rr6VA3jdQwEurhgeZ+uQSlpW0qqI2Jy4YFaCx
 yUrYKgj6OgWYWNCytcvJAfjkyNLO3fIk9Ny7zcj/pvkhQ7LrxeWzwK1hAJWvp9bFjL/X
 7d5tBusvUIidyb2pH7vKR1feEfhjesOH2HQkNZipmo3W4b9O5GptAs8m72F1CUJdwnoy
 +l25+1pCfCl1osBfKl/FZ6oBmMa0iwwlBaUn5aVB1+0lYkVQ1AIl9mOhYOBdAZjzcMzT
 5IBQ==
X-Gm-Message-State: AOAM532fZUwDBhV6fVWt1UUuwdFBT79ASrt1hZ/8c5T/TJCmem2kVYzx
 aSezfyCPWM6kHBRQWTsRDA==
X-Google-Smtp-Source: ABdhPJyICXxa42GrQ71eu8ff2Oat1nHtX15PHNXQVMG+4zeSDlcWjZ+exqiFjJzCzVrlg2z0Ae6ilw==
X-Received: by 2002:a5e:d908:: with SMTP id n8mr8544541iop.121.1616720756093; 
 Thu, 25 Mar 2021 18:05:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id p3sm3464481iln.48.2021.03.25.18.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:05:55 -0700 (PDT)
Received: (nullmailer pid 2090699 invoked by uid 1000);
 Fri, 26 Mar 2021 01:05:52 -0000
Date: Thu, 25 Mar 2021 19:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Liush <liush@allwinnertech.com>, Sandeep Tripathy <milun.tripathy@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC PATCH v3 7/8] dt-bindings: Add common bindings for ARM and
 RISC-V idle states
Message-ID: <20210326010552.GA2090598@robh.at.kernel.org>
References: <20210318130512.1025416-1-anup.patel@wdc.com>
 <20210318130512.1025416-8-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318130512.1025416-8-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_010557_561301_7D86BE12 
X-CRM114-Status: GOOD (  11.74  )
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

On Thu, 18 Mar 2021 18:35:11 +0530, Anup Patel wrote:
> The RISC-V CPU idle states will be described in under the
> /cpus/idle-states DT node in the same way as ARM CPU idle
> states.
> 
> This patch adds common bindings documentation for both ARM
> and RISC-V idle states.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++++++++++++--
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  2 files changed, 217 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
