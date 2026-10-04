Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E6CA600A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7sSmqGIC8jvswZrD+eDDVNkfyw0QHYTPGWYUXzDE6I=; b=2V+dek+izgcdio
	D+0Pl/IY7yXW5Xm3mAuMd039RcdMYBI3P6fNJnhVr0csq497K6HQ53WNVtuFY47OSpG+5KQ9gG40S
	Isqh3ywuMYS2q9Wo3n1lXsK3acR7rM2GR96Wc9CPPf+y3RFSTwDzXSZ/b5uQaU4wI1qj9zCWg+Tus
	Kwx+Y6SVUpL1hZ8W6YDm6UQ3H+XVJtDJyqk1gExwVKxVg9wrL8GdDTAGTSqX4suMiZ3hQKzQDWFDU
	c1A+eUuMnMgKoJnLaBBibNTClZijqNCX/feA03BNLgh80RPQMnhD/5En9SIOF+s63qVedypqExR79
	YV6lqmZJKsc1iUjWq25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpX-00000002rUK-26a9;
	Wed, 07 Oct 2026 17:53:27 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPmu-0000000F5LW-3Ge3
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:14:18 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5337c7b9937so258441cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134051; cv=none;
        d=google.com; s=arc-20260327;
        b=DZiJxhmIwZUghC0RjIWibl78z+4QHqWFL2QX46jDGnoNnL+TgYG7XcVq2NAv6XmZbb
         X2P+IwPwryomT+QHSzveL+CxAT/bsJh1ANh4NQgNafmie3GZPJI2vtG8KIUAOmj1QbNN
         i0QPN1Q4mkUH96BRH33Er4qbuy2MyGgVRyTTPNsMFNhhTbqUALkspCxIvUV6vFbpaC2x
         9ucWqTbxavCG+vmK8ROnVDEpxpbZXxQ9HSrjmTvndtw47cpwFPH1dlgGFVbq1JRpplN8
         XNj/jaOrcXQq4fPVjTUyuRqqpA+pqpWI9h6ymnhzkCl/tSxGCMPHIocrIQ0e7EPewuMf
         b/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        fh=Jb1umOlAsDRsVyFaEyq1RXXoNJrTh9hkE4qGJ9oOBEA=;
        b=BU4q8+34XeeHy7SBRjOLzSkVaXnzJqM6vtKicMxQLS5zhrlGvXyIstt5k6/OhfTG4Y
         LRFALZSIxhdFTbFHH7AgU+kCyB6gD73Gk1QEIZusvprMV1wdNch9BzetTc8hxpSZUeWw
         6HcZTdLenDCtc9X/QLWUVaYzMtm5aABSXM4/579komJr2JSQR/k2lEYEB7z/BgIm4jUY
         ADBHRRV9ykMo3w/2nwXV66mVLie5QGc2663B2ULBJcTybDbHZgZh46bj36NQWGsaUW3Z
         nAzm7keC9VWY5qZZskh+dOeyJfGasFlMAPe3uUmDN8wUnWRPzaecExqEJZjSNoZjTX/H
         u+Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134051; x=1791738851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        b=tm+0/2ClHtALvEioZYchE3otPa0NrAIG1TruSfSbCA2w5J7Zxdcr3kLKSpXxHDI+DU
         eccFLpK6Htz6QmfOcO7auJU57cmyGdQ3B4JvtAlLM9xOF+XcEAoSyQxKRCwWulzfd2oU
         u7qRB72lsn0bz50HidNjGLFWL7tHXO3QSuG43V01g3fYJvshhJMNZZncX4n8/1gK/2Mc
         icHSomDcnHjDmNZss5rf2dobT6oRQEcGwkfk8+HGZ4Gz9cwKjgEXQ/HL/R59L7tgg+ri
         dQZVcDfDRZZHsjKwWmi6v/8wezRhWLpsIDJutQp4l0JC67+MYWboxgHJiGcO9gHeDrf1
         Y/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134051; x=1791738851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oK+gurncHWXSmmPtPu9hgAMG8GgRdX+XUQo4lUX1RzQ=;
        b=oluvybL2ieI8XGtOenu1mtE34x3oWrS8vwTG193nz1QLqDljK/pv/hX7PyPxTXd2O9
         U066AoeuV8q91JW6aHEJw7S9Sd+nmVCl/z1QUEbBgjnwdcrdwXcsgACJBqp52bThdk+u
         L+xnjg78HfiOTdRuAV03g20cxl0FAhTPKUQH566a/b4Ob3s7BoLKJ1Rc8yWGKUKdRFwS
         5nzIQHCem0OKHhUi6Cs8HY73Wy5msYIL2UOQJM9sOtWoN7qJSAn5sqzsHxs2uXjpiepp
         A2LkW0FnKt1sMYtq2aLsYf/lhn/6zrvMAc/SmPrswFlHLe0twUuEl716bPYmUKpU7JJT
         uA8A==
