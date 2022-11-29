Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38273C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfIYOz2MQAOO8MtwTE/xrOHPRUCwwGDk6m216Y9O/dg=; b=g6XDaJm0S66687
	AJngTmAGxAV/94igMBTwsXx6yG45ne6tyEbRfOeA+zr1Qkq5TqoGSc11lsmh1FyF6acV5SRDZBc05
	Q39yLH4ruzYTjLYAWXsual4o9gYeQBGQWX5FvXBiJxAb+iOw58nf3NqGZed6nY8Ej99Lmb7dbacBH
	YN1WNYWTxywl+eie2FS0v2dXAQeWBDFudTgDCtO9M4qxAZVT9oW4ktwp7ZjIzlsXsdc1haXblUct7
	n0KBDwp/q4X9d7wj2wQecLEY/PISVtJYylAzBAL6JEWqNBmZW+CwrMyp1Dowi/pVqHZlfFlesqRTC
	yGGEqHO2xgb4GC5bM0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozog4-004uux-KV; Tue, 29 Nov 2022 00:40:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozog1-004uu8-HH
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 00:40:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d6so11853468pll.7
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 16:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tsit4tlwMOX7OLaXEWLPn1yxtLp/SKg+N7GuTQ1fWwA=;
        b=VmXH+uk31ZdNwX/cNTPka1aAEVDXQNUPZwrVaAEMj3Y6uZep2GmQe2ifDTyyAcTKES
         u4pLCmzOmdvp7ykaqCNn/q0KFDaTfL8yaPBAfeCHS6DaGLZ7wur36JaO1qPM7W9zX8q1
         bhCHA23BR/xNdNc1NIaiXxNHJg8L31sMvjYnnjttkNau6Y6aZ3QJF1582mCuyZuKOo++
         GaCysIPDnJ91QtUdtVuTSPO1drQT0SPN3A81t0W09cwUmQ2ZxvO1bL0/8ht2EVTT0YFH
         g1k6JZKZEUrsG24X5fjG3MbmjmLRzKjOB/joyQq7DNMAIZBzXMPlnELahd5q8zER7w1Y
         BQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tsit4tlwMOX7OLaXEWLPn1yxtLp/SKg+N7GuTQ1fWwA=;
        b=l5ahC2JoNbzRhm4H4T/L4hybnJHYrxxLN8+AP7Zv6c0F6uke05O3DFrS1FPeOOegga
         hDwd9HtsXQHSjNaLTVxytAki9NvN3stjUSfU4RcDaHiL1S37IxTSHmlkSM3yjRTzTlWa
         nFvimbrVwC0+0utC0mWMQMKrVG7wqFiI5w9tWg4hFt6rPL7f2+1YgzOlA7V3gKUbSSQz
         TR24h41ghVg6waSEiRBOVgezKV07lVTw/ek0hSQ0yxGVr7ez+miwHWgJxMsyPIwKkmQD
         YW9pJgV9X5WiglThB8VAWqhkFS3F+IIELS/59NMqWuxltAn8uZ6kRHooD+34pSEs15ST
         8m/g==
X-Gm-Message-State: ANoB5pn1x/ulwBuzUMekleYkOQvakyKvIboVHxqAxi89DOSV7RSxaXHY
	AAs5JiYl4JGF2kA82Y9wL/+3FQ==
X-Google-Smtp-Source: AA0mqf5quQYZKjwkT4OsKge/2/VlQVCrOwGSdEL14y1KEQ342ret+Y1AyH+R46iv/AysaYS4OUWhvQ==
X-Received: by 2002:a17:90b:4b4a:b0:214:6fc:31cf with SMTP id mi10-20020a17090b4b4a00b0021406fc31cfmr60966051pjb.21.1669682441361;
        Mon, 28 Nov 2022 16:40:41 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001708c4ebbaesm9337622plh.309.2022.11.28.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 16:40:40 -0800 (PST)
In-Reply-To: <20221121133303.1782246-1-alexghiti@rivosinc.com>
References: <20221121133303.1782246-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Sync efi page table's kernel mappings before switching
Message-Id: <166968223551.19322.16657482033494349394.b4-ty@rivosinc.com>
Date: Mon, 28 Nov 2022 16:37:15 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, linux-efi@vger.kernel.org,
  Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_164045_800891_0E767C5F 
X-CRM114-Status: UNSURE (   8.55  )
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

On Mon, 21 Nov 2022 14:33:03 +0100, Alexandre Ghiti wrote:
> The EFI page table is initially created as a copy of the kernel page table.
> With VMAP_STACK enabled, kernel stacks are allocated in the vmalloc area:
> if the stack is allocated in a new PGD (one that was not present at the
> moment of the efi page table creation or not synced in a previous vmalloc
> fault), the kernel will take a trap when switching to the efi page table
> when the vmalloc kernel stack is accessed, resulting in a kernel panic.
> 
> [...]

Applied, thanks!

[1/1] riscv: Sync efi page table's kernel mappings before switching
      https://git.kernel.org/palmer/c/3f105a742725

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
