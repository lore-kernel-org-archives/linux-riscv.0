Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D943CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvYLxOozmX0n3Mv0fhg1UmFRABsCrd2gp12fwDARaR0=; b=bi4vd1gwSQrdBe
	cQFSRtgulX8Zp50RrOQTuiu9zAfine1IkuFUvzGNZs4j8pe8GbQvhQYp8nXx7idBWVzz9yraV+b4G
	UL48/PUby/DOOFgVxh0Uq9S4vLkALYvLwxJrOIJgIMDQw6nvv1Grunyptwn0+5kvyTO7HfTFpUtQ7
	yaxi89ZKlvfYg+WFPZJGlvr7m9v+/xkJFsyI6mcifJE/LgqXGsBkGl5OBGQg0YGu/NAh42giDl6rv
	gWVngW6CHbbQyTXKgovP6FhRyi2Xi4SF6OdEFDZiKhLfEgcnSDMSALqT3mwT4SlPadUDDUBDAmEK+
	4Lfi5+NiU+8O2oYTF0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQov-0000000Dm5g-3w8K;
	Mon, 11 May 2026 13:37:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQos-0000000Dm2Q-3Gp9
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so2956738a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506634; x=1779111434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=eYfzlrNlgfNxq6z0pDczyNH5s3t3O1xeN8J5bunI6IPwburBTXkdcxKDWQzqhMBdy7
         pKRDKrrxdR9HD4j0qfNHnCHwJlPRpjsNNgsWQVbnB3PuMw2HC4mA33Ez4z4QsXk3tMf2
         Zn4tC6NLSlulUz57KF+Euj+JuznIs6MnUrxXf9VSs8FXbQpCTB/7wkItw092u4vlKKUd
         XnfaqAFVj3Dj95JMLyEi/60U34H0nnOLVUe6J06i8Xd3Vbv7fgSDMO3m6tzg4FYB5I5B
         yXF2mOBz9SgglrqkkJkTn1PmRzn1DiuoB6obGxRRZY+lx+gKRltmFTr2pQeRrZr88R+j
         YmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506634; x=1779111434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=m4EjnvF97Ooi7d2Uq4jXsR1Fq+hvtOVptMwpJMPtPJZbHWnOvJJhSPnRGcts1olgJu
         3sH5fzBJMhXgbDZAr70WfOc83rR+9dHJ17jh5nF8qI+61eWLnv8NvdW3nhfTdVr7AL1q
         z6fzqdlw4xb+YH0j6QEMYgrAr8pE/QUK0gZ2k9lcwpK41xp71bOnSjcyIQ9d4PGuOi6k
         OvB6AbPvIVs1gcPyS1vdJ9/X92E1YxD+z01JDL/lfKU7zaHU0tJhLCdFFb8gVFTlo7r3
         oraC997Ztuf1pyb9HX2UCBkOHfDYza7iufjX1CU03sKmJX3scklFT0ktn0gwCSoqgfgp
         7dbw==
X-Forwarded-Encrypted: i=1; AFNElJ9lAyGEsTS9mnz4LQXjt5QYYNhN+zlK+3q4wr5X/t2S8R5+VlHZ7HvaoUh1yeRMtD0jb1/hPJhla1OS3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7cQVGpGq3/S2tuvdNX9SP7CzdyonrQaadISYUrc6R+UOsRICr
	webSM7GgvnLf8UR9dpvV2iyP+67jt9XkWePinEDvavq27onR30bZcimv1tdXrcAExtw=
X-Gm-Gg: Acq92OG0hyJt/+s3IdsezrylcsJRQ8sohAVo25rN3Kfo4SkbiIq3PIeqySVK8UkfRIN
	6C1KFRnSsN45GEjsPmFi8nPyr2MMWXsktqCfCiMzvKgaRhTxxiD+t7x03FdEWMxkyRORgiHX78N
	HGcWDTW7nBhsT0Mf7y7M/riZDLOJg8SnOF5hV1Yydt2fjI0IO92EvneL3D6w8/CYbhOI14tj30V
	a7Vk76D8FPLfZw5EcpfCX/BKoUmXfXraXX41cp/1a67UCgXQtORLI8SlzcunvFBqEngUWmRamnP
	Bd74sJ1EC5fQbS468a4DNU+vh7ZzYN4CFZgOchGlMxDq0YKA6+2Oo+bBctVxt3QhcB3DhemMOEz
	j3cg2QxsGxQpyg421z/s8nT3yvDXNvbjSgTzMqFeZiogpN9eitK8xaC6MZHLQW15m5eXsqilczr
	dFYq43g1fAtv05mn2HbigAMzF+mdcpk05WNHZT2y5BvSc=
X-Received: by 2002:a17:90b:2d90:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-367bc89550emr12198051a91.12.1778506633829;
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:52 -0400
Subject: [PATCH v2 07/10] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-7-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063714_958789_B3DE1983 
X-CRM114-Status: GOOD (  10.07  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
