Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA6EC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 23:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5bCx0MXC4YofnmqDSdDlnnMNwQSHvGFLIE+NfLq/LU=; b=JkHo0tvycupwzo
	39itbE3kS6LNtaTXXTfGdbLWWJAvlknexBrrVi9ZRTenwAWWsvtCcdPEG1GRAz8msMHS5p4XIM99G
	DCME5BQfaQOhjAlLAlYBMHjP3mo+p8BowmYlqOX66EHtpF/aoSm898XNz6/bYR5P0PuC9v2Q/gzm8
	4Ybtxo4az92EF8gi0vno0muA6ZEmw8Y/r3hzmEVzWTQoNE+x0xS1cSX4aYFAtwmf/m5fvTUQSdY6g
	9XGGIY2LV63oVtRGOipqiRc+axfjxBdZz2a14128CgAAfO8tsXvieqgBsUYrC4wnLTnaVXPqjgFNl
	TSwLyRWaeaxjEV580q+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q72ak-007WGR-0W;
	Wed, 07 Jun 2023 23:29:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q72ag-007WDF-0B
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 23:29:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 24D9B7F8A;
	Thu,  8 Jun 2023 07:28:36 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 07:28:36 +0800
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 07:28:35 +0800
Received: from EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8]) by
 EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8%16]) with mapi id
 15.00.1497.044; Thu, 8 Jun 2023 07:28:35 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Thread-Topic: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Thread-Index: AdmZl0L4sSafDUJ/QNiXDpDKpSg6Fw==
Date: Wed, 7 Jun 2023 23:28:35 +0000
Message-ID: <50e49e25f1c841aa82cd8334db934849@EXMBX067.cuchost.com>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
 <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
 <20230606-unsmooth-slip-c80fab59c9b4@wendy>
 <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
 <20230607-process-spinal-321ccf04d7e6@wendy>
In-Reply-To: <20230607-process-spinal-321ccf04d7e6@wendy>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [183.27.98.122]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_162922_423579_7A454131 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Conor & Viresh,

> On Wed, Jun 07, 2023 at 02:04:37AM +0000, Mason Huo wrote:
> > Hi Viresh & Conor,
> > 
> > Sorry for the confusion. 
> > Should I re-send the patch series and remove this patch?
> > Or you can just ignore it?
> 
> I applied the two dts patches yesterday, you shouldn't need to do anything.

Thank you for your help & review.

B.R
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
