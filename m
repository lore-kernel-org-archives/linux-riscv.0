Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9B9C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6JjqiWZ5ioro+YctO1Mil2/SnDZen/DoO4MOJbmM/Q=; b=02V8TuyY6GVtIP
	j8mSSHINBI88kyy92BugTKFFlvOb6ueYIPzIq2rAWkKtz1onwG91FpAxVd0AmdwYRVBiPid1ZyZXw
	loHGyrPPDg8rNpbUdPGvHD8HYL1+lTx9RtLjTMVQYp8+TW39WdXD9Hf/uRCgipiBewYzkuus3kHDN
	eYksNrQjWRl+f8y9O+JA6vzPRQuV1H4JtLNVeYh5TEClF9s9ywDKbLrKPmpNPnpYIFLNAA3YSLnSC
	Kwb49MXg3FnVgWptFHOurIEHvyfU37cLYc8Zkd/zKjZmMUPFdssk8vqMp9T67hLgxkx4ihQsroX9g
	AkQl2LexuY4WM9E2hVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR50-0000000AFAF-3oh7;
	Fri, 07 Feb 2025 16:19:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR4y-0000000AF9a-1nna
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:19:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso314948f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945182; x=1739549982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ4ryrichciX+8we7YNspMa7dFxICsmhpnN7TL2Ifkk=;
        b=klyxuL9dOMuQ8NjT6Y3DrUcujvAqaZr0eKpPWXCYUsGkNa8t0nmFwnavmtFvvnTLdv
         qWh/58oCs7dyTsQcG+P8WezwAMobBpk5Itpn8RF6kZN1uBFTtTDJBzzpKfAzlgmkfURr
         k2brk2ZKTqcRTBhYrNRL+M8CYSGTYQDdIuWagXCkeR6BpAh5pLiXmTgk7dTqMwymap+O
         MgrdtN7huopuReFOtBvQFpoXzw+5pyFjh7gpfCmOT9P59kFoCxa4rlsYOL9z4W4LrjsK
         C8Q1WtSOrw1HgAajUVvc5Ngcu6QEIXEVrd2z42QGJnjniujuEMxYiNeHuhRz9dDn445J
         YZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945182; x=1739549982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ4ryrichciX+8we7YNspMa7dFxICsmhpnN7TL2Ifkk=;
        b=bCyRs/eoEoE8EJnktzBBKrWkvg0L1HBtX+zzKzQIGivH0hgaokJQOIJ6Sv2pExqEeK
         UzmTOsWpzNkmMX1VucvbK6pdNW4/SiFovnn+PwgGGJEgwEO/22pLP5jNdmh7exqwmPcJ
         sCX1mgc28keJslseTd3VvUKnEbxxNss+tm5sWha++UfxA6Cogf8Ow9vgkFR8k41+dRI+
         dTr7/1evW6ryk0hsM0a8fLvlBj4gNUc2xqi6ajJwFNk+AWrx9vt9Ln1aJnqjZMoFxDN4
         iS0C+p9kw/4aYsOUPcSUR9S3NwA7yTunSbeYkYGPy3iwnVVbtKZn6R/ua/QSe0j6vk+n
         cZDg==
X-Gm-Message-State: AOJu0Yy4ATdewOqacEJzI1bz4b9PMxtrKQstYf9lL1GZ5lf8V8N+Ru5G
	H13ZZUh0Wxwx8qm14CjCrRsUKSdnenzkFd6qWdeg4HBNbRsLu8xpKIOYxMOIwueZk7BZA9/Jbql
	FKSU=
X-Gm-Gg: ASbGnctmbJzP3sY7r2wyIs4dR4tmJMYSWR3bhS/J4IQZyD9C0za8txM2ZoAuBLHeRZ+
	ih7M8T6fvEc16H0zPchUy7GWhfEcWA62dcmVshGHCn5ULZziM6ODGj0yUNJMYswXPG8qFa19Irh
	7khOJg5GR266NDm1ug12H5Dt34stTxt5x3dcfpwEWrWrmtuboh3bbQhECBOOp7BNBK8jI9S/3uW
	gKnbZldamk1KAs3R/3AdkI/eiAdU/OTMbobuklPHWj0U81ZpXSle2N3//5/gFOFFlnuOYi5s71n
	K7ApnZB10tQNQ11jqaK7EfjV58u7Hf5K6Yd2FgiQBip1dZ5nOtwwXingJg==
X-Google-Smtp-Source: AGHT+IG28/9nHMpwZ9zU27zLY3KJGdyebIQ/wWucUhOF2SL4GzfsWI7hZj8WoUxub6bn6kq2SBD4Aw==
X-Received: by 2002:a5d:47af:0:b0:38b:ed7b:f77d with SMTP id ffacd0b85a97d-38dc937c3b9mr2561178f8f.52.1738945182320;
        Fri, 07 Feb 2025 08:19:42 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm97904245e9.36.2025.02.07.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:41 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
Date: Fri,  7 Feb 2025 17:19:40 +0100
Message-ID: <20250207161939.46139-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_081944_464002_8CB132EA 
X-CRM114-Status: GOOD (  12.19  )
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

The first six patches of this series are fixes and cleanups of the
unaligned access speed probing code. The next two patches introduce
support to skip probing by matching vendor/arch/imp ids and checking a
table for the access speed type. The last patch applies the new skip
support to Ventana harts.

(I'd be happy to split the fixes from the new skip support if we want to
discuss the skip support independently, but I want to base on the fixes
and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
or not at the moment, so I'm just posting together for now in order to
be able to check for my patchwork green lights!)

Thanks,
drew

Andrew Jones (9):
  riscv: Annotate unaligned access init functions
  riscv: Fix riscv_online_cpu_vec
  riscv: Fix check_unaligned_access_all_cpus
  riscv: Change check_unaligned_access_speed_all_cpus to void
  riscv: Fix set up of cpu hotplug callbacks
  riscv: Fix set up of vector cpu hotplug callback
  riscv: Prepare for unaligned access type table lookups
  riscv: Implement check_unaligned_access_table
  riscv: Add Ventana unaligned access table entries

 arch/riscv/include/asm/cpufeature.h        |   4 +-
 arch/riscv/include/asm/vendorid_list.h     |   1 +
 arch/riscv/kernel/traps_misaligned.c       |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c | 278 ++++++++++++++-------
 4 files changed, 200 insertions(+), 97 deletions(-)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
