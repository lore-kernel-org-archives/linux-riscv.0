Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C7E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWe9yvPASNrLt2QZ2eXdNKgXdAmoYg+wIEk3FF5Z/PY=; b=FYQf84+R8ASz2/
	f2znO68mO8U4BBZlC2cGwTHDOXudysQ1Uy9xR2OU+fAqycuSHMKOfzTnCB+1eFXkV5yVmMHB6ijcC
	pZb7nNypCUJ6+zN7UtljxOpyFM11jDt/VKq//5p6U92vdL7VDg2vzA0Jto6rImgY4jKqBD3FJZdwK
	hxBYe3ylVgXOjmQq9n/+M4HVHKCTP54tsydAb052lzs+4etn3cI6VzNgOMeiD2re9QANx7eiaJXCW
	oUjCYZY6fE/qXN0i9qv5rxoKUxXMx0EeuPUZZ8Xiy4V2LDXg+kl/KrbUHEAeQCf39UMYQh0DHwVEP
	E89uBOf9OC6Mp1I9mv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlVc-00000009OOT-3qso;
	Tue, 14 Jan 2025 18:19:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlTf-00000009O1w-33WJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:17:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so8518a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 10:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736878641; x=1737483441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0aYHuk99JA9dU0puEhTqa+Ivu5XtOv7dOMzqH0MLLU=;
        b=Bh2Zw5u+3RzeWUXaHfKCWFEyjRvAM4NXt9QkT6gOLgebAnoLIfPuk/mxMfZsrB7+nm
         usB7MR2oAtFdnBuMUCHZDUKQ4ktwFzvacywvLllcxvTVt3g1IADAKeG544GgCHJvwFr6
         GFaHXh8Lcz1eeBt6C8EB3O9MZ6EeZhO5d29IGGa0dkUDYoV3OXQJOhoAG9dLUgbg+oLe
         GsnOnOi1MhnFu/LGYflEA4dN3mH4n92FH37yzXXW3QFC58zh/v8zBHrkaRo6JGAn6xR0
         imxn6TWFXrRIR4x1+bJF0kZgL4t9clDgRnmf3c8iI/0R14IP4P913b8jid6j5WmpJ+fK
         C9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878641; x=1737483441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0aYHuk99JA9dU0puEhTqa+Ivu5XtOv7dOMzqH0MLLU=;
        b=FY0CXr9H80pPatD3gd/5BM6auM4blehOrJIGBT8M6SaTPRcTBWdSc4jo8bdCgvH2/6
         bmMG/CRP6gm0lnvreSKKujvVZOTt4GoEDxRBEP012RJN25u+EpJMCpPiSz9sfuN7GJx6
         Ra4fe3K5/x/Z/e5caH1leCxL+rIwJopjIDl4sWWOIPAG05y6zQTkY4nwiq2TdvbwrBxb
         Vbfeeo3tqVR3JqtMMP5KMYRj0mbeXo7LNj4yFVW0wRtDxWuSd9u4+yMbugAPbxo4UgX3
         0sENvBjfX8KWFtZn/5SXtoTEaNhOtDMvkd5/as3o6oaWfeSVf+lsx/C819gwy3J/QQ+s
         6/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyogWWGSPp0xBEAfGtSfxXY1F41NxAq2dYiB1dPKi+y5x02/flqwgXOm7lZ0JkcecmwNWpuv6wo7XVkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTVGZE3KoSpN9cKa5s09E2HpvCRK6igdSWWRNf88gfImecqiEr
	lkdneIeBwVjmbYahIj07Mc2E4l85JcmLWsJfc6V1O80Ca/vashnVgOQfe/pfMmbqcbeJeBvZAja
	NzknZRYN/X/e60uBB1sSKs1lHT9OprQsWrivF
X-Gm-Gg: ASbGncuCkH52Zvelfliu1LYgeCbbnh5iaNO2+4KnoQ3OWQlziSq4bky9eRYDXJHFZd/
	sDAIsenhfvyKJ8wpMcsb5NBvoY4TpGw2S+/dPYIPeaMi64ez3OaJghduYMO+5vtl7RQ==
X-Google-Smtp-Source: AGHT+IFOWOuSvDhgzEqoKb2CNkVmA/sXHofQ9hZDfWF+l4vbbQk0RN2k51cQSZIijLzKAw1RUyxlH5Nb9O1wedqOjko=
X-Received: by 2002:a50:d4d2:0:b0:5d1:22e1:7458 with SMTP id
 4fb4d7f45d1cf-5d9f695dda7mr124694a12.4.1736878640478; Tue, 14 Jan 2025
 10:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-30-vschneid@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 14 Jan 2025 19:16:44 +0100
X-Gm-Features: AbW1kvY7dNxOnvBqE7JSPz560QoJfBjiwfsZgS18MpZMQ07ZRC1TBr6Zwl5A-60
Message-ID: <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer flush_tlb_kernel_range()
 targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_101723_770256_FE78074B 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNjo1MeKAr1BNIFZhbGVudGluIFNjaG5laWRlciA8dnNj
aG5laWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gdnVubWFwKCkncyBpc3N1ZWQgZnJvbSBob3VzZWtl
ZXBpbmcgQ1BVcyBhcmUgYSByZWxhdGl2ZWx5IGNvbW1vbiBzb3VyY2Ugb2YKPiBpbnRlcmZlcmVu
Y2UgZm9yIGlzb2xhdGVkIE5PSFpfRlVMTCBDUFVzLCBhcyB0aGV5IGFyZSBoaXQgYnkgdGhlCj4g
Zmx1c2hfdGxiX2tlcm5lbF9yYW5nZSgpIElQSXMuCj4KPiBHaXZlbiB0aGF0IENQVXMgZXhlY3V0
aW5nIGluIHVzZXJzcGFjZSBkbyBub3QgYWNjZXNzIGRhdGEgaW4gdGhlIHZtYWxsb2MKPiByYW5n
ZSwgdGhlc2UgSVBJcyBjb3VsZCBiZSBkZWZlcnJlZCB1bnRpbCB0aGVpciBuZXh0IGtlcm5lbCBl
bnRyeS4KPgo+IERlZmVycmFsIHZzIGVhcmx5IGVudHJ5IGRhbmdlciB6b25lCj4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPgo+IFRoaXMgcmVxdWlyZXMgYSBndWFyYW50ZWUg
dGhhdCBub3RoaW5nIGluIHRoZSB2bWFsbG9jIHJhbmdlIGNhbiBiZSB2dW5tYXAnZAo+IGFuZCB0
aGVuIGFjY2Vzc2VkIGluIGVhcmx5IGVudHJ5IGNvZGUuCgpJbiBvdGhlciB3b3JkcywgaXQgbmVl
ZHMgYSBndWFyYW50ZWUgdGhhdCBubyB2bWFsbG9jIGFsbG9jYXRpb25zIHRoYXQKaGF2ZSBiZWVu
IGNyZWF0ZWQgaW4gdGhlIHZtYWxsb2MgcmVnaW9uIHdoaWxlIHRoZSBDUFUgd2FzIGlkbGUgY2Fu
CnRoZW4gYmUgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5LCByaWdodD8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
