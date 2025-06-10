Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474EBC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fVz8g8G4oxZhV5A9EB+mDgQ6oPVX75GI1ZJvGYcVVoo=; b=cr8jaHfQkPTcpx
	JE43TjYMn52tbO2t4l1B/Au370r/tC0mg/sSd0aRX8L8GcjKLYMDRMlzD6l6VXty7RtrV1F1kw/id
	xQWnEMeJvewq5GGQpZFxtZiAfe8WbDMO8+t0x22H+anzwn083LVGmXin9JO7/3ZX0uYcMxr7OgFu2
	NSaG6glDZ0GcHCplRcGBRGOLsSe47ViPckJ8w+roHQ0ZddQbO1do2zrhcpIc/NIuKm0eWvCDMlxaZ
	JSB2TQZq+//SNW2jZw81gGY0kyiNXHiM4VKqsu9CwuzAGNYXQzizxNlCFa3F0102W7e4wwj9M/elL
	W4cyCcLCwd8jAo+hwptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nw-00000008JTd-1EWs;
	Tue, 10 Jun 2025 22:50:52 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6de-000000087eB-1Hi0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 21:36:11 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4686980b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749591369; x=1750196169; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=KaHHQEiupZ06D+yq5AKLPI1+m/XTQ4+XHbDcRMw88EU=;
        b=KPnVLL3cj6m1x3vLAFbW965Z7L0YRXKXnaxkJ5w1fYUrAkvErrlF6a0kq5bAwUu9Lq
         X5cLhMMgVtvya5Su6yIP1mWnMeIJd0p0155GE7oOjkAchnhhrwgLgr/cbN1USnKtnMJ2
         MiPYeNF2+CMGVKb4L7vow/dlfI5bdcm01CTdZS8F9fXGJWjZ188GW97lxMCDU7Qg6t23
         1Dxglu6FsbiIsA3SmS2FGckYH1ozBoscc2UG6kmJNRkMa28rRVCsbfQ207o0hFnRm8Kh
         TiG15jfH0usxvHNM3rwIPkkg8+G4hiSEy61aNCeBCS9Ho2/EYQro1Cl/enjHWCwddW77
         gcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749591369; x=1750196169;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaHHQEiupZ06D+yq5AKLPI1+m/XTQ4+XHbDcRMw88EU=;
        b=Hf4a6ybQAzKjHcfQ60Il0hyVWnS9LzjO1dQSego0X1GtVEMffg5I3tC8v4F7j5kEbc
         bq8LKDD2C+VP0YYTodfcTCOJmfp/ksTvo7fWv62hIKeMdULFrJivfCN+8jaQG+D6+Jvr
         RZl79y6p0PJZa1X+12I2X9dZDRnLVq3ZDQZaLjG+/GfVXE9flwJW0MPQVBoAL48ifizx
         dNLVZrB26ttctQNiC7wSzgG3EESLOS8eSCVbs0jIJaamsrQSsBfZgG0qcf8OjDQVEqiC
         JCB8PzYSTWfVTauL/qElaIPFB8Nf+5MNrbtlkpVf9AqnUepRWrPTjcu5WqLC98IxY4z0
         gLSw==
X-Gm-Message-State: AOJu0YzEhxbUJ89ZvebDFYkxHa562L7y0k2hbBFHwCt9O0JXpgD0cD/M
	VRmZzpsGdK8yuELUk1eqIla1hW3o9R8mVFz654FeAT0fYD8CAOwpy5ytB1F0rwOywyw=
X-Gm-Gg: ASbGncvTkWtUog3MBXbTKr+ELjzdD+hxRi+hqRy/9iJ5S4+qNs7oCDamIDPhQXJi0Gj
	NMInZnC8oG8xRkD1EWR+ECbfa2UEaD/tkkOwmhsOdGBicFnJEGs7MC/gwjytnklpqa87mlpoXvu
	Q6ooXBOEAtIB8VPcmxEJrHXoA9sDRkFoH4l0+SHlQi9sY5SNlk0EcwMl6zhZzv7diaKHhzYpxSd
	1UxFU+n7JDIKgasbhLe+JhM97uXPirEspbUy0uulg5Jp5zaWdwBolvoDtZQlnUnV6l2D6Q8QcL/
	G3Xp75/QGFG8zQmyMbls6UKXaK7SUdANLGTs1Cd6wM/GoKkocBidIU9AhknT
X-Google-Smtp-Source: AGHT+IFYYIeiPz9kpoQxtEx9N1kGD9o1EkK/pKiuLs1MruLC/T69Bnqe3L89R/Uj9Yt0DTdGl5i/7g==
X-Received: by 2002:a17:90b:4a85:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-313af0f8588mr1387259a91.4.1749591369214;
        Tue, 10 Jun 2025 14:36:09 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313b1ff0fa8sm78207a91.8.2025.06.10.14.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:36:08 -0700 (PDT)
Subject: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
Date: Tue, 10 Jun 2025 14:30:58 -0700
Message-Id: <20250610213058.24852-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, cyrilbur@tenstorrent.com, jszhang@kernel.org,
  cleger@rivosinc.com, samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_143610_346012_4DB634AB 
X-CRM114-Status: GOOD (  11.98  )
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

From: Palmer Dabbelt <palmer@dabbelt.com>

I must have lost this rebasing things during the merge window, I know I
got it at some point but it's not here now.  Without this I get warnings
along the lines of

    include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     3975 |         if (unlikely(get_user(c, path)))
          |                      ^
    arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
      274 |                 __get_user((x), __p) :                          \
          |                 ^
    arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
      244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
          |         ^
    arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
      207 |         __ge  LD [M]  net/802/psnap.ko
    t_user_nocheck(x, ptr, __gu_failed);                        \
          |         ^
    arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
      196 |                 __get_user_8((x), __gu_ptr, label);             \
          |                 ^
    arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
      130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
          |         ^

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index d472da4450e6..525e50db24f7 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -127,6 +127,7 @@ do {								\
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 #define __get_user_8(x, ptr, label)				\
+do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u32 __lo, __hi;						\
 	asm_goto_output(					\
@@ -141,7 +142,7 @@ do {								\
 		: : label);                                     \
 	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
 		(((u64)__hi << 32) | __lo)));			\
-
+} while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_8(x, ptr, label)				\
 do {								\
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
