Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18422C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fHV4bOEIyiq2UUlvN4bda+RugGqHsAkqN9Z3XsNwtpY=; b=P7PcdRIXLENOCt
	i0YIo84P3E4Y5LNu9u5EWcAEmpj0rODyoI/XuLgr2qJgi0aEpU+E74xmgVDQrh1drhLtMieyxaiXm
	Jo5rkjWIsJDGPqZQPQBiB2cZAlP+jC22bRqOPS8FMR4mWd30VLLSEOCasMqCQU1X5AaaRPtMfWQEm
	CQLgeZtL/1RXdJ44kLhqQvEPOy3tyI50hOmCanBzrgctNcNGJHD49kHsFhywjifYGYDCq6HyBpLQh
	7PI/iieiaUdKpfE62bn0yMilvkWYXsDOhyb7yIrrwXWfqrTluKgZ7/BkMYztjZTjmGhY7jSeCVH7q
	9sqaLJc8n8tH24fxA9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ht9-0076NE-Tm; Thu, 01 Dec 2022 11:37:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ht7-0076Kr-2C
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:37:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id m19so1960769edj.8
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=muEN0jsXtNZZvmPLZaF+XZOf0QuX4OeXqha0r0v/Y8Y=;
        b=MEmzOXeXydBdGScBUmuICXbLoR6gj8J/M/A0Zlouh6eMIQNOzfwivLrJyIVjwjZlN5
         i+MyyvwSCD1PL7Vau2/IC4fiq7rYvfCMiEbcBuv1x9ChvzNsnS3LXzvjBMwowDHYsG8n
         fCat+M/S6KDtrXfKCloAjmj0FSCk/pH44KL+itpbKxdmZKtPOce+WlXdVyssy9yhVP4A
         w+sJNjcsYtXscQzAGZtEwrYrvwEhuKdDzHdP2OOC/lynh+QsM0/TpAvORNOJemYquI72
         iSfZy72fXm4P6fXAXW3bZCn/rIgvG+b0aChS3ZkrGLC86TpOpwpG+DjXJqq/WvdWy4aA
         LocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muEN0jsXtNZZvmPLZaF+XZOf0QuX4OeXqha0r0v/Y8Y=;
        b=qUDdTQKrur1I5408aoN0kVnrcZ5LSDIikLDqjBghVUyDicp/0Bf97VG+eHKfNL6uhg
         0cnE8+1I9BBsQZplyb//0k5ptJgSG1yy/G7QKRM2EgYHUk3PTofFhL4w25CYezCoQ2wa
         o7B2ceQSxvVZ9p1O7oHxhPOdqo4O7vcMAtTZX74Ihkh7uav2RXQJJ3ujRN3P44RHnMuu
         F6TTh9a10p1zONheorky5bl5t5bkAKZZF/UBp/dyJRaVmNDjn7jpAW0SFzdvUQDY6Jxj
         Rhr3ZnBWqNHMqLnV12Xofxj5mFx/4Lg1GzPpPy/wvdHuLzcrpvFPpT+0f4/IXa7iakL3
         K8hg==
X-Gm-Message-State: ANoB5pnpar9JzCSWjiWKpZVsoUa9ZGN3QFK1p2mEB+5NRrck3V4GnuQy
	P6/KHhJSALw7U5hU62pho2QxWQvmbdHLww==
X-Google-Smtp-Source: AA0mqf6juewHA0Jm2tromnOqfVNZ/sKiH2L8dtQ4pCUr6+Oau+r0B0nmrzvvCCBvs/NbSoI/vRdmgQ==
X-Received: by 2002:aa7:d8d5:0:b0:46b:4156:76d2 with SMTP id k21-20020aa7d8d5000000b0046b415676d2mr15830722eds.224.1669894672058;
        Thu, 01 Dec 2022 03:37:52 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gf16-20020a170906e21000b007815ca7ae57sm1662250ejb.212.2022.12.01.03.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:37:51 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
Date: Thu,  1 Dec 2022 12:37:50 +0100
Message-Id: <20221201113750.18021-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_033757_130393_5BA18B9E 
X-CRM114-Status: GOOD (  10.17  )
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

Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
created with a value >= RISCV_ISA_EXT_MAX. We can do this by
putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
redundant with RISCV_ISA_EXT_MAX and hence only used to
document the limit. Now it grows with the enum and is used to
check the limit.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..86328e3acb02 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
-	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+	RISCV_ISA_EXT_ID_MAX
 };
+static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
