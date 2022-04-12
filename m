Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB961C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 03:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11xkZlk0ha5Uxkond1gxcii6MYrfC+ZTM8tjPH5lLgs=; b=Fw18gYWxuMNza6
	iifax/IwxFXm5xGBlcWmQMWU5Xr/Q3/S7i5icpT+x7aVU5gSPH6+sjLV7arT/l5YbP42LzlWf1FX/
	MVJz/FTarqNRUqyJsyBgEt8rJ5euzYxp/Nb9z4LdrTiN7kTx6BdEYcQU2b5JrGYggfktSSmhF5AbS
	2FCEpG7rmq8RpY7OrgvPrEDsAQ2OgXW5etXXyx2pLA1GW+SRYcJXUnEuEVZqtKuRgz438me6YOnAo
	s6fvfz5cHngXlvodMakxsEluE4pvfePuDz+VZzTDP1aUPdiNFT9V3NFOIlt9W/fwQ/d/K5kjcNOtv
	DwO/PIwmshrrYgfOEcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne7Ia-00BR01-T6; Tue, 12 Apr 2022 03:34:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne7IY-00BQzh-9I
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 03:34:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id p8so16317737pfh.8
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 20:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W91zGX6dxqFiUGCVRFx8D5Y3JbxYlKOB4mae7fFQFkw=;
 b=M4te89kKfRRP3IQZ+pPD/ZCR1cnLVFC58CmRISFXb9dlt/pJ6VBLmDYjCon0jTPgjU
 Z4H4AsJu0vsD5WUQJnFbemzZ8RnhHf0TNWVlzPi5gYTziqMZrHW5Sh/Gzpa3AOAI92jv
 gZJ6IbZVLzNh+jSooGBtrEn5s6W+sN7BP36/GBwc4w/tLacbiaGX25Q/RbN/skMVrAjP
 TaAxYGesrh37wLZv5Ta660NiltkYnscgilGcfakHvwh3+nQ7g+a396yokCe8T7QTNdIC
 dorMgE6D7xsuwMo/53FiakaMVx4GrwFXb8RZO3qQGzkNJGo+sgQVIv1NEtyuDjja+Zal
 kL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W91zGX6dxqFiUGCVRFx8D5Y3JbxYlKOB4mae7fFQFkw=;
 b=3E6oCTOXvZ0RENtXOAoJIW8FkO3ih8m/9kxnPvlyjKExgVRdMm5qt+PTGxo0li+dyy
 4O6YQIuNUwa938UDBJsrWyHvAWvXw/mxB4O2MNymEZdVqmRIPKydcl5JwOU9YVjyvmp7
 WM5QbnuoXMxXlEIrptwF0Wt/ZZI9T8p36KhvkmnSDP+Z/BWveIxNSDc/O8SaduCzFmSR
 CIlHt3sm2AsAm0CnSzLM5U81hcO3y5ZqSfNLMg/2VU7HiBh3mX+C05tk0vQvVeDhxmSx
 uWE1Z7MxbDJnIGjusdE6q+Gbu+smegEEk7AEWPtvubaRju5LF2R7HQblR33oO8NqgAOg
 NF5A==
X-Gm-Message-State: AOAM530+/zLAOlJZz7Y2VYc773g0Xd6emUGPiC9ZioRRnoU5Zd2Ux4aD
 gFa7U1EX4SccWox0oUQMJNtU8GZ2/yMJyQ==
X-Google-Smtp-Source: ABdhPJyNrYndvPxD87g8DNwkXldbNmo7CJejXuvSm48T9zQr26C0WvdTw2yhxfYNDDyTHGcLu5llBw==
X-Received: by 2002:a05:6a00:1956:b0:505:c8d2:d610 with SMTP id
 s22-20020a056a00195600b00505c8d2d610mr7105171pfk.71.1649734471975; 
 Mon, 11 Apr 2022 20:34:31 -0700 (PDT)
Received: from localhost.localdomain ([122.182.197.47])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a890a00b001cb14240c4csm1178441pjn.1.2022.04.11.20.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 20:34:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having Sv57
Date: Tue, 12 Apr 2022 09:03:35 +0530
Message-Id: <20220412033335.1384230-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_203434_364629_BEA7BB5B 
X-CRM114-Status: UNSURE (   8.45  )
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

When Sv57 is not available the satp.MODE test in set_satp_mode() will
fail and lead to pgdir re-programming for Sv48. The pgdir re-programming
will fail as well due to pre-existing pgdir entry used for Sv57 and as
a result kernel fails to boot on RISC-V platform not having Sv57.

To fix above issue, we should clear the pgdir memory in set_satp_mode()
before re-programming.

Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
Reported-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9535bea8688c..b0793dc0c291 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -718,6 +718,7 @@ static __init void set_satp_mode(void)
 		if (!check_l4) {
 			disable_pgtable_l5();
 			check_l4 = true;
+			memset(early_pg_dir, 0, PAGE_SIZE);
 			goto retry;
 		}
 		disable_pgtable_l4();
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
