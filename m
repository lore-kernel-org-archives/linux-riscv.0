Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3946AC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:16:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D513820644
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 07:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WshmFm6K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UoMDKdE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D513820644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VvGvu5gRV3lFJSeLq+OiEP5LMX3Qldn1kcVqQvI4vZY=; b=WshmFm6KulaR6KzVderTX5dwj
	ELTnz50VKyNMhcRYUV/eWS0TJDZ3uwSXkmXekvy0nFDkr72PAO7zZbz+9025HQLuSTU/xCmW+Fa0a
	34Mj4Wv7dXDvGuTfdJkw3NdiQQiuhBzHp35fZ/+dVfhdObMGeBKAJr2YPe2QK9qx2WFqY5zMFHsd3
	KnuNFB5F7UYX4HP0tjR1scZpMeWfu7i7btYa3xOJSJIaJjg1ZUAoFMlYWjyNhouJK3BGYQJtfl0hx
	I3LE60SQ46wCq2fyY+okP/MbP/ZZ+TUXgGrt87Dxqb7aDN39OWGR0m6h63n58raGC+mG88+wCKNSk
	wppiCF8tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKjb-00077P-Hz; Mon, 05 Oct 2020 07:16:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKjZ-000778-LI
 for linux-riscv@merlin.infradead.org; Mon, 05 Oct 2020 07:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4pRfIBoFn6hHSzgiN2brmNHTigG7lI3F4/ydGWaV9vI=; b=UoMDKdE05ZIMXq/pidYBN6sljx
 /Z/spj4eLaN90pHUkMmU6fp8aqHJ+6CU91mF3sToqKxfMoJP+S6Ckv7ephss6m47yHHuZ/rqd+jxo
 uzlCSMmPxFZIDq0VrcvgSRFykI4l2xLYLnl7nbXM/a9tv3n8wOjlHXicdVof27RDRm5Usg723XP3F
 xNuQoUZqu5ajgfuonejAsz4DOpaQrl4OrgTgOANncDfEKmKXByqkSCAjp3uem/RjtM34ZppbqMcXg
 io2U6PcmfaSlGfWxihxBcNW309xZ3/WlAVJr6SJVxHfFxCu/AdCHH7Nj3H0SLTbq0SptK7HO1Ka5N
 oX50Ml2Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kPKjY-0003w6-FV; Mon, 05 Oct 2020 07:16:32 +0000
Date: Mon, 5 Oct 2020 08:16:32 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9
Message-ID: <20201005071632.GA14204@infradead.org>
References: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-c32d6fbf-32dd-45ed-90f1-ffbb7e455aaa@palmerdabbelt-glaptop1>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 02, 2020 at 09:07:27AM -0700, Palmer Dabbelt wrote:
> * The addition of a symbol export for clint_time_val, which has been inlined
>   into some timex functions and can be used by drivers.

Err, haven't we just agreed on that this is a bad idea and jitterentropy
should not call get_cycles()?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
