Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2BDC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 05:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:Cc:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iADDOI/bM9TH5feX/ptgjP+pqz7bKW9SmwkDHUgaLUo=; b=ZeWupwgxIbgeSp
	GbQoos981r2OagfFMAggPy5Wrj7KyplZr5/AapY6VdodiXC5RIkvimTiz2wRI/Sv2cKnaE58y7opb
	i/I2betxhSYTj8VuXE2axfBNCYb2amSKCzVOojN7XDrIDrUtkNJgISlw8Ce2dBHBLkBcAFNH5HXxQ
	bKtbzpyWZba5xt6uw0CUzeH+xfO4VSVXH9bBYgOQpmIy4kaB6zJPiYgBcIN9Yn3x8dEiGybutHKY2
	ptuMjFRO03bAlVg3jJq1C6HpTsONXYPOsKqFwo+hgYSYbqcMPOFMPSW7QUJ3gknk4GxX0evU+27cP
	xXciYj0kEt2GzwR0bXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQE1-00000009vkk-20gc;
	Sun, 21 Apr 2024 05:58:53 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQDx-00000009vj1-35yW
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 05:58:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B2420008;
	Sun, 21 Apr 2024 05:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713679126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=syc4dxdR/zK1iQyimCV2XZQMtDD49EmFte6x8O6mx28=;
	b=b7ANrAtClWfD2PYZGoN2iEGBKeI8Gc16PEYokJCaJQjcA15GyCyZPhnvMMp2CoOrJV4Sn1
	vDefDTiq8DPYCYvYhOazG8KuKum0JMOPoYpX3vO7B/MOEUIFURuLT+aL71gd5BHbSN9D6X
	reO0i/ljaQPN2xszauf4HpiiLpnTc17LVl/Wesx3RzkQBwKEPm2J2ogXO7fHw4znq4cxKg
	zmUyMtHSGgEsXNxJhsa7YPdJ+P1ug1cg7hpj41zVV844ib+xo9nxa3yLiUIsV6K7mtdePi
	4p4V3zHU8PjE3qxcxEJ0Ktutx3hsmX3DSR0xNsGE9ocEvMbvI05LLj5DwkNhIQ==
Message-ID: <874699fb-6f11-4657-8dc7-1a0d9990b21f@bootlin.com>
Date: Sun, 21 Apr 2024 07:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@bootlin.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/2] add initial Milk-V Duo S board support
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
 <CAJM55Z8D7K5KA_POE8aUCPEHn9xXHL3Q=T7fs79eLAJyzsJ6Mw@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAJM55Z8D7K5KA_POE8aUCPEHn9xXHL3Q=T7fs79eLAJyzsJ6Mw@mail.gmail.com>
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_225849_995054_D34DE45D 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Emil

On 4/17/24 at 11:19, Emil Renner Berthing wrote:
> michael.opdenacker@ wrote:
>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>
>> This adds an initial device tree for the Milk-V Duo S board.
>> Last tested on linux-next on April 17, 2024.
> Hi Michael.
>
> Sorry for the late reply. It seems to me like spaces are usually repaced by
> dashes (-'s) in device trees, so I would have expected milkv,duo-s and
> sg2000-milkv-duo-s.dts so it's not confused with a Milk-V Duos board.
>
> /Emil


Good to know, many thanks!
I've just done that in my V6 series.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
