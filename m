Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB681C6FA9D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ4qbq6w9/2FjwD2URze1KDoQZgXSAe5yF1eaWW9+nE=; b=TiTUzCjljKFFTm/832/e9+rYQ1
	GdD0GjX6fwF+R3oMWn4QqqB74Y+6ugrVCdJjVDOdDVYqGI5RS9W0DU0dG4p5Z4NNjYfkRi3m6CLiG
	v2u61eVPTfBSftOFWwRAXDdSIgKqhyZc3j38L7lPfh8RTJm2azbkQz3fmbx/W3AWI+0japqbSyVC9
	QSxf7IO5v74yVv69aCwDlXX3BCZ1+MxDStK14a5k9fNw1mav9Lgudx+98pgRhb343RVUe+5eYYUgL
	2T1/wIuUiv1Y5urUWJV/wU++0IfgfEzW+F79JjoKpn3KAlC5TuKwZdSBf2EoiJozs1kAs5zpuJnKN
	YWogPGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOff-00Ggox-1g; Wed, 01 Mar 2023 15:47:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOaI-00GeSZ-0d
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 15:41:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id v11so10881410plz.8
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 07:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=RacUjtkKVhkSdFUBywOGho+8dt8NsK+GHdxWXdQ69WX2yCf/yYWl7r6icMXBWT/ShM
         KzbzJEeKqlnWntlEh4Hu5sno9Ak81pDzhFum2pY94j4Sv2hldxTUvXOesOtDXjR8r6gc
         qTgIZDS9fRsSDLNbTTTqAFsgPsTJ/DQ+0jjGE9ek1g+5UBhUcmjFAxCNoVki1FxJorhz
         1mqoDsTuoBLwUNz+cTKmWUvmBN0WlvjuL/8NCCPe/UsZ69pgJ+6lNteW1mdicJGes/KY
         sz2TvcyHAjAaMaJRH5/VJiCFama3PVa+Xs98E38Ow6CsZfQ4ni3p2/e/LUrMvV5jGCLw
         yEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=mN/l9Wg4dHt6yPAEaAQczikkKdbc9ae5ImQV7FCyqLyen6KGEpSahdbJHmKqmh6Uil
         CoJPcMXXtLvWmsUQGwm//xKI6CfMCQ0wsSq1Hf110X1vg0nuD5no69453ZOhOUsKGmPN
         7u0yz/kv4yhFL1NrU035gf5Hs+p+VRjQ2K101K3BCknHwxvcqyQjNkiNkVt1bpu6F06V
         kZ69kjkSaGGwN6cCfiHFkymi5XQiwMIh/zSkCMnWHV40dJp7XMnG0qrxKWV+L8vLeY9v
         nJQZT1/YGGELx+O0xlKvIRy4oYLkZkW5VW9hasKX/ijtNKS8SzSs2T1aJLEGC33sCgMy
         wSMQ==
X-Gm-Message-State: AO0yUKUvcKJxtE5lJtdJXU4EwV/1wM4utLLdyxYmJy3AAPjXfuOBTU82
	KWLJRnNH4PijPiygQrX/euPccA==
X-Google-Smtp-Source: AK7set89u8u7K351sr+Ck6r7PKKsfq0NxjZus48TDBYC9SmTqwP5jGqb0tSf18Db2RC/D0Tp3KOSQg==
X-Received: by 2002:a05:6a20:2444:b0:cc:ac05:88f7 with SMTP id t4-20020a056a20244400b000ccac0588f7mr8304959pzc.34.1677685295782;
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b005821c109cebsm8058970pff.199.2023.03.01.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Date: Wed, 1 Mar 2023 07:41:30 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
	Balbir Singh <bsingharora@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Cyrill Gorcunov <gorcunov@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Florian Weimer <fweimer@redhat.com>,
	"H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Nadav Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	John Allen <john.allen@amd.com>, kcc@google.com, eranian@google.com,
	rppt@kernel.org, jamorris@linux.microsoft.com,
	dethoma@microsoft.com, akpm@linux-foundation.org,
	Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
	david@redhat.com, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <20230301154130.GB3505369@debug.ba.rivosinc.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_074138_164496_97C9D7FA 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
>The x86 Control-flow Enforcement Technology (CET) feature includes a new
>type of memory called shadow stack. This shadow stack memory has some
>unusual properties, which requires some core mm changes to function
>properly.
>
>One of these unusual properties is that shadow stack memory is writable,
>but only in limited ways. These limits are applied via a specific PTE
>bit combination. Nevertheless, the memory is writable, and core mm code
>will need to apply the writable permissions in the typical paths that
>call pte_mkwrite().
>
>In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>that they are special shadow stack flavor of writable memory. So make
>pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>create regular writable memory or shadow stack memory.
>
>Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
>
>No functional change.
>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-alpha@vger.kernel.org
>Cc: linux-snps-arc@lists.infradead.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-csky@vger.kernel.org
>Cc: linux-hexagon@vger.kernel.org
>Cc: linux-ia64@vger.kernel.org
>Cc: loongarch@lists.linux.dev
>Cc: linux-m68k@lists.linux-m68k.org
>Cc: Michal Simek <monstr@monstr.eu>
>Cc: Dinh Nguyen <dinguyen@kernel.org>
>Cc: linux-mips@vger.kernel.org
>Cc: openrisc@lists.librecores.org
>Cc: linux-parisc@vger.kernel.org
>Cc: linuxppc-dev@lists.ozlabs.org
>Cc: linux-riscv@lists.infradead.org
>Cc: linux-s390@vger.kernel.org
>Cc: linux-sh@vger.kernel.org
>Cc: sparclinux@vger.kernel.org
>Cc: linux-um@lists.infradead.org
>Cc: xen-devel@lists.xenproject.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-mm@kvack.org
>Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: Deepak Gupta <debug@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
