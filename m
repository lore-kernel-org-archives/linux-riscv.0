Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9330DCA5FB1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVxnVn/D3c0g1itejBTIVRXSSzG1YTv4HKFeRUxOvhk=; b=TKiPLzk0jH0cTd
	qgAXIlZ2zjOYr9+pFiEsXPitdjhy9K+BofHsmRI5pDt8I4qlcpkQQwbs2D5e1Xdrs19/TsUIJeiUE
	Yy20HBA5BZDNcw6cu5WDRhzTVUKaBXIk1Cgjiij+kU8ChTVT+h7+dCfRsO99lTXrMT3CYMekoW/nV
	CySC9LdYbjMrmglTyrvOGM2z1sYNCf80Ib/DeYW8fln09tPfeTiediynNU6KftzWjZ5W65iU1XJ7y
	PXyPDykxu0A+S9Iw/fsAbdVnx1ZeRGgaLucmdNYhzODmOw2eGW7LnL1JHK0gIJzeIPStEQSQXxq7V
	vGf/2yBirdXO7W/VcRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNH-000000020eJ-0Zgy;
	Tue, 29 Sep 2026 01:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PlO-00000008rY7-0hS7
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 16:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=; b=TTAfooQOPPM2ZH8SQseBPSmxJI
	NvQtzBNSk/ihvcKOPFi7+Xnbil+/t2JS85zUSjuYnMMZ3pzu+4p285EPS1O1Fyeok3zzPO9mJpH58
	dy+OQwmcGmg27FQzQSjqrqmZX9Uk7yInwi1y0hE6RaJHKmEn1SzYIxy25hw1MHiq0Vu+F16dWvzOh
	dwsFXBHNP1cLHNTeKJsDvF2q08Akt+mbeDLW62Y+OvW6Zso31s+KaPLHvsRtPaLiVrwVIp+U5CktH
	nr6aAzhNNmihumMskrGQexQHAHoCSK98zUAABmUfA1Y4FaWzh/q/diu2qHaEExJR5vQ+6oLSneD9V
	iMjg18OA==;
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PlH-0000000F0dB-1RKr
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 16:24:03 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-530e8c6fb80so276971cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 09:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180637; cv=none;
        d=google.com; s=arc-20260327;
        b=dk7zovgjKfvSXTNhyo76YTGYJBp1ddJ2lsIhY6xMEEXbuO+mQW7F3BUugkM+CoBIV8
         Jo0riKcXIDCQUcTxXtAb5gqbHBuWIw0pcv9Nh1XSncab92pCc15Qm+MpszQ9PikUfieb
         T2tGGSwAN+RpeEL9H5/79wxpzziE/4Vtbd7yz2sDzArdxppgSjKUIRdWTINusgUinZXi
         jmy2YNYrGzE5BMJ/1eVwOspbRFopkWqEqRPj9fN0D0243ENkPwXyYApo0+FNCpB9NoI5
         8lnn2pNGw3y2GD3aL1AFFigivKg5ZXZhKuYC9UhVdR2P49OcXTezFB6HMJ6cIQEIn4fO
         VThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        fh=OfKdxV6C+/4v5o01MCb5EqLlHHEe4IhdYwSlEbepxQ0=;
        b=rv0P6m3hPckHQzMp7jZEscaOIO2/RmLbrZmOpdOtZxZTOO+sjW+dgsAdkAxGej4Knx
         33A7jU4xh+QJbpSMr6FnZjmtfoCY6yDvvjp2QMoG4kVTLJwxX6lIWSglkC5CbbuTKEIq
         12XpKJYiTjUYq/yG9va6dShkiikLPE77q1nomXSSK/694iN/9upQVeF0NYpPZRS5iVC2
         opwFC1wbCnJUyKlb8tI5OkM3NonHW7At43Gn1+7zDhk+lfCjmfg5OeyinhM4zh/a8Cxi
         hpevcgClpPtuI5q++tXZJZZRq4ieo0+8GQKpalodoq8ASFG9gosROQSeF2H2Pck+02Wc
         4p2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790180637; x=1790785437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=IWtW5Wj/TrysJbQi1zraCQ7vbOomAx1fZfOjyJGz7YvtCZc5doh0JnykUttsuorsKD
         4g+4KTlK3/bSs0NmvCw/kZcLCZpKqUdYeq0G4wqsfIGYJ0RpIQBE/QzuFwfhLbw0FWES
         kWIh59b9nd50huAK145b7zU7SCU3qBLs191CdhV+LQDcLi7qyDBX4WwzadQfM0ytIybI
         bNmbRZ5jm8q1QK53fteZSjD1rHio5HsTHLsBsDHuMpT/aIZkzsURojwAQy4uarCYyYn/
         SxZOBQLFzFE5NH0ymJwJlwfG1AP2YLYdVmUazO75PImL/3OvogLug9HLtQA9wr176Kjq
         rcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180637; x=1790785437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=FXu6WYicHwhBB5tFRkdgPGZQAqlnCPc1Cu27837uY+5xnmB/Eo+6831utxYkSTYhrQ
         P0b9wzB5mQ4PhRfFvpxpFJncukytxYwaa7br8p9n89wTy6q4ZArMUSaYpr1+j9BwF10t
         kFToVRvfm2KMUS7bkkZFmHhHJK1n5q8esn31/xhvgZ4HeVLRzPs2VMGnd7a2zpOy+EsL
         QEpb5AkhKdNmoqPy0IqximKTfDnn1sG04lRl2/hjvtDKAEu94DrmYcTnzzMBD0kKlMmt
         Rv/zB7dpMZCKIS0dwoFsJyoXcoRi29yHCjhgqe/HSgLASPO/U1pYF7soNoLwnbiTdkpC
         lREg==
