Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D05CA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aefgb5kwscYfg63kQH1NUvvQTP9Nex3bg/YzzjAKjo0=; b=B8ZCPQ1KLaADd7
	cmUEAQQ05kmvJdyg7CxeoemGNPraphlacIK7iLj53uRTRC+oy6HNm+UWF4QpVAzFdQ+LkviHWj/Cn
	pxXa0HfhcaUZhWTm/Ot9EZPfxi+lMaZApNTJKLzl7QFHViLR08xKwvP7E3LwVi2GxZY+VbfvlzYpY
	GEy3f5pvw0nojbiS3BzRCKhAS2MzeGtfcBzKKAg2eHq3EFSkcXkNwuzJLUBrOwd8mYTHjCq1/bcAJ
	5a32KOAEi2/oZsPqUU5yvkAfVdZ+eLYwBMFtWvlrCVDkc/HPfLH0ZdFKQsLzBWeR476hd5xefl4cw
	KCi2yx8LFoDIIft1Gz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jO-00000008Bys-2fuB;
	Mon, 18 Aug 2025 17:33:14 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Lp-00000007zJK-4ByE
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 16:04:51 +0000
Received: from 8bytes.org (p54921b16.dip0.t-ipconnect.de [84.146.27.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C51AA4DB60;
	Mon, 18 Aug 2025 18:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1755533084;
	bh=+HE8A4JWz4VOW6rcIWSp8fVZhJmOl4vISHIqSSqtBOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECCLMsuxisOpKzJ5tVcq7oXLflbwj4uXblrhPCtJkejg2SyM6AvXBuTiy/LWIObGA
	 B9W8O3uPaVaQkUmjGnwAs/Zd1tfQNf63Z27x4gGooOf1YJqXK9l45hjA+hPhp76eQd
	 +FaNC4LRhYWVXemV397o4NRtKa3jrxcSNCLGeHEHekp7pVSV3/hwPkMPA/h9zfSHaG
	 YX1luiMLzAnELjv4xZc0cft4SWOsFOxsXpud1lA07vLT0QaSSpy6YPqiXPGDFY5IAH
	 E1dJs69JJGd4fbOIzfu2vR3dasCos4I4HrjSg/TYuO6NwfnucS34fsMJPyEZxFxSLL
	 UM9Np4/SjqizQ==
Date: Mon, 18 Aug 2025 18:04:43 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: XianLiang Huang <huangxianliang@lanxincomputing.com>, 
	tjeznach@rivosinc.com, markus.elfring@web.de, will@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iommu/riscv: prevent NULL deref in iova_to_phys
Message-ID: <44osnwyfiiqdqppu4q56bbzy6kl7xxe6mnxaujviydvm6tlutg@r5jujxv3pksp>
References: <20250815071244.13982-1-huangxianliang@lanxincomputing.com>
 <aJ8FbvCJEOj2XjT-@8bytes.org>
 <e87aa091-5c02-4cd6-9636-0cb6c0015768@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e87aa091-5c02-4cd6-9636-0cb6c0015768@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090450_262816_CAB0D4EA 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 15, 2025 at 03:43:25PM +0100, Robin Murphy wrote:
> It's a valid PA on many systems of many architectures, but it's also been
> the "not mapped/error" value for the iova_to_phys operation all the way back
> to the very very first intel_iommu_iova_to_pfn() nearly 17 years ago, so hey
> :)

Right, the sins of the past finally haunt me ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
