Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A108C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBFjwGto8/5G1bTu2n1Sq4phH4znRAMyfFEDNRYxoPY=; b=q4p87x3tv0HyDi
	lp60SnTvTbWzxD/d3GL3XF5ZqPgEY0KxfvEfp5/ssqtXACBwWhDQSVV5a3ZaewZI6+VEENeFYlyD0
	o48a7+48XtA03K8KA2HpAQisdiFOsBOoo8u93vZCtp0eCNQe3hiVoM74dRp5glUJaPBhYveglYFiV
	R64Cx6csV3j4ZzuFPrIbBWfvh8eYCoOXsf5btkS5XxtlvJRYpw8PLoxRDkC/0uOlYvwAHfXJ/NTK8
	Kc600ePdgEI2S4Lfal0RAz4y9GRpju86e5qlxtyUZMcd1NaDL1I7ady0zazZ/Aw71WAnmAU2a8qLM
	zgDJOPGfJSVTTR3Pa3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Q1h-0036Cv-I4; Sat, 03 Dec 2022 10:45:45 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Q1e-0036CS-8D
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 10:45:43 +0000
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53E4F723;
	Sat,  3 Dec 2022 10:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53E4F723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1670064341; bh=7W8iEOJ2Z1sorKwITz1MMnhfqrnysZ8urK0DUwqqR1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NC6jvyPxn8ZGMsK34v3rRzO3a6cXnLr8E9L7l5PGJ+PNrSm2y64FlTixUpCuchEj6
	 5jQEaxsmyn7XJVYtSMbVyhZrcQWvcv49OL/Tq/4gVmVibwp8qGK2upCQ48RyjuVZal
	 cntlSNvA9Yy+X1WS1UmWZ5zfKkA/+vkhHAa/KGc3H3DPJl3lbzQNTmA8jIfT5iD7wx
	 uzKZdTW69VgO5+erWqFHOyEtkbsc+oJDB1wX7r3nGz+j0r3IfijiB086025eLZ0kQ4
	 zLZQDIBip7hYxV4ZefdzHD1tNZ/PJ04KP7Oxh3G0dxfTxmGQOxW6rOHIu/M03r/utb
	 qW3onNcEMW0Mg==
From: Jonathan Corbet <corbet@lwn.net>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part
 of the uABI
In-Reply-To: <87359wpy9y.fsf@meer.lwn.net>
References: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
 <87359wpy9y.fsf@meer.lwn.net>
Date: Sat, 03 Dec 2022 03:45:35 -0700
Message-ID: <87y1rooje8.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_024542_309275_A831BC80 
X-CRM114-Status: UNSURE (   9.80  )
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

Jonathan Corbet <corbet@lwn.net> writes:

> Palmer Dabbelt <palmer@dabbelt.com> writes:
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> I think I merged the last one of these, but if the doc folks pick it up 
>> that's fine with me.  Otherwise I'll take it when it comes back around, 
>> so folks have time to take a look.
>
> "Doc folks" applied it, thanks. :)

Actually, I take that back.  I'd missed this part from the patch:

> Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
> it to be applicable, just getting a patch into patchwork while I don't
> forget about this.

...but b4 happily picked up a couple of *other* patches from this thread
and applied them instead; I've now undone that.  Sorry for the noise.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
