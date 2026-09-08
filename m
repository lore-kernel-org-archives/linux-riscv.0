Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38377C982DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D90z4WojukoBDFqaFnffjkQqlRbK7kNALnWxGihQ06Y=; b=GpSHAPSlAtr02w
	I/S6vShXSR3oGvxMevHroOkN7zP80+OKW9LwADmpXxhdcTu+6MScrXATuJRhaqyjIgD4RTSjpxkj1
	Tiy/0vLZxhCzCS0ENcTBxf34JkYNDba0TxAR2jj/Pyamjdc7ldD1u+uWfkX6OtctrcCCtOnKbF/k/
	2lrFMpJ9BYDia0h8uHEDpQUoiNZ+4aRvPtKviuSXsQxBFAcCUzwzvrcH9yyJQSDuZwozzOe5mbbmm
	wyQ3uLyzjyt4Nbkz0myBGNrqWaN/I2YNk8JPQCA8hv0TIIQ9xLRP7bTEvwwH609ELq78QZv+OC/Y6
	K/plcy7sYNe0dgD6Z9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lfu-0000000CoDV-3CUQ;
	Thu, 17 Sep 2026 23:37:54 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42LN-0000000ABJH-0Zdo
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 20:23:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d6ff3aca07so1665ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 13:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788898979; cv=none;
        d=google.com; s=arc-20260327;
        b=CyngU/hTKfA3uInG+PV+iQpOwl1rAQ6ZEBzXJb9C6GTctGAUP7Tv4/f8I01XBk7YaI
         eTz3W21t1HkL+nbYarTSyQDddMEn3Ht+RtNFWLJGdaJEaIqK3iVxhM3UeOg1+FX2GDNA
         pNaq5OJs09X/pemaWnp79UBZTBLEhJxZQbsw6vrIbm32mVt7lY9j7zQH3EqRbSrb7yJD
         z3LKeum+iDm0wiQBd7HZ4XBnVkvFXCbxUaWyR55f4gWaVkd0GA7sKxEWJZi6fcnIJ85Q
         wjW0hogI5/Y+iOMyVJnwGdh6bKVWtN1E7VM4folr/jREX9PVpwdkz1xUGF2diyIsP2ts
         Rb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        fh=t0ZGUPNMStjEP2bpWQww5WBhZP1mvgS/KcB5z/Q6LOU=;
        b=R5N0eGYB3RrYBhvAsNPs85z0FttxznRuRckyFq+cnLLmOLMjL7wGw870frOiB8iqpl
         kJfNxhVbjdnYb8qkqbPx6E/O1oPJrUidNMNn4exNKPa7f9c4XL179H/UNNtJp+c1tEn8
         ZoyD4cJ2CvPGTFShDZjKRBQ0eSe3AGPl7xp0NV3UfgQzKuIQ3cqWlV9cKDLLBsnMZdAV
         IvppMGQrUQdNZ0ttK9RCmPIsaRtAtxoFmfEMPA2T2Tel+qGMUSaHra3gxxS4x2wtO6mW
         iEJPivSNq4wXXTixwrGSmvRKuzvsfgpamltn7fGfKgwCXj6npKleh59ZH+cUwV2y7amc
         qYDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788898979; x=1789503779; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        b=s+oEcczgVfDmm86tUTRa+2ydTHwaLFIqGrBKvImVCcrZpNJzlVnAW1rul0x4Mz97k3
         bfPBrT4Vw98bJZj3JDCOtxqhpkbZArkmGRF3l48DoD6VRsq9niR+5LfRCPGozcU09NMz
         zrUEUOj2kyodFv6TLJWzDagUg+S2u0U4sBUGdlnYkbb+mpETSqWJNyB1Wlo/3OO4N87p
         5KG0iJos/cFNqwt+mkNTeu5G9eFR5+Ll0UyZD7Y5sPpCxXjCCt9PpD5ykYhjbHUlDh4I
         s4AF8sk716LNh/idxQDarByCWaJhqbK0swmAhLDRcLScHMQsOVyEyua1LZRhZUCTjwIf
         Kyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898979; x=1789503779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        b=DeUuwpCeikuJms6Y3PIzH0zF+v2fFlNeBB7Q0turntDcbcVTR8ROpgoCraFSuGLMZm
         dvci0jE0EfOUlTGVX4Q6HLJ7bV2UqkZa4d6OIzWQyzdZCxTJHdo0EulcYX3LLy8m2kS0
         WizawAIwdoByrW1Y1mm/KOW9ztFkjQUg/KJycvRYVHwdhLg3PkyAVoUa42y1HJ8tJasd
         VGUa84O4fE7Rlirvp6r65L4ZoozNEp05aKXaw9iWSJG4x2rXo9NEDKbCbMdbMmGhU7jG
         evrP0STm95Eo9Zr78anTDObR5vK5f8FRa2PlbfDU1Yqg2YBKabD768ddGlHjJvu+wKyF
         X9TA==
