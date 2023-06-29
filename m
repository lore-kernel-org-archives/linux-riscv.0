Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1BEEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1X3eGH8qiw1NmIWLyqmkiPuExtvuv4Trg/BRLGqs/Pk=; b=OlPJqCvjCI1aP8
	Qb4LvGZcB6fIhV/sXJwUkqzvy1umc6ypOPpncAkeBlsve/zHW+2yGpaOAvuxrOQ7GpBzwBVJ5XIdR
	8FE1bxVO5VLQpKfEDloYOFdgu5Isyd0DCFSKEyb6vmal5kS+K26/lXAtaeaGDU+jtp2H1XwLmgqLz
	o/TnoMzu1Cwf01jBfcckB8Wt9L89ZY6LT1hAhNIKoikK6m/gXAW3Hs+/rw0IWPpUoh2BPSSDInPb0
	sEKsNmaLtGWCmtmfEsBF1QHuqmI0XC+pb/QCpLJGCPQQ0AKh8E+QDO1VrvbFZXPLbNFRazYq//i6n
	NGRJUviFuIARMLaNAacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2g-000O37-1G;
	Thu, 29 Jun 2023 08:30:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2a-000NxK-2u
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027413; x=1719563413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6yGCLTHTWBR9QgFp49drRvDK9QX9Ej+dLrWhdW/gWbA=;
  b=kqO4BvEKDvBzXMftwLYs1QwiPu+99X/uhKPCmhU7NzrG50tWwo+1TThE
   FRo8SMDF/lAy6nH4Jz3Ianm5BZOkxF+tooUlSON/a3sNoc47jpgfHveC/
   gOoUrhm03btpfck/YpWy+X/GCoZASOSOuEl6SNfVObeQixj6IpxIqrRwt
   25s1b2m0cKZZJKQ2qs7gjxADc7zko1l4NHaaoTGIckcSl7lAV4g2LKcG+
   t8XKVkU+5t0cLBvtGTyljcsvyhz2A6BW4jTs+kOt5NKhvbin8nI4AhIOb
   CKkEtWBe3WIuxFiHCA4LS2gKgiV8axA9YfzMAg2kQcCDB/WpqvTzsbIqt
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="218155941"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:29:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:29:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:29:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 02/10] RISC-V: drop a needless check in print_isa_ext()
Date: Thu, 29 Jun 2023 09:28:48 +0100
Message-ID: <20230629-tightly-filtrate-a0b8656035b6@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6yGCLTHTWBR9QgFp49drRvDK9QX9Ej+dLrWhdW/gWbA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ7O/5jZKX5wYerZcy4XN1QdYwg7sGWDftNq5dLY9NAA EZn4jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzmxGhgOJoZGnTaWeGas0vN1o9v SYa3bTDhtfo/SrnC1zfaYmczP8lY9LiLpzerPj2fzdbFM01+z9fsvW0VOhOWRGysxDUt69nAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013013_002082_76A6ED2E 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

isa_ext_arr cannot be empty, as some of the extensions within it are
always built into the kernel. When this code was first added, back in
commit a9b202606c69 ("RISC-V: Improve /proc/cpuinfo output for ISA
extensions"), the array was empty and needed a dummy item & thus there
could be no extensions present. When the first multi-letter ones did
get added, it was Sscofpmf - which didn't have a Kconfig symbol to
disable it.

Remove this check, as it has been redundant since Sscofpmf was added.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Reword commit message to explain why this can be dropped
---
 arch/riscv/kernel/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 2fb5e8e1df52..ddd7634e4c1d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -233,10 +233,6 @@ static void print_isa_ext(struct seq_file *f)
 
 	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
 
-	/* No extension support available */
-	if (arr_sz <= 0)
-		return;
-
 	for (i = 0; i <= arr_sz; i++) {
 		edata = &isa_ext_arr[i];
 		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
