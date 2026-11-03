Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA65606BA32
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nxsxNOMK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SGMgh4fk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hofbkha+iUWd+aw711DgjNz0B0Op/WTHjdIAoAkBdjU=; b=nxsxNOMKl9TV83/gMzEgWCWCXh
	slBLMg/nfQyLQCK21BELUeZm3QeCRCBVH4jHOsM3x3cNT+vr7TCPJOAB49sw/yv0cUxpcgVtgtchK
	fDcrttv4hafdAgQ51jISCdmRYq6YEK1Pv8TosBRgeV5vXc4HpnRtIXR2xe1WpiYabVTfr5aYmUHJ7
	L1zQgzo7AyP7rZogKFeqTyZvWJCoOGaGH38GuroAlhpF4yECcyJI7h3itN3sbaEmb5iu9VKT4xNOx
	OUt5ejfjnKW7peiRnyjp5jyVbhXx/MCcbU9hT+IW84aEXuUbUrZpRelPmfnu1TXep6NnG9d48IoYm
	e6z9Mk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGGn-00000002uWm-1I9y;
	Tue, 03 Nov 2026 15:17:53 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGGk-00000002uVk-0pd5
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:17:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso2158065a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719069; x=1794323869; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=SGMgh4fkMBE1L9ksN6aFaRmVG3FnM9ed7wfWg8OTmBvSm6y20LST1kU5rsdC8HjDgf
         l+4jIRYPKSQiZPgMFDGbJbQFolI74SEGmdoZCcZTet8p1r4vJ1D/2KNPKEJz9GDHAt6w
         DuHzk439DCukOTf09cnpyYL/jz26o+CEEU3+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719069; x=1794323869;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv57rrW9AR5Uyx8+S36d+hVUEIxbqmnbUnmaj9pRDPc=;
        b=Be++O+rD4ZqhCtp+C3kcS3WeXcPOIeRlIeMD46X9H1kXZBWdaeS3aEOGv4AHqJzssZ
         uX0utK13d6IMGjAeCRMapNi9QklQMUUJXQLwMgDzYjsde/hoYbKfpmkjxI15IVHwmjjH
         dKrgRVMUQ6mySLDeCl4ZbtKAIAb5DVdtR9PBbAnpMY3rPhFwKzVWJtPnpTAGU5Hg7aD6
         4kLycrjBNN3YY7eto72GW8LUm4NfO6WOghmVumKwfUHPNaDwBqZU0oARba8QLVDueASF
         MkgViCBGo2HdBYt07GfXUNBDpstGbCKqbh2s6ItBzaOWBVo5pChELKKS7akzf7Gt+qNc
         sW2g==
X-Forwarded-Encrypted: i=1; AKwUvBxx1gjknp7MydAYjmSIc/64SmXflmvDPOIXKx2xAFVqnvNhiVZYoDcUPqlQIpWmBABy1rB7Dzfw0z8Jew==@lists.infradead.org
X-Gm-Message-State: APuU4Z+bxVdOl3s/8MgOr4vFnPFGWKTc4eIObWaLA6GG/ko03UI/BaXi
	z6e3IPSOjKkHPe5Hlp79fRaevG5QJqiMjSWqQVCSBtbPcP8bvLeGEUjUUYL53GWgR5M=
X-Gm-Gg: AYBFou2t9hTwwTSXX/C5uK+bWfdhd7KoxMnEs2o5JDz02fozCTrhrbhhntSLJgGM6Bp
	IFgAdePlOZgRbY2XgghUosnAjNlUNKD3L6HvKl7jabsq1vmCL2oc5EfAJtT2Lvr2ebHgwUrAX48
	/n+OWSqxFd7wWy3g/zRji9fAAy8dLWony/B09jjGbncGZyi0mFsd9aMNqy5xPu7Tsjgm6ms6Mdn
	j5LvbXYj7K+OyPs4o49tAIFtTSn+HL8uikt4PzkRFVy8lqNUpGbNgDrfee/l5pHvASe5jhDYLSz
	fq/XE/2yIf4FLHCchNagkGpBrntyOT8OTpC9cxWIq1cZs/7MOxJ6DzOW9pUk21SO2qVUe9L47k7
	vqfaUiaMImjC2sYScA1IhQuxM3Is4CyPwfkoWcNrcAeBhws219PstM8QmgbypU5s4h1nbp4Sogk
	WBHCJSB1s/krFUrKG5zd0zHmqVtAo40+qiu18e1A/3uSBb5VevlIY8D/5Dpv+expQa0f2KHUODk
	yAmo9Tl6HY63vKyfFEIXFtAliKwVl39e9ddB34EKNs7B8LREayx13zMjaIj0bflJn4n7uqPoVqb
	74FUItzJ0AhUQN1vske13zAQyJpnayhQEOC40DUcdBk8/wF1WeAHBKobv9BMh6QMAp51Gkug6Jy
	Dv9IwBUukY79ouluEnIt08pBVj4BvI0y3NGIiZP7P5Zuhq7gvcctL1fmYjJ5N80Du0YFb1trqJO
	rvOeKhQJafgVNvNE0tJQ==
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr10813768a91.11.1793719068633;
        Tue, 03 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c62984bsm4849760a91.9.2026.11.03.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:17:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:17:43 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 0/8] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071750_262474_D4474B11 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

