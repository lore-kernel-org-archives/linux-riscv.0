Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE267C47425
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 20:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8C82076B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 20:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WYWuaSo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8C82076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8uUmXHq239F/RTygHJKTlIwok/XpNxF3FswGFgofGlo=; b=WYWuaSo5nibUCg5VhyoPwE0Bd
	kWxo5Uwj/bg6vs+h+oTCWdGb9a5AfOBP7jAaLcyS0YWjw9i9pMFLubvwhKfBpFkuOkjYxN8JwuQ+U
	NzLhIsMLECCQ1jkT5KtjZ3WY6uOqMUgGOlmPKUk6cpFnMClv8Rc56ch9WeGS+XxwnrULN2A6VVWPc
	eWa7Lrdh1WX4NiXE0IczFa2VGKoOQFuxdOhmVxBVe13+ewWYGAoqFowB2rcLB+WLvg9vmELi8JsX/
	OVTsgsQm+K4bL2BAu6Itb9GBaThoeIUQReJ7fgZK6CTJ2A0sy8Dbkln7NVGkPnsca2iey8rGsIg4c
	HnOJAxj8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNMI4-0000AX-3d; Tue, 29 Sep 2020 20:32:00 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNMI0-00006y-MD
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 20:31:57 +0000
Received: by mail-ot1-f65.google.com with SMTP id g96so5762971otb.12
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 13:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ZpDCXi33xYMdZ4fkDsToUqUQjwLCzkdHP38hkkOuS8=;
 b=Rk/JR0+jUBD0J65l7AagGjHyP1JLGxD7LJToqb7XRxRzh//b5PexkCVCC1MfYzF5/c
 xHLmZPUWG0wZGfwnQGGEnFmFy2SwYYhJRRKcVsTELoZNtMYMJVsmCq3QKoA2t6m6el27
 IuoeRzKCboRhbQFKNXGT3EmYHc87ys0DunoKlIsadCH1JepjeEEnpYWl/70nLO5wRhOF
 eaYgI54lM1qx3koQD3no05PKGIvzZROEq9sw2ZaGylGcNLfPPL6c5LS8k2lq2xSiyydd
 W/OtbEuhvov6ZV3E2yHG92wD2Yk26kuebtpa+/wDh8e1+gm4KBO8nLvVs9O4LISfisqz
 erdw==
X-Gm-Message-State: AOAM5303LTO9ej3KwB/W/Rg4kkGKnTwbNlHal1rpP0lZkQLJQqHNqrOj
 Tq8pLe5cGiGbQxURJS0FVg==
X-Google-Smtp-Source: ABdhPJw3T9HsrVFXDzPRfCUqAvg9r56p9ZIQCTrUujFEwZ7NWfdVAZkC05VlQ0VMNHZZSbd3C0kjbg==
X-Received: by 2002:a05:6830:1506:: with SMTP id
 k6mr3827634otp.142.1601411515923; 
 Tue, 29 Sep 2020 13:31:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j18sm1249481otr.12.2020.09.29.13.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 13:31:55 -0700 (PDT)
Received: (nullmailer pid 1118419 invoked by uid 1000);
 Tue, 29 Sep 2020 20:31:54 -0000
Date: Tue, 29 Sep 2020 15:31:54 -0500
From: Rob Herring <robh@kernel.org>
To: Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 1/1] dt-bindings: riscv: sifive-l2-cache: convert
 bindings to json-schema
Message-ID: <20200929203154.GA1118332@bogus>
References: <1601381896-29716-1-git-send-email-sagar.kadam@sifive.com>
 <1601381896-29716-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601381896-29716-2-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_163156_737988_6BC47C1F 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 17:48:16 +0530, Sagar Kadam wrote:
> Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2 Cache
> controller to YAML format.
> 
> Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 -----------
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 98 ++++++++++++++++++++++
>  2 files changed, 98 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
