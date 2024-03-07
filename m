Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29343C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIanIWjd8XP9cpdDdRlOVG0SSDwwD+94/2JLHcQTE7A=; b=4cL+0or8uPv42G
	9Ajp9uoieMvWf3FVWILZ8m4Z8UN1lOJIGL0l5IK8yEPcTw7l+0grZrWxcrd/87hZ8K+1SlV7qyBKf
	PYZ7TeBjwU8HZHTQDzS80xhyhI2Qm3QQ55LGDAGQnVkL5MxqREOCFVXo1b+zTyQYawgu9BlHHh/UW
	MrLff/RgUcjUlWq42MYHNIu+NYSBMcGsZwksVlMfIdMZWFd2yBCJymzoze4Qyvnun3LNCPNoVJO27
	7Gb3yd5MazEFJCjYGqn1zjXdaKq6nSfWtX4dPqIJ/wyjoItkid8p8CIEZolaJ9nLK6VLQYvFLIjB8
	1EJrX/YaG1Ox/iU6TPvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riM3k-00000006cZm-3J1q;
	Thu, 07 Mar 2024 22:17:52 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riM3f-00000006cX8-3AAT
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 22:17:49 +0000
Date: Thu, 7 Mar 2024 22:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709849860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYSZIyK2isZFgtLWNp5tqo04dM1Ssq7AMjL+0jjmigk=;
	b=lF9P/7XKffvo6S5bw+4ysZaBIjZG/dHK8JhCDJA2mGMWzAK2oaEfpUzw7dj97wwGyTXJk0
	wC8kkhkP8rXTBQYQT+Ary6L3NMfXgHBNmuAleTwon/jqaZKHFBd56XfDWnar0Iu4xK/HZO
	2HBOd4bd6ljj8WvXppsSnlg3XzPOvPY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" ->
 "triggered"
Message-ID: <Zeo8_ulDb4wYI_rO@linux.dev>
References: <20240307081951.1954830-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240307081951.1954830-1-colin.i.king@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_141748_001668_5AEF523F 
X-CRM114-Status: GOOD (  13.28  )
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

Thanks for the fix Colin. Paolo/Anup, up to you how you want to play it,
I see the 6.9 PR is already out for riscv.

Acked-by: Oliver Upton <oliver.upton@linux.dev>

On Thu, Mar 07, 2024 at 08:19:51AM +0000, Colin Ian King wrote:
> There are spelling mistakes in __GUEST_ASSERT messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  tools/testing/selftests/kvm/aarch64/arch_timer.c | 2 +-
>  tools/testing/selftests/kvm/riscv/arch_timer.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> index ddba2c2fb5de..16ac74d07d68 100644
> --- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
> +++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
> @@ -136,7 +136,7 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
>  		irq_iter = READ_ONCE(shared_data->nr_iter);
>  		__GUEST_ASSERT(config_iter + 1 == irq_iter,
>  				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
> -				"  Guest timer interrupt was not trigged within the specified\n"
> +				"  Guest timer interrupt was not triggered within the specified\n"
>  				"  interval, try to increase the error margin by [-e] option.\n",
>  				config_iter + 1, irq_iter);
>  	}
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> index e22848f747c0..0f9cabd99fd4 100644
> --- a/tools/testing/selftests/kvm/riscv/arch_timer.c
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -60,7 +60,7 @@ static void guest_run(struct test_vcpu_shared_data *shared_data)
>  		irq_iter = READ_ONCE(shared_data->nr_iter);
>  		__GUEST_ASSERT(config_iter + 1 == irq_iter,
>  				"config_iter + 1 = 0x%x, irq_iter = 0x%x.\n"
> -				"  Guest timer interrupt was not trigged within the specified\n"
> +				"  Guest timer interrupt was not triggered within the specified\n"
>  				"  interval, try to increase the error margin by [-e] option.\n",
>  				config_iter + 1, irq_iter);
>  	}
> -- 
> 2.39.2
> 

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
