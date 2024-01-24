Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56288C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGfN/Vgk0KOolFL/R0R5BhModt7QNcx5fZHBL7rO9mk=; b=bbR0rNvsFzRpEW
	M7/8QHFzJuo0rAAnMj9Ivk3/O7T4BM3CPmqYGL/0f95t8tjD4tl5b9lfd3RKeSUh4wgWNIPgJNZWd
	EL4A/ZUcoiOVBqGKCF4K5KQrucL0UyBeEXbyDiMDX8zH+bNVP7uC9baS7B0t/wV/NRIbRgfssnCyJ
	PdUQmlMm8yu4CumGNZzYtu8YiEdKXAC560Kxdo6JeAKJwiYlHOxGT4mcVLgHEExqzxLfVCFo7Y48u
	b31FktFTEr32MTXFeBv8UNXhwQ7035XQ6yFTH8fdRGZYXjq9sF+9cf0HOhUZayTLki59+JvBfl9lB
	660Xk/3vbBjRgElDUDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfxU-0049u1-2H;
	Wed, 24 Jan 2024 16:18:36 +0000
Received: from smtpout.efficios.com ([2607:5300:203:b2ee::31e5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfxP-0049qu-2W
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 16:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1706113110;
	bh=fdb4Zk8kpS57cz7UQOaWOD8Gc/oHuCpHnm87tMS4JXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rK3w1FWZECH8ewCqknoAwEohXevMn+PQBx7pEAb01wOihiY3/DfpbEPyknog+SkAg
	 QLMn7tFVyTz8pw96EfO5j6yk6p4o0U6uDWs1mCVPZiBlvJGrvLV7tMrLx9nCBlmzwQ
	 scxJB91Do6jit+Nm4xDCcHMunRlwKYUIqmO5par4mrEKfjAQY2ziQ06cxSxJ4EZDXp
	 kGCODRxkCuQ6Rng7lBEfiZ8mxCP5E52W/GqsXedcKvqMgk7FkmTUeo12L6g9fCrwss
	 K+lPAEyZDvxMLUk/AWq4mPOnVmVFOBEExUSHaSfCyzjhfyIIvl3DEhWpdGjHkpYS2t
	 R72AnGsc8e+Mw==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4TKpzV2MbBzV72;
	Wed, 24 Jan 2024 11:18:30 -0500 (EST)
Message-ID: <aabea058-0088-41bb-822a-402669f348bb@efficios.com>
Date: Wed, 24 Jan 2024 11:18:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] membarrier: riscv: Provide core serializing
 command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org, corbet@lwn.net
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-5-parri.andrea@gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <20240110145533.60234-5-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_081831_890353_DD1CACEB 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-01-10 09:55, Andrea Parri wrote:
[...]
> 
> diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> index d96b778b87ed8..a163170fc0f48 100644
> --- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> +++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
> @@ -10,6 +10,22 @@
>   # Rely on implicit context synchronization as a result of exception return
>   # when returning from IPI handler, and when returning to user-space.
>   #
> +# * riscv
> +#
> +# riscv uses xRET as return from interrupt and to return to user-space.
> +#
> +# Given that xRET is not core serializing, we rely on FENCE.I for providing
> +# core serialization:
> +#
> +#  - by calling sync_core_before_usermode() on return from interrupt (cf.
> +#    ipi_sync_core()),
> +#
> +#  - via switch_mm() and sync_core_before_usermode() (respectively, for
> +#    uthread->uthread and kthread->uthread transitions) to go back to
> +#    user-space.

I don't quite get the meaning of the sentence above. There seems to be a
missing marker before "to go back".

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
