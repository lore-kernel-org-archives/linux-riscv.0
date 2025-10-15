Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4EFCCD194
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHqq+N/UhNpHNr0y0BbzpDkM9WyInKFId89vr4ze7/s=; b=1mIssWwhvLXPir
	+iAK0CUCJbxjCZ2yAPLR8Dsskr21TSYYB1urzKogw31Jqm0YkTs/YSBAE9J7CDBm1j14GDBZ8fWQg
	2gE7kN2TK3xlxmvbT7z8UQKCJOmH5j/czi/vOoZCKTbqiHhbtXNsPSL3sh/W5kX+hbUAan0/pdq11
	unl2kGkTxZLe0X34qpj9spEsTfbkJk71ybN9V1j0pxwtSPNAIEeRha9oaLCmXohI4xZQaWB9FeRhV
	ijZnm8vK2rQNxc2aJIq/PBYcAtws9fVhOdR2GoFJzS0fwtHT+5HnrJ8lHLdh/lEJewrzWWWsDvUDM
	hYf6KWujUq1Q/W3R7vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Uf-00000001sRn-1G3d;
	Wed, 15 Oct 2025 14:28:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Uc-00000001sPf-1tRn
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 14:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760538521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgeXfG5LCk279qOJi22HRVqctybfIOuy71nuUr9PHL0=;
	b=Mk8kywQE1BwA49/a/CYGqyLprUSx3HWYyCGag6vZTAFfPBNy9QYhztuUeIuXB62g/usua+
	o7qQGT1neejFp0IqLzBBeO//V5uVx6WmfDsEgRRZKKgToMM4fMRp4EyIsWXBvKqHJtA02g
	5xRj5Qr/VaRPA/MxAzRfxp9OwnNXV3A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-08hAE6gBPDSFcmsJbLKL_w-1; Wed, 15 Oct 2025 10:28:37 -0400
X-MC-Unique: 08hAE6gBPDSFcmsJbLKL_w-1
X-Mimecast-MFC-AGG-ID: 08hAE6gBPDSFcmsJbLKL_w_1760538517
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e3a049abaso46585605e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538516; x=1761143316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgeXfG5LCk279qOJi22HRVqctybfIOuy71nuUr9PHL0=;
        b=mhZIOv/UOSyW7/xgLwXwSf9/KR8Lq0Qzt9VNpmzwRfm3RyRO5NJYzSJWEt6Bsdp51y
         1EIRe7zzP3s+TiSnjvbcuCNm+a3YaaQEjzaNwzNBCxEI8l3FSywmTRBIiDO4AcCHJbOa
         X4HfrY6F0mKFyAXM6V7sN1UE0R+dh0EjVnT5Tn3FCrMv3wr2+rtIssqhGci1UMkVPW4B
         HwBmnN4UqMfyFKghtoikAgNjFIb8NfLLRu6NehmXJYAsrjJUjIs0aUK1yq2i7F+Zin+0
         Ym2/b0EWOgPlKY8jCdyYCyXHb9UdsE9Y/plkBpCcCfJrZCSPeYped6eL6gZUDlS6u4bw
         XD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVNGc5Q98llJi+Qa4zCM4I4t6sGhQSyfto5cIsvabGskiaSSfT7bQR5oYRmT06mPjiuUnL4T/I0U4bqNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqzkdkcPrseza2GowMLCIdl1XLi59ioEMnWVNdehp8qfOLgL8
	XzZR6PE3/5jFRXBMGvAZ7h421wuMmoyT8nbVmU5BuDEJK79TQ7UgiPANBn5gn88eOScYplYxFW9
	pLiPm+4zHjbCmZWDyp6LUP3yKEidw6e6zp+nhrINGq2+3gtCBqM7taeYgWcvjy8GDlPxFKQ==
X-Gm-Gg: ASbGnctNc4BEf4Y1HL3qNMa0Hz6wLDoIhnD84C97PmKuuAcdBMDJFoSBWjC8SGpMu4G
	rxvmqd2P4kj5/MCr9kHLqazTZCWeAfaMG7/Rq+LSNqa5fJjeqbgKZ4jnk1+GCuwrIyOcmVUPEqn
	4a4MMjAiQBWMLns8NExlTKtytkFOfXD03HQJgo6tlYD7WLKibo7XDxD25Bi+Pz28Wew5Fr0yJMi
	63sT0W8Pe/Uvk7i4DprKA1Ch/C5gfZRvDNBU/ysoKLkB8fbUgtZFC4AQBTWAynK+URHJpeiKYR3
	FyShS0XvJHljNJezp38nkJNT5ZZSYcjp37e7wX45Qkk+W57/kJzgdSz2l8KRnAmqOXLy9YTi
