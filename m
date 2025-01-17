Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD82BC0218F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRM/Tk+Fb2Lx0FduVCjtQguBVqBMG31jA24ojE4KN1k=; b=FpwyrdLoOTsM71
	vQl9EXuJArAzoUVpriuFWm98Vke8JpYKHylbVLH6ulGmTrDjILLKCRiqNLZIIOFjOs5f9vEZRvkp3
	OWlByAV1M9MwDDWTwATGSMqQvrsKHkQtdN4iApuGwE1v2PBXASuwlfG9npChFA1jFKUP97wlrNGZO
	QUepAkvH1jpv/z6I00j/T+rKY2ePKB1X2gC2E7SNIAYdnVm/6dhQLfvU4JbmlnhYMbiIA7TkOH1RB
	XfasiWVD9QyC8Psg2vpl1X5ew0fTSkkeOckFE5VDX4gorkG39l2flmJ2g+8HKoSgwDSUdhwDI11KI
	q76qaRD5N7ySa1ytS0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIpu-00000008a3U-20Pk;
	Tue, 21 Jan 2025 18:18:50 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkRy-000000008aj-3kfZ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 11:23:44 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-467896541e1so208321cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737113021; x=1737717821; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=UFe4hLvEJKAkTiTGNIKvQk9rLY9H59ruyM7J/0KJBRgxGDX9filmHPj47EbgcpsZTk
         Q9cG/TSeUxSjFq98kBRqORtrBdNzP8f7uqSJnrHyA0UVYlICNVCMhrhpCcdA2KXxaiNe
         mj07c9YbnpSbYl5m0nhAv+rr/XoGlzzHue2/WgVfuBMRakic9R68Z00Lp4KztTKCyD+P
         PkGIQ+LKlsZGjVGU9eK+GYTZondC32bDOOqHt6XLGvw6Fpm0Yi89L2JTb+qFOdpKop4l
         alHfHEInjxZ8Y7fzCCxqvzC1RpDjaEsbcCbHk8NZXdRKaPYzP05FfKMHUVvX097D1u7C
         JWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737113021; x=1737717821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIGX2U5Y620ytLuHZv9C2YKRXU6LkFVVh5lOzeeXil4=;
        b=uQkNsLkhhk5ZAxW3jeJgzb7MV6ioddMXN5yOa3twynrFHzQE3sVrZV/RXjR/tsH5MF
         qQj6z0G68KP+gbxoKn5rQ9wH/pglmxL7rS6gELHjicMvEk442VV2wu2fOeIpGOyIrfsu
         PObUeMT7GnNsZLBflpDXcldkz84AMfxMZwRnAuskuIfdn7WWYjhNWg6sEPjPabmB/IEO
         NqbmNgAh4Uy5r9bf2s3wrLntVI+an8R+Nx2sXAovJduiTEkbDthKUIuI0uHrvvLkp1Ai
         URbvKN6pJUrxp0V6ex1I9EO94+mz+FZg1tQxTofofHyugV3P3grADL4zJIiJoRHjnSp+
         coeA==
X-Forwarded-Encrypted: i=1; AJvYcCUCkDwZKNeyf3Fjhl00NV5ghQlOGNj6ZJDtwlQ7xOz+WlAwpWPgCG/AHUI2n4EgfAikrIimu2KE/jjnrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLH730DgM9I7MYKy8Floev3OMnL9C9SRiXcFjlDKARzp2J7iqx
	CW866VPcRWuxIFyc/UxfnABTZ+XwPbvaKfAIFE79/ozshwV6DCpu5RcbotDlNZcDg3tsv2+/RZx
	5HTPZsTr+FsmFOrma1ucJta0SByS0uc54eJkd
X-Gm-Gg: ASbGnctg0hihgJqa2PLOA+VU8RJgjpX7VtNaT0IjF1Dc51X8o0mpnVYE6Zt23DB1VXA
	PuCc6PyOXgKF7naHQkbIq0S6evPZc/b7lNJZvenkBRizY61ucM1frDaIqrNGvCtvtaY2t
X-Google-Smtp-Source: AGHT+IGncYyjy1GhHnzrsXOo74WzCLmIKZegqTWM730ikUDOlazbTaQH35QB0zgmvzL1yJ283cNPWINqKuKsZStNP0A=
X-Received: by 2002:a05:622a:1997:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46e130af265mr2539121cf.15.1737113021050; Fri, 17 Jan 2025
 03:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com> <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
In-Reply-To: <20250110-asi-rfc-v2-v2-16-8419288bc805@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 17 Jan 2025 12:23:30 +0100
X-Gm-Features: AbW1kvZ_KaymUoc5jGYX-groCnX_p-Tg9PrSiJ2rBOnB_iSLYbhJZulsHf6-rd0
Message-ID: <CA+i-1C1JKEd43vtyGO6RLCQQA8qVCvALjm+q1oVTGMLtjo64iw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 16/29] mm: asi: Map kernel text and static data as nonsensitive
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_032342_946051_572272F9 
X-CRM114-Status: GOOD (  12.39  )
X-Mailman-Approved-At: Tue, 21 Jan 2025 10:18:46 -0800
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

On Fri, 10 Jan 2025 at 19:41, Brendan Jackman <jackmanb@google.com> wrote:
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd, VMEMMAP_START);
> +       asi_clone_pgd(asi_global_nonsensitive_pgd, init_mm.pgd,
> +                     VMEMMAP_START + (1UL << PGDIR_SHIFT));

There's a bug here that Yosry has fixed in our internal version, I
neglected to incorporate that here.

Under KASLR, vmemmap is not necessarily exactly 2 PGDs like this is
assuming. In fact it can share a PGD entry with the vmalloc area. So
to be correct this cloning logic needs to actually look at the
alignment and then navigate the page table hierarchy appropriately.

To be fixed for the next version.

As Yosry noted internally we also need to think about vmmemap getting
updated under memory hotplug.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
