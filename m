Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD17C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds0X4/3UThsVj992Y/CF8bmxks2etKf2vnaD0LChhNs=; b=sS+TLBYaBbFQLw
	RRMps1ynmOUORWIVLkLJOy+xDs+7cn6o0/ayyiGgUrGNJk+3SmP3AJrOZ6eIbY3Ue6imL5w/m6smk
	/lmN5KHU/4hJnyTqNqm8gILwxiH4ro8xH49OmsQ3C9ZjHwcFWrinh0RJ7cN5L+6YQWz81DXYS9fEh
	z2I0Ua17hDC3lnmceeMFJYHkC8TrLndcSf2+tRDtTsKkf4Y2OgyfPNY4Tchf1MaZaKarxJP/5G579
	Lplf7rXlMw7e2kxtxWGTqgZGagdm/Iry/nxrV6q60gDdQEc06SoRuFCOguaZ/LFr4ObAe3D5xcHTF
	2V5+nCZ1Ya3fRGgjopIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTnf-0000000A5gT-20X6;
	Wed, 10 Jul 2024 09:39:47 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTnc-0000000A5fa-2kyv
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 09:39:46 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52eafec1e84so3765977e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1720604377; x=1721209177; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARVuzbVHjxxG9dv9mtR/lCDpdt7FDrvxjkqdsUuuHF8=;
        b=VACIDoe2ZOgFPIWgRR/3Ltbm6ZqU4fJD+HVoVdRHkh1uwP3ldCxItEoLfUCYsA1x82
         WAtVqW+oU2/oGT7ve3+VhCc71vQUyhBbxWG8KUAbZot1JIT8kvEiqEUUqXWasxshhHby
         E15hodV6fCxa7XalNFTBycJiWFyWmdZLBOyeq3qyz2hErWIJZoOS8k9u7x9SO9vgEi0P
         wtaoJ8d3YWEfEeuoFHxLEVp5UDD/6RXP8q0nKBMRKPDFV/rdeIvNGmtlfUI6404Jg2Vj
         5hDBsNMa3qtQtj0Lr1d1lM5Fga4mEIJYxhG5fbI18W7b7VUHiNIEM6hxPKuQ7vT7tkLA
         NGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720604377; x=1721209177;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARVuzbVHjxxG9dv9mtR/lCDpdt7FDrvxjkqdsUuuHF8=;
        b=EfcnUSVzVFlRazwzfpMY22zbxzAoxZnTVOs41cWsRJ1scd+KPe6iFkZ2V8SNjVu4lt
         7exigbtVbimB9C5R8Zwv0YKdFhOuHWP8QI/sNXV54fM73GY7aUzvK60T/+L4lFTmaOu/
         WSYu9HMU255azedpgyBRn/aEhu9hqn4R41RCKUQGoW9fwyrUt8pSi5T4nuSUyMhfsQEA
         uFlACRw2CInbnAllkTz3yeyo74rBd7kO00M1Ct+NM8kKSqtNdP4ghpcM/D18pMndajCD
         t8HJ2V49Dzdey3HAHh9C6lt+HweIlF7VQnRERbLhnQO+AZ9i1/Nxs0WWwCp60ySI29/f
         Gb2g==
X-Forwarded-Encrypted: i=1; AJvYcCXsKXxEQMnNgsS/FcDhGD18ApGzNz9vLivtC1+qrRP/ofCtdboKykwCkkyaUHXerXMIj3ABTHUYtoI2ENK7Oo3oInINXQ6oHRIV3i9016sW
X-Gm-Message-State: AOJu0YxjF37dylYYi9xijQrWrD/Suf2KD6wVb7h/n5UrFuC3hzJOEG2o
	MmDzh79qn2SjUEAiE+4qE/ssJrk8pvnbMTdE0fo50261phKIzTXEkTrDL1cWiWs=
X-Google-Smtp-Source: AGHT+IH5HuyWqm0xlysU+IQkoWroaRhheIPJ9ojT9MNnUnqo/Xdu38e9HBXnOtzD4O+1giys97jgbA==
X-Received: by 2002:a05:6512:3b82:b0:52c:fd49:d42 with SMTP id 2adb3069b0e04-52eb9990d58mr3224222e87.14.1720604377061;
        Wed, 10 Jul 2024 02:39:37 -0700 (PDT)
Received: from localhost ([149.71.16.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f74159csm73618475e9.42.2024.07.10.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 02:39:36 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com
Subject: Re: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <20240702033731.71955-2-cuiyunhui@bytedance.com> (Yunhui Cui's
	message of "Tue, 2 Jul 2024 11:37:31 +0800")
References: <20240702033731.71955-1-cuiyunhui@bytedance.com>
	<20240702033731.71955-2-cuiyunhui@bytedance.com>
Date: Wed, 10 Jul 2024 10:39:35 +0100
Message-ID: <87jzhtmvqg.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_023944_724750_40FE33C7 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: costa.shul@redhat.com, Palmer Dabbelt <palmer@rivosinc.com>, aou@eecs.berkeley.edu, samitolvanen@google.com, corbet@lwn.net, Anup Patel <anup@brainfault.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jesse@rivosinc.com, conor.dooley@microchip.com, Yunhui Cui <cuiyunhui@bytedance.com>, andy.chiu@sifive.com, punit.agrawal@bytedance.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, jrtc27@jrtc27.com, evan@rivosinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Yunhui Cui <cuiyunhui@bytedance.com> writes:

> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V architecture makes a real time counter CSR (via RDTIME
> instruction) available for applications in U-mode but there is no
> architected mechanism for an application to discover the frequency
> the counter is running at. Some applications (e.g., DPDK) use the
> time counter for basic performance analysis as well as fine grained
> time-keeping.
>
> Add support to the hwprobe system call to export the time CSR
> frequency to code running in U-mode.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>  4 files changed, 9 insertions(+), 1 deletion(-)

The commit looks ready to be merged. Will this picked up for the 6.11
release?

Once this is merged, we can send out the DPDK change relying on the
newly added key.

Thanks,
Punit

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