X-Received: by 2002:a05:600d:4346:b0:471:9b5:6fd3 with SMTP id 5b1f17b1804b1-47109b57585mr1427135e9.0.1760538516607;
        Wed, 15 Oct 2025 07:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzbrALSQ0Dm6MxbRBonwa/fKtFwvctLkCr56cdjw1iTmex8obFsv5mNCQ28ZCIBWNfB2voXw==
X-Received: by 2002:a05:600d:4346:b0:471:9b5:6fd3 with SMTP id 5b1f17b1804b1-47109b57585mr1426975e9.0.1760538516058;
        Wed, 15 Oct 2025 07:28:36 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.13.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101be0c5bsm48687275e9.1.2025.10.15.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:28:35 -0700 (PDT)
Date: Wed, 15 Oct 2025 16:28:32 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <aO-vkAAk4FCdnLZu@jlelli-thinkpadt14gen4.remote.csb>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aO5I2WGtXqSPYFmH@jlelli-thinkpadt14gen4.remote.csb>
 <xhsmhzf9tld2r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
In-Reply-To: <xhsmhwm4wl2zm.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UucgOBSNWYir5HdsaO4SOz8vjHhBRaEh707XRyViGe8_1760538517
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_072842_558064_DC8889DE 
X-CRM114-Status: GOOD (  22.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/10/25 15:16, Valentin Schneider wrote:
> On 14/10/25 17:26, Valentin Schneider wrote:
> > On 14/10/25 14:58, Juri Lelli wrote:
> >>> Noise
> >>> +++++
> >>>
> >>> Xeon E5-2699 system with SMToff, NOHZ_FULL, isolated CPUs.
> >>> RHEL10 userspace.
> >>>
> >>> Workload is using rteval (kernel compilation + hackbench) on housekee=
ping CPUs
> >>> and a dummy stay-in-userspace loop on the isolated CPUs. The main inv=
ocation is:
> >>>
> >>> $ trace-cmd record -e "ipi_send_cpumask" -f "cpumask & CPUS{$ISOL_CPU=
S}" \
> >>>                 -e "ipi_send_cpu"     -f "cpu & CPUS{$ISOL_CPUS}" \
> >>>                 rteval --onlyload --loads-cpulist=3D$HK_CPUS \
> >>>                 --hackbench-runlowmem=3DTrue --duration=3D$DURATION
> >>>
> >>> This only records IPIs sent to isolated CPUs, so any event there is i=
nterference
> >>> (with a bit of fuzz at the start/end of the workload when spawning the
> >>> processes). All tests were done with a duration of 6 hours.
> >>>
> >>> v6.17
> >>> o ~5400 IPIs received, so about ~200 interfering IPI per isolated CPU
> >>> o About one interfering IPI just shy of every 2 minutes
> >>>
> >>> v6.17 + patches
> >>> o Zilch!
> >>
> >> Nice. :)
> >>
> >> About performance, can we assume housekeeping CPUs are not affected by
> >> the change (they don't seem to use the trick anyway) or do we want/need
> >> to collect some numbers on them as well just in case (maybe more
> >> throughput oriented)?
> >>
> >
> > So for the text_poke IPI yes, because this is all done through
> > context_tracking which doesn't imply housekeeping CPUs.
> >
> > For the TLB flush faff the HK CPUs get two extra writes per kernel entry
> > cycle (one at entry and one at exit, for that stupid signal) which I ex=
pect
> > to be noticeable but small-ish. I can definitely go and measure that.
> >
> =

> On that same Xeon E5-2699 system with the same tuning, the average time
> taken for 300M gettid syscalls on housekeeping CPUs is
>   v6.17:          698.64ns =B1 2.35ns
>   v6.17 + series: 702.60ns =B1 3.43ns
> =

> So noticeable (~.6% worse) but not horrible?

Yeah, seems reasonable.

Thanks for collecting numbers!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
