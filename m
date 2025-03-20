Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A31C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlIYO2p4d1Kwnt3f8afImQtP9aXnaXfmws0liKPc1JQ=; b=U6LtC7WIS5T8AB
	CIMDHQrczJROYszdW5yy/wd+HsUn+U1PDvumToob8XfaAtQbNVgnDTuSnfov4O0cgLVA+xb6J823/
	cxzRQjjqxWKZEhE9U22ffMGh9UNp1oFOUxe7CVLTVCtMKik30UAIrLF3f8WHkVuw7iajeMQ4ku3/p
	G0N4Qz/UeE6aiQMzrCAL3zTfWNAWq/pytisiym8O9yiVqDsD2JhqMxkCMF/qjtStQrxZz40ZSOCo6
	IozMt0EniQwKbCzD8iB94VT+8i1hBtW8FOE3fcuhxiP7YKx30+bH+qDNgiWwoGWtQfjE75XrVbVYX
	YPEtSMW5yd1BHOyWQF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBnU-0000000BdMg-0CDt;
	Thu, 20 Mar 2025 09:02:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvBnR-0000000BdLR-0r0d
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 09:02:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso4486455e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742461356; x=1743066156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72uAcvX5/rJRkialBraZlcCWh3cO7qq403Dc9iTXm5o=;
        b=DYrQvESLrqfQ2WjXXbZ25ZL3KJlkplwo4ab5TSo0Mza50eYZb5Q31OkCXvE54hWNHx
         W7weR81el/jUbb3w/7SPQYfyrPWaE9KyF6bCx/UeSUoR8lJEzpeRfdZp29pB4ZrcoTQe
         DJBXAdpoalhz5ijEG8EoAJFLvdjae9ZQEM778F0NJjPyk47gr38y/LX8ct5masEJmJVg
         TrrtcPTFg8mFOABfflaUewBsG/n8W9DxBPcK6wEj9VRw/xGGINynjL8T0VR4omkzoc1+
         T1rP9PbU/I+uusSiDklTIkXqj6oeLjos8eryqVLtYzXjVDRQd/hHTVSCreuBZJvYpzhp
         b/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742461356; x=1743066156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72uAcvX5/rJRkialBraZlcCWh3cO7qq403Dc9iTXm5o=;
        b=gez4eI0C+QzrSo6HaqBxN+2cDnNvg/4f/CucanyMBA79UVlR9v7lGe+wqnYWA90JYR
         zCfTw9dMQuCwZJhmjni3UH40xVaLNY3sdwi5SF7RO6rTNbqHWYGfoRVK+/QHWi226vK1
         PIx/+6FXL0HxsCWKyMPsW6cxMk/vraiYj5Whei1JO7C9AcvsdDqFBJcmwZE13S31r5XN
         h+htxse/DvVGZBrl3fsgG+6WQi89JFMaCa+Z4U/0ujui8f911iIM+qTwCY9rnP4ioHIV
         HY8uz/PH94eif3917OfwakDbup16nAUsFQGeB3fcOdPrER6+yqgw8Ya09y7JIE0H4OSj
         5veg==
X-Forwarded-Encrypted: i=1; AJvYcCWVXec9G4l7wPQVAitWC3QSUrznj/ktpV5eNDCj3T8vRPdvrPjjI/Pwu2A+iwNlFR0ggQFeAul27TKMeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu+rbdhR82QHZXxdLsJjG07nV/83KCgKUoIa+Ukvzw4SJNaCJ/
	XdffK9TXXMMfKO7d1+wvgusQtW45yZSZUD69ct1PWy3RiFOOzzVY4TpYxd/46w4=
X-Gm-Gg: ASbGnct+JFCDov5cEkpAOUfZOXmT94JRGliqz9rt2Qk+sPNIEnEOPgTzhWnEPbLPcH8
	TKvtX/NeffyVfarY3tmmFvG33ScukN3CRSjhRPFD892JEzsPxlNM5GwmW9rwsjz0tVllmXN65ME
	Z/JXtCCroXb7XMJ79dQ7GlPBQeb8hs5dtnieNZX7aiX4eCqaOE2KiM5yiiJzdR4Trn9zZ4RPcB0
	Kb+5OkHXiAGiEbCeteJKtM3uBabKejWAvIOgEMFwZ8UhrWSN92v0VhLDaB5pm2k8a22tsZP0e/R
	WRDuoOmIci1dpBW+E4qLlUfogc2pTCs2
X-Google-Smtp-Source: AGHT+IGEgBOjhueRBJQDOOD+YjPfNJuNtGPXMADUyLrPBgDpdIBjVWb7iZ7LsyjAfh/7UNsZ+oLmUA==
X-Received: by 2002:a05:6000:1565:b0:391:122c:8b2 with SMTP id ffacd0b85a97d-399795ae3a9mr2247824f8f.31.1742461355604;
        Thu, 20 Mar 2025 02:02:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df413esm22708633f8f.20.2025.03.20.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 02:02:34 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:02:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Pasha Bouzarjomehri <pasha@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/2] riscv: Move nop definition to insn-def.h
Message-ID: <20250320-25d2b6edb008a666151b786f@orel>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-1-745b31a11d65@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-runtime_const_riscv-v10-1-745b31a11d65@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_020237_241749_EA9912F9 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, Mar 19, 2025 at 11:35:19AM -0700, Charlie Jenkins wrote:
> We have duplicated the definition of the nop instruction in ftrace.h and
> in jump_label.c. Move this definition into the generic file insn-def.h
> so that they can share the definition with each other and with future
> files.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/ftrace.h   | 1 -
>  arch/riscv/include/asm/insn-def.h | 3 +++
>  arch/riscv/kernel/ftrace.c        | 6 +++---
>  arch/riscv/kernel/jump_label.c    | 4 ++--
>  4 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
