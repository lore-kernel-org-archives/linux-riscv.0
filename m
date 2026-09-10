Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E891EC982DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XfErBEXhBMsR2u1QLpoJ9guURWm50bd2xi9V6xUo9w=; b=K8YRbKCSYCpdFy
	gQCYWtlkUgGo+K1BOXP1NwhWPqRQxxMScNwR8T4wWdRfuLNiow2VGYQqu42YHLMleznO4b/GiflSZ
	xi4Sk894AjJJMZM0A+BQFcvJZuqsuQBLwXd6Mtosb9aqUaFC0AfhA5VU7xI9JvZEuKbh9GOySYUmN
	fi61ca7ke9SRrGw2QxJ26plsGZkmlJUg9YtvRUXgmf24dYmY+KN3dNzFL0Mlue7a7T7JtoRRNPP6O
	EGvJcOyJfiALVDsRz/VTRF/HF2xS4waawfGgFdZPn257GuODcNfuKy4GErcz3/UKb6sP7tqiaGk6l
	g7y+YTSEPSV/9/sfilKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Lg3-0000000CoeD-0y8U;
	Thu, 17 Sep 2026 23:38:03 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jFE-0000000F7u6-0dz4
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 18:11:33 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 006d021491bc7-6bff4d6504cso77986eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 11:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789063890; cv=none;
        d=google.com; s=arc-20260327;
        b=cJRWHwyB8G3EK6iN/IeiSdYKCNqChriuiDekqz21D4rt+8shXaU8lnYkWJCS27+B0H
         OZ7AFTXPMfPvYStWBuGl+AuITgtfNXTKpTOVhsZH0Djlxqb3yCO4dLMRDAvsalWGILQP
         ORWLAiUe3O5O6B5jOQBEvjES7/r7z1Ybp13cNxWD3bLbSfBWoEeMhDA8qDhanwlJw3NX
         28tUm8WLWA2blgS6sgAuNkPT9zTRjolAsYMMxd8Yq6TWYxeRRKftwvASqdkV1brM0lEg
         mkLFeSaOhfnAVtcSOJ65mdfnsuq6XoVVSCdd4bYo8SX8bDf3+7KFOQT0kTHlwrigIjWs
         BjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        fh=r91OrJG6pP5zZ+onrixbljPDEiDPGtAyOTqM/y1Rw98=;
        b=qZ+rvLeJMxm2x/Rldxtts8im9uBqjwjBpb0OUZS6wLNZVUk2XME3O8YgzbSGLbEsG6
         OAJcf9NnD1N383bMS/Tq23UL4eFZbMpiLx7G7o9WKvd7iBYcVjEIl17M1EKlRGmr2t/M
         p7zHtS/rTG9cm5p2DuqQm4XG4KPBRV84JCFIR70FnE1aH7DKNAE8X7r4y/bwX5dVA1tr
         ryLbXUuIUzvTbx90oDpKM+cnU9qYsdvpccEYkzC9Qz41yuDaXj9LwuywuMR6xtI2mGOy
         +zvqEiZtIeC5NtdgmF8YGTgCpsbCm0Mz02jgRkua5sy5nhoMtWq82tbJcwiFzXqYZrx2
         xkZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063890; x=1789668690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        b=A39iJrVr1vgMCBidwFewAcnKF6CtVXFbV906b38wABGsDaOTGDormNEMvMvI+6hFCy
         Ekb9zR+FyW2Sgk/cxVPxECB6p4mUJlcRn140XW2g52n/6nt+UF2hc0timrZAGsH9M+Sy
         hNnQqx9Aso37KkxSBjOEPQnjVtUWsRrXaKA7tQX26fqwGKffKCR0DH13sAe1U50+tr0R
         HSS3rgRsXoNaFhm/sx+BsQUGlG2sfvXiC/LdlouTqzY05NIgfgSWRS+1K8QLL/1roB0k
         9l3Ce1zemJqsnomLv7WtcRIck6DyJucVKkg9hWnplRb/YxOKSaW0Dyf0k7dlTQYmtbZb
         QkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063890; x=1789668690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        b=UgEl/NEJCdw0480ATbtle0DpwRisCKq2SYZRvUDIF3veI4gWpsyGGUhj0YUDpY6kmS
         vUlyW2uDxkFTAshLp9qo765RhtanCnIOmvFMTsDHfzUXHYYFGXPtzFzPECd7H1HDQC6G
         n84L5UY09Ze0UFSaEJ/TK6lYYrICrMkx+Ieeaa5Gl1ItDcryLrJT5U1UXoz1c0+fngQa
         DaHfNfAkuEYj4UA1ciz9eXJ94UQAF3NhIqbUt2hW0WjQIOIMQXXumfspB1a6mByQXpr9
         9G2IQNeiZAdoL2gFMRYTSETPNjLYAIWh6sCaf5hoHjIO/kGWC622Qm1+6Bo2JCajz8lL
         ksuw==
