Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21DC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qlN3c5Lu/Hq7tuWGNtl8rp1zijFriVmVGeTfYdh6Jk=; b=LpPwYLcmqd55Bt
	8YSSAJksnLZWmyf8cXFrVqzjwWZ00vtoN7rHGvKKvbKgJUX6N9iXDvigwkibB4WDbbmOh+PHMzhjt
	MCqNkZYEfRO0K1MqyC04iLsXtlopCN2nCFYoCTScc+lUUCAqzRFptRX/WWFppdM4kWzS7jI90sWvc
	GyfpAk/ev7HjAByAPmug2YRV6fy3IP19pMgXe3K/TyVW4yipTOcIH0Gv16on8sL55DLvhHJC9nI8+
	yEwr/AZUvHCbD2Mmv6eT6jx7K0LswL9YfKx9gTvgbM9cD9OTs8sanYKQmsdqcmJbp0pW9ffRXDi1t
	ADHhEVpugzxXaPwrbDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavGj-00A26a-Au; Wed, 21 Sep 2022 08:39:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oav2x-009w6f-Bo; Wed, 21 Sep 2022 08:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N+sWBwv5MxF+6L51ydEyB/jrgY323m4Yuf+2/IegXt4=; b=O7cVp4ViyjbDED2MT57s8CArTF
	J7kYu9tRk1fnkzTktLGQXVs586llVSIWhD/yW4lryR7aPAkol4HRjkMiV1t+Nfz9hueTNgekkURIO
	z+yUMSQ4OFaWQ49/SUgLunFG49kuif1zJp57EW1uIukdqKgKpI9GO4fpdunpOPVTBXTrTBQGnwGsf
	9bAE3n5MrZFnNnLHrJSJcljwllDRsasEoah/KhT0pzpT2pyRAq40XdRB+k90yJo5u67lLd/SZYvLE
	ii/M9BMy5W8s49SjqmvD/EfTCTVa7WuFktvF8/eE5sreUcEjbU8lWm+6fGBXDyYtVxJinG5S6czIU
	wYN6zxEA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oav2u-0069Vh-1E; Wed, 21 Sep 2022 08:25:28 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 948DD300074;
	Wed, 21 Sep 2022 10:25:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 775192BB085DD; Wed, 21 Sep 2022 10:25:23 +0200 (CEST)
Date: Wed, 21 Sep 2022 10:25:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: anil.s.keshavamurthy@intel.com, borntraeger@linux.ibm.com,
	catalin.marinas@arm.com, dave.hansen@linux.intel.com,
	gor@linux.ibm.com, guoren@kernel.org, hca@linux.ibm.com,
	hpa@zytor.com, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, mark.rutland@arm.com,
	mhiramat@kernel.org, namit@vmware.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, x86@kernel.org,
	Yipeng Zou <zouyipeng@huawei.com>, chris.zjh@huawei.com,
	liaochang1@huawei.com
Subject: Re: [PATCH 0/2] make weak attributes in {k,u}probes
Message-ID: <YyrKc/tpLllEBH/m@hirez.programming.kicks-ass.net>
References: <20220917015522.44583-1-zouyipeng@huawei.com>
 <1663692878.h3l8c563n8.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1663692878.h3l8c563n8.naveen@linux.ibm.com>
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

On Tue, Sep 20, 2022 at 10:32:46PM +0530, Naveen N. Rao wrote:
> Yipeng Zou wrote:
> > We have some function implementation under some arch does nothing.
> > We can mark it with weak attributes to improve.
> 
> That's not always an improvement. See [1] for an example, among many other
> patches to reduce use of __weak functions in the kernel.

More weak 'fun':

  https://lkml.kernel.org/r/20220419203807.655552918@infradead.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
