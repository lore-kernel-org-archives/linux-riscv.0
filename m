Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D18C982DE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKhLxAXZ1siV5lwX0uoyh/db1RSTwWu5fdxT7SGDRzc=; b=ZUNKib0D4kY7j1
	0RiKDxnO5UF7TFJGIGMbMoewB7cPgmG5h2R5VtyBIkvFfbZMMbWjEiR3jeU4vy8qzxPI5TBs4AyFM
	XkjsaM64J/o39HK1cQ0BwvaFD6xCWZ65YCCsq4C17WfdojfmIEAbR8gGGPfkRHoAvUMpyxQ/MZYJ7
	WFU0FSgcU5Rpwc8hBPBtWK3fV549Du27A38wDgApAywrWCLFSTv5flik5C3tVvg7v/q3A0Tjks+gH
	smkr6fX7FCAi68b7Pu3ZSlVi5Z0q978HAhFIXD1NlB5PCWngqCaG7ZHWqhOUqbRz2MFOVpwqfd1Nv
	Iyc3v5fK3KrGFOC0+Z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lha-0000000CsfW-1z1t;
	Thu, 17 Sep 2026 23:39:39 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6CoB-00000004Z8b-44E2
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 19:57:45 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e25400so1944905b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 12:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789415862; cv=none;
        d=google.com; s=arc-20260327;
        b=B4cpiqt4tT2/YoRL2LZLoV7V/iF04RpcEuPzXqaIzBOi5x0Aveo1IrgGUTWMNWg0b+
         x6dJkSvSCTWZChWtcME85BzU/CHp1w5MO8ik6t2gnm2Njqx30kmkc/AnV6ZZVttTBUFX
         Mpu9ew9raDB+lemKd8ChkRi9oE1PCZjRZr0KD8IAfbVRnrwy9uysyTEecmx4xpt+r/GM
         WkHDvBJtPw0qjeHccvZ71A8V4+yp3No+ClCYU09rF/NPa+Gjti49m+RtClpOFgkUMmIz
         X68qbiPLG+Gd0pG3d7a1p8Ltac2fk9TsDdpX5ereGH1SUXz25hsaZxXaCJSmfOxIcZ8o
         1AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        fh=FKed8dNTs6YcmRkU/oMHwphxjyYLLUhrhAOXwRLuQiQ=;
        b=iyR3scIQuqGjTMnZempolgDguC5RR6PE5hnHXqyRQq367KWNd/wBg/EcL+UzQ6LAGD
         X+11rrKjJ3dbooP/cP3AJHkerTWYiCoA0+0YOk1RkzFvmXmoCHAASYqEiWvEd/29wRXu
         ycAga7nHEwbaFCags9Jehg1ItAYFLKXVNPCMUcbrutJp6dZ61xrh23pGGU5eqZtUYnmn
         vnbm0EifljpNG8jDH8QubdMVTxCsjw5lWaOOMkXEjL6fUENWGKK59VhqjMCOIuBzhGNC
         W8Tn3S9AJKye29rWgi8UZneQjH8gW+BSqUka79vZDe7he6ojn7GHnPigBbjBmmr5XM2c
         4s+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789415862; x=1790020662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=Fu4vLPfdKiHe0zbMfDVKo+o6WDbjVb76jd0ktrD78/thJO+OyNOyVaZBudSLyTU2YU
         chuHupgO0Xf0h+euMSMYZY9WMIFrzyDRuHlUlzjW6g+VFt9ClZB7d2qy78qRKVuGwOcz
         z7EMvTc4L04Oqn6dnPIN/6ig4j+MrUMAPSUcBY1wpDhVpihRBPg1XABh9vxyfMbg1MwZ
         RIdVTwN3eeqUaWogYPCBkuMY66Xhn8w8CK5GT+9YM/+a0Y4XXGEoTrls+IeKVgejSJIA
         xQ7gm7GhPt5DCgGniXGLYaR3LQX1Ag8PCevwbMKiHga16TnkNvqObhyqAAcwcJMApSmc
         ypkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789415862; x=1790020662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEa5EIpxI31VfZhRCWTdUVuFxMmPcLfnD5/j1cH2Le4=;
        b=xp6K9Gk5AO86wZGq0EVzsSQ8olO2Wjm4YsT5kGRsZklE90cc74u30mgoJWOksWZsEa
         8gzoy99mADambzjhQpIE6BUJYym3hWhFH9SfEJxRCPomAPdlEdSp+IqC9K6Np4E3ytlR
         9kGNWgqhcNKehz37a/OoPsd0o2hi8K8kMFZGI9N/bXRF+Al5XLSUOkEY+HTZ3JUm8XNq
         VuO00Nm6Yx4Bi5ink4Ub2fk7MTXdCxzMfPfCcKB1KzZniBUL8P0tbUvYvdvOEuyRiLmz
         cECuDwy3ekgVx66YWjh9TP05TqWlRiUOK/b3koVyvR4ChRw44wNm7pd+N9kivaaZq+Zh
         OS8w==
