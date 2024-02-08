Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30331C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 01:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=saxljR+Sl3GRCV3VhMC7EXHRC9RVf+iEZlzH4p/JMUc=; b=cGfLYrVRnPMpsV
	2dcmrVipsWDVJqCuPgqE8k63blhU83ida3OGWDGDcThANwf6fPb9NF7Fw5Oa5zIczbleNzwyc2ywB
	XDqQf9PgVoB3B+BA3lSod4G+1C/zNAFQ2rFC/aNyINlH17/pTHwyK9OB+2WslQAaF9Ww9BElzvfex
	BZXU5RQRzkncCvY5xbsXZswH5hv7FioapfJ1cgS1iT/qqtDJeSOlydX8taBx8KUX5u92gYX/xy7LT
	7keWiNMoX+SPdcO9pD3GZ+pCfHVEpykVqbsWuMmnVc/EpQP4fZpNh+avwUNNgzSJANXQCmzmEgxTR
	kXq1GDUWTipxPh2qCUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtBN-0000000CNqw-2knu;
	Thu, 08 Feb 2024 01:26:29 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXtBL-0000000CNqZ-1e7a
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 01:26:28 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bbb4806f67so906537b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 17:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707355586; x=1707960386;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+sMWjkrvn254ZBwpCLOdzMUBS2BcELxfGOsGSPNqxM=;
        b=mMmnZKo9BsW8S06QilH6oIit0MoZ9J2yLHEL6KygFt0pvkZYDAlUerIoKARVVHBI4C
         uEgDItEbpY8hTxmK1c/XLgr1SXMNlcKQy7OFO1RG5PMSU1gBdC/rMs3FaGls1eVo+9LN
         eoeshbDg/zZL1DADR9wuyPwxHdfq10lhx8BYAojLO2RtHT4i7rbTNnniUlzZ+dLe5cin
         aLfG0Qi4cAGb+K5HXJJ1bMxQK+yDyu5kFz4OlY+2plEaLL7Q3i/ajImgm3bqsJebCmTZ
         GkoCRbysgr35Q9pNQ6qGQYDpTKP0PBwK6qkLGhiM3hlabJ+AhwZLsR+fiUSzVdCjohT1
         VB6A==
X-Forwarded-Encrypted: i=1; AJvYcCWynZ96SdXi8QMkr23SaXVJooIIOrkEyxwlxAXHEfaHpkw8cyBBmQNVdIWGWo1pAqkc9Q1vLF0lZSlrH6sEsNm6c2kZdimPy05sFM6pnAku
X-Gm-Message-State: AOJu0YzpjDfunIgHQZR+8PWWD2gBq/ymWoNG8mtM2STrRmidmgImebln
	j9iwN7k9mqtCcaXgshV1WB+6iH5ePWtY972Yq76wMa1I9fZbZF33
X-Google-Smtp-Source: AGHT+IFzzMXQx7kYJ1+CJC5KcZeIoTI5ev4Xhf5fdJtlHRRVWNpAd1dWrRW3hCFcX2Ko6jGY/EPW4Q==
X-Received: by 2002:a05:6808:14c2:b0:3bf:baf5:851b with SMTP id f2-20020a05680814c200b003bfbaf5851bmr8505794oiw.8.1707355585851;
        Wed, 07 Feb 2024 17:26:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJLgXTCopez17dUHy7qqoXJn6ZMBfHsjX4nk5JgzgQW8c1txS4Q1NKtRuzcrfuLbuS1o2VF20umFTTC/YWql881R59vDrs8hQhy3dF8w7J51ve4W3Vj4INK4glrbkY/3qpRA9rmypryGLWx2J65qY0l8xzn7zFdCfHV32O3oJiAWBmnsWifRX4A65uil93Buj4hxkeHJ4O6c3MJnPtDD9uL6/HBhdwHPi8+uCZ56pd9bmXqJ9Bqpfoy0fn
Received: from snowbird (136-25-84-117.cab.webpass.net. [136.25.84.117])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b006da96503d9fsm2340336pfo.109.2024.02.07.17.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 17:26:25 -0800 (PST)
Date: Wed, 7 Feb 2024 17:26:22 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] percpu changes for v6.8-rc4
Message-ID: <ZcQtvkrWhIkRVfS9@snowbird>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_172627_458337_F897D5B2 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi Linus,

The PR to enable the percpu page allocator had a tlb flush parameter
mixup of end vs size.. This contains the fix.

Thanks,
Dennis

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dennis/percpu.git tags/percpu-for-6.8-rc4

for you to fetch changes up to ebd4acc0cbeae9efea15993b11b05bd32942f3f0:

  riscv: Fix wrong size passed to local_flush_tlb_range_asid() (2024-01-29 00:53:19 -0800)

----------------------------------------------------------------
percpu:
 - fix riscv wrong size passed to local_flush_tlb_range_asid()

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix wrong size passed to local_flush_tlb_range_asid()

 arch/riscv/mm/tlbflush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
