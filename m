Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D921C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UloF7ICdSKEwiu4M0+JQ/zxX2Rw6YueidHBQkXT4t00=; b=sHfjTxqh+BQVBA
	TXDZYnZPkAyFYlFP5qlHL07Elkgp5SJNPDWTuuCyDH+sMwqERRMHNoSc0a/o/0vafeWNj7vaFgtQR
	x0HB4bya5ICwEOYeHVNyFuj0V4xkASAu+nPfsc0u1ZcqVVhlYaR0feJ8MPvEznnOqV6K8PxCLKHzx
	1azGeNPDC4Qng+MkwlyxSPyArZgx5IC7tzqQLBJj7XH9ocANsCKZBDlUvKzsMcJFkij7pIBvFLTry
	mnjhosKHiLDF6ms1uOx0CS4K1T+YK5rgFlLKB+s0mlHqKQWbDwbSDj6YOBs413OAwlQJ5QGTRv5OY
	qEJCPbxuVNQ0wAPg9PAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPH-00ExLk-PN; Mon, 12 Dec 2022 11:55:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPC-00ExFd-AP
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:55:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i4-20020a1c3b04000000b003d21f02fbaaso68423wma.4
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORVxgTEs6JpzOw6GBN9FhxtQ86wPto0+KjD/hzl5+jc=;
        b=FhUIaooykKXtLBANwPAkCAIuxGKX2dKoYk3gCD5ZA0y3/EFZdEdTjn8HhzvpzthRg6
         qN9LHky8jlcgciO/gPa79iLFZWkW/aoXcW9Yx+eZ1c97tTNaKV9ZHl9hw+dtlEp+S1u1
         NN/RncC3w3ETjog4XIgSCNpoNJjLzfTNnzqPog3hTycCYsbfL++b4+ub5hPmqJDOW/r3
         2WDmyDff9uSuRzrn5JJ7P4AMqs5pElbIR6FRRPODehzq/8yFM4sOTfgxZvDZpGLBeIQ8
         gIvOH4P4BXdIMTNaC4op/XgEyf8V4tfFUOdFCXrce4LPlT2Khb6VpklTLtLEBSBDE6Hf
         PkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORVxgTEs6JpzOw6GBN9FhxtQ86wPto0+KjD/hzl5+jc=;
        b=jtQMrKnZ5w0fKUj073iP8aoF7mryQBnW+YEePHJbJXdOn9kKs1UCbMvmHd//ubvdkw
         6pBRrQdhE2U49WOlQwWSgRDfbg2JQ5jTpBd4osXcNVlAzwgd6FaVSd//AYuuBm9tDwqS
         YnusmM6j2vlxg8wNRAckGS3heFMht0y8y1KHGOj+bAdxShwhhffnjDQlLmq35UPUR8S3
         M0NhvAvrC2P7ACEzK+f1Cek2zSEmjmoJTrFCfwfaE8NXIF34iZDjHZkfTSjM0zM5+RTv
         oWgj2+tbdcmVZwETnyVMpUeSf14EiWQsQg+oMSwWG3AunJHTZmCW+FsOTQEoP8ED/I3C
         +dVA==
X-Gm-Message-State: ANoB5pn85trhHRcv/eYoq85l++RdIGGjHupkCY4qz4k+Pnpi2iRodh+w
	YKtDpaGb7cgP6iHVbcOHbFA=
X-Google-Smtp-Source: AA0mqf55PhJ6NtCNpEMUlsz4dl16CkPXK2qmYSKBVunL6TyfYUkcG/BLYguDKslRg3csPq/Cl6K6mQ==
X-Received: by 2002:a05:600c:3c96:b0:3cf:8d51:1622 with SMTP id bg22-20020a05600c3c9600b003cf8d511622mr12247840wmb.1.1670846132114;
        Mon, 12 Dec 2022 03:55:32 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:1484:ef11:b25c:4612])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm9793820wmq.41.2022.12.12.03.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:55:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Mon, 12 Dec 2022 11:55:01 +0000
Message-Id: <20221212115505.36770-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_035534_377176_1FFD2466 
X-CRM114-Status: UNSURE (   8.15  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4 -> v5
* Included RB tags

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
