Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0073EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FBsaZ2fR2pxBaH2519K/jzngpMfYsZKWp07734xEnE=; b=3Lab5FOOgLGkK6
	dr1DP4rofpu/Bd+/voRT0Woi4CrGSfiSSvt51X4ewXO/LPDkTAVZNQViRyZmcUxsG6qywCSLGDEXK
	slkvZAMoqIoxR99MkMAN8+I6Fn4TT6wMCsclmf3TBjXvrPL8ry8udIKNBhOaFRq5bZRl7YAtsq5X1
	b1gXdrM+XuwUsE0uJLiB3EOI+NZFhNp0d5X5zLudaBVS/UsKjBVPZrRTL3KV6y8xTPU5xjpJwT9Nr
	50caIziiFyOGzAzPgwD4dkiIP8eQzUNPaGagqLE4bpBHDrVyfpz2FigD8lferdCw3j2Ud9iXqIoSX
	sNdvrJaxhWk9plHJhlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0N-008ttu-35;
	Sun, 25 Jun 2023 23:18:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0J-008trj-2c
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:18:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b8054180acso3193365ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735126; x=1690327126;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueNNjA6xOq7R8vflJ6M84ysKmaKYGoUOlWGuUp2U7kg=;
        b=zVB34HH6vSl2dU7Xc8ZYOhxtiXTvWBG0fU27eYP+hSf70c/mcydaHwf4DNJMky0I+o
         6lJtSoVcnQaAFWdPIL0EXG0RCzP4AqqyIkAx7ENaVNYz6ZlcYF0lvqKJjRqR6fhbVzPx
         L+pBAr1LgG2s9NG7ItokMW6aO8kTqRCpX6dlNDV+R1+EUAee6+VBOK+oK/jpluKDNi60
         w6n8rRD4F/GdDqGfycj+ux9vLqeo7uLd6LYBYBm3s4POK5LtQrUkPtn+513WwLO0qBeC
         kAvYUfrU2uz4d4XR2bt/rayduT5Zv93EPMd6fF77FoBhNeptFT3hqj4EEfMiJt6NV6m/
         RSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735126; x=1690327126;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueNNjA6xOq7R8vflJ6M84ysKmaKYGoUOlWGuUp2U7kg=;
        b=lpq3TlKGPk/o0py/t7wvX+TT/bLBiA9CIZRrZbKfDCAu4qLeBnhdVtNAf7Z6+qcRIO
         Lt6+OuWiEOX/Am3I4tFkG9FNLFXFi3jFyeFaoncmhOYAbx5TkV7iMorEFbs1uW+gpkyG
         ldhP/8x/FBVU4wbYxGzOKe4v3/3kpUE3ZhNdLdy5nZcyFvpiyOvHBsgdETXuXHpHxmyp
         oMD7xhiFMZWBOaeP5RUbRMQzo8p1LaebgAQgwOcsZ6vN/VFL7zAW1N75a5woXK+63XMu
         cA2j/rcrNKq1gV8weuOvaFoG/IJi3N4CZ6NQ15svA63tgJivfyr0B6jU5boj5sSkngMl
         VtfA==
X-Gm-Message-State: AC+VfDzK4d3Bl1ILDKXraLBJ9sJPFnRZghavUkeYU9R0SMX1kLdoUmOl
	OxKkCvDLLonAz6pkhWvGszgFWQ==
X-Google-Smtp-Source: ACHHUZ4v8/2X/gpQXDywoE+B/iQdyrkCgRFN3DrwQrG9PuSuJO18SnoChqC1pC7ippUd6YpnI6gXGQ==
X-Received: by 2002:a17:903:2444:b0:1b7:e355:d1ea with SMTP id l4-20020a170903244400b001b7e355d1eamr6441113pls.24.1687735126268;
        Sun, 25 Jun 2023 16:18:46 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b001b558c37f91sm2831341plh.288.2023.06.25.16.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:18:45 -0700 (PDT)
In-Reply-To: <20230505072058.1049732-1-v.v.mitrofanov@yadro.com>
References: <20230505072058.1049732-1-v.v.mitrofanov@yadro.com>
Subject: Re: [PATCH v3 1/1] perf: RISC-V: Limit the number of counters
 returned from SBI
Message-Id: <168773507352.1389.2672044920046049803.b4-ty@rivosinc.com>
Date: Sun, 25 Jun 2023 16:17:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux@yadro.com, Andrew Jones <ajones@ventanamicro.com>,
  Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_161848_101014_C61717A6 
X-CRM114-Status: UNSURE (   8.64  )
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


On Fri, 05 May 2023 07:20:57 +0000, Viacheslav Mitrofanov wrote:
> Perf gets the number of supported counters from SBI. If it happens that
> the number of returned counters more than RISCV_MAX_COUNTERS the code
> trusts it. It does not lead to an immediate problem but can potentially
> lead to it. Prevent getting more than RISCV_MAX_COUNTERS from SBI.
> 
> 

Applied, thanks!

[1/1] perf: RISC-V: Limit the number of counters returned from SBI
      https://git.kernel.org/palmer/c/ee95b88d71b9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
