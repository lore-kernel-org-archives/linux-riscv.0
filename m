Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207EBC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=he8dBxi7MqhHwe4gSA7EMt0IlAewZk00687ZV7kL5dU=; b=yEqrG31yPLD7rH
	rnXr7/xYJKglF/TKgf64yIOXK/pNmZsqG+CPZ0TPn09q9lL3+D4V5YjRHyszPTqRAH+sgCOG9cyaX
	enNlxcwPM5+ZVS/UkEsuKtqt+IkWpdXwCy54L5a4sX2EffNAvaSGbXO9vVlIapAWBwgxWoQiqoBc9
	ohVMG3xiAh9a6lRSEnYoPVEYpo9PcL0OEVD0jiLP5DjZStIn/3ZNnMy0zc5tvroFLf/MPcn7WGzIk
	TUDILssTcQ+LoPC1M9taz8CpfkADq+qZlSBoilpWn0tNUAzMALLsAPcsmelFknhQY4/Pv5I7EImBH
	xBLkeRB4n3S8J7uUZtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGdv-003igJ-2i;
	Thu, 24 Aug 2023 20:09:23 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGdr-003ifI-1h
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 20:09:21 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-56c250ff3d3so953973a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692907755; x=1693512555;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlNoH9tsAWZ0SldGefR6FAWSuRLRThdD42yi99TKKfU=;
        b=OH3KzuiTLU5g8yzLQfaNjiD59oguR/C5ipvGOzdq6Jw0fTsroNKVJ/jVpflLCIOOIs
         vtHAa83pOQ49v9SF5ng4uCjeedkBYiRJE4iCSXWFcpXoKjV6NmiYWnD7lF98GZ/1D9ts
         sSQ57hzTWXC0KU9wjutKHHZMwnXMpuT/2UYUTJlX8QYsYkd/J/GXMEdrE9zISiAMnu7b
         Swd+OMzd3+qmrQ4r5eFXGk1Z9KOHAm32Rjgv8kQaiuKkaxcuaKspipWchZ37cs47+FZG
         3Bi1AZPp9eOiQVlvRL4DrDzaJRVknVI8bkWPLNDw3BKZ9OVUhZGeeu1ULkMeCeHddFSs
         n2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692907755; x=1693512555;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlNoH9tsAWZ0SldGefR6FAWSuRLRThdD42yi99TKKfU=;
        b=WfYq7efk720F1VMRbAKKjV8/Luw6SMaRSqOZa/9rCtF4TVctOYquaHjUFR32gvdhd7
         ODyGPArTfQ6LvqA8OaO4JExFPSbfjSEc2e1xIm6Jxyr4j1qeLzoPZvbDzd5tjnrcokUx
         fGXufq2PTww94IWkFcBmpLdOvgECSjU8Ia9Zttv1BCDvDQAZhd+Cct9ZoGo98B3Rjqst
         aJ2oph+R03tMz/JkcEU4clpPqeAn56IKrJNfsca67wW6RUVKJ3sLtPnxJP6PBscOSzFc
         1OYem3nYjPqiGSTC8jm5ZsChUG4Oga268FMXJmNvtMFb+YWaR/IfN51snp9IyQrTs/7l
         T7Uw==
X-Gm-Message-State: AOJu0YxKY3duP51Fjz0NoEZw8HzSWitN8C7+e+YNj8gEajkNhf/sBRpI
	R/8pv/fG7CLt4/i8vaA1+cLv/sRE+auPQOIuV0k=
X-Google-Smtp-Source: AGHT+IEKaWltppfNI4suM9VIvSKdc0g7hgl/fs7rWO6ltb2yKvkrOc7KPBYTaeNRjtIjn4hqQVth+Q==
X-Received: by 2002:a17:90b:1e02:b0:261:219b:13b3 with SMTP id pg2-20020a17090b1e0200b00261219b13b3mr24852599pjb.16.1692907755489;
        Thu, 24 Aug 2023 13:09:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id gw15-20020a17090b0a4f00b0026f90d7947csm111615pjb.34.2023.08.24.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 13:09:14 -0700 (PDT)
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
References: <20230816155450.26200-1-andy.chiu@sifive.com>
Subject: Re: (subset) [v1, 0/3] riscv: fix ptrace and export VLENB
Message-Id: <169290773184.26503.15412232431483167176.b4-ty@rivosinc.com>
Date: Thu, 24 Aug 2023 13:08:51 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: greentime.hu@sifive.com, bjorn@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_130919_777485_818462A1 
X-CRM114-Status: UNSURE (   8.97  )
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


On Wed, 16 Aug 2023 15:54:47 +0000, Andy Chiu wrote:
> We add a vlenb field in Vector context and save it with the
> riscv_vstate_save() macro. It should not cause performance regression as
> VLENB is a design-time constant and is frequently used by hardware.
> Also, adding this field into the __sc_riscv_v_state may benifit us on a
> future compatibility issue becuse a hardware may have writable VLENB.
> 
> Adding and saving VLENB have an immediate benifit as it gives ptrace a
> better view of the Vector extension and makes it possible to reconstruct
> Vector register files from the dump without doing an additional csr read.
> 
> [...]

Applied, thanks!

[1/3] RISC-V: Remove ptrace support for vectors
      https://git.kernel.org/palmer/c/e3f9324b231a
[2/3] RISC-V: vector: export VLENB csr in __sc_riscv_v_state
      https://git.kernel.org/palmer/c/c35f3aa34509

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