X-Forwarded-Encrypted: i=1; AKwUvBw2/4ug67LxLAhSwFqdM5Ev8q+c764OviuyDE2mwF6yahMfOVHv/fHdOG+QtaTBrHr3cFzXXrLVZTjOmw==@lists.infradead.org
X-Gm-Message-State: AFuF++nzuTvoA7P+19qrX2/qwN4x/rYLyMU8JMsWyf1gRDpOzf5F/xJQ
	NceI3m5i7ZgrpQASebkkAXSIjbYglSBfgDIG4cnNz9JqDemvXpoEr3UjClPuLxMFJ9+Hn+FKIMO
	kz7Sqnvv09b6SHF+LyhdkuxMvVcOEyv5llu5G2q4V
X-Gm-Gg: AYBFou0ZI0c/12vl8Czpj4N8LeaNrKwK68FRCBuasFstiNIk1C293HG7C75dhaa2aQW
	vE8SW06g1l4r3K11Z+zvXbt0f4fctIi5u4hWNL5fHNM9KFkZ0koL/d1uI6kSPIOHMKZOXWnvaZ8
	OKUe0rOKcnIQsKL4DMHr7jzPvPd7fl1GrgZ0K4M++osTp/J2ZbY4SQhMD4bhCjbzJIYKiJalTBC
	d6smG+gIaSXFxdtyHlaHqiQ8/UB4S0XXm6FCfBQUqa+IgroFXAZli/U2odQkJdXXiaSvENhxVL0
	z3zjnlRYp0/3qM0ecn5s1+oGMKwd66gbAVymuyYd15SfLtiBrKX+QlmllgPYKscVm++uEpPEv1R
	QmR3Wfrl4NyH3RBW0Gb9v1e/iIb/Q9jeV
X-Received: by 2002:a17:903:fa4:b0:2d1:1d3d:97c3 with SMTP id
 d9443c01a7336-2dbfeccdf9bmr1436185ad.13.1788898978067; Tue, 08 Sep 2026
 13:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 8 Sep 2026 22:22:20 +0200
X-Gm-Features: AcwNN1W16jAho4HwK_fzY15wUA-qa4DGJ92-DrEx1Ojg_VFhiHj2JxDdZTxOKSI
Message-ID: <CAG48ez3Ucb8HyhjC1-fijFiYJsnWcTLYHvJjzMyU710mgegxnA@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_132301_184255_097AF52D 
X-CRM114-Status: GOOD (  15.44  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAxMDowN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUgbWV0
aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+IHNlbGludXhfZmlsZXNb
XSksIHlldCBzZWxfb3Blbl9wb2xpY3koKSBwZXJmb3JtcyBubyBvcGVuIG1vZGUgY2hlY2ssIHNv
IGEKPiBDQVBfREFDX09WRVJSSURFIGNhbGxlciBjYW4gb3BlbiBpdCBPX1JEV1IuIFJlamVjdCBG
TU9ERV9XUklURSBhdCBvcGVuLCBhcwo+IGtlcm5mcyBkb2VzLgo+Cj4gVGhlIGZpbGUgY2FuIHRo
ZW4gbmV2ZXIgYmUgbWFwcGVkIHdpdGggRk1PREVfV1JJVEUsIHNvIGRvX21tYXAoKSBhbHdheXMK
PiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQX1NIQVJFRCBtYXBwaW5n
cyBhbmQgdGhlIFZNX1NIQVJFRAo+IGNoZWNrIGluIHNlbF9tbWFwX3BvbGljeSgpIGNhbm5vdCBi
ZSByZWFjaGVkLiBSZW1vdmUgaXQuCgpZb3Ugc2hvdWxkIGFsc28gYmUgYWJsZSB0byByZW1vdmUg
dGhlIHNlbF9tbWFwX3BvbGljeV9vcHMucGFnZV9ta3dyaXRlCmhhbmRsZXIsIHdoaWNoIGlzIG9u
bHkgZm9yIHNoYXJlZC13cml0YWJsZSBmYXVsdHMsIHJpZ2h0PwoKPiBUaGlzIGFsc28gc3RvcHMg
c2VsX21tYXBfcG9saWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBtYXBwaW5nIHRoYXQg
aXMKPiBuZWl0aGVyIGEgUEZOIG1hcCBub3IgYSBtaXhlZCBtYXAsIGFoZWFkIG9mIHRoZSBjb3Jl
IGVuZm9yY2luZyB0aGF0IG9ubHkKPiBzdWNoIG1hcHBpbmdzIG1heSBkbyBzby4KPgo+IFNpZ25l
ZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdl
ZC1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
