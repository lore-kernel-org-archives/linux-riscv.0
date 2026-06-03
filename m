Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39F8CD6E64
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzIeZlVBzERmPyIYBexSHf/UQEF74LP38ZSHqYcyFkQ=; b=0M8P3UHWQSoZue
	5cgZiZFqV+bF2sbUpw5n/ycBjenkLJyKdyPcHgaDsPzBOUO7mApJQnCxx65j2ii8rnUC+rcElXUe3
	tjy5gSR32EjqTHtLGpIINZuB5ZSAf9J3RyBCPjBl6yllKdTX6xxB6ufdiWnGoXklMDUSUago4Ec/A
	kkldqWjDJByP7/ILiFY0TFkGem+9t9R1X/E0ZbZMivhOXzdrn9S/530TGJK9YHBCnbAFm1B7H9YM6
	CMLiqNOjoVgBL81ZuKcSv7Fr3CQIPUaxJZ7YjN8vm4dT3E01RWvGp+2QmWr20+KF5BCMYFkYPz1dX
	+mDcmfu+SLAbBoX8C9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKI-0000000DwHQ-2pOm;
	Tue, 02 Jun 2026 23:15:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKG-0000000DwGY-4AuF
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 Jun 2026 23:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=; b=QwZ2kGfs9UWgIUCyhLcHbHygz1
	tCFQUEKwRg9r1UKdvdKaTLAEBD9/xYUpYEqBR+GLGTOVklJWSO9NH6tocGcOcJWG1zA4Yb8HFan6g
	GrL1L86a90ach/Q7YHJOjvP87LBrPEiU//0gvkYp+8dJCNwXHa7uNvJGKjJriW9juJAO6YpmuBhZ1
	Bhx14Uqa66sL3LY9jSj7ZeerkBdCd+lmpvSLn4Pp+jgXlE6B2KhcszzarrwT0ftkru6xshp+tBF3G
	XDIS+WQ9WrWCzCB3z2PbZUVDfklzc27N6DkmRoF2YIiJ8qhrzi3n28RmCFro4tgdveRjSVPdN6btx
	P6PVmVSg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUYK5-0000000Afnz-31u7
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:15:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so37414a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442100; x=1781046900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=PelFHTuM++P5boBUlME5Qok4sD8t0LvsmbfxM/8ePOaO5+41EUbSp0T/TNzcIrJ8NE
         FE5iaZPvsGzHyn5oqVoUnF5jAf95vXkdCzOQ7fFIX3qFZ7WYurm0dIDI0sIeuxYz1u3t
         pjRwd2AP53tNmBqULKic5ospM9FkbJsPl2E2gG7kOgygpJaGTh//egk607X2RpMbUkVV
         MK7XeO1w9n3G4kENjwgwyI+WdZfnBlQhxA0CxdqQPV7qxlIRMZ81MI9sbcovSoUPhbks
         amizXYL0dc299WdM1J1moRJyH8sZbaHgd/f/4GxOURd5teo1bK7YVu9jtdIr1OuPUA6W
         jsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442100; x=1781046900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=ZqLK2AcugW/jrIxfsA1lpl3bKoreFXWlziaJ4GMj4Duj6LuT4q9T5e9bsJ5UPRUkKe
         ajPEwxQu/0cEbuQd1Udd2H6+NHVpuj3kdBcpkRviEz3y499fZOjQvvAFamtts/xQEyLd
         lX9UXdxxmpB42fhQfooHjAAl4sS0ExBz2i7IL25obpthsHi86cCcdoQr9+hif/9l3avm
         iWObZGy1Is5/272Hjd4W47DPNRqWbh3QVrh9RGPum9pEgHYEvlvwAmBWQKMkwfOj26VN
         qOcGi00uc2BmxLnaYzF75RgwLYspfWJ18a3pK82UyrJ4W3eGDE65fX3rj+0F/vYINqRK
         AqWw==
X-Forwarded-Encrypted: i=1; AFNElJ9xOudllY2BdZuwibKBSw7BK2495Dgq/1iyv8O86RvmEHjMEQbJrfODEMP1KE5l698LxRUJgHas97r4VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ3I/x9b6hh/y1aWBNFOa87aKohM34KBzcmGwtkjc0bLTbQr3H
	AAhCcFM8wEmkfk7SLs596E+otLJc8QNnnVK1x7WcwP1RjKMqC0V7OEoB
X-Gm-Gg: Acq92OHpn0kgPpDAqYgSQlcPK/7GdcaYM3An/mQWliWL30ImJ2a0nFcfaL/Q5Kz821z
	Ok2OUpFiBjbcmG7T95jIXjpejh9B8zMuEgPW3iu9GufsSAoH3OqgEm0molVGeW35bxq57OACBbk
	2eNOzD06TY6tSyyRtxxrvLL8IroWT0UvTutbYskJ1+ugZlEzq86T6hQHlA18/9U+GoDQUDpXUWd
	vKTak2nIVQXJYwkl039IyV4VpwfRor393YwGR1EnO0dOVq1CTjp2iNXnuOyQRe7tj2lLV6g++Qd
	rBUqJ29jUReOilbODtKM3AHixwe+VGTTrHgcn9frdeYxXnpFZkU6FfO8K8sEc9PEX741Rerr4Mg
	wL40dezuRVXrH05YOReTIE4A3ii0ULmyLUrho+nUkiv/hL/oHfLL7pEE1IePrUhrKOfseFWWpI6
	I8Xo2lGfnb+A==
X-Received: by 2002:a17:903:37ce:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1646eaeacmr5471065ad.10.1780442099816;
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:07 -0400
Subject: [PATCH v3 12/15] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-12-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EL8rlxjtR8czox+vDhBwL1idMRjEpfUrJqNmOC0hv58=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHrZY9+q9B3v8ZK6p7otLtTvI4VC+6oT7t0uLhDc13
 /XllYvtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIm4SzEyzDZ3u9ASoOlvfSuw
 pOCJRaxy6cHlb+Zqq85+p/fB6qJvGyPD/E0qV+YFOtwqmPx9rvh/8bKo3NgHqXcrN6WX3/cPMJn
 PCwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001507_537017_83C17F0F 
X-CRM114-Status: GOOD (  10.96  )
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
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: No change.
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
