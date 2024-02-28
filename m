Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8539C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZBEJe3jc3G6OD/oS+luBZIpk6AKXqKw6kmkWZoB8wU=; b=f8NMfHkCNlGf3q
	fwBMJF5KkLFMi45R2Sg6cz1pLsj8W3deKilpFxjZmdoTrIekG4fmvmgBjkHhdlWcLF88yhzgKY0h5
	IUPJMuNSNE6qgwUATS0x5ogQouwTUviW32lC0z+uKMmlrQFpgUPfknyEFLJGHkI3FNxzLlS142Eio
	yh2sMKsNxh3HD9ST8I6TFv9aj4283APhRlloNrAUNHdpy4BBJY26GYxXY7mcfFKvjbr4rmVAHkYt5
	wqUI3tHu+j8wEUyyErmhca9aN/k5hGNCsexXsl20k2AGWTwEk1KYrgV0oomWz4Qh6g9TNgxpRZW/O
	9dt+X3Qi1qinHt+gGjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO78-0000000AMn7-0xxN;
	Wed, 28 Feb 2024 17:53:06 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO6z-0000000AMkb-2dEg
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 17:53:04 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d275e63590so71358961fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 09:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709142775; x=1709747575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN06uTemIfMB8SobqPuytHQ6Es/YWPqVM45xDKN/b1w=;
        b=iy/PtGNNCEJPsVlwiL2VVUqKp7n6Bd8b1ED4Kl/QpVmX5SlLlvP+JQ3+dgcK9YiOBi
         x50zhwRhnYWo3RCggJrqEtb7CTNbaOGUcCPi/GYX6dv1y/8P/KZOPzDsqfhaWHgaxfUn
         uOpOwzfRruXBLfDpnkKdh2dyTeWpWxc09GpKw8jLAlE35ASIq5b3vyxySW9fLyf6+TXe
         RZBChaldK3mFW1MefRF2qjg9CTjki6FyRIm/dp4iFcAzx6nLr46jFT0PPLda57zYx453
         TpgVPavpBbEJo6z8699iGLuBi2K3cnrWynZHe0gWDXmTxKP8m4CVqyAfXU4t5kSU1yPC
         DDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142775; x=1709747575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN06uTemIfMB8SobqPuytHQ6Es/YWPqVM45xDKN/b1w=;
        b=Tlj4DZxFTyhe/LE1rER9aWaIuPeN0cxX79BIlLlVcMf1PnN8EDtTHjFoScQQ1x815i
         qb28BhWuQLhqAdIWHOwAj8aB/+oGoBmxWRzvSl9SGOa6G93cumwjB43AdqWPYBCTCX0a
         3ECcvAcNAhbzkcKGbzCD+4Reo6KpbedbaLXXgh+cWSdwLf7V5btPucc3ncwBTrcNWdBK
         7SncO91OEL/frRohflgFVMwVQST1XMCcAa5dGp/TV97ZEZWECqzkGG03eok9mu8gMIJ/
         02htadSqfpJcGY4vz0pyogxUfE0O5i4H6nBdBpiGaqBsiDjSISJd1SqJK024VHYUDm24
         83nA==
X-Forwarded-Encrypted: i=1; AJvYcCVccBxKwce8Uo6S631tHmt7gRiMOa3q5j8G7D3rmMzzyChS/YwJ+c4t85OzUb6xKM41FlmSd6nopiyxHyXPk5hBNSr/ueEXmGjdFmdpgDLg
X-Gm-Message-State: AOJu0Yyufq3bkFoL2xIVzkfnZBtnsNEqOomYgqLGx1wPJAPZHdLNf0+E
	0lSldUCQI5G8lL+gYZYQpvl5qlsyuRTe/ZFztJn6KkHYAxjQOBbIjKVqLPh12LA=
X-Google-Smtp-Source: AGHT+IETg7kV0bx5myF/NA0zMEyulWLTEzaaIPLLJycmnhfj1WlzWCL3ZxXNKtGoRPlCHLw3VzcB1w==
X-Received: by 2002:a2e:a545:0:b0:2d2:d58b:652a with SMTP id e5-20020a2ea545000000b002d2d58b652amr1724531ljn.21.1709142775497;
        Wed, 28 Feb 2024 09:52:55 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ch12-20020a5d5d0c000000b0033dabeacab2sm15500222wrb.39.2024.02.28.09.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:52:55 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/2] riscv: Remove superfluous smp_mb()
Date: Wed, 28 Feb 2024 18:51:48 +0100
Message-Id: <20240228175149.162646-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228175149.162646-1-alexghiti@rivosinc.com>
References: <20240228175149.162646-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_095301_681275_6E8FF4F6 
X-CRM114-Status: UNSURE (   9.01  )
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

This memory barrier is not needed and not documented so simply remove
it.

Suggested-by: Andrea Parri <andrea@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/patch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 37e87fdcf6a0..0b5c16dfe3f4 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -239,7 +239,6 @@ static int patch_text_cb(void *data)
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
 			cpu_relax();
-		smp_mb();
 	}
 
 	return ret;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
