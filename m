Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A642C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 07:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382FA20863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 07:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6eJw1bh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="LYcxUCWN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382FA20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9L7SWWbMn86UApUcWHvTXCewxrO9agsx+y7m3uiP6+I=; b=Q6eJw1bhWZv+TM
	myJ+BygJW0UG7SrFpR5h7CK2fe5FFwFIQ+TJTZaKUGQ8seH68nLNU0ySovxwYXhoURo2nl1Xy30pH
	TzPuYHJkz7zPqkcx0M0eOxqFWCUln/8HPVkeD/rrCpt2dBJ/qxfootoqyCKwC1ebs/SXDNSyMB4dZ
	J6cIJTG6EgxMzSeNCDUZ7CJjaxy7eRisvyWEvwsqG1yKfmbur3bfoq36zsXOJ5VlH8IKo/q0e+V5o
	i5DT3lXMOkvBUCNe2CfljLmJBjdfABv/K0EIcKo6f83u4rWPdWJ7ztNeBAi+hJuWAzftGYOmddYOi
	VNnowrUJtpiHRHklT5iA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JcV-0006u1-4o; Mon, 25 Mar 2019 07:02:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JcP-0006t5-IW
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 07:02:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so7627936wmf.1
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvnJRariGhCONlRkbXzdF6w8C5rUCgeKPJ0uWv2M9Us=;
 b=LYcxUCWN8lPhtX8z9/qSmsIAUJgGbIW0MtmpLmAxpuELSkMFJkCs1poGCedAZpt+sk
 coWZo/PoxNoZd7Ztu2/NgRfWqIN02d95xLNCri2ZuWVFHTUNhI0n7jKUZh/WBTJRFz5Z
 L1JOxmsqvnFPTKGkqDZ20PN2UUYVMNaFmTyi2EhTgWJ+GKPIJWHnmSCNmC1pQutj7FAS
 M08cqXenzQSW8eU5E0+VNi7bvsOdzeZeNGHk2dRkVq0NBjjv6wUsFJB2XUn6TS2szisb
 01zeGln5gOd5dOUmks3Y/jqZ7fFbo1Sa/utYBfYrs2eJm2RkJQVLT2DDbcswuoSBh4q6
 Y/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvnJRariGhCONlRkbXzdF6w8C5rUCgeKPJ0uWv2M9Us=;
 b=Sh0xYbbLZ/+M9L0/e/5UVEnooOw3UpjFKC4IXXOyK2q2MizWFR8KSvZ4HJ5Mkd+RB8
 MIBG9kg+Lwlw2uFkWYagJC8z4YgzEdafw7q7QNz0Pjw5Xu8kQciMkeHbqOWUDPbC4D3+
 Sa4IOmUSja4rpW3nLo3o1T9AE8XENcRa5grIpHf7v5s2hgoErc/Q1uc8SQLonhQDIPGE
 5zOdSPsWFSVTGHwQvMvPOzHfZu6yZ0msLA7Ff++WrjDkWn/AHv/Nixe1/nduG7/fUbkP
 smVsTwqOSqFtTnFW2FASz42ncXek5v98VEbN4qw4z3nCu5bjvjTXbAElIl6hWR4Lihug
 qPqA==
X-Gm-Message-State: APjAAAXppTZ287cNJx9/mY1PZhOVvlvmu9P66u/dIy+NqT+ZnOpLRh8/
 yj+kiSOAziZJx4BxSrKpe/WLcU5DQlUcZEZbiPFKAw==
X-Google-Smtp-Source: APXvYqxwYXa4uYwkaFCS1hzKyQqYyN8SdJvPQheIEeUZY9/kgIzrQScC3DReQvk7yeRlVezjJR2rpfPG/kZBvvr3Y2k=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr2412100wmg.132.1553497316107; 
 Mon, 25 Mar 2019 00:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190325033648.16171-1-anup.patel@wdc.com>
 <20190325052550.GA30996@andestech.com>
 <20190325064826.GA29111@infradead.org>
In-Reply-To: <20190325064826.GA29111@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2019 12:31:45 +0530
Message-ID: <CAAhSdy2-CX729tVuuZzArswpFEC_OeRXhwXtCaiNe53AuzqdTw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Always compile mm/init.c with cmodel=medany
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_000201_608459_701AEE2F 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 12:18 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Mar 25, 2019 at 01:25:50PM +0800, Alan Kao wrote:
> > Hi Anup,
> >
> > Sorry for being late to the party.  I think one more thing should
> > move together with setup_vm():
>
> Ah, I wonded about that yesterday but wasn't sure.  Maybe notrace
> is a little cleaner?  Either way we should probably document both
> the mcmodel and notrace assumptions in source comments for the next
> person touching this code.

The setup_vm() should be allowed to call other functions within mm/init.c
so let's go with file-level notrace (just like how it was done) for
kernel/setup.c

I certainly add comments for setup_vm() based on all our findings so far.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