X-Forwarded-Encrypted: i=1; AKwUvBzDhc8P+xE9K+7YDCokz+f5s9e6i+Io64PXW/JYK9/4DV5WkICzxG0/QAo/67IVilb6x7wKF7rnqgudxQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kz/8gbZ1Uz/YGEOo2jn9iktpLkNTR1XujP3ZDwoRNcRRaXRlM7
	ZraqDLCxidlgsgMQZ4Big80P4HIXpOnlBdR7CB6xGpfhFGbDw53Z573AHuw+Wrop9NPvLoRwsQc
	yjKkmvcUih5EwGFqzGGLX+o4FE4VegdH7OxudMod8
X-Gm-Gg: AYBFou2QUpDGv6/af1Ri1Qx/citpT0oyLHeQLKRvErls8SaAoWEC7ZAyWDdOt2unkKQ
	AKTvno6jy5rIm9VsgoK/HYWlaG+qQcTUg32M31ZlcnfxKu/PYhd7ZqKVlM8YYmZ0D2Cq9GUVzJ6
	kyomwCsBkHzS4uWcA5dVUl9PvCyWd5wCBzQdbdktZKdJHgU9U25HjNAa9tDpJe/rznghBAozhxt
	cpK70DpJjj9tLq1K8e4vUsXPyNZWD1bESl4uzpAjWcMrizg6Pwso+CyFJOq0BYZ4ACyZH/2uLtm
	/+FsZnAj4hGl1i8IjS3ZR9nC5Hb36K/+PzjuUCbIHT21tUhoulN7J1j//LUb+vieWWqXviB0ch5
	zk16FCOQQVA==
X-Received: by 2002:a05:622a:609:b0:531:282:6560 with SMTP id
 d75a77b69052e-532f9d4a86emr439391cf.15.1790180636277; Wed, 23 Sep 2026
 09:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 09:23:45 -0700
