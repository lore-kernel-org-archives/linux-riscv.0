Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD3EC0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRs7yJi2Vi7gFS+Rpip8ufT1CVM6R02ySkZuI1bvRkc=; b=di/bha/l2dKy6i
	Mvz8akbzjUU2CvyHL+tzvMWFLfNl4IYGhuc+n1SPihIg78H8ikhy1cDuGva5oW4G9VZsi8ey3uZ3a
	0n0nZstIh2ijtfpIXRp5QYsmE65AkGxvPVvpFiyvhbV+BmQYDRMsJAClYaKU1m1j8IwwcNR79SDqe
	RYSOe3WOTEXGZfWVEOHvAMLg5ShaV8qpJEMCLNgl3UW9E2LpmE8ub2+9J0C/gZ3mhvvL1JD67rIoY
	HrLZpg2LIh53lEi5LZfFwsxLrKsyEk4d6YDttO7cc90L/wNxcdxPVsgYspVXANLiXPJQBNTVKWU8U
	cGEr00djwguZIQ9o0kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcvS-00000001nWg-1G3F;
	Mon, 10 Feb 2025 23:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyR-00000001bEL-2K6T
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=44AOn8KPG/5b/gwXWVMZM4o0cSu0C5gCOO/mytEsVzc=; b=QQHpZMAuLIEmlYRqLMcB7ThYIW
	Od4qctgid3Y0nwug8TFffKMkvcb6a8Gs8RZmdMyS/RSsq4C4PXXQ+qS/r7rcVaHuWZrZ9da4wFXG9
	opQcJMz6I4a2RHGYE213UiCkARYv2mKX64qHEL996iuBVeH/WndgjhcSvSEnOdpJFtrlNOrm8BC5A
	JpcMD+3QvNArnVRBh8R9+cGDCZsdW+xKb6jWmeURU5SxWpXVMsBKghD8TIVO59eUlFuQKwZZs/9/m
	Q8ZUfT7nHyya0V8A0NyI54hSFs65D84SzgtnoI2DWaDTwcUYv+wLvmG5ZN2FreYO/nbzjQ55CKzWd
	vajS7xmA==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyC-00000000JHQ-3VOX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 22:09:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de6d412ee9so930a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739225374; x=1739830174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44AOn8KPG/5b/gwXWVMZM4o0cSu0C5gCOO/mytEsVzc=;
        b=t9ai/UYTsDdF+X62AE61o9S2jJVOwpiE6aueEr7M/cpyzLOF/YbbKhMlxImqwIPDhx
         Bbbv17biP0C7PcFd+c/ftXFQo/aMPaI9XNfwuHTYb8beq5R125k/Uw1sLX5h1O7FNjvd
         blHoPYvXXHdHr1IHo6nsKTKoHcu1VYA75xz4w2ktFNwbcGtbldzrwjDAweQ6uEuBU6sg
         TcUAwAJWhzdi/cDj6/PZeJY1qU7I5lJaZosFyWB59M6K00RhCHmLQix5aA2JDRdKaquu
         zSmea7+8WO2UM7lXIrzBBfZFRZeb/CfJNhvjJsF7Mr/vvIKv4Y6Y8BTlsStA0X6/rv4T
         MWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225374; x=1739830174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44AOn8KPG/5b/gwXWVMZM4o0cSu0C5gCOO/mytEsVzc=;
        b=FBNwtMWXd0TjhEszB4eVzO/9HWS/5kQsgh0N2oc05ppLb6zU9NqEqb0cYe7Y+yPOfC
         kdoHI7OVOGwicDBIviq3En+rapL0QdKwqKVNrxuGg6RZlRR/zAo6bfMK5RmXBS21tB8m
         r7mLa0jU1Srpg1zjk+Jfr7V3KH+Oo3Ku+CHR2rtrEkX82SlkRcpRXMtDYvKG5N5rymaN
         yuibizxQYhHSaMwYO9F/0njapAQSgI1yucFKmu81aD/DAtrkYXI7iUGjcWrP0tGqC1Id
         hN4ct5UMVgMWMdBW8CaYiGy6rLlrWiNQdYeQbd1hpZLmBeEhLIwLKOGtzWyV4UPJHKEy
         3DqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkypb+sJthyfNitXD5W407ihJBhz+Gbmeu8uJUDe3MJ8bpMiW4sPCjL8EyovQeYbvMY3V2LuxxfhqEVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6EeACqqaYU8VZgDM13KEdr+iUaH/ihEX6DxyPWmBzQiVlaW+S
	6qc8WKXowjwuXj0o4UeNOQVVzZoFdC+cKQrWZrkVKu0FzK/Abk36JsvqoIud8mkg0IGjiCfLSeJ
	DSk5FK7pPQkIahbzj+HspuZoaeAEymxCikahz
