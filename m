Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F78C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZqZlePRBXxTi0hC19hfP8zGeJFi5+tYaiH6DAPVDdQ=; b=TD+tO4PG4I8VZpxhv6uKxL7PJJ
	5tUXO9sroaOrcPxT8guXgqFCqmGsGw3kxg8xvpNge6vdIb15SRfonENzhHxipiPTR4w/sbIm75XdX
	6crAoCRauhLGtSf9ZuuVmix3vvmbjJZ6RR+/WGlGP3FhQdvSoruHGxO8gYaUC31LYU/r8WRIkWlDZ
	qY7kZrR1EOzBx+Lmgxj07wDyGsuvWZtFJx/23r0EMJPznUBziK/c0wbhUJHWuRyWVT3bXPkf2L9FJ
	4C6v40fwMrgj4dECMKpZCcun9RzttHu3fEHuDgMbYACOuRp764OVEUOwbEggBg32W8Fn4kPLOLw/C
	E8jrA8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6vlQ-0000000GdD8-1aJP;
	Tue, 14 May 2024 17:16:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uex-0000000GRHD-2c6W
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 May 2024 16:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hLYpzcxGm24wBNcj3TBbz1d4cmvEZCPvDGA2meO1iLY=; b=iKrWFy1gxeNFIsI6UL9M9UPrfR
	57GVhU60UXW8ydtfLdTPZWcwUrGil3ADk/yYIBzkcKdJ4cseKWGAWt3OTVLoAr1bYokW0KzwbYLAK
	ZFIb2bK8oqvL9rxlqyP9sC7HfnsTpsLMMajbWn188LBtBDSjbVNqQXMN148Ca+yVyIOIORKnLKDv7
	KOj6Grw4Gfb3JfGsTJVsivnSEe2cuXQbmJObyzmuZEIynFMgMn8sbEMxwFrl9jXnbrS0d6nd+ZRpV
	eA+3auioDgfhDpdvDu/Sq/SSRI1DGTD/AqrabCrr8SA8iLnjN+VAQ8L56NS7cjXbnvyxI6t3jGjVo
	0ut5Xb3Q==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6uet-00000004oUd-26vy
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 16:05:46 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-61c4ebd0c99so3766021a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715702739; x=1716307539; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hLYpzcxGm24wBNcj3TBbz1d4cmvEZCPvDGA2meO1iLY=;
        b=0/z0UK11R01JjzsWcXOhMgn21rRBZP6xxZWKCsHpAekcMe+tgQKSpXHeCzr8nLUSQR
         WRP/pLKegdjAdA7Qge9ERlTl8csUxrsymvzBQGWbu6zhw7BD+/7UGkssns26Sr1Ps6Jc
         0KeK4dO4agz4lTh6Ll/RP1mksCNOpy1F7PNYIozAdSz50PVf4CkO+UjC0L/5l4Ma1KfP
         JZ14uDSWKUoTFoAmoQ9Z+FOfxAHpM2B335Tv9RPZozCzo+FfViJJpBARbDXvmCbD0hTK
         QvmBFhd5DPSuP8NP5RJEiMkAn9T+bLhrJgyUKjF4vRZfOCzy269lLk4OsOJOJg+W+0Oq
         2ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702739; x=1716307539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLYpzcxGm24wBNcj3TBbz1d4cmvEZCPvDGA2meO1iLY=;
        b=D3qASs1Vp4/AMyeJb1JBbMaTyRxgg9XNNWjHxKGWkr72p2hRbxPBBPjAGWZQWiQKRM
         nWvK1V8JBrk2TLG0//FA4lpWoFUD9EIFEq4f/ofLcB3kZjDVOnA3Ap57f9IXn/nDxoM5
         O5+u9aqsspi61XhtfmRcL+L/oz5lod6bxFru+IiChcXb0DHeHGvgeHUnzh1G7BYv3BsD
         NgKJOqbA2jplpyIca9OvAO/rfvmVnavA57WAO5JwDOyE0ZE2rk1KwENbhSw72JK3dxDj
         kmk33C/CawEys2LdFrezOwuIAOAHkleS8UOWly6jXWSq41Ps43WLrtqybGZi98BlBdes
         dp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBSBVjYOqmAaHhrePaUeiT5tYThTHsDNRejpdVibmaKfgWvyp6v7B4G/O0N89aepJ8K8D5I1FxK78RWyLWfgYkdluSrnD8nltpTQ8vIDP/
X-Gm-Message-State: AOJu0Yz2WMdqNJ9JP/4EU5u57cHrLjRZn0rMyL7s6A4k4kEXQ/H7/I/l
	ToIJmM4kXJZDwgiCRe4u0cOkgzX4uuLG473nyF2f2h+T74slRs0fPcFfuwVZvJ0=
