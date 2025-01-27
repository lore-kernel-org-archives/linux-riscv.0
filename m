Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8139BC02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8s9qsfuYHKYuAnt8Je18rewX++OfYoEUOjhsCp8bo8s=; b=pAI62Oufa2FpDe
	cAwsyM7dnFT1p+jq244Ee2u9+sbKmwZ7KSz/lp/WZ1jLGBbbGURbH/UDRGxic6Yxe/CkD+Y4g8HqW
	gBtOOdSm0G9TqWTe4zpTFkMDAXnqsQdIqfcgEXahCrrZlprn/kbeMlNLwMJkrhnAJDMGaX31S5VWB
	dytgdaTqZZE/pmvWyS+rDDObft9iTVS2DEOcEGIXLgX+FaGaBMUqjWgx9C5NdF5dFVD2ovztP9tGN
	ijPZh8DSbTm9mplzx61CO1XhiIpRKDr/3qNMkCsa1Xa6jeaguCRxWzVtU6MQkDoEUT2lHBEqPTeJF
	VETVPG3Es6RfLuwUcBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMUM-000000029CW-10NY;
	Mon, 27 Jan 2025 10:37:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcMUI-000000029B9-1MpI;
	Mon, 27 Jan 2025 10:37:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4744683e87.2;
        Mon, 27 Jan 2025 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737974220; x=1738579020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4QFE15tzxGQeI7M/zW2nqDheIV1bS+m/FQTTUzpTLk=;
        b=JycV/6XuTf2KjRSIM0GP2k/QIHiCQhoyrs7U++ZvPJKRB4xjyZyyzkDm81ca8kryNd
         YwvkZR+qbPcZl5wdrxBMgrUkur3+xzfGX6/xxuv3YTR8QgljWhp1Q65QTeLAFYdqfz4v
         OA8T3AfHLXkbHQ+fwujSWDgGHyBIRoXMc39/yNQzXZ4LX91D895u27TdcDO/bozHXLQx
         eiGNj41wH0Zdz3RrdWGbFXYqUjdDWxry5fHM2QCjDQO2DPzQWAOn+mS6PFyq0+7O0zZW
         Hu2ztMqmdUYgS/o2Edx5wGbhrysyqO5pIc1/EzhPnTZ0lDxiyErXtATeJc1mTNZ2xdJy
         FA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974220; x=1738579020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4QFE15tzxGQeI7M/zW2nqDheIV1bS+m/FQTTUzpTLk=;
        b=Et8W5OP2iFtT9XwAZdI3l9NxdfWNHZmC8nj41V6PD/MHXhwmnbU/f44pmYyOSh8iA8
         1w72/D9GiM9mqzkWsbwMT3OLi5kEtpEfuHjgC8Ri5UZ8Cixleyeq84UeJ/gnVuYiyafQ
         v8HqkYm8mRD8FAsVnHyrc4Khy5RjGxqeNgyonSAafWbvCVcvzps0pJQmzSvIY71/Pv80
         CpxO2CH7Jb5v0Wrmi+gH4Hc7S8E92BwqOQNbKt/6/38hL+ljCRLx5Ez/q9irwyoXLn9x
         MD/BHRyAji9EAV+W+GwBPTfNNSkQ8EzstlppTlNf6fYpHlLIQU3SXtmcbys3A8athX9E
         5mXg==
X-Forwarded-Encrypted: i=1; AJvYcCXFlkN8I+/ydMs7fLs2b3CrZzhuDTPxCAX0nKQciulIKE1WliD38huPOrc2+rXnZmtTGSAGlVIql7TW558=@lists.infradead.org, AJvYcCXmbSz4KOSRySe8mQho3ZxsGZeDxprfi8Rw6yuZJvrElVGCpYMocs9u84Ny3PfCb31qVXA6ioWX/tZm7gSCPuFK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+eih/8uay+JkcYbwvkNuesjXQDCKEnQZ3/wSAzrTXaQRn4url
	QlvSTncMGoxOpQe+RtcjQEUSs0yhey7Jv7QFMGXvRPg35FM1CiUQSfbBUiAM
X-Gm-Gg: ASbGncthRbb+lDmSLNVlF4ZLcuiL9zyDGq10rk8XmaJryvmoxNe6LTp5awSRHXpJXjO
	H4MGnEBzjQty7nJytjUkiaRZncK/D0F5QhpgFKeQwwRrE4weVChfoPpzkaxVzwdW/dVxxhpgTiX
	ce59z2WCsTp0J9Cd8FfcruiUbDvnB09BldMhgZxR4ujh4djsIFBD/l1xaDDKcduR+x+idJdn4hi
	CtoRlsGaOMotA3wroZyblWnTh30Ca6LtzswOcCodpPLwVnWd1+NI/et77beWyUJ1tmONByhykYg
	HgaJSsK/unAhdpP0UoLfqsbatfBKGSaafgw=
X-Google-Smtp-Source: AGHT+IEcn2mDT5d0SWT5jg0poO+BtsvQPwWj5ydN+QiFTcCpstqFwzzlc4zIAZ/gMSqSpGuiyMrqQQ==
X-Received: by 2002:a19:8c1d:0:b0:543:baa9:a48a with SMTP id 2adb3069b0e04-543baa9a4bcmr6967602e87.27.1737974219462;
        Mon, 27 Jan 2025 02:36:59 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com. [217.213.93.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1956csm14103761fa.70.2025.01.27.02.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 02:36:58 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 27 Jan 2025 11:36:51 +0100
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
Message-ID: <Z5dhw0Ml4KGEfaUv@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
 <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4_Sl-zu7GprkbaL@pc636>
 <xhsmh8qr0p784.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmh8qr0p784.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_023702_365364_A4247DB8 
X-CRM114-Status: GOOD (  27.20  )
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

On Fri, Jan 24, 2025 at 04:22:19PM +0100, Valentin Schneider wrote:
> On 21/01/25 18:00, Uladzislau Rezki wrote:
> >> >
> >> > As noted before, we defer flushing for vmalloc. We have a lazy-threshold
> >> > which can be exposed(if you need it) over sysfs for tuning. So, we can add it.
> >> >
> >>
> >> In a CPU isolation / NOHZ_FULL context, isolated CPUs will be running a
> >> single userspace application that will never enter the kernel, unless
> >> forced to by some interference (e.g. IPI sent from a housekeeping CPU).
> >>
> >> Increasing the lazy threshold would unfortunately only delay the
> >> interference - housekeeping CPUs are free to run whatever, and so they will
> >> eventually cause the lazy threshold to be hit and IPI all the CPUs,
> >> including the isolated/NOHZ_FULL ones.
> >>
> > Do you have any testing results for your workload? I mean how much
> > potentially we can allocate. Again, maybe it is just enough to back
> > and once per-hour offload it.
> >
> 
> Potentially as much as you want... In our Openshift environments, you can
> get any sort of container executing on the housekeeping CPUs and they're
> free to do pretty much whatever they want. Per CPU isolation they're not
> allowed/meant to disturb isolated CPUs, however.
> 
> > Apart of that how critical IPIing CPUs affect your workloads?
> >
> 
> If I'm being pedantic, a single IPI to an isolated CPU breaks the
> isolation. If we can't quiesce IPIs to isolated CPUs, then we can't
> guarantee that whatever is running on the isolated CPUs is actually
> isolated / shielded from third party interference.
> 
I see. I thought you are fixing some issue. I do not see a straight
forward way how to remove such "distortion". Probably we can block the
range which we defer for flushing. But it also can be problematic
because of other constraints.

Thanks!

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
