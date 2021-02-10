Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB53C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 16:56:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC5764DF6
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 16:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC5764DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ul7OLE6Me4MYudkm4LCSEepukO9SiZAvvrtJjX7Ru48=; b=d+CoDE/STUx+ne6e3t6V/tiJF
	ntH8RF7RufOb3e5GKMSzShUjseziC47DmUfvHNS4XS5qbBqewdMRDDZQu8XaTfubPu4BSJ1Zs7Ibl
	vD8/cEAEY5jnXQbcKo78XiRFohPbRYLX9b1r9PZNTbckLLaPq/xr5IganvBDzn2I4UM1u5xLLYeTM
	jvjOXobKtKVex+qUl2TEAleLAPoKGNV45hiogHOjzp4iwlfm3WjxNetlwRbMBi9V760MrB91rQFpj
	c+s+OePNHOAsNgCk0gTgoCxaw5yFfqK8Jn6QNQ60PoyIxJpE8MmdwcxY/MCSsOpR+RrQiYqLUYBM5
	ttnYCJymw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9sn4-0004ar-34; Wed, 10 Feb 2021 16:56:34 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9sn1-0004Zd-DS
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 16:56:32 +0000
Received: by mail-ot1-f45.google.com with SMTP id k10so2440283otl.2
 for <linux-riscv@lists.infradead.org>; Wed, 10 Feb 2021 08:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tdIFZqMCODJxYNVt+c5A3pydLZPUZWk/O1X/86C8MTY=;
 b=qKoFshyaQY49GM4jLnut2MmWNBwoROdm5GaaC1N/RkOASGMgbUk/EJp4+Mfkn84LvP
 Ogq+HtuNooC+uYRurMrSolDYERBPIZDBbzecZ9FsmFc0sDgHNE+1f25Ocos0VONinqgH
 YjCSgViEQdE4JAWDy5dyAuhFSfuAOKKrjwlEMsZ5drSzqX68K8ADflg0vPYGpOOOwJsH
 ve5m1B2M5J69aYrVFAL+WLj+TPmirHTVWpdTzt5UWTNCd85wfFgbAUTt/CC4ZdNYbBix
 1w+ryaJ8Y6DkPBXhS0SFeo8J+EYWFWHXTrW/QK4Lib+kuZSKUoqPvQCUQkBGt10KjO1J
 qWdA==
X-Gm-Message-State: AOAM533qy43o7n4TBXH4pQuACtZOZpOcsGVYgl9uhK1xS010N1JGP4GD
 a9uaxQCGO3uzzilFRYsDxA==
X-Google-Smtp-Source: ABdhPJzm2BY44BnEkCqISIk9E4Fl8RmqB7xmozSWU7cXDDHKbqZC2oyfDuYZ/RCViSzS8r6VeQTQYw==
X-Received: by 2002:a9d:7694:: with SMTP id j20mr2834324otl.89.1612976189588; 
 Wed, 10 Feb 2021 08:56:29 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p184sm563245oib.24.2021.02.10.08.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:56:28 -0800 (PST)
Received: (nullmailer pid 2328030 invoked by uid 1000);
 Wed, 10 Feb 2021 16:56:27 -0000
Date: Wed, 10 Feb 2021 10:56:27 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v19 08/17] dt-bindings: fix sifive gpio properties
Message-ID: <20210210165627.GA2327971@robh.at.kernel.org>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
 <20210210050230.131281-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210050230.131281-9-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_115631_480959_5F77B872 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed, 10 Feb 2021 14:02:21 +0900, Damien Le Moal wrote:
> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> interrupts property description and maxItems. Also add the standard
> ngpios property to describe the number of GPIOs available on the
> implementation.
> 
> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> of this gpio controller in the Canaan Kendryte K210 SoC. If this
> compatible string is used, do not define the clocks property as
> required as the K210 SoC does not have a software controllable clock
> for the Sifive gpio IP block.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/gpio/sifive,gpio.yaml | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
