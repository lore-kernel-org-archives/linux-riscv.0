Return-Path: <SRS0=Ypxe=YJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A164CECE588
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 07:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E4C21848
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 07:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLZx4qg2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E4C21848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WM+BXgGSWYep/5kTcJulpq2Qo/8O2wdSzJDZi9y57wM=; b=LLZx4qg2P0G7E1
	sUwftgFqV3NQpKz2BSd8Py3M4ke08STjb1/Q8UET9dHUjvyZBo0XMOVDK+Wt2rNG17gaH3ocpuAHU
	v7xvLwlI9CeoQcx/0HbLocjRGORzTCHCcSrAtYY5+XrI/8On88bWOp5xWIIU/eOqK8jRWmNw3ThyL
	N7y7MVDG+BVZZ6BGo9rSjl6jP6CmtVhlD5pBbDlVs8dMAAIURgSzumcg6tp6RqW1kZF4Elqk4RFOI
	bwWmTv/Ft61IAH2/5NfSXhnfRyh5LX3p1IVc+7VsIv6wJMr9z+a7DCyCmLYeH2aBrOANsKndvaKDJ
	zEBMMJDOYtXngzQ/Wc7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKeDj-0005kL-El; Wed, 16 Oct 2019 07:59:47 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKeDg-0005ja-Bb
 for linux-riscv@lists.infradead.org; Wed, 16 Oct 2019 07:59:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 306C9AEA5;
 Wed, 16 Oct 2019 07:59:39 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: greentime.hu@sifive.com
Subject: Re: [PATCH] RISC-V: fix virtual address overlapped in FIXADDR_START
 and VMEMMAP_START
References: <20191016073408.7299-1-greentime.hu@sifive.com>
X-Yow: Oh, I get it!!  ``The BEACH goes on,'' huh, SONNY??
Date: Wed, 16 Oct 2019 09:59:38 +0200
In-Reply-To: <20191016073408.7299-1-greentime.hu@sifive.com> (greentime hu's
 message of "Wed, 16 Oct 2019 15:34:08 +0800")
Message-ID: <mvmv9spdst1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_005944_542862_AE80F923 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@sifive.com, green.hu@gmail.com, paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 16 2019, greentime.hu@sifive.com wrote:

> From: Greentime Hu <greentime.hu@sifive.com>
>
> This patch fixes the virtual address layout in pgtable.h.
> The virtual address of FIXADDR_START and VMEMMAP_START should not be overlapped.
> These addresses will be existed at the same time in Linux kernel that they can't
> be overlapped.

s/be existed/exist/
s/be overlapped/overlap/

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
