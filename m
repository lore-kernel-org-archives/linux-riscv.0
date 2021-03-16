Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B751EC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:40:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5029B65067
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 03:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5029B65067
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nEWqD85EkH6gZlp/j7EDM+YsQu527Sg8iU557ennnQg=; b=arZcEYnhdQ6JK3Jf3VZ38TGxk
	NzMl7cPyuHbzR5497kTllbMR9g4a74SyTMw2jCFbofZalGcy+InilvE1BY3F/SVbEyVFVRbOsXgt7
	QhFxhtJUoCW3S89eYD8SCPv86uSn4hkddVCeIswzsDF8AFKgrHepE4HEjfQDSn/lNuwFjRXivUUEX
	zCvemLE0oEsCzRNQLNKpp3hKGCX4HhD7ioZFy+U24Z585FamkamBBngMklYLG6IobQ7l4TNk0rOFc
	Np6hS3C0q5LJWFuXAT4nIlJf+TCt8iYPzS8s7ZKSfa7QiK1DU8J/ufhttHlKeYcZssf9184iqV7mH
	4oIO/1PQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM0ZP-00HL5b-P9; Tue, 16 Mar 2021 03:40:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM0ZL-00HL4y-Jt
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 03:40:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53A2665032;
 Tue, 16 Mar 2021 03:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1615866030;
 bh=pretoMF6po1nk+NT7gyGXA9S55q+uku6w7yTwK1xf/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NZFnMQVNMSSz4RpJGtu9JUW2ZFeOXIMcZQ98XCWklJ2eQ/694pFYwTFNMJPA/gYjW
 jbHWX4gvnpG5K8ws46OobpFAj/C/rm2KpNsol2xGW2fU2gjooZrJ888EgpoxLm4MVF
 7iby38hREiCId8Hhr19WHWO+aEONv/lf6nz/Yoq0=
Date: Mon, 15 Mar 2021 20:40:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yixun Lan <yixun.lan@gmail.com>
Cc: Jiuyang Liu <liu@jiuyang.me>, Andrew Waterman
 <waterman@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, Kefeng
 Wang <wangkefeng.wang@huawei.com>, Mike Rapoport <rppt@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Bug Fix for last patch
Message-Id: <20210315204028.95e8879c70581a3a7bee6a5d@linux-foundation.org>
In-Reply-To: <CALecT5iDxuzRPvPg8w=WmLT9XtWxOieDN=iRoY0nAdyhdLV+SQ@mail.gmail.com>
References: <20210310062250.74583-1-liu@jiuyang.me>
 <20210316015328.13516-1-liu@jiuyang.me>
 <CALecT5iDxuzRPvPg8w=WmLT9XtWxOieDN=iRoY0nAdyhdLV+SQ@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_034031_929975_2EE8751D 
X-CRM114-Status: UNSURE (   8.08  )
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

On Tue, 16 Mar 2021 03:15:05 +0000 Yixun Lan <yixun.lan@gmail.com> wrote:

> This patch title is  too obscure to parse, it should clearly reflect
> what's the changes doing here

Yes please ;)  Otherwise Andrew has to madly grep around to try to figure out
what was Jiuyang Liu's "last patch"!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
