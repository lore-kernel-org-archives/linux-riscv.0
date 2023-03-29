Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF14C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmrnxjutQiW8FvuB2rChVonUIuISlWQ1Ek6puX3kJqs=; b=NgPSWqX9CH07Ug
	j8szNH8nIuvWaRnh0hBzVdRWtHO7kHvG3/Ldg3Eqz555W6BzOZRKSkYj697lObAqbsTDoELulaTBZ
	k8+O75TMT7F0cZSPl8TooZVcu2/SN+SmQFMc1ZlWheaFi4YYXglKhsJPMCABZKXyVmgc/jDoazeKY
	RKJNwUNWDPwwExDtqvw1GBtIcamTqYuo5Al7f1fcAsnEHP5eeA+VoAH6CjqgY4F3nULfoVLa9jNdn
	Ssifr63f2nXUIQl2eVPP1YTkc2c391L/flNaxhPadgVByW/9NnO2oY9qsPG8M+be5X2i9iscfgdjb
	+zkrft1apbNf8nW+m/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNqX-00Gbq9-1v;
	Wed, 29 Mar 2023 04:55:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNqU-00Gbox-00
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:55:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg13-20020a05600c3c8d00b003ef90adc168so998459wmb.5
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=E3Z4Yqhoin1W8r2t+Jyhb4Jqxbb/dLpgY31WgMC/8f4M9Agb0OzJlakAr0drlghh2B
         ZtOOx+SrUI2+Y2A2rSR9cMwIRUMF5pNcTOP1QTN3TGiqltjw5qd92s7SeTRGf1Falocp
         QTJ5ejL81s/SAgZfBKC69BFU2tmVRBauch20G2Y5j6xUaUdlA0SGZopmV6daT6VRNgRI
         IJS+IFtjoBb0K1xT2ifMxLBr8JTiqs+T8R/Rth3HfyOLzpfjohMpDGfFJaDQgExXIBL/
         5H7bEEdsD0Sy58CqDhf7boCxDSJekNe+SKevoFuOkns50ZDd6e9wroN5P47Q03l4x0Sl
         VTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=3LukP/3X25FDaHTwhvfYrmfo3bGevZFsBt10P4o0vOzIpl7qIvxXgT8kWt8lk/36lD
         UGUn9oNj08pztngbwB3z/Echdx2x2vxXd8pGdfJpheq6ST0tz2jVrbJO+DZVChru74Hr
         xiqoCDuW3bs97m9+MeoSqMarQ2203uQJd++h7CotJb4tdGpKZ2K5VZIKUdXSS+9oyp/q
         6ToV6BMMvCxwNP8vPgZ495qopFJlcN2PsXPXBmUxRvUbV51CmtyoaL2rI+xH5LfPxftU
         kx2HIbFzpUW6EOxloeYLOpdIJzCrxeRwhbN8ZMgjuDCNKQ4cKqvtzKfpJiJZ0csDzFbt
         5bbA==
X-Gm-Message-State: AO0yUKVOqzRguMV5GWhFOvXlrVgHqCEy6BjoYYTZb3LuIKjmvTs8cf/l
	pOT9od9HZkwi+nwbMQIWsMz1fw==
X-Google-Smtp-Source: AK7set+5IRHyYxxuib+WjeFew51ry16Zrb5/PPkIgLCKxGSq+H5MoxgqvQV7tTLU4AjobT2NNsYQgQ==
X-Received: by 2002:a7b:cbd2:0:b0:3ee:3e07:5d26 with SMTP id n18-20020a7bcbd2000000b003ee3e075d26mr13763028wmi.24.1680065735865;
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003ee5fa61f45sm840822wmq.3.2023.03.28.21.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
Date: Wed, 29 Mar 2023 06:53:25 +0200
Message-Id: <20230329045329.64565-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215538_037048_BC2B390A 
X-CRM114-Status: GOOD (  10.67  )
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

This is a preparatory patch for relocatable kernels: .rela.dyn should be
in .init but doing so actually produces empty relocations, so this should
be a temporary commit until we find a solution.

This issue was reported here [1].

[1] https://lore.kernel.org/all/4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr/.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1c38294580c0..e05e6df44225 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -96,10 +96,6 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
-	.rela.dyn : {
-		*(.rela*)
-	}
-
 	__init_data_end = .;
 
 	. = ALIGN(8);
@@ -126,6 +122,10 @@ SECTIONS
 		*(.sdata*)
 	}
 
+	.rela.dyn : {
+		*(.rela*)
+	}
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
