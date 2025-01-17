Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F9C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvTKh7ee7rKpT4fSRlsM1MTz+HNNXahnqYCrgop+Lmw=; b=CPxD37+Qb7nXoV
	Lf4zkVxu7bQC+tcL1WUnwRzvZyzrdZBD+wZLje1zbacyZ6AeEPviz9TEniHZxJJma4b8yduNwa+9T
	rZsU8YWnEa9NGDK/yCmrMbMGCTXb1GaNytFQoWyiPH1WvJ9k9yiWPUI3mh9tUWhc2kRM7GtrcA8tH
	D6f3cGddQgHjAMSqhsN+pp3kUxQ9a5K69hgAKYZI3AoYoH0zDjXbtoIG/9Foblwgj5Dwi9Yh6Wfs8
	LcFqKUo5MrXTBjjxc4tD1zSFXgKGFlimCBaEkEwmISnTDfRtMNwqh35YaPsJxHipyQEXyfnjNT30T
	dZsRZRUAmARrLIg/m/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoXJ-00000000eoV-2OKs;
	Fri, 17 Jan 2025 15:45:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoEK-00000000c99-390M
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 15:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737127551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
	b=Ym08uVkcxG/LDWcPufyk3EDK78hqCrO3IGQa2hhnh7B93evjAagdhiK6AHe9uD+Z85ouJf
	f1oqESpwIo7p4AixD/Us8mS4LZrSS/chbYqm4cEBa1yAwa9sisdfBMdw+7kNFOYGmwcJZr
	HzNWt6/Wa3uDXkzJvmceFFdVeWwq8Vs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-0CWQinMPMp65kXdbRATKww-1; Fri, 17 Jan 2025 10:25:50 -0500
X-MC-Unique: 0CWQinMPMp65kXdbRATKww-1
X-Mimecast-MFC-AGG-ID: 0CWQinMPMp65kXdbRATKww
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso15923245e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 07:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737127549; x=1737732349;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DE9vuKFSEA1KS0VYNiNovYjAz7Lk/cPOvdu2tw3vf8=;
        b=Bi5L+/6/1xqQrlz6jSlIOqd2zRyUbGasASDCfqEs0mGI8pGBIe+VJ3c4rqz4HOl1Yi
         beeRFNxbfWJs6ha8jBfLjtnRbcZoGr7gmEqS6ti8NubcY/p9udgVPYLhBi1RxexptfEr
         6aRvA2OFBgbVo4twPpAR7fmvabKqCq5Apr/8JOTCg60W39Ut4cx/0xGrYhmcHMPbHknc
         tXSOKpUGj2TNpUi7m0oJQU6Xydhgj0082TdU1vUZKbei15bwx2ep3touLl0cGrWkOaaJ
         dYPXN4YXJW+74FBwpxor/Z7d7eTjolGO6xQC1874o47Ra8GmeKGkhKL0Yd20xOwWaf0Z
         7qAg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Vl3TAS7u/6TEUUaq0tEcdzMGVKQ33iPryQ4tqCo/G9whHWifVUVaOlRoSxCxgbGMydLjmmhppqnTpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDI7X85t7bP0O4JWIFNrbKbZs87aHP7LLWs2t91pPL59Jsuqwo
	7Fpf2JLkTCnyRgZlKICvdj0xgsxzsLO0SajRQuHecSBY1FVKKxfY8M1kOFLp5jdRPFhfo0BwlP6
	awQRZy4a20+HVhzd3c8C7ZRJVpw7heuypA/6RHX3/42UogbMGU688RQKwB0AAQT907g==
X-Gm-Gg: ASbGnctyLiDfAf8urVPN4+qwwETli+AtDAxUbO35MaCTbo5+bgMQsx2BFTx0JJiBWB1
	rmj2VG3CH45yqwOxIqeJitsLAn7uIAVRmXSiIcM7jHrDo4b+ZG5eBYu6XeWkikXleNp3H7ryD3I
	OgMqloIzsMyujaUxr+LZaeYARBrK/FmSRj9gPHN/E+5wI1mGQN50+tnpWEI+P0uCXCYPffRLoL7
	57CSmYyxU9tuFEg+KAlEhdcOru9bnL29kCf41fvm03YOjcqj39nbND79f5FSmhc1qo/rwQjUaVH
	uK8Y1Hwk4ze0Cgaj6sOh6OVmp5kh7z7tb+dJsSI2Aw==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31772225e9.2.1737127549288;
        Fri, 17 Jan 2025 07:25:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0gMZqDwGTwzxqPbq5mivOriCCRRTxthl4OtSHet5NBdrE0Nd7orMMIHX4tKohkjx8g0xD5Q==
