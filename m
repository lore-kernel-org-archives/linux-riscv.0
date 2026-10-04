Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C90CA600D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGVTzIlsdUiN7tpy1ozS4MVMsnd4Oo12C7PWwfVoZh0=; b=LsUWNNTFiWUZg6
	EPl5HB6zdTZunAMst3//CnuBHAcwUrTP+TQ0ARCM20dodsTbH+1vLypaYBbUKmBsWDFXs3Xw/sAHt
	k2zoFX6j3Yn7CPYZmRcLwVnG+ZDEZk/OWetNSGXMm5fpHRIr9j5HDpZ8RyG1LXx2YNvcbAsrQ73gb
	isaSjlpSFbtODhd+S4YL7tAfFSL0J0lncf9IPst77L9bodHUFPj7sxGYe2YQJEnsjOjIZZL3sjaDf
	H/OG03UGCxQeTnOxhePDlegzFdFB8ViU9K49sk7MpCpwVJ7JF72Qu9kd2a84ykNv65LFxMQCQvXk/
	Q32+oTu42CYG57Sq39lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpf-00000002ryI-1oS9;
	Wed, 07 Oct 2026 17:53:35 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPwx-0000000F7GN-2eWx
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:24:37 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-5337c7b9937so260161cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134674; cv=none;
        d=google.com; s=arc-20260327;
        b=cKuTnYeuh/Qia+c+je/RVoAQEPQQs7APoRNEPa+rT9lEOM8RScxBbW9FPv8yOcPYJL
         Cky0AnC+TZZXw96Kbkv0BWfEhmnuJ4KPitGL3wGP46YUc++mYqdAxfwNXLaKoldIAqe3
         oIHSeB96UDEcSi5IXhQBbZd9UFKAipy5Y72m4gFbWKUqugdQ9oXBqiUswqV7XKT2QT9M
         SGCMYIieTn23f0GWsab0wCUo51NQuMxs0QM+9SOFVwsXCh9XfqBUU4HlgNI4fyI4Ohqw
         wLdb1cdd21M7ttez7ntPsFz8dtCnZmnnCW2r+EMjISZi23I72Tnbey0zNvyWOKgdPUK+
         QydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+M84/MVcGEHYdv8UiC0womKlZljWSjBnuX6fRyYL/I=;
        fh=wkVsCS08fnMs466sHSnqn8yaPXd01avW1egZWrBYdEw=;
        b=b+RARv8yKq3OeOmTNQarwcUCm3bMaThhB9PO97faS34Yl5n3pKtXyu9nC8TdNsA1Uk
         bR4ZrYTYA6anmS18rKPJg50AM56o1RnvN0jTzOoE9/VWJDkgDBgoTTBR/ndP8nSXoNC/
         rF8pPZ5ltAJivAPGYoT4R7O7He7B1g9M85TSJKXvwUkmlFuMKMTyOuo+BcHUbRJ1VqGd
         MVgW6tKscJmdSzgWrfPLfftac2Il9mAKPqCpOZsE+uzpA+7zE3guNpgqW43zqFW+TuFi
         C/cVIHHBWxigEQglVHviY5tODObKkUVWzphodolJl6x1LpGBenVU4PaMsHvcEd2dOwSi
         FZ7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134674; x=1791739474; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+M84/MVcGEHYdv8UiC0womKlZljWSjBnuX6fRyYL/I=;
        b=uQyxqacVht3/g6d1MiO4Edtg80mCoIidMCwAvW/UGtppp4IforMdZSaLMzsStGBKK0
         f5FnOBP72NwFHk4qnqMabGXNn8DKbKPwEGSpzRleiP/a4LyHdShQeDdeldP3Ec8VK5iV
         B4t9k9skk2JeNAaFe59ukqbf9iGELJHYzfqePCnQoO4X1Rl1ZvWKf9iB+BlXsX5YW5N7
         Dcto5r3JbFv4dcLrkEkCZ3WhwvlQ1DDgJe/hM9EiBT47p0GE3qlGa1U/MkCvcH1ePJpN
         2HJGRBMq7guxAjPhI80XDvQ6dChrqMD27sAn9vweJYiBqt/U+KjxvwlMgTArtQhW0VnL
         WOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134674; x=1791739474;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+M84/MVcGEHYdv8UiC0womKlZljWSjBnuX6fRyYL/I=;
        b=sroPvJv32IPQh4zDCYYykxrorN8SsJyflwKNg7VBIeujGrEU8wwfKnCtmNRixEbGrB
         3aRpv/0ZNK4nMdtAD3bRK2hUk+MnXcSohqA7PN+GFUR2imVVUnozTlzJRESwVgjA+grA
         ezCHyhdsRkieQWRAirQApk1Y9Z+DcXoJiFcuIzCj4R64kstXZxEO8br7oZ1eIjLRMSTr
         cLNP9V0F7oXxiEUdFuGeCsJtfd+Tr0zkLLJnELPOPgx6UMnwCXRoOtmrqtPqqxaLY5Ds
         iYj9Kpx8i9pbQKfv+SG2+nuK/Pg5Oxg/eisPBRgmp4xt3q03lw4NnPmEnuW9oZXYWXCW
         uh5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1u0bv0rBynfoeDv0Qni+tyxEBhFFINokDIuMlxbjIfVViMJFEPSId0P/UvN6iAG+sYtyZpRz9akcUww==@lists.infradead.org
