Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B5CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 23:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYFAmNSBSLPr3FIYPONArcRiwfZ+jv3rFqAKGB885W4=; b=yj0FS0B57uKe2J
	F4UxvsG7qpfTMc3IrnlVkwqWg3BMKzQ8PZD9nogqor1ixlpSr2Pd0YLKFxXH7HJL6XjEfbIRmjElF
	1OpT0F5p3Fon0GXug7aUm4L+L534jYtEf7EvDLTqmgix1zRu+B1M25ZAC7C7pXMRwTegiTzPDRd3U
	gz8smL7BAODFqA8YdSi73H508VgF5su/SHxzrmjBMFE3xCqc+Jwqb6P/UA3BO4ZF8Ly6h4+LalFGa
	AJvEd7fPm+vfPdhlPuxDDRkWPxYb31WGt6yODVX+DXQx2XioLFpfWdsZBGCewmQ9K5eDrqKBFOoBX
	MXEOEX7CadVBtKhbp+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZbc-0000000CFwt-29tc;
	Fri, 22 May 2026 23:48:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZbb-0000000CFwg-0eEj
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 23:48:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 519DA60103;
	Fri, 22 May 2026 23:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3118A1F000E9;
	Fri, 22 May 2026 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779493718;
	bh=ghWoFZiOhT+K7y60EUrdmv1+DF5ge9DV+JDJh3gWPuM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nN+rvM4nWk2pUPTmqzoM/m6PsBKwKKMMqlXhry63N3c7gHs8unmqjUEqRN8iMRHhP
	 6E8CQwhRvCwrIUx9m+lWzxwkqiUlLv4QlydXhroSgu7+edA5sekJDt6HXmGM0cHrX+
	 MP/iJwX6WDy9nMLYYhmRbyylI1M6F8a2OZsETU9f2+iYVOU0HS0Rw+mwQ3cZ+Ger9G
	 5kNGZfAhbrVY7F4ogfvc3/mXH+95Yku/Pp0kEwQxmLfpDuTVllAqzUhwQJISJbr2Th
	 9qYTfAe+6ZRDUC46rLeP7Pny+L4G8y/54Pfd5lc5PfyqBr1AVWEoBjnZncXMmyIKEM
	 Y/pFWeyqJ9iiA==
Date: Fri, 22 May 2026 17:48:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: replace select with dependency for visible
 RELOCATABLE
In-Reply-To: <20260503040331.71875-1-julianbraha@gmail.com>
Message-ID: <fd28add8-fa62-4655-a630-0293473fc758@kernel.org>
References: <20260503040331.71875-1-julianbraha@gmail.com>
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

On Sun, 3 May 2026, Julian Braha wrote:

> RANDOMIZE_BASE currently selects RELOCATABLE even though RELOCATABLE
> is visible to users. Some other architectures, like x86, use 'depends on'
> for RELOCATABLE in their definition of RANDOMIZE_BASE, so let's do the same
> here.
> 
> This select-visible Kconfig misusage was detected by Kconfirm, a static
> analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
