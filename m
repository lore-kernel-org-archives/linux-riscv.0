Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B60AC6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 00:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5763A20868
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 00:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kh/3XVdu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="R+NYrDe5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5763A20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=a8KvrbD6qqpW2kTCnM/SRQPSE3OEe7A7DAjWUz231hU=; b=kh/
	3XVduZlknLF9SL9fenboN544jGztTlD4sey3VFftrYSk36qhR6TaC3eM9iLW6zUDI8M6E5cmUm5/D
	QE8pr4vVeeok66fsiupm4YwZfKYTflRukEhYgtSKYahHb2kEmZw2QN4s8cYqIQbVGQgNJQYIEBoSK
	KlBzHm+Ty3SyDPtiH/98+gGN4Co8njF/9fu5w4tei2m90xuq0IIcOkP7X0eZKFhFRKk9EKk5D5ImM
	frB96IosDs+1ypyfBXNCiaZepg045aYXMnKGg7k501pAogTjFBdxmHM+rIVNI4AUjN8pHkF1Ych2T
	p5tyUQNK04ouBfzpxq6NB7QKn50wqSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB8Et-000232-NJ; Sat, 13 Oct 2018 00:57:07 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB8Eq-00021U-Dw
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 00:57:05 +0000
Received: by mail-pg1-x544.google.com with SMTP id g12-v6so6583146pgs.1
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 17:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=BlgK4pdMSZzG/e6uKiCqA/3AdvTtW19p+WiPUddUu30=;
 b=R+NYrDe5fZsk7eH13RrD9dC6cPkPQc2SM7GsWIKE9j35HZeu/Na42Q9nV9lEUh6X6K
 qPht/rNatCTD1He2NEvfIcpHnZTHA/8dz3u51V0DNFkTS8YOwwsucGuawyjAg4hl5bAU
 ZO41jHNhGdLZpmzGY4iCocmV+oS10aZbCof4LFSFY9EASl3mUbA3aeROENO0/ywquzZu
 XF62Zw4dkD58ZgK0qFjonoPAjXbl+Z2snCpH7TbISvHV1OgSszT/9BC8I5SyEeFVvmg4
 rzjecZIG4rerXk01Jzwk0b+RxXUYm10+IKHp03BmmIGNZj1nQxO+NTHV936K5DinSRhY
 1W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BlgK4pdMSZzG/e6uKiCqA/3AdvTtW19p+WiPUddUu30=;
 b=POdUkjwPDK+Elh5sSqW+JKroMwIxHFCViHntpHk/o9gFOgrsa+/M0l5/c5SBiQMclW
 ZNdm1k86NMxU3WUgQWq7/GxtdSGDJ1ocsp6uvZJ3HA126//fDqvvp4okzFkDZuAYOX3s
 SKpUVeK38uF/Jg+i2QzGpcm/oMMTgSp/qr/37u17RofHhtpviveXEwWb6rRbt4BChmUj
 A+05bEoNMA6cvBFgf+kdiyM7p3qt3Oa0ChTc0dmEu39sasJnTxonas/jpE7QPM0JPhHX
 NTD/suTq40uP7BMx1EQZWiTFZgqtaIzgwMjGurwLGi2vOmVGbMzwdwbS5AW7Jx9KcxzG
 x3bg==
X-Gm-Message-State: ABuFfogFiBQyWgK+U9mp6Poz8URq9Te+l4DuC+PuR0k5MrF0JZp5C1ZX
 Ha5j2sjlWBC29pN3Ku1JCIweCZB0N4c=
X-Google-Smtp-Source: ACcGV63qRycvvsz8qei4BWJaZSOp0LcEiX6ScZZS/vZKL8cM5z0d3Pc8OPsxpdt7ZgO3vEZ2AuBETQ==
X-Received: by 2002:a63:4a0e:: with SMTP id
 x14-v6mr7415825pga.34.1539392213523; 
 Fri, 12 Oct 2018 17:56:53 -0700 (PDT)
Received: from rohan.guest.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u69-v6sm5696801pfk.68.2018.10.12.17.56.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 17:56:52 -0700 (PDT)
From: Jim Wilson <jimw@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Add FP register ptrace support for gdb.
Date: Fri, 12 Oct 2018 17:56:49 -0700
Message-Id: <20181013005649.14379-1-jimw@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_175704_526382_B323467C 
X-CRM114-Status: GOOD (  16.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jim Wilson <jimw@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013005649.vc7KnKVH_cLO-wTO-yGXZ1n72CmIEaRdHD1z3PNhFxI@z>

This has been tested by hand, and with the gdb testsuite, and is working
well.  Corresponding patches for gdb have already been upstreamed, but
they don't depend on the exact form of this patch, they only depend on
the use of NT_PRFPREG.

I think there is room for improvement here, but not sure if that is required
before this can be accepted.  I'm abusing the ELF_NGREG macro because we don't
have one for FP registers, and the elf_greg_t type again because there isn't
one for FP registers.  In the riscv_fpr_get function, I'm using a single call
to user_regset_copyout which means effectively the entire fstate struct is
being copied from kernel space to user space.  That may include some padding
at the end of the structure.  I don't know if that is safe or not.  This could
be fixed by using two user_regset_copyout calls with a little bit of extra
complexity.  Similarly with riscv_fpr_set and user_regset_copyin.  This
probably only works for targets that have the D extension.  Not sure if
this matters; I don't have a system with only F support, or no FP support,
to test against.

Jim

Signed-off-by: Jim Wilson <jimw@sifive.com>
---
 arch/riscv/kernel/ptrace.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..8352d1bfadaf 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -27,7 +27,7 @@
 #include <trace/events/syscalls.h>
 
 enum riscv_regset {
-	REGSET_X,
+	REGSET_X, REGSET_F
 };
 
 static int riscv_gpr_get(struct task_struct *target,
@@ -54,6 +54,27 @@ static int riscv_gpr_set(struct task_struct *target,
 	return ret;
 }
 
+static int riscv_fpr_get(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 void *kbuf, void __user *ubuf)
+{
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0, -1);
+}
+
+static int riscv_fpr_set(struct task_struct *target,
+			 const struct user_regset *regset,
+			 unsigned int pos, unsigned int count,
+			 const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0, -1);
+	return ret;
+}
 
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
@@ -64,6 +85,14 @@ static const struct user_regset riscv_user_regset[] = {
 		.get = &riscv_gpr_get,
 		.set = &riscv_gpr_set,
 	},
+	[REGSET_F] = {
+		.core_note_type = NT_PRFPREG,
+		.n = ELF_NGREG+1,
+		.size = sizeof(elf_greg_t),
+		.align = sizeof(elf_greg_t),
+		.get = &riscv_fpr_get,
+		.set = &riscv_fpr_set,
+	},
 };
 
 static const struct user_regset_view riscv_user_native_view = {
-- 
2.19.0.rc0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
