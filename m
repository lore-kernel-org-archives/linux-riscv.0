Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C414C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:56:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4521623BA7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4521623BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1rZwJEAWW+f3mkCNTHf3YDczmwDwBJ7r3TwIp5AbxbY=; b=vUWQRZsZCjTdANDGACy+s6N0s
	Rcq2jYIT4hPy0oEWulYdweQcoNno+XQu1bS4Y2sAK1uXd3kcv1pXlXOlA5pjc1Cyx0rhm5YRk3m6n
	5E1rR3xEduEY1dQXBuXhfiFnPvw7DRElgUo02KFZM05QfNm7H8iXEZadVRbwZRv1WQ1pdPBdJodev
	REwk6JbMi0RkpgZ8gwckV3d/Ze9eNu5aiRDMXSdMIuT8hGNe/jOGJ+Azm66Pwj4shMIga/a3M6Qj5
	4tHmztBwx7OrV5+sT+ORCuknVN7BTBg0/Iokg4V+NUX8zz4yf1RTmqaijR5kpmHbAkxvYJ9XIAULm
	7cLNMuSLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD3g-0007LK-OV; Thu, 10 Dec 2020 03:56:00 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD3d-0007KZ-W4
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:55:58 +0000
Received: by mail-oi1-f196.google.com with SMTP id d27so4304936oic.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UaBW8kKjumKB5NsRdwxO15H0fluT5i+CZRLhsRHEAQc=;
 b=S8Tu2mFIMjB1HFs7kVhbiLZfspbHdzinSHQ3vrOWtvgC64XvU5+FKZiBZSpL8aEsDt
 FbmGiIeuLLvLzCJ+Kfa8h6KcLOl3D6N5n5LeW/Ceu0KZ8JxiuIv8Q1r8KYLq7YHh2RmD
 mkOhIqn+tPnntrggJKC3nqw0Rut2MyozdeIDMwh4JmJmrYUtFw4nwOQ1mOi3+IRJ10sK
 LzN/8C81JdJHxvCYhF34uyBeW1cDpgdJm968M8v5oyDn2HI+bPFecEVuKWmlRpUoZSRp
 OqbthLt2uaxrlc8AZQSvwKQzM4rl+UC//+mPFFs/NVkt0wNwrUb27AgOeDbkK+V4kLyT
 edNw==
X-Gm-Message-State: AOAM531R5PX/DDA7iFNK5lLaFl5El/UrPcduTpzslese0sXRpZ0DFOpR
 YEiwMTvUNMi3yFEglSyrsg==
X-Google-Smtp-Source: ABdhPJwOhrm+iTszJ9LZontta94nHHnjY/oxO3rxT338UzSFe4GWwGxrSlB90g+rA2ah/Usvy4il1Q==
X-Received: by 2002:aca:60c4:: with SMTP id u187mr4120688oib.42.1607572557234; 
 Wed, 09 Dec 2020 19:55:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v12sm759702ooi.46.2020.12.09.19.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:55:56 -0800 (PST)
Received: (nullmailer pid 1633035 invoked by uid 1000);
 Thu, 10 Dec 2020 03:55:54 -0000
Date: Wed, 9 Dec 2020 21:55:54 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035554.GA1632991@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225558_074178_3380B93A 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 bgolaszewski@baylibre.com, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 andrew@lunn.ch, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 broonie@kernel.org, palmer@dabbelt.com, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, paul.walmsley@sifive.com,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org,
 lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 10:25:33 +0530, Yash Shah wrote:
> Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
> cores ("harts") that are present on FU740-C000 SoC.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
