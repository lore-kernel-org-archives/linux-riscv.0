Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE9C282D0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1DnT6sZyI5qTF4jDohntVLmIllhQRLXXojCtZHnxVs=; b=nGaY61/jQbrVy8
	yHaNMhe+057FSiqiFfqVe/7fEPwO7Hx9wlpluS84UhDs5loqj5AyM48KSVyTRgCaHm9Fos+RaB+Iu
	OOd6p8I6HvHNJZcODOZGei70tXU+xqOlysVTjdmaJ6cfhntwSIyr7x0wqDuiypRfZurTsjUc7+XlC
	c6+gt5Odi81wJSsuIM+BVXxHcBch1hvgZ1O1t+adUWHOv2d7PxiPvA4AGfY0jKShOgQox4WnRPGWK
	7xAKczpCt5A365a+N/BKM+MITvjuYxfTuIkVB73bRDaVg2mRnGX3dXbWQKm0yBFnmjL7OLQBPBxVC
	yDgVdkh47ZRSlH0LxsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6h-00000004ZdM-0V6X;
	Tue, 04 Mar 2025 12:10:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwd-00000004V6y-2Car
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso35510355e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089618; x=1741694418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=bp9uWF/N3m9h7O+QY06iRMaRtgfJDK0MphoD9+ygt0i1yZz6/cEAtZ664ccuBA9PCt
         yYBGmlexx+g5GirY5zgl6ovFNfeZGdqsQSCBPdUsQzqPEyVplhCvd+icF0IZrFrnSkFe
         Es08vzviMY1gQ+a5yeQh7UTI+ocXN1gc0mCnfALBFZODzkFHG3fjzbmg0HQUGLHcnax2
         v9cRh4QT8RojLp5wVJBfFs+W+I6UrWYgxpTNNzTA3bYSD3Oz5aXi4Wfj+AdG5TMdaKwv
         f+/0cXLk26vhB4E2NM+uztaISf9gxESgGcZSV5PwM48clAXzQ/gcGmxhyQKzKJdFJq/6
         aVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089618; x=1741694418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=kKPpLatTeE5qpvmE3xbOS9P6KkLViQuX+M7rzybbllOFYbu387Je8AGB+G3uUEl/zF
         VHCRAgcdbkHDL6P/Jiso9KuBzGaxSNGYHUa+hlIORoaWawv/9EedKrqP7y//CeL1t1yU
         /mw4uPgU/wuhip6jq1wD72BxGuIgtC3iwaO2DcawpS+JTJuD72bA9u/2LLdqnEf952oD
         JJi2NL1rwtKGyCm+WFY3XE+/b5HkJM28guE5P4mg5AExJ9gNod5kki/dGXOSq82nNCzD
         /qrhGrSS+CryBF4oxZZ/PUUAjbAtLJwWpbn5cbL1V1zRByWXHiDKXeI+arI5TE6Tnh/A
         M9BA==
X-Gm-Message-State: AOJu0YzgRviYN/lRR4xDLdkzHaFog/mH53P06ETl80ZoTpsGjjlBvH4t
	GqgXVKNJ3oY2OX/pwMcUUe4KE3pZ/fyPliwPmAunYVnd4TBkTR4anKG2I2a/OpcHt9bUqH/nF1G
	K
X-Gm-Gg: ASbGncuK9et5n6u9lFIYHnFgE9zLGywreMbWs2ny8rAfkgz1v2leSpVEXrZE3qipp5M
	lr4nO2fYvju0VZUkzIBjeJJI8yWtGP+g1UC77izbimyOyPvJqqhzrrE/jWAWxmDqS6Hbz3p0yS8
	jSLJqLqg4Vrmqz3cMjk7/Q6gcKj3wsVelCwDHBc2vZB7ilj2XIAw1GNrZnMh78A91myWm8J6plv
	UwpfQsOnCrZTEUmcNZktI+JfAYChwT9I7aPRSp5v99H4adG0RKIoa9kqKu7K4YNoi5iuoGSUajT
	iBJmO9CkXIjNxiEuDr9x6u5Sr7lDfOex
X-Google-Smtp-Source: AGHT+IGSlj+jarr0JPc4Azcvd/gVJrRnnAK8bPpcD6KvNf1uMYM/W8wrPief42jLDcp+dxdCRnmVUw==
X-Received: by 2002:a05:600c:19cd:b0:439:8346:505f with SMTP id 5b1f17b1804b1-43ba6747836mr129232375e9.20.1741089618179;
        Tue, 04 Mar 2025 04:00:18 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e13fsm17295914f8f.100.2025.03.04.04.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:17 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 2/8] riscv: Fix riscv_online_cpu_vec
Date: Tue,  4 Mar 2025 13:00:17 +0100
Message-ID: <20250304120014.143628-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040019_563831_571190D5 
X-CRM114-Status: GOOD (  11.65  )
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

We shouldn't probe when we already know vector is unsupported and
we should probe when we see we don't yet know whether it's supported.
Furthermore, we should ensure we've set the access type to
unsupported when we don't have vector at all.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b7a8ff7ba6df..161964cf2abc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector())
+	if (!has_vector()) {
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 		return 0;
+	}
 
-	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
