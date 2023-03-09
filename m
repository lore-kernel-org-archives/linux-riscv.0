Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C82FC64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QF+pVfGlMtBRhq3nSOzW17TUhfWSAY/vLzEEkc9gx1M=; b=Pp786fmGLoyuxd
	QAvjDhXkVH0Z+Olz3Fhm1XHkstEkte4MLWDtbIPuVVi0CgOAwEYA7wghnHlSTMwDLB1wSx8GGlgku
	rgcHS/oB/Z1pTEp/7NaRyxCqPTw1ucGg0siytNVGJZPh92iaxK1GI3MTR3991RaQe6MC+D8N3ZTj6
	6iNXgmU8NPUN6GnBS+stCebOlWoFOWvT6TLnMsnlLsxy17mnI13oodTDocvtCQOzqkfglwgYJNG9X
	d2LB/yMHmuBYC48g0pJFP1ayY02tgy8x6Cbi3tu0KoH4H3a6GkK1bY8cykt8XqZe9FZRHznD8iHTe
	V4qbqS0p0rr7ceXoKKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIv4-00BE53-Ua; Thu, 09 Mar 2023 16:15:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIv2-00BE4E-NR
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 16:15:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE875B81FB0;
	Thu,  9 Mar 2023 16:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0031AC433EF;
	Thu,  9 Mar 2023 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678378501;
	bh=HcwHDBfFsKMC1NScBUvgLRXeM273n/hMohRdHJg+Xh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBn4ORoJgJ9/ZDEE2QDPdiUpLhPiB3wJmlLoxIWFeUqajPrUSr+S11Zigs2yTXH96
	 kkTgc+dwJ7CKAesmoXOXwMrbASlFFyuTfSDrlvwyXnsqF/QuP52I3WFxRH+4uBmUWi
	 HrYhjtJs4yCrPkjhHWFvi6esIdYgZGPSUpxPcNjQ=
Date: Thu, 9 Mar 2023 17:14:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-trace-devel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 00/20] MODULE_LICENSE removals, fifth tranche
Message-ID: <ZAoGAj3sRXKYzwc2@kroah.com>
References: <20230228130215.289081-1-nick.alcock@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230228130215.289081-1-nick.alcock@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_081504_946374_3DF49B2F 
X-CRM114-Status: GOOD (  10.54  )
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

On Tue, Feb 28, 2023 at 01:01:55PM +0000, Nick Alcock wrote:
> This series, based on current modules-next, is part of a treewide cleanup
> suggested by Luis Chamberlain, to remove the LICENSE_MODULE usage from
> files/objects that are not tristate.  Due to recent changes to kbuild, these
> uses are now problematic.  See the commit logs for more details.

Why isn't kbuild fixed instead?  These files can have MODULE_AUTHOR()
and other macros when built into the kernel, what is so special about
MODULE_LICENSE() that prevents this from working properly?

There should not be a need to remove these markings in my opinion, why
treat one MODULE_* macro more special than others?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
