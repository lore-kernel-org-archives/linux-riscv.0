Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EB8C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 07:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A6361AF0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 07:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3A6361AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oRcPXX8DbT98n+7NNc7IHKLA/qf8Lva0Su7cAu4sQAc=; b=UzEg1GON1Y0xXnxYR8ceK55oyd
	RJi5nPzp9VfSfWIxOdna0YtVJMf3d6Vb0FZZMlIGFFZCdCY5suLLSpsTEEPrXHfjwb2vvtfRbXSp6
	zvwSwipcNFdYJtuByK48HCralG/2pc2Y49k3z4jugeJCOYqldrYhhSLxdgIxjtJikZJ47+P8QegN4
	XTUv5FOE+OG89wIPktRWv94vgt8o/0HzLnz2vzXNujW4l46liEDn2OjEqqsSs6xGEOCuKhGROcvqx
	8NX8n138hsHkueUPxA7TiudcFF3rglBnBthxYy2wLOBo81GYjIoaoSc8qyWMfvNDTRl7glmPVqVck
	+iQed6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mny3D-009Zab-6n; Fri, 19 Nov 2021 07:11:11 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mny35-009ZYY-Lz
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 07:11:09 +0000
Received: by mail-pg1-x52e.google.com with SMTP id t4so574062pgn.9
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 23:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yc23194KjB+LQokKRPaiWSmxOLe3qSzA7p0t2/5nyw8=;
 b=28w1Ed8HMNqLh14pOZq36vMrE4impBd2S5s88c1708Rt3qNLFxA9LH+1dT3fZx2Ejv
 QHbynFpxbZ6S3biCryrgvk8QAodoWlh/X/htAO79oUbjsIw4OP/REP2p7eDOs2CN+r+X
 URgUc4W9nSlMmZl4lJmXBdJaxKyjl2a2CRbMayUYurvieU0ZqG4S3MZ9sqet8kUQBC7I
 QTMUHEI0RC91MFYUNhOp2aPOYFA7a3W7Akhp4B5f5Iu/Z+xoJvi1y1g4Y45api8IohDX
 9DHmJLUDmnacRGuAT3VtEokGN95d0ddzK3dq0k/xVwUV+pS1nxNGXsnYvQmtx8w/vS95
 e/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yc23194KjB+LQokKRPaiWSmxOLe3qSzA7p0t2/5nyw8=;
 b=0wUI7JK2dIVy2GGg/wKorej87miJo6zjjFs1WkKrX3Wwv4RVK9Sns2o5zLyT3uPh5w
 aN2xD8PFZbveRPq+w8yxeMfxsv8/iyhAd9/KfRkCjnRmnbe84OYfUxTWAIxqjFkohQz1
 i3Sha7xbzU6+7ZrmwHte4iKGWUGBZjiOUxyJBlWmU4dTTwWH6oYkgE7FzrSEOrRsrE4W
 mhJTTYbbIK+QwRdTGd3fPZkdHq9LLSnZDPba64tttjVLzVzxJzRk4+R7WpmSwfkJ3ir7
 tRja4Clw5csXQUPZfmcarFpx4irV+03ho8ak9B7X4zMrBpL0aQ6UII7mnwCHNngiTOOn
 UD9Q==
X-Gm-Message-State: AOAM531IMED41OZK2rl5eUCq2fKotFtPkMwxvYzMW7hIheJnQfXOkHCk
 FJyjPuubIrJ5T5uesJm+BZWD7g==
X-Google-Smtp-Source: ABdhPJy6ryy8jv007aCo8Sr8vrylP8cE+uuZGWUeT1h8S8piRNU3wWOC6MG3OlpeFbCIhzBm10gDxw==
X-Received: by 2002:a63:7d04:: with SMTP id y4mr15781419pgc.131.1637305859339; 
 Thu, 18 Nov 2021 23:10:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d2sm1725774pfu.203.2021.11.18.23.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 23:10:58 -0800 (PST)
Date: Thu, 18 Nov 2021 23:10:58 -0800 (PST)
X-Google-Original-Date: Thu, 18 Nov 2021 22:17:19 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
In-Reply-To: <CAOnJCULQJj0ZyyF+Q1cogXsC9GDQKLTms8vHvNNpj4aHntmx6w@mail.gmail.com>
CC: anup.patel@wdc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, pbonzini@redhat.com, anup@brainfault.org,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-d3ecff31-cbc9-414f-b235-faaac49224f9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_231103_731266_59E67ED3 
X-CRM114-Status: GOOD (  17.33  )
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

On Wed, 17 Nov 2021 23:53:59 PST (-0800), atishp@atishpatra.org wrote:
> On Wed, Nov 17, 2021 at 12:47 AM Anup Patel <anup.patel@wdc.com> wrote:
>>
>> Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
>> so that it always built along with the default kernel image.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> ---
>> Changes since v1:
>>  - Rebased on Linux-5.16-rc1
>>  - Removed unwanted stuff from defconfig PATCH1
>>  - Dropped PATCH2 and PATCH3 since these are already merged via KVM tree
>> ---
>>  arch/riscv/configs/defconfig      | 2 ++
>>  arch/riscv/configs/rv32_defconfig | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index c252fd5706d2..ef473e2f503b 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>>  CONFIG_SMP=y
>>  CONFIG_HOTPLUG_CPU=y
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=m
>>  CONFIG_JUMP_LABEL=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
>> index 434ef5b64599..6e9f12ff968a 100644
>> --- a/arch/riscv/configs/rv32_defconfig
>> +++ b/arch/riscv/configs/rv32_defconfig
>> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>>  CONFIG_ARCH_RV32I=y
>>  CONFIG_SMP=y
>>  CONFIG_HOTPLUG_CPU=y
>> +CONFIG_VIRTUALIZATION=y
>> +CONFIG_KVM=m
>>  CONFIG_JUMP_LABEL=y
>>  CONFIG_MODULES=y
>>  CONFIG_MODULE_UNLOAD=y
>> --
>> 2.25.1
>>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I was actually just about to send a defconfig cleanup patch set.  My 
tests are all still a bit broken, so I'm going to hold off on sending 
the defconfig cleanups until I can get them back together.  This is so 
simple that anything it could break would already be broken, so I'm just 
going to take it now.

This is on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
