Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF43AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 19:09:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A174020C01
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 19:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wew9ni8R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="B/osWkqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A174020C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVuGSGRkJxb1GWSEChNQJ1wbp2V+WbZG59sGW4jizNc=; b=Wew9ni8RBghFWz
	Jy2U2YXwTBfqVE4zoiCLRK25w7Z9l0NJs0xfyEc0fDVuSySGUcBF9/k049j4vqvnF12TLR1QbpUXK
	2hRKUCqrCgKp7GNvKbXM3ixWUTJmVxnyfcT22bxHwHJU/VD+VQySNYQh+aRqubRZNcZfhzEK0xHEX
	bFspRFg5i2UHTblvymGOIH4q74OGaooPQoRB3VLpSrhiuKsn7wKHs65RYMVw0aQ3TwpDhU1F/7Rao
	/G8ZRQ0bIepXnQ+neXj/FSgLpRQRv2blUubvlM8DrclDJz/tXP5CMOhBY9Cm+Z6oG1OZigH3Srjx/
	4QiL3rKmbVbkzakBqyvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzR3w-0008Bj-Dw; Thu, 28 Feb 2019 19:09:44 +0000
Received: from a9-36.smtp-out.amazonses.com ([54.240.9.36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzR3t-0008BP-Li
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 19:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ug7nbtf4gccmlpwj322ax3p6ow6yfsug; d=amazonses.com; t=1551380978;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Content-ID:Feedback-ID;
 bh=D+pXoNnkID2YLkdYGTz0NhQZuycI42A/9iFVnluS51U=;
 b=B/osWkqwUqBiRPtwyaCrT8oC6RS5eU57VMOO2oa5qJDogVmhdfyLglmnNg5jVSEC
 3Pv/nizzC32Uk8tj0oG3AEKbWzz63wpTChC1IGVUb3syGbHXs08DGbARmzU174qXUeS
 /VjO8rFAlwf6SQ46oesnL0lCPWV+UtEGOiydNQq0=
Date: Thu, 28 Feb 2019 19:09:38 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <alpine.DEB.2.21.9999.1902281034390.10196@viisi.sifive.com>
Message-ID: <0100016935831a0a-8ad31ea0-9ab5-44e7-8aae-ac8cb2491c72-000000@email.amazonses.com>
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902280418110.10847@viisi.sifive.com>
 <0100016935426418-5eaf2d86-8a0f-4c1f-91b7-b4d872d6ba48-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1902281034390.10196@viisi.sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.1902281303162.3005@nuc-kabylake>
X-SES-Outgoing: 2019.02.28-54.240.9.36
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_110941_784254_5696F163 
X-CRM114-Status: UNSURE (   7.70  )
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

> This is the AMO-based sequence that Palmer wrote in his E-mail:
>
>    li t0, 1
>    la t1, counter
>    amoadd.w zero, t0, 0(t1)
>
> The RMW takes place in the amoadd, and executes atomically from the point
> of view of all cores in the cache coherency domain.
>
> Or am I misunderstanding you?

Yes Palmers example missed having the address of the per cpu space
somewhere in a register (lets call it "tPerCpu"). Then you can do

	li t0, 1
	la t1, offset of counter in percpu area
	amoadd.w zero,t0, 0(t1 + tPerCpu)

But as far as we know we do not have an amoadd that can do this. If you
add the percpu space address earlier:

	li t0, 1
	la t1, offset of counter in percpu area
	add t1, t1, tPerCPu
	amoadd.w zero, t0, 0(t1)

then you have the dnager of the amoadd being done on the wrong per cpu
address because the scheduler may move the execution thread to a different
processor betweeen the "add" and the amoadd.

If you do it without the amoadd with just lc/sc then there more potential
issues exist.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
