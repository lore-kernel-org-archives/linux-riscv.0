Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6443CC77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHCdEmNaVGYljFEmIcwqJbctPCwpaQFOpzNE2MrOMCM=; b=bYCqLkFeA81fGx
	iecLXyNjS1oZ11InlYZhqbMX5xw8CznCPcH5k+fedRe5XD0ZkRutmbDPMQQwr+6RUvPlqUn1xUcmu
	g0HnshqhsbS4mVqMJIy0S1KlFfcqOpxL7wN3Sb+wtMqkvAwxZ3zT3vA8pRQP+PIuzboT69iOhjIz8
	3hCrGSxl7fm6JSi5rrU2eeOPIHI5raJrWcS32T1+6yr1cYMUTlN3qNk9UmkPTNOW7U0mUsaVKyLQ4
	BYdQ2j8G2LY/m0Z59Qxh+6WsYlvoLFD47nc0XIXzO4t3VvjGyll98J72Z3QB/iN7f0MbjA/XnvDFv
	SLxH37RsTNcgtLfsRjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYDD-008ebE-1Y;
	Thu, 20 Apr 2023 17:36:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYD9-008ea3-0R
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 17:36:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63b509fe13eso1035408b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682012205; x=1684604205;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnRCEEUMbL4VHxSaKuZGWLgXCAjCR6wrwzaIjE1iCNc=;
        b=R65bYw0uCjFnuSxJCWbKs3W5rtP8+s5sqP9IWJY2VXqMV3Bw692qEAZMhGcGKa74Dm
         5sS9JGCcN8YHkjMPD7u4bbM8Jgk10We8g7MAc8i8Vd80uKUDCiqijpr0uc40cTejJZ8y
         n9L8MmHQPckBEeKfkFxnlulbIhnoV3C2K5N9O53C03m7twso2qJtWJKyfZYyRek7IC63
         uQluDwqpqgFdhPOt7AUB4P90/PGdC4CfXcW7uZWBeMxOdX4n5p9mrrFXEFq5v3Rfw0GL
         NCDaAfyuvV+vLOhUXCrrctANTzOux6safOuXraVUlS1J/OweSNg+yuC/czBK/vUct7O8
         hqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682012205; x=1684604205;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnRCEEUMbL4VHxSaKuZGWLgXCAjCR6wrwzaIjE1iCNc=;
        b=C9DWLfDRDnDxrmcXrtcP1DVLLPe7RzlN6vq+b+froM+nJwYbNEW//ZcUA3mu8GWQh6
         SLrU7rk55e21faUrhPLh7p7m7Jx8Nb+YXEYnjsfY4Jz+/7nj4/nIpwroj91iVoBknQ8l
         67bhp6ntNb+piwuI7mVRupkbkyVltb/zkso6xxvbjC6iJ4qwn9LZX35oMXI2pwMOBzPf
         n/LFoV2tDLSnN63V9gHx2Y3y4neaz3aAHHe5krpIhJmw4ajm6GQX/n/4hfzM5k71BDbr
         yUQB9RAUmohTIGwZEn8EZuqitcd3Bh3ViWHluasri7Uoc+9Zdcn+BpvbxKxPb4jG6XuA
         KaHg==
X-Gm-Message-State: AAQBX9dqsgcTGxEywkSLvl8tDtxxvycNCFZ9w/YdXMWflvFghKudFSR+
	cP2KgyQf71Wo8OmR1kT0V92xPQ==
X-Google-Smtp-Source: AKy350baT6KGrtGFPNL5kKO3PBM13yh+t73vTItdwumjVN+2TW8bKUrE5c9iopnLCN+wQT6ScUYU2g==
X-Received: by 2002:a05:6a00:1144:b0:63f:120a:1d96 with SMTP id b4-20020a056a00114400b0063f120a1d96mr1084389pfm.11.1682012205312;
        Thu, 20 Apr 2023 10:36:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j16-20020aa783d0000000b0063efe2f3ecdsm1489431pfn.204.2023.04.20.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:36:44 -0700 (PDT)
In-Reply-To: <20230203075232.274282-1-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 0/6] RISC-V kasan rework
Message-Id: <168201218500.13763.4099213624397858271.b4-ty@rivosinc.com>
Date: Thu, 20 Apr 2023 10:36:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
  Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
  Vincenzo Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Conor Dooley <conor@kernel.org>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
  linux-efi@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_103647_172446_B58F8453 
X-CRM114-Status: GOOD (  10.77  )
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


On Fri, 03 Feb 2023 08:52:26 +0100, Alexandre Ghiti wrote:
> As described in patch 2, our current kasan implementation is intricate,
> so I tried to simplify the implementation and mimic what arm64/x86 are
> doing.
> 
> In addition it fixes UEFI bootflow with a kasan kernel and kasan inline
> instrumentation: all kasan configurations were tested on a large ubuntu
> kernel with success with KASAN_KUNIT_TEST and KASAN_MODULE_TEST.
> 
> [...]

Applied, thanks!

[1/6] riscv: Split early and final KASAN population functions
      https://git.kernel.org/palmer/c/cd0334e1c091
[2/6] riscv: Rework kasan population functions
      https://git.kernel.org/palmer/c/96f9d4daf745
[3/6] riscv: Move DTB_EARLY_BASE_VA to the kernel address space
      https://git.kernel.org/palmer/c/401e84488800
[4/6] riscv: Fix EFI stub usage of KASAN instrumented strcmp function
      https://git.kernel.org/palmer/c/617955ca6e27
[5/6] riscv: Fix ptdump when KASAN is enabled
      https://git.kernel.org/palmer/c/ecd7ebaf0b5a
[6/6] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
      https://git.kernel.org/palmer/c/864046c512c2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
