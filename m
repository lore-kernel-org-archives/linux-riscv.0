Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB87CA5FAD
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCDo2J1XObmQqYIzwD1tDFr6NOG1dPGmNII06lLwhKI=; b=c5WV0WrpU7jrd0
	5ghZyQ4ruaTUuvhBr8SUXor61wQBDqZrRA9tTG4nK33wOcg/H21hx6GDUQ/C+/UsF7bdz4LZI+5kP
	cLVth4cuN6mMspLgwhoeUXrmWOMDhWjAd2xO/Aujx3SLk3bvH5vi0qRjyCvVHd7N48IHCDQCDwlgF
	0OWi+vsAZOiDEifdxQYC0uLPRASYKCVqaoQO8bYvcT1E7/dTe3JtkUFHY4o9jSzbcm4g5bMNUKKr9
	lgZ8HhtkC/yK2eAhcFUn/e+ykNArTnRBb7+82wz4s1838xQU3sMOfcheb1OSwGsbJOJrXLDiOU985
	mMuK982xLnTGm1q7zQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNH-000000020eb-29bS;
	Tue, 29 Sep 2026 01:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0V9-0000000CozJ-1w4V
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 07:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=; b=YPU6ennJ84i1RhbNNeWnJI6m3q
	wmNNU9vcWwzZhk3lmRGRb0VsrMz7P/wnQyONtj7pkNQ0gAOhYRyAaConGQJK7Gin3IjzdtdxI2mzX
	tZfhSDmgy4zT89OChpoWNDi59M+KZiM1pjC7B0Jt6F8wzTxpHx+abpV35lI4nkzU2L1DnCnzf2qUz
	g4Gn4pqEwZliGHsWXi7d4oD4T5EN9irLqJV1UYIwX6uzf7MHiYy2Jcio5EjxjkSmBKBYNpZyQaQpr
	yi+worh7sr5O3OYDSYcL7JFA21binWUutrS3qLqjzxhehL57UpXUVmfc8gNiA3dBKvQHjjfvCi33W
	HbVeiIDg==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA0V6-0000000GhHA-0fs1
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:37:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6aa13d8d9d0so7272a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 00:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321862; cv=none;
        d=google.com; s=arc-20260327;
        b=hoUM8cW1RadWL+hnBTDdtAh2PpjUvJr9dXsANBCIpuSP8fDBiaAfvvKrbfwanV56Ua
         61Eg5lo8NsY0eYCC40f1xpdbwJQNnTQsH9WqzqkmAXdJ1zsCFCg3i2RWVXNo+b+moVhD
         B3Iwu3egucKV+yf2knrwKY8yQxuHge+sXBnXmJliUJ/Ljkg0XO70cxSyhriiao9Wvqri
         mvIHFp6nXyhJ8gTOoXzTSjLroy+CbigSifnqfRgG44CxNxpybAySTQf3kqY81Ynp6UW7
         itdoQfpSZUl/O+Qv7Wycw+4pABq5Ug+4ySpAk1Y8hPPeIzDT9lSutOWWlWCEna+rS/JX
         Obnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        fh=CrQ8jtP5xUhJEfB6+bpl5hPOETsjCxmxQGYZl1grclE=;
        b=GdokrRns7ozkVfz5ab5e70wBxCZN4sD3LwRwalE7VPtCUE300gEBTFJpAOYdTFGNhE
         kKk6xmQZL/wlvDy7lt7IcQyQb82wFJJ4EgEF/8y7V+Bt2zIzcdwmsVW89bXgawl7IpD7
         FGqisugdyG+2Os+Ch/MOEDD3OTQR9/vr35aObBMoqD02iFGu/5avMMvIY0r+jckT/MAr
         OFRNUXDcOlxAd0ShirHG8gsKZxyXXCkybrCQ52Ev76PVUgjQ4Aq3MBfUBXYbnadh5q0q
         Vd+h8OMOiINmvcfYaVHY5u/oCVuAYQpdOSQ4GglVXPoAh8XrUaQlUk9NolTqqBSgQvi/
         Gbcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321862; x=1790926662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=qrm9mKREf/+gTUYupGych30pXPpjiEfKSlrJijM6jGHGa1eeOf+oUm18XhpkT+GPVf
         Kh9pLkmjQLQRaPc9Os63O+MPOH/QRM1aQ+7Ea78mI5eYDWMVpsX1Ym7Hx6NlqKqN75I3
         vejIH/egsfxe93gIYQEbd3U7X9EqGje1UoxnELKQ4uGvDuvnwf1Wtg7a9bbX3wpP7LLA
         LdmVHc/F10LuUCd2l6Eb506dmJ2DgVj/IVDO/6GMONKmKRCD0UMiRNFQnAc03cZpS808
         FRIoNOK+SDpOB/VMzOSOZcD53wx2ZBCq5sMdIPa8pFko5ryRxj3U12/p0PD32rmeRV0O
         zklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321862; x=1790926662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oc+jzCqS0Wyq/bTJh2/I4jluChyvqK4NXUNsIigcps=;
        b=wWYyPJ9/PPZYONV6pAitt8R19TSsIVTmlBYSuZW0iTFQbL1zDglv8ulml462VVHiRa
         ns2tvkjvUml9VrUVKix+ybBFzEX+fwn6cBeGMPlYmsfcV8qtl5431+BRgFQaNWv2nq4U
         VIlycJkAeOYetL8Ex9OKM5VSAjaGjCdWFk79cTAhO3OjCI/hg4OTi5kr7K85AwfBhHMd
         58CO8Ta6Sf10q7NS12W+U8ncqk4ByT6eqjHPq0u7UKcMCirY5A8DrYKuyXLNhw2gEPvi
         tXu3skf5cp4pNwsjq4r05bX8TNCXHKjB9YE/ZlzzMTG1K0zPyz246XOMeYzFHSlWWvzQ
         5zKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx58VY6nigULCpH70A1En+bAM1Vn2z9wcQ68RDbe8Z6JSXDRsksUQSyOi0EpeXCNdTAN5nIovd9+ew7Qg==@lists.infradead.org
