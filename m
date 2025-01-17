Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC0BC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcHdGi/46KZ9hf0RlI0IYj69+XUJmcu2xaz6l/OfMWY=; b=htW3y4s7t9+y94
	Ujuk39k01vik2mMl7bupIArTVBlsA52EUP0drqNl0So+5Y39zYB4H1RELBDbtRu9QS0BzYq+D8A9O
	Vt+k+y8heunaRRPsa7AMISt8mgkA46NNzkRTsmbm8u+4pqAH9FRY/s/Dc/0RrHPPUrn+6fJWey4+l
	yAvvz4Xv+WbbkJmsFXmP/DojBbNq9IoEU4zVVw8maQBChl213NAyJebEFeaX68ojmzla+8oCln/Qi
	zj1SGArdCX0Zln/r2xgr76GT2iGHR1GKE/UylhIDJaO70I/ITe69W3LSzKjdYepWcVaW6Y5FFh3v7
	V1iMHoj4yERwPm8DQcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhIO-0000000HGzN-3yAO;
	Fri, 17 Jan 2025 08:01:36 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhFZ-0000000HGXG-1zDw
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 07:58:42 +0000
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B334A2E002E;
	Fri, 17 Jan 2025 08:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1737100715;
	bh=PULZRdCZlGiRvZavm17XV79zU7zWTlHm51izt14vnvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxzPQY4P6WmG74fnXedBUfNBWyGy78LNlSlx25pEgRXFFgYfLvcw2F+LThrWKuEeq
	 KAvLTazTse/eG6CiUzTViPXbuigS2/4uwSW7xWBcJKqVvYudv5/Azoy4lqhWEXeWss
	 7iGZXnkn4gfNbfWjV1SW0KnEsQaDzAHhIK7cI9Mz2GBPw4Fcx/EiH7fsa6LQkaSPqc
	 75Y2+UA7YOICBQPLgtn9JJGJsp/zMtq8HzR4380tQvTHSysFgpQyRWhQr098tJayw8
	 C4gC30Rz11RbZ5z+jju/SVDJ5Q+v4GwLnyPTkjCHt5JmHaMBNJJUnUVMUllGwwOyYO
	 1X1cCPX+GkeTA==
Date: Fri, 17 Jan 2025 08:58:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: guoren@kernel.org
Cc: tjeznach@rivosinc.com, will@kernel.org, robin.murphy@arm.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	baolu.lu@linux.intel.com, zong.li@sifive.com, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
Message-ID: <Z4oNqjtzYkjRJlYr@8bytes.org>
References: <20250103024616.3359159-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103024616.3359159-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_235841_753708_98AE2962 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Jan 02, 2025 at 09:46:16PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When __BITS_PER_LONG == 32, size_t is defined as unsigned int rather
> than unsigned long. Therefore, we should use size_t to avoid
> type-checking errors.
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  drivers/iommu/riscv/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
