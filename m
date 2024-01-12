Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760C2C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SIDMdBa7LylM68X58/TQcTYrTNSFIWW8YyHfSfbbkvA=; b=lUsGcF5srqzR71V+iAOoIJzdYC
	vWYPDbU5PQkM9/OK491tBnXbcjVwVlqr0FOOR2yF6/mwuK9jsTof2JXvANRt4pczsKwBNTuLkat6m
	QEKBQlkJvdqHXQOepPmYorCLMTkXeGMcSiT7vbPDJlewHoLvVUanNiXFdhuKPUJnkDC1vSPFzZW+6
	SLKtktlfElxGJa3HfHZzdfC7q3Hazw6uaq9AwYazDReOGJ0GUVViBlKgE7MzsREcKfNlkXSXYVmwj
	MZGUzwkkrcsywrMoR7V3HU1XjLxNCnNXxQ5E7/viAKOa4QUC75bYYxxvPT1uFtFkHb1JHPNBx1oHP
	Avk8Gxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMIn-003bxn-20;
	Fri, 12 Jan 2024 18:30:45 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMIk-003bwp-1i
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 18:30:44 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3bbd6e3795eso5227336b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 10:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705084238; x=1705689038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y9RFKMR0FSPqYNNO9hPu+QHh0esMWSorBv6pzr/qFM=;
        b=BT6f6A/IiIegpkDYDZsA76hkkq/rGJ3y+mWos9ghmfAS6vYW7TiVY8VIQD+yZFnQMg
         SJMjfDFHe2CbfHnYXKOh0MCNMGeU8HjLlNWBWtvM5tqcJCrPLrjgnhNy6Z9r285EUtmp
         DnG4xciCpiM0pUQ9GUjvQa7ZBuOqrjbVpBXaLNJmaXVjfAqygTRKzpWZx4fN+bdndumx
         sQFcwH5OhziN7wrKyay1WiL9V1o0pIjfgM0YN6G+Ss0K4BFyhbK8m3p/H0ZlxJtmGt3e
         yMjTIgDqaMU6qeTsAjmpUfC9vVNXqGgfG1XPNl+ZlNrCLVZYV0Y3IgZgpPu3jUAX17ec
         iffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084238; x=1705689038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y9RFKMR0FSPqYNNO9hPu+QHh0esMWSorBv6pzr/qFM=;
        b=vassR/FTB+DwtkFEFEZkwKlqw7EZEW52SjMBGRH4gBVN4hknzCUB/9Hl1HqwsQtAd3
         nfcAgiY0LIw7UcMIj1E3vkmdDusDm/BdVn6HuVTQHxdM2zff5seA26SShBcuhWYPuykB
         beyAFBmqHg23XNhoipauIboXrSzh3zmVJGC3zFWkJfSEGZOSxaXSuG5cE8wG052CtYsc
         mhDKh4YRUcNgNt+kHWaA2UHYzmmKWaTmNGgL2rnmoQaPwd4IrPWHJMN4gCxB8xNn373E
         2vCkHDCqwtiQdbMvK5svnw9jwJ40EMjX09GaCKm56rUXMPmxcRSmUzOFJVGBhONNokue
         gaBQ==
X-Gm-Message-State: AOJu0YwLH0byGBx+gM8yuEGTCtY4DBTEz1N7hSOGKP+hNwoA2SFjMmsz
	dxb1DGjpA3rVwa0JCBjY7Qn7JdMZSlWfQ0sBtqdtGYcafHY=
X-Google-Smtp-Source: AGHT+IF1BUZm9MFACP928AtwGap6NZre7MHtBSqet5vC3dqPxL0czPLn7Q0DKWE2Rm3d/VpIQYiTIg==
X-Received: by 2002:a05:6808:3a14:b0:3bd:5f84:b599 with SMTP id gr20-20020a0568083a1400b003bd5f84b599mr2083047oib.109.1705084238187;
        Fri, 12 Jan 2024 10:30:38 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id n17-20020a0568080a1100b003bc144dc4f5sm669050oij.1.2024.01.12.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 10:30:37 -0800 (PST)
Date: Fri, 12 Jan 2024 10:30:37 -0800 (PST)
X-Google-Original-Date: Fri, 12 Jan 2024 10:30:23 PST (-0800)
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
In-Reply-To: <170498463783.20080.10723421328706946354.git-patchwork-notify@kernel.org>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  jirislaby@kernel.org, Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com,
  linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com, Greg KH <gregkh@linuxfoundation.org>, nathan@kernel.org
Message-ID: <mhng-2a34d0e2-170f-47a5-a688-ab454a70f06b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_103042_927960_3D53A545 
X-CRM114-Status: GOOD (  18.32  )
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

On Thu, 11 Jan 2024 06:50:37 PST (-0800), patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
>
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
>
> On Fri, 24 Nov 2023 12:39:00 +0530 you wrote:
>> The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
>> SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
>> functions sbi_console_putchar() and sbi_console_getchar().
>> (Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)
>>
>> This series adds support for SBI debug console (DBCN) extension in
>> Linux RISC-V.
>>
>> [...]
>
> Here is the summary with links:
>   - [v5,1/5] RISC-V: Add stubs for sbi_console_putchar/getchar()
>     https://git.kernel.org/riscv/c/f503b167b660
>   - [v5,2/5] RISC-V: Add SBI debug console helper routines
>     https://git.kernel.org/riscv/c/f43fabf444ca
>   - [v5,3/5] tty/serial: Add RISC-V SBI debug console based earlycon
>     https://git.kernel.org/riscv/c/c77bf3607a0f
>   - [v5,4/5] tty: Add SBI debug console support to HVC SBI driver
>     https://git.kernel.org/riscv/c/88ead68e764c
>   - [v5,5/5] RISC-V: Enable SBI based earlycon support
>     https://git.kernel.org/riscv/c/50942ad6ddb5
>
> You are awesome, thank you!

Nathan points out that this has some semantic conflicts with a patch in 
Greg's TTY tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=f32fcbedbe9290565e4eac3fd7c4c451d5478787

So I think the best bet is to wait on Greg's patch to land in Linus' 
tree, and then base a v6 of this patch set on that merged patch.  I'm 
going to drop this one from for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
