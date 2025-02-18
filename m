Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AE5C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt5rYGn/2QGNL7TQOYmpmsTOMT03Ogd1paXEkbEc1rA=; b=UbiAKA1/gJviiW
	dAZ/JIJ4+uqERMDryRA7eWAlAWFe4WGC+AquXCPwNZ3ppsUCfun0A+zAYrsiISMQwwMCcYr0dpqP+
	cS8jrgEFF2x5+T2ZypbZM8xzvcNLCcuNLuaW/8XMtG6Z5Jxc+zFHiwj1hRTAYyKSagbAhtKnDwxov
	VjxyLpcVXFno9fJ6ZJgGYIrR/iGHJ7KckqM5FtqQEL+0TlE5UVxgVZihc1yCemT0heAuyegnJ6Kap
	jqVxzLBTF6+xWePi1Bw826RiZo8IYxPstd6qoof9eMXf9mfbn52dZ/JZ4Iux34ismST6xzEsrztN2
	SwVFudgXjLV+YdG/cQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWGh-0000000AATy-2w4Z;
	Tue, 18 Feb 2025 22:40:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWGd-0000000AASB-46OY
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 22:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739918437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
	b=Z9T5QmqjMrZagh5oKqqzyId3JTI1Cmffo7am9QtRvdkJfA06w7fwQlGFZuAM3kzUFastKI
	cA5bIOZcXYHMzTzqGh9mdYCav/odWHm+p8WroWowskPM5GKdKGpSmTjQRQ50cBEGSALwtW
	VH7EoUtQJ6ifvCmGGEgRu89wGyCYow8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Jsinqd1HMomu8m4OJD2iVQ-1; Tue, 18 Feb 2025 17:40:36 -0500
X-MC-Unique: Jsinqd1HMomu8m4OJD2iVQ-1
X-Mimecast-MFC-AGG-ID: Jsinqd1HMomu8m4OJD2iVQ_1739918435
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4388eee7073so961555e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 14:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739918435; x=1740523235;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivyLIcXrK8i6Sm3bd5ok9RWHX3VEX/cjKUj/8oDDJcE=;
        b=ScO9wQQJq3r+fkPV/WVk+OIWDtYYylc3YGJ/iJUdpd8tWiamHaOI1gm0nQNM+C+De9
         3/4dHt10/dLPUJqcHvuaiomXA5SY2hud7Ctuq4yVMwSa7+qkF2Wxy/HurXH/PLSmTCyA
         Mn/qgXDD/07fdcbBwxvWHf5FpeYYmoLmkuDBYZXzocK+8kVTQIDe/Hpw5pAhunMXvdHP
         zdEFijV0j1AS/NYLMUe2wL8ItAYUiSKyTLdkKAoMOYY3LS2quCD+NHoXVc3pgHAzIdVI
         wwxg+bomqhL/Ptw0XiuoURNJnzquajyYi/zZhcRjHk5B04yYMrRGguoiM4qfReNWPPWR
         jfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yMVzWsCvDdgalPDEneTe6HGISEqOUsnn0W0MmaYX4yD2QYBfetFgf4DpTf3Y7iLCP3TBMgYw2ld2oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz41ZPSGvscaweFiQ+iWF4NVIm9lat4q2U+orjYhof/+J3nABVo
	6PQ1WxuZU4i+W+MMafN0HWdA7/PQvcHIsdz+4w8u74LU9Bwlv+23dblvCMvKe0IYBBCNDF7jIxT
	3Rvu9zoAJrBK9nzXOt13K2WiBK4Nel4PaPAd3KxpPJKiLfQses4ZqPtVESJ56TZ2/uQ==
X-Gm-Gg: ASbGncu4KHS4V5DuvVkYEvyntcJpG3jABp7SlLGjmbyDlCeE15g29herssSJleydg9l
	cqIbRmUiqjbYu1QyyznfQP2cV7Wla6GXybDLI47naTX5X3WRrGKTbcseZiuVIWwghK9WibSeX9F
	58cyVt/CBSOIIl6BWIu5FtVB7RlDicPoQqPECy8w42FjwG2ry+CbWE+It+uco0P0k6ZTqzjzyrw
	ua8HkaZ9YlIpx+DqZcK019hqGJDFg9rU9SyvHrW5DdArLQD7xRnaQBTWiLmsThgTVlwLbMlJ1Q9
	R2WZtJeWn6TlwIpjwjOajnTCUJquL7faZ1SvjVa9JYCiQR9SlNIIp/McNZiAZFvG6A==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11797395e9.5.1739918435410;
        Tue, 18 Feb 2025 14:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI17xveq4qpUoXVn3jaf3vZekMu127UgmikmUhaFlSZ5tyuyrG+gdqtYt1+dNUau7VWeDZUA==
X-Received: by 2002:a05:600c:314b:b0:439:86c4:a8d7 with SMTP id 5b1f17b1804b1-43999ae0dc8mr11797275e9.5.1739918434928;
        Tue, 18 Feb 2025 14:40:34 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43993847f39sm32922065e9.14.2025.02.18.14.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 14:40:34 -0800 (PST)
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
In-Reply-To: <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
Date: Tue, 18 Feb 2025 23:40:31 +0100
Message-ID: <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vYd4HLGymqBG-0H7dGcBYVQRmu7XSJ7eeLFnwN-mcOQ_1739918435
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_144040_169041_C2A1965B 
X-CRM114-Status: GOOD (  17.10  )
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

On 11/02/25 06:22, Dave Hansen wrote:
> On 2/11/25 05:33, Valentin Schneider wrote:
>>> 2. It's wrong to assume that TLB entries are only populated for
>>> addresses you access - thanks to speculative execution, you have to
>>> assume that the CPU might be populating random TLB entries all over
>>> the place.
>> Gotta love speculation. Now it is supposed to be limited to genuinely
>> accessible data & code, right? Say theoretically we have a full TLBi as
>> literally the last thing before doing the return-to-userspace, speculation
>> should be limited to executing maybe bits of the return-from-userspace
>> code?
>
> In practice, it's mostly limited like that.
>
> Architecturally, there are no promises from the CPU. It is within its
> rights to cache anything from the page tables at any time. If it's in
> the CR3 tree, it's fair game.
>

So what if the VMEMMAP range *isn't* in the CR3 tree when a CPU is
executing in userspace?

AIUI that's the case with kPTI - the remaining kernel pages should mostly
be .entry.text and cpu_entry_area, at least for x86.

It sounds like it wouldn't do much for arm64 though, if with CnP a CPU executing in
userspace and with the user/trampoline page table installed can still use
TLB entries of another CPU executing in kernelspace with the kernel page
table installed.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
