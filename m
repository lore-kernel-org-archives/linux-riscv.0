Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DC9C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:35:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597DC23A3C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 01:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 597DC23A3C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9sSQVt/RUGqfUadQUCr/TJXtYuZ5hqHvIRTCpRHT24c=; b=yCNqQLSrs+Jp/vq1vbBDvVwt8
	cdwUSSQIFFt8Adw2pCLm6S5Hr4ULcSSG8/AYLG3B6z2cIj3VyN1jQUVRaaSx3WL+iXgqrtXL6GoHl
	suer2tWQaujFu9vgbNfLeR86BWxGxW6Zk3PY/wjbLYmajb7MDxmSwzZ4hDtTiVpHgTlKRUb5le8Wn
	K+l+iY2k6zPoneMtAXX8MMpAlMU5gZl3FnlUCh7IlzQ0qrz3lH8jnq3kXBdYebv4rljmTUmjB0B51
	s70Xp3jUpFfr13W7G3ZrzTtlW+J2LKHC/Bv7bDBQgKoYc+PCRUexVUC/lD0bMeySfFmT5/DcxKI6Z
	M6YjCf5ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmRuI-00068p-KK; Tue, 08 Dec 2020 01:35:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmRuB-000679-UW; Tue, 08 Dec 2020 01:35:04 +0000
Date: Mon, 7 Dec 2020 17:34:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1607391302;
 bh=i3984NOIVWMaE+QFhgCLJtfILbc6/RSkG9XvGukRs7w=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=hca7faBpqEriF6FZPtd0wlbzAlfSR3EKfyTBaBt4dgDAVy9k1yPd7IQFpymwABy3h
 s9qHHlOLbsb4kwF/DfCdj2T4PkbJ+5OVWDB3l03SlUvMWEw9yXHqVH08/s5GvFXorR
 waVdV51wewfkqAeXxoNzsw4CAoe7ms/Mee6ucYrc=
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v14 09/10] arch, mm: wire up memfd_secret system call
 were relevant
Message-Id: <20201207173459.a4d4a3404e163314c29f0785@linux-foundation.org>
In-Reply-To: <20201207160006.GG1112728@linux.ibm.com>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-10-rppt@kernel.org>
 <81631d3391abca3f41f2e19092b97a61d49f4e44.camel@redhat.com>
 <20201207160006.GG1112728@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_203504_109961_0C7EB8F8 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Qian Cai <qcai@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 7 Dec 2020 18:00:06 +0200 Mike Rapoport <rppt@linux.ibm.com> wrote:

> > 
> > I can't see where was it defined for arm64 after it looks like Andrew has
> > deleted the  above chunk. Thus, we have a warning using this .config:
> > 
> > https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config
> > 
> > <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented [-Wcpp]
> 
> I was under the impression that Andrew only removed the #ifdef...
> 
> Andrew, can you please restore syscall definition for memfd_secret() in
> include/uapi/asm-generic/unistd.h?
> 

urgh, OK, that seems to have got lost in the (moderate amount of)
conflict resolution).

--- a/include/uapi/asm-generic/unistd.h~arch-mm-wire-up-memfd_secret-system-call-were-relevant-fix
+++ a/include/uapi/asm-generic/unistd.h
@@ -863,9 +863,13 @@ __SYSCALL(__NR_process_madvise, sys_proc
 __SYSCALL(__NR_watch_mount, sys_watch_mount)
 #define __NR_epoll_pwait2 442
 __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
+#ifdef __ARCH_WANT_MEMFD_SECRET
+#define __NR_memfd_secret 443
+__SYSCALL(__NR_memfd_secret, sys_memfd_secret)
+#endif
 
 #undef __NR_syscalls
-#define __NR_syscalls 443
+#define __NR_syscalls 444
 
 /*
  * 32 bit systems traditionally used different
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
