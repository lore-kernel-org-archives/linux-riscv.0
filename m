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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1372C2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:35:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD27610A1
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD27610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aB4drN5HK1uaTl2tLe2bLCZS2/tJADh3xbmzPhZIoTc=; b=EkYlxneYh4ZAbvYXbCLb/AK46B
	Atu69HnrLy+SCUG27p7lhJqWHVjPn+lnoN2sQIZ3/rsrloTQutZ/sERRz+KJg0IaMe0tWnxXEQwVG
	by7vRXYLqbGT91pUZf2zdwCfY64NF+42LtVer+pOc25OlEp+m5wtrCLDXoVE4eGnkIr9Jg54dk6xI
	JB4FBq/TjMfLEm0eCAlhD5q73K0pBUhp6vgXUnZhfBLshU1KU7Bd5Tt/I7j+VMH7ymwHpdiMQsXc2
	XDW0mv1BmtvyHCZ3TIQQGiuL8ZIGK3JVyuSQKRLAZArSsiOULshav9p6KkPwY5n/VE0PgNWT6KWAD
	EPUUITVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luZFU-00GtMA-Hu; Sat, 19 Jun 2021 11:34:52 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luZFR-00GtLt-Nl
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 11:34:51 +0000
Received: by mail-pf1-x430.google.com with SMTP id y4so2848289pfi.9
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PxDFQ3I0YJog9pgbJh/SJmwo/SIulZ+XOOwzT95hgRI=;
 b=JCEUHJYya5T1Q1Qm4yidgPbR6DoCK/e1s3YMSHu9YwPL7XanlcDTu0x18rQmElD5Pt
 8SucHreHwpRnYPcNe4VO5S1CwbIaCH+BgGm0CgtuM39boN1Wt1X8/3cyHrqcRpGKzI7M
 /tX1roPGmUW9XWKk/xzERyih4NTXVUbZWXY6kgjEQPkwwEa9Nrdl1KaGh64+h2/4Hekx
 WdSFpVP6w/wySTQAlWvYW1rywBdJqsSRSKX8NQzfQwgirerzOgr2moLNsupTbSfxca0t
 LBiwb5mfo0Z2f2QY3NgTNHRdXe/ZrbYr5ZWIZ2sO+CZ10hkjYyd1GKeJR43dJLKEgGOh
 jPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PxDFQ3I0YJog9pgbJh/SJmwo/SIulZ+XOOwzT95hgRI=;
 b=c+9gcG65yIroz+JqozVoybi6Pffz1sN5ByX5LFw+C6VM0CJYiwkOulj0sPxvK+iyoh
 oLg46kBXZ38RIIO0QQ0RbBHKtiw3s9UuaUl2F0gR8ual+zv3soOUe4gTvOuu8OALvUgF
 86Vh8Fph24J4UUxJTnQBjhkO1UXiP8nQN4vDGuU+/Kf4a3dDJTgzmMCriKNdhjOmfXjt
 Z79YBcviGKQxY/DLzhq/4fNBhRlfDlHDJ/1Jy6e9Xzmh/M82n1JipDpqpc53cSwX4akK
 4KpZ549UIFznEzCpHvnqfvKG6RYWPSFxH5eDsLbHRd95RsQTUEk63I6XWZ04QMTmbVuz
 2CcA==
X-Gm-Message-State: AOAM531cEP/tvkPSMs75SHxOHpH9ydhc+zRZwPWpT2JwkwwwcVu48xMD
 gKeDBN+i8VodwaeokSTPsZF3chSm6V1Gzg==
X-Google-Smtp-Source: ABdhPJyjbBaZ6iRflKyZAFZkA3uGjZ7yFTU9YjiKzEk2ueC6ocCxhQ2H8r+fJMcBq+8pOIoGE4tv5Q==
X-Received: by 2002:a63:d815:: with SMTP id b21mr14649944pgh.321.1624102488505; 
 Sat, 19 Jun 2021 04:34:48 -0700 (PDT)
Received: from [192.168.1.153] (87.19.178.217.shared.user.transix.jp.
 [217.178.19.87])
 by smtp.gmail.com with ESMTPSA id oc10sm9585530pjb.44.2021.06.19.04.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 04:34:48 -0700 (PDT)
Subject: [PATCH 1/5] riscv: __asm_to/copy_from_user: delete existing code
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <1b454390-cee5-a414-509b-3adb25ec0330@gmail.com>
Date: Sat, 19 Jun 2021 20:34:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_043449_831931_DE250BD0 
X-CRM114-Status: UNSURE (   8.10  )
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


This is to make the diff easier to read, since the diff on
assembler is horrible to read.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index fceaeb18cc64..da9536e1e9cb 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -19,50 +19,10 @@ ENTRY(__asm_copy_from_user)
 	li t6, SR_SUM
 	csrs CSR_STATUS, t6
 
-	add a3, a1, a2
-	/* Use word-oriented copy only if low-order bits match */
-	andi t0, a0, SZREG-1
-	andi t1, a1, SZREG-1
-	bne t0, t1, 2f
-
-	addi t0, a1, SZREG-1
-	andi t1, a3, ~(SZREG-1)
-	andi t0, t0, ~(SZREG-1)
-	/*
-	 * a3: terminal address of source region
-	 * t0: lowest XLEN-aligned address in source
-	 * t1: highest XLEN-aligned address in source
-	 */
-	bgeu t0, t1, 2f
-	bltu a1, t0, 4f
-1:
-	fixup REG_L, t2, (a1), 10f
-	fixup REG_S, t2, (a0), 10f
-	addi a1, a1, SZREG
-	addi a0, a0, SZREG
-	bltu a1, t1, 1b
-2:
-	bltu a1, a3, 5f
-
-3:
 	/* Disable access to user memory */
 	csrc CSR_STATUS, t6
 	li a0, 0
 	ret
-4: /* Edge case: unalignment */
-	fixup lbu, t2, (a1), 10f
-	fixup sb, t2, (a0), 10f
-	addi a1, a1, 1
-	addi a0, a0, 1
-	bltu a1, t0, 4b
-	j 1b
-5: /* Edge case: remainder */
-	fixup lbu, t2, (a1), 10f
-	fixup sb, t2, (a0), 10f
-	addi a1, a1, 1
-	addi a0, a0, 1
-	bltu a1, a3, 5b
-	j 3b
 ENDPROC(__asm_copy_to_user)
 ENDPROC(__asm_copy_from_user)
 EXPORT_SYMBOL(__asm_copy_to_user)
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
