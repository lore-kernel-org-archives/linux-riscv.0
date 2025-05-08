Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB77C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KK+S+JLHiZvDmuMvPfMia7hjaMXg0sziP/grJWWaH+Y=; b=baG8P4WLRDMkZm
	kvvCGgcwx3wEGk6iRFX3o5DjKGTe+SNRtopiBcG2G7YbWkAIlOrHjWAOSp7yObJEE9Jmyxa2ueFS9
	9dRAdD5RzzztBRLUPnCqYdi7VLsUA77KXtnKJrTb2uOwNOXvt+iTNmJpVOKmEkGujZQUj3vmWBDGL
	DAZgPrdjqjDwETzcD8nrUzdKgJTgqzenom2tkRrW3dOewZpDHmroTJr133vxRRNW58Glz6Q5jDqxd
	wzZdZ9nBZvG0y+Ud00V9ppH3QxdahvWxZGOQmLeqsocLdrQV3V6SJl3bEsNVmSL58aap79e92nbKg
	i432NYm7bN9wMeuvaBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD27i-00000000tme-1UbS;
	Thu, 08 May 2025 14:21:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1MV-00000000lA2-0Ety
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:32:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so456765e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711149; x=1747315949; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=ZcXIvPO0BnaOIGChIhid9UCEEE7wrJ2ophP5QqaVpOV58522scDSD4OBVRPOUovoXk
         /xPBfnWLVOnbM8w7NHpiEz8oPUHLFUqWjZJNrAPl8vZqxk+blqg2SHm2qm9fU16bQj4k
         6agB2NB00qAS5g0l2GpuvEXTlYuytd7AznOyAcmAEJy1SEobbci+/NPCH5LpUt0eJLpn
         tnQK4tBn21zagYKC0fDAc+sN1+u3YVcPmRgYNmeG6QrWrK2CMSPfX8HmSbPstSpYprqC
         SB0uYyL3739daHrHsgcykZgLR5iaEO828Kg89/Z6dlHU0/L/9sAAPAMM4pvMAn1lBNV6
         scNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711149; x=1747315949;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=vclOcHCzTwnGalkC/Ic5k753YpxXQCFf3T9qbjzKkjFb0kJcyLlMQJlbwysxp7cs0p
         gUwuxDMe7s15UbpxHouVGqtj/mE5AN6Q/4WN+fddWcUYMy1BsvVLptiMals0iQYtvA15
         o9sJnX0FyZPf20CLrzoiBaoth8Vm5CawlytCRwwe5W8Rc1PbnS4Nmym6hD/3FqAU15fA
         MrgrIco99haIxtJ6b5dJgvpjHfwQY7hi7Qq3943XeFmZjJHEuJDXn2yZcBZnQhFr1DCS
         V52iUUJ3abij0/gWKLtkY7Fz6vQsok9t0/wglosdrqK2BSHiXFApHd9EB6RBjtaAj5R2
         eu0A==
X-Forwarded-Encrypted: i=1; AJvYcCU31Qrg/rmu57V27Yrn0KVBlpf9DfkRtjvsNUZzvu8Rz0udrpR7qKb1dhiRqQthTphzyxrW8zcZYTg3sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywT6P5gesUby3RGjR4H4hNNTw/A0I1oIUjjJEiKo7qovaMwrKO
	m16zaxErhAiHimkolJ22F+++QfuLH9Kg/OLn2HuEZhZchLq4p+cyIymTOvKQC+M=
X-Gm-Gg: ASbGncsrEa9BJoNrIexNJBBGpFiFBEBOHis79A27p0/ykc5nHUtGj/dNQC5SFFyy2Ph
	jyHf9BdfALE6HZiLto4ZWmoUN/BIVEQxPopHhVtOD1RRkxRA61bf+n3Q9xT7gkreAPz/1BU0DPG
	im/vBw/9Hj18NmaccYazsGigrgPfaweyhi9hJsaGUdFmEvfGLPfJEFfxmtrHegVIrrw03oBB2Ad
	iL5Y5buJuaJaQ5M0g0pQORHqnkyk6Kub6Vwg7EBZ5upy90AWUWeC3Jg+4yHCJOs/3s9EyKTgy1c
	kv7m3rL+y+U2G04jd5pRNza5DTTIYu8daaPIztMqnYdLRqO4
X-Google-Smtp-Source: AGHT+IFV8Gdwh/t9ZunwZV8yC9Gjd4YDqTg8K4dFRuyEe/kGcOgQumaKBu9osZaWckRfANKTr0Qn6g==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr24537645e9.6.1746711149535;
        Thu, 08 May 2025 06:32:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32b0c8sm37984755e9.3.2025.05.08.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:32:26 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 May 2025 15:32:25 +0200
Message-Id: <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_063231_100245_704B8589 
X-CRM114-Status: GOOD (  15.21  )
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

2025-05-05T14:39:29-07:00, Atish Patra <atishp@rivosinc.com>:
> SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
> SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
> instead of bootime.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> @@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
>  	return KVM_INSN_CONTINUE_SAME_SEPC;
>  }
>  
> +static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
> +}

Basically the same comments as for [1/5]:

Why don't we want to set the ENVCFG bit (62) unconditionally?

It would save us the trap on first access.  We don't get anything from
the trap, so it looks like a net negative to me.

> +
> +static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	const unsigned long *isa = vcpu->arch.isa;
> +
> +	if (riscv_isa_extension_available(isa, SMSTATEEN))
> +		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
> +	else
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +}

The same argument applies to the SE0 bit (63) when the guest has the
sstateen extension.

KVM doesn't want to do anything other than stop trapping and reenter, so
it seems to me we could just not trap in the first place.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
