Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F39C88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHWEsVPK9tO3ANwyWB6EssWXzbxl3e68S4WbZXk1f3s=; b=Als/O3bhFCZUmY
	6VJy7C0Sf3jB7jUTtY8QAbhuSsf4fMhPDHqBJ5j+Bt8jixEFD3G8XvImTzXmALHk657R8ss+ArRfO
	I1Ugxk/A7M89G8lZJncXEYdjC1usZ0P/2cghqqxPNgVkpQJoR0HuFh6txT1VA5q8v8SS3iGIU/u6F
	pEoebwIG3HUmdfsPi34O7f4CbNnUVboo269EJ7PWdsG9wLT77VxuBHIFvnvhOSYNEZ2chpTDyTLbY
	P5REcCnGBOgwDgwmwD78MU0bZkRMs3EYhXFbUVQV3CaqoFgARV70jd5Vd+Y9L2pCGxuWMhWIFBO41
	SCWFdr3StqMVlZkyv1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xtn-0000000GIrU-2IFz;
	Fri, 11 Sep 2026 09:50:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xtj-0000000GIqQ-3iAM
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 09:50:22 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso521373a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789120219; x=1789725019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpZ/UQ4AkTJ61oeiBTSNoMmIV3BY5yM55iesC2dqb20=;
        b=sIuOLdnzg8tv2BEC1iC42Kc/e02gEV7d4F7dk9gO+DN59CWYrok/OH2/KoUqHUn8jQ
         7XyQIZv0q2UWCi14NZYk37j2PsNH8LI9mpHAjZP+dUW9ysLerbTslJXlpNZZCLY3cFiH
         9oPhTkDZvXEq90kfhM5qH/fFWYFa6s26nkHU3tYFLBjQd7rUSgQt3x5Ztlb/mmM/uIF7
         MFQWUz7wZc8DlxwCGumNB9LjKbJsNjdPO5DugDE1zFcunikgTbpIjDXa84tAZpzj08d5
         q0XMIVrCJBzPNm2/RkOdfoXFFOK0Dx7+PMaMHwKJCbWSADRmEPX7hET7SPi9fXEsGuO9
         +FiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120219; x=1789725019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpZ/UQ4AkTJ61oeiBTSNoMmIV3BY5yM55iesC2dqb20=;
        b=JUvOHT6vSVIBCWROD/PeetnSY8ZvQxzW2mA50UpMmZ63NoZuxk3kqQ6qKUIzazqVBJ
         q01sqxDcWYGDZ/9RcOY/ZJF4cGt4tSQoAFiT1YVK5pa3APhA1PqGwbHhk771EzJt4lOd
         MkTFXU6W4ELMM7Ba9/EO6z6qWo5K663mZyPAXRDLrJTDvCsY9F3PXVhyRc7W5fuXeDPV
         pJdjaur4ca2/g3PmNUhWkn8OzbYD58vD4T+y8Tae6gCJ4ecSeHqhSrTego8xtzsnfhBz
         4ifFylY4SgXORu1sYtIWD+m/OlH+y7U7iO90XRZbVmfcdzaWsDA9Lt4j3n5s97Ut0/w7
         WGxg==
X-Forwarded-Encrypted: i=1; AKwUvBx4YfPMFjY4jAeEXK2n7oPhurYc/z2NBi2u5yqtID1slazqwlVookGt0oTPRa7Eit/wTbDNVGn/gYW9NQ==@lists.infradead.org
X-Gm-Message-State: AFuF++npgz7AnIPogLYjf2PUbokq6YRqY3Z3zuu3VF2gaskptLmmG6t5
	aX5Co7BEN5fbslrA492JvBN+8Lf8ups38J9rM9sMhCaevh4vQY86RlOg
X-Gm-Gg: AYBFou3si9aQ5GnibTfbNX2I8FnXJiJd1PkYvwfagXlU9Ae13PWQ9kdjd0Md01iNgd1
	raEYJgzyVPZfpanOme0BBozSanGDc0xZqgbvep0+k+qLbhUymDQDn3w1OLb6mtzbEXeRkAbETS1
	Dn9gJQBZ9DWbVfmTNGzgTss0nEbkRSKNai8luYpMqFwzOOkc58m6A9oRaxu20eXxTXR7ArhrKqM
	w04p3M8HJG3U37tWM1Dsckk57CI2fnlFK6dz7sWzita4+LrT/jdSQ1o53ZTJbvpVKFEZoXvmW7o
	pcAJBURUaoeb3RWeFdU7IZWmMn1/B/2qjf5GXjQrfRcMeNLxUl3q5FeFTKJVZ8nN+OioPUlmhfB
	Pqn/k2wFkIS2rAbDSE75hjejJF/1DMyS8ReatXSgzRLlKhZsTuqcujf/LDmNQzud7Y2bNrY2Sse
	q3RIoDV2W4etj+BKvaxh90jgXd6zzIDybHCZhqYnaHBEEelkjBRsQ2cW/lQ0GSBaNBIPvmYA/s
