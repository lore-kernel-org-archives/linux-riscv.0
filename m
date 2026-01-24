Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C968D715C7
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdfRfrzs6OJ35sSEREuja4YrLU/ouuILd5MFadqZz9E=; b=iCsxf5gWRZS/d7
	MsNIE0QFHy/x/m4DxaTTUNN33JvcY4n/8H54S88M00tPrB1Zrb9kjHjk6YlLSq2DYW5LhhJrgYltG
	5R0CJ9PhjL+RafK62WalhkZJsUvDdr6HO+Rt0/SLp76lrgtGecRJ5jhlyZR34ldnavtYVqOtpBRQW
	gOw3bjIZRn5crFe+ypDTY39RxgNQWGJi4mkuPbkmZJI4aEcbYxpKIBicx1iA2+DjNTzyfM+PR93fD
	ZjeDGWXLarOF0mfGjKECnbdGYfhy/PX5ubgCSuK5SI/zbceCZ0BflvTkOIBnFM4TvZFsoPtuvo589
	epfuIN/OR4s3B8xFCYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYWA-0000000A59l-1QPu;
	Sat, 24 Jan 2026 07:57:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjYW9-0000000A59b-1xeh
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 07:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 723DB60018;
	Sat, 24 Jan 2026 07:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA83C116D0;
	Sat, 24 Jan 2026 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769241432;
	bh=/3lcu5EbSSMnUGdeqq9TFxTE+A/cLGvQGHoCcQR9/e8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ObyaRoxBt0hNvX39mmPHlwWQ2zTDoWZCgJ68dCXPWPuyTV5+tv2uNbgrYqXQTup/D
	 7fJvwIXWWVHa5bu8DDZDWbxd4CZOaUs0Pqw6E2sMbWXNXWSRCoqU5Z1SlU+qFxGo9C
	 mbFbrr1b74MLAyERW+mHex4JYgY6NTWZZ+ZskDVJNeOnZaIy3LuG9XpeLEmI6jc5BO
	 hcTid2N0JyMMuVsrBiBDs2w5t8Hem6Pj37pdZuzlzTDuYANqJb/uUw9fXhaOPk5q54
	 ZylC3kZ1GoFReqEEbz/VzzE5mszUMGzbrbBGXs8WuAwJCGRnQl6e+9YPavv1KB0ie8
	 oTjX+CiENvRvA==
Date: Sat, 24 Jan 2026 00:57:11 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Add macros for software check and hardware error
 exception codes
In-Reply-To: <aXGNwBk79yMuvysm@adminpc-PowerEdge-R7525>
Message-ID: <a2a69633-8462-01ac-626c-2f0f0160553e@kernel.org>
References: <aXGNwBk79yMuvysm@adminpc-PowerEdge-R7525>
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

Hi Austin,

On Thu, 22 Jan 2026, Austin Kim wrote:

> The latest RISC-V Privileged specification defines new synchronous
> exception codes in the scause register:
> 
>    18: Software check
>    19: Hardware error
> 
> Link: https://docs.riscv.org/reference/isa/priv/supervisor.html
> - 12.1.8. Supervisor Cause (scause) Register
> 
> Add these macros for future use.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>

Thanks for the patch.  Though, maybe it makes more sense to add these 
along with code that uses them?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