X-Forwarded-Encrypted: i=1; AKwUvBwqwJeV7tR8WcI6VMI1FyS2AvMuQWWjPqgxZ45S9nyckG3MVQaLzrVB7s92Kp7gUrRuU6mlywzmNc22fw==@lists.infradead.org
X-Gm-Message-State: AFuF++mvHtupb5AVtaBkS7576z9UmXxtjfz42YOi8MjiN88brhMLTtwv
	cXuvDGmDpMgvIVlDzydxLDR/od1QIoXMqhHRhQ8wrOO8P50HudPW14FIccadhkGZbPjO185ePgD
	9lBvOKR0LCgL98eLhYdpt1urz45mbOpwPbqDeevdj
X-Gm-Gg: AYBFou3u9VDq7U21XLQcunHYetL0C+Ss1AlIgiEtyZiu2LA3W/Czx+xek0Iik3fAoYY
	cKXgtFjfUGhhW4zOXI5jcrQUrTrL+xvgGuE0PNSc0pjlEgGzg55YsG1wLoNqCLG4cnvhDjaTTjJ
	k2/bvavL0bdDbqdlSmXFbzV22tp96bZ+jN6QGB9oheLU3MNnTrWA6A5AaY9vzOdtuK2C/hZrVkO
	SopaIN2083J4ZRThWm4U6JrvTlc0ECLGpqfJQj1cLlqr+o1IS9fRi3B1GGtAPGqE5u7jWuFECXc
	Rty/qyewQrfjCckRQYdy6sV81joG9WsS3ecPnbdZczu+DRG/RCZb4pLktqlvk4WjLlHpDpd+o4q
	SSFfjAFINW6E=
X-Received: by 2002:a05:6a00:18a9:b0:858:b809:6ec0 with SMTP id
 d2e1a72fcca58-86f869a920dmr8896742b3a.23.1789415862342; Mon, 14 Sep 2026
 12:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
In-Reply-To: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-12-7d9781ed5361@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Sep 2026 15:57:29 -0400
X-Gm-Features: AcwNN1XaLRK0KaZAmfcRvdaBSkZOdh14LF1fb-xWULoFVhBfqyRklsdKoWBmLag
Message-ID: <CAHC9VhQ3TwdGGH6YtVyMqJX4avJwsadcRvRhAoUhCvJEHk=i=g@mail.gmail.com>
Subject: Re: [PATCH v2 12/40] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_125744_287525_3DBBA4DE 
X-CRM114-Status: GOOD (  17.32  )
X-Mailman-Approved-At: Thu, 17 Sep 2026 16:37:27 -0700
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MDXigK9BTSBMb3JlbnpvIFN0b2FrZXMgKEFSTSkg
PGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUg
bWV0aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+IHNlbGludXhfZmls
ZXNbXSksIHlldCBzZWxfb3Blbl9wb2xpY3koKSBwZXJmb3JtcyBubyBvcGVuIG1vZGUgY2hlY2ss
IHNvIGEKPiBDQVBfREFDX09WRVJSSURFIGNhbGxlciBjYW4gb3BlbiBpdCBPX1JEV1IuIFJlamVj
dCBGTU9ERV9XUklURSBhdCBvcGVuLCBhcwo+IGtlcm5mcyBkb2VzLgo+Cj4gVGhlIGZpbGUgY2Fu
IHRoZW4gbmV2ZXIgYmUgbWFwcGVkIHdpdGggRk1PREVfV1JJVEUsIHNvIGRvX21tYXAoKSBhbHdh
eXMKPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQX1NIQVJFRCBtYXBw
aW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+IGNoZWNrIGluIHNlbF9tbWFwX3BvbGljeSgpIGNhbm5v
dCBiZSByZWFjaGVkLiBSZW1vdmUgaXQuCj4KPiBUaGlzIGFsc28gc3RvcHMgc2VsX21tYXBfcG9s
aWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBtYXBwaW5nIHRoYXQgaXMKPiBuZWl0aGVy
IGEgUEZOIG1hcCBub3IgYSBtaXhlZCBtYXAsIGFoZWFkIG9mIHRoZSBjb3JlIGVuZm9yY2luZyB0
aGF0IG9ubHkKPiBzdWNoIG1hcHBpbmdzIG1heSBkbyBzby4KPgo+IEFja2VkLWJ5OiBTdGVwaGVu
IFNtYWxsZXkgPHN0ZXBoZW4uc21hbGxleS53b3JrQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTog
SmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIHNlY3VyaXR5L3NlbGludXgvc2Vs
aW51eGZzLmMgfCAxMSArKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1tb29y
ZS5jb20+CgotLSAKcGF1bC1tb29yZS5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
