Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA51CDD548
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7J8Uig9P9xV3hlQ5TK4Y+PvnwcVdsm9AErUNqNzNErk=; b=hZAE5RwtDSWRaR
	o2R/bBNm1/vjBU9/ToisNqdPJBzQMtSvAlhj8oYyE8fmsAkPKjx7OBhI/IaHfFbElcAtG9YSBZ2t/
	JXn60uhtO3RzciP0GhSn2ltMkyG6IrRkm2KZRz3X5GNrFaGNlwm4AFS1iNfy/1sncSfWqoUeI/1M+
	0Y+5p2KasIKpqUqI4Xvw/VQS7TDQuh8/weU0I0T+rVEcf4Mg4TiRtTbABwaoYHehgG36+ItKG0h4J
	yaBryTPDhN1m5tqwEXJkNCWbFbJuXe3lJK30Za5FFQ6DQ59vmcMrVUnAjKe6DdQEg+4UmWcvl8k8J
	1uIbzcOezt2tPOOhppjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxWX-00000008cxi-0IO2;
	Wed, 18 Sep 2024 16:27:25 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxWS-00000008cwm-0N0u
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 16:27:23 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 785193F74F
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1726676837;
	bh=iEkJdohtSWik4fNSGLkaPeBerSCz1v1hA1g/Oi9GQoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=UYyx+gTQCLAkdDMwi+P+AG5lftwMLxLjZe9/ZyxzRxzoRH0V84EMx9KEzmo1t0D4Z
	 2AMEEZ2lL5eaz+M2uncEPXQt5gZo7FX2zWWHUMTQWVqjOHvrR7JGrLB1XhIuupldaW
	 u3y19hsfjHRQx18uj8zLfaXL1i95sMhxalk7TTRCFclm2/LYSe1J+bcK/+GI2KUUg3
	 W0v3n/s9buzg8q5Upd5w9yRM/KxRNtbiJhb44OZWgXH3foGSFAGGxuex6VfcqKkW2q
	 9YXWW9SBw2Cly091i5fzL1d/M0YL+Oqvqn+GNLRC9DFuQr6duM2WauREjPFnvLz8/d
	 lVEMxuic3gh4w==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3787ea79dceso2345057f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 09:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726676836; x=1727281636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEkJdohtSWik4fNSGLkaPeBerSCz1v1hA1g/Oi9GQoQ=;
        b=W6cOwhfdOsmGwWQIK7pdgQdtP8gSne+ChFe0T0Kqk0/+03ARxrIa8zS90evnTcrplA
         hhzGl8nnJgktxg1dY8h8aRxBkt2BClDYoMGomVMg7SLZB51MUxmGox01CS4MwkcKsSPs
         NUCtlgdRCCTgbmMBHFW3KiESdQB7DdDQO3BKRIGkQVAEABGv+4lqk17z/QaY8QHrSLpP
         bqNb+YhqShqX2UNp5JyJyVyJp7J/tgZVc2WJxrs/QZBwKCW6/FhH9+i4ArKPLAWrAubB
         hl7bIajUB6p7/FHD4GSMbseswgKTr2quyi2C/aNKXMvLOvgcDIjhKsDIFRPHzYJvPVT8
         WESg==
X-Forwarded-Encrypted: i=1; AJvYcCWDyONqFhLanOASsVuFsIAuWW68DyVip1zpkdrI7Ik/+lzubc0NagCRw2m3GyuwXPjmo4erJbQrqI78Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/czxg62BUIDhweh6l9ifbn821Bu/lXjGZEDhPyNZp7TNL4hpl
	wXRAaJNQbnI7JWW2XfAQrEgbyoh67V8SXFPhO3XGnv0Wcet7Ifn5RgTcwL7mPiULoKl1MCRgt1U
	yypVvanpBqt58XJCNE2sA6P8ohRGpDHDtd7D3WI/jpfLjFL6GZ0K1HjqXy9KEoXK7lp236Xn3+e
	O3KkfnQA==
X-Received: by 2002:a5d:66c4:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-378d623b7d4mr11461421f8f.39.1726676836342;
        Wed, 18 Sep 2024 09:27:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq7GTsYYXDPhTkQjL35nwxJT/xKz4RyECHixjHF7LH26VDJ/F0Ct2Etb+lGYO2yRNM4mRfMA==
X-Received: by 2002:a5d:66c4:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-378d623b7d4mr11461375f8f.39.1726676835857;
        Wed, 18 Sep 2024 09:27:15 -0700 (PDT)
Received: from [192.168.103.101] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780519esm12698302f8f.103.2024.09.18.09.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 09:27:15 -0700 (PDT)
Message-ID: <ca16bb60-9745-478d-afba-1330b385027e@canonical.com>
Date: Wed, 18 Sep 2024 18:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
 <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_092720_427729_7E729675 
X-CRM114-Status: GOOD (  23.59  )
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

On 18.09.24 17:32, Peter Maydell wrote:
> On Wed, 18 Sept 2024 at 14:49, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> On 18.09.24 15:12, Peter Maydell wrote:
>>> On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
>>> <heinrich.schuchardt@canonical.com> wrote:
>>>> Thanks Peter for looking into this.
>>>>
>>>> QEMU's cpu_synchronize_all_post_init() and
>>>> do_kvm_cpu_synchronize_post_reset() both end up in
>>>> kvm_arch_put_registers() and that is long after Linux
>>>> kvm_arch_vcpu_create() has been setting some FPU state. See the output
>>>> below.
>>>>
>>>> kvm_arch_put_registers() copies the CSRs by calling
>>>> kvm_riscv_put_regs_csr(). Here we can find:
>>>>
>>>>        KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
>>>>
>>>> This call enables or disables the FPU according to the value of
>>>> env->mstatus.
>>>>
>>>> So we need to set the desired state of the floating point unit in QEMU.
>>>> And this is what the current patch does both for TCG and KVM.
>>>
>>> If it does this for both TCG and KVM then I don't understand
>>> this bit from the commit message:
>>>
>>> # Without this patch EDK II with TLS enabled crashes when hitting the first
>>> # floating point instruction while running QEMU with --accel kvm and runs
>>> # fine with --accel tcg.
>>>
>>> Shouldn't this guest crash the same way with both KVM and TCG without
>>> this patch, because the FPU state is the same for both?
> 
>> By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware
>> which enables the FPU.
>>
>> If you would choose a different SBI implementation which does not enable
>> the FPU you could experience the same crash.
> 
> Ah, so KVM vs TCG is a red herring and it's actually "some guest
> firmware doesn't enable the FPU itself, and if you run that then it will
> fall over, whether you do it in KVM or TCG" ? That makes more sense.
> 
> I don't have an opinion on whether you want to do that or not,
> not knowing what the riscv architecture mandates. (On Arm this
> would be fairly clearly "the guest software is broken and
> should be fixed", but that's because the Arm architecture
> says you can't assume the FPU is enabled from reset.)
> 
> I do think the commit message could use clarification to
> explain this.
> 
> thanks
> -- PMM

I have not found a specification defining what the status of the FPU 
should be when M-Mode is stared and when moving from M-Mode to S-Mode.

OpenSBI (which is the dominating M-Mode firmware and invoked by default 
in TCG mode) enables the FPU before jumping to S-Mode. KVM should to the 
same for consistency.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
