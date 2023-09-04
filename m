Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C5C83F33
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvDj9xENAtW6KOMnt5UggB/i8EnPUfdU7hcSFNpbJYo=; b=P+oR/9tHWkfD0B
	yA5fQgkGSNEkSWAYapc3iABQw7qE5f3sQKgBt5eM7xWt66o/xnSJmkeFUGp7+CqugYjwAoUwgtDde
	3QLjQZLzBOrVkYsmI+wSzU2m74bnC6wr95gNLB1XShSX9l0OMB+zYiWRX7rBEVdpxpdSagZppgvIb
	oui7NfVdu25NHfxHRo+CLcxJq8aZ05BKLtcYIA1dpSNXodtnZBSxIc+8OSFSFk37vVr8051i/6jNs
	tucUPkuRn2BkaaMHDSXXtHHzFB2f3TxbytZWkZ2iMtxk7cY3pxtSJBCMC9cWh8Nm1YiObEabaWhHK
	Cw4a3stSeU8y8S2zv+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy6-004UUb-1e;
	Mon, 04 Sep 2023 17:02:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCy3-004UTJ-1V
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a63b2793ecso245143366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846943; x=1694451743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO9jFtHKdL/VA2yvoAt0QPSgBvoVTbEt9F3nOYbDAaU=;
        b=kvzRCDOl0sTlOMiHSuDYY9QHMYBtHnGJ+a37/NBFcJ9b4JPMiRfyytBT4zNmOR317t
         zvYZpmIGEh8lOEpm/GMEr611KekImwoDQfSEtt4NXRY6aSVeMx/YRCoXJkMpScMQvzJm
         sakbCxpLE921sh3xkbfMtddebEHhiDcGNVQXwKZpXI5yh2tCwmWgYdpMz97kHF0hK9Wu
         TjFgK7C4O2JUqd5Z5zcQA3AhOoTxkf7CnM8foFYZ4Q/EbzrHvirA3xDnbEkpivJk+4Rp
         bQYj9p9WzSQwme9ckzxkciIDS3CQzEasqkpf/ceqMVP+P6lup8x2RyxNDY6YgiBqWJtl
         J6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846943; x=1694451743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FO9jFtHKdL/VA2yvoAt0QPSgBvoVTbEt9F3nOYbDAaU=;
        b=UnfH6NMjBg+FQSnwF8M/fskUmirJXUGevVIXH3NAEh+pze0T/vPAnZzE3c1WPvnE9F
         r3x8g2/f+8v4XZAPSMmp7CxWIWoPj9eKWM//QZ7U3VlUwFZVAKRdytidOLkm87RVRWoG
         yCU2fNOsIUAyTM0JygNZboA7HXpQJe536P/saqZaTbNxr5AzDBrnYsQn+P/qtC9Y26Wu
         7qdiRHsVzg2+az04RqfcmlFqzJ4BUp3015xtlYNd2O7Nls1fpSfAF7SX2nqZgJSXDOCm
         X/5OyyAwau+F17ssvhjKjJwhOla3sG8IfZ+iEZOSlkJNgxoyu887yb5Xy4X9bTwxzB6g
         968g==
X-Gm-Message-State: AOJu0YzTDbSGk7/U/pqIZMp0holdWoFT83n2RDz/wRV7psTIVzOAUCom
	4YN9KSSi7r6REzJa7DL1aoCtfNy803pXtQwqmGfHFQ==
X-Google-Smtp-Source: AGHT+IEqh+lOEteVqr1mxcSe6HBq8evoLRO2PGwCcUGvX5T6213E5HscClEnYUXaE5sSdwQrM2pG3A==
X-Received: by 2002:a17:907:7804:b0:99c:f966:9ea2 with SMTP id la4-20020a170907780400b0099cf9669ea2mr7728089ejc.25.1693846943604;
        Mon, 04 Sep 2023 10:02:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lc25-20020a170906dff900b0099329b3ab67sm6454229ejc.71.2023.09.04.10.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:23 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 1/6] RISC-V: Make zicbom/zicboz errors consistent
Date: Mon,  4 Sep 2023 19:02:22 +0200
Message-ID: <20230904170220.167816-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100227_503034_D0747D0D 
X-CRM114-Status: GOOD (  11.16  )
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

commit c818fea83de4 ("riscv: say disabling zicbom if no or bad
riscv,cbom-block-size found") improved the error messages for
zicbom but zicboz was missed since its patches were in flight
at the same time. Get 'em now.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..f9ac2717bc7d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -93,10 +93,10 @@ static bool riscv_isa_extension_check(int id)
 		return true;
 	case RISCV_ISA_EXT_ZICBOZ:
 		if (!riscv_cboz_block_size) {
-			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
+			pr_err("Zicboz detected in ISA string, disabling as no cboz-block-size found\n");
 			return false;
 		} else if (!is_power_of_2(riscv_cboz_block_size)) {
-			pr_err("cboz-block-size present, but is not a power-of-2\n");
+			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 			return false;
 		}
 		return true;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
