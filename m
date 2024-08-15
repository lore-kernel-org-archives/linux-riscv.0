Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81651C531DC
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+nxXXjU+HtSJhvbnhfPNYxq/458e4jM11NB2r7Rxws=; b=zXVVPBsoWTuB+T
	cY3Hw5ed7Zjz8YnWKVIpI3rKvya9W8UJHCARWQw3c6GvRLb8D02Wb93jM5OJYA6ehhtDc24fs88b3
	uWUsCqeFxIcIBt2jeSM2Ao9Wlz4DlJfkBcPeSuNkvpWxENy2osFSD6SwnoGqmM/SRniQOOragAX99
	u3+OHF4cPpTywMb+HK8vGhi+clMHp6X6Lf+CC2IlAAVRSiaeRl0zFRUaActM061XSFHPauDue5jS4
	76KjESVcYtmbaFkJ6RRQsfoMvW5jQ1TD8fy+sHRtiXZEXliZSE5J/Fz99DgwX+oknxM7DkzT3NP8P
	wTCsc4LB5WalSDEf0dZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seOno-00000008hBH-0Tnb;
	Thu, 15 Aug 2024 00:57:20 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seOnl-00000008hA9-22a5
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 00:57:18 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-27002047ee6so191458fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723683436; x=1724288236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QWDwobnkCHc49Gr0pve6ji7mHLerdNm6SIfbLUzFN+s=;
        b=SRaK/ZvMKLhovkMP6z13/CQF2IpTMHDbGXQ9w+Xz13UeYFlr7dZp2OAEYLTh5R5W/X
         higueDXTWMP5RO67SJrmD9kjqs8vf+zeCQD++PY6UkBohMylwp/zFsUZUmR7YOY5hIJL
         uvWt0YAYXviPlsMPnn8+e1uDLy96Rw6ilo4WUsRsLlWmvLMDNzLHEQ1y/D1UzJ2i1b//
         wV+wFlmlrHMIlEsKNj3qMeOEEMqA9seB6anRTN7+7ZkSFe4Ww7eHxIa82kfqaB0ou+D3
         UX9wJn+OpxSW34LGUV5j+VQ0uE+rFlOPI6yCNmZ2xOstTxIg4XI5USwH7GXbenRyoO5u
         ENrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723683436; x=1724288236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWDwobnkCHc49Gr0pve6ji7mHLerdNm6SIfbLUzFN+s=;
        b=M0R2nPwH27oSO5y3IHpduR3Gc1KJqzj32BtFxh2ydo+V/1cSC7weS+Q90V2e3XQlMk
         U19KtJOQxHhE9I8ebPV7DP5e1E2diZPRsDUdRQUYOb6r4MjX2+PJmHkFkJu6hPKX67Qp
         MJ1CrsE7uf4iMmgLy43VIVgtfJwtt322N0PdMH+b/89qJbsnIV5Wn0R80d+wsAsGwScs
         wbONC+0+nI94Aj9oC3NCMy2RFa+o5KjMaAwRcV6tDgyApqCODGQaW9xDipN2FKFSJA1W
         B/Tn9NRBvG9e53aXg2w6AMxhDBhBZunHrFidBl7l6QYT4It0vT4pDzw+oGncEEknfGd7
         DLIg==
X-Forwarded-Encrypted: i=1; AJvYcCWpgmJ3m/k6zqOi+P9i7aMw0F/qzxb14s35pS7roMGfaUQ7MWxshtH1Y6rbJGF4QGwat4lkew4y9q5dfb5TQ2eLt4zO+Kevsslf2fc55u+j
X-Gm-Message-State: AOJu0YzFZkN6jJG2zl3Cl9CYnBp2gFQ6HtBs+yxPWUQkCyJuoqgt+EoN
	60i3oS0VYbGyRcZTO2vEttnNtnjrTyYVTIqBGWILiOanhmVclYJVbT1CIRKdf4g=
X-Google-Smtp-Source: AGHT+IHC66VEYQdljRuTuSO2x/zOwIVJbZPl2UlJTONTu2DLilQDdVvPTmdGUvtQ7FJ0ndbu7er3LA==
X-Received: by 2002:a05:6871:328c:b0:261:d43:3eeb with SMTP id 586e51a60fabf-26fe5c082a6mr5371911fac.32.1723683436253;
        Wed, 14 Aug 2024 17:57:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b63570a9sm164518a12.60.2024.08.14.17.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 17:57:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: misaligned: Restrict user access to kernel memory
Date: Wed, 14 Aug 2024 17:57:03 -0700
Message-ID: <20240815005714.1163136-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_175717_703928_3A0B84C2 
X-CRM114-Status: GOOD (  10.77  )
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

raw_copy_{to,from}_user() do not call access_ok(), so this code allowed
userspace to access any virtual memory address.

Cc: stable@vger.kernel.org
Fixes: 7c83232161f6 ("riscv: add support for misaligned trap handling in S-mode")
Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/traps_misaligned.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..1a76f99ff185 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -417,7 +417,7 @@ int handle_misaligned_load(struct pt_regs *regs)
 
 	val.data_u64 = 0;
 	if (user_mode(regs)) {
-		if (raw_copy_from_user(&val, (u8 __user *)addr, len))
+		if (copy_from_user(&val, (u8 __user *)addr, len))
 			return -1;
 	} else {
 		memcpy(&val, (u8 *)addr, len);
@@ -515,7 +515,7 @@ int handle_misaligned_store(struct pt_regs *regs)
 		return -EOPNOTSUPP;
 
 	if (user_mode(regs)) {
-		if (raw_copy_to_user((u8 __user *)addr, &val, len))
+		if (copy_to_user((u8 __user *)addr, &val, len))
 			return -1;
 	} else {
 		memcpy((u8 *)addr, &val, len);
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