X-Received: by 2002:a05:600c:3114:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-438913bff57mr31771625e9.2.1737127548862;
        Fri, 17 Jan 2025 07:25:48 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904621cdsm36969035e9.27.2025.01.17.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:25:48 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
Date: Fri, 17 Jan 2025 16:25:45 +0100
Message-ID: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BjZcTBdNBmkhzkuYOMTkzwqcyhI4kGbb27DyI8QMEjs_1737127549
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_072552_867738_AA8D4ACE 
X-CRM114-Status: GOOD (  16.67  )
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

T24gMTQvMDEvMjUgMTk6MTYsIEphbm4gSG9ybiB3cm90ZToKPiBPbiBUdWUsIEphbiAxNCwgMjAy
NSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4gdnVubWFwKCkncyBpc3N1ZWQgZnJvbSBob3VzZWtlZXBpbmcgQ1BVcyBhcmUgYSBy
ZWxhdGl2ZWx5IGNvbW1vbiBzb3VyY2Ugb2YKPj4gaW50ZXJmZXJlbmNlIGZvciBpc29sYXRlZCBO
T0haX0ZVTEwgQ1BVcywgYXMgdGhleSBhcmUgaGl0IGJ5IHRoZQo+PiBmbHVzaF90bGJfa2VybmVs
X3JhbmdlKCkgSVBJcy4KPj4KPj4gR2l2ZW4gdGhhdCBDUFVzIGV4ZWN1dGluZyBpbiB1c2Vyc3Bh
Y2UgZG8gbm90IGFjY2VzcyBkYXRhIGluIHRoZSB2bWFsbG9jCj4+IHJhbmdlLCB0aGVzZSBJUElz
IGNvdWxkIGJlIGRlZmVycmVkIHVudGlsIHRoZWlyIG5leHQga2VybmVsIGVudHJ5Lgo+Pgo+PiBE
ZWZlcnJhbCB2cyBlYXJseSBlbnRyeSBkYW5nZXIgem9uZQo+PiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQo+Pgo+PiBUaGlzIHJlcXVpcmVzIGEgZ3VhcmFudGVlIHRoYXQgbm90
aGluZyBpbiB0aGUgdm1hbGxvYyByYW5nZSBjYW4gYmUgdnVubWFwJ2QKPj4gYW5kIHRoZW4gYWNj
ZXNzZWQgaW4gZWFybHkgZW50cnkgY29kZS4KPgo+IEluIG90aGVyIHdvcmRzLCBpdCBuZWVkcyBh
IGd1YXJhbnRlZSB0aGF0IG5vIHZtYWxsb2MgYWxsb2NhdGlvbnMgdGhhdAo+IGhhdmUgYmVlbiBj
cmVhdGVkIGluIHRoZSB2bWFsbG9jIHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+
IHRoZW4gYmUgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5LCByaWdodD8KCkknbSBub3Qgc3Vy
ZSBpZiB0aGF0IHdvdWxkIGJlIGEgcHJvYmxlbSAobm90IGFuIG1tIGV4cGVydCwgcGxlYXNlIGRv
CmNvcnJlY3QgbWUpIC0gbG9va2luZyBhdCB2bWFwX3BhZ2VzX3JhbmdlKCksIGZsdXNoX2NhY2hl
X3ZtYXAoKSBpc24ndApkZWZlcnJlZCBhbnl3YXkuCgpTbyBhZnRlciB2bWFwcGluZyBzb21ldGhp
bmcsIEkgd291bGRuJ3QgZXhwZWN0IGlzb2xhdGVkIENQVXMgdG8gaGF2ZQppbnZhbGlkIFRMQiBl
bnRyaWVzIGZvciB0aGUgbmV3bHkgdm1hcHBlZCBwYWdlLgoKSG93ZXZlciwgdXBvbiB2dW5tYXAn
aW5nIHNvbWV0aGluZywgdGhlIFRMQiBmbHVzaCBpcyBkZWZlcnJlZCwgYW5kIHRodXMKc3RhbGUg
VExCIGVudHJpZXMgY2FuIGFuZCB3aWxsIHJlbWFpbiBvbiBpc29sYXRlZCBDUFVzLCB1cCB1bnRp
bCB0aGV5CmV4ZWN1dGUgdGhlIGRlZmVycmVkIGZsdXNoIHRoZW1zZWx2ZXMgKElPVyBmb3IgdGhl
IGVudGlyZSBkdXJhdGlvbiBvZiB0aGUKImRhbmdlciB6b25lIikuCgpEb2VzIHRoYXQgbWFrZSBz
ZW5zZT8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