X-Gm-Message-State: AFuF++lXK1D8/ALYIsHWCcQnpM6zyz+5Zf2wouPJ1vglgcoxSbvJWNu4
	qwuJWkd0NhtW4F/wC4bx2YS8Mqs8dCEfNI2mSv7AkSnFcdzefas/LCPKuPZBE7nxn4FbLLGaGTm
	yU9Ro3Dtgzrl5GxSDqCm0UDdimBHFs/gpK9HJ83rD
X-Gm-Gg: AYBFou3Ohoq1qFR4iuK78gCM2qLj6V6i+SmffFADSF9Dsmlfs3DugvWPbdH2Rk9jPbR
	5SPeFM+PPqtJDB0cSjmzm549cJjf2q8UPFkIJB/ycf2rpNxqtG+hE82wCtW1Je7Zb0eSYUZTpbp
	Sex3Ph3wY3XiJkqUGp5tmtPbXPUzAGmcdeYMaKAz7bwGFCc1o0soi1r5LORvRXtujCHeu0QZ1dS
	+9IO3jlmsgpB9UGkk8R47dTFLtI0y9439fyQF+06yefKO+qyGjHxbsby6fCMMZLuqNT7GeR4oWH
	aCt62p35CBqGGaYidDrz1iW5yPQh7G30aMf1G0bZiIHP1e91niF9m3Q5
X-Received: by 2002:a05:622a:606:b0:532:84d3:abb with SMTP id
 d75a77b69052e-535131b5a84mr14345371cf.7.1791134673403; Sun, 04 Oct 2026
 10:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-13-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-13-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:24:22 -0700
