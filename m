Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB12C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48ga0EXfSFAesDdfLIWYzWA+59eQF0HyJtkm0jr0d9c=; b=BtttuS9OKgCLGd
	4cUvIcp73auHvRupufI7lC2iWjcqQqWFfIxZxh0D7JHAy99ZydklwVJVfCU7fv9qdBX8hhdFDTgkd
	zuRJbSvUY4/o3PQFdr4ROzhqXm9xTJ9w/xaArMuFi5W84SNl6pfFbTVECamIOoF0OU8ufYmDCu8Og
	ume9y/s0m+M4F1+nkMbgh3o8iuu5FMeD8IAoTl+ZQ/DyKJznmdicg8AMNILdQGqlmqtAmRCySOqV3
	QHfyvvnMG4C2/p889Z2TsK/4z+KbmM0fxao1rDL52o5352ZydFoidssiNEH9+D67lmAkihXdrVSvx
	R4V8YOnTw+RjFPjWERQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7RX-00AaUX-4w; Wed, 01 Feb 2023 07:22:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7RU-00AaTO-6e
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 07:22:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id m2so12577340plg.4
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5amrPi0ca5+SKsqiXkMIYJy52ckgRLFOkHmllRTMEz4=;
        b=Q0SV3vi0yfdWEVsqnN0zDmQo0EqKcPcbjpnwBu7G8rkbhnKeB5L8Zy0a4qTYl+jy54
         1YlMEDXgguElT4cm4nASqmJlJmkDLqu1Eu1mL0EMn3j1eTIGqQ04FjTkQoBo3HxnqktG
         61qm5u2YR/8UeFNj9D3m79aBcQ68mYiaNLy+ICfKsa2L7n+Ow7shCvvwV7wtp+wPZq5d
         ueg9x3D441DtzleYbD+vdjdcTT17Mto5dnGWyTYmNCf+qzje5HLkTx3M3j5pwZohfroK
         Iu77QFDfAHshw3fH9nH9Uwtqbh8oZpwAuAMqg4PnOcReP7Vhr7P14WU9xZnWVKJuAF+m
         XFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5amrPi0ca5+SKsqiXkMIYJy52ckgRLFOkHmllRTMEz4=;
        b=zQwFSYefgZp/ONLGg1bN+afixmL76PrQUCJUgw9j8oTYSBKN3ogWdSH7INVCim2mvx
         AulB1X9zI4Keub2HUDjm6Den/i9VJJM5+rnVpAlwGKqFLXHxeai5xrYxaAPPaPjFsjES
         DlT9FBAoBeZD9ctFR6+UyAW/ECbgNRw2UkSb8OgltRm6smhN75NZ/m+LPQqBMDVCR471
         jUQlj9KIksRXyhRg/5+D4avzKI63+oesb4dgO4muzvMoLA6A0J1NZKADlqLXhZz22M+6
         s2+z+lGKav/EE0oFBnpTZayf4l3EjIc6iSJ4Wy+quEH7vVAovHoOdHMzcNrvDL9RP8W6
         GBQQ==
X-Gm-Message-State: AO0yUKVyCGuHL3bZy6THHJ6FAJeBTZoNDCejS9ELCDVDZDMAPZWQQsg0
	YU023DSIbDzmnHZbmgW39nDMoA==
X-Google-Smtp-Source: AK7set+D19QyrJ75BJrk8CMPqFyIqHg9JpGbBw3I2Vn2h8oPRlQqxPpLGNaXfJvt5COJS+yO2SuHBw==
X-Received: by 2002:a05:6a20:840c:b0:bc:7371:e3d1 with SMTP id c12-20020a056a20840c00b000bc7371e3d1mr1804825pzd.45.1675236120262;
        Tue, 31 Jan 2023 23:22:00 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id p4-20020aa78604000000b00592de256f2csm9370789pfn.145.2023.01.31.23.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 23:21:59 -0800 (PST)
In-Reply-To: <20220922060958.44203-1-samuel@sholland.org>
References: <20220922060958.44203-1-samuel@sholland.org>
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Message-Id: <167523607081.29266.3967297527966644183.b4-ty@rivosinc.com>
Date: Tue, 31 Jan 2023 23:21:10 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-kernel@vger.kernel.org, Dao Lu <daolu@rivosinc.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
  Anup Patel <anup@brainfault.org>, Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
  Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Samuel Holland <samuel@sholland.org>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_232204_487965_4A98780A 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

On Thu, 22 Sep 2022 01:09:58 -0500, Samuel Holland wrote:
> commit 8eb060e10185 ("arch/riscv: add Zihintpause support") broke
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE enabled (gcc 11.1.0):
> 
>   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0 probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
      https://git.kernel.org/palmer/c/3c349eacc559

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
