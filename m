Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73571C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jA4LjGS+DwaF9dV3b7fh3CoQkuzU2qzlauQXHj++kw=; b=4CUWxjfrE0IfpT
	WyAKBQw1solrtF/wA0hBZ05ZnaZzfW2XKHX3nBLvc2NQqjF26oHH8AfODhe3qRkYcLdeUnVmBsEn3
	JtmZFF5zevBcTlUlGnahEXkyybJX29mopTaOsro8TyChidgsWfUiwiSPWdlJh8dct+HIsE2/lhjOt
	VhUnQht0Nw5zbna71e15lO1ZND5RHJXgyo3q2Rs8Eh5tl7aYdPdw8QEotTxGjt/Pr7/CQVHUBslBd
	hbHANn2x/f/fILs6fI5Y2sxPxF5MRaCWbX2WIXpRicc1w4zBdPcz0qpWNAfek/qWLM5f0ckcI1El7
	VPyAxH7E1xFqLIfN23dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlfL-00000009QNe-1pco;
	Tue, 14 Jan 2025 18:29:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlfI-00000009QLw-0s9J
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:29:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6ad83so3311685a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736879362; x=1737484162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+L6x2g4BC/d/+jfoDGOj0pMskOpzz9VGXCLG5E4WwRY=;
        b=gpLopMg5XizhuF5j+Enp+Ly0XENUEx8gN4IXzlqwQg89Jr7AmtKL0k2pVT3Yv76M6F
         MzxMg6ry83dUALGMWXE8XyYpwBSGfSdGrlWDkYd6dwSb7jrqOKsc6YvbIv//WB4p12VR
         Q+PQkmau5jLzlV8NY+HEgatLODBmK1JTbogRlsF09YHycVc2nSePSzDJcq78T2UWUcHn
         wwNJGBkBpAE/cwuPC4YmO+x7nOKWQ+2qlv7LELC73bloWdE78ybDohrgqjOZ/vGyV9GB
         gDYuEGiFhN0x3uyxMx0Rtb+bsAcVSRnpxg3wqd82C2GTJL+7kH2g9d7Kvxnez1dnK6fg
         V6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879362; x=1737484162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L6x2g4BC/d/+jfoDGOj0pMskOpzz9VGXCLG5E4WwRY=;
        b=eD92D/CqaTB0XfhZr9ruKsZV+5ec3GvRsmfX01f7qnqM6rC/R1LjXQvHj9HBDeGEEG
         8S5JoarUApBA6MfdS5URzAudNxueQpDOm10ZtlfWlpCXA2Jf3D0c7aOocDGupLy5Fr/D
         Go1g3+BJvFUO9WeDxecNu8ienY5N/e+kDebYhuDfN5C/ZQVyfkT7WbbRSqIAFGpe/+3z
         CPOpBjs5QV9CXoMXU2NZivNe9+mHONgB43vTng+DcKzz8lJ+0+FRe62eGkLl2Gh/hwQW
         Cdf8oYHRKJP9anU9oBRF0UFW/mhqtsEjfbMmPgllrKpr885p9qodkGqekhlRAeJ96Qv2
         TGQw==
X-Forwarded-Encrypted: i=1; AJvYcCWUePtlNYEQTUnpOLTDYS4K1igzDZpX/p/ScWhd8J7iz3G06P35ietnd9cmPWHls64t+EAP+TdVzFjx4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5tEdkgIE4XL+J9aauCc0pmY8FmVjFqjBliqKRtdq4eQMhZybl
	ddEEGIhOumGD4AnIyl7btjU0NMLjbpzjKAdGkSDI0aFyeAZJMsqcCe/vclRyopc=
X-Gm-Gg: ASbGncuuiFLV5imJrxBu25TB69PLEY2lEVE9kajCXfU3hnOdW7Jo+W3s9OIgHV9hi4y
	z2zZukLha9tgkBkCSGUCXiU+UmvDRKiR8cgrr3chwMfyYiWMxLf524vIFN20H0Dlu5F8n6eEJsQ
	TDXfXLhnvx7gh9F/6sLxLFox0COEf37Uv0FulGlicNXFN9DPj7gqW/eakr6KkppUEqJ4KvaZqPQ
	IE48cCtWg3P6BudRwMi0araoONVq8UGw4uMz4NpSua/Ch/bE11zowy9unR+djb/L8+26irvwMBX
	rMSxEnkfFskT8pyK4ZgaqY7zkC3REjvwu/BnweHtYw==
X-Google-Smtp-Source: AGHT+IElLRyBSSFsvDLttv+1rxbirlHss1/zCBNTWvitDc/Y1ed9oUs4kNSXL7wHp3+sai4oSrFAlg==
X-Received: by 2002:a17:907:96a7:b0:aa6:2c18:aaa2 with SMTP id a640c23a62f3a-ab2ab73e7dbmr2340049566b.27.1736879362392;
        Tue, 14 Jan 2025 10:29:22 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f04fsm659166066b.27.2025.01.14.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:29:21 -0800 (PST)
Date: Tue, 14 Jan 2025 19:29:21 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 10/30] riscv/paravirt: Mark pv_steal_clock static call
 as __ro_after_init
Message-ID: <20250114-7fc0ed577ee91b6813f92806@orel>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-11-vschneid@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114175143.81438-11-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102924_254145_AEFF3B11 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, Jan 14, 2025 at 06:51:23PM +0100, Valentin Schneider wrote:
> The static call is only ever updated in:
> 
>   __init pv_time_init()
>   __init xen_time_setup_guest()
> 
> so mark it appropriately as __ro_after_init.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/riscv/kernel/paravirt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
> index fa6b0339a65de..dfe8808016fd8 100644
> --- a/arch/riscv/kernel/paravirt.c
> +++ b/arch/riscv/kernel/paravirt.c
> @@ -30,7 +30,7 @@ static u64 native_steal_clock(int cpu)
>  	return 0;
>  }
>  
> -DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
> +DEFINE_STATIC_CALL_RO(pv_steal_clock, native_steal_clock);
>  
>  static bool steal_acc = true;
>  static int __init parse_no_stealacc(char *arg)
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
