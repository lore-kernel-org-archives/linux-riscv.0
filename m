Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A8EE57C5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXEcf0sF3opoxlVsvcv5K/Z8gI8JATtXvxl3jhciS50=; b=OclnHMcGPVtAHM
	IOF+7Jxe8fHK56Wu0+5XH1vJzL7DkST/g1YXU4F1QZpP/I8Wo5h2inlgOMWVEoQqEGGqP+rJdgu9C
	60nBB0/AGL8n1Pdm0dP7QSy9CGMAx3TFNnyol/0z8PSJ19maVTJF+COR2xtBZ0VNuJ/tq6ujuOiup
	xgOYj67BwCtsQJam2+vYHLtYSpG7XBsYgFWg32neeDaaH0e5FlCXOsbDw3hrbzpVm3L9xxZi9mhU/
	D6FO765ESLHzWt1lhKgdINrUWgwYM13lmtzA+0DndYSvS2N61zSiNaRzGZV4hUiyyNUdEyFCqxVxW
	weiIJ8bce1Ychi8TMNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeTp3-00D562-1l;
	Fri, 08 Sep 2023 05:14:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeToz-00D53r-0e
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 05:14:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c1ff5b741cso15188485ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694150058; x=1694754858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tb8pM+MPCYZ04bq/QFSvT9K0qDHTT+G01Hk2Be9XTNw=;
        b=NriCw5qUyj72XDzVixN20knrv7AdFJUpqn7CEsAikf84ZxxJId+78lmlIHv13jhhB/
         UqT5imqF8FcqjOD8QmUeO8lXX4BJ1IGA2SjlEyrzwj4EREUtXuYRsaZCrAuL+yfYilvW
         bEAXubTW2LLxcMhiR9pCgM68ULK3EhigFtCN2MsIEY3DzbG/qMyx3lewfLWamdar2TXx
         K6OfoC2CdRHGlK4CWVKAZTJCkzwpwZpoZmo7BpDVIxvJqve2kwaFFQFoy9NDc/Z1mmM4
         oQu2gAvU0XccWCoAxwnBGxB4Dhq4eg1GZYLiDhRe2VC3Qk4x3YKT6gSZx4mMmu2Keetv
         ZFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694150058; x=1694754858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb8pM+MPCYZ04bq/QFSvT9K0qDHTT+G01Hk2Be9XTNw=;
        b=edZ4eTnHx9j476Bl7dwFUCRjmuZhrM1PLyaWQw2kYW6dNhicRLMM+/aC5Di2YVbsvV
         ZWXX7sBmmWsGi2gqNu9WGUz7lt91qAJUim4CVqU+DNI8k/hMfIPI2TtJOUNbf9NgybHh
         Nuz42yU/cVDHfRjdfJU/la1ABtOl9MeAMgt4PX6ItArSfUF6MoDNsvyGL2Ky0GzaxjQ3
         0N+if1GZp5CIwot+hIH79tuWLKZvdQbtBpDPVPaJxMxeOcvdOaqUwf1wK10vNESiJFO3
         RObDU6IPhHolpZSRUIEMdDEtog5HmOX/E3ppMHQXSFHrXbPVCIYVPsd9ltLvNWnNN/rv
         aLnw==
X-Gm-Message-State: AOJu0YxJwYgXOLK8lUprvpgXT0h8HrL3TqFqDhunt0FBJyinFpdnMr8O
	YvFRpw8P7jHZyfr/ty/O1Sdfvw==
X-Google-Smtp-Source: AGHT+IFBqUUWXwXlL8D68eWvUTcpwF+xAzJRUMAJ/rVJU/Bq3kgu1zeZuihVaei+WLU5e8PNJRGlNw==
X-Received: by 2002:a17:903:188:b0:1c3:188c:a347 with SMTP id z8-20020a170903018800b001c3188ca347mr1763284plg.54.1694150058335;
        Thu, 07 Sep 2023 22:14:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090274c500b001a5fccab02dsm616482plt.177.2023.09.07.22.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 22:14:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Sep 2023 22:14:06 -0700
Subject: [PATCH v3 3/5] riscv: Vector checksum header
MIME-Version: 1.0
Message-Id: <20230907-optimize_checksum-v3-3-c502d34d9d73@rivosinc.com>
References: <20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com>
In-Reply-To: <20230907-optimize_checksum-v3-0-c502d34d9d73@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_221421_239246_04A3394D 
X-CRM114-Status: GOOD (  11.57  )
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

