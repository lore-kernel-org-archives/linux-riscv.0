Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA09CC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 18:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6KdSaP1Fndv3B4BJMK2FeGcG9BpVFN2sP/DP/kEjfI=; b=iZD/84EC8PjosC
	ARyn5d8veai7GjzHteb2b4FFTxNXC0fz7Qdnmlh/WAvC8XvjY6Cz1MAgGVsJCQZK4jqqB+zngwwnL
	TzBIllqZulhxXOGpraBf3W7aiHQWkIUG92RodC3dJulqKZLF191jveH4Wnm4A9kREECSW2HDtCDDE
	QtADfQSW6yaH6hufNNacMPKxn+QcEGyglDR3crPs0Dp+78+k7TAqhjMGmgQr6ue7+/wOpreavoU6u
	tGNR5BuYyYO4tq7cqLrLr4hTZlMeD1KfHyphGWIDidvjbjtkofcUdue4yh9o1BS8arGfLtov48K8M
	yewebIQgvmAirS6dxF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXnw-00H0ac-1b;
	Mon, 31 Jul 2023 18:39:40 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQXnu-00H0ZH-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 18:39:40 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5222bc91838so7204417a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690828773; x=1691433573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeAGwgVyMXcNXeTFVIAMcPWnhWeRTG8FbEAKWB4lruA=;
        b=QXD623Lbsq+bP6iSgF9CXctMwS5P/KiKpYWKe7j23oIM9baaN5RfkgJAUxLwDOqOKy
         cbL9gIWdiD/ZFFvHs9xiC5SC6eKPdrETuDtKpzuwLxEZB3BYvh15LHJ/tBY/Jrr8z+i1
         bT07b9OkoIGk3VmSlKMVIP0jsmOemjLmZuwoT052zYTOsMEzEpaFOqX0jascwtBSwO3E
         Zks+RwHjv9fu1rlkr1rfrBtAk4mQkHD3MhoLR9eY2BuWOWtlhwxaMGn/D/T2x8JFww1O
         bgZwCpowmr5o0tqfjmGR0rMm24AOrLh1IvPY1ps3N7x1iDLosRbGKYg+DnsJKzMM85j9
         WC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690828773; x=1691433573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeAGwgVyMXcNXeTFVIAMcPWnhWeRTG8FbEAKWB4lruA=;
        b=PkLl3Asxh3k+449Z3ln9CTPmkAgq1ogx3EboizPctg6UDxQlzrNhWR4dHRPJ4mYPP4
         QjG53zSqb+z7Nx8CX7fSX00zmPcJwxhkPVlA/jLzW5acFCYwix8KAa0MFeRQeEJperZk
         TV8SAUj4kkRNN9I92tw0etMtzIAUB93jQUMX3DlrU762KUARmlBDJUUyDlLfO7Yz6ind
         1W99hj0AUNJYShVLHZHaDrnIIXzqVQXcgMpLown7kX+kV01v7FYJHqFb0PpkeCgeBlqg
         jE4wmrUpBQb5DJiWz2QsV3ScwjJAUPCI6BEl/bkVUuN6DvWtWKGi4QjhpP7Dzg5dr63P
         20gw==
X-Gm-Message-State: ABy/qLajhOz3a+1JZ1ei+3W42D+fHehtpB6Oisu3KjoNPMlOWU2Kzhd4
	GEv4+eNh7/uuDTX5YeFrn1g=
X-Google-Smtp-Source: APBJJlHqZRzVIf0Z+xYOeJXTN/WJo2hTQPlEBaTRlnHgdOvgxP2YfI82UfOkdY1lriZt1Zq6V9XcRQ==
X-Received: by 2002:aa7:dd13:0:b0:521:7ab6:b95d with SMTP id i19-20020aa7dd13000000b005217ab6b95dmr549698edv.29.1690828773383;
        Mon, 31 Jul 2023 11:39:33 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id c7-20020aa7c747000000b0052237839229sm5772031eds.21.2023.07.31.11.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 11:39:32 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH] riscv: correct riscv_insn_is_c_jr() and riscv_insn_is_c_jalr()
Date: Mon, 31 Jul 2023 20:39:25 +0200
Message-Id: <20230731183925.152145-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_113938_838278_F14581D4 
X-CRM114-Status: UNSURE (   9.53  )
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

The instructions c.jr and c.jalr must have rs1 != 0, but
riscv_insn_is_c_jr() and riscv_insn_is_c_jalr() do not check for this. So,
riscv_insn_is_c_jr() can match a reserved encoding, while
riscv_insn_is_c_jalr() can match the c.ebreak instruction.

Rewrite them with check for rs1 != 0.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/include/asm/insn.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 4e1505cef8aa..fce00400c9bc 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -110,6 +110,7 @@
 #define RVC_INSN_FUNCT4_OPOFF	12
 #define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
 #define RVC_INSN_FUNCT3_OPOFF	13
+#define RVC_INSN_J_RS1_MASK	GENMASK(11, 7)
 #define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
 #define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
 #define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
@@ -245,8 +246,6 @@ __RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
 __RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
 __RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
 __RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
-__RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)
-__RISCV_INSN_FUNCS(c_jalr, RVC_MASK_C_JALR, RVC_MATCH_C_JALR)
 __RISCV_INSN_FUNCS(c_j, RVC_MASK_C_J, RVC_MATCH_C_J)
 __RISCV_INSN_FUNCS(beq, RVG_MASK_BEQ, RVG_MATCH_BEQ)
 __RISCV_INSN_FUNCS(bne, RVG_MASK_BNE, RVG_MATCH_BNE)
@@ -273,6 +272,18 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
 }
 
+static __always_inline bool riscv_insn_is_c_jr(u32 code)
+{
+	return (code & RVC_MASK_C_JR) == RVC_MATCH_C_JR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
+static __always_inline bool riscv_insn_is_c_jalr(u32 code)
+{
+	return (code & RVC_MASK_C_JALR) == RVC_MATCH_C_JALR &&
+	       (code & RVC_INSN_J_RS1_MASK) != 0;
+}
+
 #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
 #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
