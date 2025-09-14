Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C63BCAC58F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 03:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoI0l4ri1o2ACOpIwFFxqLtMZ5lm3dGHMHD7IwOOSHQ=; b=q0ygNr0VLlDaIs
	JZS0IqM3g+JzaGJfKAAVALOfG7ZC6JeCKFCyIIr+MzdISUsHe1pwKCrQE2n/F6xFialQJmP9qUWFE
	OOc5mUWWWfcWpoIhL1vmwssjKNAXt1L/8jPwumRLpW1KBsSJC2c/5a6J8slutAer7vIBZjmfT6UhH
	fuYZIBbM6oFpyNG3Q+f/TrJ68WuEE0us5d7FopLpWJ8gC+BjE1TP/HUgjsRrz29ZTxcBEVVeJsD77
	Wr7aeGlO0iXb37KLfL9MAuZ7PFG4GtP1OgPKpBl9RR4Ga3UON6eGSSBGV+fGz461t6eZBV8Gz4V2I
	BcNzs1Kv+rzo0bU4UkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdo2-0000000HMlH-0oF9;
	Sun, 14 Sep 2025 03:53:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxdny-0000000HMhQ-3I9a
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 03:53:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso6261615a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Sep 2025 20:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822013; x=1758426813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=CtyLXqQHocSmGeRxK6xzaEzg9VFAigm0cseorL5Dl1YErpPmQtBSuyoi0zuaVKK00G
         FeCKDamxoMd33sL1zV6aTPY0tcKJkzRmBBCk+iNgigTfUUsNBdPbepbItXbGU61X8RbK
         sf3RYfNcfe9ltrZ6WkK0OXL5WKIzU+VUZxwJJt4XglLPtgDFYjlMDr55keyJNvcbtNfT
         zqpbZjWVvsa2Gb6YM8/vHoTVP5o+3/J8OQ5QQzUCYhJ5tbi5S2WiiujhdwKbQEaGUOUB
         o51xuh4V3QzbBh+f73qs6TI20sDuRyMiUiqZ9HDA7Aq27Ft4ijy+S4osdnnYF5mzjECn
         ttdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822013; x=1758426813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=XoHVCpLHKRMbWctn1CJZy9r9ULAMF5KmOVV6o0zrJvlKYH27bZ57Ejx+Yf9+dIUwaM
         NVhn/hXlEAp8YQTm2NmZJUegaJytQW2AZ8LauNANeZHc9s5sudkZVQqGZUwK+KhTAV95
         QxnIzOzxYJpNxKpZ4dSqjQKp0WJYOnURnWHRcBYsLAy1A6qsWpbQ7xqhwLpAUhA+l/wi
         UA52qu5BitejlLEXPSNwKoUKPbebTx5aYmp+j/QHdFEcWLhPNgr6vkH2qPcLCfuOsH28
         MA0/K7ClJqAjsAxytpZQVCKSoz0OAZcWmxW9sfduXyWDy6npf66hMN3mU1cuz+LNe/Ec
         hhjg==
X-Forwarded-Encrypted: i=1; AJvYcCUMsN+c4wdGoNA/QD1HcLrQ1H2ayGKbAaQs2iEHGGqQ+9a7NEPV88XZMHJJlJHgh6ameJenYOLRVVfVRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV7Hu0BSuKEfJmZ3b39bsUF3j8B8ILkZfALXk8Dj1lxkGrfDkH
	C12zTCeJoLh8GnU5+zdpqTRfKK8olvWgrpsvm39JBD8HLn/8tHC6u8Y4
X-Gm-Gg: ASbGnctNTkGE1Sx/lypW7y+1NL3vOFG9igQLAckipwo2bKshdHaeh+dFcAPOpuYIZbS
	cR9YWcTvw2n5NGzTt+Ls2Xk3BeBCodDnbADsYQNmGxd5jjOcSHFyKiEciIn77HpVJwAiMiN5wVk
	HG5HYowYJ1iYWL0MRl9sh3EHyze7sV6fUrc9iQ9Md4VRqGg10q3oUdDjdEsA+qH5RFGMuTAw0ln
	0j9GtNalmcH2K/vBNUgsNiZ8hy2W4qPdDNjutNqviuhAs1mftFmpPFQCmhlJpms0CTE8ekJON4y
	1kOUhvrySH1c3zHAOKfPJxeEMZoDGdBrImZEO1fo/5MHiWdRzDiOelGPoLzXpAa20efMxHP/k0M
	TLivbIBIDZG9q3z/SiqANic14mKGa5w==
X-Google-Smtp-Source: AGHT+IGUQXhZVcMzH5x4qrxgNQpCZ4sYyZ3ugDsvfNumu2I8pECs9df4oC+H+CMnm997jPnr5crTug==
X-Received: by 2002:a05:6402:2111:b0:61d:2096:1e92 with SMTP id 4fb4d7f45d1cf-62ed82614c4mr7020136a12.15.1757822012514;
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3a5esm6570485a12.30.2025.09.13.20.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 43/62] setsid: inline ksys_setsid into the only caller
Date: Sun, 14 Sep 2025 06:53:26 +0300
Message-ID: <20250914035326.3661003-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_205334_907167_9CDE343A 
X-CRM114-Status: GOOD (  10.91  )
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/syscalls.h | 1 -
 kernel/sys.c             | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 77f45e5d4413..75e9ee03d19b 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1231,7 +1231,6 @@ int ksys_fchown(unsigned int fd, uid_t user, gid_t group);
 ssize_t ksys_read(unsigned int fd, char __user *buf, size_t count);
 void ksys_sync(void);
 int ksys_unshare(unsigned long unshare_flags);
-int ksys_setsid(void);
 int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
 			 unsigned int flags);
 ssize_t ksys_pread64(unsigned int fd, char __user *buf, size_t count,
diff --git a/kernel/sys.c b/kernel/sys.c
index 1e28b40053ce..66e1e2dfd585 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1265,7 +1265,7 @@ static void set_special_pids(struct pid **pids, struct pid *pid)
 		change_pid(pids, curr, PIDTYPE_PGID, pid);
 }
 
-int ksys_setsid(void)
+SYSCALL_DEFINE0(setsid)
 {
 	struct task_struct *group_leader = current->group_leader;
 	struct pid *sid = task_pid(group_leader);
@@ -1300,11 +1300,6 @@ int ksys_setsid(void)
 	return err;
 }
 
-SYSCALL_DEFINE0(setsid)
-{
-	return ksys_setsid();
-}
-
 DECLARE_RWSEM(uts_sem);
 
 #ifdef COMPAT_UTS_MACHINE
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
