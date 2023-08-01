Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E306C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XCyrdaj+mvvGGNvbtgqCmVVKmsZPbcTPgdSa73Da6Qg=; b=R5b
	tkPqWB8Mb5TnoJR9aY+ixqWoaMrMIRn3D7JEmFh7766ToArKduRTZZ/voecorEnfeTtIXaa7m4DLY
	5NCQdUthNJmX3mgLboiE/R4ZUeDhJKNwp3wgCvGm0x8s8yFwFG31Rhfu4bsykqpCkY+01fNjbBF9r
	TpXCSicc3X/fAOwvMwR8sV60ZarsWGu6gQewObhfNiTQgZv7ytw0qF4hli3Y/TmAkGE6CQfDkl3ja
	00uWBWXPxQSnDOL/529MRMFsgxQu/WgE7AoIQq1+xACn/jb4EV99tCi7fESog7d6r2tAJMoi/CTFS
	UkvIlIlQaPguaHw4/nTZF2MjTmqkCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQwhw-003Kdm-0B;
	Tue, 01 Aug 2023 21:15:08 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQwhs-003KdR-1L
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 21:15:05 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d1ebc896bd7so6965818276.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690924501; x=1691529301;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cvCPvXEXJi+AWuMnKm+64/X3uAVVE34xKMNOfWT1BRs=;
        b=PR7tMSy5f4UYTvY4LrTeHg5FaPYcYdynCZ7BdMeTUjCGQFv3V9+d2wyZpspcsT2Lk2
         lwZLurzuBUx24t7W9okeaEOLhZWGzAN+Ac9k9MR3EsSKBEA3pv66qqM7dL744LXA4fwu
         98yACZNsKu3Be7cHWDnwKZa6JnGb6wZslBqVSc4zOgR/35FFx2Lr92lR6rI6tuOmKzs5
         0qBsLA2GF9pI0XIWbCabH3dB04lZqx9ULoUWh0+i1GQGSmAxEwa2r89230sMVJ1hBbpR
         6pQPp3LFMFfmtB4oeDv3kVOgapuenW7gLqDSM8eN9Qz6klCRAhk8qyicxnIJN+aH651H
         tC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690924501; x=1691529301;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cvCPvXEXJi+AWuMnKm+64/X3uAVVE34xKMNOfWT1BRs=;
        b=lareSeLjjuDbLjjNbpT4Ukl8YZW8EmdpO/APY8KjvxXqBH4BvkiE5/5cdJ5hu5UZ2X
         rNWiBf9LO3V3t0FSfxVq8V3eKzNVpDjhhCFfWDTGv3OFoe6mOzla6H2Tp44Um6vwpQ5F
         O1+zzaAerHSMP5aInIblutELo+GSftX4WjEgUNHKo6nnT7BF6jbOgkBECs3OVuMlODZu
         zdJI0qi4l6A0OJPObH3tlRbTa/HIkKdIwv0y0hm/Vw/ivktSGmGUl8LNYy8cPDEa9/eV
         93tWN6pgsSv4e/GtV6eenzxyLNknQQTuKaR1qb1DGBhQItCjMqOF90ycD3va/oem1Xfq
         oYZg==
X-Gm-Message-State: ABy/qLZZNh/dpvhzWLCyGyOEH/fQ2xW49jWQ4/5cGr25xbnoY5Mu9Z/a
	OSdrreCkTq/jvS+MjxZWIoBcLrP0+57Hys2rVA==
X-Google-Smtp-Source: APBJJlH6aRZtqfR1X4T8qWnxez8AGlbXuy2EkOO9dyhBk5KJPlduqXXSo2+gRcBiY1QYA4mWnF6JSgOt/rTMp+KuJQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:dbcc:0:b0:c4d:9831:9712 with SMTP
 id g195-20020a25dbcc000000b00c4d98319712mr91040ybf.0.1690924501488; Tue, 01
 Aug 2023 14:15:01 -0700 (PDT)
Date: Tue, 01 Aug 2023 21:14:56 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM91yWQC/x3MMQqAMAxA0atIZgOtFi1eRRxKjBqUKimIULy7x
 fEN/2dIrMIJhiqD8i1Jzlhg6wpoC3FllLkYGtO0xhuLQWlDlUQ37qyRD7QuGOeJOtf1ULpLeZH nf47T+34o9Y8zYwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690924500; l=2927;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=s3m7CWALnl/nC1KMRD2GMsw7JbTdQy5wYGZxtQUQlGM=; b=7eJSjj6jI+aQ7sQWqwG3t2xsmy39xyn26rfVvRq1stqWx/hW8lh8ZtyNbqdNOhiBoBHEvbHbd
 dtYNXKXBITPC026HWfdakwEnyjQW2KzToCm+rBDZJ3IalP45DI9fCa2
X-Mailer: b4 0.12.3
Message-ID: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
Subject: [PATCH] RISC-V: cpu: refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_141504_482408_7B6F60AC 
X-CRM114-Status: GOOD (  15.24  )
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

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on its destination buffer argument which is
_not_ the case for `strncpy`!

The `sv_type` buffer is declared with a size of 16 which is then
followed by some `strncpy` calls to populate the buffer with one of:
"sv32", "sv57", "sv48", "sv39" or "none". Hard-coding the max length as 5 is
error-prone and involves counting the number of characters (and
hopefully not forgetting to count the NUL-byte) in the raw string.

Using a pre-determined max length in combination with `strscpy` provides
a cleaner, less error-prone as well as a less ambiguous implementation.
`strscpy` guarantees that it's destination buffer is NUL-terminated even
if it's source argument exceeds the max length as defined by the third
argument.

To be clear, there is no bug (i think?) in the current implementation
but the current hard-coded values in combination with using a deprecated
interface make this a worthwhile change, IMO.

[1]: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
[2]: manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 arch/riscv/kernel/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..1c576e4ec171 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -17,6 +17,8 @@
 #include <asm/smp.h>
 #include <asm/pgtable.h>
 
+#define SV_TYPE_MAX_LENGTH 16
+
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
  * isn't an enabled and valid RISC-V hart node.
@@ -271,21 +273,21 @@ static void print_isa(struct seq_file *f, const char *isa)
 
 static void print_mmu(struct seq_file *f)
 {
-	char sv_type[16];
+	char sv_type[SV_TYPE_MAX_LENGTH];
 
 #ifdef CONFIG_MMU
 #if defined(CONFIG_32BIT)
-	strncpy(sv_type, "sv32", 5);
+	strscpy(sv_type, "sv32", SV_TYPE_MAX_LENGTH);
 #elif defined(CONFIG_64BIT)
 	if (pgtable_l5_enabled)
-		strncpy(sv_type, "sv57", 5);
+		strscpy(sv_type, "sv57", SV_TYPE_MAX_LENGTH);
 	else if (pgtable_l4_enabled)
-		strncpy(sv_type, "sv48", 5);
+		strscpy(sv_type, "sv48", SV_TYPE_MAX_LENGTH);
 	else
-		strncpy(sv_type, "sv39", 5);
+		strscpy(sv_type, "sv39", SV_TYPE_MAX_LENGTH);
 #endif
 #else
-	strncpy(sv_type, "none", 5);
+	strscpy(sv_type, "none", SV_TYPE_MAX_LENGTH);
 #endif /* CONFIG_MMU */
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }

---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230801-arch-riscv-kernel-14a048cc6467

Best regards,
--
Justin Stitt <justinstitt@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
