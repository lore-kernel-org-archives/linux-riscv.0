Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F949C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009B2610A1
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009B2610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NRl4UVj48FssZM8/lhhhbU8A+hWIOQP197DioxuwFtM=; b=OzeEKwpir8yQRRv6db3Dqfwxhu
	XLv3Z61QLuqaaf1GutaTk+S2iMyBTqiOmtzcdIFDim0Khgmpt2aV6aNhpDk1jpFH/BIwaJ1YBoQVU
	dgAmF12jrvOkXCD+c5jc6dX8lS8+7V0pwSmg6lGIiukNlslzGYBp1XVmt+Yn/wVkv4tcD1ecvHYtj
	PxlZeJkcHKwu3p4wzwLAYdLQTlxI9QuQCIIA7B4gQcpc0KejAVHgcZoOGHmd4havBVscltSrpbR3y
	jBcANrh5uOEWVzQUNUiqO9Yt9+vRf/eSLJEH05iL35cqQPUPoP3n8YCI4GH+5mf+++QuPepBh83hs
	YvE6iv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZGO-00GtQI-6V; Sat, 19 Jun 2021 11:35:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZGL-00GtPs-8N
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:35:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id i4so2318007plt.12
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wa9WYCmkHZzaHb+kJYIYFh7H1ZMev+84Ux7Wa9pyeNg=;
 b=TJBsklKGaYkX1f/McIdSy1IF3SIo35dUxuNO7swhZTvyZof36F8W01SA8kRnDXecKN
 HkMTrtXpR2HO7f3Qzrk0xvXmIvrUtnuFB1xGZNIATyq6IYG8U/m+vgTWvj8lWZQB51f8
 8TD29wasl+lyHj7cbWBcElmKxhU3bGPkI3VlvDNqq+97koi1Pa0xernpGaZu4uLFj/a0
 bq37rnz6DEulxlLZd6K+AAR5kD7kMs9Tq5S1a1TjN163pg4fCgqpKkcZNHSTqovkA9b2
 u07axWAWlkepuJX7ueNSde4imkwkyeRNCcH4wNjyIJZfKXFR10S+e2mXKxCSZDdcFfyE
 fWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wa9WYCmkHZzaHb+kJYIYFh7H1ZMev+84Ux7Wa9pyeNg=;
 b=O05iVl2XRDNIpYZ/tAz3Axd4jXUsxnyPrwSMCp+m0eJuoY/XwLETw0QPOVB8Sh7k3B
 ZM18km096xdXsYxhZfFTCpzOpeToQ8YJgy8dYk3u1Oo7arSTEJGd+n8FskauNBwc+XgO
 Fdtu3HcEcjsA2vp/4icH3ZgklFDWGFP3aQAbd5VsdTKOaahJBvTkjVjR92ou5UAQARB7
 06PoPH1NMxSa88kgC5M6oqdFlE4aibWlPtgHGpb4C1qnpHZtKKVK5R5IdRpcDDpGRmU9
 QWLvCInabUV62OhK70wl0gZn1i5dJjZa8ZVjip5kVm+eOMl/Vr2nCyuu10EomVUR8+ug
 Lz1g==
X-Gm-Message-State: AOAM531GVgO3I1IodOyqGXT8kA1PEJESvuCNA5/q+N7dG09jHNRRZkno
 p+igbmv40DKhzZIyiSSJBz7/epesaZpnbA==
X-Google-Smtp-Source: ABdhPJwxj/8EC0yVjHOiWLUTU5TkRA/v04eM3BFH5QLYC5JPAJ4o72KhVR7pXhkcoyt3Zhwk4Js/sQ==
X-Received: by 2002:a17:90a:4cc2:: with SMTP id
 k60mr4411538pjh.83.1624102544292; 
 Sat, 19 Jun 2021 04:35:44 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id p6sm11481026pjh.24.2021.06.19.04.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:35:43 -0700 (PDT)
Subject: [PATCH 2/5] riscv: __asm_to/copy_from_user: Adding byte copy first
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <98088fde-cdb2-6410-8d11-7c8ca984d3c3@gmail.com>
Date: Sat, 19 Jun 2021 20:35:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_043545_357989_8603B2AA 
X-CRM114-Status: GOOD (  10.44  )
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


Typical load and store loop.
It is used for mainly copying the remainder in one byte at a time.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index da9536e1e9cb..be1810077f9a 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -19,9 +19,39 @@ ENTRY(__asm_copy_from_user)
 	li t6, SR_SUM
 	csrs CSR_STATUS, t6
 
+	/* Save for return value */
+	mv	t5, a2
+
+	/*
+	 * Register allocation for code below:
+	 * a0 - start of uncopied dst
+	 * a1 - start of uncopied src
+	 * a2 - size
+	 * t0 - end of uncopied dst
+	 */
+	add	t0, a0, a2
+	bgtu	a0, t0, 5f
+
+.Lbyte_copy_tail:
+	/*
+	 * Byte copy anything left.
+	 *
+	 * a0 - start of remaining dst
+	 * a1 - start of remaining src
+	 * t0 - end of remaining dst
+	 */
+	bgeu	a0, t0, 5f
+4:
+	fixup lb      a5, 0(a1), 10f
+	addi	a1, a1, 1	/* src */
+	fixup sb      a5, 0(a0), 10f
+	addi	a0, a0, 1	/* dst */
+	bltu	a0, t0, 4b	/* t0 - end of dst */
+
+5:
 	/* Disable access to user memory */
 	csrc CSR_STATUS, t6
-	li a0, 0
+	li	a0, 0
 	ret
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
@@ -77,7 +107,7 @@ EXPORT_SYMBOL(__clear_user)
 10:
 	/* Disable access to user memory */
 	csrs CSR_STATUS, t6
-	mv a0, a2
+	mv a0, t5
 	ret
 11:
 	csrs CSR_STATUS, t6
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
