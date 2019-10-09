Return-Path: <SRS0=8slP=YC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F0CECE58C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 23:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E8F320659
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 23:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZ9dYkmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E8F320659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14w03GOLAnnlyZVjQ/uu7Vmozv1eqypW9BKX+XCWYew=; b=sZ9dYkmukyREfs
	VVuHA+/PxQ/+gUdxoxxdvxipJlChUt9GtLZNOXHVNuZxRfMdaJ4j6IgbCU98olCQmgJQSj/e/XBv9
	G3tNPineIm0TtzZquvPS2RB5UYNgpqN6xms8Zi8RdSUZHYlwZtmtP4fakLWW0iiOv8FY4o5EWZjg/
	54vTnJ2bCvft9Q6ORVwe4mc7/Nt6neiHjWKmytMU0q0Qyv2Oy8eqy4EWrJrIIg6BEQ0oDbQRBTOpz
	W+gQ0IsEPWNj8M413fYqnx7AJuNzsmBD/G3/LkLpwFq7ELU7FVr74qep0kvIM8eeKK/lFn2IIILMp
	ba7bywc7mQHoI2AKY5fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iILT4-0003aK-Bt; Wed, 09 Oct 2019 23:34:06 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iILT1-0003Zg-QO
 for linux-riscv@lists.infradead.org; Wed, 09 Oct 2019 23:34:05 +0000
Received: by mail-ot1-f65.google.com with SMTP id 67so3267919oto.3
 for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2019 16:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tPc6fpcwZsUc9Gutbs7P7oeYlZYQt/DPOxeaF8rIBfI=;
 b=aKvDWLshb5Alwf8LmsZKL4sV/6uBMfsIQVCeqE4jtCmapH8xsYOaZ/DCoF4lxuCnI3
 OaWIXICNaT/rlbyID/EwBMwyzCaexlkb180MNjNuzzIh1GPuEuJ1aTrdtxvzWZeKBMCZ
 HrM/hOl+pHrp5HopSkQDFkeyOQCcmXoNW6iEHC5taIXEf3qKAAICy/4AGx42U4NaoJT+
 dRi5QYBaWcNwrjbqP7bo50cu4gMr3+tLfKB0fSc5Ie21yoZdIAypDZCHq9u9MDOBB1z7
 hvkC+EuVI9HQvzTdE7ChPA/ODtFp+c17esDnRpxL5rO6IKjKU3DcFfiZitMK9H9b0EKr
 +TNg==
X-Gm-Message-State: APjAAAXuXG+FfQ328R+TZUFR/ZYGlIXUVOWE/YsTeD9mbmfDOk6gd/SD
 LXhtRjI3gFcrXx53DxQu5rGfsmA=
X-Google-Smtp-Source: APXvYqzjadRfoKvbeOh4piHSXFjFjIxcKYdBtSHwZOYiSb/x+QYN70jgIyRNnwBJ14txKmB+a9qLGQ==
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr5294314otp.40.1570664042379; 
 Wed, 09 Oct 2019 16:34:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 36sm1116076ott.66.2019.10.09.16.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 16:34:01 -0700 (PDT)
Date: Wed, 9 Oct 2019 18:34:01 -0500
From: Rob Herring <robh@kernel.org>
To: Green Wan <green.wan@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
Message-ID: <20191009233401.GA8805@bogus>
References: <20191003090945.29210-1-green.wan@sifive.com>
 <20191003090945.29210-2-green.wan@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003090945.29210-2-green.wan@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_163403_855283_6284AB01 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: devicetree@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yash Shah <yash.shah@sifive.com>, Green Wan <green.wan@sifive.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, dmaengine@vger.kernel.org,
 linux-hackers@sifive.com, linux-riscv@lists.infradead.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu,  3 Oct 2019 17:09:01 +0800, Green Wan wrote:
> Add DT bindings document for Platform DMA(PDMA) driver of board,
> HiFive Unleashed Rev A00.
> 
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
