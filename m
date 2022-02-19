Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF47C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 00:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPnlCbSz8PG9pvwLqjm2SfZeavcZ5uCc4GMgWn7fchM=; b=c6VhqkT6hmcYXd
	rhAOmTE/2LnHHYWVGEZs1BTy8UWVT44fDgLKGcRTvNvSCpnzFHMMfVXK9b7r86M3v6E5igiIX3ena
	JHE6oz6LLkijbT7q81ms9kHT/nJLDM2snJGBZsHnA5lyPJrkh3a6Ag1WBqEPIHH5ibgKb0lpzgK3B
	DxX1fIWh9aiANERCyeLIhZTFsrhHVbapgbNcbPZnlprc5wvETTcwaxbasoMWzSP7Tezr7IGdYflKZ
	9j+TtquC6eJqPQr+Yna+Jz8oin8OpLm3Aa3VACCqgpgqOcpWjfbFsl6JDWgPMTaqNFPEWIesrHGQD
	reYS83Q8TB8+lduzWjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLDuF-00G0IZ-DA; Sat, 19 Feb 2022 00:47:23 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLDu9-00G0GU-Tc
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 00:47:19 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 u17-20020a056830231100b005ad13358af9so3073086ote.11
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 16:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7d4QHjy8919ZRO4h3tQp6Y7b0B32ou2+EpX+fwfcw0=;
 b=H5zVwRUMuUl8xTvBteU92vszT+9z+34Em7K2/0F2cVdhe0MoDgAQaqvP3mHRucqsWp
 rA2/izndo3IyBWZRwfiyt0nMsK9oCF3q/PDCTZ7m461ySLC+BRbsXVJ9vvSpevCmys17
 BzedNLS9HgvioOxo3gTMvDW2TcYNY36UzgBtLV3f/A4qqW9ootmfEk5ecFf2IikTXC25
 jTy96vlOIVJATC/ScT1HAhMvCVCEa3lw98zuuu13suvXTaUaL7XtLrr4VhmnDWGqvkr2
 v0UcTqFs/ZAKjUbYY8Zslth24mIZs8u+vkQdhNF5Ot51dvdpjOAwQpmfwo1WZX3o7XfK
 4YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7d4QHjy8919ZRO4h3tQp6Y7b0B32ou2+EpX+fwfcw0=;
 b=tqEg5uWSWEhAY+I8q3U6iYU+CAk/dGvDrz7ZNJ2FEvF30kFl2VR6OucWMpzGfxFLWv
 qZQn59LgZlYMK3zZ9DiJI0O51IXYkondH5Rt5h/i6X1eCjxUzdEBgLgc1yMNXpAuQeCB
 Fa/kkMS2rXmte1qYNaWyTlU9ldz9pzoM7CvkBA5xPvr2nHPe79GL001dHOand4wNSUNZ
 JxnzJlcAGF2A0KRSqArmjlVm2Rc7b9DfU1OX2WthV21YapaDrUi8WbB4JuoWJ7spo444
 WKu3H2A06Ydo7K+8aEvW8E9S2pc1Ywpj3mJ7PK7W1afhetn9TH1/KKMJwFLTjkbO9kpg
 4kmQ==
X-Gm-Message-State: AOAM532jbdV6F5oTdgeFUzy58bELgv2PsitPGlI37SYd7/cEZwM+VKbm
 DI6daXd7ToQl2RsnLOO4jC2ZVA==
X-Google-Smtp-Source: ABdhPJz6BmwRNZxitWawKhsyA+xW3K3g0bNI73vzKxIaOxa8TFDi5IWy52wKfsY2ar7Rhy8z+SQNqw==
X-Received: by 2002:a05:6830:43a9:b0:5a4:9dbb:645d with SMTP id
 s41-20020a05683043a900b005a49dbb645dmr3244988otv.138.1645231637078; 
 Fri, 18 Feb 2022 16:47:17 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n11sm11360794oal.1.2022.02.18.16.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:47:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [v6 2/9] RISC-V: Add CSR encodings for all HPMCOUNTERS
