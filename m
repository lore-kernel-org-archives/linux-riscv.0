Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78137C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTtbOixRy/2OePYUMj47l09JitKKkYd3VjaQ1SP9vYw=; b=mkhILCeRvWRjVz
	9kTuGutzgz0AsRz1fLoW4dHVhg8quGLVFTYNB43YW0987Tq9AT2zd9gt0MSb0S1xQZSJBSnSxLzDL
	R+5pTPRZ4/COyZ1d55+9+kEB3+Z7SsjFGIM+UHgklIt1h6ID4GBH3RDpNYeqIIROwyHc3wzDrM6Hv
	A27p8sVuvWSmWrcTQGoeEOESCcGBBhjM62+ZDihajj7NB01Rgrw6HPZY/xFcnKDGVHFUveJpzJcQ7
	4tKpqzz1QDD7taM0r7Vp0F65NPvNCwQijIe4d1M3snTcCbigyeYoCLE/83CQufHnOyf8N+usAJhqq
	N6ChlMS585bLIaAsI/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVzF-00GBRG-Fc; Wed, 28 Sep 2022 12:16:25 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odVzB-00GBQu-Vo; Wed, 28 Sep 2022 12:16:21 +0000
Date: Wed, 28 Sep 2022 05:16:21 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com, geert@linux-mk68.org,
	heiko@sntech.de, kernel@esmil.dk, arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RFC 01/27] clk: microchip: replace SOC_MICROCHIP_POLARFIRE with
 ARCH_MICROCHIP
Message-ID: <YzQ7FSEVQCFIIEZa@infradead.org>
References: <20220923185605.1900083-1-conor@kernel.org>
 <20220923185605.1900083-2-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923185605.1900083-2-conor@kernel.org>
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

On Fri, Sep 23, 2022 at 07:55:40PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> At LPC, we decided that for the sake of consistency the SOC_FOO symbols
> in arch/riscv should be replaced with ARCH_FOO so that we could have a
> consistent policy regardless of whether a vendor had ARM legacy or was
> a RISC-V "incumbent".

Umm, that's just stupid.  The ARCH_ naming in arm is incorrect and a
bad idea.  So please move in the correct direction instead even if that
is more work and more churn.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
