Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E2EC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 18:53:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F0E22B40
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 18:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tv5mUl9C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F0E22B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=azFSPyFlDHQUOOqLSKqq84WMTiO8m6lwFurVQDv/TTU=; b=Tv5mUl9CCDAeUD8cqMt5FzObi
	9468I5TydEDJrB/+kjeBoP79sz0Ed5+HKEpEtx4H3Ew4zBOVC9Q6l8e0JBO4zb12TWvymIZSITMLU
	SMESQzpCovbRDizRcD90i+enYtsZj+5mxWfQPrVf7IZdSEiWdfSUI3vzLFvhH+xSS1XmUDPTEdOUv
	1vAMn8ZmN9kLvT03kb2EPdedBI1Q9PtVh4ywOr8wPsIsblXTf64kRUnt3aKczaPHGsGg1YA6YpOzj
	n962i1XeOy9GblxOAgshBS8tIZu889AeiCeYGl68gijYANILRg0Yj6CYh/160cCeUY2GGc3C9cSJW
	242OnOCTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB0Y9-0007eu-57; Wed, 26 Aug 2020 18:53:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB0Y6-0007eY-N7
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 18:53:31 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A8DA2078A;
 Wed, 26 Aug 2020 18:53:29 +0000 (UTC)
Date: Wed, 26 Aug 2020 14:53:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
Message-ID: <20200826145327.7530b2e5@oasis.local.home>
In-Reply-To: <mhng-5de4c6ca-7e77-4b55-9097-59296872e6de@palmerdabbelt-glaptop1>
References: <20200813113743.001b6c31@oasis.local.home>
 <mhng-5de4c6ca-7e77-4b55-9097-59296872e6de@palmerdabbelt-glaptop1>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_145330_844692_FDEAB5F2 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, mingo@redhat.com, guoren@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 17:29:32 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> I pointed out in the patch notes that it seems reasonable to have the generic
> code handle this case, would you be opposed to doing it that way?

For now, lets hold off and see if other archs start to do it the same
way. Then we should look into making it more generic. It's an easy
enough fix per arch, so there's no urgency to this.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
