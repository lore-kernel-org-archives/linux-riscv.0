Return-Path: <SRS0=TVEx=RE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFA0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 01:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892A32087E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 01:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJCaOo62";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="WUrm563x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892A32087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ua77aUYerdRrxWhizn8dMAcNShUIC0quyR3UaMEJ8rg=; b=KJCaOo62yPHzEu
	q5dKVFc+GX3Q7gLUbu4YU0jpGsbP2yZ7D4jeYBJ9ItHgLfmc4fkhzISY5iS5M2RDLDV6ByOzzApSO
	CEMbP+2KCF5zqp+r69FDh2Tr/UeWoccdJjYMoZQnby0ZWpnjaUPXk91K0Ls+1F/A3TrCIYVo49VhY
	sjRgP3j6410jng0areWmevx1Yyqqf/AUSGR/Pwkb2M25iZf7HjR0OByooY4lBqMN58ZZYRIwohWIY
	3x5fhwz1wEEKKRDTVMKk6ixkDz55JEeEgVuS3lE46CYamj9nNrsinBp/pdvvO94UwXhi7XQX66Yzc
	QSBDMu5GRfIY/u4ZW+Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzWk4-0004x4-64; Fri, 01 Mar 2019 01:13:36 +0000
Received: from a9-36.smtp-out.amazonses.com ([54.240.9.36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzWjz-0004wQ-4q
 for linux-riscv@lists.infradead.org; Fri, 01 Mar 2019 01:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1551402806;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=hJL8v9gm/2xFmTx8jsZJR0ScRjK5kb0kH0gHqagBk0Y=;
 b=WUrm563xjfKxrZp8rV3tyasIUd82jD0QF1eLZkJbVIr2nnM+zc7JonlP/gpsTwzm
 6y8ixJBBV9fGRJsLEUn7Jp+ytmy78M7pUvpp7JxLlQqndNnMlV9DgmXQx3C5u5kfVca
 sd37AhTF8uxQ2XfQLmEFwvIznRkIQzih6RUqtvRo=
Date: Fri, 1 Mar 2019 01:13:26 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1902281217250.17965@viisi.sifive.com>
Message-ID: <0100016936d02cf1-2a096483-1c87-4889-879a-9eb2f4f1e77c-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
 <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902281034390.10196@viisi.sifive.com>
 <0100016935831a0a-8ad31ea0-9ab5-44e7-8aae-ac8cb2491c72-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902281217250.17965@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.03.01-54.240.9.36
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_171331_275235_54F38E8B 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Feb 2019, Paul Walmsley wrote:

> Is the offset of the counter from the start of my per-cpu area guaranteed
> to be the same across all CPUs?  If so, wouldn't there simply be a

Yes of course otherwise it would work. The per cpu area is replicated
across all processors on bootup.

> potential performance risk if preemption was left enabled, rather than a
> correctness risk?

An unlocked RMW write operation can corrupt data because it may race with
another unlocked RMW write operation on another processor. Writesto the
per cpu data must always occur from the processor that owns the area.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
