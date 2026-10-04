Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B803DCA600C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok9SFbWmRD1XjTzu9BPiIQ4M6gz2wnjjXt2mD4PyXBw=; b=AcL/dCESpnddyt
	zceRwzUyLmyQgFnlnUNKQQxW3hRvO1LY2ny/f08Zy9x/hCAElUFE5mivb9sQlNMi8OaKwvqmt4uhp
	iMxoNvZTuTzK+/stxWECE22fMMYaGzwS1nrspkoLNeERVf5wbXWtM4Xtj+Nj0iRYbmY85RKl75Zz1
	tM9MqmJi0VYD8tlvYsAVEpWV/T1HQKfK+5Kc6PhA1nDT4HYP2Qexqd70Y8spuaSvh+3tib/cFzsuw
	TPxkrCDwvnd/toMUJ3OIaY93IyiGVM9MUFCqp7kxO/C97NA6oQ4EA3eImGOKN7qUhhj4s//DO60eP
	/JPz2DEJPMkmwp2ctsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVq3-00000002tEH-3DBh;
	Wed, 07 Oct 2026 17:53:59 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDR7K-0000000FB43-1fX0
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:39:23 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5337c7b9937so265841cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791139161; cv=none;
        d=google.com; s=arc-20260327;
        b=EEMN+oOq5O7F3pPQ7BSEMHPgqoWwgMZoUN+jsZfuQqeI7ln072Va0Hh7or2yTrUHAH
         DJXcJFqWl435atmxnPujil4QPyrioEfbeMAjC6YoSuWJ5OJNakfd95WUbcGeOIWlcojp
         8zQU2OKD1c5qup492BA1aQRI1iiQLURiNUGhgcVMbJocQBKzGYJG3ecGe5pK7Bj92FhX
         2FYjCfiWh3FesIZdZZtZVEOzIL3pS6sm1MA+uwbWqXj+kiTRRx8+5AO60lyxDfNlao+w
         VZ1T8hhaOdjNzI/WDD3oddGXNMC0jsV89QaigkzlPCit+Ypbhc+7QjvzQWxE6UMJuxVD
         cGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZSC0w1neootLkbih9TUxoXkKPCkBI7t1n5ZaTzyKsnU=;
        fh=WlD0BixMZ/CZcFZKWtRea7oSyfh/kjmH5HrU1PjfCbM=;
        b=R+o6zeG839HGu+bwOR7Zfdq0jcbfmtgraQOImM0qWVpvZUoCbM01pRt1j5XAaFGVXP
         jX/OZamxYveWCwcC2/NCY7fMCEzd8Jr1cwwDdbv3e2piXYg8X6MIHYzWi3UcvqStmEN9
         dm+oxvFywsUIbwunGL54eY1sN5Pbwe5Du1/XHYjVU83VzWvCHhSWF/4yLMNSMyFoP79q
         f2IvcKQNKtRdvEJtC3sest7RdVV8COyRoL5AWoZaYjKpxEwNdyjhMI7nUJl7UiRs5H/b
         oTtoEww7nLT8sNwpH7y2rt/QhT9dNnS4SHLV/8RYY7qqIFZCC5jYc38afi16HdgQF1v5
         uj9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791139161; x=1791743961; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSC0w1neootLkbih9TUxoXkKPCkBI7t1n5ZaTzyKsnU=;
        b=nE1Be33ntWC1f2WwBWJoSjCM72ToDIlwSTNBk/wme6cCycW3MSrWIlRXGmx1Xw0Ks9
         WHeaUmedxuwy2Y423uVFyvrAh7nMu+HHSU3UoUBhgWewjOl75YmB80rlz9NtljpPJFIa
         dR3cA+0uA6ptXQQaS+wpQrYhcpHSP7ezM2FtwGM51rLkGbLAR+2/+bFFM0y0wpq6aYr/
         RExLfQkRLNszvYIq0HGB3aehpSqfZLe1p1LlZkgOm4O3kwJUjdk1nzK3gbCUI3VeS2VU
         GZPIdBXOMMtNWlyIRUc4qmy6G2hCWhmOBj29lTYZBDIvKKQtACDi/V3jxa24Hvbr7duU
         GunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139161; x=1791743961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSC0w1neootLkbih9TUxoXkKPCkBI7t1n5ZaTzyKsnU=;
        b=tq5v2Jk3nxtWMiRxxLzCZHgi1OEcXkDuR/9/mdH+Sh7H2ndXeZYuJo4IFqFMVyYthl
         kjlY75B4ap2VJYS6FzSXqxJWNNu3dig/fqhkAs6XIKbnpk2nsjXQ/lz8/KQw0tXFg4IM
         gTIEeL++YfnDQEj9UD/ESJTs/wqgdJC4ahAYqBREUpaxweAyz9YMxWEtfDuAHtOAklzH
         iV2+7i8lKZtMHHp2KoJlCpCS8pYIdRPctaJDkbYfyLgyO2lHIpBO9MlfivKZUlGXnG1/
         nfoMvPWIJvz6OWJ8kAUg8pWxwa3GtY2A+kuxo62epD9FW6LGivi8UuO1OZLyXMjgYL/5
         4x3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwfigY54ysUKO6kubu2pAk2jkxZ+QNtqblTr+5r0EqC6pLuPb3OibRCyUB86eIUVTs3jJqsB1tjUUGvuw==@lists.infradead.org
