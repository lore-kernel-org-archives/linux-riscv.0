Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDCFC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdPW8/GHJrPvPsEgEE6nhZSr9PsICcs8eEOnDWLCyc8=; b=GMcqYJOD9XvIly
	R1XYx1JhhzKEIXdu/51QeYD3PBGE2MvxExJSfHuKjmOURmSVvRrSOngXePqVj8BOeRCnsg0CkEX3n
	JI31Zhxo01WY0zwDtMqHr/TT2Pfx8cA2/1dxS27wOcZyoDpBc/Ro/6ErvoC6mU/zTb1kNXG29jQIo
	wQ/wpjY5riRJPmDopSqVmM2C3Qs4toEcNwvHJssJjvoT9tGVNVxkP0JF9JJc00JSHqbFid44kmFIS
	6nC5u6doyJikKnwR/cB8yFUuKp+mzr0a+v51NJd4qOZParWz7gB4Y62hdnl25LI/vZCDqlcTKvL+A
	fMrRUgVgctIxW+Z97cPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1priHI-004QzC-0Q;
	Wed, 26 Apr 2023 16:46:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1priHF-004QyT-1O
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 16:45:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a667067275so58412175ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682527556; x=1685119556;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yatjVq4XJpKuYfqw9iU5Uu3id4cVfMvHZW+dyEQj7X4=;
        b=ROPYuwymJIXdKR2mNFiFbms7bF34DxQulcyPoD2s8ls+l6DB2FjVlZvO7u5GF9MPuQ
         cdFwxm/1Wdzy7TIPTZ69Wr+YgUHOotkVJ7lnAfWkJ+f+59O5mxxR14YA5dVdOLDcas7l
         VrI6xsoMmtJ5Pv5IDSUJMq66LuSfXGyLRS8Qnv97ZkKXvzCn2wsVN9nRn1cVtoxSSXiT
         e0t5pUo4xzsce/7smaQtXT2frKjr1syw+iTOxFq/frawwnHjPZD+orX6kCf+XxBV2eN3
         1w+aG0j+ES+k3qrwnew12cvsaYLIY7zrqWLSFckf6BVWDB/+mI8M3pzDq0G5ogsIjjQk
         UAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682527556; x=1685119556;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yatjVq4XJpKuYfqw9iU5Uu3id4cVfMvHZW+dyEQj7X4=;
        b=jLfhcCYwjtH2s/qFKT4LoTguycdXhxpHbzMGFiCOx3YPtk/6kaiaEUrN69+N7dqv2n
         CTP/k8/OHG9E05rjuqfOeOnXRtZgWFeyVDKYozloXdeiBPEcf47kCeFJuFmPvlGnLYkM
         RSpxLQo72EVYMhZtudIdrYgV14xWSET/kqDocd6LBP9XrZnfY4xX7d7KQ8js40wKYWAv
         fAHM+yVCDIzL3/zRQtuw4uTENXPvZ8BDnnimFOqM6nfjxXVjxPFWbZ2lttPzJk8JlGAV
         XdLAkIvE3hKPS7gGxJ1xXCd5CP8zTer9zMDH2MaASNxxkhEzKRO3MQ9hCYbZ+yZUiwkp
         oSfQ==
X-Gm-Message-State: AAQBX9cTWsKDLIZKUsY6n2ShZCy6bqMfAwnAPHQf1HiV/jFxjJS4yg9T
	50s85CBevP/QRFZcGMlmlZ4Zdw==
X-Google-Smtp-Source: AKy350aLlCXNGnDpwf2/bJmKJLs42syuWY18ObpLSP7pw47h7IOSJhgDcejLVqj4h9oiMCZCX1X0WQ==
X-Received: by 2002:a17:902:fb86:b0:1a5:4ff:33c0 with SMTP id lg6-20020a170902fb8600b001a504ff33c0mr18747856plb.12.1682527556692;
        Wed, 26 Apr 2023 09:45:56 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ab8200b001a0448731c2sm10176955plr.47.2023.04.26.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 09:45:56 -0700 (PDT)
In-Reply-To: <20230424092313.178699-1-alexghiti@rivosinc.com>
References: <20230424092313.178699-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v10 0/1] riscv: Allow to downgrade paging mode from the
 command line
Message-Id: <168252462351.26895.11552045445752621188.b4-ty@rivosinc.com>
Date: Wed, 26 Apr 2023 08:57:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
  Ard Biesheuvel <ardb@kernel.org>, =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_094557_687106_EA501E8B 
X-CRM114-Status: UNSURE (   9.02  )
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


On Mon, 24 Apr 2023 11:23:12 +0200, Alexandre Ghiti wrote:
> his new version gets rid of the limitation that prevented KASAN kernels
> to use the newly introduced parameters.
> 
> While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
> avoid relocating the kernel twice for KASLR"): it allows to use the fdt
> functions very early in the boot process with KASAN enabled by simply
> compiling a new version of those functions without instrumentation.
> 
> [...]

Applied, thanks!

[1/1] riscv: Allow to downgrade paging mode from the command line
      https://git.kernel.org/palmer/c/26e7aacb83df

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
