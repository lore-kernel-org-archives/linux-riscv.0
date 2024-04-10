Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E22BCD1284
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 23:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fe1iBiDi6fNylXuw3288pc75njPCq3h/rPh2m0G1UwQ=; b=zTOY0S3z96IikA
	3awDpIXUnI3IeKlL1sDvZ5f4+Z8UcmIjY79ASz9XZRXgzs1BlqASHlrxJokiqsDRVrUgKrfAeOPSJ
	t3gEIRNXcznu7z6p71dPpkDMuwzR4eYaCDdHDA1+jbY8Hbz9dOCocece6Z7FilcqtxFRRfhhpIiiO
	R9jnjUwtnH+dWb9lWnERe4xU2QMJEsMrn2zHg9vXPw1x6eerkPMlNSZtk+JyQUUJvC3QEv8v/A2dt
	9QLNMSfDOy2JYE9uQZw8B/jT7GDsYWQ4Fo5ZLrJQ/IBaimlCwNihIsqQr0ei7PdYcVG5yYYQqT8cU
	T2K5kwlIO7097vaiKr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGj-00000009QWc-2LBA;
	Wed, 10 Apr 2024 23:22:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGg-00000009QUh-1M78
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 23:22:15 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2a2474f2595so5880987a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712791333; x=1713396133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trgevhbBq0+TDj0d1Dc0cXDGsMQZyk7EvY7tkc5hFNs=;
        b=bNN3nC6GWLNo3rbwT/I+2mfsawZuC/UPGD7OCqahZe34vz7/glohHDPItw1/Ac10Hc
         DHhJE1Uag3LJL1vq1t33OyAOdc04k096g8zs8w88OYvLI2+tHZlS9+5exvfTZ4X6z4JV
         4KBoH6be26Ka+/JMtezG2ZEWCVzhh0IQZIHnqSoWJAKGKmUMXz0wliIwDxMpdhqSacSZ
         +5VZyHZyOgSJ/Pb6G6FYB+QlNAJAh5tMp4NwfhoNQZRQGQ7uzgf/ERK63gWAR3/drEoh
         8kVeCaSljdzXSujugEfBMSMUP+8ucUnCzZWkppjFunb5MA9Is+dzu6LqifcsGsvgiXoE
         3GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712791333; x=1713396133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trgevhbBq0+TDj0d1Dc0cXDGsMQZyk7EvY7tkc5hFNs=;
        b=u8j2aVJk3AI4OqfHES1TFGNOMVb4kmYIX+vOkycDJEMOchXO0RsCcnMy/wXmvi+RK6
         N9qPDBnAvKE3Qp2sxbm9WD+PeutMH3pENeE4KXQIjWjhtqltMbsvkpfhOZuuiiQbHonc
         Qtg0mV2ITs6G/mv1ow3GcndofG+qdAGf4NUB70AzKZop5HsFTyNurmhG/P10XcYfF95P
         dIxEDSEGGKwVhDydHJ0RsyH5dfmWF3wfBYFIdL4OUy8bfBzqzA0Qt+I4nqH0/WpBRTfy
         cRmXUIwL9NJhi0dDkEnqGAt0v3PHM6vqos8vEaSGRrajUe8GnUWZYfgE0ZeRNqkVzhPl
         fbpA==
X-Forwarded-Encrypted: i=1; AJvYcCXqhcYNyTWeV7CpBTBYY+ip7D6gv39JRiUxdjQS/FGvISgVIfF2vFe/rbmJ3dqG4xMtL69ZYH18z/Vhc5KtTgmK7kpQB9iKiG8xpLQTe5e3
X-Gm-Message-State: AOJu0YxlJmbM4v0TSOTnUPE7Fa1Be41SHC/XW2dhHYWCOD7wARM272x2
	oYt5YRl8wQsq6fXWys3xeEWpw0HBF8FCdK9mdx+wND32NrWA5RiDPiaO+wi3U7k7r6qgEJFkgTF
	g
X-Google-Smtp-Source: AGHT+IHfuR5nYBeXCUVKf9eL8sfLmNp+gibcSRtdISaY0xcurdTfWsmMzXnjiiylmF14OyqViiGbIA==
X-Received: by 2002:a17:90a:43c3:b0:2a1:f586:d203 with SMTP id r61-20020a17090a43c300b002a1f586d203mr3576465pjg.41.1712791332987;
        Wed, 10 Apr 2024 16:22:12 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm161865pjq.40.2024.04.10.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:22:12 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] cache: sifive_ccache: Auxiliary device support
Date: Wed, 10 Apr 2024 16:22:02 -0700
Message-ID: <20240410232211.438277-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_162214_562235_133462E2 
X-CRM114-Status: UNSURE (   9.98  )
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

As of commit c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a
platform driver"), the cache subsystem binds a platform driver to the
Composable Cache's DT node. This prevents the perf subsystem from doing
the same for the new PMU driver[1]. To allow using both drivers at the
same time without conflicts or module linkage dependencies, attach the
PMU driver to the auxiliary device bus. While at it, prepare to use the
auxiliary device bus for the EDAC driver as well, which significantly
simplifies that driver. The actual EDAC driver conversion has to wait
another development cycle to avoid dependencies between git trees.

[1]: https://lore.kernel.org/linux-riscv/20240216000837.1868917-3-samuel.holland@sifive.com/


Samuel Holland (4):
  cache: sifive_ccache: Silence unused variable warning
  cache: sifive_ccache: Use of_iomap() helper
  cache: sifive_ccache: Export base address for child drivers
  cache: sifive_ccache: Add EDAC and PMU as auxiliary devices

 drivers/cache/Kconfig              |  1 +
 drivers/cache/sifive_ccache.c      | 94 +++++++++++++++++++++---------
 include/soc/sifive/sifive_ccache.h |  8 +++
 3 files changed, 74 insertions(+), 29 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
