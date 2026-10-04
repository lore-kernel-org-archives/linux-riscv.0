Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5CDCA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7VOQ2gnTvyrx2XSDHWaw6Rex6B2AxHot9F91Hk+fCk=; b=eHquYdyjexJWtT
	oODiR6D1CC02Mqz5F5Q78mAonvEAkE6Sf9FATkvtMrSPgaB7juzBFB0Rh4m+CD531z/puTJ+x31Du
	HolcXEpirasB0npSUrrP7l0kfL+HdKbrWxOxnmUqaYHN6P4EGnovEztUa4PL4NkT/rXeHDQC6oe+4
	XHw5JbGNBifMFUiuY9xxLPI/pqAc/E+8RsedbBzxN7pK54rAN1otVUVsmMmk6RgrNvrXKbgaBe59E
	vptd57Gw/sCCzsBPt52eVzIemBp8xHLcqYdzxg4aF47VZupWINsP5+56JgRO4goyQaTtdl91YBwtj
	hZlAHku+6f/w1IgxuAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpZ-00000002rcO-1odI;
	Wed, 07 Oct 2026 17:53:29 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPr2-0000000F6Jn-3QrM
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:18:33 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-533202fe429so245631cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134307; cv=none;
        d=google.com; s=arc-20260327;
        b=gpERAyFFg8Ma6Ekx9BHSOwBExLkWZ2rvChHl6YyY7skr+SWAnxNxCmr0uZ7sV58WQi
         o30+dZVXx+LSNdwN/n4vlSdnk4OonNwnrVg+qzTb7bPRRA7lluGJrTK/xGfgGxI/PuSn
         pGLuv1kk0YX+Qc7dG2kyCazfEJbQ64DA50sQ4BMS75cUBoR3eXKhGb9xnbSJH3aO0B2c
         IG0rMQKyQGEdvNDn5oGVYVYAxkO+mbcK8RvZQB25qeJdO9KqD4tVvtA2oPV1xv3gNjmk
         t17C9Zd7vPU9uNplM1axH6Lqni+oicd93Q6gu2GrQpZLt10if03mjiWYUtc9n24NRGFH
         fF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        fh=SE+FUYcYoG7cD/kkEXKF+W2c+CwDRRGyrnAyC2czsgo=;
        b=SmasaNMQ1q9Qdkh7r1V9yFynmNqvr0jVE6qPebrkdI2d5xA0nFZqs6cPxRo5bGouK9
         H3j0PQLdGovPEWsvTUCpYXQAB2K4khZZYK9qc/Dr+HHaGZhHWmaGb5nirwRvlIWc9q/L
         78pyiGzu93LeXkc+c1uU+aI4673xMMKrX5PBHnKJ4ZswfJG6qlyptAsybSKfMdcKy77r
         3lYzcmn7SGl3thk/HJxG/okgp4M7acRXJkA9lAktlTgRz//4HtkNeLhRWfEdA8wCM7TZ
         YbeYJiWU3PFFc19/oQuMz7KFTLj/LYKVhkSMqWzmgcnXeBCUu/XmlFmH2So4XwOdkHEg
         gySA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134307; x=1791739107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        b=Q3+1Og44FLof4FmExrsIwRHg9zZZxb3/LMjk3RjbD2BCQwvVYxopkq7aTClzgCjMcI
         RuIzEJmBIcvzMfgvRvIXZWcbi8NBCz53I8UL9l8Zt6wft6MbaRqJcPXlJFdWexmQk25A
         nmA6z0IiyCPpYf2p09v2qCKExQKHEEOC+vwr+uhvcwctVdgbJQ8oAArUq0mT+E+pB2Bf
         31xU/6UPuO/H+I3E6MazSyPjUN42NRTcBH4wfCOUlnaGEocMe+5HUSKGLm4pMJESRsEL
         XIhN0XpqPaU1dDeDiPPlWuu3Mm8E5F0ZFURJ6o+7tIM2DBLjvWvvA32gtXw4ZcbchViK
         b3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134307; x=1791739107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QinBTGgc4+2Xq3VgxIpbr+CWC5UMzdARKszuxAv87KA=;
        b=gK9yJHoWbi7WtRSWG0+DxIrfvJpZET0+R3M7Q0eBeNTetxn+FmOc7++OJN46W3oY4a
         3jtgdfaimRXpgEiHTUoe11mPHODyA+Rx9YQvTf95xfkGQuZ190mnO3hwbg/V+1jEYWK6
         DzPvjpXvEnWZW9xU851xq5NwE/3Qq3EK2+l0RHH6E9TjK63DUh7pP3+ecCgfOK6BvBrt
         Y6jJeczzmpGsfhcScYTJG+7cEYPgtVaUPAaQGflW6dSRb/+StD5mE0hINZM+Enc5+VqV
         7CbDDpgSY050F7za3gYMtvhNuwSUtFRA6fBAOwKXDJWlK0LBWpfKqU+wtd3zcp3iP16+
         x+wA==