X-Forwarded-Encrypted: i=1; AKwUvBwxWdessa+VhtOUbLo95Rc3a63A4hOTbVotBmaPAZlTNjRDQS3DaUgKexgm3Hl2cLymYsVnX9Sl5x7akA==@lists.infradead.org
X-Gm-Message-State: AFuF++kBIx4JEcowgxxzLCMoZQbASTGrFVx7WHAHYhv0nXYkhKGVA6Ly
	ejyMqCp0hb5abNQQCZGBtLgcw0FkvJxzYMpB1hA+FtXJLlLJs0XHckZCh+1bGSt8Jui1WFkWmLg
	4NCom7W9lbD2/AYxx45TXsCKYOKnAhmw=
X-Gm-Gg: AYBFou0msh99MrQJXZQRX16pQTOpC4lMl358Do/ELYM/HRdc8Uu0On46RoC8oJtIQWq
	juZMaU/L5yneaLyMNQi+ufure9ubVIcg15eLNK2pIYKjQJnXnXyVdMYYW0OljqqoEv4PNMtqoWs
	9yxuKq8Ty2jubZM+s3hbcQ9wiAP820ZmccRbDp62aX++5y9hqHw7n/eRgpSa/kDgVY7PSa9CHca
	Y0sVPdmtiCyhH8nkMHGOFVnPKpcQkQVMDjYz1K99jaTiapWx2L/OVjfJH266wCeg/ovMnobB88k
	lytmWKtngEPLQhH+qj96nWPNwnP/rqzx5M09XS42nCNgaJ9j6LNr5u4=
X-Received: by 2002:a05:6820:55d3:20b0:6b1:ac4f:f708 with SMTP id
 006d021491bc7-6c0bc1d3ad3mr241038eaf.17.1789063890425; Thu, 10 Sep 2026
 11:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 10 Sep 2026 14:11:18 -0400
