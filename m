Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE23EC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QruqEKbHvIjvDteMUpCIVtcH6dzLtqECcUXcYj1944E=; b=k0zZR9FADXUJ8G
	jI2sEtrSD4BWW7RP0Q5l8HFOz48YcU6T079lXOcieazALWaO95qw1ZYnCB5Lyi6xLgWPqz6DEMQyr
	gk4Np+xUvGKqSghpfC5ixizZsxxi2SXEeY3g2Y2LfnrGrwR3B/eYrOI4MnwxIFHkuZElTPP785NIS
	IXMXBnYKFG9p7jbdjGzXl0dQUYfeVV7YKHon+pwbrMkHZ5ZNwBYhcfaFFa5rKUkkTPnNlvfKIZsfv
	Jrd87pzSN78XqZ8uHW/FbzzAZvIChBtyeg30mBEd5Sig4tmnOMUCUF0n43+iIlPCN1SqaDsv8u6Nc
	nHz2LLqv9FSB3jALgWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWgS-00GOqh-Sj; Wed, 28 Sep 2022 13:01:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWgN-00GOq5-D4
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664370059; x=1695906059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HHApcl1cxDfDCuGSHDoGSRDESVGp9gz0p1Nl7f1hK94=;
  b=0Mpze0TojLCK+WnnKpJZXxsLZoxljPbx2DuShLi8UJDBQEt78pUWVvOC
   Ye8yAd+tLYzIN9JT+Ai8JWjVwKH4HrZ3TeMnsR+lVQlMGI/JY+QFSpzZs
   qTKlw4kgdfxp+WOcKN6cMgb12BZTfDfLRYeygNLVN20W87L5caA1HZRDB
   d0PnQ9slMxXtbi5ipWLRVvWLEi6pvinb0cztC8c3z4GbJfkxJ9ox1g9My
   MBEq4t1q/6OCsnI8WC98QkgU/ANyEWakbjGiwQ4MeC4tBRX/N4DnQw6Wm
   w6xvv/VEkTHJnRmm31hIFFbylGxLFDIlIMd+GUNhyjY95hJxoa85r0/Sa
   g==;
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="179311806"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2022 06:00:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 28 Sep 2022 06:00:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 28 Sep 2022 06:00:54 -0700
Date: Wed, 28 Sep 2022 14:00:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Dmitry Kasatkin <dmitry.kasatkin@huawei.com>
CC: "cl-cheri-discuss@lists.cam.ac.uk" <cl-cheri-discuss@lists.cam.ac.uk>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"cl-cheribsd-discuss@lists.cam.ac.uk" <cl-cheribsd-discuss@lists.cam.ac.uk>,
	Wang Kui <wang.kui1@huawei.com>, Jan Erik Ekberg
	<jan.erik.ekberg@huawei.com>, "Horsch, Julian"
	<julian.horsch@aisec.fraunhofer.de>, "Auer, Lukas"
	<lukas.auer@aisec.fraunhofer.de>, "Ahlrichs, Vincent"
	<vincent.ahlrichs@aisec.fraunhofer.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: RISC-V CHERI port
Message-ID: <YzRFcaNFZ7LPzrLH@wendy>
References: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_060059_520380_E8CB207E 
X-CRM114-Status: UNSURE (   7.96  )
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

On Wed, Sep 28, 2022 at 12:54:40PM +0000, Dmitry Kasatkin wrote:
> Hi,
> 
> I would like to inform here that our Cheri Linux for RISC-V work has been open sourced.

That sounds great - but unfortunately I do not know what "Cheri Linux"
is or what the "RISC-V work" entails. Do you maybe have some links to
relevant material that you can share or a brief explanation of the
benefits?

I can only assume it is this? https://github.com/cheri-linux/linux

Is it something you intend upstreaming?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