X-Gm-Gg: ASbGncswYSAjxEIeU1SBCWamUpAZgEz6/ydk5nNAcV249rX6h85oeS2t9HRwMNfyYZC
	GUJ8lLVnifgWzB9v3aFse3A4BAPtLdvU2L3F1RtGairYlUyhKNeUC0BA/VjJ/vtxhZXVB9EO+Mh
	ip7n3g89S0NSLZsrS7hHaQqMM=
X-Google-Smtp-Source: AGHT+IG6JmQxBrqAHiHQy9r7fd0aAn9Heiw/iaJpJbhcsh707Pq8kG+sl2h6STthD8Ujnt3Wdn5OEmJdDMQ5PMlBL9s=
X-Received: by 2002:a50:aa93:0:b0:5dc:d08e:e128 with SMTP id
 4fb4d7f45d1cf-5dea05e7838mr1520a12.5.1739225373121; Mon, 10 Feb 2025 14:09:33
 -0800 (PST)
MIME-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com> <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
In-Reply-To: <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
From: Jann Horn <jannh@google.com>
Date: Mon, 10 Feb 2025 23:08:55 +0100
X-Gm-Features: AWEUYZmtdNVDV_xq3vvo5TVQ7aaS79EFzdycTCfl72XGpztchND9QHjN9zcxWNo
Message-ID: <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250210_220937_122525_803A35FB 
X-CRM114-Status: GOOD (  16.83  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgNzozNuKAr1BNIFZhbGVudGluIFNjaG5laWRlciA8dnNj
aG5laWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gV2hhdCBpZiBpc29sYXRlZCBDUFVzIHVuY29uZGl0
aW9uYWxseSBkaWQgYSBUTEJpIGFzIGxhdGUgYXMgcG9zc2libGUgaW4KPiB0aGUgc3RhY2sgcmln
aHQgYmVmb3JlIHJldHVybmluZyB0byB1c2Vyc3BhY2U/IFRoaXMgd291bGQgbWVhbiB0aGF0IHVw
b24KPiByZS1lbnRlcmluZyB0aGUga2VybmVsLCBhbiBpc29sYXRlZCBDUFUncyBUTEIgd291bGRu
J3QgY29udGFpbiBhbnkga2VybmVsCj4gcmFuZ2UgdHJhbnNsYXRpb24gLSB3aXRoIHRoZSBleGNl
cHRpb24gb2Ygd2hhdGV2ZXIgbGllcyBiZXR3ZWVuIHRoZQo+IGxhc3QtbWludXRlIGZsdXNoIGFu
ZCB0aGUgYWN0dWFsIHVzZXJzcGFjZSBlbnRyeSwgd2hpY2ggc2hvdWxkIGJlIGZlYXNpYmxlCj4g
dG8gdmV0PyBUaGVuIEFGQUlDVCB0aGVyZSB3b3VsZG4ndCBiZSBhbnkgd29yay9mbHVzaCB0byBk
ZWZlciwgdGhlIElQSQo+IGNvdWxkIGJlIGVudGlyZWx5IHNpbGVuY2VkIGlmIGl0IHRhcmdldHMg
YW4gaXNvbGF0ZWQgQ1BVLgoKVHdvIGlzc3VlcyB3aXRoIHRoYXQ6CgoxLiBJIHRoaW5rIHRoZSAi
Q29tbW9uIG5vdCBQcml2YXRlIiBmZWF0dXJlIFdpbGwgRGVhY29uIHJlZmVycmVkIHRvIGlzCmlu
Y29tcGF0aWJsZSB3aXRoIHRoaXMgaWRlYToKPGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vZG9j
dW1lbnRhdGlvbi8xMDE4MTEvMDEwNC9BZGRyZXNzLXNwYWNlcy9Db21tb24tbm90LVByaXZhdGU+
CnNheXMgIldoZW4gdGhlIENuUCBiaXQgaXMgc2V0LCB0aGUgc29mdHdhcmUgcHJvbWlzZXMgdG8g
dXNlIHRoZSBBU0lEcwphbmQgVk1JRHMgaW4gdGhlIHNhbWUgd2F5IG9uIGFsbCBwcm9jZXNzb3Jz
LCB3aGljaCBhbGxvd3MgdGhlIFRMQgplbnRyaWVzIHRoYXQgYXJlIGNyZWF0ZWQgYnkgb25lIHBy
b2Nlc3NvciB0byBiZSB1c2VkIGJ5IGFub3RoZXIiCgoyLiBJdCdzIHdyb25nIHRvIGFzc3VtZSB0
aGF0IFRMQiBlbnRyaWVzIGFyZSBvbmx5IHBvcHVsYXRlZCBmb3IKYWRkcmVzc2VzIHlvdSBhY2Nl
c3MgLSB0aGFua3MgdG8gc3BlY3VsYXRpdmUgZXhlY3V0aW9uLCB5b3UgaGF2ZSB0bwphc3N1bWUg
dGhhdCB0aGUgQ1BVIG1pZ2h0IGJlIHBvcHVsYXRpbmcgcmFuZG9tIFRMQiBlbnRyaWVzIGFsbCBv
dmVyCnRoZSBwbGFjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
