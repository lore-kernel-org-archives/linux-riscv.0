Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26102C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 09:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A8424650
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 09:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7qEDWm7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A8424650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e8WeEOX86xa99BoNrQ9B2Du4gOsUH/gMEvyPBCHtlrA=; b=I7qEDWm78XjPu9WUNtQdssNWU
	UTJVfKe4tGIKNWAfFRiVl6AgARMEsP1ES+8yTNqX2XS1Iu1Hu3BY+0wzRob6yR6AP4R9FgCZoXWQs
	tRUexQBFuU/liFmw8TlkeR7SjOtVyUGJUYcOEpIwmoWbLS1WOlpyaQdZRJbQvJTEquPCh9zQTBgxQ
	uUeWIK9aNVA0XkcOMzi+QtnwaHlt5SG2YAWuqlgMt8K/gDHPeEKZv5P4xD1NyZ9dAct7r8rehLD75
	v0GpMv+EnNMvjMOoHRqnyEFZ7Hm/nj52tSp4dTajQFnbriml7jfs5Wbk4EuAApj8xRo/F8M03fA+l
	txJ2fph4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihVuF-0000Zp-Ok; Wed, 18 Dec 2019 09:46:11 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihVuD-0000ZS-EJ
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 09:46:10 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78232ADCB;
 Wed, 18 Dec 2019 09:46:07 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH] riscv: reject invalid syscalls below -1
References: <20191218084757.904971-1-david.abdurachmanov@sifive.com>
X-Yow: Here I am in the POSTERIOR OLFACTORY LOBULE but I don't see CARL SAGAN
 anywhere!!
Date: Wed, 18 Dec 2019 10:46:06 +0100
In-Reply-To: <20191218084757.904971-1-david.abdurachmanov@sifive.com> (David
 Abdurachmanov's message of "Wed, 18 Dec 2019 10:47:56 +0200")
Message-ID: <mvmo8w63r1d.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_014609_627842_725075A3 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bin Meng <bmeng.cn@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Dez 18 2019, David Abdurachmanov wrote:

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index a1349ca64669..e163b7b64c86 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -246,6 +246,7 @@ check_syscall_nr:
>  	 */
>  	li t1, -1
>  	beq a7, t1, ret_from_syscall_rejected
> +	blt a7, t1, 1f

How about using bgeu instead in the preceding check?

	/*
	 * Syscall number held in a7.
	 * If syscall number is above allowed value, redirect to ni_syscall.
	 */
	bge a7, t0, 1f

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

