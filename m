Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63C6C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0604160F48
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 01:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0604160F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1twesUUaEoTM8jvRIBSAsJIXrRHXed1JcWqO+4hno4I=; b=hu/mITnppSSf8j
	xdvi7Y2ush0yLXkqaevv3dc4P5SfidiPRxtjUXi52nUBXoEpBVNdjkhPFy3Zx4VVo9Wx4L9RTfna6
	SYNKMIaBHNxt+iBCfZZfu2atmKOJBjivC65B+uPb0V1eJMBwK7YRvoxKV7khylDezx4SrUKp4arHG
	BGHUeOUdF0lxXWEL/z6Kvu7C1Mm+YkGcV5puwItKEC18o3kkHUSs6Whaa2cg76x8FwsQK9wozoFdh
	x8qz/QG9rCdpH3XzEruiLTUfA2moO+5D+mmONrO3OD2jyqSOenQlvHxc70hWy8tBYWTuPlibwWEAr
	cVn0qgXd5XvB4gIUgZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAjIu-000j12-OA; Tue, 03 Aug 2021 01:33:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAjIs-000j0k-Sq
 for linux-riscv@bombadil.infradead.org; Tue, 03 Aug 2021 01:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6binG8ap9CTuGzImVmNqLKbVkvaarZSfoUBW8rg2IY4=; b=iwraDYHaJ2O6+9hYwZY3Rw/Yez
 lU1/scCe6CzC+mFnm4UKNoCfWQxg1aXzW0X+Y9xd5It4m60JQxHn7DP40f7gH5zXSCsJG+Bfln5x3
 Qu/M2WplZWSKVmjGNefQxguLe1NDpRDILa/Lrv2aMfo8SHa4J4jNX9vd+U+OwINUl0XP97Pqep20N
 C7NuwIMRtlH9qCY6pSLLvgUNalHoZ55jBDtxS6EaMxN9lAM979CY2SoKj2EEjuyEc+WL2gI7ukoTd
 nVoKH5L3o00zWRNzC+s83dUB2xD6dqKAvTdO+jsIoCJJB7kgB6WGjpCGNpTViABpT6ctCqaBxXBP7
 6bwke9Qw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mAjIQ-0045Vd-RY; Tue, 03 Aug 2021 01:32:51 +0000
Date: Tue, 3 Aug 2021 02:32:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Khem Raj <raj.khem@gmail.com>,
 Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
Message-ID: <YQicuh/Qtj0AfxdK@casper.infradead.org>
References: <20210802234304.3519577-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802234304.3519577-1-ndesaulniers@google.com>
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

On Mon, Aug 02, 2021 at 04:43:03PM -0700, Nick Desaulniers wrote:
> +++ b/Documentation/kbuild/llvm.rst
> @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
>  	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>  	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>  
> -Currently, the integrated assembler is disabled by default. You can pass
> -``LLVM_IAS=1`` to enable it.
> +Currently, the integrated assembler is enabled by default. You can pass
> +``LLVM_IAS=0`` to disable it.

I'd drop the "Currently,".  This is presumably going to be the default
going forward unless there's some horrible unforeseen problem.  The
"Currently," implies that we're planning on changing it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