X-Gm-Message-State: AFuF++kyhmXgiU7k7bjg92XOpooFKfUxIIi+cxUl8Bqk7LX7nAma1QNp
	wDqgvxaoeoyxeAZf7yAo7e/irR692kcKu+NXCcvSJkGQdN3Pj4ASGVK5cH311vWPUGXp+HvMLdi
	v+PFtRt9KN+KLhNMR76x4sHev+ovjJjEXO7fj7oJC
X-Gm-Gg: AYBFou3y8kx6w5an7dN+j7pqv4w122Rv0rFXSpSTGGKJUCsz9uwQ7nAHIGhRowaHznT
	iUlI/P3/RunY/0N8JgvSPWiNbh225m1YHPFitVIJKgVgAMmt6Rdkpj2tx8ZW1rO0hZqVyP7WRS8
	HO9U/6oNhPjPuk3K1MAED90u5bz1wL95wmJCpcfupN3MLo+WeHVtSwg3yW5YM6d3Z7fwt+BZ1pg
	l/695M7WFdu8rJSGe0Z4szqmJkxQ3VSIHj2WYIhOrRtwfqQk7BwoxQTKl67GMTh6Lqg/HEEGwTT
	YPri0O4VjuAL+QjyiRB528/O1aDjjWt/4yMJNXZ5mU84hNWAVXwQYg==
X-Received: by 2002:a05:6402:2714:b0:6a6:f2a5:1b4f with SMTP id
 4fb4d7f45d1cf-6aae4729638mr36915a12.4.1790321859803; Fri, 25 Sep 2026
 00:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-7-4583d8a23bca@kernel.org> <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
In-Reply-To: <DLNSOBMBHIVC.22QI9YBL1U72E@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:37:26 -0700
X-Gm-Features: AclHuK_RUT9CXNFLpx8ZY_roLEZNzp5S3oNdpNL4cW25fJBFg9wRGnSWohuMdYA
Message-ID: <CAJuCfpH6AF-hOo4jU6OeNVpd+fgpqLpmcfAGs11J=nPCgAqG_w@mail.gmail.com>
Subject: Re: [PATCH v3 07/40] mm/vma: tidy up map kernel pages enum values
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_083744_331331_9828003B 
X-CRM114-Status: GOOD (  17.14  )
X-Mailman-Approved-At: Mon, 28 Sep 2026 18:11:13 -0700
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTI6MzHigK9QTSBaaSBZYW4gPHppeUBudmlkaWEuY29t
PiB3cm90ZToKPgo+IE9uIFRodSBTZXAgMTcsIDIwMjYgYXQgMTI6MjIgUE0gRURULCBMb3Jlbnpv
IFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4gPiBNTUFQX01BUF9LRVJORUxfUEFHRVMgaXMgYSBtb3V0
aGZ1bCwgZGlzY2FyZCB0aGUgTUFQXyBhcyB0aGF0J3MgaW1wbGllZCBieQo+ID4gTU1BUC4KPiA+
Cj4gPiBBbHNvIHdoaWxlIHdlJ3JlIGhlcmUgZGVsZXRlIHVzZWxlc3MgY29tbWVudHMgZm9yIG1t
YXAgYWN0aW9ucyB3aG9zZSBuYW1lcwo+ID4gY2xlYXJseSBpbmRpY2F0ZSB3aGF0IHRoZXkgYXJl
IGZvci4KPiA+Cj4gPiBBbHNvIHVwZGF0ZSB0aGUgdXNlcmxhbmQgVk1BIHRlc3RzIHRvIHJlZmxl
Y3QgdGhpcyBjaGFuZ2UuCj4gPgo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2VybmVsLm9y
Zz4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgfCAyICstCj4g
PiAgaW5jbHVkZS9saW51eC9tbV90eXBlcy5oICAgICAgICB8IDggKysrKy0tLS0KPiA+ICBtbS91
dGlsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgOCArKysrLS0tLQo+ID4gIHRvb2xzL3Rlc3Rp
bmcvdm1hL2luY2x1ZGUvZHVwLmggfCA4ICsrKystLS0tCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gTEdUTS4KPgo+IFJldmlld2Vk
LWJ5OiBaaSBZYW4gPHppeUBudmlkaWEuY29tPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNh
cnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMsCj4gWWFuLCBa
aQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
