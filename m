Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F0C61D9D
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 06:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzEfI+ILA3wFNcfmorxS552878l4YXA8NSxua0bvJEQ=; b=ax62DyKqNF1IDi
	muCIJ7IHHAk+k4Nvd1lDbDuFDwLnxtnFnNljlMbXIjhwB+RY/hUTL2naWqDCvxa/v8V0dWzPfbaJc
	pd9VKowrwNA4aeeLs2sBqpM6GuLksMXm5j2l4Xu10OF34qpBBBQ0qsCPajsjgeIgd1hCYwwc6E0yh
	9kibpELYm6EmGC2aEQ7bIFAvSCjyy8jetnMWCtOwIujBi8gfr5vH+vKFY6TjsihKwQKsH4TSgZTf1
	/mJbsQrN2EcGJR+W0fy4jvGOp/In+uSjYVRWTNqIyWA2K97vL0TsSk+8WajZIcoGunHspxh0LXbg+
	lfNptw2LiPTwq5J3j/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6m4F-008g5Q-04;
	Sat, 25 Nov 2023 06:23:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r6m4B-008g4N-3B;
	Sat, 25 Nov 2023 06:22:59 +0000
Date: Fri, 24 Nov 2023 22:22:59 -0800
From: Christoph Hellwig <hch@infradead.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] riscv: fix incorrect use of __user pointer
Message-ID: <ZWGSw6/6OxUnsSVW@infradead.org>
References: <20231124113803.165431-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124113803.165431-1-cleger@rivosinc.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 24, 2023 at 12:38:03PM +0100, Cl=E9ment L=E9ger wrote:
>  =

>  #ifdef CONFIG_RISCV_M_MODE
> -static inline int load_u8(struct pt_regs *regs, const u8 *addr, u8 *r_va=
l)
> +static inline int load_u8(struct pt_regs *regs, const unsigned long addr=
, u8 *r_val)

Please avoid the overly long line here.  Or just drop the const as that
is rather pointless for a scalaer (unlike the pointer).

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
