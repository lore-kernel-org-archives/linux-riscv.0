Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208CAC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 03:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIuB7cVpx12vuQNp8OAPRpG8NIyHWidflIt1bVMCpEA=; b=Zu0mje+Fgp3cKj
	9JK/VBpDLnPoqwr0PdQDny0IVnH597tqUQgYHM72ZQq9o5QcMVAhPKcPj/2Ao2D4J/B+kvInYDh2H
	kTt55kTTwoJ4wX9fmnFCUVlrcrJlKXBobZjeGHhatu5ds5d34AfcYpjddTQL4AO5LhRsCBls8gwde
	BUVwSboA50uvfdwf/b3p3CkyPz5OPcDRQ/0AXMK2MsIsJYx3QyKjSXWpV082QZu0U8pQl2HxcWbU7
	5lFDrqd+Z8pjozM8HQzJUC95uNVwC6+4S+IC4WZtcFuEuz0dzYt73ninId4kYbUqqgAZZYalURbFj
	+34WReUxT5ihhmkfaudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF58j-0054yd-BT; Tue, 10 Jan 2023 03:17:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF58e-0054rj-Q1
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 03:17:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BED8424DCA6;
	Tue, 10 Jan 2023 11:16:37 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 11:16:37 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX063.cuchost.com
 (172.16.6.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 11:16:37 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Tue, 10 Jan 2023 11:16:37 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>, JeeHeng Sia
	<jeeheng.sia@starfivetech.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZI/MH55+1R+tLE0CpUrjhzVBfuq6V9U4AgAEFXdA=
Date: Tue, 10 Jan 2023 03:16:37 +0000
Message-ID: <964def29d1e146fc8ac17ab2fe813425@EXMBX161.cuchost.com>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
In-Reply-To: <20230109193624.iiuguwgimpn7zbyw@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.49.44.179]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_191725_160257_5B2185CC 
X-CRM114-Status: GOOD (  10.73  )
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

[...]
> 
> > +{
> > +	hibernate_cpu_context = kcalloc(1, sizeof(struct suspend_context),
> GFP_KERNEL);
> > +
> > +	if (WARN_ON(!hibernate_cpu_context))
> > +		return -ENOMEM;
> > +
> > +	return 0;
> > +}
> > +
> > +early_initcall(riscv_hibernate__init);
> > --
> > 2.34.1
> >
> >
> 
> Besides some nits and a couple questions, this looks to me. I'll try to
> find some time to experiment with it as well.
FYI, you need use the latest OpenSBI tree. We also submitted these 2 patches below to fix the boot hartid. Resume from hibernation needs to be same hartid.


https://github.com/riscv-software-src/opensbi/commit/cb7e7c3325e68a9b4d5ea210b97cac693cf5814f
https://github.com/riscv-software-src/opensbi/commit/8020df8733b060f01e35b0b2bcb2b41e6b992e9b

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
