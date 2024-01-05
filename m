Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B58C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 09:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rgt7gM/+2SXENdz3NmvMRCfcSwER8PqoBA2XE1kleQ=; b=LfU8V3SVHUzKm7YVno3f2Wl4Q8
	lnkRx0eDDZTBYGnV8pxpXYbK0HYk9r5AZrNXx0YffmxYc/saBYbs8OLHowaRynvlQesFosL/AzmSw
	RWwKppvrYX9jvC+7yiZHM2shGl8d84qzJcTB1bjr9N8EPcPtt1w64dlQDefVDgRHma+DImUg+QcS6
	U0mODOiBndkbRy/NjJZ+q6ZaKZnn41uKHE3+Hzzer3wht6tHf9pUq26HzhlrBYC2+oavrjJQ1sYsO
	EYnGp7ko36cWbjpkzubmvL6xUoqZ49+/oN+wSYR11XDjMrYaunf4cCpF5RWYFSq8eJhU+DH33JL4G
	r8/kBXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLgaG-00GOvG-1W;
	Fri, 05 Jan 2024 09:33:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLgaD-00GOt3-2N
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 09:33:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21AC7FF81A;
	Fri,  5 Jan 2024 09:33:35 +0000 (UTC)
Message-ID: <d34bc284-12f0-49d9-8775-e1bc09e8c815@ghiti.fr>
Date: Fri, 5 Jan 2024 10:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Page Table A&D bits scheme
Content-Language: en-US
To: Theo Z <theo.zanibellato@cortus.com>, linux-riscv@lists.infradead.org
References: <6924f053-580c-b2c3-4680-e613491d3377@cortus.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <6924f053-580c-b2c3-4680-e613491d3377@cortus.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_013341_900943_C67E6F07 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Theo,

On 05/01/2024 09:27, Theo Z wrote:
> According to Privileged: 4.3.1 (p81)
>
> "Two schemes to manage the A and D bits are permitted:"
>
> * When a virtual page is accessed and the A bit is clear, or is 
> written and the D bit is clear, a
> page-fault exception is raised.


At the moment, this is the only scheme that the kernel supports.


>
> * When a virtual page is accessed and the A bit is clear, or is 
> written and the D bit is clear, the
> implementation sets the corresponding bit(s) in the PTE


This will be supported by the kernel when svadu support is merged in the 
kernel 
(https://lore.kernel.org/linux-riscv/20231102120129.11261-1-yongxuan.wang@sifive.com/) 
and in openSBI 
(https://lists.infradead.org/pipermail/opensbi/2023-October/005768.html), 
but it depends on openSBI FWFT extension.


>
> Which implementation does Linux is expected to work best with?
>

svadu will avoid a page fault so this will be the most performant 
implementation.


> (Unix kernel xv6 works with 2nd scheme only)
>
> Best regards,
>
> Theo Z
>

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
