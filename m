Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30B1CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 06:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o50EvuUX2lgbmZbvEDg/3BjHKE9zFKEoRF2wO1qM2JU=; b=18LbLRGssrlAsF
	SBmD40mm1CKDERZgkMj39JWfy4AkEF6ZXiMRbADFWBr+aUz/ejtN4bmaCdr29DbbIZnf7C1ntg+V9
	1Ejo+8KnqkIxziwqGzB7+TfD1Vttoy6QeS/6UiuGTc6t5F0pXFD+yNfGCPkg/x9K1mnOX9IT0jDEK
	qI62Q8IU+MuiDdgKI8UIkM+hygismfPrqaQJbU8xNmHQciFqNKWkQTj2qj7M1Y2AnUSn5LfhW8QAI
	hEYUwc0G6T/KcojUEllLqaRMoaj6uH/YRVrEiMAfblf+OHPrvdjs/o19s7KGTt6dlCWj4S/ix5GEB
	TR7v9BIBxCr2SgxVsEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnls-00000001b96-3vda;
	Fri, 15 Aug 2025 06:18:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnkZ-00000001b3C-2SIe
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 06:17:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1672803a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 23:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755238634; x=1755843434; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGmhR3eE/KutZ5tTndwU0D7V2yrLWDVr0mRfiGse/PY=;
        b=Pjl8csg8G1b+0Xk+GKdB+NeRgxlf3rC9stTrMc2NuWw2fSGNdQn7bmIhg8yC/LoGC7
         d7Wss0KRQtA0MUv3nu+Uf7eR/prV5W5W1A7ajm+XafqZWsMbMJJbq6Qro39YmisXoJYS
         QVRibbh73Bvy3YMSxtbA1zunCCj1EN1XyAKsWlorCDu/pmj2OvfBuxkUpNJ67xV6XDlT
         42D1Mo5HfX1JPtfXPScrrwjJE2SfwyzqIsW26IIRkCHjqsEk2Q0OgKjkW227qGMwHlp2
         FGUxUvmUwildH+nREKPOUbWJhyAZT5RvcHwCXIIFYVQyaF8GbZ7LmFA9ZKoSWY6UKaTV
         ECFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755238634; x=1755843434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGmhR3eE/KutZ5tTndwU0D7V2yrLWDVr0mRfiGse/PY=;
        b=orfV2oVOZmHvJ0qeeI7jVkVRST3LPXx+HYHMXZCjCVIG2typgBDjX699QiX7w/6f7P
         Hir7picjYlTvxIQ6l/x3aa9MgrpkY3czAPLKoHTSS7t1u04L9QkmrNb2zFcAPYwFEGxf
         N9/Zb3D3URyE3n4ihEHB1PF3Egr059iJFL956YDhJfsFv/qUB03f0cRVjWSsRpjDhTNi
         GDK5TICica+jolAI9WgPSaEO+3REFBS2TG49XG5tt+GgtQVc8YAShdlmkgVSv0rd07H7
         TPn86GT5jxPRow0vr0fzc2c2ap+Fpfah4KUR/G48e9yp1GHrf2OK0yt0d+NQTxJUfYnF
         Uj3w==
X-Forwarded-Encrypted: i=1; AJvYcCXslbOsfxQeOCIBDnoKOGToIElLvM5UGLp1RLiPALKpGRipWrlcdH5E2SyZxwL3HVraEntDNENt1HQYbQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdz2LotRbH2nidZE2HXxaGsVR8Z31EWDzkSuJ+toccpVQMRspX
	q4HrSiNBTKZ8MLxXPEDeaTdjWBVgiwsh3fvi30aqtVQoJge0CBLt42ZfcY2vufMW2Hc=
X-Gm-Gg: ASbGncsVnCtJz4bpugUO8mwu5tx/eNU2u9LvfPdDm+CC2nTJbvQXXmHckzwKVXb/ebt
	8MlTYFYfbowf0oK9+SoUvpAj0F+6UQiNXgbr1iiduJwaP7WXVj6WEoZRvxovM/njxPTY0HeFz5T
	fPaaWwUFaLiMJ3gSB15Uft9c8k5SuvRzywp3GB/ykS1LOxiXbXxFMoLHvc5ls37pQGw24sW21Ez
	Q5cDmfIvwYqqzGJxVqU+AeqsF8w6W2lRW5VIvmXSaLFwtE44RA82gvhreZ1VgmcY1PjV/WHDO2L
	3YoUEpPUN55zUjw/Kj0oV4fUp6MmPBL059baRG5wwIKEkZMgmhtmig/j2ZVGCzDfVE4jMjgHhWp
	UDCd1TC6uiJjXZVupLWQdLA==
X-Google-Smtp-Source: AGHT+IF70Lheb7c+uHnvLNkSjmCuMaFdEeN3otVkmRbjbDz4XiK8jFRLMEOf5LsZb4VaMWosSsczoA==
X-Received: by 2002:a17:90b:134f:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-32341ea22a7mr1402947a91.3.1755238634028;
        Thu, 14 Aug 2025 23:17:14 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::968a])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5a6df6sm433532a12.1.2025.08.14.23.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 23:17:13 -0700 (PDT)
Date: Fri, 15 Aug 2025 14:17:10 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Message-ID: <aJ7Q5tQ3oa8DBpfO@calculate>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
 <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
 <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_231715_622444_77383A2A 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, Aug 15, 2025 at 11:56:22AM +0800, Chen Wang wrote:
> 
> On 8/13/2025 4:33 PM, Zixian Zeng wrote:
> > Enable SPI NOR node for SG2042_EVB_V2 device tree
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > @@ -226,6 +226,18 @@ &sd {
> >   	status = "okay";
> >   };
> >   
> > +&spifmc1 {
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +		spi-max-frequency = <100000000>;
> > +		spi-tx-bus-width = <4>;
> > +		spi-rx-bus-width = <4>;
> > +	};
> > +};
> > +
> 
> Only spifmc1 on EVB_V2? What about spifmc0?
> 
Yes, EVB_V2 has only one spifmc1.
I have checked schematics which can be opened by OrCAD:
https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x4-EVB/sch/SG2042_EVB_V2_20230302A_BOM.DSN
https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x8-EVB/SG2042_EVB_V11_20220902_BOM.DSN

For your convenience, I have exported them to PDF:
https://github.com/sycamoremoon/linux-riscv/tree/schematic
> Otherwise:
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks for your reviewing.

Best Regards,
Zixian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
