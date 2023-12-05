Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F45C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJDjF8RSX2nUpnpV1pM25iNRtDSHTkY5qEhIayGxvVI=; b=NKQDYWU1TmSbjo
	Zr78mTpN6G/qSbo9RQkAD6abgXGSv+3DQ2F5BA7xmHmG6JcbXhOBps5yklBObPVvMbrlP07GyHYE4
	p5taJPa5DPqpM29QZYyFj4HwR5ETjJNRMAb/lx9bLH7OVruewpZnRZqrF0xvK4N+ZPS7oNy1HMtsl
	esBmnU5vlSjv4AGk7Lm+NrmDxNOd4ZaVeSZ0zvGZLqDejJOiZaHBlxVmsGQM0IHLXspMDDA6rHnet
	MPH9fM+56TL+kdzg43hMMLGaFxq7ms6qUCKbkMUV5Ympch22h/gJf3jNjARXTNyLoqQxT3e+7GF07
	H2KNsawjGvZXHaEJ8r9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQyj-006gPx-0W;
	Tue, 05 Dec 2023 08:40:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQye-006gPM-38
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 08:40:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d03fb57b69so23395535ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 00:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701765620; x=1702370420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcOt9kZ7JwOzYfmxC1M3J+r83lE9sNFYqBWrLheYTEI=;
        b=JAlXCgW7aaMeXDRR7rSC+VmqZDkQnaP3XFuVTrCPKBuqUgB7ivncyBXwSJ8fWmb3KC
         syQk/4+Lq45PRcPUNmN4XDgzHoT77r4/tW1WZcM9PK9urCNvfs2ZtwfIf3MAvD7kyZyI
         Pjftf2VTfJOLU1TT8Ehtu2mcev6df/wwE/aBWzLwq1eSlLdXMfRE3Tdv3yHUqCcoaTLI
         FtQvGNMwshJ9mnmnow/hac/a/V/uAC0Jy5ctESRskj/OsxsD9mfx5dLi+pSG8pMPw5mi
         V+xQwK4hQRElQsE5zDxad1nevPo8naizL/Kjb4nDKdJDRduM42tc1+0BHzw1UiZXhGJI
         R3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701765620; x=1702370420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcOt9kZ7JwOzYfmxC1M3J+r83lE9sNFYqBWrLheYTEI=;
        b=gIRweaIveUoPbjpnIkRfuKIYZ21FUrvTUKPKBd6zr4wLmiuPuTfrp6PpTUoR3UMg1b
         g2FrA45OjihppbgL1CDlkfbFKaFl+Zt3MKLjAp5RIevUJwAq1iANsbFIMMApj6k/aQo8
         uq3FWkqfhfmrcrWS9zvMzeYt51uPbZNA3shZBrfHhkqCmazieBlBQulZZ8X3yOGnYqGt
         H+HxkZMKPCK9PIak6y4kFbCTfxBXcn1hc2ORsmMG/xB+wdTiCKXMnAhyQJ3XSM2/Wa9z
         aMVtmEGeSRjZi9PQwrbptfD49hPYqSsqMHhHaLlLomrmx/Q6bgJlYZeScpuuHFoYSBP6
         ec5Q==
X-Gm-Message-State: AOJu0YzYIvH87m90ktAlanlmv/zcDkdym+VCYSrW8OubvuC8x1Z5xUxN
	HtMJt8DEHfHeofe9Rl42jLBCbSjBbOmbibpkcZc=
X-Google-Smtp-Source: AGHT+IHmnuPSA5vDhvTN2q7m76YrUL9IBN13qxkP8NbJPkMPDB5t7fk1kexsJFn//w1XFxKTXX4Idw==
X-Received: by 2002:a17:902:ec8f:b0:1d0:6ffd:6e55 with SMTP id x15-20020a170902ec8f00b001d06ffd6e55mr2466177plg.77.1701765620061;
        Tue, 05 Dec 2023 00:40:20 -0800 (PST)
Received: from DESKTOP-4R0U3NR.siflower.com ([2a09:bac5:6249:183c::26a:82])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f54e00b001cfd2cb1907sm2998238plf.206.2023.12.05.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 00:40:19 -0800 (PST)
From: Qingfang DENG <dqfext@gmail.com>
To: 
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Date: Tue,  5 Dec 2023 16:39:24 +0800
Message-Id: <20231205083924.48933-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203135753.1575-2-jszhang@kernel.org>
References: <20231203135753.1575-2-jszhang@kernel.org> <20231203135753.1575-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_004025_033643_6058E748 
X-CRM114-Status: UNSURE (   4.60  )
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

Hi,

You may as well remove the -mstrict-align CFLAGS in the Makefile, if
this option is enabled:

--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -108,7 +108,9 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 # unaligned accesses.  While unaligned accesses are explicitly allowed in the
 # RISC-V ISA, they're emulated by machine mode traps on all extant
 # architectures.  It's faster to have GCC emit only aligned accesses.
+ifneq ($(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS),y)
 KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
+endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
 prepare: stack_protector_prepare
-- 

- Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