X-Gm-Message-State: AFuF++nLaIrVjq5CaLja03QuEE8h7Q6T2PvbqMalvlrDPXQp8qgVK0Av
	4oSu1A+YexBOUwSzD2TB/9cCTPGov/nabE1BUvjK9d3Y3nrwiBlVL4VE/E/L91mP0pr4Av9KAyO
	wG8KjJ/hPsXHP2qGSPF3qreGXjsjLOjeK+EoHG0JM
X-Gm-Gg: AYBFou1arWdyrDZgjbyiBi20zoPfHohpJaJUMqYzR2C9Ek19A68KZ2GnqSl4luhgJFX
	j4glI6OGKax/xMPgVTL3Kz9MIBSP4sJK3kdQLJybLIYkC4Nq2xfVRMkn/DVaGTvad9sU78vNrAR
	Oxu2sdmeZl34gweghhZUh3M3nhpAmG3SyVNSWAPwUi/WDtJr3EIeSMVlDZk8BVEQBGlp68MKYLO
	ryDjNFF1w32JBJz99IdiLTHQIqQUH3dtkpEReopuzPlI2aDbT0hXBgldy9rXDoIiktmNNan9TBZ
	dk+D/cIbcKbknZ8mI2b7QYn0OG3U3AtGY3+dL5nfS28CyBFwfmUFtdDZ
X-Received: by 2002:a05:622a:a16:b0:531:282:6560 with SMTP id
 d75a77b69052e-5351322e1b3mr19806961cf.15.1791139160071; Sun, 04 Oct 2026
 11:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-21-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-21-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 20:39:04 +0200
