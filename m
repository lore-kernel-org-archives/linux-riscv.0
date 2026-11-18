Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC6606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vi8DKy3v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuF7XEMU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=1+MgncVcyLcAnF2v03wzOimudtEohJuxxPOxcB1XwYM=; b=Vi8DKy3vhOGMAmZ7fGEXcZ/rj8
	XTq03bapLZ5nHouAsfe+raAaYvCFdV8Eb0Yh0j9DgLyyJQQgNWvGH8HUAg6j2FZDn/wh2ttmQ6ZSC
	VBM2GaRHLIkI95zAJbbba72UoXqQPp6rt1d3xcey/xlYxcSFYGUn9ij3r8DsHXAmgTjmurhI9aoIi
	mcjXCfp5F3ZgC+qOL8s7KR3Qx9B6kWEA2NJ6aJT/H6Blsvf2eed58/uo8X1Q3iZo29naUx0xDTnEt
	Ot3eBbbDWEZoePUbx4T3I+BnRK8q/5STw0kUFVjq/Aqd4ouqCDapLuQb79heOHkAj9Vk6YUuUzLV+
	7Mekz3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI3-00000009t9i-31lL;
	Wed, 18 Nov 2026 18:21:51 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI0-00000009t6c-00vB
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:49 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1057147f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026104; x=1795630904; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=TuF7XEMUhkZDf7YeyCv6rjOzxgTwyNrNZp1DNkUH7ZKM2DC5UVdyQnMN2TZ2X6zSQy
         0qV3rfKvZ/MjKP4uV+jDO26dR4zxyD30yoYanNGEGlUq9fjuUxgHLwxZbFNcOVFj1ZYy
         TG4/bykV6G6wk78qC4TTY9CRi69UB3Rm8X1ODc7hqpEnVgHkKJNkqzE9x3GJ64lmvH1b
         RDurE8meppgqhZ8QrzeTtlsJp3YJsbTJ7t1yaz8IdORNZdR1ksevGBUtn1m3Og7QMDm5
         NKbndyK+wbPHlePVJW6kK0BFVlJeZxQatJd6DNjRN+1JViyLGJpjIQ2ht/tligfUEhHn
         iGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026104; x=1795630904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiIv3B/kInSJlpauWNEdFhsRn5B5HF5NbCxXGwR/mKY=;
        b=Gsiyzi5JAk8BoOGVB8UH+voWH7iotaTn259wjSz6JjeMgdmlEdbeARrsjrqzRrEGby
         im+CIvN2/eCSNzliXsUCkUYXVEh+eIIbDOy3tTIFQOr+GDgggs+gBP1czakHTJf6bofo
         +fcY1cXDlfdseKHpkIERsWYTcpweU4fkTzRt6Yfz1+sgS65HjdzNQJ2Ys4MDiS2BPMwW
         dFWmp0pPeCXBTBoAh+NQmrKhOo6yv6XwkL+U5dEAqtp53LgfLncrkKvrNEpZTRrEXSr1
         m0xs5wdbjgtRKnXdo91op/iPYsuujNvx1H7AAo2hteMSnmg4CSxEvBRtgkLyKM4hJ5UA
         VcKw==
X-Forwarded-Encrypted: i=1; AL+hErFAFb4v7Aw7o7XH56xT18P33Z+jC5n83hvoqJyBTYEvi1ICx96OfQ4+IaUqobFAP7dzkp/2vrxupXSAaA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8t1n6b3nFIi49a1//3wSB4i6gQpMOcw2xCe+VxpA8yf0hqkBqf
	PENFmEt9NTCO7+qBT6WX+Y5XvfdtSR8UNPGBn8A311goZupzVj9CUYsAeljO4GaGHytmnIKLnQ=
	=
X-Received: from wmte3.prod.google.com ([2002:a05:600c:8b23:b0:4a1:e44e:ffd0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e87:b0:4a5:75d2:c104
 with SMTP id 5b1f17b1804b1-4bb7da2db77mr71528935e9.22.1795026104151; Wed, 18
 Nov 2026 10:21:44 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:07 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=ardb@kernel.org;
 h=from:subject; bh=jR9RFbU1DFXzsLcPrZ2t6cFJ9as3lkmb0r9/e4KUO7w=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm8mi3o96JorGnY3c3uniWlKh0aATKFJUMr3DnsWB6
 e3err6OUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJH6v4wMyw6xcJ6b+EzmOFuT
 1Y2f1xcdyl4ravtF5AjLUUZhfo4b2xgZug9P0Xhuo8DAeP2t7NXOJuVfV/crmV/992mTwjnDW54 WTAA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-22-ardb+git@google.com>
Subject: [PATCH v4 01/19] efi/zboot: arm64: Add missing barrier after cache maintenance
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102148_054801_628CEB54 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Prevent the I-cache from fetching stale data by issuing a barrier after
the data cache maintenance completes but before performing the I-cache
maintenance.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/arm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index e57cd3de0a00..d35c6dd76601 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -109,6 +109,7 @@ void efi_cache_sync_image(unsigned long image_base,
 		} while (size >= lsize);
 	}
 
+	dsb(ish);
 	asm("ic ialluis");
 	dsb(ish);
 	isb();
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
