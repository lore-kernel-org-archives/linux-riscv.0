Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D3606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ae+aUtEH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmC8g2Wm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dMTRe1LVZIMUvAvMVseJXzYzmjtiGpAmcRIB0VEmE9M=; b=ae+aUtEHwNJ4NBpd1jFOIM8knT
	7WwflyEnJ0STNFW1Ps/l2s4Vj+sc/b2kW/IUuOODHPr5K4TfKy98XFDwO90jFhSEEwJZsB7VJDZU6
	xoFaN2kruVkL4mgYcqL/oV9WM0K5IJBnGZKUl2bt5PhSWC4rlKNy2ENADeroZeGhufW1g5KIteiSP
	fzNZDJE9Wn0J89eQfbSDxsqXL07tVKC83qREJ3QgxBKq5ifTLeF4UjMx5ZEQJjOg1EIjj5VJa0RgI
	pj830R2Oi0KS/JhstORInf1TsEBNcDjX3jqyDHhCAAf57qWgBNDUFrvND09iA6O6BvwgMQKe7+Au2
	76oPkGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyiW-0000000H2rr-1DVh;
	Fri, 27 Nov 2026 16:22:32 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyiT-0000000H2r2-0UMC
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 16:22:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso2506773a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 08:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795796546; cv=none;
        d=google.com; s=arc-20260327;
        b=qPwfrwDIf2weOUFREKai3cksWdW5Sv1RE8gfEvCBkXR1BiO4zZGybC/Z98pt8NXPeb
         Zg1gx1EFBdviIyxdrmKoxvm0aX38/2HLDZy72sgrMH1g2AHdQTZH4IRyL6hYWcQBsROH
         6MVYBeUIj9QCqilI1YsQhevmYHwjkLMSJaJQRm/A1rrZ66JGavdbuL4yPx+4Aga6yYLi
         CibOP9NJNnMZ2E249Gfb/t0Yu+jlF9jGzqQifrovKl5o3XFBtCjCFsxp9dAMyvzjaE8+
         zST0iWKHmlycNL/rBoG7gvbPX5pNh3M9dpof1OB6P4NWdcwpg9F3405rc9QjUBSX+/Xx
         MaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        fh=/Vsq1moYgqu75nweW3tIgY6lruVHB/eYSMajgqYkDXA=;
        b=ah1xiJvwI7CxLhS2gk4pCEUzfzDUNWclhuZg4UaVCPNpS4YmfVpSMrgnf8mkILXfP+
         kJ/Imajzveag31vUOJprnXllxavfDkAdZ+NGOhyooYpCOlyADVSnydCLmDYqTcE8pa3u
         FkN8q0tThAI8SVbYaqxJ8rl53Lw7tr6a7tjHFfX4ddqdBK0K16/Yt2ti8EWT+dEvI3kV
         Y1n8psuc8TmB4IxQN/eT9kRa787J4j72FZy3z4VnQA/9RW+SjWr2lBcDBpcxDDeccmiS
         igXvfbaPpUqPX4VROuoGxrKWlRILQ/B0HI8SG+pkm9ztzUfcK077rKEW+zmKmsAF+f/T
         T+Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796546; x=1796401346; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=nmC8g2WmFIDTWYBB48KBJdZXoDbBbdTQ3U5jgUjg/BPwLc/DpK+Dz+tU6jKpa0kwwu
         KO+KtfaYkBJhZTBSQ5XwqiI+Lt0VZ8McV5nTK3ArCSO6UhWD6By6nRg7I9MwQ3BT5qZW
         evZmusiSuHAfqV8HYyZBEmzK5zIXpKY5H5eG1BXmNn+Mo/BiHm3ZFn8xrrrU2hvRMFYi
         y7NtPyeFBdQEEebTyGVcrInxyjXia5bfzTy9owaFW8QB+4Ip9t1y4o+cmIsdebm7dxsE
         ELyjQCIgzKB7sX/rHDboQKN8d9Sl1WH+GvHWxdhfThqIUAq64exhVt/T5mJM44rgX+YU
         cSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796546; x=1796401346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGF7E8bL6eqxE+DsS5vMeqDfnm+UP74XOc2nxISqzRc=;
        b=ktMZRTNAoPMynNlpUaVZK/GsUm2PEgeavU5klzUyx8wI5xlsHgTxChOLe3v6jXhXUh
         264cO67qZ6uKcg1guzNesWZNSFMlk2+aIC0Vv7EoVvOqo9/veOl+Y26riogzgBzhsyPd
         JxKbgJyJOmGroPbAaoLLuquXkfT1YZoDlshTsyqMigOvaIxQTljrd/HpQGbvlX7ujoQ3
         YeLIs8WTIvTE7tJ0AaOVpqVc+xLSl7wJ/HV9n/NuXJdEpDZrJDiTaTSIMbvhYeAgbkmP
         kAMjZWmWqxPdsDjJvCozNGviuc1UEmjbXgXirWd2i4Rp5MKpRmBows3dbBRqOtNDckWJ
         ZpYA==
