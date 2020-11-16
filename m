Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171BC3E8C5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 21:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661C22224F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 21:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9p7zJ5a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKwV9k+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661C22224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dnxQT7SavUmtviahZ4Mgt01YeuU8HUAK0PgdLG9MMCM=; b=a9p7zJ5aV07mn2xuPCp4bUSNr
	1VdrolzObFyMK0iWTTazFaJYwSunjvrocgTHXtTsJyksS3CckFIAg5qwkewwUXVjv1IMYipJDOV+7
	Jyw+ERjVg/v1EPhzosa4bBGSaQ1samlKtu8yOIt1djLullkzFrBJEmDhbEiI8egHPq6k4fL7y/nTi
	+AsMER1ZgvzSF9111DaCiY8tej7Wjf6mhgZArDJlydEKDK4Pv34wQZTDqSOMz/4Sorldfur3IbFOd
	hKbOhjsUHDqF55DdpmIln5RaMmJbpAOg+NYP8Y36pfrzYomvKr39t1uxDqivWV8rPKSLAHNG9UXHQ
	1+vxEFsrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keleZ-00016j-CZ; Mon, 16 Nov 2020 21:03:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keleV-00015d-3w; Mon, 16 Nov 2020 21:03:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id p22so652230wmg.3;
 Mon, 16 Nov 2020 13:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIBok6LhmX2oON2re8xwKd0vvOgtGJnjM3IpLHusadw=;
 b=TKwV9k+FZKUd2LAwXA+k72FWcs+EPrCRoALmGFbD1zvuHvxTQ+SSqk553M+WEdyPNp
 UmdIZ88Rz6NEybpakhEMzRK+Ex8y/oxuPDgYrUWPK8ORLJ4vfIj5IMSnSW1s/xpgxPhu
 l/9tL8fSIFraFFAnx1wLnxtKybQO2iFuutx+KxjMJJBHWrHfivKaN7s/aBUVJ5dCQo5a
 XpeLRtYnvT99t9llbCTi70/dwIH2b0v8T76uTZLzqhr1a/fXg20tXBKmLtyGtfyq9TAO
 ZlYZGmGgiO/ido1nqu2l+9NLu7Tpe8zdX+RBqaX6CjR6AzsxcijUPQQdvL1Hcr5GFp7O
 iNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIBok6LhmX2oON2re8xwKd0vvOgtGJnjM3IpLHusadw=;
 b=PjyEw2zrS87wschV4rO8yWAqJn0SA68A7/2/9OCWtRN/Jg0ixDgPRS3sb9SBXnh1xD
 AOcP5oPJXNSlv7DjDfucH+1qwiJtS1mCWsqsm9Jv+gWJEJ0gs5kr24PzSt/L3KU/fj/e
 9fEfmmxhgRdtWHvdga2a+T+KQSVNDrnopG52Nwls2XXjgnL8Iqcz+f/WL8UF6iIwmXEH
 SBURd2LIpjqu8pEP3TshnDP/UdTCJ5ny3rXNkIt9b1OG9Kl4zb1VvT0Oivd3NXsCk8VM
 1vmy/v+iCcV62AnWJYU6CUAK+dI/PgkybqxiUXewbrO5J36nRvfjxdRFB1JTkVZfEkWx
 VzTg==
X-Gm-Message-State: AOAM533jsDPiLAcPCwkqsRhI9qRcmKLPcwiBJkJb807GCaGwXsq0tr2W
 7x1zzR5faLCs8mFJODVuIL8=
X-Google-Smtp-Source: ABdhPJzOHhNlIpkSPa99BnwvG5LvoWEVPEOt0VC2sDFCF+lKYb8sZV+/i98RGOfuFhg4vt+8hd5CTg==
X-Received: by 2002:a1c:c2c3:: with SMTP id s186mr813200wmf.160.1605560585749; 
 Mon, 16 Nov 2020 13:03:05 -0800 (PST)