Date: Fri, 18 Feb 2022 16:46:53 -0800
Message-Id: <20220219004700.1973682-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219004700.1973682-1-atishp@rivosinc.com>
References: <20220219004700.1973682-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_164717_979776_03583212 
X-CRM114-Status: UNSURE (   7.39  )
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

From: Atish Patra <atish.patra@wdc.com>

Linux kernel can directly read these counters as the HPMCOUNTERS CSRs are
accessible in S-mode.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ae711692eec9..ce493df11177 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -150,9 +150,67 @@
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01
 #define CSR_INSTRET		0xc02
+#define CSR_HPMCOUNTER3		0xc03
+#define CSR_HPMCOUNTER4		0xc04
+#define CSR_HPMCOUNTER5		0xc05
+#define CSR_HPMCOUNTER6		0xc06
+#define CSR_HPMCOUNTER7		0xc07
+#define CSR_HPMCOUNTER8		0xc08
+#define CSR_HPMCOUNTER9		0xc09
+#define CSR_HPMCOUNTER10	0xc0a
+#define CSR_HPMCOUNTER11	0xc0b
+#define CSR_HPMCOUNTER12	0xc0c
+#define CSR_HPMCOUNTER13	0xc0d
+#define CSR_HPMCOUNTER14	0xc0e
+#define CSR_HPMCOUNTER15	0xc0f
+#define CSR_HPMCOUNTER16	0xc10
+#define CSR_HPMCOUNTER17	0xc11
+#define CSR_HPMCOUNTER18	0xc12
+#define CSR_HPMCOUNTER19	0xc13
+#define CSR_HPMCOUNTER20	0xc14
+#define CSR_HPMCOUNTER21	0xc15
+#define CSR_HPMCOUNTER22	0xc16
+#define CSR_HPMCOUNTER23	0xc17
+#define CSR_HPMCOUNTER24	0xc18
+#define CSR_HPMCOUNTER25	0xc19
+#define CSR_HPMCOUNTER26	0xc1a
+#define CSR_HPMCOUNTER27	0xc1b
+#define CSR_HPMCOUNTER28	0xc1c
+#define CSR_HPMCOUNTER29	0xc1d
+#define CSR_HPMCOUNTER30	0xc1e
+#define CSR_HPMCOUNTER31	0xc1f
 #define CSR_CYCLEH		0xc80
 #define CSR_TIMEH		0xc81
 #define CSR_INSTRETH		0xc82
+#define CSR_HPMCOUNTER3H	0xc83
+#define CSR_HPMCOUNTER4H	0xc84
+#define CSR_HPMCOUNTER5H	0xc85
+#define CSR_HPMCOUNTER6H	0xc86
+#define CSR_HPMCOUNTER7H	0xc87
+#define CSR_HPMCOUNTER8H	0xc88
+#define CSR_HPMCOUNTER9H	0xc89
+#define CSR_HPMCOUNTER10H	0xc8a
+#define CSR_HPMCOUNTER11H	0xc8b
+#define CSR_HPMCOUNTER12H	0xc8c
+#define CSR_HPMCOUNTER13H	0xc8d
+#define CSR_HPMCOUNTER14H	0xc8e
+#define CSR_HPMCOUNTER15H	0xc8f
+#define CSR_HPMCOUNTER16H	0xc90
+#define CSR_HPMCOUNTER17H	0xc91
+#define CSR_HPMCOUNTER18H	0xc92
+#define CSR_HPMCOUNTER19H	0xc93
+#define CSR_HPMCOUNTER20H	0xc94
+#define CSR_HPMCOUNTER21H	0xc95
+#define CSR_HPMCOUNTER22H	0xc96
+#define CSR_HPMCOUNTER23H	0xc97
+#define CSR_HPMCOUNTER24H	0xc98
+#define CSR_HPMCOUNTER25H	0xc99
+#define CSR_HPMCOUNTER26H	0xc9a
+#define CSR_HPMCOUNTER27H	0xc9b
+#define CSR_HPMCOUNTER28H	0xc9c
+#define CSR_HPMCOUNTER29H	0xc9d
+#define CSR_HPMCOUNTER30H	0xc9e
+#define CSR_HPMCOUNTER31H	0xc9f
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