X-Received: by 2002:a17:90b:164a:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d9c20c6f3mr4635407a91.19.1789120218848;
        Fri, 11 Sep 2026 02:50:18 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da6016718sm1766700a91.15.2026.09.11.02.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:50:18 -0700 (PDT)
Message-ID: <4ad187c9-44ae-461a-a29e-2531f0906a1b@gmail.com>
Date: Fri, 11 Sep 2026 02:50:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Davidlohr Bueso <dave@stgolabs.net>, anup@brainfault.org,
 atish.patra@linux.dev
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
References: <20260827211209.2871124-1-dave@stgolabs.net>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260827211209.2871124-1-dave@stgolabs.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_025020_953903_0A3C8B54 
X-CRM114-Status: GOOD (  19.99  )
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

Hi Davidlohr,

Thanks for attempting to fix this long standing issue on P550. While
you are at it, can you add the conditional write of henvcfg as well?
P550 lacks both henvcfg and senvcfg, so needs to avoid touch either
of them. Be ware that the vendor's OpenSBI carries a patch to silently
ignore the access of h/senvcfg:
https://github.com/sifiveinc/meta-sifive/commit/942256244c61517d375d9359577dafeb04e258e8

However, this patch is just wrong -- it doesn't set return values
properly; it doesn't check for previous privilege levels...

You can just use the latest upstream OpenSBI, where I've contributed the
EIC7700/P550 support code, and get rid of all these vendor shenanigans.
I've thought about doing a proper emulation of henvcfg/senvcfg and hard-
wire them to 0 in OpenSBI, but later it's deemed not spec compliant --
if henvcfg is available, then FIOM bits must be writable.

Thus, you are doing the right thing avoiding accessing them in HS mode.
Please add the henvcfg handling, and I can help testing it. It should be
a pretty simple change.

Bo


On 8/27/26 14:12, Davidlohr Bueso wrote:
> senvcfg arrived in privileged spec 1.12, but H-capable cores on a
> 1.11 base exist, ie: sifive P500 (ESWIN EIC7700X) implements the
> hypervisor extension yet has no senvcfg. KVM swaps the CSR
> unconditionally on every vCPU entry, panicing the host upon a guest
> executing its first instruction:
> 
>    Oops - illegal instruction [#1]
>    Modules linked in: kvm
>    CPU: 2 UID: 0 PID: 127 Comm: qemu-system-ris Not tainted 7.2.0-kvm73bug+ #4 PREEMPTLAZY
>    Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01 01/01/2024
>    epc : kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
>     ra : kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
>    status: 0000000200000100 badaddr: 0000000010a797f3 cause: 0000000000000002
>    [<ffffffff01df432e>] kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
>    [<ffffffff01deb3b0>] kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
>    [<ffffffff01dd7914>] kvm_vcpu_ioctl+0x180/0x5e4 [kvm]
>    [<ffffffff8025702e>] __riscv_sys_ioctl+0x84/0x9a
>    [<ffffffff80dfdc72>] do_trap_ecall_u+0x1d8/0x38a
>    [<ffffffff80e08644>] handle_exception+0x168/0x174
>    Code: 84aa 892e b703 8887 1773 1067 3023 16e5 b783 8907 (97f3) 10a7
> 
> Touch the CSR only when RISCV_ISA_EXT_XLINUXENVCFG is set, similar
> to __switch_to_envcfg() as well as other swaps conditional on
> their extentions.
> 
> Fixes: db3c01c7a308 ("RISCV: KVM: Add senvcfg context save/restore")
> Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
> ---
>   arch/riscv/kvm/vcpu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e062ca19f9d8..0c2d58db13ab 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -773,7 +773,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
>   	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>   
>   	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
> -	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
> +		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
>   		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
> @@ -787,7 +788,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
>   	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>   
>   	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
> -	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
> +		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
>   		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
