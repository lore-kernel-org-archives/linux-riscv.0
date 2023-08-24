Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD5C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tNyn7js5mzvelO6khrs3bPP/Xe0SLPPruFe8cSACuWE=; b=BdwGYsPLvmmNizyvhAgZqUma3u
	jslfhT5qeFzYediLuHeWkJLToRW+8gTVu2IweFy1MMF+oxTDPwm2kLG+8eEJBWsNsIV+uVJEM3KcG
	XsCbUD6xk74ojkOo/G6tpbqscI0V0PdjyWr5bwyXLBQE4cMXbkE/tClZRfptSVnfCrifOtwvcIhrk
	Iw4I6IBw2li0W1VopPUmzJKIaVnEeqmk3mdATmSzgSuiUDbiIge3+psVudweGLHusod57EctC9cBP
	7s5BRBGn9iqSAf/0clG7smcdU2jAFJya8fJV2ZvOyoIqf4sFrlPWVw+PBZIz6ufsb2pI7DQNP0B/s
	7vj7N50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZG7y-003fzn-1S;
	Thu, 24 Aug 2023 19:36:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZG7v-003fyt-03
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 19:36:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdf4752c3cso2208525ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 12:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692905775; x=1693510575;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wIorNWdyOim0Yl5+/O6guxDVdvD8pw8pKxbm7dcdPQ=;
        b=vkfnSDccPDleQWhZypW1vaQBlDMLohs76rDCLW1jIn9gS1PE25ocbxD3nx4CGayjiy
         xRFJ2Wtcx7SZUPtvClu/a/1a2m+o2CfJNuKyJQXM3crXLK4eHGIODYS7KAazwqXYoADm
         vVdYud4oxdyMI8mSMAp7B1I1GJu2PzM6oITVBUfY1B6S5XYuExLSIIQg3Ij8Renq/rxy
         tyzv7kiTH7j8otIZFX1IfaEeclwB1E/mJ0dpBzywnAkEO+UzIk5QbDHKFPIL3HFmtZdB
         lbKaYFUyCghRLvjEAcQgQ7EpVqFKVfX1lCfLlv9ACXCpgOpVeWL9c4NSkhAz1emRcE8z
         1gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692905775; x=1693510575;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wIorNWdyOim0Yl5+/O6guxDVdvD8pw8pKxbm7dcdPQ=;
        b=O3dX/LIdd+vvtF+7K4xj9zZlK1XL4qj02ii3L9rVsJb9hxaDej77rZpfef97U7aLQf
         edJQ7BE5pyUle3WB4tRKd2IA9FLI3EVCwBo3KGsJYNX3+1zc8uKbSVmanS9ODGvLgsEK
         5T03cwKmrhjs1eKLW2oS27BfIPI7QB6j/tC1Lm27eAnYBe1DbPhTKnRUYWEOXz8gy0eq
         CtnCdZTtxRvJJIXjxCVjCldjKzoQKhfdNTxV12ju62vDL+FyKm8PfwBfgFm9oMwEOUZv
         dBp2FNr5k5ifbQp8HkuE/MZ0E/pFE2k2nXsPRJOJmBpAHKh1OXHfRz1OikyPd0szc4s1
         IJlQ==
X-Gm-Message-State: AOJu0YxKf8sYZsguT621ctWW8Hu5rfZpWXOGT+svQIR+nUhPparLvI5D
	CVWwuMJBvamglulMuS2FME4KpQ==
X-Google-Smtp-Source: AGHT+IFVrj1OzIkyNOoOCKQZ7jaR0afgTplscsaJzR2zemPpPXyzwEEXtz71kxOpimuVRf4ZW2UdOA==
X-Received: by 2002:a17:902:f80d:b0:1c0:c1ed:70c9 with SMTP id ix13-20020a170902f80d00b001c0c1ed70c9mr3100816plb.12.1692905774791;
        Thu, 24 Aug 2023 12:36:14 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v4-20020a170902b7c400b001b8a3dd5a4asm24040plz.283.2023.08.24.12.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 12:36:13 -0700 (PDT)
Date: Thu, 24 Aug 2023 12:36:13 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Aug 2023 12:36:08 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
In-Reply-To: <20230824-wimp-unvocal-c27df1798ae8@spud>
CC: xingmingzheng@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
  guoren@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev, stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-72b1a20e-8bab-42f2-9a30-40f86038bba5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_123619_267954_03BA7BD3 
X-CRM114-Status: GOOD (  13.55  )
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

On Thu, 24 Aug 2023 12:25:36 PDT (-0700), Conor Dooley wrote:
> On Fri, Aug 25, 2023 at 03:08:52AM +0800, Mingzheng Xing wrote:
>> When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
>> the following error occurs:
>> 
>>   Assembler messages:
>>   Error: cannot find default versions of the ISA extension `zicsr'
>>   Error: cannot find default versions of the ISA extension `zifencei'
>> 
>> The above error originated from this commit of binutils[0], which has been
>> resolved and backported by GCC-12.1.0[1] and GCC-11.3.0[2].
>> 
>> So fix this by change the GCC version in
>> CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC to GCC-11.3.0.
>> 
>> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f0bae2552db1dd4f1995608fbf6648fcee4e9e0c [0]
>> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca2bbb88f999f4d3cc40e89bc1aba712505dd598 [1]
>> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671 [2]
>> Fixes: ca09f772ccca ("riscv: Handle zicsr/zifencei issue between gcc and binutils")
>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
>
> Closes: https://lore.kernel.org/all/20230823-captive-abdomen-befd942a4a73@wendy/
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks.  I queued this up into staging, it's building -- so is Linus' 
master, so it might take a bit to get through everything.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