X-Forwarded-Encrypted: i=1; AKwUvBxJlwLffpcbICNmBKZYsbp3wxWmk/zEG6j9j5iidI08wJYjURoJB4pVi8npoK4Y522QK+cPiQcJFpH7AQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nYyf6ZeZh5SqzGc70/V6RLhsMZHi6V4FZ7mA9eAha7EsiS6xh1
	HV4kp6yGrhzFzlHo8mq7vovKhsRjb9M4o2dkFruh1J/+CyZxK5f5FkaD3XBYmc0jnoZ6TtPldBs
	txyo4H2GOJx9c6cVhJhA1eS8Zk/FbPBoON62GOMm5
X-Gm-Gg: AYBFou0uPa14iChSUBPJ1z6YrU52vGrTIeT92gWn5yHa833vcbUCBj1ajrpZttO1TcX
	AxsIePz+nqjIKjsNcpvQiTXcNo1vUxXW8gYXbdGWkYhEhtIR8yhPA7A6waTwjzwjh+O9HJ2ACeA
	Bu8HEJM62CSzAEnsw4s7UH5zDQnhLz66ukFHpcLlq8l5fVCBCfo3NL9+VucMx/KYdRQ8cCcOrkS
	0gJWIz1wILq9lWgsL2e2p0xbfLvy6VQ9KvsmImERlYiLt39uRetc1Czz1IwEMxxgz9SxoFRjEgm
	S/Urxr1Jp/tLAhCRHPO+dwMbnVOkyveBLRKhU3/fB9DAQMMRppcsgNIC
X-Received: by 2002:ac8:574c:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-535131b2b85mr16314281cf.9.1791134050552; Sun, 04 Oct 2026
 10:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-8-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-8-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:13:59 -0700
X-Gm-Features: AclHuK_YbQsPp6UkU1wteVM53NVi6nuDg9G6v9WzIHWTTGIprDqvC1DHCMGs6A8
Message-ID: <CAJuCfpHPcgvpR+=CtNVJeFkTn4EkF=hSPH3ZvvpkZQqHS5kzug@mail.gmail.com>
Subject: Re: [PATCH v4 08/38] docs: filesystems: update mmap_prepare docs for
 discontig kernel pgs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101413_007796_81F3DAE6 