Received: from localhost.localdomain ([170.253.51.130])
 by smtp.gmail.com with ESMTPSA id p4sm24660325wrm.51.2020.11.16.13.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 13:03:05 -0800 (PST)
From: Alejandro Colomar <alx.manpages@gmail.com>
To: rppt@kernel.org,
	mtk.manpages@gmail.com
Subject: [PATCH v2] memfd_secret.2: New page describing memfd_secret() system
 call
Date: Mon, 16 Nov 2020 22:01:37 +0100
Message-Id: <20201116210136.12390-1-alx.manpages@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201005073242.GA4251@kernel.org>
References: <20201005073242.GA4251@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_160307_198924_00066D96 
X-CRM114-Status: GOOD (  24.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-man@vger.kernel.org, tglx@linutronix.de,
 david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com,
 Alejandro Colomar <alx.manpages@gmail.com>, dave.hansen@linux.intel.com,
 linux-mm@kvack.org, will@kernel.org, linux-kselftest@vger.kernel.org,
 hpa@zytor.com, cl@linux.com, idan.yaniv@ibm.com,
 linux-riscv@lists.infradead.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 colomar.6.4.3@gmail.com, shuah@kernel.org, x86@kernel.org, willy@infradead.org,
 Mike Rapoport <rppt@linux.ibm.com>, mingo@redhat.com, arnd@arndb.de,
 jejb@linux.ibm.com, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 paul.walmsley@sifive.com, kirill@shutemov.name, dan.j.williams@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Cowritten-by: Alejandro Colomar <alx.manpages@gmail.com>
Acked-by: Alejandro Colomar <alx.manpages@gmail.com>
Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
---

Hi Mike,

I added that note about not having a wrapper,
fixed a few minor formatting and wording issues,
and sorted ERRORS alphabetically.

Cheers,

Alex

 man2/memfd_secret.2 | 178 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 man2/memfd_secret.2

diff --git a/man2/memfd_secret.2 b/man2/memfd_secret.2
new file mode 100644
index 000000000..4e617aa0e
--- /dev/null
+++ b/man2/memfd_secret.2
@@ -0,0 +1,178 @@
+.\" Copyright (c) 2020, IBM Corporation.
+.\" Written by Mike Rapoport <rppt@linux.ibm.com>
+.\"
+.\" Based on memfd_create(2) man page
+.\" Copyright (C) 2014 Michael Kerrisk <mtk.manpages@gmail.com>
+.\" and Copyright (C) 2014 David Herrmann <dh.herrmann@gmail.com>
+.\"
+.\" %%%LICENSE_START(GPLv2+)
+.\"
+.\" This program is free software; you can redistribute it and/or modify
+.\" it under the terms of the GNU General Public License as published by
+.\" the Free Software Foundation; either version 2 of the License, or
+.\" (at your option) any later version.
+.\"
+.\" This program is distributed in the hope that it will be useful,
+.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
+.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+.\" GNU General Public License for more details.
+.\"
+.\" You should have received a copy of the GNU General Public
+.\" License along with this manual; if not, see
+.\" <http://www.gnu.org/licenses/>.
+.\" %%%LICENSE_END
+.\"
+.TH MEMFD_SECRET 2 2020-08-02 Linux "Linux Programmer's Manual"
+.SH NAME
+memfd_secret \- create an anonymous file to map secret memory regions
+.SH SYNOPSIS
+.nf
+.B #include <linux/secretmem.h>
+.PP
+.BI "int memfd_secret(unsigned long " flags ");"
+.fi
+.PP
+.IR Note :
+There is no glibc wrapper for this system call; see NOTES.
+.SH DESCRIPTION
+.BR memfd_secret ()
+creates an anonymous file and returns a file descriptor that refers to it.
+The file can only be memory-mapped;
+the memory in such mapping
+will have stronger protection than usual memory mapped files,
+and so it can be used to store application secrets.
+Unlike a regular file, a file created with
+.BR memfd_secret ()
+lives in RAM and has a volatile backing storage.
+Once all references to the file are dropped, it is automatically released.
+The initial size of the file is set to 0.
+Following the call, the file size should be set using
+.BR ftruncate (2).
+.PP
+The memory areas obtained with
+.BR mmap (2)
+from the file descriptor are exclusive to the owning context.
+These areas are removed from the kernel page tables
+and only the page table of the process holding the file descriptor
+maps the corresponding physical memory.
+.PP
+The following values may be bitwise ORed in
+.IR flags
+to control the behavior of
+.BR memfd_secret (2):
+.TP
+.BR FD_CLOEXEC
+Set the close-on-exec flag on the new file descriptor.
+See the description of the
+.B O_CLOEXEC
+flag in
+.BR open (2)
+for reasons why this may be useful.
+.PP
+.TP
+.BR SECRETMEM_UNCACHED
+In addition to excluding memory areas from the kernel page tables,
+mark the memory mappings uncached in the page table of the owning process.
+Such mappings can be used to prevent speculative loads
+and cache-based side channels.
+This mode of
+.BR memfd_secret ()
+is not supported on all architectures.
+.PP
+See also NOTES below.
+.PP
+As its return value,
+.BR memfd_secret ()
+returns a new file descriptor that can be used to refer to an anonymous file.
+This file descriptor is opened for both reading and writing
+.RB ( O_RDWR )
+and
+.B O_LARGEFILE
+is set for the file descriptor.
+.PP
+With respect to
+.BR fork (2)
+and
+.BR execve (2),
+the usual semantics apply for the file descriptor created by
+.BR memfd_secret ().
+A copy of the file descriptor is inherited by the child produced by
+.BR fork (2)
+and refers to the same file.
+The file descriptor is preserved across
+.BR execve (2),
+unless the close-on-exec flag has been set.
+.PP
+The memory regions backed with
+.BR memfd_secret ()
+are locked in the same way as
+.BR mlock (2),
+however the implementation will not try to
+populate the whole range during the
+.BR mmap ()
+call.
+The amount of memory allowed for memory mappings
+of the file descriptor obeys the same rules as
+.BR mlock (2)
+and cannot exceed
+.BR RLIMIT_MEMLOCK .
+.SH RETURN VALUE
+On success,
+.BR memfd_secret ()
+returns a new file descriptor.
+On error, \-1 is returned and
+.I errno
+is set to indicate the error.
+.SH ERRORS
+.TP
+.B EINVAL
+.I flags
+included unknown bits.
+.TP
+.B EMFILE
+The per-process limit on the number of open file descriptors has been reached.
+.TP
+.B EMFILE
+The system-wide limit on the total number of open files has been reached.
+.TP
+.B ENOMEM
+There was insufficient memory to create a new anonymous file.
+.TP
+.B ENOSYS
+.BR memfd_secret ()
+is not implemented on this architecture.
+.SH VERSIONS
+The
+.BR memfd_secret (2)
+system call first appeared in Linux 5.X;
+.SH CONFORMING TO
+The
+.BR memfd_secret (2)
+system call is Linux-specific.
+.SH NOTES
+The
+.BR memfd_secret (2)
+system call provides an ability to hide information
+from the operating system.
+Normally Linux userspace mappings are protected from other users,
+but they are visible to privileged code.
+The mappings created using
+.BR memfd_secret ()
+are hidden from the kernel as well.
+.PP
+If an architecture supports
+.BR SECRETMEM_UNCACHED ,
+the mappings also have protection from speculative execution vulnerabilties,
+at the expense of increased memory access latency.
+Care should be taken when using
+.B SECRETMEM_UNCACHED
+to avoid degrading application performance.
+.PP
+Glibc does not provide a wrapper for this system call; call it using
+.BR syscall (2).
+.SH SEE ALSO
+.BR fcntl (2),
+.BR ftruncate (2),
+.BR mlock (2),
+.BR mmap (2),
+.BR setrlimit (2)
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