X-Forwarded-Encrypted: i=1; AKwUvBzalOv31qV4bP9dj09a7+i5LE7n+MHew5uZwhE4MGWktZHH14Ya0a6KFrm19IEXwRyK2NP73QUTuCVr5A==@lists.infradead.org
X-Gm-Message-State: AFuF++n4P37dTOgrMilXNh3BuDtOsuM81xwZU/GWl6QmecHyP3B24BKi
	y19dKOsbMoqc7LxE92wAcKqyrjJtkmQR5Oda8lqp0UBAmFJBCW+kYSUZ7y9efj51wz4R5++QaRS
	kdfA+tGBB92460jTOUOFwHHFW4VkPfHsYA1utTniN
X-Gm-Gg: AYBFou31RUmchhEgAhsjfIoIgwWeAHCa6sWQZ35kroZKjgs1cyk7c7Lzps8HysR9hiC
	NRbg9nOQ7SrrglZkVjr/rUgUkua4A3EFQxa4FGn6WwiYPochZ9uLy27LBC4dsqNnHVD+8Axw+/W
	OTt0qEXye5b/GVF8KPKq1uo7sif3uKDz2N81gm+gOWsdFgp2HjJQDrQvc8tO7B5Ee0Trnec1H+E
	idnMCNlzc84taWgzfEcy/TwuG/v4XVxMesA+nc+RgYakZKUfUhBe18j3yyVNgf+1F395y58Oy/t
	NQXQAdlLcCkPXO/VDzr6BP3EGnwMjp6DmL0M/TFlSPII7UcNt7hT8vwG
X-Received: by 2002:a05:622a:1b91:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-535146ce3e1mr16649101cf.4.1791134306600; Sun, 04 Oct 2026
 10:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-9-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-9-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:18:15 -0700
