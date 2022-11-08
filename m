Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034E7C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 12:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/DpjvfZiDS5VPeV9SVXVMlYnvBfD9jpQLVaO00YcmU=; b=1oKu7c+MlWkBYf
	NZAs8B68EjCvh31MMLVZlwHQ9oNs9Zz7+ETvWCTpmk7MKuVbKiTeNCUpCNf86ve0TYjGfIOyoeriF
	acidNvHpV7v7Aam9UC2MVUFZBiLzBk35JOxE49fKST+dwT17Aj3qzS2fJycN4BCDyTFflbhPhzRCi
	YSVoSM0d01ZsVSSGyCVJFsD8f5KPALji3Be3QaW8+QzRffJWCNnDKcN0wivf3bBZGAmCwYgDwyCDQ
	aZirX4kQ/iI2Y0T1sdPEWUnGkwWkVsQYgAeIMVhvl80E6zskQN3P+MQqxNaEaY3X7pTAHrItlsW8v
	JHeJbjqpInerccWuzfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNYV-0059Mq-5X; Tue, 08 Nov 2022 12:18:15 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNYS-0059MB-K0; Tue, 08 Nov 2022 12:18:13 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id BEAD01F897;
	Tue,  8 Nov 2022 12:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1667909888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QeUj1KQeijZc8VVyU5Jhg9NQ2cupqwdXYW1sF2iO20E=;
	b=D7/6PUWNj0Ikd3aiqq8Zwis4IBwu0fRF8Xi40rePYUojl+9f0qZf9Gv4vfhpnFLVxzUnPu
	RcHeQDtJ3HpYJrv0U7SQef4C+vbHSeDiOlSOgsq8BOOg6X35NS684w/Q6yl+j3GN/n8Jq/
	hrZ4qJC25VSQ510tGYT6NW4Y7wB2bhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1667909888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QeUj1KQeijZc8VVyU5Jhg9NQ2cupqwdXYW1sF2iO20E=;
	b=Eh5rMSTKnPpOmUDZVSU0beIStwJAZ205hU+JLe+dQuxTaTK28GlQozBvgsL7Mphpk3W+n1
	BV6wqTs4PxVssMCg==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id EA6762C142;
	Tue,  8 Nov 2022 12:18:07 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 5D94D44039C; Tue,  8 Nov 2022 13:18:07 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Atish Patra
 <atishp@atishpatra.org>,  Palmer Dabbelt <palmer@dabbelt.com>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Andrew Jones
 <ajones@ventanamicro.com>,  Anup Patel <anup@brainfault.org>,
  kvm@vger.kernel.org,  kvm-riscv@lists.infradead.org,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Exit run-loop immediately if xfer_to_guest
 fails
References: <20221108115543.1425199-1-apatel@ventanamicro.com>
X-Yow: Now that I have my ``APPLE,'' I comprehend COST ACCOUNTING!!
Date: Tue, 08 Nov 2022 13:18:06 +0100
In-Reply-To: <20221108115543.1425199-1-apatel@ventanamicro.com> (Anup Patel's
	message of "Tue, 8 Nov 2022 17:25:43 +0530")
Message-ID: <mvmiljpd4ht.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_041812_818256_7F9B0EFB 
X-CRM114-Status: GOOD (  17.20  )
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

On Nov 08 2022, Anup Patel wrote:

> If xfer_to_guest_mode_handle_work() fails in the run-loop then exit
> the run-loop immediately instead of doing it after some more work.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 71ebbc4821f0..17d5b3f8c2ee 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -984,8 +984,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	while (ret > 0) {
>  		/* Check conditions before entering the guest */
>  		ret = xfer_to_guest_mode_handle_work(vcpu);
> -		if (!ret)
> -			ret = 1;
> +		if (ret)
> +			continue;

If that is supposed to exit the loop, it would be clearer to just use
break.

> +		ret = 1;

There is a condition on ret <= 0 later in the loop that no longer can be
true.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
