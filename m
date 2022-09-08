Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD09C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKYEiM2/9JEOUq9uo9W5uNY1DQSvTWGpWnkTJO35mFc=; b=iUFVnXcIqHlcGG
	nEgJ31xPLYGclaPGGsnn2QIYJXN5TS4ODqfxl4UGAsnDyrz+u/RsGYTye2Zpgp+KFCn2W/UO3bnRN
	BP7Ee47RQvf3X6PFYnNDEUR8xbD9QuaPrOnBx1P2AoDub/YKWQJQUMP0HBVSG3Vu/8Yk4Gmix7/0Z
	GKKwygyxu2JWUgURz1ak+nn5H/oI3MROphIZOjUJq2bJpYa/sAvePxqeKdeP+40bsY5E/Rl/40XVS
	ouo0tPsFkO/Jrc504hxiYLj7v53pAV6sfRU3E5PWaqLM5nBidl3ydzyrPrca+oxvlNBa/sy8ZIsLu
	omgZKRYpRYu0Vvj+VMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOxP-008zsw-C6; Thu, 08 Sep 2022 21:21:07 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOxM-008zrw-Vy
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 21:21:06 +0000
Received: by mail-ot1-f43.google.com with SMTP id w22-20020a056830061600b006546deda3f9so357122oti.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 14:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zea8L6rlBHmXjAO+IElkhMFv5+qcblpRlt1yqi1Hz0U=;
        b=33ojzVe4/pfnWKXnqGW5gwckZeT6Dk6kFHhsC6Jn3QBS0J0KHM++qfEUXZ/QyvURy4
         h4mW3eOk52eHmMQb5i+q41gEctT6i95t6MLT1doTJKEXwM0DARdS6oohwr7yrMl44A8T
         CWRVqqPdrN4MtmpJasqZJdmZJAFHh2mO7jmt3u3fsRXFG96lXcnKJrUMtIcfJ3xtB8c9
         iRo0egZRt0ycblWXK6kev0Ghyq7oEqOFF2n35eO/BO5qdRmFiL9dmvDoKtyl4JbgJcrC
         CAToS/4ACLKi2o6u5qpQQW+s3sp+XB+1sfqnLryG5Xy+ffBSLcsf7UKmuaUsm8y1eGOb
         kmjg==
X-Gm-Message-State: ACgBeo2DkYINJz9ZTuHdXrgcqNEWmprSTwthbkxeJPVKUua/LL5Ygmq/
	4xMcFgo5Gx9e4kBemjazrw==
X-Google-Smtp-Source: AA6agR5StZwfeiKTGdEH+EZTRuW8u9tMou5fKVcswY8/NCIuh8yV79DfPdq/ejC4rQ/JKpgyWfYUUQ==
X-Received: by 2002:a05:6830:1d4:b0:636:e44a:a5e2 with SMTP id r20-20020a05683001d400b00636e44aa5e2mr4097741ota.33.1662672063637;
        Thu, 08 Sep 2022 14:21:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o186-20020aca41c3000000b00344afa2b08bsm7962371oia.26.2022.09.08.14.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:21:03 -0700 (PDT)
Received: (nullmailer pid 3361921 invoked by uid 1000);
	Thu, 08 Sep 2022 21:21:02 -0000
Date: Thu, 8 Sep 2022 16:21:02 -0500
From: Rob Herring <robh@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com, palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org, greentime.hu@sifive.com, robh+dt@kernel.org, linux-edac@vger.kernel.org, paul.walmsley@sifive.com, ben.dooks@sifive.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, bp@alien8.de, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: sifive-ccache: change Sifive L2
 cache to Composable cache
Message-ID: <20220908212102.GA3361862-robh@kernel.org>
References: <20220905083125.29426-1-zong.li@sifive.com>
 <20220905083125.29426-2-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905083125.29426-2-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_142105_045689_35A74367 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

On Mon, 05 Sep 2022 08:31:20 +0000, Zong Li wrote:
> Since composable cache may be L3 cache if private L2 cache exists, we
> should use its original name Composable cache to prevent confusion.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Ben Dooks <ben.dooks@sifive.com>
> ---
>  ...five-l2-cache.yaml => sifive,ccache0.yaml} | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
