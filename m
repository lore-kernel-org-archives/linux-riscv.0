Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82241C83F0F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTWzgRFpQZkuDbz+EL7vweqlpx5cJUMNp5OJUsJl99s=; b=LBTQRPBlC+I6Lp
	2GcKJ/s+akx6TK+qyG3ClgPJknd7r5p41iKbxKFRgzPmMXftdohnj8KUbNAg+fhnm78yAu5HKSSaz
	2oSsDRndbvlkDJNjKrOXQyiO5o2OpR9HGHFW4lqmjfqDDvfb69giAST5FHSOcOGcFgLXSX+Db1+Ry
	Jpf2YuMytPeFinvFawUCyePK797IcbkJuvmo9mc0X83Zek4f7p4MzB9dfKfRg70NjHZqwh9A15Aa4
	ydFX3w5/Zyfp+1IMxT8sscdlPzZ/2TGmdOZ91wjjJ+03C40tBwxfS7f4VdNMTias6eMI41TRPwoGf
	GGOnS67TwR8pWSs0OIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3xL-00000004n2t-0OpU;
	Tue, 08 Jul 2025 08:45:39 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3mr-00000004lLp-2DqO
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 08:34:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso2293775a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751963688; x=1752568488; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=km9alGI0XcL6Qvzjzja6icFIdbRKvCumIapJv3kvhgI=;
        b=UQA6c7U8pH+OhvTnDR4uTfAkEwCwsrOLceTweY0uriU4TGppue+R2ViG/H0b3sck78
         vzR9poWp3jvcUBQDzlFTy/qQ2Wb6x+6LXpqJ7iVQ2cTyEeg8yRe/UFdBl09LdqUjYQG9
         2kHB664XghModSgfE09s8QFzqe9wYxlM65PsCravL7hzGfKDh/gtklLF50y6LngpGWEi
         NtsHgsdmXBO2YYfge2vrzFXl7hvhLKhpPCKzvPXIecBEuXYVJTG8ivrIRjPbYSkbmOQ6
         BjUO8Bc/aNsRez9GtdT8SGcGFXnY/Kt/9WlCOmiUuzSpRYUIYeK4QIOzMZKJOXjAYWAW
         0V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963688; x=1752568488;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km9alGI0XcL6Qvzjzja6icFIdbRKvCumIapJv3kvhgI=;
        b=r4Nih/+69ZeV7ExH5L7pzQy7CmB80XLiEBnpYxJiooR1dZQIG9pIZfr5cioXKvVGjb
         PpTlOPX3+M5lesd8Y1RLr1EDg+P7+JLezNYNFLfgiZlS4UVum5xangySgXKc/P4IOpvM
         oiMAh1S9xbaK1hUDaW3su2GavQtnBZkVsb0BLUWPbGJQoO7qnRRnaY308/NJtgD96Myv
         FqYQeTnNAEuDuWAEjDT+0Ae8bs2ItHsNW3C6rFQoMuC9TW5lthR6zX1w+/CCRo0Bmq5G
         G/j2AAszKQ/kyh6ISEiRLh218PqUlWPn2iVUCqh0sytlTV0w1bODzIUpp/GzH6aXnGH+
         uZLg==
X-Forwarded-Encrypted: i=1; AJvYcCXS37jHktj0mTmXZadBx/1YuRHCIADQl2iwuxcDAyqtRPkS6UwE5yHllsuQu8CohJVb6O8+wArR2oK16Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXPjBlFfchAbDubBOdprcl88Yw/gyM650url7otyp4oX6XfM0J
	LDybFcM2QobBg2JE/qdJYaIJA6pkwn8fqTo1g6c7DGR1XFdh6CX4oYHFSWhPyyzLaMg=
X-Gm-Gg: ASbGncuKrs7QELHgJ+AjCgt52pAsoL6jVp6mKvAUFRUrfITOyL4h+mDmz6PUis0F/Hm
	Q8JXZo3Imly4RvXABpzTzXY0JK5ZyY1vGJEyLAaNIsbxGAWfI/v5e/oAiiRYOdvmqwLtSSlDHxf
	SSWuag0IJ+b4HWRSge28OW8xAxnlq6DjBt989a5XSJs6SGdy4y2S6kSHZpcPYfAzJVGRvodNZs8
	CnWcPq4S6DEL49uKHrM4eOta1IpRvIzG/yzROl0EJZsBOb8nVEW5FtmZRt9NN1Tt3vtbIZgHVPC
	et8gDSPj5PLID9jJ7sdXVFE/n7wF+7Z0o8dRNQB75oFHmbzw+YcYc6yUZiaTUutP0W1n/Byy+qV
	98i2AsvkbvoXKhewAlAx3sRWdfCEqX98Vng/o1bbAmV9v
