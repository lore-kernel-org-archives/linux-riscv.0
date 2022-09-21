Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4DFC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYj0qgwfhpCG15NBJAbUb/R10JKjDclb2L8k3055eYg=; b=HanwuQ9Qck7Nr4
	iX5lzHVET5kyCXQhnPO46dyNadX6b60Gtut1V3Nj9I7IpRj79UK2wxIqnL8eMST4gQHaY7sryiALr
	QWI5+29X3PuqZi9xJGwntYpDSxpir5EPvIFRAR14eOA9YT91qEr0+AA5xNvE/NjoSFdV2ibt63tsr
	/P0r1xJuwLypwaydqY8ja/W0GYp+yCFloVK5tGRpt9SSZWUoP85EQohTHH6KFAhrNEc6NoXSnE4EP
	Xvu4Nh9CVIrAryrthS8A6yjgGnd/nOAsgPPCf+xETKLwpfV5GSdOLQ6lvEomm6q0O23opfrWPAW26
	gvKEVPPsySexes0hPTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob64g-00CYwy-SQ; Wed, 21 Sep 2022 20:12:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob64d-00CYw5-Ez; Wed, 21 Sep 2022 20:12:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38F1062D5A;
	Wed, 21 Sep 2022 20:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA87AC433C1;
	Wed, 21 Sep 2022 20:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663791116;
	bh=cUdle6bEv4HUtGl9+ootVrzU3/gRivJ2OGJiqLKras4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=If6/UkLOqt6dqSnWtlRLgHUoKPPqNws718FWLBkUX1Z8DpPsk1nIsVH9GCEE+sm1e
	 I1a92MKPi+nTtDFKIi3f6QT9aNWMu++Ff/9fbv09ZGDZTmke1pEPtajhhdm6Zkq7gl
	 Q/r2RG0qcrqb6QxbYe96hEwXz7qyEjdh0rsZS7VMq28XLEhslIdpiinQWijTy/tnGS
	 hrTwABEDAkj4Nze6CUpr1sHc2joD1SceJ2PCGuUvV1KNxZ93OACi6CitwRWO3CESq7
	 2C95yumJG0ZoQC7xubief9p+IBwevzZh9s1Wl1FTdR+nMnMO4XJXPmoQAMbZ+uOqGu
	 EJYwFrZqqXQwA==
Date: Wed, 21 Sep 2022 21:11:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Stillson <stillson@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	kvm-riscv@lists.infradead.org, Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <anup@brainfault.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 02/17] riscv: Extending cpufeature.c to detect V-extension
Message-ID: <YytwBzdgCSWSPRNB@spud>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
 <20220921194629.1480202-3-stillson@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220921194629.1480202-3-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_131159_574759_399DC923 
X-CRM114-Status: GOOD (  10.56  )
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

On Wed, Sep 21, 2022 at 12:46:14PM -0700, Chris Stillson wrote:

Hey Chris,

Looks like this only partially made it to the list. The cover letter is
missing as are a bunch of the patches in the middle, see:
https://lore.kernel.org/linux-riscv/20220921194629.1480202-3-stillson@rivosinc.com/T/#t

Also, when you run format-patch to generate the patches, please add the
`-v` flag with a number so that the patchset gets the version number
added to it.

Ohh, and Palmer's non-rivos email looks wrong?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
