Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD1C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 15:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/GefqMSJOFcWReFJmtaG21u1Bdl8SGqUwGDpX3aJsw=; b=WonUvaMR1nrD0O
	jSo1L/Cr4PIjhYpAakvE/Bvkz+MFIUzg4UyUaKvHxWycfBocugJ4iilAke0ynWRZb2ZsKn8q42w+Q
	uf56pEFMipfH6jd1baj0DgK+pCRveklU3CBxG9z7RBwpWR+k0wwN/Qo+wSPBCrsJtx8NZKeWi4lHw
	JfN9cRdO++zcnJbXbZh5xm7fARzvUYDSds2OQ132ZiYPXxW2iduyN1AUCwW1kRiJIDQyqOyIKCfk9
	QRyeYzpkL+fOjCJSIHiwolGMbHbK/1l5Q9WbjKaL7tYDBQ0T3Tkl5EBfdaXv37XwLI5aTcwaWh2ta
	PttR+oOh9Z9LOt/fBKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklmb-0000000DU4l-2eSq;
	Wed, 19 Feb 2025 15:14:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkllB-0000000DTh8-49yU
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Feb 2025 15:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=; b=GGdGgJndLzAQ/s9j8Qe4dkuTLU
	g1ojNtRYQU3To2kp6N8Z9p8uMwtLp2tRwUXVzi6L0Pq/zoWRagraNPSM3/VjlU+ed/HPG9j5YipWO
	bZVLmapBM8K6/dkx9Asw0KciuqRNhAdby3iMjdluo54DxNmoP0OxtXvjk/JE2f3OO7kofWgUcktkS
	W2PDg8rBAn3xSjKQXPlhs0RmYhiZQQwi+PptgmGYvvbcV2ePP4mFhwsi1M9M285q45LbJQ0wQRDjW
	P/9FZc0vhhXBuJ71pANRYXvM9Q+Y2UMU6kSXCkaDhr2+m3Stw3uCLVPAxpKoaQvgk5pY4d1hRhJ3F
	cKrAuLiA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkll7-00000002Edl-2DsQ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 15:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739977986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=;
	b=GW9GPyekQTHonsiuL57zD47+u+pvv3Zl7lMu41Z4O6mg0ReVmlHevyBl3eQBcru2N3jwZu
	k9R27JRRiNS53QWSMhSBaGNB9Ms8uh7mZTmLrVdVRZfz0VvxIJoPta3YcWzLr6/O0bp4GK
	9E3HzKLwpohKweKhoeD8s1HfvoR3VBA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739977987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=;
	b=TFCEB5GjqZMNSk8DaTaYFNLzsry9euhobU1lp0x5CC3ltMyhFwB0DxcNBg8t1NvAnsoxwX
	DPlMaYdOn5HSLly1jzgqucReYGibF9LRNA7FqatnPH9tFxwFZNsCFmk7j2hs/TB2HXhKos
	JFcU4fr7Biz3WbyUQwER1h3TP2obdxQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-JC4ljwEzPF6r-uqei1A6lQ-1; Wed, 19 Feb 2025 10:13:05 -0500
X-MC-Unique: JC4ljwEzPF6r-uqei1A6lQ-1
X-Mimecast-MFC-AGG-ID: JC4ljwEzPF6r-uqei1A6lQ_1739977984
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947979ce8so35000595e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 07:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739977984; x=1740582784;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEDFkhBYjRhP5Z93Fy/FXNH8qcO0tYdixMhBiEsACWQ=;
        b=LzwIAGvhEC9PZ2vxg2I4iqt5h0afsXmXaIxa2QeDWF8B3OKoKhWqYW5sQNSZZL12HM
         4mOEobNp3kRPdd6Pa74g/doWgas5s85ARD9g9YDVb6/wQ/EErbQE0gHKUrTagzSrRhGL
         DEzlOsc/jIfekcdno4dp6D470k0bpI6OX/kjPp54sO1ud+w85ruEJ/IbTtg2jsh9GUq9
         rltmjJxurGGAPWaJyZgly8QiVQz81Pf/CgPmP9cTCpTp73E4XdGC9GRHfpqzDYbDRRkv
         cYcqYXeOouO0DRooMRU7zuLtHQU321HVlPbo/GDWjd6uCQDu8mRTLirdVLnT/QSLAl/0
         rLlw==