X-Gm-Features: AcwNN1XLr_yN2lEzELD3PcXDse2cuW9BBHCwsQpnROCV_SxzPvFmiqhSaiK704I
Message-ID: <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111132_208349_4320EBCB 
X-CRM114-Status: GOOD (  25.74  )
X-Mailman-Approved-At: Thu, 17 Sep 2026 16:37:31 -0700
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCA0OjA34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcG9saWN5IGZpbGUgaGFzIG5vIHdyaXRlIG1l
dGhvZCBhbmQgaXMgZXhwb3NlZCByZWFkLW9ubHkgKFNfSVJVR08gaW4KPiBzZWxpbnV4X2ZpbGVz
W10pLCB5ZXQgc2VsX29wZW5fcG9saWN5KCkgcGVyZm9ybXMgbm8gb3BlbiBtb2RlIGNoZWNrLCBz
byBhCj4gQ0FQX0RBQ19PVkVSUklERSBjYWxsZXIgY2FuIG9wZW4gaXQgT19SRFdSLiBSZWplY3Qg
Rk1PREVfV1JJVEUgYXQgb3BlbiwgYXMKPiBrZXJuZnMgZG9lcy4KPgo+IFRoZSBmaWxlIGNhbiB0
aGVuIG5ldmVyIGJlIG1hcHBlZCB3aXRoIEZNT0RFX1dSSVRFLCBzbyBkb19tbWFwKCkgYWx3YXlz
Cj4gY2xlYXJzIFZNX01BWVdSSVRFIGFuZCBWTV9TSEFSRUQgZm9yIE1BUF9TSEFSRUQgbWFwcGlu
Z3MgYW5kIHRoZSBWTV9TSEFSRUQKPiBjaGVjayBpbiBzZWxfbW1hcF9wb2xpY3koKSBjYW5ub3Qg
YmUgcmVhY2hlZC4gUmVtb3ZlIGl0Lgo+Cj4gVGhpcyBhbHNvIHN0b3BzIHNlbF9tbWFwX3BvbGlj
eSgpIGNsZWFyaW5nIFZNX01BWVdSSVRFIG9uIGEgbWFwcGluZyB0aGF0IGlzCj4gbmVpdGhlciBh
IFBGTiBtYXAgbm9yIGEgbWl4ZWQgbWFwLCBhaGVhZCBvZiB0aGUgY29yZSBlbmZvcmNpbmcgdGhh
dCBvbmx5Cj4gc3VjaCBtYXBwaW5ncyBtYXkgZG8gc28uCj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3Jl
bnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgoKV2Ugc2hvdWxkIGxpa2VseSBkbyBz
b21ldGhpbmcgc2ltaWxhciBmb3IgdGhlIG90aGVyIHNlbF9vcGVuXyooKSBhbmQKc2VsX21tYXBf
KigpIGZ1bmN0aW9ucyB0b28uCkluIHBhcnRpY3VsYXIsIHRydW5jYXRpb24gb2YgdGhlIHN0YXR1
cyBmaWxlIGNhbiBicmluZyBkb3duIHN5c3RlbWQKc2luY2UgaXQgaXMgbWFwcGVkIGJ5IGxpYnNl
bGludXguCgpBY2tlZC1ieTogU3RlcGhlbiBTbWFsbGV5IDxzdGVwaGVuLnNtYWxsZXkud29ya0Bn
bWFpbC5jb20+Cgo+IC0tLQo+ICBzZWN1cml0eS9zZWxpbnV4L3NlbGludXhmcy5jIHwgMTEgKysr
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9zZWxpbnV4L3NlbGludXhmcy5jIGIvc2VjdXJp
dHkvc2VsaW51eC9zZWxpbnV4ZnMuYwo+IGluZGV4IGM3ZDkxNDc2OTcxYy4uNTQ1YTZmODlmOWU3
IDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L3NlbGludXgvc2VsaW51eGZzLmMKPiArKysgYi9zZWN1
cml0eS9zZWxpbnV4L3NlbGludXhmcy5jCj4gQEAgLTM0MCw2ICszNDAsOSBAQCBzdGF0aWMgaW50
IHNlbF9vcGVuX3BvbGljeShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlscCkK
PiAgICAgICAgIHN0cnVjdCBwb2xpY3lfbG9hZF9tZW1vcnkgKnBsbSA9IE5VTEw7Cj4gICAgICAg
ICBpbnQgcmM7Cj4KPiArICAgICAgIGlmIChmaWxwLT5mX21vZGUgJiBGTU9ERV9XUklURSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FQUNDRVM7Cj4gKwo+ICAgICAgICAgcmMgPSBhdmNfaGFz
X3Blcm0oY3VycmVudF9zaWQoKSwgU0VDSU5JVFNJRF9TRUNVUklUWSwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNFQ0NMQVNTX1NFQ1VSSVRZLCBTRUNVUklUWV9fUkVBRF9QT0xJQ1ksIE5V
TEwpOwo+ICAgICAgICAgaWYgKHJjKQo+IEBAIC00MjQsMTQgKzQyNyw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3Qgc2VsX21tYXBfcG9saWN5X29wcyA9IHsKPgo+
ICBzdGF0aWMgaW50IHNlbF9tbWFwX3BvbGljeShzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpCj4gIHsKPiAtICAgICAgIGlmICh2bWEtPnZtX2ZsYWdzICYgVk1f
U0hBUkVEKSB7Cj4gLSAgICAgICAgICAgICAgIC8qIGRvIG5vdCBhbGxvdyBtcHJvdGVjdCB0byBt
YWtlIG1hcHBpbmcgd3JpdGFibGUgKi8KPiAtICAgICAgICAgICAgICAgdm1fZmxhZ3NfY2xlYXIo
dm1hLCBWTV9NQVlXUklURSk7Cj4gLQo+IC0gICAgICAgICAgICAgICBpZiAodm1hLT52bV9mbGFn
cyAmIFZNX1dSSVRFKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUFDQ0VTOwo+
IC0gICAgICAgfQo+IC0KPiAgICAgICAgIHZtX2ZsYWdzX3NldCh2bWEsIFZNX0RPTlRFWFBBTkQg
fCBWTV9ET05URFVNUCk7Cj4gICAgICAgICB2bWEtPnZtX29wcyA9ICZzZWxfbW1hcF9wb2xpY3lf
b3BzOwo+Cj4KPiAtLQo+IDIuNTUuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
