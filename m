Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927BCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Em+YWVA4jRzGlOs3DOGCDx0glISiJ3ibmzeKpxG+sao=; b=k/yulwXUJicASv
	SFahOOuooh43Oa7PUPI3R6EbAuuTSm00+dEODs4IV8i01mxFG96fQXEVMh2mLAKoHtDhNkwOFcsdp
	InWN1KdLAKO8n9HGuDASGp9e4f7VQugD/EU1MXwUxzKwRk9z9nt5lCiAfxoZnEHKobp46D5ZZYAmR
	Mcv81QYhZs+kxx7RJU51aeqRRN8oaNglUghbPgZuQjp42EzrlJFZVlHigTBWSWhpyF3gansFAtmYR
	BA0OF6M9U/dV3L4lcOMJ81pDGjFiUsl0QaAd5PVDTata8aAA45jhB0niD6TPRKoEi6UmsS8XyczB2
	YBrCVKyseE1exZnjm4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4L8-00000000yDr-0CTh;
	Wed, 29 Oct 2025 11:27:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4L6-00000000yBp-0tRk
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:41 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-78125ed4052so8245148b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737259; x=1762342059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu9PVTm9hjUdHoFQcU8g3rsnUfjy9F8yp+wWZYUCJFc=;
        b=LYGrX+7HcY9xGGIlRExSIVxKAbY6Fn4mXKBaMQ3pSAAIMrcExNSVQWU/bZGJc9hG6d
         vEwwXQkhxV4LuBfixrL95pE2sDjxD+XiwL82yxfV1bjveihs9c/IZroJPpBvzafv2OYD
         5faIaraAEF68CNWyDvoucVPU5EglaZ/Inm4+UyAnhH6+QqeLt6OFbFgjC2vXOuLwfrIn
         00F+h80M4kOoM4PZVmFwvD6LJjW7902o0GDsr4DoowoHudvcYSYhcehVEjUPGyusHhvl
         CbwW8M2V1eHicZLsOXd5Az1WEUjscO6HxfFVhvRecw1GvdkJtKtKfVFZ1shG5ovCDaIU
         m9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737259; x=1762342059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lu9PVTm9hjUdHoFQcU8g3rsnUfjy9F8yp+wWZYUCJFc=;
        b=NmDiPJaeYGNYMyfqIaL9E6Qfg6YLEqxzJnCR+K6we45t88vU8fnSh/n5dtBQIfKSX5
         vQjfTgINoN0xf13FyYsXLvqc8Ba2tjD85K3vSov6fTE0b1TiDyagIs7iDAwWzhn/kwbT
         VTdbVQYssAgQzcnzoDwvQ1YuOGF2mkd9YkIrJJGUTNX/bJP+b3KSgdkXRcnwjdG7+v0+
         58JnjByNwVe8NBCdYrooavlxuKtyekKakXnHFehmC8oi9RUvqpWKQRAEg3+L0ltsT/Nk
         QIdiV7ZpCeV6MYp3xJ2MgMX20ciXP902414Toj/n/iWVkVItyQnILeLxvjpoD7sLBTQN
         jctA==
X-Gm-Message-State: AOJu0YwISw4gktIfl7zEHwSM4G6uOmMi+l1dfxTzcMN7g7Fkb6+Siq9r
	rzSklTdhd98iOs6NISH9YR8yhGvNFT80bbk6uBXTjjmfIbcyzvAIy2al7T7uBbGhK01Hny7fOgq
	iahmS5b/Hog==
X-Gm-Gg: ASbGncuhmuoB2BvuEB+JFQekem530GutWCqi7mVssfdTcO1vahaIMZm7PvnlmlzN89x
	no3XyQr4JyBBc5DpAuDHiGfdPwrLEq0eMYwRLAO4qzNMvSmkm6vaaKhnjrmbqcae0GGyIwXk8gu
	kbTnhIFva0GcRjnDgbkZLSaaT9woizOvjGzasz6XqohXuhdJCq+MLwC+DBb0122vZ9Z6kN1hjh3
	8ETwmicD1qtGR4IpnXrAYAVlIDXCSTqnFZKWL8d7nfc3hjHo7iy3Xabm306i6danD8x6QYDF/RJ
	Fc5ThAAQ0Y4+LQWPboigDZot24gchpzh4DDeGxF5krnl/orjBdWej2sJRVbUgygS2dUufi1w325
	aozmzxVFXbJQM33LJMj4xAza1jgmM4vXJNWfiO8K/6Qn7Ae7GVE00S9dbI9mt0T9CFZyf5NfRiv
	0smghT7lRxMY4s9/IBBR4fFl+LQtL6TSk/B4e+dic=
X-Google-Smtp-Source: AGHT+IEwNLyhot5qPJEYgE8ajY5jbwtZPlrijo+bkOA+9e521cPY2uChToY5FLnyugwQKON/wAVvRw==
X-Received: by 2002:a17:903:32c6:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-294dee20a01mr33897975ad.18.1761737259146;
        Wed, 29 Oct 2025 04:27:39 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:38 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 07/10] riscv: Add RISC-V entries in processor type and ISA strings
Date: Wed, 29 Oct 2025 16:56:45 +0530
Message-ID: <20251029112649.3811657-8-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042740_279061_EA8AA4BF 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add RISCV and RISCV32/64 strings in the in processor type and ISA strings
respectively. These are defined for cper records.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 928409199a1a..ebdd92ba1e15 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -110,6 +110,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISCV",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -118,6 +119,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RISCV32",
+	"RISCV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
