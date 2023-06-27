Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CFAEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOxy49bXEvsMOaZYkPHxvrU5QnFeIT9HTTwKN+wGbs0=; b=Nn3P0FyWFa4ItS
	H2qwSG9+7TqwOyjyLCuVtVFuqTdJHRrO7lD43EdX7A6z6TWcujg4W45RkqyFcw5uIpqn7awgEFlwN
	tR//M66ogrTh1Sq7gkBwK5ZJq88qWrQHcEqy5B09HXfUcnR34Kwde6fSsV6CkgSAgCp0KuY5tpPUr
	MGalMqm6VLH3qN7ip1KOOGk72wKusb3kUXAe6ITrb8McnEoutlpVzEQxKaO2az6XLqbGOwE0UGO0g
	IG3pDdbeipaIzS999Axtfm9eByNWSf3A4I+hIFB6ZeCoyDnwI8zIMhZIq3oGBU7h/GCTufEE9dEpB
	ow6tPOQQzqv8DsqRL+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9pu-00DOVn-0T;
	Tue, 27 Jun 2023 14:38:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE9pq-00DOU0-0G
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 14:38:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso17336835e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687876702; x=1690468702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cqwTN6sIUXumrJOmGD1wbeLeNPXPgyGv5rJtA8QK80=;
        b=lVWkqo/Ly3Nd4Ai5WR+crT9cgJ4qav4i86tdqVIye5hKo0ZFAJGxMqEllbhZy7HEeX
         MSKuJY20LNoqNAIPikEAWZKdoiARRos0ND2YPzlklSobVOrkGiPwoNvKRst6RRJajqTd
         KYlE1kfdg+ukAFzYpC2w1AWlcCuuGD/buTgueD6ltYzwmqqel4ki6T0M+3KIjgz1ENvr
         D5krsWGNVYqoS6V9EWgrXUPKnk0kUuOIFs0UnIx4WxibaUFfAuFqBONyhXHN0Lz3hLqN
         2pQE9FFkonPmyKeHX6vDB7Ab7U2UxLfGEoTNU1X+pALLJE6fMPqtfRkA2hYr/tlniPjM
         bq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876702; x=1690468702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cqwTN6sIUXumrJOmGD1wbeLeNPXPgyGv5rJtA8QK80=;
        b=fZhACuqE5zeuSXwgQSUVeZyrsaDhrBahHAcOvv2dy+yLDmU3NwzSLeqB+Fo+IgDLs0
         DHH+wn2PoFVJdHlhTKcg+j19KE94okUusyUbs1jjTzVhgP5G8SIm3mil0SXlfNdaDBpW
         czIeYBUNAUMTni8Cu/96Pr/wA1ay86Xm8KQeXOqUA7FZdITY+tO9IQr5zTKv07E4t9E7
         hH5KuMPJq71K7wPH3BQUIeLCJNrfHrmjXYMJLbAsNlX1ns43BhxyBAfKZPAtyXxomptf
         8Xyd8o41SWpbBmYb6j73/akVWK2HalaMCK8r2DFo3zLm0KsIENzJR9LLqUAwKHu3oJ0f
         YosQ==
X-Gm-Message-State: AC+VfDwVhFuJAPR9JpnCCuHL9thEkCB2aW3cphyVTlMRuQ3HS3S+U2kv
	iC0gKryIWsse7PenC/2rueq2iA==
X-Google-Smtp-Source: ACHHUZ7ZbOrmxcAmWb56kwqHz87NDAL0GkQic0otHocuCZkHKWlJ8DTncvjgmx1w1vrakeJBP4LMBA==
X-Received: by 2002:a05:600c:248:b0:3f9:b3b4:4367 with SMTP id 8-20020a05600c024800b003f9b3b44367mr18915902wmj.15.1687876701971;
        Tue, 27 Jun 2023 07:38:21 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm10894793wml.17.2023.06.27.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 07:38:21 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Date: Tue, 27 Jun 2023 16:37:42 +0200
Message-ID: <20230627143747.1599218-2-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627143747.1599218-1-sameo@rivosinc.com>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_073826_119876_A16DEC3C 
X-CRM114-Status: GOOD (  11.17  )
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

This patch parses Zb/Zk related string from DT and
output them in cpuinfo

One thing worth noting is that if DT provides zk,
all zbkb, zbkc, zbkx and zkn, zkr, zkt would be enabled.

Note that zk is a valid extension name and the current
DT binding spec allows this.

This patch also changes the logical id of
existing multi-letter extensions and adds a statement
that instead of logical id compatibility, the order
is needed.

There currently lacks a mechanism to merge them when
producing cpuinfo. Namely if you provide a riscv,isa
"rv64imafdc_zk_zks", the cpuinfo output would be
"rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed
_zksh_zkt"

Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 arch/riscv/include/asm/hwcap.h | 11 +++++++++++
 arch/riscv/kernel/cpu.c        | 11 +++++++++++
 arch/riscv/kernel/cpufeature.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..b80ca6e77088 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,17 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_ZBC		43
+#define RISCV_ISA_EXT_ZBKB		44
+#define RISCV_ISA_EXT_ZBKC		45
+#define RISCV_ISA_EXT_ZBKX		46
+#define RISCV_ISA_EXT_ZKND		47
+#define RISCV_ISA_EXT_ZKNE		48
+#define RISCV_ISA_EXT_ZKNH		49
+#define RISCV_ISA_EXT_ZKR		50
+#define RISCV_ISA_EXT_ZKSED		51
+#define RISCV_ISA_EXT_ZKSH		52
+#define RISCV_ISA_EXT_ZKT		53
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..10524322a4c0 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -215,7 +215,18 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
+	__RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
+	__RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
+	__RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
+	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
+	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
+	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
+	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
+	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
+	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
+	__RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..447f853a5a4c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -309,10 +309,40 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
 				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
+				SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zbkc", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zbks", RISCV_ISA_EXT_ZBKX);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
+				SET_ISA_EXT_MAP("zksed", RISCV_ISA_EXT_ZKSED);
+				SET_ISA_EXT_MAP("zksh", RISCV_ISA_EXT_ZKSH);
+				SET_ISA_EXT_MAP("zkr", RISCV_ISA_EXT_ZKR);
+				SET_ISA_EXT_MAP("zkt", RISCV_ISA_EXT_ZKT);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zknd", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zkne", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zknh", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSED);
+				SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSH);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKB);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKC);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKX);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKND);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNE);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNH);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKR);
+				SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