X-Gm-Features: AcwNN1U-1rGp6GFHFrF0qqhOHTzivX5krrdmfBch0hMHABT_yaCwm6D93D-Dyz8
Message-ID: <CAJuCfpE0WCr1Kp=+4EVJB7UdbH22HuCouOEtGMNCL+a8TnCQPQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use vma_[flags_]can_merge()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_172400_757561_E4B7FE39 
X-CRM114-Status: GOOD (  30.22  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgOToyNOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBWTUFfU1BF
Q0lBTF9GTEFHUyBjaGVjayBpbiB0aGUgVk1BIG1lcmdlIGxvZ2ljIHdpdGgKPiB0d28gbmV3IGZ1
bmN0aW9ucyB2bWFfZmxhZ3NfY2FuX21lcmdlKCkgYW5kIHZtYV9jYW5fbWVyZ2UoKSBhbmQgdXBk
YXRlIHRoZQo+IG1lcmdlIGxvZ2ljIHRvIHVzZSB0aGUgZm9ybWVyLgo+Cj4gVGhpcyBhYnN0cmFj
dHMgdGhlIGNoZWNrIGFuZCBleHByZXNzZXMgaXQgaW4gdGVybXMgb2YgdGhlIGRlc2lyZWQgYmVo
YXZpb3VyCj4gcmF0aGVyIHRoYW4gYW4gYXJiaXRyYXJ5IGFuZCBjb25mdXNpbmcgVk1BIGZsYWcu
Cj4KPiBUaGlzIGFsc28gbGF5cyB0aGUgZ3JvdW5kd29yayBmb3IgbWFraW5nIGZ1cnRoZXIgaW1w
cm92ZW1lbnRzIGluIFZNQSBmbGFnCj4gdXNhZ2UuCj4KPiBBbHNvIHVwZGF0ZSB0aGUgdXNlcmxh
bmQgVk1BIHRlc3RzIHRvIHJlZmxlY3QgdGhlIGNoYW5nZS4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlIGludGVuZGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBn
b29nbGUuY29tPgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwo+ICBtbS92bWEuYyAgICAgICAgICAgICAgICAgICAgICAg
IHwgMTkgKysrKysrKysrKystLS0tLS0tLQo+ICB0b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1
cC5oIHwgIDUgKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAo+IGluZGV4IDk2OTU5NDA3NGZkMi4uNjgyNTBlY2U0MjE5IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0x
NjEyLDYgKzE2MTIsMjcgQEAgc3RhdGljIGlubGluZSBib29sIHZtYV9pc19zaGFyZWRfbWF5d3Jp
dGUoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICByZXR1cm4gaXNf
c2hhcmVkX21heXdyaXRlKCZ2bWEtPmZsYWdzKTsKPiAgfQo+Cj4gKy8qKgo+ICsgKiB2bWFfZmxh
Z3NfY2FuX21lcmdlKCkgLSBEbyB0aGUgc3BlY2lmaWVkIFZNQSBmbGFncyBwZXJtaXQgdGhlIFZN
QSB0byBiZQo+ICsgKiBtZXJnZWQgd2l0aCBhbm90aGVyPwo+ICsgKiBAZmxhZ3M6IFRoZSBWTUEg
ZmxhZ3MgdG8gdGVzdC4KPiArICogUmV0dXJuczogdHJ1ZSBpZiB0aGUgZmxhZ3MgcGVybWl0IG1l
cmdpbmcsIGZhbHNlIG90aGVyd2lzZS4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFf
ZmxhZ3NfY2FuX21lcmdlKGNvbnN0IHZtYV9mbGFnc190ICpmbGFncykKPiArewo+ICsgICAgICAg
cmV0dXJuICF2bWFfZmxhZ3NfdGVzdF9hbnlfbWFzayhmbGFncywgVk1BX1NQRUNJQUxfRkxBR1Mp
Owo+ICt9Cj4gKwo+ICsvKioKPiArICogdm1hX2Nhbl9tZXJnZSgpIC0gRG8gQHZtYSdzIGZsYWdz
IHBlcm1pdCBpdCB0byBiZSBtZXJnZWQgd2l0aCBhbm90aGVyIFZNQT8KPiArICogQHZtYTogVGhl
IFZNQSB0byB0ZXN0Lgo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHRoZSBmbGFncyBwZXJtaXQgbWVy
Z2luZywgb3RoZXJ3aXNlIGZhbHNlLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBib29sIHZtYV9j
YW5fbWVyZ2UoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3sKPiArICAgICAg
IHJldHVybiB2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2bWEtPmZsYWdzKTsKPiArfQo+ICsKPiAgLyoq
Cj4gICAqIHZtYV9rZXJuZWxfcGFnZXNpemUgLSBEZWZhdWx0IHBhZ2Ugc2l6ZSBncmFudWxhcml0
eSBmb3IgdGhpcyBWTUEuCj4gICAqIEB2bWE6IFRoZSB1c2VyIG1hcHBpbmcuCj4gZGlmZiAtLWdp
dCBhL21tL3ZtYS5jIGIvbW0vdm1hLmMKPiBpbmRleCA0Yjc0YjQ4YzI5YjcuLjA1ZDJjNjc2Njcy
ZSAxMDA2NDQKPiAtLS0gYS9tbS92bWEuYwo+ICsrKyBiL21tL3ZtYS5jCj4gQEAgLTkyNCwxMyAr
OTI0LDE0IEBAIHN0YXRpYyBfX211c3RfY2hlY2sgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFf
bWVyZ2VfZXhpc3RpbmdfcmFuZ2UoCj4KPiAgICAgICAgIHZtZy0+c3RhdGUgPSBWTUFfTUVSR0Vf
Tk9NRVJHRTsKPgo+ICsgICAgICAgaWYgKCF2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2bWctPnZtYV9m
bGFncykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICAgICAgICAgLyoKPiAtICAg
ICAgICAqIElmIGEgc3BlY2lhbCBtYXBwaW5nIG9yIGlmIHRoZSByYW5nZSBiZWluZyBtb2RpZmll
ZCBpcyBuZWl0aGVyIGF0IHRoZQo+IC0gICAgICAgICogZnVydGhlcm1vc3QgbGVmdCBvciByaWdo
dCBzaWRlIG9mIHRoZSBWTUEsIHRoZW4gd2UgaGF2ZSBubyBjaGFuY2Ugb2YKPiAtICAgICAgICAq
IG1lcmdpbmcgYW5kIHNob3VsZCBhYm9ydC4KPiArICAgICAgICAqIElmIHRoZSByYW5nZSBiZWlu
ZyBtb2RpZmllZCBpcyBuZWl0aGVyIGF0IHRoZSBmdXJ0aGVybW9zdCBsZWZ0IG9yCj4gKyAgICAg
ICAgKiByaWdodCBzaWRlIG9mIHRoZSBWTUEsIHRoZW4gd2UgaGF2ZSBubyBjaGFuY2Ugb2YgbWVy
Z2luZyBhbmQgc2hvdWxkCj4gKyAgICAgICAgKiBhYm9ydC4KPiAgICAgICAgICAqLwo+IC0gICAg
ICAgaWYgKHZtYV9mbGFnc190ZXN0X2FueV9tYXNrKCZ2bWctPnZtYV9mbGFncywgVk1BX1NQRUNJ
QUxfRkxBR1MpIHx8Cj4gLSAgICAgICAgICAgKCFsZWZ0X3NpZGUgJiYgIXJpZ2h0X3NpZGUpKQo+
ICsgICAgICAgaWYgKCFsZWZ0X3NpZGUgJiYgIXJpZ2h0X3NpZGUpCj4gICAgICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+Cj4gICAgICAgICBpZiAobGVmdF9zaWRlKQo+IEBAIC0xMTUyLDkgKzEx
NTMsMTEgQEAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFfbWVyZ2VfbmV3X3JhbmdlKHN0cnVj
dCB2bWFfbWVyZ2Vfc3RydWN0ICp2bWcpCj4KPiAgICAgICAgIHZtZy0+c3RhdGUgPSBWTUFfTUVS
R0VfTk9NRVJHRTsKPgo+IC0gICAgICAgLyogU3BlY2lhbCBWTUFzIGFyZSB1bm1lcmdlYWJsZSwg
YWxzbyBpZiBubyBwcmV2L25leHQuICovCj4gLSAgICAgICBpZiAodm1hX2ZsYWdzX3Rlc3RfYW55
X21hc2soJnZtZy0+dm1hX2ZsYWdzLCBWTUFfU1BFQ0lBTF9GTEFHUykgfHwKPiAtICAgICAgICAg
ICAoIXByZXYgJiYgIW5leHQpKQo+ICsgICAgICAgaWYgKCF2bWFfZmxhZ3NfY2FuX21lcmdlKCZ2
bWctPnZtYV9mbGFncykpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArICAg
ICAgIC8qIFZNQXMgd2l0aCBubyBwcmV2L25leHQgYXJlIHVubWVyZ2VhYmxlLiAqLwo+ICsgICAg
ICAgaWYgKCFwcmV2ICYmICFuZXh0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+
ICAgICAgICAgY2FuX21lcmdlX2xlZnQgPSBjYW5fdm1hX21lcmdlX2xlZnQodm1nKTsKPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaCBiL3Rvb2xzL3Rlc3Rpbmcv
dm1hL2luY2x1ZGUvZHVwLmgKPiBpbmRleCAxNmMwOWRhYzU5ZDkuLjJmZDQyMjc4OTcxNyAxMDA2
NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1cC5oCj4gKysrIGIvdG9vbHMv
dGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaAo+IEBAIC0xNjQ3LDMgKzE2NDcsOCBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgZmlsZV9pc19kZXZfemVybyhjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiAg
ewo+ICAgICAgICAgcmV0dXJuIGZpbGUgJiYgZmlsZS0+Zl9vcCA9PSAmemVyb19mb3BzOwo+ICB9
Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2ZsYWdzX2Nhbl9tZXJnZShjb25zdCB2bWFf
ZmxhZ3NfdCAqZmxhZ3MpCj4gK3sKPiArICAgICAgIHJldHVybiAhdm1hX2ZsYWdzX3Rlc3RfYW55
X21hc2soZmxhZ3MsIFZNQV9TUEVDSUFMX0ZMQUdTKTsKPiArfQo+Cj4gLS0KPiAyLjU1LjAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
