Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D46BC4829D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNf/CN4e2DEAnnfLRpNEXPc75ByXAMLc1gwsKF8H6mY=; b=AapPL7ALRns5om
	sS3tRd6XFUAJFKIOeCOx7EZRmxEXVLyzgRJI21e4iUZo6izyQu1KP6H1+AdDIe8b2j2GpgBdSWVkL
	9Idp0cU4XRtCdK5B1BKzxvNqkhqdvHHFyAl35/D+TE4OhVBypgGsRbpBjj3vRoKwrl5idY9WRsou4
	pIh/BQwp239voktbuPSkTCzeRrpag+I/G/WPRwEszutLp/TWYw5A0r0GbGNtabCFr6PO41Y9c52/N
	DjnYa0/ald/havyE6BZE1+bVkNxAOkz5Kd4sQ9WscJC1FxohuhV7o4E1AyxdhxiQMA3AShrlRJ/cI
	4JUlY4IgTPulFdA9V8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTo-00000004DAa-3CMr;
	Mon, 12 Feb 2024 02:55:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTl-00000004D8E-1WvH
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d780a392fdso23142285ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706533; x=1708311333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sgb+qYVoGLQC+1tIvOKXrFPvpE4GtMMkuDMIpMcBDRo=;
        b=gJEK9EChMBpa0p7zmtRcA65oVqcbh3pJw5jx+U6kLF+EgI3WIfTYosPfAZ3E8THF4t
         +JI4eW05fpzSlVSSQrch45GD47iJ9CpEtWAJVKE8A2eY9lYYvqrpUoJZA1ZYTwsPMdbO
         Uvb4Yvfc5GdcxE0I667B1Al9Luk1pD5l3BzFuV+CwoRii3ERjG1PubdeJqnOKen6Mel1
         cFebcp7aVektw8UjmUfitg+DTqZeUYDITWOoHTj2GcUuvp176K4mmC/rsK9NeQzi9IYn
         G4fBvTWFBbhnU6sHCIHhAbZ7v5MONem1oz56oQ7C4tWe/IbMoX0rJ+ocKxaGkBEVitx0
         7eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706533; x=1708311333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sgb+qYVoGLQC+1tIvOKXrFPvpE4GtMMkuDMIpMcBDRo=;
        b=MXd663jLID/IQesIeZ7M4/OWnVLe7yicyRN2+rTmoN4E3MrINP+Btb1ZMI5rpL7A3M
         dMqTzTqmRqB4OM9F1qDoINhL/aSXVvGvuEBPIdaDqbN6HjNLNyie8zkRvFtPzfW8qsVB
         X/WRDh2gyf8k4eMluxicGIYu9+s1hj8n1hEhOoQ0cKJo5iI6023mgVu72SXIYgYK9gV8
         zX9xVInHNBmvrPn+gQ33kexSo5euSdsHaOFJZ3A18WFMH/0o6cV/XcVf0tNASid9KtbO
         c30bthJWjv0+gRx/RDUVx92SDnb8HmOy5ycZemsT/QE8Wjix/IGRCXxWdFaDXgSzQlGo
         8R+Q==
X-Gm-Message-State: AOJu0YyVoWtYVkTA2DYfZPHxbxe/1dP/kLkvSWgFiRVbdj92BFjRHcRG
	ELPp0allRQYZ1+YYMDk/eocetwjJTj1+N2fQjBZkD1qvjZYQlxoFxn7fVssvXng=
X-Google-Smtp-Source: AGHT+IG+jFJKgyCn1R8EZa/RvpPkjQLUBL0jqkCGBZDbkkg0EEuXrvaReU9MwlXMjKspZqO+X1Axwg==
X-Received: by 2002:a17:902:da87:b0:1da:2216:f1f8 with SMTP id j7-20020a170902da8700b001da2216f1f8mr6131279plx.39.1707706532745;
        Sun, 11 Feb 2024 18:55:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWltAXxT4Z5I23HaZAeyreKKr5A6zwnhZx747qv+QqQBOZ2ZZtcTpQ4qqJvcBK3aCnVPXPXY4cKY2s6M2O3dDjODm7lW2CSHWdxxVXcnzqZm36pZpUdtXgFNxzdUykLDhghcMVP9m15
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:32 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/7] riscv: jump_label: Simplify assembly syntax
Date: Sun, 11 Feb 2024 18:55:13 -0800
Message-ID: <20240212025529.1971876-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185533_432005_411D65AE 
X-CRM114-Status: UNSURE (   8.36  )
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

The idiomatic way to write "jal zero" is "j".

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/jump_label.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 6290b26f4a14..1c768d02bd0c 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -46,7 +46,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key * const ke
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
-		"1:	jal		zero, %l[label]		\n\t"
+		"1:	j		%l[label]		\n\t"
 		"	.option pop				\n\t"
 		"	.pushsection	__jump_table, \"aw\"	\n\t"
 		"	.align		" RISCV_LGPTR "		\n\t"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
