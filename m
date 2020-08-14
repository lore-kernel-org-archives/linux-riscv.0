Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDCCC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:23:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 888D320768
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C96FZZUY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 888D320768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x/WUwgSda3sD8jPCypvZs3B9u1A9ynX9GFMerf2pxRs=; b=C96FZZUY+WjdOmW1HG7insVwC
	zJyjLDgqEMlmeiMiNFDLcmN4LxH7dTkvMIr4mxkoGaSZwlPDP8kJn2kowZAbEhcs3ktGflsGiMEDC
	Qt6VhiiiDy54WQqfRH5GiEFY94xkRZQE0o3lLqRi2N6fCZ2YXjuQlLlXtVKICorOJaChVs/yU646R
	64AmuWRF4vj7jOwKwVUK8O7CSMN5iLmyghII/ByRi8iPzagipOLfhjWw6Xry57HykvJs5Lp3t4UKG
	ui+NJSJmWAkaYrqBdAd8RDtbq9dXQm/v8nFcO2KpjgZ/1mp2Z9jhlSKrjY1O7rWuiK5g5teBxpzap
	e5sD1yZrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6j2C-00066u-8m; Fri, 14 Aug 2020 23:22:52 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6j29-00065t-7A
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 23:22:50 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BSzxd5hZLzvjdq; Sat, 15 Aug 2020 01:22:45 +0200 (CEST)
Date: Sat, 15 Aug 2020 01:22:45 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH]  Documentation/features: refresh RISC-V arch support files
Message-ID: <20200814232245.lmwdkla7zx22vtls@distanz.ch>
References: <20200810095000.32092-1-tklauser@distanz.ch>
 <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_192249_389964_2E3D99AC 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-doc@vger.kernel.org, aou@eecs.berkeley.edu, corbet@lwn.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-08-15 at 00:38:52 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
[...]
> Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
> out a PR tomorrow.

Jonathan already applied the patch to the linux-doc tree [1] and
it made it into Linus' tree [2] in the meantime.

[1] https://lore.kernel.org/linux-doc/20200811103940.0a9229b9@lwn.net/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f30c3ff3f0e8305d6c1a210df6d588a13333b8f7

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
