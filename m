Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7227C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t6yYvdgy6W7BSgkjM8X1unm1IoT8v7iDaOOFBuRkQg=; b=dksyTZ7Dez9VJN
	7mJHan1xB6IZtTJW/QwY0UsBCblJxaYhAPmHYtgme2TsIbkg2QbOaIxEOqssSOm6pWzj8SPy2ZVTh
	MPPxrEif/mFtWsJzYnrwdATs8L39JpyyPwVEcj2jxD4Um4bkMBBvkFq6FubhuWDA30LQFFcy326dZ
	oVRC8iFrcGYIu+QnTDyDQ11snmJq9hRfcmq/YfPsnj4JYCX7Gfq9rthg+w1rL6/L8fWejGVJJuzss
	jw/TsopuZaw3ATeJiH1IYFBIUhn73IR5CxbdevnYiA+2ZGE1lvg2RxM5YqGekdFzP0nXp4SWx9NtJ
	JhpnZhHZEoeeg+aPhNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu88-00EtKP-VA; Tue, 01 Mar 2022 04:28:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7w-00EtDT-9J
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id d17so18434271wrc.9
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=l9W+NGbgxdapkSDh1674O7D8QLnibie0+u3PaStrMsDolQoNXQay/fD6eG7haTMIex
 9hjRC1bPjXL+ev46XF0WqEfHSvHTI+AuD2lrFA7vLF1nc+s2uyeXiNlNj2JJec7gGgUn
 2JES8wdSB7kl8EW3lDrqR+StUYnr+zca0owdBvyFARzpwItdzw+AfPumhlGKDM3pXQ30
 QLa59UPT2zCDE4YnRQ2OACeI3iJFAqeiSAVc6dg9DX2q4W6goTjqVMDCKbvl4mKCSYBH
 b2givfpcsF2VQPBwZy/zWEwsP0GS9pyXxCiqkO8t7LeOKA2HHjJBnCjucp/WssWGSUI1
 dqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sX9W0jJI3V+TTQxrILZfbGus1iz/Yao2DvXh0KaNAVk=;
 b=X4vqB5sKaOqPw9WNO8yLdqhVHwmRlqfEa8Jv/uAdm2z0YL234sAfXI1LJmgCZ3dle2
 3I/vK9f6HPiwSRhamdlo80zdRHG1lHHqMwPxh5A+JqV/vQzvByeV3uTRYprhXrTGgWj6
 zMG7xJaVKjiz0IQ/BKT8YASpYAgmVKJVH8g9+el/EfrLJzxrvDPmPqotnbMjC5e6rjqT
 5Udeue/Q/zf9RroPIO3VJZz3INjwTxi1jIeRCSw5zeuZy6uNWbtpZaw3ykL0KvBgTF41
 NKvZ+ZnOGoIiT+XO+YZhOhOHv5t3Tjf/WxiA11iBUksuL+VaDnLnjF+7NT3y9lJWTEFz
 LOGQ==
X-Gm-Message-State: AOAM531QmTH+VCjB21CXr1jGZvrWEAc4VBnMs++isgX0ZTDgAhJsl6Jq
 IGwmP896uNGZrv0oHnA7uPeB++irgX+POg==
X-Google-Smtp-Source: ABdhPJyGhlMwmtEnqXiAm8QiDsDHXaZmhEWG6M8Am41WiNmn6yrzFFympTA20zKYu+3kv7rh5608sg==
X-Received: by 2002:a5d:4606:0:b0:1ed:d3c0:19f4 with SMTP id
 t6-20020a5d4606000000b001edd3c019f4mr18570799wrq.555.1646108922741; 
 Mon, 28 Feb 2022 20:28:42 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 6/6] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  1 Mar 2022 09:57:22 +0530
Message-Id: <20220301042722.401113-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301042722.401113-1-apatel@ventanamicro.com>
References: <20220301042722.401113-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202844_367290_BF39A7F7 
X-CRM114-Status: GOOD (  11.46  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
