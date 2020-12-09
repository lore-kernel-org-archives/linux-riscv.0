Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EAC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 16:33:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 010E12076B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 16:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 010E12076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tavSAm8R2VieW/RS80f76CGV8tqeAIHz+slYBMMC4qY=; b=X667cJQU/4qrscbeCHTjWPl+1
	pd0c7ToBxgC+prcyG9Tx+TZszx+ps7/qcqTCkCRWeXtbZZNhNvn44yq6MldgISOl8o6t8bd69SJvU
	mjcr5BVDj2doWIA7Ee2DWD4gFUBNB8B78GfBFk1AI+uz63OYiNI0Y4kCt9tL+I9LmK1sZ7PcLhyTX
	tl6wMAspdvAsKLfmLXVYse8V9NNpQguUEEKn4iRcOjvjH9TAVk9ejWQwXyAA91cUx2ymL+HgEs4Yx
	n441Mm+2yvCnOiZee06dMifd5SgX9Ks7bzxQKgl7l+fnQ6LSMeoatrcoTVOj5ouJ3Bd373ruHocal
	wj0Rwn0YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2OY-0007Xe-UZ; Wed, 09 Dec 2020 16:32:51 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2OW-0007X9-0y
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 16:32:48 +0000
Received: by mail-ot1-f66.google.com with SMTP id f16so1919381otl.11
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 08:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCuMs4GSdwg3rvAHN9LxlH1LO/M24Tt6rfO3ld6+4c8=;
 b=RorCnD+PgTvvzHvURn5W+xrXdJHPcMq803eYG/HLytm6eeRG6lMzVcw08+eLPgux8b
 u5fglI1utCsdAaeQIJCWZAwWbO+28pjVBdwX1nTdKKPU7hgIiZO5MbVOnGNQirT2JreW
 +NlpHdGiCaeUoNMMVP2k6l9jNLRwuaEYeFlxJ7xJOENkzexInXlUBiKglkS3++nA3Xxp
 AhQvZQSGiEKb7EfylUo54PYFwE8XEZiOOS1dpmDK/19vBMO5jTMPrSVpBvhVVdN/nexK
 DBGUYNJWkMyl7/YYT/I7fzi0xIyyZv+ECPNo0l/HXMARXuTSXwuU1H9LX+TgnU3MtNBC
 zlIQ==
X-Gm-Message-State: AOAM53025yInKs/6sQ7CLQcLbCtlMerzSJqLUJMpS1T/cjuvkI4cc/Xk
 1+nmgLN1LTC3IfNjMp+nnA==
X-Google-Smtp-Source: ABdhPJz0sGQupY3l4nBeRGwudmV+CVNHqh7oLdIK5VeM+7vSRXo8s/xl4mFlcUkdMH/XBw2CdWQAkg==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr2509695otq.49.1607531563308; 
 Wed, 09 Dec 2020 08:32:43 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s139sm392160oih.10.2020.12.09.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 08:32:42 -0800 (PST)
Received: (nullmailer pid 565478 invoked by uid 1000);
 Wed, 09 Dec 2020 16:32:40 -0000
Date: Wed, 9 Dec 2020 10:32:40 -0600
From: Rob Herring <robh@kernel.org>
To: conor.dooley@microchip.com
Subject: Re: [PATCH v2 2/5] dt-bindings: add bindings for polarfire soc mailbox
Message-ID: <20201209163240.GA565400@robh.at.kernel.org>
References: <20201201110250.28437-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201110250.28437-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_113248_098648_F88A6162 
X-CRM114-Status: UNSURE (   9.61  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, jassisinghbrar@gmail.com,
 atish.patra@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, lewis.hanly@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 01 Dec 2020 11:02:50 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the MSS system controller mailbox on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../mailbox/microchip,mpfs-mailbox.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
