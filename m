Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FF7C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8ySrQukXFk+InnJFhThsZ8b0dgJ6VVc/NEZPc6q4QE=; b=FO1nkAUC+ffjlh
	2jIiFP+cGACYhzj5xh3kwqSA2ho4Ee2o1s35qr54uJ/hKRE0JMzBwh3FtniM+8OFtlpRkcVKOBti7
	8Rqia+4gg0K0utcyfVkuxT8FbKP7TWMH8Qn4aAHew+d7pao8P3R5LGWbgpJJTlR9Gx2DWzydKMbza
	bI3PC/xCO2d+U+GFRXIUnbmhlacGKYXX2y542f9HhpBFD8VA05BHPOAsGDmg05uY0pZpA016iMQ1R
	bHUHweNM025MoAuBEAWcnm7PdMtN/6Zv7hqpaWnakxxkJysvCvPv4QDOmlDwYm6Arre+yoCDNb9gH
	hkayNJHZjhU8WF4wrPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0eln-005mwH-RL; Thu, 01 Dec 2022 08:18:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ell-005mtQ-4G
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 08:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669882688; x=1701418688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qvgj4UYKFORZ6SYDr8FMpL/JjXjKi/cME0VH74Zx2ss=;
  b=Iub09pDhkM9Lb36pwTFYJlM0e9zQfz7nCvfWRWKYRu8XQ+OjkHURqyAU
   TdGrzVFHk7CuEf+YRT4lssYuGoTo9QsHnRG1BKG4eMN1oOskFAHFtdKSl
   9JMoWk8fI33W+7z7SC1OWJJLHa0Xp5PdMoMWt7QqojJJcQy3iwOnzXC+n
   3RYSROw2dz2P2Axt3kb+eRzQS1yacyL/nH5z6BGksKSd9OJcwr6vFxW/U
   CyldpO9XHjkV/rhcOYo5AhChk8Y+udpzcCUqJ91ZXzH5rVQK81ENMWlcW
   0N9129AOi4ChB8rULyA9QPhG9jKxMuCZ2rPmAGLOl3Wll7HYc6d0IPF6q
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="189504600"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 01:18:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 01:17:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 01:17:56 -0700
Date: Thu, 1 Dec 2022 08:17:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <corbet@lwn.net>, <guoren@kernel.org>,
	<heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Message-ID: <Y4hjIWHTuYcf90ja@wendy>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org>
 <Y4gZ/KZz9rdYj/0r@debian.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4gZ/KZz9rdYj/0r@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_001809_296216_73019E59 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Dec 01, 2022 at 10:05:32AM +0700, Bagas Sanjaya wrote:
> On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
> > +#. Single-letter extensions come first, in "canonical order", so
> > +   "IMAFDQLCBKJTPVH".
> 
> "..., that is ... ."

Hmm, that reads strangely to me. s/that/which/.

> 
> > +#. The first letter following the 'Z' conventionally indicates the most
> > +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> > +   If multiple 'Z' extensions are named, they should be ordered first by
> > +   category, then alphabetically within a category.
> > +
> 
> Did you mean "most closely related alphabetical extension category in
> canonical order"?

I am not 100% sure what you are suggesting a replacement of here. I
think I may reword this as:
  For additional standard extensions, the first letter following the 'Z'
  conventionally indicates the most closely related alphabetical
  extension category. If multiple 'Z' extensions are named, they will
  be ordered first by category, in canonical order as listed above, then
  alphabetically within a category.

> > +An example string following the order is:
> > +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> > +
>  
> IMO literal code block should be better fit for the example above,
> rather than definition list:

Uh, sure? I'm not sure what impact that has on the output, but I can
switch to a pre-formatted block.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