Vector code is written in assembly rather than using the GCC vector
instrinsics because they did not provide optimal code. Vector
instrinsic types are still used so the inline assembly can
appropriately select vector registers. However, this code cannot be
merged yet because it is currently not possible to use vector
instrinsics in the kernel because vector support needs to be directly
enabled by assembly.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index ced276dcd6be..f7b328553a07 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -10,6 +10,10 @@
 #include <linux/in6.h>
 #include <linux/uaccess.h>
 
+#ifdef CONFIG_RISCV_ISA_V
+#include <riscv_vector.h>
+#endif
+
 #ifdef CONFIG_32BIT
 typedef unsigned int csum_t;
 #else
@@ -43,6 +47,77 @@ static inline __sum16 csum_fold(__wsum sum)
  */
 static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 {
+#ifdef CONFIG_RISCV_ISA_V
+	if (!has_vector())
+		goto no_vector;
+
+	vuint64m1_t prev_buffer;
+	vuint32m1_t curr_buffer;
+	unsigned int vl;
+
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		csum_t high_result, low_result;
+
+		kernel_vector_begin();
+		asm(".option push						\n\
+		.option arch, +v						\n\
+		vsetivli	x0, 1, e64, ta, ma				\n\
+		vmv.v.i		%[prev_buffer], 0				\n\
+		1:								\n\
+		vsetvli		%[vl], %[ihl], e32, m1, ta, ma			\n\
+		vle32.v		%[curr_buffer], (%[iph])			\n\
+		vwredsumu.vs	%[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
+		sub %[ihl],	%[ihl], %[vl]					\n\
+		slli %[vl],	%[vl], 2					\n\
+		add %[iph],	%[vl], %[iph]					\n\
+		# If not all of iph could fit into vector reg, do another sum	\n\
+		bne		%[ihl], zero, 1b				\n\
+		vsetivli	x0, 1, e64, m1, ta, ma				\n\
+		vmv.x.s		%[low_result], %[prev_buffer]			\n\
+		addi		%[vl], x0, 32					\n\
+		vsrl.vx		%[prev_buffer], %[prev_buffer], %[vl]		\n\
+		vmv.x.s		%[high_result], %[prev_buffer]			\n\
+		.option pop"
+		: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+			[curr_buffer] "=&vd" (curr_buffer),
+			[high_result] "=&r" (high_result),
+			[low_result] "=&r" (low_result)
+		: [iph] "r" (iph), [ihl] "r" (ihl));
+		kernel_vector_end();
+
+		high_result += low_result;
+		high_result += high_result < low_result;
+	} else {
+		csum_t result;
+
+		kernel_vector_begin();
+		asm(".option push						\n\
+		.option arch, +v						\n\
+		vsetivli	x0, 1, e64, ta, ma				\n\
+		vmv.v.i		%[prev_buffer], 0				\n\
+		1:								\n\
+		# Setup 32-bit sum of iph					\n\
+		vsetvli		%[vl], %[ihl], e32, m1, ta, ma			\n\
+		vle32.v		%[curr_buffer], (%[iph])			\n\
+		# Sum each 32-bit segment of iph that can fit into a vector reg	\n\
+		vwredsumu.vs	%[prev_buffer], %[curr_buffer], %[prev_buffer]	\n\
+		subw %[ihl],	%[ihl], %[vl]					\n\
+		slli %[vl],	%[vl], 2					\n\
+		addw %[iph],	%[vl], %[iph]					\n\
+		# If not all of iph could fit into vector reg, do another sum	\n\
+		bne		%[ihl], zero, 1b				\n\
+		vsetvli	x0, x0, e64, m1, ta, ma					\n\
+		vmv.x.s	%[result], %[prev_buffer]				\n\
+		.option pop"
+		: [vl] "=&r" (vl), [prev_buffer] "=&vd" (prev_buffer),
+			[curr_buffer] "=&vd" (curr_buffer),
+			[result] "=&r" (result)
+		: [iph] "r" (iph), [ihl] "r" (ihl));
+		kernel_vector_end();
+	}
+no_vector:
+#endif // !CONFIG_RISCV_ISA_V
+
 	csum_t csum = 0;
 	int pos = 0;
 

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