X-Gm-Features: AclHuK9jHlOUV2ZRb5fsxUCRxMZ3OpnGbWN3MVyf3rU51TqoB71rd8PxNlF0WhY
Message-ID: <CAJuCfpE7W7uFZfztCHRCouc9z49wPV96usW2QewJNZwprK7bRw@mail.gmail.com>
Subject: Re: [PATCH v4 13/38] bpf: arena: mark arena_map_mmap() mappings VM_MIXEDMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Emil Tsalapatis <emil@etsalapatis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_102435_699276_172DEE8A 
X-CRM114-Status: GOOD (  27.86  )
X-Mailman-Approved-At: Wed, 07 Oct 2026 10:52:38 -0700
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgYnBmX21hcC0+b3BzLT5tYXBfbW1hcCBjYWxs
YmFjayBpbnZva2VkIGJ5IGJwZl9tYXBfbW1hcCgpIGNhbiBiZSBzZXQgdG8KPiBvbmUgb2Ygcmlu
Z2J1Zl9tYXBfbW1hcF9rZXJuKCksIHJpbmdidWZfbWFwX21tYXBfdXNlcigpLCBhcnJheV9tYXBf
bW1hcCgpCj4gb3IgYXJlbmFfbWFwX21tYXAoKS4KPgo+IEl0IGlzIGNvbnZlbnRpb24gaW4gbW0g
dG8gbWFyayBtYXBwaW5ncyB3aG9zZSBwYWdlcyB0aGUga2VybmVsIG1hbmFnZXMKPiBpdHNlbGYg
d2l0aCBWTV9NSVhFRE1BUCwgc28gY29yZSBtbSBrbm93cyBub3QgdG8gdHJlYXQgdGhlbSBhcyBv
cmRpbmFyeQo+IHBhZ2UgY2FjaGUgb3IgYW5vbnltb3VzIG1lbW9yeS4KPgo+IFRoZSBtYXBfbW1h
cCBjYWxsYmFja3MgcmluZ2J1Zl9tYXBfbW1hcF9rZXJuKCkgYW5kIHJpbmdidWZfbWFwX21tYXBf
dXNlcigpCj4gdXNlIHJlbWFwX3ZtYWxsb2NfcmFuZ2UoKSwgd2hpY2ggdWx0aW1hdGVseSBpbnZv
a2VzIHZtX2luc2VydF9wYWdlKCkgYW5kIHNvCj4gbWFya3MgdGhlIHJhbmdlcyBWTV9NSVhFRE1B
UCwgYW5kIGFycmF5X21hcF9tbWFwKCkgc2V0cyBWTV9NSVhFRE1BUAo+IGV4cGxpY2l0bHkuCj4K
PiBIb3dldmVyLCB0aGUgZXhjZXB0aW9uIHRvIHRoaXMgaXMgYXJlbmFfbWFwX21tYXAoKSwgd2hp
Y2ggZG9lc24ndCBzZXQgdGhlCj4gZmxhZy4KPgo+IFRoaXMgcGF0Y2ggY29ycmVjdHMgdGhpcyBh
bmQgdXBkYXRlcyB0aGUgY29tbWVudCB0byByZWZsZWN0IGl0Lgo+Cj4gVGhlIHBhZ2VzIGFyZSBy
ZWZjb3VudGVkIGFuZCB2bV9ub3JtYWxfcGFnZSgpIGZpbmRzIHRoZW0gcmVnYXJkbGVzcyBvZiB0
aGUKPiBmbGFnLCBhbmQgVk1fRE9OVEVYUEFORCByZW1haW5zIHNldCAobWFya2luZyB0aGUgbWVt
b3J5IGFzIFZNX1NQRUNJQUwgYW5kCj4gdGh1cyB1bm1lcmdlYWJsZSkuIFRoZSBvbmUgZWZmZWN0
IGlzIHRoYXQgTlVNQSBiYWxhbmNpbmcgbm93IHNraXBzIHRoZXNlCj4gVk1BcywgYXMgaXQgYWxy
ZWFkeSBkb2VzIGZvciB0aGUgb3RoZXIgYnBmIG1hcCBtYXBwaW5ncywgd2hpY2ggaXMgdGhlCj4g
cmVhc29uIGFycmF5X21hcF9tbWFwKCkgZ2l2ZXMgZm9yIHNldHRpbmcgdGhlIGZsYWcuCj4KPiBU
aGUgaW50ZW50IG9mIHRoaXMgcGF0Y2ggaXMgdG8gYmUgYWJsZSB0byBlc3RhYmxpc2ggdGhlIGlu
dmFyaWFudCB0aGF0IG9ubHkKPiBQRk4tbWFwcGVkIG9yIG1peGVkIG1hcCByYW5nZXMgbWF5IGNs
ZWFyIHRoZSBWTV9NQVlXUklURSBmbGFnLCBhcyBpcyBkb25lCj4gaW4gYnBmX21hcF9tbWFwKCku
Cj4KPiBSZXZpZXdlZC1ieTogRW1pbCBUc2FsYXBhdGlzIDxlbWlsQGV0c2FsYXBhdGlzLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgoK
UmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CgoKPiAt
LS0KPiAga2VybmVsL2JwZi9hcmVuYS5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvYXJl
bmEuYyBiL2tlcm5lbC9icGYvYXJlbmEuYwo+IGluZGV4IDdiNjg0NzIwMGI0My4uYjY5ZmU1ZTM0
MzM5IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvYXJlbmEuYwo+ICsrKyBiL2tlcm5lbC9icGYv
YXJlbmEuYwo+IEBAIC02MjAsOCArNjIwLDkgQEAgc3RhdGljIGludCBhcmVuYV9tYXBfbW1hcChz
dHJ1Y3QgYnBmX21hcCAqbWFwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgICAgICAg
ICAqIGNsZWFycyBWTV9NQVlFWEVDLiBTZXQgVk1fRE9OVEVYUEFORCB0byBhdm9pZCBwb3RlbnRp
YWwgY2hhbmdlCj4gICAgICAgICAgKiBvZiB1c2VyX3ZtX3N0YXJ0LiBTZXQgVk1fRE9OVENPUFkg
dG8gcHJldmVudCBhcmVuYSBWTUEgZnJvbQo+ICAgICAgICAgICogYmVpbmcgY29waWVkIGludG8g
dGhlIGNoaWxkIHByb2Nlc3Mgb24gZm9yay4KPiArICAgICAgICAqIFRoaXMgaXMgYSBrZXJuZWwg
cGFnZSBzbyBzZXQgVk1fTUlYRURNQVAuCj4gICAgICAgICAgKi8KPiAtICAgICAgIHZtX2ZsYWdz
X3NldCh2bWEsIFZNX0RPTlRFWFBBTkQgfCBWTV9ET05UQ09QWSk7Cj4gKyAgICAgICB2bV9mbGFn
c19zZXQodm1hLCBWTV9NSVhFRE1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05UQ09QWSk7Cj4g
ICAgICAgICB2bWEtPnZtX29wcyA9ICZhcmVuYV92bV9vcHM7Cj4gICAgICAgICByZXR1cm4gMDsK
PiAgfQo+Cj4gLS0KPiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