v2:

- Skip destructive vDSO tests on unsealed 32-bit x86 mappings
- Move the sysmap tests into selftests/mm (Lorenzo)
- Use shared vm_util helpers in the sysmap tests (Lorenzo)
- Use PROCMAP_QUERY for the vDSO lookup (Lorenzo)
- Keep test changes in separate patches (Lorenzo)
- Put the enforcement tests before the kernel changes (Lorenzo)
- Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig (Lorenzo)
- Remove VM_SEALED_SYSMAP (Lorenzo)
- Seal mappings in __install_special_mapping() (Lorenzo)
- Leave a sealed uprobe trampoline mapped if optimisation fails
- Replace the boolean parameter with no_mseal_sys_mappings (Lorenzo)
- Drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON (Lorenzo)
- Drop the CHECKPOINT_RESTORE dependency (Lorenzo)
- Document the software which sealing breaks (Lorenzo)
- Keep Kconfig default-n regardless of CHECKPOINT_RESTORE (Andrei)
- Retain sealing by default when built in, with no_mseal_sys_mappings as
  the boot-time opt-out (Lorenzo)
- Explain the security rationale (Lorenzo)
- Describe the Meta/Reverie use case (Lorenzo)
- Skip general checks on unsealed kernels (Lorenzo)
- Add expect_sealed for strict CI checks (Jeff)
- Use the existing -T filter to exclude strict checks when needed (Jeff)
- Test that no_mseal_sys_mappings leaves mappings unsealed (Jeff)
- Add the vDSO mprotect() enforcement test (Jeff)

v1: https://lore.kernel.org/r/cover.1793094611.git.chris@chrisdown.name

Chris Down (8):
  selftests/mm: Move sysmap_is_sealed into mm
  selftests/mm: Skip sysmap_is_sealed when system mappings aren't sealed
  selftests/mm: Test that the seal on system mappings is enforced
  mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
  uprobes/x86: Leave sealed trampolines in place on optimisation failure
  mm/mseal: Seal system mappings in __install_special_mapping()
  mm/mseal: Add no_mseal_sys_mappings boot parameter
  selftests/mm: Check that no_mseal_sys_mappings unseals system mappings

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |  12 +-
 arch/arm64/kernel/vdso.c                      |   9 +-
 arch/loongarch/kernel/vdso.c                  |   3 +-
 arch/riscv/kernel/vdso.c                      |   2 +-
 arch/s390/kernel/vdso.c                       |   2 +-
 arch/x86/entry/vdso/vma.c                     |   5 +-
 arch/x86/kernel/uprobes.c                     |   2 +-
 include/linux/mm.h                            |   6 -
 init/Kconfig                                  |   5 +-
 kernel/events/uprobes.c                       |   2 +-
 lib/vdso/datastore.c                          |   2 +-
 mm/Kconfig                                    |  23 ++
 mm/mseal.c                                    |  12 +
 mm/vma.c                                      |   2 +
 mm/vma.h                                      |   8 +
 security/Kconfig                              |  21 --
 tools/testing/selftests/Makefile              |   1 -
 tools/testing/selftests/mm/Makefile           |   1 +
 tools/testing/selftests/mm/config             |   1 +
 tools/testing/selftests/mm/run_vmtests.sh     |   6 +
 tools/testing/selftests/mm/sysmap_is_sealed.c | 259 ++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |   5 +
 tools/testing/selftests/mm/vm_util.h          |   1 +
 .../mseal_system_mappings/.gitignore          |   2 -
 .../selftests/mseal_system_mappings/Makefile  |   6 -
 .../selftests/mseal_system_mappings/config    |   1 -
 .../mseal_system_mappings/sysmap_is_sealed.c  | 119 --------
 28 files changed, 345 insertions(+), 180 deletions(-)
 create mode 100644 tools/testing/selftests/mm/sysmap_is_sealed.c
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/.gitignore
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/Makefile
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/config
 delete mode 100644 tools/testing/selftests/mseal_system_mappings/sysmap_is_sealed.c


base-commit: 734a9da61a5bc5d82b496a86bacc097d11dc6871
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
