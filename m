Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EACC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GbzfPUqnb4+4skLu3VgymQcsOdvRX0UeqAHC4v81XkU=; b=bEILkUQj/JDLaw
	oqhZCd771Aqx4zJX5YEazndpgqDDt59B760XibL65s9O2QIN8oeNdXrckK+FNWwDQrtXv78c7Z/IZ
	QerqIhYQO9RfPiFE+CfT/EEGCqG1AZCwQ6Hl72yplCjcb7tQ3RV2uQPRFgsFvF4CdVS8XJTUHRGtX
	u/hT8TYDpLJvVh/z6ei+0NvvGQmNFoQmM+QOntvRdZ4YYeafhpe8LjhWWN8GPAtm6u0y3y7XYDi/V
	rSuw26nkbo2f96mnlo7OEYa5h96oK79DhM+bXV9wocirHIYuVpTkis8uJyiOcN+qanB92oSpnwBuA
	3OsuB2yYDz+nwRmiAazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4z6-00000005k0x-1U70;
	Thu, 23 May 2024 09:43:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4z3-00000005k02-1xIU
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 09:43:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f332511457so1014475ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716457415; x=1717062215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLzDnmvqDgSFmrLKy4OzG8kv1xRa1IoHZC1hMXaY53Y=;
        b=f5FthbD0vogOfSwVsc23fZNAK5pHQElXH2kkCxqO+9AB4EplbSUFuQ6iQ7U709cfrY
         z1FvHA0QB6qMljOiOgKMGWSCnlJKx0WWKkKIhQX0/ls4oTd5gHpaDtSvKkrFqPHbr1Wj
         +Tou53ORE7NTzSsFptOvJ2YbLwo72TCWtGLoLHNLkFyAqv1Dr43pUMCE/3wb0cb9+bu2
         wQ7tSAsnU8q/apobziiQEztNr33MqDlAIUq4U2m56yqHWkTuDDuGonTq1+XTMdJRDewu
         L8Jjl519rQAMiJWZs7pr0Up6gHt3qrc+h57wqlZSND/NF2g3sK1DHLwJv1jQUEbTcuuC
         5HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457415; x=1717062215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLzDnmvqDgSFmrLKy4OzG8kv1xRa1IoHZC1hMXaY53Y=;
        b=hTQFBIFRxD6gUE4qRTgunWOmIv2Z/UBqftde5kXagobjHd6/mrebexIWGN1loFj88M
         uYGb5ApOJsTgg5CkcnqBzsRPjBwL7Qt97JpoEkXZ21/bzj51PWGatewmlLViUDLIVL3G
         vwaKUlpRXX04N2kze3sdEJeDHOWL0qXnMQT80yEssl55E78n1jbvxDcEA4hiBkfSFgCV
         djiCemn+cMAjylrjTHN148UZzSMNikers8eR3IKxi/6mSOC13UQK74b13dWQqKnfYXUa
         2m84dIwT0i8uQOFmi3MVpR7dD8yEItZCHzxWc7vvI8nPMfqsem8e92t4mxz5efP+Q1Be
         HreQ==
X-Forwarded-Encrypted: i=1; AJvYcCUee27gIel6Dhz6M7PkVM39pvOOU6p7k0QIBmZHsgzS62N68eRdd9NzVXVyTfxIQGIr2gBH7iZ9HMyY0wYt8eaaMkT/o5wgaTIGhsB86WQP
X-Gm-Message-State: AOJu0YwqC3xguM8EbEs3Ma052wqedz0SbC5TPw47PwA7xRXXxZvkkyuG
	vSnvfBkFQ+45Kf+RTT9m+PtqLd2ANSJr9Jd8Ym1Vx8owl0pfzVcOsVow/1ltEfw=
X-Google-Smtp-Source: AGHT+IEAU0OshgEKaoU32gTdPHX8D7QDVD1bKWrWAjLH6mLhA8ftQ4r/dhtz/a1/jyxEPLqOWA6CRg==
X-Received: by 2002:a17:902:e3c2:b0:1eb:3d68:fc2d with SMTP id d9443c01a7336-1f31c997f10mr32554475ad.34.1716457414397;
        Thu, 23 May 2024 02:43:34 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:6249:183c::26a:4f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2fb7a1ae3sm74139295ad.299.2024.05.23.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:43:33 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Xiao Wang <xiao.w.wang@intel.com>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH] riscv: hweight: relax assembly constraints
Date: Thu, 23 May 2024 17:43:25 +0800
Message-Id: <20240523094325.3514-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_024337_537997_24C03B91 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

rd and rs don't have to be the same.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 arch/riscv/include/asm/arch_hweight.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index 85b2c443823e..613769b9cdc9 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -26,9 +26,9 @@ static __always_inline unsigned int __arch_hweight32(unsigned int w)
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
-	     CPOPW "%0, %0\n"
+	     CPOPW "%0, %1\n"
 	     ".option pop\n"
-	     : "+r" (w) : :);
+	     : "=r" (w) : "r" (w) :);
 
 	return w;
 
@@ -57,9 +57,9 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 
 	asm (".option push\n"
 	     ".option arch,+zbb\n"
-	     "cpop %0, %0\n"
+	     "cpop %0, %1\n"
 	     ".option pop\n"
-	     : "+r" (w) : :);
+	     : "=r" (w) : "r" (w) :);
 
 	return w;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
