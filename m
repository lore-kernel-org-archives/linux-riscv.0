Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB3CC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ix995TddSEKcy+16tx4pNxc8/7f0MWbmLqRknN/u1Bs=; b=23OUqcjqneukJQ
	HRauHZx2Ljgv0SppLASOviyyh4QRaSm9lY9qyxHgxiuMXTv+eiWxcoMKUvYAyB/aNDrS5/Hlrt5qH
	cO/XYj4P+zHCvOW6alvTVEnkHWyi6Wo6V6D/fc23acbfdJ1XoyptK4bSDmmFCQ6y2qmMUVt8eDpio
	aaBjhN2yHPhpiHlZRMGdsqB/fItKndLTmpMTA4VElx21CdFzifiQbf/318+Ob482r6ZC0WALVYCBl
	5rNCQ4k1uytPrfyj+FSTFTpnFm050xREiLuBo8y3oduLBUu+WHsn0ps4Lrum7po8o9d3lfxmVXcpj
	FWfo57H/N1U64M2ENPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq1c-0000000Eiqt-2Z6c;
	Thu, 12 Jun 2025 22:03:56 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq1Z-0000000EiqQ-3DqU;
	Thu, 12 Jun 2025 22:03:55 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso1267615a91.1;
        Thu, 12 Jun 2025 15:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765833; x=1750370633; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=P6UFZ66xqRKo5Qb1JeyWeBUfuJaI1ERalbP9aw/n3zrX93+qsgJwE1k9PGBOqCfjO1
         KWkk7stS4IJCls6QGIic54Ghf0m7DyFtFoPO2GrdOwL1rMdAz27jENuvUs8hShE5a8VB
         Rprx6hByRH+p7Nj+OKXjooDLr2ktaZlY+wgwZpOCijRowbAhF27t/iy/Jg53GwR5RR0i
         lFX0afCacc3ACbgqab4+IxpKZdb4mTOz1OUYLf6rtU3veCn0TPYoEBD/CDIsJYtraWrI
         tFYlKYpBTwmmg+xuOMffvHg5x2hkr2k61FylIFhP2aagSTN9lLnJQGABIaKJzF6INw0H
         gWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765833; x=1750370633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT2Tg8D7Dq4Dema6zaCK0SsodJZdyDqLXbIGVQRhliM=;
        b=ZhisAElPPCxOzH5VEpfD6arZGMnw/UJpeaQ2wzzlEqN7lWauciVwaIeuspweDrvSgv
         5O4WnMmscmYuEp/QNgmhFqS9rZz+cdEQv6AS/r/iVbe60kK8SsMAgzChXacW6vln1dsS
         pq0FohgU4JvFLTk6SpAaF5JCgLgcxcSUG4EKe/YvDEwNy2VCa4dq2ywoOdUZ9RrflQzb
         GbBfjqZRH/vBy4SxnlQKU6UKSexUN26wkiwjECL09jxH5ROmfUGVfvmpHjW+4+zFNNnG
         uymm5iHfF4VwNCRKmC2oj9eU8j/ieRuccllQnnU3NdgmEIGAvB+IWszh8RO8l9mpk7Gh
         29HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkurp1aALM6OhgCSXZDNA3jDte2uwALe9C5KyQLidPEZeb5g1oCLskM6sSf/aO5DRtIK+DOfgDkC3oRjo=@lists.infradead.org, AJvYcCWxaL/8fD3Jx4mGRBZY0jx2ld35rJZ9PnXywd5UXVx2ukv8GKU5m8Xl6FS9fdKZnT39NA4BxoFsLsQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFXpEeNLLAlU4WpkenRT6ZiDiJDJpcexU7twQSLrxV3kUE3StA
	OBn7WJUswwZ65np3zYTAHb33XO16XIUDGO6WDqapo2rglkdfOJZNgFuD
X-Gm-Gg: ASbGncuKlcUHiW239HQT3Qz/RLjMEhk2QQpM/9VyFBAJIct/m3XaHb7hTe3icyV1y7J
	mh6DzMZTWINk4JRtNWV2Bbz+h4wE9qx2hOe+r/QeYmSIGXyYetZxU6t3rlOxAUeRU0Lm8gQ19R0
	QZfdjuzbinG+/FbdNm61Kj8IvnEVAcITeYIJ7O+/eimlCgfg+2CVJuuiMrLQccRVW5jB99l1CBE
	+l2Z4TgnpKtBB/IJ77lY5bg/wqEA2hWXmi4Bplmy5gGuek8sl5P2fnDSl8xHpqi4iAg5WgQ+hoU
	bTihSS4OLJ+vvM+DWVFqendPbxtwl1EX9yuee0CYCMzrK9bnOVzvmucTi2D3
X-Google-Smtp-Source: AGHT+IFEKNLfpOAGCxAJGsac/EYqmS3wSquQaG49ddE1q1GX7taDoBx1GaZvDLzKHooYzWdOVmZGkQ==
X-Received: by 2002:a17:90b:264e:b0:313:28e7:af14 with SMTP id 98e67ed59e1d1-313d9e93c27mr1088783a91.19.1749765832654;
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365deb04a6sm2077235ad.178.2025.06.12.15.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:03:52 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:02:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-siesta-verbalize-6a7768ebc648@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_150353_807059_3A5BBB9C 
X-CRM114-Status: GOOD (  16.09  )
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

On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > "VBUS_DET" to get the right operation mode. If this pin is not
> > connected, it only supports setting the mode manually.
> > 
> > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> I'm having a bit of trouble finding the v3 etc, could you provide a
> link?
> I think what is here is sane, but I want to make sure that review
> comments on previous versions have been addressed. "dfn:" searches for
> both driver and binding filenames turned up nothing.
> 

The v3 is
https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
It is a long time ago when sending these patch.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