X-Google-Smtp-Source: AGHT+IExT0Lpton62tmUoqhHHjwgEPqRSbd+czbDp3DyV4MKZCvZWeoGNi2mbvNDBuZ7uGZamR5c7Q==
X-Received: by 2002:a17:90a:51a2:b0:2b4:329e:e373 with SMTP id 98e67ed59e1d1-2b6cc45030bmr13858119a91.6.1715702737681;
        Tue, 14 May 2024 09:05:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b669sm11734330a91.24.2024.05.14.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 09:05:37 -0700 (PDT)
Date: Tue, 14 May 2024 09:05:35 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 6/7] riscv: kvm: add SBI FWFT support for
 SBI_FWFT_DOUBLE_TRAP_ENABLE
Message-ID: <ZkOLz0ANkESSv5qr@debug.ba.rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-7-cleger@rivosinc.com>
 <ZixSFLZYZaf8BKHP@debug.ba.rivosinc.com>
 <c8e4c44d-8125-417e-8c61-a1f6d438815e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8e4c44d-8125-417e-8c61-a1f6d438815e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_170544_224568_E7787E86 
X-CRM114-Status: GOOD (  17.97  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2024 at 11:43:15AM +0200, Cl=E9ment L=E9ger wrote:
>
>
>On 27/04/2024 03:17, Deepak Gupta wrote:
>> On Thu, Apr 18, 2024 at 04:26:45PM +0200, Cl=E9ment L=E9ger wrote:
>>> Add support in KVM SBI FWFT extension to allow VS-mode to request double
>>> trap enabling. Double traps can then be generated by VS-mode, allowing
>>> M-mode to redirect them to S-mode.
>>>
>>
>>> +
>>> +=A0=A0=A0 if (value)
>>> +=A0=A0=A0=A0=A0=A0=A0 csr_set(CSR_HENVCFG_DBLTRP, DBLTRP_DTE);
>>> +=A0=A0=A0 else
>>> +=A0=A0=A0=A0=A0=A0=A0 csr_clear(CSR_HENVCFG_DBLTRP, DBLTRP_DTE);
>>
>> I think vcpu->arch.cfg has `henvcfg` field. Can we reflect it there as
>> well so that current
>> `henvcfg` copy in vcpu arch specifci config is consistent? Otherwise
>> it'll be lost when vCPU
>> is scheduled out and later scheduled back in (on vcpu load)
>
>henvcfg is restored when loading the vpcu (kvm_arch_vcpu_load()) and
>saved when the CPU is put (kvm_arch_vcpu_put()). But I just saw that
>this change is included in the next patch. Should have been this one ,
>I'll fix that.
>
>
>>
>> Furthermore, lets not do feature specific alias names for CSR.
>>
>> Instead let's keep consistent 64bit image of henvcfg in vcpu->arch.cfg.
>>
>> And whenever it's time to pick up the setting, pick up logic either
>> perform the writes in
>> henvcfg. And if required it'll perform henvcfgh too (as
>> `kvm_arch_vcpu_load` already does)
>
>I don't have a strong opinion on that point so if you think it really is
>better, I'll switch to that.

Thanks.

>
>Thanks,
>
>Cl=E9ment
>
>>
>>> +
>>> +=A0=A0=A0 return SBI_SUCCESS;
>>> +}
>>> +
>>> +static int kvm_sbi_fwft_get_double_trap(struct kvm_vcpu *vcpu,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct kvm_s=
bi_fwft_config *conf,
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned lon=
g *value)
>>> +{
>>> +=A0=A0=A0 if (!riscv_double_trap_enabled())
>>> +=A0=A0=A0=A0=A0=A0=A0 return SBI_ERR_NOT_SUPPORTED;
>>> +
>>> +=A0=A0=A0 *value =3D (csr_read(CSR_HENVCFG_DBLTRP) & DBLTRP_DTE) !=3D =
0;
>>> +
>>> +=A0=A0=A0 return SBI_SUCCESS;
>>> +}
>>> +
>>> static struct kvm_sbi_fwft_config *
>>> kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t
>>> feature)
>>> {
>>> @@ -111,6 +147,11 @@ static const struct kvm_sbi_fwft_feature
>>> features[] =3D {
>>> =A0=A0=A0=A0=A0=A0=A0 .id =3D SBI_FWFT_MISALIGNED_DELEG,
>>> =A0=A0=A0=A0=A0=A0=A0 .set =3D kvm_sbi_fwft_set_misaligned_delegation,
>>> =A0=A0=A0=A0=A0=A0=A0 .get =3D kvm_sbi_fwft_get_misaligned_delegation,
>>> +=A0=A0=A0 },
>>> +=A0=A0=A0 {
>>> +=A0=A0=A0=A0=A0=A0=A0 .id =3D SBI_FWFT_DOUBLE_TRAP_ENABLE,
>>> +=A0=A0=A0=A0=A0=A0=A0 .set =3D kvm_sbi_fwft_set_double_trap,
>>> +=A0=A0=A0=A0=A0=A0=A0 .get =3D kvm_sbi_fwft_get_double_trap,
>>> =A0=A0=A0=A0}
>>> };
>>>
>>> --=A0
>>> 2.43.0
>>>
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
