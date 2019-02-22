Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFB0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 16:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0122075C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 16:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTPSmVNV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0122075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K430BY4tgL3iFI/k+lnDQoqFSOULmQl9wbD7zWMojq8=; b=WTPSmVNV7VXgcB
	yruK2KO0qQnRMNnHJ1grDfqq2g/iyPS+VwODoPo4HakX3zMvuLMiFuzsZbApOFI+7HD2tUjYy+Hrk
	kj6p8ax2BHYNIQiIvrN2EKLNpGaMnqWeqTXCRIOWp7Z3j87M7Eilyd8lwrU6PGeZMNmoG/YGHpo54
	P3NwPIWS7+/IhWa+dto9J27U3HJDK80GsG/qXUxRhXnMxxL5l7/oWL9NSIyioe11qtMc1GifLRjxg
	SgaC7S0VZ6d3Eq5SAwTAj639NTh9HzBfUWgM1LBK8/BdTHaVFoDdrc7nkmk3Qp+32mT22ybkHVxCK
	BcaCGdTZFrjFPxMnnuKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxDtP-0000SZ-GM; Fri, 22 Feb 2019 16:41:43 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxDtM-0000SH-FU
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 16:41:41 +0000
Received: by mail-ot1-f67.google.com with SMTP id z19so2401263otm.2
 for <linux-riscv@lists.infradead.org>; Fri, 22 Feb 2019 08:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XMd6d5tyjUw6DCRtlAjkYupHm7RKPdnmR4ieEeDu3s4=;
 b=ogPufQ2k3XunjsQbeJL2D5TLAmrwNiA2XdzPhZ/SuwgOR53pFbtRoomMvOzBkMsLa8
 jlpNmLss7MIEJSi4GSmo11/Fis5YQur6vEyCljfN8SDT3Pbr3oO73G+4JS+yQYVPcAeE
 KHyDdZOv8KvZYSFHuvAghpGT8sDcHHAfuzMeyfSpbcWfBoX9m/NOVFl6CakT2u/E+nPl
 A2uGXhWnTrOKhsm+2LjzzYbA/8DJVj1N4sOa71dknVGs9Fo1JGJA9juy9vDlfr/CQDQn
 HOgbfGP6+7mJ9x4KgH0gwdp/7GfGUhC07pFH94gcOz+kJ5sPX9CNtLFcTl0caNe1sQNs
 5ghg==
X-Gm-Message-State: AHQUAuZRcGBgPKNZKVgfzQhF0H3cXORgybX6R/i3P5N+xx4uWk2kptQv
 4fhXVcqDMyoAgfD/9eRiFw==
X-Google-Smtp-Source: AHgI3Ibwxyp38dJDZl+owediDt3iGPWdSU0G46lSSkxo+oDaaxei8z19jackp/IDcMahcGQJH1Kx1A==
X-Received: by 2002:a9d:220c:: with SMTP id o12mr3099431ota.19.1550853699201; 
 Fri, 22 Feb 2019 08:41:39 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x127sm734264oix.25.2019.02.22.08.41.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Feb 2019 08:41:38 -0800 (PST)
Date: Fri, 22 Feb 2019 10:41:37 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v7 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190222164137.GA23340@bogus>
References: <1550740301-10097-1-git-send-email-yash.shah@sifive.com>
 <1550740301-10097-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550740301-10097-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_084140_510142_5389C786 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 14:41:40 +0530, Yash Shah wrote:
> DT documentation for PWM controller added.
> 
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