X-CRM114-Status: GOOD (  33.66  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM14oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBEZXNjcmliZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBk
aXNjb250aWd1b3VzIGtlcm5lbCBwYWdlIG1hcHBpbmcgbWVjaGFuaXNtLAo+IGRldGFpbGluZyBo
b3cgdG8gdXNlIGl0IHNlbnNpYmx5IGFuZCBob3cgdGhlIEFQSSBsb29rcy4KPgo+IEV4cGxpY2l0
bHkgZGV0YWlsIHRoZSB2YXJpb3VzIGRpc2NvbnRpZ3VvdXMgYWN0aW9ucyBhdmFpbGFibGUgYW5k
IGhvdyB0bwo+IHVzZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1
cmVuYkBnb29nbGUuY29tPgoKCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1h
cF9wcmVwYXJlLnJzdCB8IDgxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdCBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3Rl
bXMvbW1hcF9wcmVwYXJlLnJzdAo+IGluZGV4IDgyYzk5Yzk1YWQ4NS4uZGRiNDQzNGQ5MTlhIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAo+IEBAIC0x
NjQsNSArMTY0LDg2IEBAIHBvaW50ZXIuIFRoZXNlIGFyZToKPiAgICBzdWZmaWNpZW50IGVudHJp
ZXMgaW4gdGhlIHBhZ2UgYXJyYXkgdG8gY292ZXIgdGhlIGVudGlyZSByYW5nZSBvZiB0aGUKPiAg
ICBkZXNjcmliZWQgVk1BLgo+Cj4gKyogbW1hcF9hY3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxf
cGFnZXMoKSAtIE1hcHMgYSBkaXNjb250aWd1b3VzIHJhbmdlIG9mCj4gKyAgYHN0cnVjdCBwYWdl
YCBwb2ludGVycyBvdmVyIHRoZSBWTUEuIFRoZXkgbXVzdCBzcGFuIGZyb20gdGhlIHN0YXJ0IG9m
IHRoZSBWTUEsCj4gKyAgYnV0IG1heSB0ZXJtaW5hdGUgcHJpb3IgdG8gdGhlIGVuZCAobGVhdmlu
ZyB0aGUgcmVtYWluZGVyIHVubWFwcGVkKS4KPiArCj4gICoqTk9URToqKiBUaGUgYGBhY3Rpb25g
YCBmaWVsZCBzaG91bGQgbmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1bGF0ZWQgZGlyZWN0bHksCj4g
IHJhdGhlciB5b3Ugb3VnaHQgdG8gdXNlIG9uZSBvZiB0aGVzZSBoZWxwZXJzLgo+ICsKPiArRGlz
Y29udGlndW91cyBBY3Rpb25zCj4gKz09PT09PT09PT09PT09PT09PT09PQo+ICsKPiArU29tZSBh
Y3Rpb25zIGNhbiBiZSBwZXJmb3JtZWQgYWNyb3NzIGRpc2NvbnRpZ3VvdXMgcmFuZ2VzLgo+ICsK
PiArTWFwIGtlcm5lbCBwYWdlcwo+ICstLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtUbyBtYXAga2Vy
bmVsIHBhZ2VzIGRpc2NvbnRpZ3VvdXNseSwgeW91IG11c3QgcHJvdmlkZSBob29rcyB1c2luZyBg
YHN0cnVjdAo+ICtkaXNjb250aWdfa2VybmVsX3BhZ2Vfb3BzYGA6Cj4gKwo+ICsuLiBjb2RlLWJs
b2NrOjogQwo+ICsKPiArICAgIHN0cnVjdCBkaXNjb250aWdfa2VybmVsX3BhZ2Vfb3BzIHsKPiAr
ICAgICAgICBpbnQgKCppbml0KSh2b2lkICp2bV9wcml2YXRlX2RhdGEsIHZvaWQgKipwcml2YXRl
KTsKPiArICAgICAgICBpbnQgKCpnZXQpKHN0cnVjdCBkaXNjb250aWdfa2VybmVsX3BhZ2Vfc3Rh
dGUgKnN0YXRlKTsKPiArICAgIH07Cj4gKwo+ICtUaGUgYGBpbml0YGAgaG9vayBpcyBvcHRpb25h
bCBhbmQgYWxsb3dzIHN0YXRlIHRvIGJlIGVzdGFibGlzaGVkIGJlZm9yZSB0aGUKPiArb3BlcmF0
aW9uIHN0YXJ0cywgZm9yIGluc3RhbmNlIHRha2luZyBhIHJlZmVyZW5jZSBjb3VudC4gTm90aGlu
ZyBpcyBpbnZva2VkCj4gK2FmdGVyIHRoZSBvcGVyYXRpb24sIHNvIGBgaW5pdGBgIG11c3Qgbm90
IGxlYXZlIGxvY2tzIGhlbGQsIGFuZCBzdGF0ZSB0aGF0IG11c3QKPiArYmUgcmVsZWFzZWQgb25j
ZSB0aGUgbWFwcGluZyBnb2VzIGF3YXkgc2hvdWxkIGJlIHJlbGVhc2VkIGluCj4gK2Bgdm1fb3Bz
LT5jbG9zZWBgLgo+ICsKPiArVGhlIGBgaW5pdGBgIGhvb2ssIGlmIHByb3ZpZGVkLCBpcyBpbnZv
a2VkIHByaW9yIHRvIHRoZSBvcGVyYXRpb24gc3RhcnRpbmcuIEl0Cj4gK21heSB1cGRhdGUgd2hh
dCBpcyBwb2ludGVkIHRvIGJ5IGBgdm1fcHJpdmF0ZV9kYXRhYGAgYW5kL29yIGBgcHJpdmF0ZWBg
LiBJZiBhbgo+ICtlcnJvciBpcyByZXR1cm5lZCwgdGhlbiB0aGUgb3BlcmF0aW9uIGlzIGFib3J0
ZWQuIFRoZSBgYHByaXZhdGVgYCBmaWVsZCBjYW4gYmUKPiArcmVhc3NpZ25lZC4KPiArCj4gKyoq
Tk9URToqKiBUaGUgb3BlcmF0aW9uIG1heSBzbGVlcCBiZXR3ZWVuIGludm9jYXRpb25zIG9mIGBg
Z2V0YGAsIHNvIGxvY2tzCj4gK25lZWRlZCB0byBzdGFiaWxpc2Ugc3RhdGUgbXVzdCBiZSB0YWtl
biBhbmQgcmVsZWFzZWQgd2l0aGluIGVhY2ggaG9vay4KPiArCj4gK1RoZSBgYGdldGBgIGhhbmRs
ZXIgaXMgdGhlIGtleSBtZWFucyB0aHJvdWdoIHdoaWNoIHRoZSBvcGVyYXRpb24gaXMKPiArZXhl
Y3V0ZWQuIFRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSBvcGVyYXRpb24gaXMgcHJvdmlkZWQgdGhy
b3VnaCBgYHN0cnVjdAo+ICtkaXNjb250aWdfa2VybmVsX3BhZ2Vfc3RhdGVgYDoKPiArCj4gKy4u
IGNvZGUtYmxvY2s6OiBDCj4gKwo+ICsgICAgc3RydWN0IGRpc2NvbnRpZ19rZXJuZWxfcGFnZV9z
dGF0ZSB7Cj4gKyAgICAgICAgLyogTWFwIHN0YXRlLiAqLwo+ICsgICAgICAgIHVuc2lnbmVkIGxv
bmcgc3RhcnQ7ICAgICAgICAgICAgLyogU3RhcnQgYWRkcmVzcyBvZiBWTUEuICovCj4gKyAgICAg
ICAgdW5zaWduZWQgbG9uZyBlbmQ7ICAgICAgICAgICAgICAvKiBFbmQgYWRkcmVzcyBvZiBWTUEu
ICovCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOyAgICAgICAgICAgICAvKiBUaGUgY3Vy
cmVudCBhZGRyZXNzIHRvIGJlIG1hcHBlZC4gKi8KPiArICAgICAgICBwZ29mZl90IHBnb2ZmOyAg
ICAgICAgICAgICAgICAgIC8qIFRoZSBjdXJyZW50IHBnb2ZmIHRvIGJlIG1hcHBlZC4gKi8KPiAr
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzX21hcHBlZDsgIC8qIFRoZSBudW1iZXIgb2Yg
cGFnZXMgbWFwcGVkLiAqLwo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXNfcmVtYWlu
OyAgLyogVGhlIG51bWJlciBvZiBwYWdlcyByZW1haW5pbmcuICovCj4gKwo+ICsgICAgICAgIC8q
IFVzZXItZGVmaW5lZCBzdGF0ZS4gKi8KPiArICAgICAgICB2b2lkICp2bV9wcml2YXRlX2RhdGE7
ICAgICAgICAgIC8qIFZNQSBwcml2YXRlIGRhdGEuICovCj4gKyAgICAgICAgdm9pZCAqcHJpdmF0
ZTsgICAgICAgICAgICAgICAgICAvKiBNYXBwaW5nIHByaXZhdGUgZGF0YS4gKi8KPiArCj4gKyAg
ICAgICAgLyogVXNlcnMgc2hvdWxkIG5vdCB0b3VjaCB0aGVzZSwgdXNlIGRpc2NvbnRpZ19rZXJu
ZWxfbWFwXyooKSBoZWxwZXJzLiAqLwo+ICsgICAgICAgIC4uLiBpbnRlcm5hbCBmaWVsZHMgLi4u
Cj4gKyAgICB9Owo+ICsKPiArV2l0aCBgYHByaXZhdGVgYCBiZWluZyBhbiBhZGRpdGlvbmFsIHVz
ZXItY29udHJvbGxhYmxlIHN0YXRlIHZhcmlhYmxlLAo+ICtpbml0aWFsaXNlZCB2aWEgYGBtbWFw
X2FjdGlvbl9tYXBfZGlzY29udGlnX2tlcm5lbF9wYWdlcygpYGAsIGFuZAo+ICtgYHZtX3ByaXZh
dGVfZGF0YWBgIGJlaW5nIGVxdWFsIHRvIHRoZSBgYGRlc2MtPnByaXZhdGVfZGF0YWBgIGZpZWxk
IHNldCBpbgo+ICt0aGUgYGBtbWFwX3ByZXBhcmUoKWBgIGhvb2suCj4gKwo+ICtJbiB0aGUgYGBn
ZXRgYCBob29rLCB0aGUgdXNlciBtdXN0IGNob29zZSBob3cgdG8gbWFwIGtlcm5lbCBwYWdlczoK
PiArCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9hYm9ydCgpYGAgLSBDYWxsIHRoaXMgdG8g
YWJvcnQgdGhlIG9wZXJhdGlvbiwgd2hhdGV2ZXIKPiArICBoYXMgYmVlbiBtYXBwZWQgc28gZmFy
IHdpbGwgYmUgcmV0YWluZWQsIHRoZSByZXN0IG9mIHRoZSBtYXBwaW5nIHdpbGwgU0lHQlVTCj4g
KyAgaWYgYWNjZXNzZWQuCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9wYWdlKClgYCAtIE1h
cHMgYSBzaW5nbGUgcGFnZSwgY29ycmVjdGx5IGhhbmRsaW5nCj4gKyAgY29tcG91bmQgcGFnZXMg
KGlmIHRoZSBjb21wb3VuZCBwYWdlIGlzIGJpZ2dlciB0aGFuIHRoZSByZW1haW5pbmcgcGFnZXMg
aW4gdGhlCj4gKyAgVk1BLCB0aGVuIG9ubHkgdGhvc2UgcGFnZXMgdGhhdCBmaXQgd2lsbCBiZSBt
YXBwZWQpLiBGb3IgYSBjb21wb3VuZCBwYWdlLCB0aGUKPiArICBoZWFkIHBhZ2UgbXVzdCBiZSBw
YXNzZWQuCj4gKyogYGBkaXNjb250aWdfa2VybmVsX21hcF9wYWdlX3JhbmdlKClgYCAtIE1hcCBh
biBhcnJheSBvZiBwYWdlcyBvZiBhIHNwZWNpZmllZAo+ICsgIHNpemUuIEFzIHdpdGggYSBjb21w
b3VuZCBwYWdlLCBpZiBtb3JlIHBhZ2VzIGFyZSBzcGVjaWZpZWQgdGhhbiByZW1haW4gaW4KPiAr
ICB0aGUgVk1BIHRoZW4gb25seSB0aG9zZSB0aGF0IGZpdCB3aWxsIGJlIG1hcHBlZC4KPiArCj4g
K0lmIGFuIGVycm9yIGFyaXNlcyBhZnRlciBgYGluaXRgYCBzdWNjZWVkZWQsIHRoZSBjb3JlIHVu
bWFwcyB0aGUgVk1BLCBpbnZva2luZwo+ICtgYHZtX29wcy0+Y2xvc2VgYCBpZiBzZXQsIHdoaWNo
IGlzIHRoZXJlZm9yZSB0aGUgcGxhY2UgdG8gcmVsZWFzZSBhbnkgc3RhdGUKPiArdGhhdCBgYGlu
aXRgYCBlc3RhYmxpc2hlZC4KPgo+IC0tCj4gMi41NS4wCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
