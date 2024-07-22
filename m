Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D1EC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaD+PnGpNuWIv1Miu/YVWPO7q3sBdKjWNR3UUEEh6QY=; b=THKpm4kbK0UecT
	NNqRWvmp9ecTXE5oxGlXffc6sEegsQxwck+XuVkZydAiVf+hFt5ihRc2ZycU/RI93I2QP1D6A3wDS
	m5S3Rk1pRV07aHoeyxQem1e/vqLuXvkfyKG2GF/hcLGmYB/v6OBeCU/cURmO48Mz3X9p5YzL8QAWT
	gc9VSLlNSMnGgAwkcix2mTy+RhJS5ZWAN7oWsqV1Wfkt2O/g8/U29H0HSPcUbUK0efVMEB5Hd3QHl
	oa1r8riIlIWP21UPQ3Z2I/ga9S3SG1onkwbwTHhCyumePOJM/8LCEkktgyASpT+i6L6p9Eed0s96S
	iJG7/60OMhRt+bDPDPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0Db-0000000AYRr-25QS;
	Mon, 22 Jul 2024 21:05:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0DY-0000000AYQE-1r1G
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:05:14 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3686b285969so2098974f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721682307; x=1722287107; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJl+KODOtbQbJVQoLcgZraNukUc1AfpSiHvhjNN/EGA=;
        b=Im/5q81vjrvxV6jQicNIzeR6WJH4bg6YNJJDEqp3GCuH38NT6Q7dEZUIQpkd4pXkLx
         GWG0IzKZGW3/EuarzlULyN0PTbq6gs1drVedi8ePJDkAUQ4hsbX3pJR+oNCyvclxfDKT
         dpahcNgpfBAfX37QgTiRG8oNmR5Qdjau2LwqrJMMRfyl1U2VurS9hVhfcYxUw+Vqc9np
         Gqe5roSmVZHQlYMP/w95ei3VeYiNvzFkb8GRe5kkawzP60N7Bm1i1ziRbRcBa+uwKe90
         Y1wfp4m2R0E1ueBmQhdD8SO29TL1nmQrPZXSUsauSjVpsET6Ekt695ukl79LQoposUoj
         kBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682307; x=1722287107;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJl+KODOtbQbJVQoLcgZraNukUc1AfpSiHvhjNN/EGA=;
        b=Nxitg8tdutIYMYk4vWFAm6qsBatP3bn/6RIrwy94Su1XbnzehvIoGGKzhfLmE2CusA
         Uw+P15+E6voaU/Vj+yxLTpnr6rC4yC9OjeQ8kX3PbeV561yoyjq8fu29wTGbuwBBetdl
         51aQRcF5vL/oJKSifHnA/sBDNFltIeWabw5hk/43UzFHZ5+D8EH54nAPhtGAzadSfpW9
         lu5B27k0mGvXNNhSFP+t1/c2KVFnwsFS0at6I84yOdMMgIQ7+srJ2M4egflwCWkKxiP9
         Noe/R1gTLrLW3RQYUe9z3YWf69V1YmoGaAWwu2L8dDsZZ56600DGCfA960oQuM/GX/Eo
         awSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRWL3WqtjevS5Lwk2sV9ANrX9Xvb0ASEnuX0ILm8oOvE15u9r9s4hdOeEHEKUhgPTTwaTrj0jnj23wUW4YTE7kYwXDJmIKeqt0zr/IS10q
X-Gm-Message-State: AOJu0YwIalxrzf0h3omK99nEpV6FYTlMRBSHeP3DMp0cQ+u5SqCrEfaC
	Bs7+hGyet1zMsX9p1m8A/EoEw25ws9KlEjt+nt/DidJDPOKHQ2CoGtwBL5gEc/g=
X-Google-Smtp-Source: AGHT+IGmKiPLP6iZJ8231zq2ISbOWAeyGZtgOmCIid0gBb3g2mEMGCtiGof9hqlaCaNgxv7yS+/6Pw==
X-Received: by 2002:a5d:6192:0:b0:368:3717:10b3 with SMTP id ffacd0b85a97d-369bae23a3bmr5618969f8f.8.1721682306665;
        Mon, 22 Jul 2024 14:05:06 -0700 (PDT)
Received: from localhost ([149.71.24.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cedabsm9521320f8f.84.2024.07.22.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:05:06 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>
Cc: paul.walmsley@sifive.com, costa.shul@redhat.com, aou@eecs.berkeley.edu,
	samitolvanen@google.com,  corbet@lwn.net,
	Anup Patel <anup@brainfault.org>,  linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,  jesse@rivosinc.com,
	conor.dooley@microchip.com,  Yunhui Cui <cuiyunhui@bytedance.com>,
	andy.chiu@sifive.com,  cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,  jrtc27@jrtc27.com,
	evan@rivosinc.com, Punit Agrawal <punit.agrawal@bytedance.com>
Subject: Re: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
In-Reply-To: <87jzhtmvqg.fsf@bytedance.com> (Punit Agrawal's message of "Wed,
	10 Jul 2024 10:39:35 +0100")
References: <20240702033731.71955-1-cuiyunhui@bytedance.com>
	<20240702033731.71955-2-cuiyunhui@bytedance.com>
	<87jzhtmvqg.fsf@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 22 Jul 2024 22:05:05 +0100
Message-ID: <87bk2pkuim.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_140512_830844_156473DF 
X-CRM114-Status: GOOD (  15.54  )
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

Punit Agrawal <punit.agrawal@bytedance.com> writes:

> Hi,
>
> Yunhui Cui <cuiyunhui@bytedance.com> writes:
>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> The RISC-V architecture makes a real time counter CSR (via RDTIME
>> instruction) available for applications in U-mode but there is no
>> architected mechanism for an application to discover the frequency
>> the counter is running at. Some applications (e.g., DPDK) use the
>> time counter for basic performance analysis as well as fine grained
>> time-keeping.
>>
>> Add support to the hwprobe system call to export the time CSR
>> frequency to code running in U-mode.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>> Reviewed-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>
>> ---
>>  Documentation/arch/riscv/hwprobe.rst  | 2 ++
>>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
>>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> The commit looks ready to be merged. Will this picked up for the 6.11
> release?
>
> Once this is merged, we can send out the DPDK change relying on the
> newly added key.

I see the first part of RISC-V patches got merged for 6.11. Any chance
for this patch to still make it for this cycle?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
