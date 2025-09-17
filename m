Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D4CA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qG17og/RD/FAen++0dJR5aE877S24gvKoS3odaQAqC4=; b=X7k5YE90rC+JRp
	HxxE5i4fwMrftmnzjqrYMjoxfl6vYkD8CHC0EBct7+rytbJnmBDrXydvJFfam1ExcrzXGN2Ya1ZEY
	84UIyTtmX6362D1kS7DQ/fIDlCWllLO7b/N/M05XGKk3ZBp4y+JYtrlxJmnZJeajwiT67ZDrgCZJV
	jko7i5EW/UBcxfBjWx5TTz0YbVOsAlXm2ADJylOg5ZQE7llbCuD8+Gg2/E9mRhW/C8PkutR+pRsl1
	uIs/MELFVsLvWkrDqObXhFS62auui0NXwU4gPQ/UslZQ2xQoqB0CDyka4VUWQndXw5W5WfUOZ/yie
	shU7HDcYPijdDYVsXSoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrMg-0000000BLcy-0Ydv;
	Wed, 17 Sep 2025 12:34:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrMc-0000000BLcF-44r7
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 12:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A214743E24;
	Wed, 17 Sep 2025 12:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4D2C4CEF0;
	Wed, 17 Sep 2025 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758112460;
	bh=qkAtnr0sXMw+0SYUV0AuKKz3iXuu15biXIdQ4ivHAto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yzJBOb3clMLW1DnjyuAltcSKa6aIShyw6FLuTIc6s9c28mAWLzkJyUL5EajkgW6VG
	 3OL6Q4WleVFV+kNpoylsQ992Ck/DkT4B0EoGdrRiMVFW/hchFHV3cUGWK9jYk96ORf
	 vROwAcNoVKiMhg3kEYpCmMD+QYczkwQT9+6zoq7E=
Date: Wed, 17 Sep 2025 14:34:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: Re: riscv: Backport request for mmap address space fixes to 6.6
Message-ID: <2025091739-roundish-dropper-c4f6@gregkh>
References: <b68478db-5a8c-4b5f-a4d1-f4202ca1f062@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b68478db-5a8c-4b5f-a4d1-f4202ca1f062@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_053423_064153_4F5637A2 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Palmer Dabbelt <palmer@dabbelt.com>, Han Gao <rabenda.cn@gmail.com>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 17, 2025 at 08:03:08PM +0800, Vivian Wang wrote:
> Hi,
> 
> I would like to request backport of these two commits to 6.6.y:
> 
> b5b4287accd702f562a49a60b10dbfaf7d40270f ("riscv: mm: Use hint address in mmap if available")
> 2116988d5372aec51f8c4fb85bf8e305ecda47a0 ("riscv: mm: Do not restrict mmap address based on hint")
> 
> Together, they amount to disabling arch_get_mmap_end and
> arch_get_mmap_base for riscv.
> 
> I would like to note that the first patch conflicts with commit
> 724103429a2d ("riscv: mm: Fixup compat arch_get_mmap_end") in the stable
> linux-6.6.y branch. STACK_TOP_MAX should end up as TASK_SIZE, *not*
> TASK_SIZE_64.

Please submit a backported set of patches that you have properly fixed
up and tested to ensure that we get the backport correct, and we will be
glad to take them.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
