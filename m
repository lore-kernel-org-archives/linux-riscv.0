Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A85C4707C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFpW4PHq+CvwQcL8l8m/x529BYHyEBdfn/NHHxDjswA=; b=0j2jPSwLc9o5UH
	hjZ9yT2ci07QspTLCCDxzQZAx1Nh0eWAHRyIBLtA0M+fgamygiWl/nRxU4cczjrbr2qrrE/okAzPs
	h0n6weIWl6d2r8oSEw7k8DaNw6bLFKc/fi+zhPV8+U8txzelO6kxt7DnA79bQ5fDLAGATK1HoyBXx
	msHI2+l0vHJJ4LL75OSZ81V2yareQQ2MESw0fQUr2X3oI1WruNjxQ283Fnwae9NqFl23w48EBO2eV
	H3fQfOSnA75T1db5OUCtFiZtJvnsQ01xy8w1L+zYNKqvHTSQN2dZTOUaVyYd4+m2qb9YmDcc+9PQP
	Xn+8WyTSDIR6eifWJD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcP-00F73q-1e;
	Thu, 04 Jan 2024 19:43:05 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcL-00F71Q-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:43:03 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35fc5f0f9c0so2990435ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704397376; x=1705002176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLVjvsKzWbuu1Tn6vfa7DAnWzdMErwoBxrG3TwM6ilc=;
        b=lJcoaUuFWK/A5bsuFloV5FX5kXNuTcGSmF/s918mNbocfb8Vmlg8FB6Na4MosX/Teo
         xAZtyrNpxnC75zUzic1Xor9Rja4xx2IuO4x+RCbUZblI5bf8cgtJ20w4TpwzO8M88gS/
         MjGXfEVe3vPxmRswcyx2WkOsgwKQlnrI/yuumY+GU+7pp6UUyDkfLt2Dnk5w7LuHqyRd
         ZkdbB/eU62T/pNl9qva4GMkcn48XKZG+ezh7FC/x6aIFpRecGoXUkhod/pvXmnm9lzWd
         UGUqacvMb6TuQjAKKPq68D1HyRgtxTLNZY954UqYS/cTt/q0QQGkTvyr/AEWcrlkW4TU
         sVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704397376; x=1705002176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLVjvsKzWbuu1Tn6vfa7DAnWzdMErwoBxrG3TwM6ilc=;
        b=hzjcyIIMIUANT8p/eLh+9rT79YCn2P4ryAmF8RK7dm+Paj29KjtbFdGn2+dANYtPOG
         Z1pn0X3EC0NpoCIXsX/Y+izETcV5iNXMRUmOX6vyCwM3WanM6Zvnp6aeJxQKN1psOE7M
         7bAoQVgpbNMglQoy9jwbn8k8ZMRigpMt1fb8BTY86lTD2zUJYyg4KQk+hDH4aZSTHjd/
         nOi3kN7PzAAx6hrEIppmFGBONHqYOSX+Jn6Ls1TpU8q3LumXG5bTxSxveKi40aSW109G
         20FCMpFomRTZlhanMPmp7jueratKuDWJYNmiIUujVYRtso/XiPSCIj4JQBM5NKwQZXMM
         vorA==
X-Gm-Message-State: AOJu0Yz9oWwGz46/k2QiJMQhkpVxKCAM61A112w0Nz2tG+keO4TUMFOV
	F7Ytyq31pKx3rsvA1gP/EB2S/fbCGUJ5QQ==
X-Google-Smtp-Source: AGHT+IFm+qeZXnh4PvWyj6eeezVL805LTax37/sq68iQqd8SUNlSbsETWbuY1iXc3g3AU1sH94b8XA==
X-Received: by 2002:a05:6e02:1be9:b0:35f:e306:cc2d with SMTP id y9-20020a056e021be900b0035fe306cc2dmr1172109ilv.32.1704397376337;
        Thu, 04 Jan 2024 11:42:56 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o10-20020a92daca000000b0035d0da89a0asm19606ilq.6.2024.01.04.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:42:55 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 04 Jan 2024 11:42:47 -0800
Subject: [PATCH v3 1/3] riscv: Fix module loading free order
MIME-Version: 1.0
Message-Id: <20240104-module_loading_fix-v3-1-a71f8de6ce0f@rivosinc.com>
References: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
In-Reply-To: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704397374; l=1064;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ChQMN8HXWHXJl0z5+9ukmO+5sTC3VuwHdA0xAgdz31A=;
 b=Nc7YMdNtkiogT9SuSOwkwklZUSWSzuGSMVWI6Jj/7Ki7kHxfugbk8U/yTQtvOO8OlVcnpSpoY
 O5QMhR5H1UfAHoQ8EspkwAbM3BL/hJ40b6H9Oys/ELv92VYszOq6yck
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_114301_214465_237DB22F 
X-CRM114-Status: UNSURE (   9.44  )
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

Reverse order of kfree calls to resolve use-after-free error.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index aac019ed63b1..21c7a773a8ef 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -723,8 +723,8 @@ static int add_relocation_to_accumulate(struct module *me, int type,
 
 			if (!bucket) {
 				kfree(entry);
-				kfree(rel_head);
 				kfree(rel_head->rel_entry);
+				kfree(rel_head);
 				return -ENOMEM;
 			}
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
