Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F9C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkGPemn6qJofC9V1cC0WEMBi1kHEB8N0Y8UsilqZNmQ=; b=TGwwIQlN1oeqYo
	V202vDVZFn0JO6xIYvkUSMl2Y9nxlg9ySHey/0OJzMwUp7gfdEm8EQBtNR9yuAR+V78De3yyzspFN
	5MpqxtfDTCOY6+NGQOsXTSK6zwHA6cwC7fcN7H5uKFRjVNes9iLdZNAMDDv+7nYNFOauUwfmEv+ij
	PbeJOnp6KfYxFIje+Lg+eZ91OH7dSsPO0BHSwC2lO3F4ttle6HidMNTzl6IzptqCC5t+pPQ9RdAAp
	uViOEnX+RBvZkfA//LNBdOyQf1SMACRrYQnIrdzgeB48bL3CBiY98tJI4PVIybRTKgp+h5FCC62jY
	6zjWfw8V7e/CITk2e0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6iY4-003ymg-2b;
	Wed, 07 Jun 2023 02:05:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6iY1-003ylX-1l
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 02:05:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6610C24E254;
	Wed,  7 Jun 2023 10:04:38 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 10:04:38 +0800
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 10:04:37 +0800
Received: from EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8]) by
 EXMBX067.cuchost.com ([fe80::a825:bd30:18ff:b2f8%16]) with mapi id
 15.00.1497.044; Wed, 7 Jun 2023 10:04:37 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
Thread-Index: AdmY3zKiK3gdrfFbSMGgpG/WG54SYA==
Date: Wed, 7 Jun 2023 02:04:37 +0000
Message-ID: <f29a14dad3d744bba54e561a050bdfaa@EXMBX067.cuchost.com>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
 <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
 <20230606-unsmooth-slip-c80fab59c9b4@wendy>
In-Reply-To: <20230606-unsmooth-slip-c80fab59c9b4@wendy>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [183.27.98.122]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_190517_775661_729D9862 
X-CRM114-Status: GOOD (  17.51  )
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

Hi Viresh & Conor,

Sorry for the confusion. 
Should I re-send the patch series and remove this patch?
Or you can just ignore it?

Thanks
Mason

> On Tue, Jun 06, 2023 at 04:38:04PM +0530, Viresh Kumar wrote:
> > On 06-06-23, 18:56, Mason Huo wrote:
> > > Add the compatible strings for supporting the generic cpufreq driver 
> > > on the StarFive JH7110 SoC.
> > > 
> > > Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> > > ---
> > >  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c 
> > > b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > index 338cf6cc6596..14aa8281c7f4 100644
> > > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > @@ -85,6 +85,8 @@ static const struct of_device_id allowlist[] __initconst = {
> > >  	{ .compatible = "st-ericsson,u9500", },
> > >  	{ .compatible = "st-ericsson,u9540", },
> > >  
> > > +	{ .compatible = "starfive,jh7110", },
> > > +
> > >  	{ .compatible = "ti,omap2", },
> > >  	{ .compatible = "ti,omap4", },
> > >  	{ .compatible = "ti,omap5", },
> > 
> > I thought I already merged it ?
> 
> You did, 4b4c0d37164c ("cpufreq: dt-platdev: Add JH7110 SOC to the allowlist").

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
