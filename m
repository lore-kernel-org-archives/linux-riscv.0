Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16150C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 22:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+vbXE3B3CsNLXtXyKjc08w9QSuGimzK6arE5f+G8lhw=; b=MeLs7+0VHeL38m
	92Sj1ASDqTQYyzWSIcMZ5LldGD/pXXcTBJ2TERRJgHYvkWMB28Wjr7DWKgsVv5M85kzNMVJ+punfJ
	ij+gyMPuhy/GAMGl9dsJTggTTl56YoY6ZyeD4FinFlRxdBD8IVLxVJHr7bHokdQ6sJNywwwG4OHhu
	pXNgT1tMERem2bdmT9CyQr89pRjdEZHF+4IZkH9+6JawTXnx9vZTzGmkhd9zgZ3XEqi9eUDApfX3G
	iXjh7aJL0/uq7uoutAxzHxaq21DpqjsBuXIGg8hFTGzuJhgQRA6lyglagjHJvTrbCZ6yy1EyKZCFj
	qowiP/SyNAtyQl6Jk06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjE-003YXK-1n;
	Mon, 27 Nov 2023 22:05:20 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjB-003YWM-0J
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 22:05:19 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1f5da5df68eso2860038fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 14:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701122715; x=1701727515; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddP9Seydg6uEHR4Cvl6RvAssgCZN9rnWQDGKZ5eImoI=;
        b=x3bfZV3nBUejfrRFbRRl4jzatFZuu/1C/blL+bz9zv6iJKt4B4/2MSX1fyEt8YDHgW
         XzUXCcX3A7VCkPKdOre/laG7ruZ25FNdLlTu6yhvZjRkyqasbszpic7gvfY6LnlczJ9n
         OUyszLSUlsurzG9FJrlFxxOxtbzmM8E8QZ9IKa5fSHAX+M+RBHhMB6Z5QPohavT7vToq
         Xqke1hvnYMVBnFZlPCPZBosYluhmwxwerQ67CJ7p1HB2SgSSRJ78vkO13szXPfVcJm7h
         NNrfCDVAlEM1UGS7KuJQL6tPie3Xw9j6l3alsj++EX9gWMlpep0N2OPgpahDNIlcDnOH
         i7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122715; x=1701727515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddP9Seydg6uEHR4Cvl6RvAssgCZN9rnWQDGKZ5eImoI=;
        b=q6WErKmtMtU27rrzQKaqNwsyyYhURqPmI8CcPpr045zggWPsg4rWY2dvgpFn8dmSlt
         n6q8nBeH6Lz64X9tGz23K0qEyYO+arYszEAoY9DKbCi77BEmj1g1cQSITgYnjqCj5XqZ
         HNmnrt5S582kobg39j8rXsuvnZH3T56r/UKySbgzGtTZ0KnpRWLDr46FcIyppQEGykbD
         IhEfLEoLaIMTRyqYhvvsjik2E0kRs/ZT+lyGlHIh9x8flqz+vbSAl6QF3fbz1VMJAa1B
         Ktnj4SVMa3LsISCOXf9EP6VJu5f9NfXB61/JKX2UBuf82ts0Q/iK2E0mewOdCn6oRpYi
         Vomg==
X-Gm-Message-State: AOJu0YyFzboUqnKChHoUTVMeRRkXbI5OTOFXv60ERX+QyrqscQU4oL0v
	ElbHXA5EbFxJ45ycBlcDs2bVyPlBhjlNIQ9277A=
X-Google-Smtp-Source: AGHT+IEnj7s/9ky803AWh0qNXrHLp8Gp+Nrp25b0P7l4iEHKpfaZkXNiO6XBdHlUg8afXhaq7X7Hjg==
X-Received: by 2002:a05:6870:b88:b0:1fa:1c63:738d with SMTP id lg8-20020a0568700b8800b001fa1c63738dmr14171941oab.7.1701122715440;
        Mon, 27 Nov 2023 14:05:15 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x23-20020a056830115700b006d679b53e8asm1458890otq.24.2023.11.27.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:05:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Fix issues with module loading
Date: Mon, 27 Nov 2023 14:04:58 -0800
Message-Id: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIoSZWUC/4XNwQrCMAyA4VcZPVtZ01U3T76HiGxtqsGtlVaLM
 vbudp5EFE/hD+TLyCIGwsg2xcgCJorkXY5qUTB9at0ROZncDEqQQkDJB29uPR56cmdyx4MNiHl
 y6FQrO1CqU8jy8SWgpfsL3u1znyhefXi8/iQxb/+SSXDBrbW1MGuoG6u3gZKP5PRS+4HNaoJ3S
 fyUIEvNuuqsNnK1qvCLJN8l+ClJXvIaG6wEtFKW6kOapukJKCp0/lMBAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701122714; l=1275;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ktmhIbS4nLRNl0CJgpmhOEvy8Ne38cd75WPfhvHt4w8=;
 b=LvG3ouNrZDAB8lSTyo77I0DXPO2z8KvBEY0edkFxLi/zJhf9q/nZbwvTknADYULxy6qmtlgoV
 Wb0g/PZstEtAy3ZNIDk8PWwi5awR4QNle4aGVl8+hSrIs5vPyWmNvGc
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_140517_477242_67CD91D8 
X-CRM114-Status: UNSURE (   7.01  )
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

Module loading did not account for multiple threads concurrently loading
modules. This patch fixes that issue. There is also a small patch to fix
the type of a __le16 variable.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v4:
- Make functions only used internally static
- Free data structures on kmalloc failure (Andreas)
- Link to v3: https://lore.kernel.org/r/20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com

Changes in v3:
- Cleanup pointer passing (Samuel)
- Correct indentation (Samuel)
- Check for kmalloc failures (Samuel)
- Link to v2: https://lore.kernel.org/r/20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com

Changes in v2:
- Support linking modules concurrently across threads.
- Link to v1: https://lore.kernel.org/r/20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Safely remove entries from relocation list
      riscv: Correct type casting in module loading

 arch/riscv/kernel/module.c | 114 +++++++++++++++++++++++++++++++++------------
 1 file changed, 84 insertions(+), 30 deletions(-)
---
base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
change-id: 20231120-module_linking_freeing-2b5a3b255b5e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
