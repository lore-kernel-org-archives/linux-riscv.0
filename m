Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8261C3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beK5NEDdvCpfHpt0krM4DeB6lU2Du9HmWTobkFwpD1k=; b=X9IKxMVZUWfmlc
	wEGUr5rpcXsU9fPLSbAlTxVHz9Qh3nKVKGctiDTWlRWIg+7XTt8be9VrrJXRiDQFUmEDyXDwLluUm
	bJ6dkQZSMDxB/p6zG6Ezi5RJdr4LNzvEBeWC33rZYWwNHjm8+Y4Ht0ZZJIQOXoj08P7bdUCj3jDrO
	wnRBogv4GeAE2KypZ5pUOrbbFWewNvOwpdUJwikpW7T2onXSYXPFEqdbLfQKC7Xm2E01E1FbvffAg
	qMFWgfmw6JvH+yvyd1rCE/WiY7TznJKkDDJFAZMIiAQXS/KTFr1987hbCO4gq4B3tY7QWpEHZnoRL
	LNN477L0k5Z7Ipaarlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwna-00000007dIT-3xgj;
	Mon, 05 May 2025 14:28:02 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwnX-00000007dGa-3z4T
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 14:28:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso59828466b.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746455278; x=1747060078; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VBzMpH2jBdczGJAGi07riCizg5SErgbDrt1biXSYE6I=;
        b=Cbx6EEpZ5yhXnAfMSWa0+zlUb7aI8d7yP1o2i69UNnP5YcFzR7jhokpXKeJLIlu+OQ
         IN8l9kVfndLJy8kP6sMYFw00m7+2EZbpngE1a/uY+roWyPch2BFQb/Q0UeF5oIeeEDTw
         SFTxCkXysDRnd89/XuJvNHuvUGepaNgwDt2RyHxUujx8MSdHWArfN9NAOPV2O18kSAUb
         KtoSfey/NEwhETdaw9xLCRJUUHMY+bdaCIPp0yrIZZfzhBu8KPUIR9lniAQ24Ch06vQw
         Mw9qWavpA6DSnFp48bo4Wl7T/hVzqnAnU2r//CU5MPbbA4Q/ukqWGfpWNbKJYHIWpW8a
         8yGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455278; x=1747060078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBzMpH2jBdczGJAGi07riCizg5SErgbDrt1biXSYE6I=;
        b=N3cQFaUJnIbHfP7XnT4lcmrh+XgcczPQYxCzQfyPC/nSKQW0UU3ee9KHYjJ9fp4PkJ
         Amn/YdMEYAXGtvA6hqwnntEhTKXIRoqJI9ksGsO1/RMlaFamEt+ucv1thjYzYxeq0IWJ
         0h0aS2au/Et0JGM4yjygxAyKQPWj5ax2ww7mrP96qgLI7i8CuxOPPISEoxekZg4sjPja
         HeBASfdQHY64GKiBZQAPUEUgQ8a3YYXPkcwa+Fs21tNjEM0zfn3CyPPy53Gl+zubgaip
         WsStN0S73IjaqwpeKvrWhEC9og4JOLp6L+8GkI3B1CZupo2NkvqbHjsiwXsVydfcKB9+
         vOdw==
X-Forwarded-Encrypted: i=1; AJvYcCWf40A9OqI0SxllSWoYBL6aJOD1/HOsp2uVHsWb6iTj7+3X17sSiCb8q/2VJlCkTLAdujUscRopqwzU1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXUoYN1Pph+oxrR7QyHzBfQHvwP8Hf7X8tSpVyKKEpqPTzIae/
	8ByJ/LVUx8nWqap6NeXoyN8cJHrzMewF7BpF3GjU8EVmfYBeNTTl9PMzzM2otYc=
X-Gm-Gg: ASbGncsp2mHx35t/VtefxS3ndV1VTKbLpzZKGwXO/sAtSXkbAnmGo3Ki1Oz2OA2fpMn
	ynAjaOPgO4cbLMJj2XqlpzT/SxBB6eED6EuE5v5nCk5ROvTfZLD3Il8l46cHpjmLrIyUIUeQA5T
	V7W6f5dViiYSjesVvB/+8U0kXgTE0NYJ0/aRB+sF6SJBPkgsivH02k/ISHnPlwpe7J9WiYHmkYw
	RKNwYlO7x4phHAdNec1s75fFvUoYxTHGMciLn1yKU1en7Cxu9cUkSC6rcOynLNUTQtbg5CCkKft
	cZH6dvAfTrfePgROmrseeppavruQd7omJdTSiYBonNrQtEKH5u8RBA==
X-Google-Smtp-Source: AGHT+IExfE0hcX78gw0nn1iPLAnLmMN0HdxWQnnSN8VNB89rL2yQ8NHWy4t+WCuJ1B8DNVSnVHuwAg==
X-Received: by 2002:a17:906:c115:b0:ad0:c6ae:c0c9 with SMTP id a640c23a62f3a-ad1a4ab7f0dmr731420066b.40.1746455277537;
        Mon, 05 May 2025 07:27:57 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a1f2dsm498974566b.40.2025.05.05.07.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:27:57 -0700 (PDT)
Message-ID: <68e762ec-d320-4077-b321-63eefefe6d7d@suse.com>
Date: Mon, 5 May 2025 16:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/25] module: Remove outdated comment about text_size
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 rcu@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 Juri Lelli <juri.lelli@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Yair Podemsky <ypodemsk@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Nicolas Saenz Julienne <nsaenz@amazon.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Naveen N Rao <naveen@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Rong Xu <xur@google.com>,
 Rafael Aquini <aquini@redhat.com>, Song Liu <song@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Brian Gerst <brgerst@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Randy Dunlap <rdunlap@infradead.org>, John Stultz <jstultz@google.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20250429113242.998312-1-vschneid@redhat.com>
 <20250429113242.998312-23-vschneid@redhat.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250429113242.998312-23-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_072759_984968_DD86BC6D 
X-CRM114-Status: GOOD (  12.32  )
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

On 4/29/25 13:32, Valentin Schneider wrote:
> The text_size bit referred to by the comment has been removed as of commit
> 
>   ac3b43283923 ("module: replace module_layout with module_memory")
> 
> and is thus no longer relevant. Remove it and comment about the contents of
> the masks array instead.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>

This comment cleanup is independent of the rest of the series. I've
picked it separately on modules-next.

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
