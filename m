Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D3C0218C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjG/8VdWMg8XARnlJAqGi5u/+cjGrDYU/4ZLQFcaFsA=; b=IQzsPdCAy0tJEW
	Iy4aemzvyCuGOTUOVlfVVL79nKN1G1U7Q84gsdyvsHvbBTUkXQJ16rNugHVFzQ+Y/xNDM6P8ygMIh
	dv1fhkwa4vtB6PPzf5U99zUyX1YxahCBSut7Z1/KAyWIEZ0TIVXvBmQPe0igJ9LNnhlUsJ0USpHh1
	Jl/ZSqiw+tf6Qt2pXPfIJiL5warqO4ZKEpkuDU4luKZg47LZ8ix74FVnTNlJgzOGbXG2J2NDHWnHA
	tp+H78GvgHvdBD5dTCTUKngpE/1UJXudU19+h0wf/FVRYvoxkNeVXzJ+bC3ic8ox6IWo2xElt6L2P
	3CSN+bzRfLFL8oKZ7efQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHbv-00000008Pqk-0dDj;
	Tue, 21 Jan 2025 17:00:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHbs-00000008PpX-2sp9;
	Tue, 21 Jan 2025 17:00:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-54021daa6cbso6474901e87.0;
        Tue, 21 Jan 2025 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737478814; x=1738083614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O7kZyVX02YaNVvlK+AnjIGslDTljYFtI1mm3L3G+es=;
        b=dwGhIDTSX1q8tP5CcBwm+iT0oZE9wR6Y1IeA1fkrdiQ6czcqtrcGwUjPZrw57pkpIu
         oB1ejBFw7bT1VpwweaJfyV9Lj4/a7Sde6v9lCm0TICJuKVSedKKUGNPPR/ZYr/znNvpW
         PnyiERK2HhPn7D8cd6+c9Oisal04KDZr/ExYAzKNqtj+v25FZ/boGhmEkKBVUi9lTFzl
         M+AnEuE6jR04QnDmlGERhtbKKzMDmHHWEhFkVuZDDI5piXsDFtcVU24UK7x9YmuPB7GR
         1hawyjkahPx2MQt0bZTJDxaT6iZ77MRTE3fxjwfM7G4p09SEDuLP/7UswlzQsNFxMWrB
         RwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737478814; x=1738083614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O7kZyVX02YaNVvlK+AnjIGslDTljYFtI1mm3L3G+es=;
        b=KouHqnNBWFzt/CMPSTjsTdatkg1T8kb9EIeH4KPhFOM5WGLUsCULD2gzwIyKQXHEBX
         LKKL6HfmS10isrro3AG1kuK9ywWoCWJKQAyODVnr7M0lqosu58SQpmdA3uENMfizUonk
         rfUTnLg6Vt6yFazpwFuuz1/D8HEs9WvkwZMeIqwlHXpUyqJSp6qeQMUtKU8WBNoo5C8n
         jHmkL0TnQavjbWFiJfDIxp7/kJL7GuwcYdnM5+m3bwkk65vlgFboV/hozTxxVRgPtMkL
         zZPusV8w/tXevTdsjf74I7rnh2uiYjlDR/lmsUxyPof969821++igeJuUYo39KXf7R1Z
         PspQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmdDoPTQ1lxHX+sgQpK2+9zwuXnAC85XHalfsSlAQuLHgzpKwhkr97B+fFLWKdNCdKHCa0lsHodQyphmVwaibV@lists.infradead.org, AJvYcCVpE+UErUryPH374BsnBrESQRgwKyuc4XjWB6lFLEF0Ay0UDmwQQmesZs4Q/HPyaoCpQtsW7W2AXh2lkeE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDpE4/2drt3XGH6dkMp1bJdq2p9Am0XjkF4UNCNDqdc5Kj3Rq8
	WMGdF+dbRMD0mXZsrm6oJgbn3GtZ5r0iu6NBpxgeKSWjwH1ObANL
X-Gm-Gg: ASbGnctLiJKcWsNXvqngyEHmJj17eKJkgFOGni5peqiFYKRXWSG2AM3AX93/RBx9d3s
	nDfRnnQ5o7E9P34ObQ9bRXw15hDsXSsjylp32jAOHb5WoWkGiUcPTWIKyoy70Wghx5/+OC4vXGn
	37JVRpD9JEcl0XRYFFCPUodDMbw5iHk/9Mjyg9VXUZ+a9UGIIt6XL9s8IIQk8SazWNAO29RWzWf
	whZ/1YWfnm3n0tVpOotKW5Yn3++YHyoKY6ZPrSSThCtFIElMhewFQZyLKQgovGTSNO8cva3CFtM
	56NMT+pXt4hjebnd5OqGftDg
X-Google-Smtp-Source: AGHT+IGYPF71D1RmaKnbW82c+U5IMmpDPZJTk/HJCRRaq5z7S90tH0rTVzhA6Sl8Kwc0O/33Vf8jgg==
X-Received: by 2002:a05:6512:104b:b0:543:9b0f:7d39 with SMTP id 2adb3069b0e04-5439c282920mr7151519e87.32.1737478813837;
        Tue, 21 Jan 2025 09:00:13 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com. [217.213.93.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af76fe9sm1916768e87.212.2025.01.21.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 09:00:12 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 21 Jan 2025 18:00:07 +0100
To: Valentin Schneider <vschneid@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <Z4_Sl-zu7GprkbaL@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
 <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_090016_733832_F79358B0 
X-CRM114-Status: GOOD (  21.59  )
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

> >
> > As noted before, we defer flushing for vmalloc. We have a lazy-threshold
> > which can be exposed(if you need it) over sysfs for tuning. So, we can add it.
> >
> 
> In a CPU isolation / NOHZ_FULL context, isolated CPUs will be running a
> single userspace application that will never enter the kernel, unless
> forced to by some interference (e.g. IPI sent from a housekeeping CPU).
> 
> Increasing the lazy threshold would unfortunately only delay the
> interference - housekeeping CPUs are free to run whatever, and so they will
> eventually cause the lazy threshold to be hit and IPI all the CPUs,
> including the isolated/NOHZ_FULL ones.
> 
Do you have any testing results for your workload? I mean how much
potentially we can allocate. Again, maybe it is just enough to back
and once per-hour offload it.

Apart of that how critical IPIing CPUs affect your workloads?

> I was thinking maybe we could subdivide the vmap space into two regions
> with their own thresholds, but a task may allocate/vmap stuff while on a HK
> CPU and be moved to an isolated CPU afterwards, and also I still don't have
> any strong guarantee about what accesses an isolated CPU can do in its
> early entry code :(
> 
I agree this is not worth to play with a vmap space in terms of splitting it.

Sorry for later answer and thank you!

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
