Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24C4C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTWR6BQmNpKLu6/CjU4KF0XFCTZkcvK/hT27kWRSDEU=; b=QkGfSb8HrghlDb
	XpgoxN3rBcRtsWVYn7jJ2HNSYnWIElOw+XPLT5vftit9a8LgNWp9BVPqHPwaZxnz4N6xvCDll+lrV
	UhbDdD+LS0Rm8x65GI7eHfX1AyOChAM8XJfJzr+Y4EPUNmdaYfj4gnKci5yDZ1xNoZkRjWsNPT73n
	AzuTjEx1c4DcGbCDX1bckPZ4t/14RQyzNjFs9iogQO29QJYwFvszXTQ5w/MMEUuqK/dgkcDN8z8aF
	nkhJB+zfSE2M9RviBEsGJCEI9R5YVwRFBbAQ6OoN0WSM1pRwdwNCxXowj1U603U90zSm4RO8HDKqD
	Ddx8UoqCFxqi4XcM076w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyLb-00Cjmh-BU; Wed, 05 Oct 2022 06:57:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofyLX-00Cjl7-TV
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 06:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664953055; x=1696489055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eJQzGs8zpmsAOFfK3HEi9r3fT6gLFE46qqgx9GrlO0U=;
  b=cUdw8c+9vep2hOY1nOQ2hnjt1N5ko/OLOsoaCv3r9hIq+f4aREgeXMIa
   QKFn24yvz1EjC6AMyvHF4nMsb5rMDHbPksrrGcu+I00OO1UevDc/OOcEh
   2//8UgTad72VTx+vBYnEbC9Cout7c8R6M4D0YN2RBaZFSS3pVwUIjgzYB
   UwjpCy7PtxTZvLpvfyBDpzUjb1jYiuzfEPOEER+c7lQY/9XLkcCKxtALm
   wAOatQdxbTQfoTPV4JaDHPo7D30MEfTPvZw9g8v6lK8l/r62ddb0mVf0Q
   wbfvvF6T1oJoHKTc4subJieVDg+pO+WQAusgMdeIAGyCjg9/n2jrhzIwl
   g==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="180444263"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 23:57:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 23:57:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 23:57:29 -0700
Date: Wed, 5 Oct 2022 07:57:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
CC: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, <jeff@riscv.org>,
	<xuyinan@ict.ac.cn>
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Message-ID: <Yz0qw2aCs/BtZFj/@wendy>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
 <20221004170027.duk2nc6pq52d4vcf@kamzik>
 <Yzx8YfVUmHc/3CJl@spud>
 <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5b417cc-2b62-d224-cffe-3f4750284377@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_235736_084306_A5A8672A 
X-CRM114-Status: GOOD (  12.04  )
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

On Wed, Oct 05, 2022 at 12:43:01PM +0800, Qinglin Pan wrote:
> Hi Conor and Andrew,
> 
> On 10/5/22 2:33 AM, Conor Dooley wrote:
> > > >   /*
> > > >    * Probe presence of individual extensions.
> > > >    *
> > > > @@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
> > > >   	if (cpufeature_probe_zicbom(stage))
> > > >   		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
> > 
> > While in the area, could this be converted to BIT(CPUFEATURE_ZICBOM)?
> 
> This zicbom related code is not produced by this patchset. It may be better
> to convert it to BIT in another patch.
> 

Yeah, it'd be another patch - but I realised last night that Heiko
actually sent the conversion already so don't worry about it ;)
https://lore.kernel.org/all/20220905111027.2463297-1-heiko@sntech.de/

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
