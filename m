Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A47EEA849
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 00:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bd46hZnZQFObKax6K0vWRodXcBAMUsfT3Z1PnjvyLCM=; b=QYkVZ2ec1kv8dr
	a/AdcpQpd9l/4EsObHrIDUUP95WonKOHmmsGZXd+avDDLpHFC1zPSux21Xzwqyvd9UlQCrQLF8rAg
	wQn1zC8ZusJKKsFuQlK9UrPRgzen//wtRxhivzcNgX6ib64FyxpdxO+0OdwsgQ877nfaxoDi+0g7R
	v7osMijq5dkEtowop87JV+0KoPwJlZI+vMdwJa+/A30U1dywFmeA1ZnUC8XBbYNSlVaGYXcgVWcI0
	LptSxIkJy1H3L7y5QOaN20M0A/Uf9FmQA5LnZi1q+h1vMkA1tFes9OjFFoLhvzS70ENs5jM1t4As4
	8oLOZc54S7FwLosY0FRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhJ7-00000002nXa-48OS;
	Fri, 13 Feb 2026 00:45:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhJ6-00000002nXO-0U2W
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 00:45:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 412E56001A;
	Fri, 13 Feb 2026 00:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D739C4CEF7;
	Fri, 13 Feb 2026 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770943515;
	bh=+Coqz3gJhHO8ueWOqmtg7UAoTt8W/qTr1zHhw6OA2ak=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JBS1y6Hx5tV/iu12zHiTh+8uc9tEoZYg8JIp4vBoJWN5TOX7QHTTRHeUPHqSe1IK3
	 gHBUC7b+T0oEcVOZaUzqzvBZ6Eix5wyBNYAWIEaB7C+MPWMYILysk6Nkw/lhocbZz+
	 k6ZihQmE5rbNCL8AIA65xPuzOWPktGnsD3v3SiizU+cFLWQYazYa+LeGZ+Jni/70ox
	 07FzjLXVEMYczbatcWYcKmRPN5DcCY5yrKzYH4k4hV7lQSZ7yHJk0CTj62q8QYvlRg
	 SiEWZo3Ay705t8tOMizr1rTmqsSToSZEWWNfMrfjT12nyNN4R6jx3XdzCtZJTN886M
	 T2lU+YssDBZiQ==
Date: Thu, 12 Feb 2026 17:45:13 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Austin Kim <austindh.kim@gmail.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    austin.kim@lge.com
Subject: Re: [PATCH 2/2] riscv: export kaslr offset and satp in VMCOREINFO
 ELF notes
In-Reply-To: <aYwKUE3ZzN7/ZY/A@adminpc-PowerEdge-R7525>
Message-ID: <ff7ba7eb-dab9-ad4b-1497-83e3530325d6@kernel.org>
References: <aYwKUE3ZzN7/ZY/A@adminpc-PowerEdge-R7525>
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

On Wed, 11 Feb 2026, Austin Kim wrote:

> From: Austin Kim <austin.kim@lge.com>
> 
> The following options are required by the kdump crash utility for RISC-V
> based vmcore file:
> 
> - kaslr: If the vmcore is generated from a KASLR-enabled Linux kernel,
>          the KASLR offset is required for the crash utility to load
>          the vmcore. Without the proper kaslr option, the crash utility
>          fails to load the vmcore file.
> - satp: The exact root page table address helps determine the correct base
>         PGD address.
> 
> With this patch, RISC-V VMCOREINFO ELF notes now include both kaslr
> and satp information.
> 
> Signed-off-by: Austin Kim <austin.kim@lge.com>

Thanks, queued for v7.0-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
