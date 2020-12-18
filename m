Return-Path: <SRS0=XAcR=FW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62957C4361B
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 04:04:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA0A20731
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Dec 2020 04:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA0A20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufpg4fKoyQURCcl9INtVcjq5FFkhW8wC4cQgpiYJZ5g=; b=DTpwUCY8EHeA0w2hg4bYjoq6mD
	vTQ0gm9mXTIv553UnTSeM+ZP5LVz8EwRBSoPYkrDO3+/wt+3ha49tjxYelZQpUVszNrYooaxMk6oE
	l5LNa2MsA+2lJ9ps8adAjfIlLfZbsUc4GOoPHfFmVyeounBQRSnZ9nuCQwfhUdLeLRZq9aiGPxP1H
	T4QRQyfsFk/W0lhDRv0HMEefsHgjqTvZmzms6t1JFHC7qTLrvGVhtV4QWPz50QLQA9/i77mZFtXdg
	ZUKewbJvoVpRgXKzya8wjzmOAtua0ITgTLqLMns3UHMLq9zQQRk5w4sC3tmjf8D51JTUeMtz6LdPf
	SNtXTceA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq70Y-0001K3-3N; Fri, 18 Dec 2020 04:04:46 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq70Q-0001JX-ST
 for linux-riscv@lists.infradead.org; Fri, 18 Dec 2020 04:04:44 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0BI435ji091560;
 Fri, 18 Dec 2020 12:03:05 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88 (10.0.15.120) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Dec 2020 12:03:53 +0800
Date: Fri, 18 Dec 2020 12:03:49 +0800
From: Eric Lin <tesheng@andestech.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "penberg@kernel.org" <penberg@kernel.org>, "aou@eecs.berkeley.edu"
 <aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 0/2] Let illegal access to user-space memory die
Message-ID: <20201218040349.GA13987@atcfdc88>
References: <20201204054259.32684-1-tesheng@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204054259.32684-1-tesheng@andestech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0BI435ji091560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_230439_327859_814BF0CC 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 04, 2020 at 01:42:57PM +0800, Eric Te-Sheng Lin(?L?w??) wrote:
> Accesses to user-space memory without calling uaccess routine
> leads to hanging in page fault handler. Like arm64, we let it
> die earlier in page fault handler.

Hi Palmer, kindly ping.

Thanks.
> 
> Changes in v3:
> 	-Let no_context() use die_kernel_fault() helper
> 
> Changes in v2:
>     -Add a die_kernel_fault() helper
>     -Split one long line code into two
> 
> Eric Lin (2):
>   riscv/mm: Introduce a die_kernel_fault() helper function
>   riscv/mm: Prevent kernel module to access user memory without uaccess
>     routines
> 
>  arch/riscv/mm/fault.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> -- 
> 2.17.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