X-Forwarded-Encrypted: i=1; AL+hErFQgHYrziT+tDnE6IZM6CEtjF0t5mjBALEjebDAme2APQUdARXGcPnrtnNJHSsUIle8bNDPRSYt/k57jA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/fqTyqvn6uq9L276UdxWYnTlhO6PHtI3lWB3gOAu2rFu0MpxlM
	L/CFkok6Y/uXSWKgVM2cNEA4jWoGCX4NBYsGHW6GF1lKQcF2nP2bRXTiRgNJURDG5IyqkFQQ/0c
	w8TUfsqJEjaPBVUqm4BdInNfuL614sepfYQ==
X-Gm-Gg: AZFdTZfu+Mq+J49yrlmFtZ1suVZIGIUebYZLkvnsqVB+NTXZUzO1BwJ31xc1Kyj2jWu
	dqR/TJovi28hPCLei0QETXuQknJca5ZjhrrhhYUb6dsIYzHpT5A4Ih6z6rE73M/oy+uDUrVb+MV
	lPRpOx/hNfPl9IlohIbMcXY1bzRu31+xks9SrD2ewnA6gjbnZu0nH0a7EBjUoBhHB5329BzhV/2
	w5+rmYIR/BUvn3P6JdauMPnhFPcxC9c2DUvDmmIq+jmrK21X8Qzl90cnFrNu2TFpiTnR2WS8XXn
	GGqLuoKH7CHIEbdKOoBpZXtqqYovK85RI0ZEMZa3w2ue4HLXCcLYNiWlvt150KS2pLaP+WS2KhU
	oYVIOWBPZOq5LqC3ywyQRv+gQAh1ko+30Vyk=
X-Received: by 2002:a05:6402:a307:b0:6b8:7f14:dded with SMTP id
 4fb4d7f45d1cf-6ba37ea7705mr14055793a12.34.1795796546329; Fri, 27 Nov 2026
 08:22:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 27 Nov 2026 21:52:10 +0530
X-Gm-Features: Aa3M54qbxpABrphlzhxg9I2Mo9h5VFuq3p0P6kC8_azVaeYz0HCPXkRvM1DueFo
Message-ID: <CANAwSgTFJDGT5pR=Pv0v4RSWqTZ9q6YeP14TANRUrBrg6Be_oA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_082229_516095_F6A4FD60 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On Wed, 25 Nov 2026 at 07:54, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> The SpacemiT K1 and K3 SoCs have APB timers that run independently of
> the CPU cores. Each timer block has three 32-bit up counters, and each
> counter has three match comparators and its own interrupt. A counter
> can be clocked from the functional clock or from the 32.768 kHz clock,
> and can run in free-running or periodic mode.
>
> This series uses counter 0 as a oneshot clockevent. It is registered
> for tick broadcast, so it can wake up CPUs whose local RISC-V timer
> stops in idle.
>
> K3 uses the same register interface as K1 and falls back to the K1
> compatible. Both SoCs run the timer from a 1 MHz functional clock.
>
Tested on a Banana Pi BPI-F3.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
