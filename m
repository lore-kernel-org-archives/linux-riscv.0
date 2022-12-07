Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A833C3A5A7
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeQL5t8rv4bsh91A/8nUcGIf13wASLiLQhkK6NCdMsc=; b=0AyaoW/63not48
	jW5St3bPgVzgcylXkyhXMxsYEZeJbsCPFaWcZ7l9jyRW/5oEgC2nYgpM55vwKvHXXAn860oQgbUEL
	YeAgxpLLj6g9e7GybDmCf1Ly56lnZf+zYnkog5Mml9DawPLYGNggw3rg2lQeh4Smh0OA6630ArpTj
	MYxC0eAiqZByL0R+aWnr/piHRwtIowjW4uQcaExrz7hW1IgvYiMLa4MIsDceJC9B2UEucFM5eAstd
	T+ahH27jNUEQHojrgNzGyLcX+lXEnvjlRsyFKDquTh2vejdoTLlMDjHOrqRHFY7bcJYWg7qYFTWPF
	SMT7gPjbr6w5RsdJkb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsW-008L3e-Jk; Wed, 07 Dec 2022 02:09:44 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsQ-008Kp9-4a
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:09:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id g1so8220156pfk.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5+at85UtWqvk/Neo2BiHc6ReDYfFYmCsYeX8ak25fQ=;
        b=DwtTReeC3gdU0PLfPbTLY1zwGzL0wtdlTUlxtbRe/NIRuZdqnTUHxizLwGN5mRaJXR
         0RSPjPsj7KQ70mDBUJA0FMIVVmnt0ziTgAMruQozS2soohCBxn7S+ZiDg9/uWnUezhQb
         OArM4HQhAmU8x9TEadOWv00d5/2uSUjHfJn4v4ZynuUSE2C/xwyZozyzx7RtASMmSNH9
         XuSJ9nK8xdbvZDczCBz6Z73gf3KImwxVYiCi3MJlZXde5aOtA3mfi2ZvaDZWPf2SyVIf
         bA8tlrhoZaEVC5nmKVuI0WZwJDj4Z4cxXSTss/IRlDEaYnkBI00gBMQWxDk+oVXXu8Cp
         AaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5+at85UtWqvk/Neo2BiHc6ReDYfFYmCsYeX8ak25fQ=;
        b=UqrApyBAdcCGc35oheS2vk+HXKlb72cCJehNK/Nrm88qBmhXnb/JZlHJRL1Ro9+dWu
         Mh5J3EadImpR9q4lO+rnm8Xh2atJhCqQPhAnE0/f0c7rnh07CAJcLL7Hmq26d6feXO9X
         QXlK9Ty52IYTv31hW2DUTwYGuh79wYPIU/a3JHWeCLdZKV91+m/TDgNZaQ3t8cAmlNog
         peAbIZeuhPtNA4v+apZLlSMIIeaARKENdvAkt7Oq6ZXM2ZHKv5wkiTwV1LiRjkhUFFQG
         mBfx/LZnt6TImdD7EphgbGXHJLLuopya/QEYYHMDYYWRP4AsF4OZbh1x8QXL2sX9gtwD
         lEew==
X-Gm-Message-State: ANoB5pm8loC4lGKbyzmge8P0rr5UCmRIsUnihVuu6gb6p9jMFENU9q6O
	LsOKpnhcKBo3/m4O3NV4/hHd2w==
X-Google-Smtp-Source: AA0mqf5F+ZSPsyUqJaHjvitjGAjatk25hItKC0UkXb/QzxdHgBTbUC6oVEaH6ALjwjVAMJgwl89iFg==
X-Received: by 2002:a63:1d47:0:b0:46e:df6b:b87 with SMTP id d7-20020a631d47000000b0046edf6b0b87mr61154759pgm.540.1670378976627;
        Tue, 06 Dec 2022 18:09:36 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id g15-20020a17090a67cf00b00218ec4ff0d4sm51345pjm.6.2022.12.06.18.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:09:36 -0800 (PST)
Subject: [PATCH v3 4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
Date: Tue,  6 Dec 2022 18:08:15 -0800
Message-Id: <20221207020815.16214-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>,
  Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180938_220954_520DB00C 
X-CRM114-Status: GOOD (  11.16  )
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

Implementor does appear to be a word, but it's not very common.

Suggested-by: Conor Dooley <conor@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 02e6a48809ef..adadbbbf5bf5 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -26,7 +26,7 @@ specifications from the RISC-V foundation this means "Frozen" or
 ECR.  (Developers may, of course, maintain their own Linux kernel trees
 that contain code for any draft extensions that they wish.)
 
-Additionally, the RISC-V specification allows implementors to create
+Additionally, the RISC-V specification allows implementers to create
 their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
@@ -37,5 +37,5 @@ RISC-V extensions, we'll only consider patches for extensions that either:
 - Have been implemented in hardware that is either widely available, per
   standard Linux practice.
 
-(Implementors, may, of course, maintain their own Linux kernel trees containing
+(Implementers, may, of course, maintain their own Linux kernel trees containing
 code for any custom extensions that they wish.)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
