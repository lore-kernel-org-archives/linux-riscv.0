Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394EE9DE6F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM+Ua9TdYVL6wxvk44nMVF1QMVVFt7U5Gt1wAj8zvdk=; b=Q9mMI1Qmsqne/Q
	I2kf0S1v9zBPl/ZxNIRny3EDKARaT58lanWPwVqX8lgrBbZ9qbXTllKZEpPrXQDhHYADJA+u0DD8h
	xqtQ2FUTh+wtYRQ9rhztKjNS8dH+KF+n9au7XnDCVX7/yoCZs/93aOGFwRAIlkKbKOueWiGWmp7Le
	5zQkB9PeHqMxb/E9IO1Qc3Wy5BeKFODXpg6Lv8OsSr2xDDAPBClLeTwsxOkct//2p+cEph6Begnzj
	VdfazTF7cTxhEHTjBSfCWcZqX0awr7g+JV2Pw08HIsaN1ci6Y+q9hKrcWnL5bV4uQdaT+0j5btbbd
	5m0CoTWaEtXW+Vv6Lcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQo-0000000A108-0a6Z;
	Thu, 09 Apr 2026 09:12:10 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQk-0000000A0y1-3UeZ
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:07 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-464bc03efd8so379701b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725925; x=1776330725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0TfCPcFn0APG45qaJoDyRX3fMbDdNDBQ++SYAh1Ies=;
        b=jpUQYramutjqUB4i0yneG8Rf3cWY3UCWg7l6VRKX7Sxss6Eue1JOMNkm3dCSlVUW5c
         a5KUBkKEwtnkMJMIJ8gA0IyDFv3Xv7UA5SLlnNTmi3mBl+iLusK8ybyogCs8qzO1FXjO
         j2u3HgbnkDM0K0krpYJycglpke6EuCRm0BjbhMVyE6nCrX40plLR/o2+8pDhjakX8kmt
         vRhwCUE/zq5cpKtomkPwMKi0iXLqSZ8soAzjzb+16dnXdogWYSqIZPQwBrdWmOeOSsbG
         HnbnvLZ/UEYUdnlMdcp8JX/te4pmT5cGVtKVsNoqfp9IhNV8ORcYWsoEABM2Ni3RUeGM
         e+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725925; x=1776330725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e0TfCPcFn0APG45qaJoDyRX3fMbDdNDBQ++SYAh1Ies=;
        b=loNB6wHC0emAMF/sk6qyebfabdaBP2EAZfBcoBLrzFb49oWchoqhjddp/JFhJalilS
         sDs7QwRovkiSnwfpzYNewVJFLBAFutDFqzNSiXmOA1PUZDfRZ9Dd3Wkvvt6QIW/5tBj6
         +W3AVnjmhok+Yq73tB3k3DnLxnjl9MhMcebiKlw1WasPe7dFelW1jng2UT9jp8xLLWJT
         lC/arNg6cxlX7BFBmq5ndzLQFcMjh4qEn3B8cvPFNy+RsLl87uixbda0lfECPgBe/2Ou
         olVNNoiFU12/3qXWPG/CTTvsuvv+cxzUg0olg73Xu2GL/GOSnLwlog8hP129lm/V6vlS
         maFw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJKDnVurUVs7Pe5mE1hhVlwd5dY7/g6sjdLqfJP0SvemXnepVIJMI9QvQJm44H4qbAX2UhTujyS8MFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBkJa28KZenw4CkQVsoSWfTSiKKk5p2BGZsMaMEOvRyZs42/N3
	CgWerpTuDV+wneitvmCEWVL+9oXoNotTLDdTOSUYDYTd3MLByD9umzwY
X-Gm-Gg: AeBDietC1tdk4vC9VLAUR/vvhGNFXJg8FISdkvx0QrESBL5EygtZdiqMN8YKUR1lsyj
	0wNs9o+uz3sqwV97+E2LaIBQkOLQc9Vw2CfvT1/OHEyNfBjn8MXjdJHiyuMHwpPcw/3kfP/DX1z
	c5KXnX7ZdBn5xxfUiBfi26METWoDSLhxXoPN4Ow/4A8LVHSXU/cwVgqD2CARqP2MSsa+CW481Ex
	EjWFc8NmDSgqa+WbN4kg7e0nJwKivDYQn7O/I9WqV2ldIUhLpSzI8ADJ/53slMEHTvUQLuXDVoc
	WMeRchJCvEP7wYHMC9KNkzqCfDe4DFtaYBUdvhsoqokT1qnEGsFRkXAIpY0DVce9OAWO1ICC4h3
	nf2GcKStHYNXveSInf2WGY318obpU236HKo7qWrwo6ADYeVhDmuzc0yRKCf88jfoBha365NQ6g3
	YLdLTqKMxWnoycnuQ1mKYYO0Y7bFXOmT6u4A==
X-Received: by 2002:a05:6808:1813:b0:467:880:7441 with SMTP id 5614622812f47-46ef99704dbmr12221280b6e.18.1775725925491;
        Thu, 09 Apr 2026 02:12:05 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:04 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Guo Ren <guoren@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Michael Neuling <mikey@neuling.org>
Subject: [PATCH 1/5] riscv: errata: Fix bitwise vs logical AND in MIPS errata patching
Date: Thu,  9 Apr 2026 09:11:39 +0000
Message-ID: <20260409091143.1348853-2-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091143.1348853-1-mikey@neuling.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021206_873781_958D4963 
X-CRM114-Status: GOOD (  11.35  )
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

The condition checking whether a specific errata needs patching uses
logical AND (&&) instead of bitwise AND (&). Since logical AND only
checks that both operands are non-zero, this causes all errata patches
to be applied whenever any single errata is detected, rather than only
applying the matching one.

The SiFive errata implementation correctly uses bitwise AND for the same
check.

Fixes: 0b0ca959d2 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/errata/mips/errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
index e984a81522..2c3dc2259e 100644
--- a/arch/riscv/errata/mips/errata.c
+++ b/arch/riscv/errata/mips/errata.c
@@ -57,7 +57,7 @@ void mips_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 		}
 
 		tmp = (1U << alt->patch_id);
-		if (cpu_req_errata && tmp) {
+		if (cpu_req_errata & tmp) {
 			mutex_lock(&text_mutex);
 			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
 					  alt->alt_len);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
