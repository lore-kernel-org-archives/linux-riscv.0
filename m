Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB7C55174
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k85SgaeUyVO33KqmQUgan6sGVmyWfCMPW1ZyW4wsN8Y=; b=T5MFgatp+KV1GN
	zZRVJsBF9h07TJrELjkRVbCOegyd8X6YgpRX0NujS25MoEn17RKSSKneG5WVGhGdcrA04yg0jNGar
	7Rh6Lh60+P8xStOtf2UslJSF6ZsTodWjcPW6LDUN/dJBeCTU5esw/r/jx/C3M4Y0huC2pxPU+HJq2
	CYxkR11OPIy5Ug5OQ+deKNbxjeDk+A8UMNV45MiNYvueXPal9p2KJa6DSNxvsHFeMhefaGEFnNH2X
	eBSD/+PQGAI3VO2kfiuuEEos2ozgvr5z89IssdA8h5kNqpdvowL1P3FMBHkT0ADIcwnPTpXeLpu/W
	USA99UzujGpb+O04ys+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro0u-00000004p8T-2C9i;
	Thu, 06 Aug 2026 02:39:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wro0t-00000004p8N-1Xmt
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 02:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6DFF41E47;
	Thu,  6 Aug 2026 02:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42E01F00A3A;
	Thu,  6 Aug 2026 02:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785983958;
	bh=S/QiMh2kHhbT+/ZKm4Ypt1WxW6Md3vkhtCnWfKIXwNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FWjQT4ZQNfgus6ELRu/QFUNrLHmvXknNmljachKtlfjFkydBiiFPzdIAAxuhrnhc3
	 h8fwpNDLd8HARua5lofceJ9DEKYTIdF0kXg5BRAOeXX4SO8zbMTYFL3jEOSuLdUGvT
	 djJxNk/GJ5V21OlXzow3sgtZe7opQIaXalMIAPSKxhR9URB/FK8CTsCv6iH+Y0cWTl
	 BReXUxern0+rLU3OyC7hT6n2/oGYam53HI/biTUjL1WvPIkOpAegcKfKfyVcRuHVMv
	 YHxWR7Me0GIRCw8cqq9jkAQaBoizjw4w4Sd42+l7LXGcSVvFZuCkn7jWX46NcsfIAL
	 21fhSlAgV9J5Q==
Date: Wed, 5 Aug 2026 20:39:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: further remove XIP
In-Reply-To: <20260805010049.13918-1-jszhang@kernel.org>
Message-ID: <cdd02448-777b-3bd9-5bd5-c19f9f4d95a9@kernel.org>
References: <20260805010049.13918-1-jszhang@kernel.org>
MIME-Version: 1.0
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

On Wed, 5 Aug 2026, Jisheng Zhang wrote:

> After commit 9b3a2be84803 ("riscv: Remove support for XIP kernel"),
> something relatd with XIP are still there. Remove them to clean up the
> code.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
