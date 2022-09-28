Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF0AC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 12:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5ZnEgnPQZFMbguRZhgokuY3atCzppvwMUJuy9vF0bs=; b=C8YuH6WFGcIKEQ
	g6Cvb7n5QE2A/vmFBVpB/CBvrEDS4DMgNbFIWcKj1356m6GDPgWJDgOhyeYmG4BXXVUOfEwbdYG5S
	WXDwnjb1Fj9wO6MMpq203Gw/0ko/QqgM489pDTcg691mOsUrbVFrxKm+vHGsswQO4WQmr0C+ifL80
	fhsiG3a/I6dtn/lVYNuOhbYvN8Ie97D7G/9eg7cLp+DVF9gCMVh7sd9HGrSA7hXXdJwQwzjOjdhex
	V904VEUP7Fek2Sp/cGuHirBLkNY4js3eUOdtfRr+y8iAr0ehTxQRsRjIBl4jrxsy4d60CzOUasOiG
	mKeW08vtrLggHYME46Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWXk-00GMwn-Bz; Wed, 28 Sep 2022 12:52:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odWXf-00GMtN-TS
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 12:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664369519; x=1695905519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qxKCJ59Q384E1yZvRIdoejsjL4oFcd3bbKd3oAaHbVI=;
  b=EH/yTWxSADVs24hwoO0Vxz0Ibx4TyqQsaHg0P/7G+xW5qz/O00slq889
   CllQ6noAsIgTIFWm6yo9kL+FtqaqbmfkW9R8VdlMynP0zYe/EsRfYB3mq
   z7rW7YBDkZPQQhwc9zA4okFtFCKkshD84kdSoDZw8bjGbe+n4z6ffVOh+
   qwzwE5ZSYZ1B5WKJC2qX5Of4yAzStzxmjyEIVrNudkhM/FpB9bms5NTWR
   PvPNId3KitQ6Ub1uz4hg30Q84ZdPc773R73pUmJuqca4u+Z3JrKJzm787
   WPhJs30bSarJf2P+/0f22q8oFvcpu3urv+OCnm5NmDxnRSQ5Rtg5EuFiW
   A==;
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="115813592"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2022 05:51:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 28 Sep 2022 05:51:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 28 Sep 2022 05:51:48 -0700
Date: Wed, 28 Sep 2022 13:51:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph Hellwig <hch@infradead.org>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <damien.lemoal@opensource.wdc.com>,
	<geert@linux-mk68.org>, <heiko@sntech.de>, <kernel@esmil.dk>, <arnd@arndb.de>
Subject: Re: [RFC 01/27] clk: microchip: replace SOC_MICROCHIP_POLARFIRE with
 ARCH_MICROCHIP
Message-ID: <YzRDQKV2oaifqM6Q@wendy>
References: <20220923185605.1900083-1-conor@kernel.org>
 <20220923185605.1900083-2-conor@kernel.org>
 <YzQ7FSEVQCFIIEZa@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzQ7FSEVQCFIIEZa@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_055200_146361_8EBF5FB5 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Sep 28, 2022 at 05:16:21AM -0700, Christoph Hellwig wrote:
> On Fri, Sep 23, 2022 at 07:55:40PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > At LPC, we decided that for the sake of consistency the SOC_FOO symbols
> > in arch/riscv should be replaced with ARCH_FOO so that we could have a
> > consistent policy regardless of whether a vendor had ARM legacy or was
> > a RISC-V "incumbent".
> 
> Umm, that's just stupid.  The ARCH_ naming in arm is incorrect and a
> bad idea.  So please move in the correct direction instead even if that
> is more work and more churn.

It's more work for me to change them to ARCH_ than leave them as SOC_.
I don't think _consistency_ is stupid, but given my OCD I am quite
biased there. What is your suggestion for moving incoming ARM vendors
"in the correct direction"?

I would be perfectly happy to change SOC_MICROCHIP_POLARFIRE to
something like SOC_MICROCHIP or SOC_MICROCHIP_FPGA and leave it there
as far as renames go, as long as beyond that there is no ARCH_ARM_VENDOR
+ SOC_ARM_VENDOR muck in the file. Would make the series considerably
smaller as all I would be doing is unifiying how the SOC_ symbols are
being used :)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