X-Gm-Features: AclHuK_AcqqolMBhSGAldWSHQHOOTkitmvHnvL2po1Vgiun02DenXRmiOZ3VQUs
Message-ID: <CAJuCfpFkfK4gvBPVoSiSdKs_3LR-0-dw_08BVxs-NqCvQK0-Mg@mail.gmail.com>
Subject: Re: [PATCH v4 09/38] drivers/usb/mon: update to use mmap_prepare +
 map kernel pages
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101830_370964_63C5ECC0 
X-CRM114-Status: GOOD (  34.60  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM24oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBSZXBsYWNlIHRoZSBkZXByZWNhdGVkIC5tbWFwIGhv
b2sgd2l0aCBpdHMgcmVwbGFjZW1lbnQgLm1tYXBfcHJlcGFyZS4gQXMKPiBwYXJ0IG9mIHRoaXMg
Y2hhbmdlLCBhZGRpdGlvbmFsbHkgdGFrZSB0aGUgYXBwcm9hY2ggb2YgbWFwcGluZyBwYWdlcyB1
cG9uCj4gbW1hcCByYXRoZXIgdGhhbiBwcm92aWRpbmcgYSBmYXVsdCBoYW5kbGVyLgo+Cj4gVGhl
IHBhZ2Ugc3BhbiBjYW5ub3QgYmUgbXV0YXRlZCB3aGVuIGFuIG1tYXAgbWFwcGluZyBpcyBpbiBw
bGFjZSwgc28gdGhpcwo+IGlzIHNhZmUgdG8gZG8gaW4gYWR2YW5jZSAodGhlIE1PTl9JT0NUX1JJ
TkdfU0laRSBpb2N0bCBvcGVyYXRpb24gZXhpdHMKPiAtRUJVU1kgaWYgaXQncyBhdHRlbXB0ZWQs
IGdhdGVkIGJ5IHRoZSBycC0+bW1hcF9hY3RpdmUgcmVmZXJlbmNlIGNvdW50KS4KPgo+IFV0aWxp
c2UgdGhlIG5ld2x5IGludHJvZHVjZWQgbW1hcF9hY3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxf
cGFnZXMoKSB0byBkbwo+IHRoaXMsIHdoaWNoIGFsbG93cyBmb3IgaXRlcmF0aW9uIG92ZXIgcGFn
ZXMgaW4gbW9uX2Jpbl9kaXNjb250aWdfZ2V0KCkuCj4KPiBtb25fYmluX2Rpc2NvbnRpZ19pbml0
KCkgaW5jcmVtZW50cyB0aGUgcnAtPm1tYXBfYWN0aXZlIHJlZmVyZW5jZSBjb3VudCB0bwo+IHN0
YWJpbGlzZSBwYWdlIHNwYW5zLiBTaG91bGQgYW4gZXJyb3IgYXJpc2UgdGhlIGNvcmUgdW5tYXBz
IHRoZSBWTUEgYW5kCj4gbW9uX2Jpbl92bWFfY2xvc2UoKSBkcm9wcyB0aGUgcmVmZXJlbmNlIGFn
YWluLgo+Cj4gVGhlIHZtX29wcy0+Y2xvc2UgaG9vayBpbXBsZW1lbnRlZCBpbiBtb25fYmluX3Zt
YV9jbG9zZSgpIHdpbGwgZW5zdXJlCj4gY29ycmVjdCByZWZlcmVuY2UgY291bnQgYXJpdGhtZXRp
YyB1cG9uIHVubWFwICh3aXRoIG1vbl9iaW5fdm1hX29wZW4oKQo+IGFjY291bnRpbmcgZm9yIHNw
bGl0dGluZykuCj4KPiBUaGUgZXhpc3Rpbmcgc2VtYW50aWNzIGFyZSBhbGwgcmV0YWluZWQsIGlu
Y2x1ZGluZyBub3QgbWFwcGluZyBwYXN0IHRoZQo+IHJhbmdlIG9mIGF2YWlsYWJsZSBwYWdlcywg
d2l0aCBhIFNJR0JVUyBiZWluZyByYWlzZWQgaW4gYSB1c2VybGFuZCBwcm9jZXNzCj4gdGhhdCBh
dHRlbXB0cyB0byBhY2Nlc3MgcGFzdCB0aGlzIHBvaW50Lgo+Cj4gVWx0aW1hdGVseSBpbnNlcnRf
cGFnZSgpIGlzIGludm9rZWQgdG8gaW5zZXJ0IGVhY2ggcGFnZSwgd2hpY2ggaW5jcmVtZW50cwo+
IHRoZSByZWZlcmVuY2UgY291bnQgb24gZWFjaCBtYXBwZWQgcGFnZS4gVGhpcyBtaW1pY3Mgd2hh
dCB3YXMgYmVpbmcgZG9uZQo+IHByZXZpb3VzbHksIG9ubHkgd2UgcHJlLW1hcCB0aGUgZW50aXJl
IHJhbmdlIHJhdGhlciB0aGFuIGRvaW5nIHNvIG9uCj4gZGVtYW5kLgo+Cj4gVGhlIGV4aXN0aW5n
IGZhdWx0IGhhbmRsZXIgZGlkIG5vdGhpbmcgdGhhdCByZXF1aXJlZCBkZW1hbmQgcGFnaW5nLCBh
bmQgd2FzCj4gcHJlc3VtYWJseSBpbXBsZW1lbnRlZCB0aGlzIHdheSBmb3IgaGlzdG9yaWNhbCBy
ZWFzb25zLgo+Cj4gT25lIGJlaGF2aW91cmFsIGRpZmZlcmVuY2U6IHBhZ2VzIGFyZSBubyBsb25n
ZXIgZmF1bHRlZCBpbiBvbiBkZW1hbmQsIHNvIGEKPiBwYWdlIGRpc2NhcmRlZCB3aXRoIE1BRFZf
RE9OVE5FRUQgaXMgbm90IHJlcG9wdWxhdGVkIGFuZCBhIHN1YnNlcXVlbnQKPiBhY2Nlc3MgcmFp
c2VzIFNJR0JVUywgYXMgd2l0aCBvdGhlciBwcmUtcG9wdWxhdGVkIGtlcm5lbCBtYXBwaW5ncy4K
Pgo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5v
cmc+CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4K
Cgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9tb24vbW9uX2Jpbi5jIHwgODIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L21vbi9tb25fYmluLmMgYi9kcml2ZXJzL3VzYi9tb24vbW9uX2Jpbi5jCj4gaW5kZXggNjg3ZjZh
ODk4MWYzLi45ZDAwYjIxYTgxNTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91c2IvbW9uL21vbl9i
aW4uYwo+ICsrKyBiL2RyaXZlcnMvdXNiL21vbi9tb25fYmluLmMKPiBAQCAtMTIxOSw2ICsxMjE5
LDE1IEBAIG1vbl9iaW5fcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBvbGxfdGFibGVf
c3RydWN0ICp3YWl0KQo+ICAgICAgICAgcmV0dXJuIG1hc2s7Cj4gIH0KPgo+ICtzdGF0aWMgdm9p
ZCBfX21vbl9iaW5fdm1hX29wZW4oc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCkKPiArewo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2
ZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgcnAtPm1tYXBfYWN0aXZlKys7Cj4gKyAg
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFncyk7Cj4gK30KPiAr
Cj4gIC8qCj4gICAqIG9wZW4gYW5kIGNsb3NlOiBqdXN0IGtlZXAgdHJhY2sgb2YgaG93IG1hbnkg
dGltZXMgdGhlIGRldmljZSBpcwo+ICAgKiBtYXBwZWQsIHRvIHVzZSB0aGUgcHJvcGVyIG1lbW9y
eSBhbGxvY2F0aW9uIGZ1bmN0aW9uLgo+IEBAIC0xMjI2LDY0ICsxMjM1LDc5IEBAIG1vbl9iaW5f
cG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBvbGxfdGFibGVfc3RydWN0ICp3YWl0KQo+
ICBzdGF0aWMgdm9pZCBtb25fYmluX3ZtYV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwID0gdm1hLT52bV9wcml2
YXRlX2RhdGE7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4gLSAgICAgICBzcGlu
X2xvY2tfaXJxc2F2ZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+IC0gICAgICAgcnAtPm1tYXBfYWN0
aXZlKys7Cj4gLSAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFn
cyk7Cj4gKyAgICAgICBfX21vbl9iaW5fdm1hX29wZW4ocnApOwo+ICB9Cj4KPiAtc3RhdGljIHZv
aWQgbW9uX2Jpbl92bWFfY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3N0YXRp
YyB2b2lkIF9fbW9uX2Jpbl92bWFfY2xvc2Uoc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCkKPiAg
ewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPgo+IC0gICAgICAgc3RydWN0IG1vbl9y
ZWFkZXJfYmluICpycCA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICAgICAgICAgc3Bpbl9sb2Nr
X2lycXNhdmUoJnJwLT5iX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJwLT5tbWFwX2FjdGl2ZS0t
Owo+ICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcnAtPmJfbG9jaywgZmxhZ3MpOwo+
ICB9Cj4KPiAtLyoKPiAtICogTWFwIHJpbmcgcGFnZXMgdG8gdXNlciBzcGFjZS4KPiAtICovCj4g
LXN0YXRpYyB2bV9mYXVsdF90IG1vbl9iaW5fdm1hX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1m
KQo+ICtzdGF0aWMgdm9pZCBtb25fYmluX3ZtYV9jbG9zZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKPiAgewo+IC0gICAgICAgc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCA9IHZtZi0+dm1h
LT52bV9wcml2YXRlX2RhdGE7Cj4gKyAgICAgICBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwID0g
dm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gKwo+ICsgICAgICAgX19tb25fYmluX3ZtYV9jbG9zZShy
cCk7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qg
bW9uX2Jpbl92bV9vcHMgPSB7Cj4gKyAgICAgICAub3BlbiA9ICAgICBtb25fYmluX3ZtYV9vcGVu
LAo+ICsgICAgICAgLmNsb3NlID0gICAgbW9uX2Jpbl92bWFfY2xvc2UsCj4gK307Cj4gKwo+ICtz
dGF0aWMgaW50IG1vbl9iaW5fZGlzY29udGlnX2luaXQodm9pZCAqdm1fcHJpdmF0ZV9kYXRhLCB2
b2lkICoqcHJpdmF0ZSkKPiArewo+ICsgICAgICAgc3RydWN0IG1vbl9yZWFkZXJfYmluICpycCA9
IHZtX3ByaXZhdGVfZGF0YTsKPiArCj4gKyAgICAgICAvKiBEcm9wcGVkIGJ5IG1vbl9iaW5fdm1h
X2Nsb3NlKCkgb24gdW5tYXAsIGluY2x1ZGluZyBvbiBlcnJvci4gKi8KPiArICAgICAgIF9fbW9u
X2Jpbl92bWFfb3BlbihycCk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBtb25fYmluX2Rpc2NvbnRpZ19nZXQoc3RydWN0IGRpc2NvbnRpZ19rZXJuZWxfcGFnZV9z
dGF0ZSAqc3RhdGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtb25fcmVhZGVyX2JpbiAqcnAgPSBz
dGF0ZS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQsIGNo
dW5rX2lkeDsKPiAtICAgICAgIHN0cnVjdCBwYWdlICpwYWdlcHRyOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPgo+ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnJwLT5iX2xvY2ss
IGZsYWdzKTsKPiAtICAgICAgIG9mZnNldCA9IHZtZi0+cGdvZmYgPDwgUEFHRV9TSElGVDsKPiAr
Cj4gKyAgICAgICBvZmZzZXQgPSBzdGF0ZS0+cGdvZmYgPDwgUEFHRV9TSElGVDsKPiAgICAgICAg
IGlmIChvZmZzZXQgPj0gcnAtPmJfc2l6ZSkgewo+ICAgICAgICAgICAgICAgICBzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZycC0+Yl9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICAgICAgICAgIHJldHVy
biBWTV9GQVVMVF9TSUdCVVM7Cj4gKyAgICAgICAgICAgICAgIGRpc2NvbnRpZ19rZXJuZWxfbWFw
X2Fib3J0KHN0YXRlKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4g
ICAgICAgICBjaHVua19pZHggPSBvZmZzZXQgLyBDSFVOS19TSVpFOwo+IC0gICAgICAgcGFnZXB0
ciA9IHJwLT5iX3ZlY1tjaHVua19pZHhdLnBnOwo+IC0gICAgICAgZ2V0X3BhZ2UocGFnZXB0cik7
Cj4gLSAgICAgICB2bWYtPnBhZ2UgPSBwYWdlcHRyOwo+ICsgICAgICAgZGlzY29udGlnX2tlcm5l
bF9tYXBfcGFnZShzdGF0ZSwgcnAtPmJfdmVjW2NodW5rX2lkeF0ucGcpOwo+ICsKPiAgICAgICAg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJwLT5iX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJl
dHVybiAwOwo+ICB9Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVj
dCBtb25fYmluX3ZtX29wcyA9IHsKPiAtICAgICAgIC5vcGVuID0gICAgIG1vbl9iaW5fdm1hX29w
ZW4sCj4gLSAgICAgICAuY2xvc2UgPSAgICBtb25fYmluX3ZtYV9jbG9zZSwKPiAtICAgICAgIC5m
YXVsdCA9ICAgIG1vbl9iaW5fdm1hX2ZhdWx0LAo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRpc2Nv
bnRpZ19rZXJuZWxfcGFnZV9vcHMgbW9uX2Rpc2NvbnRpZ19vcHMgPSB7Cj4gKyAgICAgICAuaW5p
dCA9IG1vbl9iaW5fZGlzY29udGlnX2luaXQsCj4gKyAgICAgICAuZ2V0ID0gbW9uX2Jpbl9kaXNj
b250aWdfZ2V0LAo+ICB9Owo+Cj4gLXN0YXRpYyBpbnQgbW9uX2Jpbl9tbWFwKHN0cnVjdCBmaWxl
ICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc3RhdGljIGludCBtb25fYmlu
X21tYXBfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4gLSAgICAgICAv
KiBkb24ndCBkbyBhbnl0aGluZyBoZXJlOiAiZmF1bHQiIHdpbGwgc2V0IHVwIHBhZ2UgdGFibGUg
ZW50cmllcyAqLwo+IC0gICAgICAgdm1hLT52bV9vcHMgPSAmbW9uX2Jpbl92bV9vcHM7Cj4gKyAg
ICAgICBjb25zdCBzdHJ1Y3QgZmlsZSAqZmlscCA9IGRlc2MtPmZpbGU7Cj4KPiAtICAgICAgIGlm
ICh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpCj4gKyAgICAgICBpZiAodm1hX2Rlc2NfdGVzdChk
ZXNjLCBWTUFfV1JJVEVfQklUKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPgo+
IC0gICAgICAgdm1fZmxhZ3NfbW9kKHZtYSwgVk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QLCBW
TV9NQVlXUklURSk7Cj4gLSAgICAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IGZpbHAtPnByaXZh
dGVfZGF0YTsKPiAtICAgICAgIG1vbl9iaW5fdm1hX29wZW4odm1hKTsKPiArICAgICAgIGRlc2Mt
PnZtX29wcyA9ICZtb25fYmluX3ZtX29wczsKPiArICAgICAgIHZtYV9kZXNjX2NsZWFyX2ZsYWdz
KGRlc2MsIFZNQV9NQVlXUklURV9CSVQpOwo+ICsgICAgICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRl
c2MsIFZNQV9ET05URVhQQU5EX0JJVCwgVk1BX0RPTlREVU1QX0JJVCk7Cj4gKyAgICAgICBkZXNj
LT5wcml2YXRlX2RhdGEgPSBmaWxwLT5wcml2YXRlX2RhdGE7Cj4gKwo+ICsgICAgICAgbW1hcF9h
Y3Rpb25fbWFwX2Rpc2NvbnRpZ19rZXJuZWxfcGFnZXMoZGVzYywgTlVMTCwgJm1vbl9kaXNjb250
aWdfb3BzKTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtMTI5OCw3ICsxMzIyLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbW9uX2ZvcHNfYmluYXJ5ID0g
ewo+ICAgICAgICAgLmNvbXBhdF9pb2N0bCA9IG1vbl9iaW5fY29tcGF0X2lvY3RsLAo+ICAjZW5k
aWYKPiAgICAgICAgIC5yZWxlYXNlID0gICAgICBtb25fYmluX3JlbGVhc2UsCj4gLSAgICAgICAu
bW1hcCA9ICAgICAgICAgbW9uX2Jpbl9tbWFwLAo+ICsgICAgICAgLm1tYXBfcHJlcGFyZSA9IG1v
bl9iaW5fbW1hcF9wcmVwYXJlLAo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQgbW9uX2Jpbl93YWl0X2V2
ZW50KHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgbW9uX3JlYWRlcl9iaW4gKnJwKQo+Cj4gLS0K
PiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
