Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616CAC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5NSYZ7IS+e5rauYdpUj/USFhujI71RaXmOijq9r5MIk=; b=kcXKZSJuqerdfW
	kcFNmG/PlPPb+bJJ+R7MnhR1ldt6gH51w4k/vLEfW8ycPIFTkqsrTwZeumeQf94yx5/FWWrpvas/u
	IUKxxkl/GrF4Ua5O6lOwYr7QJqrON5vKhBzUN0WMouGdlYyzONcr/2HCg6IRU72LNqzn3kz8mIw2i
	/dUfTiWJuQmngTKXpieDKe4t/bTCalK7QmvHV6phhRGYHSlHj/9U7APIFAWsaEj5bFZUPcZLrLnko
	iS1Q3966zvnxsGCq5hKAhSxtrYKbVF20Uyv7eaRcZ9zeA2eaHn7kU51c5wQ4999SrZ0QQ6jwAxFmh
	gDZnilPnrZU/sEi7J3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffFk-0000000DSVk-3YcN;
	Thu, 29 Feb 2024 12:11:08 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffFd-0000000DSRm-1v3y
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 12:11:07 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d311081954so3561451fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709208659; x=1709813459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3uSDH9PeEDZXjS7+X8GDOuU6r1LyJ3/UzSH+DzMzHV4=;
        b=S9n1WnnganURmZkFqJ0wzXErcnfYJKjzKOFqCAlgkG5bFFpxSfKdTPWULZkoQbMQfE
         PBDFUFyAZwDdH86qVqUArhLQZo05q2Ylcp8z1q2iCAwq6xusxmRZUQJ0YsYWy/77hkPM
         0dIpci2h7hflpPQkyTvD29N1NdpgUqPxEj3C9DASQ4YvctIt3AQR3GaCoN/1CFzv1HLZ
         2YLJaj8ZMC2MxGgDekdAcDa2naMcbvG206b1m5LbQ0L+dklb8ghZKGPPX+o/73JmLavv
         LTR8iF++hsQTP5EvPeEKVCJskipHSLl/opbDRCKZ7XzrCQ1dcfQEZikPB8496AeetXM0
         OrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208659; x=1709813459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uSDH9PeEDZXjS7+X8GDOuU6r1LyJ3/UzSH+DzMzHV4=;
        b=pDfDPifFhScCOJqlDYn+BHUqrGLyPVIp+nZpSWdjVAEyp+9PNZKThVolCmUWDtQG0T
         ZM+KG0pc3RS6IbVm1BWANTrtWIc3Fus15a1DmlM4kvO46fVCk3PWWXZQhlJ73Rvrva91
         21KAh0jR9UimfSqeWGxcuBCzVFga40LEcONwZ5cR8r0CTFLOVLc9H57DxRf/xR0YKh0A
         E2M3X3g2fCfL5haKTuZcrLlb2nJmG618j6ATB/N+Dj/W9h/9FvYLAF+5YcMHhBTZekZC
         9jO76uQXXW+DQPzG6oef+2OGSNuDpa+dVvc+rafvWZTSIuo4woAMPv5/jB8gstpXUmrx
         XoMw==
X-Forwarded-Encrypted: i=1; AJvYcCX+NScZPepjEgoIU7CaR+igd61q081Yl0SU1n9SMDjBHFfr8htCuQmctg2HFsQ1bu8khkXiyXtxI9qX8zFBnuULKltS8mgSQD+92SDm73zv
X-Gm-Message-State: AOJu0Yw7edshcWCoiVGX+1qhdPuwOSAVtnwYQd+tAPq044Ww6EDFuiU4
	JP2yxUjQEGhSbBLWghEC9Io5RkNvxNYpOGyzbfoMDom9HeBBWlk1kZdbcRnKazE=
X-Google-Smtp-Source: AGHT+IFiP2+0+aXlKLINZxbd8+wcbG7KYr1oKHoklHZdOQh9SVwwVbbn9h4qAc5ttY+lg8ux9QWdxA==
X-Received: by 2002:a05:6512:acc:b0:512:e57d:c9c9 with SMTP id n12-20020a0565120acc00b00512e57dc9c9mr1885133lfu.13.1709208658724;
        Thu, 29 Feb 2024 04:10:58 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i16-20020a5d55d0000000b0033cffd1a302sm1602795wrw.57.2024.02.29.04.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:10:58 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: fix patching with IPI
Date: Thu, 29 Feb 2024 13:10:54 +0100
Message-Id: <20240229121056.203419-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_041101_755498_DED305AC 
X-CRM114-Status: UNSURE (   9.61  )
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

patch 1 removes a useless memory barrier and patch 2 actually fixes the
issue with IPI in the patching code.

Changes in v3:
- Remove wrong cleanup as noted by Samuel
- Enhance comment about usage of release semantics as suggested by
  Andrea
- Add RBs from Andrea

Changes in v2:
- Add patch 1 and then remove the memory barrier from patch 2 as
  suggested by Andrea
- Convert atomic_inc into an atomic_inc with release semantics as
  suggested by Andrea

Alexandre Ghiti (2):
  riscv: Remove superfluous smp_mb()
  riscv: Fix text patching when IPI are used

 arch/riscv/include/asm/patch.h |  1 +
 arch/riscv/kernel/ftrace.c     | 44 ++++++++++++++++++++++++++++++----
 arch/riscv/kernel/patch.c      | 17 +++++++++----
 3 files changed, 53 insertions(+), 9 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
