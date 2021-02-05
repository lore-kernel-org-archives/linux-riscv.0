Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E97C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:58:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C257264F46
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 07:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C257264F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P2+uspMsQNRufuhSOlqSh9YKlZ/uXov8S0/gr1WwtHM=; b=P9iqubJmyNOON74KtO6mtt6Q3
	H67OEjEix1IF0Lr8BBKQNFqUKTtsa1JkBw9u9qPziVe/GBHpUHGu7FQmkH35g+UHWoe63UiVzblGm
	0eM3ZODFzRYrFoOi44xYWW1qvuHnXEU84dO+jGmbnS9DcYVAFFwqP8017pZzZEWW0zf9gf3+H/JVK
	QGTWSE0wU2clS9XNReXsNRRnZqT6Hv85HeJesH7O0OKC2QGp8aHSSUDd2hGUtJnnttGxS7pUQACnm
	v2Cl/hip713JkeOPLSnJIQEMgrFLVVciJaYQX4afKuZ4iG978oHFFs1/fToXJoDFbnG8tNuyLIHsR
	zlvQ8IpyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7w02-0001Lg-Ng; Fri, 05 Feb 2021 07:57:54 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7vzz-0001LG-MZ
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 07:57:52 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4DX77Z6d1LzvjhV; Fri,  5 Feb 2021 08:57:46 +0100 (CET)
Date: Fri, 5 Feb 2021 08:57:46 +0100
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] selftests/vDSO: fix ABI selftest on riscv
Message-ID: <20210205075745.jlf3vsjkp3n3rwss@distanz.ch>
References: <20210204145042.7345-1-tklauser@distanz.ch>
 <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_025751_889540_B9384F82 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, shuah@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2021-02-05 at 08:06:37 +0100, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Thu, 04 Feb 2021 06:50:42 PST (-0800), tklauser@distanz.ch wrote:

[...]

> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thank you!

> Not sure if you want this through the RISC-V tree, so I'm leaving it out for
> now and assuming it'll go through a kselftest tree.

Either way is fine for me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
