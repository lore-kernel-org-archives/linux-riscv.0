Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B222CD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBChotPdZDTISD18/XI/UWJvYr6UcisBrppThMf6loc=; b=XXkBzd6hTwk0Qr
	nIjdYnabi2yCkG6H904GkBnK/DAr+TkRaewgN+eAqRFbpih7sW5joz5KrSj5gpEEAQ4rNvNoBfFCv
	qdjjTQX2niBBC0qLyEuVCfIBMdK9WDhDqB6dSjW5pWy00iTb/8bJ4/awUQHEtCJZ2PUpFY0fIyIDD
	jyBG4OOCEpRSY96CneyoOivCI2xUXo3t0TJPSaAXg+Gr/vxHa8BaRVl2qPnrexmKZSXdQZA98tYl4
	i2e0ZDZAuo9XB9NjalYFhPaEhMgTJxiaMTseWX/HwZNxUbbOGEmxFdPhgt/0kdVtLJsAH5Lt+Heez
	Me6C8RauoS70EV/qeiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULVm-0000000Cg6R-1Wjr;
	Tue, 02 Jun 2026 09:34:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULVj-0000000Cg5R-47jK;
	Tue, 02 Jun 2026 09:34:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 557536001A;
	Tue,  2 Jun 2026 09:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDA81F00893;
	Tue,  2 Jun 2026 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780392851;
	bh=0PgKu/MhXV92fdaOPawC1vOXdcv4sVC0hsvmah/4e8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KH5cT3/d1fW7mKTPUXP2hJf3hqjzw8svhzdezKnm8uDo4NbITku1tcc4lgSDjgCnQ
	 LzoUKYJhDN2BgKJZVqXrTz9wXYbOVdWAntoJqPrxf4WCHj/PeYLX9uMDR7+GZolZr5
	 68FAvxXuuSkAlZZ5ixjIEQEXa/aiyQmCfunPFE2j+qmVfSBZl0YJC8GFWOwYBNsFHg
	 FIsTovKWHP0jaHKp91YmXvpwbu27upGLBcRgjel2izDC/4xZY4FGhFLHlDig1d8Ibf
	 ipIx7HBOjEWNbarMhA7Z8LcEl9VRxhvrmOho3XVlzdpNJGdgt2fiEYoNBjjc9/8g4j
	 BjoxvWi8ygLNQ==
Date: Tue, 2 Jun 2026 12:34:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Will Deacon <will@kernel.org>, Wandun Chen <chenwandun1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	iommu@lists.linux.dev, zhaomeijing@lixiang.com,
	catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, m.szyprowski@samsung.com,
	robin.murphy@arm.com, quic_obabatun@quicinc.com
Subject: Re: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Message-ID: <ah6jiWwwC6DDSJXd@kernel.org>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-10-chenwandun1@gmail.com>
 <ahmr-UjoApj2j5JS@willie-the-truck>
 <ahsPcv8G1BR9rLah@kernel.org>
 <ah0R8pEIyuk4N2Is@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah0R8pEIyuk4N2Is@MiWiFi-R3L-srv>
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

Hi Baoquan,

On Mon, Jun 01, 2026 at 01:00:34PM +0800, Baoquan He wrote:
> On 05/30/26 at 07:25pm, Mike Rapoport wrote:
> > On Fri, May 29, 2026 at 04:08:41PM +0100, Will Deacon wrote:
> > > On Wed, May 27, 2026 at 11:29:15AM +0800, Wandun Chen wrote:
> ...snip...
> > There are patches that move common code to kernel/crash_core.c:
> > 
> > https://lore.kernel.org/all/20260525084932.934910-1-ruanjinjie@huawei.com
> >  
> > Review from arch maintainers would be helpful there ;-)
> 
> Before, Andrew would put patch candidates into his mm tree and trigger
> testing. If any adjustment, he would take them off. Can we do the
> similar thing for kexec/kdump patches, unless the patches are objected
> explicitly?

Yes, we can add patches that look reasonable and expose them in -next.
Now is too late in the release cycle, let's start with it after -rc1.
 
> Thanks
> Baoquan

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
