Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D21AC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:08:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021CF20842
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fNA0404A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021CF20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u91EmhPwpQ+DANShklZkaJ+BxXFWZFbRf4JE9vcZhKc=; b=fNA0404ANMt2/YMxaFl5yXn+T
	0M/ALQBkSddQ31TnY7I5ASyN7UJ+VrrFP/Akxsnu/jtlAc9KlyBlXWDd7ixsw+kfvqaBN7cIZN6b/
	Eqk7DOFpULdk3GaXu4hSLR7DTHJJbT6sz37WWlhisU+ho3qODjlVXpKC166nX/ZQhz66gEvmluTBj
	62FKeyfl7GDnxVx9Rju7uPgcDEXI1bE/xcQwz2JY2KSHN/7gQ55qEtjqQ/IHd8HCyU4sKYwWOX2AI
	dXgc7pxFj44Xcf15Gb12x+OMcgM3Kb0e6o4ip5sn9xEmdo4tFQsSG3r7QT4oBbMIUD1+EspxjEBcf
	kpESWc0Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38qS-0000tV-7w; Wed, 05 Aug 2020 02:07:56 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38qP-0000t7-83
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:07:54 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k38qH-009WtO-2V; Wed, 05 Aug 2020 02:07:45 +0000
Date: Wed, 5 Aug 2020 03:07:45 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 1/2] riscv: ptrace: Use the correct API for `fcsr' access
Message-ID: <20200805020745.GL1236603@ZenIV.linux.org.uk>
References: <alpine.DEB.2.20.2007232213510.4462@tpp.orcam.me.uk>
 <mhng-611be025-6e03-46a1-8a8a-6f6eeea04f57@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-611be025-6e03-46a1-8a8a-6f6eeea04f57@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_220753_300448_837E759F 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, macro@wdc.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2020 at 07:01:01PM -0700, Palmer Dabbelt wrote:

> > We currently have @start_pos fixed at 0 across all calls, which works as
> > a result of the implementation, in particular because we have no padding
> > between the FP general registers and the FP control and status register,
> > but appears not to have been the intent of the API and is not what other
> > ports do, requiring one to study the copy handlers to understand what is
> > going on here.

start_pos *is* fixed at 0 and it's going to go away, along with the
sodding user_regset_copyout() very shortly.  ->get() is simply a bad API.
See vfs.git#work.regset for replacement.  And ->put() is also going to be
taken out and shot (next cycle, most likely).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
