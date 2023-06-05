Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93851C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 04:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n49SWFHFxF9123Dk56ZmhKbnLXT0uUHIAypPAYnu0Rc=; b=LNUgYY141iF/3s
	eTeeOwtNkZV0ybG1KTU/bJOswsc8lUyA2OBX3sB3Icjy0Cy+BZl/XCVEsBM/5LzA66g4U63XVswno
	0rviaNZXo6wh2Pp5B4tbb+7ozhqZFFwHPIjLiEiAi3y3itxjBf5SkYiY5JZqh7eS4yVCxRnc/sGnf
	nEUgnrjqk8ZUiroyqM6LsjbqgWHJVy5vjiIHiB3lzYKK4l3ClYId8RbKle2BAeJzVvc2Sx2y6KToJ
	vviEQYPy/VPfDur8y33yAuTlpP4o1nPTitWKYHHCLnMwhBJ9b5+qtKXh7DSlatYiM31mInR2rRu1V
	f9uKIjiWyxX5iI+nsvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61kQ-00E4ak-2q;
	Mon, 05 Jun 2023 04:23:14 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61kO-00E4aL-0f
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 04:23:13 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3554N89w005468;
	Mon, 5 Jun 2023 06:23:08 +0200
Date: Mon, 5 Jun 2023 06:23:08 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH 4/4] selftests/nolibc: fix up test-report for run target
Message-ID: <ZH1jLDX4tqf7Roo/@1wt.eu>
References: <cover.1685936428.git.falcon@tinylab.org>
 <48a994c40ac739a0e20ed7a34f290637e417bb0b.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48a994c40ac739a0e20ed7a34f290637e417bb0b.1685936428.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_212312_707903_E71E2B44 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 05, 2023 at 11:58:56AM +0800, Zhangjin Wu wrote:
> There is a '\r' at the end of every log line when run nolibc-test on
> qemu-system (make run), add support for this case, otherwise, the test
> result will like this:
> 
>     0 test(s) passed, 0 skipped, 0 failed.

Argh, sorry for this one! Note that as a general rule, this should have
been the first patch of the series (fixes first so that they can be
squashed into a pending series or backported when already merged).

I'll remerge it into the series for now.

Thank you!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
