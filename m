Return-Path: <SRS0=7Vio=DF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4F0C2D0A8
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 15:13:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472DE207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2020 15:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ve2bVSbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472DE207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DYQ92uv/4uK1V8iPOmIYnQ45ZezH6a7E1dzMcLIHs6c=; b=Ve2bVSbNC99FKkG1u0gCwwF9K
	s+oVFdqsiUWPhMEWhg7/8ItYB9GPpAp5pRsigXNj7aF6/zv5Tvr+BSMT2svRhmyDG773voDTFQzii
	8Iji9DDXXjWBdDSiKAHPOOXBufEQTUaOxlDk6YdKy1BPXo47g894N+Jj1Zyg1+9ImOvpX6m3T6OHh
	7QQwfH9pAT1N/locrSYVFNBiJFey2TO3UekPUfA2rHO0foD1xnOU4qcZbixRDbz/wx0/aiKFaI+1r
	ycd3Rrxchcf0wBcigko8hUaSlhnN3zr1s4mGGE8yvBeeu25Rovq7O1mNeo0JIoTLI13PTmItVk/Qv
	vUmlUzQnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMuqZ-0005he-FJ; Mon, 28 Sep 2020 15:13:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMuqX-0005gU-AL
 for linux-riscv@lists.infradead.org; Mon, 28 Sep 2020 15:13:46 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C102207F7;
 Mon, 28 Sep 2020 15:13:43 +0000 (UTC)
Date: Mon, 28 Sep 2020 11:13:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
Message-ID: <20200928111341.7eaa98a8@oasis.local.home>
In-Reply-To: <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
References: <bug-209317-8243@https.bugzilla.kernel.org/>
 <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_111345_429376_6F8A6208 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, bugzilla-daemon@bugzilla.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020 22:02:35 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=209317
> 
> --- Comment #4 from Colin Ian King (colin.king@canonical.com) ---
> Issue still in 5.9-rc6
> 


Atish,

As the issues bisects down to your commit, care to take a look at this.
(And take ownership of this bug)

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
