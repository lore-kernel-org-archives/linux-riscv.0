Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABD606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O13V/zhQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QPCJ4S6n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hcftUrS8eeRUCMwTkzlnKlu3kCHVyp4yeQTp3ouvvX4=; b=O13V/zhQMyk/sKDC/w0NP2Cmc1
	IuufKDyc56fachTaRakGajEmu6EsEWEXQkHH+HVs3i8rrIFx+vTG2ErounQzqlJqK0winrLCNr6k7
	idHHUjFmCnD03l2OFNALL67xnEJ7ko+iAo0nSBboeazM+NAMixD71nBp28jhEOnjlCbCqXb0zLmak
	lEGT4os56QxF43BCYB/Z9x1oLwZmeVmpxxzCQsp+Bhd+FPeOXGHxmkMEJCbG9dl/Uk/W8zbQq1YS4
	3ZX03pdGa1QnFU1+OKjxsGz9qT6r6CxYbQEqGj4SqfWTzn2GEVNOIdegf/HqJP8E/QTCRTCVHbJZR
	x5lXQsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9jY-00000001HyC-2yaX;
	Sun, 22 Nov 2026 15:44:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9jU-00000001HxU-3NQG
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 15:44:02 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2061542f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 07:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795362238; x=1795967038; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=QPCJ4S6ndq3AkH8ljg5uSDZj12Lom8D/IrApKPpO3ZFw0yOO2i5sz0I7rXy0g4LV6s
         LJ2pY3i1q+Dn4x15GYyuc7Oyb6IJ6ErMcPA+IoJGMxNYaL2Vkh2F7d9Ui4r2/T8htZt9
         /qh8nEesuu/NHDJzHaOIbrs+oqw2d/DxO5oOv99MBOdknJ6irVLqU047ht789/FCGMx2
         m94dNQdhuHp/AZX2FidXVPYCpbiXpS9io/hYh8L9jWa0B1ywgkiKPCDHGHNJNKuis8tQ
         qyvlb4U6NxjOx83AGlVgZClP7njekQNk9pcMVhMUIIH/kzIDcScMLn+H8Q5sT+rGa1or
         ZTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362238; x=1795967038;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GuOEghrFkpLs2B/T6fa1CzO0Yst8Aztd6pT+6L1xBU=;
        b=pBdWTM67rUDUBmDBDMEjNPnl/6WClMHJinVED3ugs4C2wg2H2zE5Uq5noeY9C8RJvf
         18MBvJl8VEQJxkk1ovZ/HRyRjkfpLzHC3/y/kukK6S7bwB7uP7at6B5EtzRV+n+JLP/7
         5/YrTsyKF3bWWgwRWorw75ORPTXozucNqs3cPFwXqCyWGr2JgnzCF8U397mL9ULP3iQU
         Ok0c492+XuHotGxSM2VbPk51OCeLxxSBOe9j1y7BdBu56kUzf0v8MYbwERQGqcVb58oB
         i//Mg7oDO7g9rHheO0OJ3Iifw+TZAKswVJjKbMiD4Uhwzn5+2E+CexpF/h08FbY54DKD
         zlxg==
X-Forwarded-Encrypted: i=1; AL+hErHa7808BWttJVwHGFtr9PScMIJlQ573YvC+aVn7NFb3LCgeFFLaSXrZGgoYJwdu57n81aKnVZG2Nmb96Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/6qBbM+8p1QwFSRg/uZWJucONPBua7MRQoyV9tWTLElV8rYpTt
	fGpxHmwECSL1ie9gKzzm7XJzDzNE/dok0gmwUngtfWTwb6QdMkvn5SffvSIxp30C3Z4=
X-Gm-Gg: AZFdTZehUTXk0OXOXcp3SMvb53u4cAXyZn95JcXIbKc3FDnOOER4uWW5jFhjOD/Zls6
	2EmWxLfPdLRdW7hHLMj0Q7/xqf7S5Bez+iPeTplUl3wrWO0p4tiDWwtWUZiotobPLxdm64x88fP
	kb8D4+nEYCH0E1CZSrseTowaxxYu7Jvdl0ODxwtnvNHUpDh7SLMVJ/eNJIz+E8E5cGA3QDPOywC
	3Y2yJ1G0aQNuW5tJqNgPb+k5dTfz9UNfCrd+zEKo+q4Knymv5BMJMPjNXXvJz9is582VsjRufRk
	O9PucEkkbJ2qP4g0URazv/GVWgRZT56EQx3r2FH3OhK49fGl1Yo8rH8aDSr+aHhpExG2rgW1sEs
	QFi0vsqdElEwwIYhbi8bwhfBHaMWf+9KV44k/OyNKWTQ4R6mA8Xqw+XMIpTmHA2Gfiyp+A4cKVU
	K7Y6iahrXX3itW/5Uxh8WydgPfBlSK37/zqlIx8LEcB4pJbx5EQw0BTa5k5L6FdKH9mH3wY4Szf
	AEJrou1iih3LDvNUKBYGrIrKAu+ZdgLsnj7rSqjYWI5BAc0UUGusnMKhW5eAoQMTLRO5mhqjsvp
	RAQNKgK8fyjD0FOnEvG6FdEIjOnUgMMQmp/rjQtVuxAN8ssp
X-Received: by 2002:a05:600c:3f0a:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb8880cde7mr182572615e9.22.1795362238621;
        Sun, 22 Nov 2026 07:43:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm129786485e9.3.2026.11.22.07.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:43:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261118100523.11395-2-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
 <20261118100523.11395-2-changhuang.liang@starfivetech.com>
Date: Sun, 22 Nov 2026 16:43:54 +0100
Message-Id: <179536223421.2728475.2551074975231928125.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=416; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qf7fKlC7xQ5OvM7XPpMsjo0fjKrbdU4orK1COOHrhak=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNnMvHsqQm4XN/ZYbtt4xPoXk4RTR6/I4nABFSO7pWpPE
 1c9Us7vKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwESWH2b4H6i5IWbTi+a+3ocn
 UzdoicyytWfgM/3r4Gcps1W75b8tB8P/mub8vdGWJkIF8dJHN+wU7023DPlsHnpU/aLS1X9Zgi/
 4AQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_074400_878419_451C37EC 
X-CRM114-Status: UNSURE (   6.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> auxiliary_device_init() returns an error before device_initialize() is
> called, so the release callback never runs on this path and the rdev
> allocated in jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")

sashiko is right about this tag, this needs fixing

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
