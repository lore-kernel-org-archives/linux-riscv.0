Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5214EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2mPLUNAXLu+TPv1qik+hLpmEBWRYmoBktqN2t64NWM=; b=P1UOPXugSwZQi8
	/Rqz7PVSROiLRSuYAgpDUf1EY4UZdoo/C/dZSG/vIAaHAlaxD7rmRKsiHU4cD1QirTBO1db+SvvGm
	ctmpyPCp745TdcUWM0kGb+8kPXA5jnGjCHw/JgzgtVMKoZLrfjcRcAgGW4M38ImbsNBriIM85tzWE
	MZFxNWFP2XlIiJXsQEgtxvYiZK9gYwwhtmCKh3q7Z0j4dF+lYJPr9prR9vIvdqjXNlGjFkILjC4O1
	UbouDfIb/0AcA/y1KRROMrHKaTcTIeE0cdSQDLsx8JcM0XrMSCBbgsC6ZN1zgwxIQySTjF403a/zr
	0CRwcIEgLo/MCawj18vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhFO-00DXjX-0J;
	Tue, 04 Jul 2023 14:43:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhFK-00DXi1-29
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 14:43:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b82bf265b2so25971125ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688481793; x=1691073793;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGcW7oLI1s0vo4wt1IRfSf0jPHEzc7qIakaETKyVpvo=;
        b=gyWthEc6uvsPKLWoLTOXftOQidASWcRzFVdlOXIhirQT0ybmABDb0G7mDClH7aWjrS
         eRtn0zxPRh05SAuDjx4Atg2FfW/HhWwFgBtvvyDO6HhObKEW3KZxPfSeFX9CcOCetXXL
         fgVlu9YZouRvuu+CuhoN5bcU2gZoU4qYTynlA0UbXIfMisJpm47efVUcf8nI2mtIhTXf
         Zfe/26BIOdkrSN42rRoN1YQ5fPf8vks/RQG1rT6Edy13UBz4o0TCDsMbBz07rsndiY/L
         22k6vfso0nvUiEKKBTgBNRC0XO4Bda2d7aXe/TF/mS1JfXKSV9nGiyArCciilz/pv0gT
         lhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688481793; x=1691073793;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGcW7oLI1s0vo4wt1IRfSf0jPHEzc7qIakaETKyVpvo=;
        b=BSGyNuVgGl2siMDyNsRam48M7C7/qnqLYQs1B53693F/US7vqAwfEeoTPGg/Z+joh+
         sYaiHSKUNOBLf8heAaI3deznbv926UQT04ltzuphwTYwU2HOSzmfH20wGvYGnUThOBpM
         0xMoA2KfJQWd/yZc2ZxbeerzXMS5w6J3kd5UMuBiZgcOWUpwqNja/m723wzKMH1yBUoK
         pXuWl2d57a90w9gxMEAEHkRriyzftQFfTZWC6rUHtODh8rwZ4U072uv0C+0SsFtYNMub
         J3E15/zOVueEZjbn3N5fBoS0pbhnQBORuK0dQRJsT6+tw9C/8lIJOS5DFcVK4gfW3Jhm
         M9Cg==
X-Gm-Message-State: ABy/qLZv1u8EHNEqoHVIg9CCYSzDwiPoAEGh+7GDQNL4WjA3P0kSnKwd
	7J1lFtCN5A9PVsG1EPhOF1KwgQ==
X-Google-Smtp-Source: APBJJlHr4scqqNYu3T2uIg6Hwi1o269+ggDQfO2PQAYG0F+so0V0wOHeqPj+kS1tKpalwz9WwM+7lw==
X-Received: by 2002:a17:902:c1cd:b0:1ac:7245:ba5a with SMTP id c13-20020a170902c1cd00b001ac7245ba5amr9507217plc.61.1688481793480;
        Tue, 04 Jul 2023 07:43:13 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902744300b001b1c3542f57sm15801048plt.103.2023.07.04.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:43:13 -0700 (PDT)
In-Reply-To: <20230625155416.18629-1-andy.chiu@sifive.com>
References: <20230625155416.18629-1-andy.chiu@sifive.com>
Subject: Re: [PATCH] riscv: vector: only enable interrupts in the first-use
 trap
Message-Id: <168848177505.30061.5255712756135941439.b4-ty@rivosinc.com>
Date: Tue, 04 Jul 2023 07:42:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: greentime.hu@sifive.com, bjorn@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
  Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, =C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
  Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>,
  Richard Henderson <richard.henderson@linaro.org>, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_074314_719729_E21D4BFA 
X-CRM114-Status: UNSURE (   7.06  )
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


On Sun, 25 Jun 2023 15:54:15 +0000, Andy Chiu wrote:
> The function irqentry_exit_to_user_mode() must be called with interrupt
> disabled. The caller of do_trap_insn_illegal() also assumes running
> without interrupts. So, we should turn off interrupts after
> riscv_v_first_use_handler() returns.
> 
> 

Applied, thanks!

[1/1] riscv: vector: only enable interrupts in the first-use trap
      https://git.kernel.org/palmer/c/26c38cd802c9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
