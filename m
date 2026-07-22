Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F7CC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9EOFfMZGLxwE/QiGhqU8O5QbBzuBwpMPKJR6jZdRgc=; b=tCcHc8fcvddNMQmRCycqD+wnkA
	0ef8OMgdtf6Mj8BPcPTY8SQE2mxLJxBHW5dG1jxiUCYkYBkxpP1OglC1WKOXloSDUrZmuiep56ejV
	EwsGXML94aliJNC/+ziS2l9ZUS07feoRPwati9wR4JAvIiOXRKaz/ea4pHzVhsPQHBicVluDE9A8S
	/GEKfAiuTAYFR8ZE+NixdDNgSZ/F6dkD+zjo2TRJyxly/Y4pdRXWuponrWfPi946dVQRhFJqPUOuX
	+MOWscGTh7vndie2+T3+2VqkK9htwAUFOD1derTROyvMNOJq/4krnDndyabnagdtfNLlbM2he8uqA
	1GMjKK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYhM-0000000C7rD-3dEs;
	Wed, 22 Jul 2026 15:17:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYhK-0000000C7q1-35VR
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 15:17:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c1740c36c5cso767757866b.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784733444; x=1785338244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=LSCJRIofq569MEKPW1Bthg1rqQGJUt9g49lgSqc+DSylZ9VSdSfvWhbNrvfESM8Epe
         NDScLJ7uQAJ/me5M/cgaTbgFvpJX2rPTlPOaXO0OP6jk6h+J7WBUFmjxnd3RPYFyLWQE
         zdoVxbyA3UcbQkIByWIM/XWEw0P6WsuZJTGWmj3nBXE6o2J6Z3kmrEnTKx5xmIc8eccy
         rMBu+M6xOD/pXr7nZLmvgd/95pErq99SyNdQQa5SrOxHPbLe9G/fISLF8kNO6tNpJdBr
         tNNu7x+05GN45IfM3FWxgwNCDFoO9Hlnb/xI4ERhs705lCCxgDBiiP5Q3g1+RHSi3VYS
         dgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733444; x=1785338244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Upjmrh5JJYyxIf1oGA8lLlYd9DJQLFwgC7+8SiJQqeY=;
        b=VqupJk+yjL30uMCxksPSmSi1auaaAyNkMWMzDiKYqj/X2O/H/Jk6LDJCdOnBwkWlcF
         N6FgV0hP27zVSlVd47nZCBUmKrQk3ioVQx6iVsntfa7QLy791+Nl67AFzVRUXvCOwuqm
         bh7155Os8IYKLOx+XZimlV17iejclKo0sfDumtv3TU7s0M+ZVAqKUMkzvYiSHaI7sBME
         oHH/cGLWBddL75+qOZXb5LsSVbpeCL5tQ7i7VuoEUzVlzLnE2paTcl0eGpBxaKiFyJKP
         h005Agc2m+sf48bB+rlLiuv8lEibOwUImmbpckZwkEA8YHIaJ70Nc//D+VlmPf3Y2oCQ
         ef+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpRZcwfWeJMyL+pwiP7wYb7UqP08C1cr3dI4ybr1IxK2zIh+rAoBJP6cgYIqLcRQGOrhtMvVFAYGX70PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuKYaJAIeWjATBiTtABbYG61iBzo6bDu9KBh62y3QaphQdul/S
	JxZUxIOR4lrN+cYTxbsle4iWUDh8ywNzH5TnMwj5gG2g6LncPjswd2M0dSKjujXVug==
X-Gm-Gg: AR+sD10s8dYoxe4YKbkvZeylVAW5Sb4ygtwef5fNzdimutOfZIBynS4r4dD+bSKtcdC
	8fdlDXcfvdZR4vpJA8YRnfggy+Wc81l3gUJVTbphcYvYwnIxJhR5rXOaxdpbLz7t4JfXGtrs47T
	p3pYmF7oI4F+zm5+bUzWr9gZ/Wgb00abHSHvKkHKlWSLYHDw0GV3ziN/kWKRwNCeKKTfncTjxE0
	SV5Yepb5sv+p6yzEYHGp1A0S0xLzFSSiCTh1dgO8iZVmeU9b4hZK1+fF398FuGgv4j1HE+2VUaU
	/YRIXxLWWD1oHkzC6QkFfs4j6Ggz0ysFk63xjiq7EUmcVT6Zj/2IJPUa2RgSqfscvwyiXc1KRoo
	ptc06hGGjfxS0dgvAD1nAGFF2siV793EkjPPIdLXrMOABTpjhVVpZSrKaYlMOsdR0kDPzHIghiP
	tGlBB8joz7qt4PWb3Y9HG1kGbMCuJ1TjL/fcis7mgL0ahc
X-Received: by 2002:a17:907:d5a4:b0:c16:a484:90df with SMTP id a640c23a62f3a-c16b485513emr815970066b.35.1784733443140;
        Wed, 22 Jul 2026 08:17:23 -0700 (PDT)
Received: from google.com (152.118.155.104.bc.googleusercontent.com. [104.155.118.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a78229sm131383566b.1.2026.07.22.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:17:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:17:19 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amDe_3KFBc9CcIbo@google.com>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081726_799075_ABD08434 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 07:23:23PM +0300, Mike Rapoport (Microsoft) wrote:

Hi Mike,

>Once this settles, the next step I'm planning is to convert arm64. This
>would be much more involved than loongarch and riscv together, so I
>didn't even aspire to include arm64 in the first RFC. That said, I have
>a very ugly arm64 prototype that rewrites arch/arm64/pageattr.c to use
>the generic CPA infrastructure and replaces the existing implementation
>of page table splits for systems that support bbml2. But there's a lot
>of yak shaving there to get from a PoC to actual patches.

Could you share your PoC for ARM64. I can help you with that and align my 
execmem rox cache for ARM64  changes to the desired shape of this API.    

Best regards,
Adrian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
