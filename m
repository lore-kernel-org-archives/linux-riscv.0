Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6668EC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D252063A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Axam9JIa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgauLvK2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D252063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Od3DGLeh6NPJVt+AARFmYSGoRV3mgkfGBiqb0AtUzOs=; b=Axam9JIaUlvr8MhfLAFlv1A32
	4Abn988ITGz2nQ0p+76uZYtYBpy9X2gcBAkstF/j6aYFFRvx7cnEpRA3jlBeeTlUPHFAhpwnPRkrs
	iZYy8mEASzdeqJeRjY9XHJ1Ij1tkvXFO7w1HGi8Z7+LqzKRNvDb3U4Hzfe2rFuPuGFTdqPPoqMoVl
	LQ/RZ6W8kjNZ1xRfon+/6eqE2tF4s+RgG2qep+0lQgIbtEsWRlmjsSC8GfSkRXW4K8v7kOdsCBZJ1
	ixmK5liatveccBsQjaNksPJ9TS+H/sJOecVuTpOOPfMlASWqRUd/nNVNtPTYq1r7mMW/4jEqfTCPy
	Mi6iW6GJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDd2-0002M7-8O; Thu, 16 Jul 2020 23:49:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDd0-0002LP-DA
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 23:49:27 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71DFC204EC;
 Thu, 16 Jul 2020 23:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943364;
 bh=uaPx3NHnlak2s8/Bw+uGgnUTIdfrCFx1I8qftHQtHq4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fgauLvK2grUIhQBTb8Kt72Cvi9foLQMtrzTNppPRjRLgEqf5/zk4D8Hd4ov/rUrea
 SJKe2ZtuyRZuq0sAAz10PvHkNRjbm0BeGGA2GXk1/Gl0G9JkOK5n3PHZ4Je2jlrvHs
 sft8edVKvC9SHbZQbOORP7He9vfhSNpTqREj5yfM=
Date: Thu, 16 Jul 2020 16:49:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: clean up address limit helpers v2
Message-Id: <20200716164924.15e373f4dbb3071e9d4ee37c@linux-foundation.org>
In-Reply-To: <20200714105505.935079-1-hch@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_194926_534723_BDD33FD7 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jul 2020 12:54:59 +0200 Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> in preparation for eventually phasing out direct use of set_fs(), this
> series removes the segment_eq() arch helper that is only used to
> implement or duplicate the uaccess_kernel() API, and then adds
> descriptive helpers to force the kernel address limit.
> 
> 
> Changes since v1:
>  - drop to incorrect hunks
>  - fix a commit log typo

I think this *is* v1.  I can't find any differences in the patches and I
was unable to eyeball any changelog alterations?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