X-Google-Smtp-Source: AGHT+IHRcwV/1/T5oymXkbwGRFIYuEsWNfVXVWrzLoP+RWTG54BAK6UpJOoefXueOfXgf20o6DvMKw==
X-Received: by 2002:a05:6a21:7a44:b0:215:efe1:a680 with SMTP id adf61e73a8af0-2260a795654mr20246310637.16.1751963688189;
        Tue, 08 Jul 2025 01:34:48 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d4f1asm10877511b3a.161.2025.07.08.01.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:34:47 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 08 Jul 2025 08:33:48 +0000
Subject: [PATCH] riscv: ftrace: Properly acquire text_mutex to fix a race
 condition
MIME-Version: 1.0
Message-Id: <20250708-alex-fixes-v1-1-5b008d3f4d0c@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAOzXbGgC/x2LQQqAIBAAvyJ7TlAj1L4SHazWWggLF0II/550H
 GbmBcZMyDCKFzI+xHSlBroTsB4h7ShpawxGmUFZ5WQ4schIBVlqtNov3nkfe2jDnfEXrZ/mWj+
 cWU9oXAAAAA==
X-Change-ID: 20250708-alex-fixes-1e719b9899f3
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=3Ds2Sx45pnkMg7iaFweDgWNlUOwHGzX5GUkhgeYgbzQ=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJybqi8ChN0klf9crq7b8aPt753f26W6d7Q/lf4XIly/
 tbNVWHHOkpZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjARhkcM/71fRb1avvPr6cDQ
 57eWZxy+GdJybW8Tt0THf0umRv+l5qsYGe4fuN+4spx9reHpB0yRSob6tk+dHI13b2m5sXtL/ql
 4LV4A
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_013449_812197_CAD33014 
X-CRM114-Status: GOOD (  10.95  )
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

As reported by lockdep, some patching was done without acquiring
text_mutex, so there could be a race when mapping the page to patch
since we use the same fixmap entry.

Reported-by: Han Gao <rabenda.cn@gmail.com>
Reported-by: Vivian Wang <wangruikang@iscas.ac.cn>
Reported-by: Yao Zi <ziyao@disroot.org>
Closes: https://lore.kernel.org/linux-riscv/aGODMpq7TGINddzM@pie.lan/
Tested-by: Yao Zi <ziyao@disroot.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/ftrace.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 4c6c24380cfd9d6c51f0e4340cd674160b83a610..22e7bdf8de2b6ca950cf2c8b734bc82ea46ba8bf 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -14,6 +14,16 @@
 #include <asm/text-patching.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+void ftrace_arch_code_modify_prepare(void)
+{
+	mutex_lock(&text_mutex);
+}
+
+void ftrace_arch_code_modify_post_process(void)
+{
+	mutex_unlock(&text_mutex);
+}
+
 unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
@@ -29,10 +39,8 @@ unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
 
 void arch_ftrace_update_code(int command)
 {
-	mutex_lock(&text_mutex);
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
-	mutex_unlock(&text_mutex);
 	flush_icache_all();
 }
 
@@ -149,6 +157,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	unsigned int nops[2], offset;
 	int ret;
 
+	guard(mutex)(&text_mutex);
+
 	ret = ftrace_rec_set_nop_ops(rec);
 	if (ret)
 		return ret;
@@ -157,9 +167,7 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	nops[0] = to_auipc_t0(offset);
 	nops[1] = RISCV_INSN_NOP4;
 
-	mutex_lock(&text_mutex);
 	ret = patch_insn_write((void *)pc, nops, 2 * MCOUNT_INSN_SIZE);
-	mutex_unlock(&text_mutex);
 
 	return ret;
 }

---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250708-alex-fixes-1e719b9899f3

Best regards,
-- 
Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
