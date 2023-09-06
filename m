Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D68DEB8FCE
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 13:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=F/2A4b072bN4yX4cjeYT33KVYtMQzeJBiZ4NFLSZPHE=; b=mdZ4yq/1Djor5azdSpxzw5xiRp
	JPQVMrGV2BDzC/bSsj7d3ZwVGsGEqE5x+3tRYbm7zRgOIMTbDjF5QOSTdvrfkNzAabPN1u5E3OTxL
	5Q7nxOluetlNifcCj5nnoeZE9Unp3K+A4pRYNgBzQNLsWkrOswkytArYzoxwpv1vkkxpj/tFvv+bE
	shNvz4EvM01qTgaH2yuuJDcQZYxW0L2hODc+onPYjjQZHlhT/O+KkMtYWw9g4FnVIDgMPRPBX6tD5
	o59HbJGPFjqRqrzYpK1uT8N8HwP2Y9P2snWji5Ju/ljs9PBbqp5SxDkliWHuvVfbqSMT2kZQ8SJ6y
	hO5dfMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdscr-00A3jC-0f;
	Wed, 06 Sep 2023 13:31:21 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdsco-00A3in-1t
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 13:31:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-564b6276941so2516462a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694007077; x=1694611877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFiIToPJJ6FCujPCd0yAiudON8W0oAyn/p/xhdheEPI=;
        b=yxbZUCjwHwuzylvQtB3OfGa7AgmlwSMZvnLFhdTkJPh739RWjHngcCWy3g+WbEwH7I
         3UTXOuKTvxP50VuzH/3bJ6hcyLwY/qonI1//V4JMzPBt8LYC5exLcBzB+pz9LBoH/C3d
         EsXc6971ebC7kZQnEbjzIG8VAV1hLN1xQA6CWw08gDzXcLDYntly8YxlvNYb3EPeNstK
         tAKKM/j7Rh5DKfNGYnWdiKT9twZ0h37qwf7FTWEODXa/g36a9G1TXaVSRPKifacvKOCq
         MFOlDz9PPaKTUoXanMFqMTFaryGhWTKtRhn77DLpiBwwiiaG7M370Zxyuw4qM2vBT400
         DUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007077; x=1694611877;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFiIToPJJ6FCujPCd0yAiudON8W0oAyn/p/xhdheEPI=;
        b=bzCJ6RJ6sFO22iFprqz+Hhct3LvLrwuGCCg/vUAGAT7Mk450ZfmHtieQmCWhI+3v8x
         P+ISsAygXkph52Tio3L00KqfrsVRtmjizVit3CSvMcPJJ88r/vQBtIjFjGVknRW8uBIl
         ciOGMNy/Lj5igu1gS2QGYAchYkt2XYWUMBiUGX0YVpLvRfAihRwQB7lEBifS1aU5guf0
         u1txPDMuRhZD7plEgbySTPECz7YEceVXQHHtuBaovHWskA8lUEGyq7Kps/XkkFzZEpiq
         cfBPvzuSHrTU3X8b8YDw9QdUsw1LSDqitw2NNZ62NSLlQ50AvQ8Xl1WPY8KgW3ojllzT
         r2IQ==
X-Gm-Message-State: AOJu0YyFTB4u6pKGO1K3IeAGH0gMTMn8MOZ8XKRHWpPHE0mYPkTpoTYT
	p7z5sJxtu1e/cJhrc+NECx0NeA==
X-Google-Smtp-Source: AGHT+IFwZpFgYNDB0gtie9f9xZT1VXEyo52isr74Zc0CNOQ3PnFA6lS5vlwt+yMD++Tx1IPK+2iobg==
X-Received: by 2002:a17:90b:1e4e:b0:268:46fb:df32 with SMTP id pi14-20020a17090b1e4e00b0026846fbdf32mr14983572pjb.34.1694007077128;
        Wed, 06 Sep 2023 06:31:17 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id j5-20020a17090aeb0500b0026b4d215627sm10973520pjz.21.2023.09.06.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 06:31:16 -0700 (PDT)
Date: Wed, 06 Sep 2023 06:31:16 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Sep 2023 06:31:13 PDT (-0700)
Subject: Re: [PATCH bpf-next v4 0/4] bpf, riscv: use BPF prog pack allocator in BPF JIT
In-Reply-To: <169396862749.1987.4994366714692856707.git-patchwork-notify@kernel.org>
CC: puranjay12@gmail.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, pulehui@huawei.com,
  Conor Dooley <conor.dooley@microchip.com>, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
  song@kernel.org, yhs@fb.com, kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: patchwork-bot+linux-riscv@kernel.org
Message-ID: <mhng-b249bbd6-f716-44d4-88b9-2aa1e058641d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_063118_625890_53777C31 
X-CRM114-Status: GOOD (  16.50  )
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

On Tue, 05 Sep 2023 19:50:27 PDT (-0700), patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
>
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>
> On Thu, 31 Aug 2023 13:12:25 +0000 you wrote:
>> Changes in v3 -> v4:
>> 1. Add Acked-by:, Tested-by:, etc.
>> 2. Add the core BPF patch[3] which was earlier sent with ARM64 series to
>>    this series so it can go with this.
>>
>> Changes in v2 -> v3:
>> 1. Fix maximum width of code in patches from 80 to 100. [All patches]
>> 2. Add checks for ctx->ro_insns == NULL. [Patch 3]
>> 3. Fix check for edge condition where amount of text to set > 2 * pagesize
>>    [Patch 1 and 2]
>> 4. Add reviewed-by in patches.
>> 5. Adding results of selftest here:
>>    Using the command: ./test_progs on qemu
>>    Without the series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED
>>    With this series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED
>>
>> [...]
>
> Here is the summary with links:
>   - [bpf-next,v4,1/4] bpf: make bpf_prog_pack allocator portable
>     https://git.kernel.org/riscv/c/063119d90a06
>   - [bpf-next,v4,2/4] riscv: extend patch_text_nosync() for multiple pages
>     https://git.kernel.org/riscv/c/fb81d562ed1f
>   - [bpf-next,v4,3/4] riscv: implement a memset like function for text
>     https://git.kernel.org/riscv/c/f071fe652d73
>   - [bpf-next,v4,4/4] bpf, riscv: use prog pack allocator in the BPF JIT
>     https://git.kernel.org/riscv/c/19ea9d201008
>
> You are awesome, thank you!

Looks like I screwed up the merge a bit here, so these hashes have 
changed a bit.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