X-Forwarded-Encrypted: i=1; AJvYcCVNHZY0YQH/W4ybdu21gCrDcLgS2WTPLj3oGVQCudRD3hH3zOhfIAcdNGcxNrrV9aj0YXubIF+9rxYtzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoCNE61xZafOzC+KZfnb8QP+tH/3CS/syXD5jYvdWZnLqh2ovT
	iUq1VDjX4OGsRWWdnhVdRb6PqPitkcxJtT0D7u0Ztgcz8kyO/9yOTJPzPo9JbNSZcGOL8MGaZA/
	Z14dfbH8jJALRbwm4jGJrGPLo+JCQ1jfZKgsFTMHsixibHHY5ULbqX/VCT6n1mZQJMg==
X-Gm-Gg: ASbGncs1HEFrFSEQIdT3BTxbl61PTbpvA9wnkuM95aVnLFnaFCpVgN4xJ1flKS2dFUG
	0fMhy2Phg/055LWQ+pegDoLra6h+g7y8XeOr31uNt/yOVNZXJ8wZeHH3ijGNsVbNPwJT9DiaJFJ
	WACFMcwCgXcxgtDILJKGQx7JCn4HEAaQWplmDEpMzOVGbO+vm5VVnniRnOYh63EI5UrQtk+AKKo
	eKH1Vgaz5SWlJUSksVEuj6p4b0R6p9ppuGfyIupBkGLrwO100y8xNoIy9NpIywwqF2peCi79cJr
	135cDASZuepAfKI+4Mt8iJcDvT6alvSSL0B1UdH0DsNFyJp+FWSUZUC6bdTayq9Pmg==
X-Received: by 2002:a05:600c:3d0b:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-43988bbd322mr97619395e9.2.1739977984088;
        Wed, 19 Feb 2025 07:13:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqXB0SvUjV4zwF8A6smqwc0vRSLTkn6r2mJurV/wBBuDlOIkQeOJi/olfCVvoVfIVGXKI8cw==
X-Received: by 2002:a05:600c:3d0b:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-43988bbd322mr97618455e9.2.1739977983617;
        Wed, 19 Feb 2025 07:13:03 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858ec5fasm88121225e9.29.2025.02.19.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:13:02 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>, Jann Horn <jannh@google.com>
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
In-Reply-To: <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
 <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
Date: Wed, 19 Feb 2025 16:13:00 +0100
Message-ID: <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SLEc5dnPSblbj5IpDTeaG1BzJ0c9zKNRBEOAoOVEjwc_1739977984
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151310_078587_81F704AC 
X-CRM114-Status: GOOD (  19.32  )
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

On 18/02/25 16:39, Dave Hansen wrote:
> On 2/18/25 14:40, Valentin Schneider wrote:
>>> In practice, it's mostly limited like that.
>>>
>>> Architecturally, there are no promises from the CPU. It is within its
>>> rights to cache anything from the page tables at any time. If it's in
>>> the CR3 tree, it's fair game.
>>>
>> So what if the VMEMMAP range *isn't* in the CR3 tree when a CPU is
>> executing in userspace?
>>
>> AIUI that's the case with kPTI - the remaining kernel pages should mostly
>> be .entry.text and cpu_entry_area, at least for x86.
>
> Having part of VMEMMAP not in the CR3 tree should be harmless while
> running userspace. VMEMMAP is a purely software structure; the hardware
> doesn't do implicit supervisor accesses to it. It's also not needed in
> super early entry.
>
> Maybe I missed part of the discussion though. Is VMEMMAP your only
> concern? I would have guessed that the more generic vmalloc()
> functionality would be harder to pin down.

Urgh, that'll teach me to send emails that late - I did indeed mean the
vmalloc() range, not at all VMEMMAP. IIUC *neither* are present in the user
kPTI page table and AFAICT the page table swap is done before the actual vmap'd
stack (CONFIG_VMAP_STACK=y) gets used.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