X-Gm-Features: AclHuK-BFFMO7RL_23L1uoIyefqTPzoxo4liaojYggefG4PLZrnFo0OrrSwhSqQ
Message-ID: <CAJuCfpGtyaqwi__OXcB=iy2+LUVzFnLo-Q=Rdxz728_EHdTaWA@mail.gmail.com>
Subject: Re: [PATCH v4 21/38] uprobes: remove VM_IO, set VM_MIXEDMAP for
 mapped kernel pages
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_113922_460644_84A9888F 
X-CRM114-Status: GOOD (  25.16  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjQw4oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGVzZSBhcmUgbm90IE1NSU8gcGFnZXMgc28gVk1B
X0lPX0JJVCBpcyBhbiBpbmFwcHJvcHJpYXRlIGZsYWcgdG8gc2V0Lgo+Cj4gSW5zdGVhZCwgc2V0
IHRoZW0gVk1BX01JWEVETUFQX0JJVCBhcyB0aGV5IGFyZSBrZXJuZWwgbWFwcGluZ3MgYW5kIHRo
aXMgaXMKPiB0aGUgYXBwcm9wcmlhdGUgZmxhZyB0byBzZXQgZm9yIHRob3NlLgo+Cj4gVGhpcyBw
cm92aWRlcyB0aGUgc2VtYW50aWNzIHJlcXVpcmVkIC0gbm8gVk1BIG1lcmdpbmcgaXMgcGVybWl0
dGVkLCBidXQKPiBkb2VzIG5vdCBwcmV2ZW50IEdVUC4KPgo+IEhvd2V2ZXIgdGhpcyBoYXMgbm8g
bWVhbmluZ2Z1bCBpbXBhY3QgYXMgdGhlc2UgYXJlIHJlZmNvdW50ZWQgYW5kIHRodXMgY2FuCj4g
YmUgR1VQZWQuCj4KPiBBIHByZXZpb3VzIGNvbW1pdCBhbHJlYWR5IHByZXZlbnRlZCBfX21tX3Bv
cHVsYXRlKCkgZnJvbSBiZWluZyBpbnZva2VkIG9uCj4gWE9MIGFyZWFzLCB3aGljaCBWTUFfSU9f
QklUIHdhcyBwcmV2aW91c2x5IHJlbGllZCB1cG9uIHRvIGRvLCBzbyB0aGF0IGlzIG5vCj4gbG9u
Z2VyIHJlcXVpcmVkLgo+Cj4gQm90aCBWTUFzIHNldCBhIFZNQSBuYW1lLCBzbyBhbHdheXNfZHVt
cF92bWEoKSByZXR1cm5zIHRydWUgYmVmb3JlCj4gdm1hX2R1bXBfc2l6ZSgpIHJlYWNoZXMgaXRz
IFZNQV9JT19CSVQgY2hlY2ssIGFuZCB0aHVzIHRoZXJlIGlzIG5vIGNoYW5nZQo+IGluIGNvcmUg
ZHVtcCBiZWhhdmlvdXIuCj4KPiBDaGFuZ2UgdGhpcyBmb3IgYm90aCB0aGUgY29yZSB4b2xfYWRk
X3ZtYSgpIGZ1bmN0aW9uIGFuZCB0aGUgeDg2LXNwZWNpZmljCj4gZ2V0X3Vwcm9iZV90cmFtcG9s
aW5lKCkgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkg
PGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5i
QGdvb2dsZS5jb20+CgoKPiAtLS0KPiAgYXJjaC94ODYva2VybmVsL3Vwcm9iZXMuYyB8IDIgKy0K
PiAga2VybmVsL2V2ZW50cy91cHJvYmVzLmMgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rZXJuZWwvdXByb2Jlcy5jIGIvYXJjaC94ODYva2VybmVsL3Vwcm9iZXMuYwo+IGluZGV4IDY1
YTJkZTgyZWNkMi4uMGY2MGMwZDA3NmI2IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC91
cHJvYmVzLmMKPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvdXByb2Jlcy5jCj4gQEAgLTcxNSw3ICs3
MTUsNyBAQCBzdGF0aWMgc3RydWN0IHZtX2FyZWFfc3RydWN0ICpnZXRfdXByb2JlX3RyYW1wb2xp
bmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbgo+Cj4gICAgICAgICAqbmV3X21hcHBpbmcg
PSB0cnVlOwo+ICAgICAgICAgcmV0dXJuIF9pbnN0YWxsX3NwZWNpYWxfbWFwcGluZyhtbSwgdmFk
ZHIsIFBBR0VfU0laRSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZNX1JFQUR8
Vk1fRVhFQ3xWTV9NQVlFWEVDfFZNX01BWVJFQUR8Vk1fSU8sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBWTV9SRUFEfFZNX0VYRUN8Vk1fTUFZRVhFQ3xWTV9NQVlSRUFEfFZNX01J
WEVETUFQLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRyYW1wX21hcHBpbmcp
Owo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2V2ZW50cy91cHJvYmVzLmMgYi9rZXJuZWwv
ZXZlbnRzL3Vwcm9iZXMuYwo+IGluZGV4IDc3MDllYTg4MjQ3Ny4uYjg5Y2M1Y2VlMDAyIDEwMDY0
NAo+IC0tLSBhL2tlcm5lbC9ldmVudHMvdXByb2Jlcy5jCj4gKysrIGIva2VybmVsL2V2ZW50cy91
cHJvYmVzLmMKPiBAQCAtMTcyNiw4ICsxNzI2LDggQEAgc3RhdGljIGludCB4b2xfYWRkX3ZtYShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0IHhvbF9hcmVhICphcmVhKQo+ICAgICAgICAgfQo+
Cj4gICAgICAgICB2bWEgPSBfaW5zdGFsbF9zcGVjaWFsX21hcHBpbmcobW0sIGFyZWEtPnZhZGRy
LCBQQUdFX1NJWkUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWTV9FWEVDfFZN
X01BWUVYRUN8Vk1fRE9OVENPUFl8Vk1fSU98Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBWTV9TRUFMRURfU1lTTUFQLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Vk1fRVhFQ3xWTV9NQVlFWEVDfFZNX0RPTlRDT1BZfAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVk1fTUlYRURNQVB8Vk1fU0VBTEVEX1NZU01BUCwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ4b2xfbWFwcGluZyk7Cj4gICAgICAgICBpZiAoSVNfRVJSKHZtYSkp
IHsKPiAgICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUih2bWEpOwo+Cj4gLS0KPiAyLjU1LjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
