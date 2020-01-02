Return-Path: <SRS0=K0nT=2X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B81C2D0DC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 14:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E40F20848
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 14:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfMRRTwh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E40F20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38tSL+GilK9E+jIx6+1lCyIZqCHGIcu0LXmzCOUvegQ=; b=PfMRRTwh0y49Nu
	XFbup+nhQ4umBBnmU3xJmvU/LzLCV+xYOrT/IzN26WpGDin6/UEipgjCHjoCzNWQaN8hc5HVWfDKB
	u8kd15x1cuN9Uu7UbQ3StF1wEmcOyPL4S13WnUFWdsG1p0cHTKVImP9yrUWIr+UyC1TKhDTGsOoHY
	IgEtPfHYVzmKLHg8NZ3kMEit0Y0m0zbn1wr7d6ztXJYzZRxIYSzKOfM5zzp66P18C+4VRqI4jtJO4
	CxaTVSeKDIfx37kLt28KI3iIPAhZV/llHipRrfmGWcqMWR074vftZDPlnMf9iJcf2rbtcBN2hPq8O
	a3G6G2LoB47AWwyJ0z4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in1wf-0003a6-2S; Thu, 02 Jan 2020 14:59:29 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in1wc-0003ZP-MP
 for linux-riscv@lists.infradead.org; Thu, 02 Jan 2020 14:59:27 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8E2DF9A0;
 Thu,  2 Jan 2020 14:59:23 +0000 (UTC)
Date: Thu, 2 Jan 2020 07:59:22 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] riscv: gcov: enable gcov for RISC-V
Message-ID: <20200102075922.301cf1ec@lwn.net>
In-Reply-To: <CAAhSdy0NW9OTGOGoyZ7QmAOVbR_iF2ZM7b9eKDW0U1L+as-oaA@mail.gmail.com>
References: <20200102030954.41225-1-zong.li@sifive.com>
 <CAAhSdy0NW9OTGOGoyZ7QmAOVbR_iF2ZM7b9eKDW0U1L+as-oaA@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_065926_735671_11355CF6 
X-CRM114-Status: UNSURE (   6.02  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jan 2020 09:07:12 +0530
Anup Patel <anup@brainfault.org> wrote:

> May be (not 100% sure) split this into two patches so that
> Documentation patch can be taken by Jonathan.

That's fine if you want, but this patch can also easily go together
through the risc-v tree.

Acked-by: Jonathan Corbet <corbet@lwn.net>

jon

