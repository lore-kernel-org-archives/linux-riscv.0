Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1711C072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fGL9C0Tqt4xFoa4GzZeY/VD2Pyf4tW2dzsVB52lO0w=; b=E+Tajx4duCGgBI
	ESbwZi+moCqA8BuP0ylE+xwzxouoC2s43SX4axkHQAJG0/kblbm+aAGhRVr3rFcauLlCE6Owpes3p
	arXtqaj4U6tZhaNiw/KJ44cM1k92U4FYbFXxs+0Duo5mGv+y7vrOlxFBDZMs57xxa5NeQKjyy5S1B
	eBKtJkzgpjgUKH1NCdB++NgXvRiRvmCEQZ8kcYEIvLTTU6enBL2K+YYIK7uxbNDiHalOqZiOLhBUa
	Ew4IreJSQ3U7HCbyjmnmVsm2KLUPSiRJDvoU0lJkSfRSW/U+Zzx+wd4VtUSrGqF92T1sVZK3io/wt
	VHjd1oE73IHE/QsF5XWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hDV-000s2Z-2r;
	Wed, 22 Nov 2023 07:00:09 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r5hDT-000s2J-2w;
	Wed, 22 Nov 2023 07:00:07 +0000
Date: Tue, 21 Nov 2023 23:00:07 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
Message-ID: <ZV2m92lOpRgRFfRk@infradead.org>
References: <20231121160637.3856-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
