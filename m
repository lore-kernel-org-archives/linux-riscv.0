Return-Path: <SRS0=PiI0=A4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90769C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 10:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B82B20734
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 10:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+6+D3Nv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK8HTzbW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B82B20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1RkD3gYeQPng8v71HzFP6NePTta6bvSI1pVDhYfmFU=; b=b+6+D3NvqfMawkizxo3OjrHG2
	HhjRcQGZXkYCrWvGCj/a1vHiGSw2lAymTnKlq0Ykgf+dLNmF6E6N1sn3NLfvbTg9i+6JkVOlb+eV+
	g+29KpXnjxGG22i/3qeY8DwqKtPwwpaXi4pcQydDeNq6kQos2rwWDjDe4sPxLyxXo7TBKCqLOxof+
	67D0LzMz99qX4b7VdiSZiFuOuD/2zGNs8x9joi4oCLqSVzE2SCtEa5964NgL1wbc6WHxrQdbDXjHX
	bkNKOhBS/bCOF+eN5JrcEfT6f7tu50lhZtoijZYJuvT4Voa63rH7mAHmnUIXW5MG+AmwEIy028Dum
	meFuwGXtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwNqQ-00045R-Tg; Fri, 17 Jul 2020 10:43:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwNqO-00044j-H4
 for linux-riscv@lists.infradead.org; Fri, 17 Jul 2020 10:43:57 +0000
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26B1F20775;
 Fri, 17 Jul 2020 10:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594982636;
 bh=tMXpu57E8Vx7cqcnyKoKA4Db0cNZFac86QieI1k1G7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CK8HTzbW5jB5n7zXDrkue0wGo8BaekBTsYKRLiz2jydjNFmCdMU4P9w01S7XptT5a
 5NPbKI40mHeFrJVBw337jP2fD9pRU5PxhdtGMfX4c2NxVgqh7TrSz8rB8OmA5zzIew
 hPhOS4WRrBv8QCh8bJUOeJ9/lWYjDpN+2z3hVC4k=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] asm-generic/mmiowb: Allow mmiowb_set_pending() when
 preemptible()
Date: Fri, 17 Jul 2020 11:43:43 +0100
Message-Id: <159497652409.524891.6561966096386113237.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200716112816.7356-1-will@kernel.org>
References: <20200716112816.7356-1-will@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_064356_739055_E4860095 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Guo Ren <guoren@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 16 Jul 2020 12:28:16 +0100, Will Deacon wrote:
> Although mmiowb() is concerned only with serialising MMIO writes occuring
> in contexts where a spinlock is held, the call to mmiowb_set_pending()
> from the MMIO write accessors can occur in preemptible contexts, such
> as during driver probe() functions where ordering between CPUs is not
> usually a concern, assuming that the task migration path provides the
> necessary ordering guarantees.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] asm-generic/mmiowb: Allow mmiowb_set_pending() when preemptible()
      https://git.kernel.org/arm64/c/bd024e82e4cd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
