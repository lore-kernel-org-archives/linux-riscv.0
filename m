Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9171CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZT1A5s2DHhhIAssUjxewvpYK8EmphlSw7X1/nFPaec=; b=IX1R9aevD6TszZ
	3Fs6AhJxVhJQ/d5PFGAyMnn+u+8pjFZ8baTzzFOxNYaUylnAfq0CqkTCPDC41xEDHajp2XDz/80Td
	4Vc6/Izvyzozaolidr5sheiL7NSctpCyVFQl0mdJ+ilev2mq3zF0I50AL20mIzMvaKhzl8A7xIVf0
	KFSmyWqwGlFVXJk2ZIqByIHj9Abntb3p99+KmU82fyO47TS/GVE1ifyoNgoCTZ1EQF91//En2HDuW
	mw6FTox4XOQ+skYPC1KEtw+poMPcQA14ZT0xULG2+FNoyiOwPHlcEafXxqpAdCTiGFrtEUsUziWe/
	wLHTZxkGKt8dPwrIWHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNH-000000020eF-0CuL;
	Tue, 29 Sep 2026 01:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PXk-00000008qIx-3TQZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 16:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=; b=L7MfEnInLQzTVHHrdQNQZv9ZUY
	HP3gCVJFGGEeWZRIOQ6bWkLAJZpFOYcERwe1r0Wm7npGtKJ6XZbGDck8V9YBSdMZcw96AdfSPGwvv
	V5FnO7G11Z0CvnPm2ZwOzYCajXiMwz/OM998wZUvoR9qsPXNIXHIJCFXKkfOKz1dRlmmY6CfAHszI
	wawvc3VI2MPJpWDL0wwGwn8EEt9NY5U+nklH3LqssN94OODMRTYHi6/W+WU1Q8beoSdQoo7hVUo7K
	2jvWyMS/U/g1Vqp4CGF12sMajrG0bklQTU0y/+R8pdwfa7iTWizVRwbO2jsbpv658QE07wqS7NqPP
	6euYkv2A==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9PXe-0000000Ezdj-3ba4
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 16:09:59 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-52faa58bff5so277191cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 09:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790179793; cv=none;
        d=google.com; s=arc-20260327;
        b=WTsjE7U1gezMMBoFmL9BYN1uEFsW0/XzocXjbLeDMWSmOTJtLHHbtOsziMB6IWIatH
         zE30qFf/3dbpY2MBkV+p6vRUZrXqeFLjl1pm0DkZ1wbDw761/m0K5P+h8Nxq3lCyNeVN
         UW3edmj1oCWsdIpTsfET86EgmIm7bqILo/YDKIf9qtZwX1k5xufBgVBdQx3zwlzpNKJG
         uye5Leg9bkhnsCJUYttrjcrT4/YvPchydX6+lXpksmAAlnZMcCtz9Q99nXSjtQ8e9JCC
         pVwVTWngP5F50KKKo5Qm/ohL/LJCD6qvlrXGRUatrNwglAyPT5RwL8uNH6nhcHplU0OM
         xrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        fh=gBjEdxnS4LnfUCDPZtJEtuApF7TSX3CJ1iXoaMEsSeY=;
        b=ll9HphFmmhm/e3rzJ/OwGekrtaYwvgDBxB3ucwBNrzcQRfCyOoAHhegIGqfkobDeb5
         nDtXFBHL1cENz7Uuc3VL0JCjukZ1knIqDay9HQmBSXPoq2/SaZhtWjzN0WUgYtgI4n1T
         ZE3f8k4VRnZW0FBLQSkHz5QN/h/x+pUldCx3nhN7CIhNQq360m13qS0QUrLzBIz6uG4e
         Ysif0sWo03dCvmoH3BJXA15OgaTCs49eKjLQ5noAV3y8wUrO7jeRCSCiGr8JCEgBc6MW
         aC1SYyA6HrRi9wmXbSyUht0aupuPF40Iw5FchjT0vrzJi/+UTTC6qhvaIn8i/dWRiJma
         0VCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790179793; x=1790784593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        b=WnyMCg61S8EKnZJhW6lBYgbLMwiT+UHZqHhqOk3v3Equ6I5xTgL+BrvWfTEhj22xx0
         oqD4RFqq/8fQTKa6eK8qowUQXN3Pend+wmpYJvyWcVfO6mclGGbEDvL+fIRN/DQH4keu
         umcxmHTNUBY+Z7zxY4lHzUC1M4MM+9hyeNx3kMEmTv0+M3og6VdJtsTJwAaYNgicnPrh
         XzPHcY9DJmD01X09kMLWeZCYHWnpuBOExPVvU+NB9ziZ/f6Vh9/64b7fAljx3bW13qYG
         Sf1mHapkILR8QHXGub2REdrSJnMNPw4bCUcE0bgw/y5F9i57qlw5Z4O0EDYSnUhGc3CN
         S0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179793; x=1790784593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHWyBmRaGzTNumsbsfRRD90WYZuPVsFs3XssqLSLFrU=;
        b=qqEl3xZ84fqniKDrv33aXAf1jbYwiD39QyhNH8EnC58CR9BewDoUzTrPaq35shXAXw
         wB5Hr0H8RhURWC4zlYUf7LkcGEUqanHsQ1pPnix+RqDf317t+DYDHwuvYPbkv8vfXIch
         R0wga/M0T5F/M8VlB1P/FiRHM0117HGZ9GDE86AOEwIso9OOXa6pmmzUk4LmCjD/Jx4M
         azjVIMT66jolJouKn4nvIP5xCMmN2r97gZVAAa10sXUB9qx2IY30INqfSH05F09re9xA
         I09L3rV35M56jAApyukQYX+iU3qbs64NBCk3+xs7vLZ09YOsjH4Xa13pNUxm89wdJm9G
         161A==
X-Forwarded-Encrypted: i=1; AKwUvBz0nqx7HOUt0qfnC0dWxStcNgbzxcvJ92IdRmNYeU9A4pX6L1sw53TxgMNIkTVvNafFNilrJvKJInBblQ==@lists.infradead.org
X-Gm-Message-State: AFuF++neemLK5//3AqYJOd5nTPVXPCvT/5mvN6Emn7VQmeU4JAumYeOZ
	5lP9JAVMy9DO9g13SkZurHJg2ZLDLYfEeQ7V9t01QLcQo4asZVT+crUQDysn7E0V7/eguAcWnRf
	R2fxg3mEvZnk7ZfvV7VIrCCW4HEnvkJjhiKD/TuUN
X-Gm-Gg: AYBFou31UoY6I2UJccEsqsPD6ZqPhLU7jTGvttiqkqs2EgR/4Vn5Md7oTH9SLMvi3AY
	KzlTakOSbIf6I78axq5NZAft/q4ojFsqQvzoW9QNkA1PC6rImUCRHcg4BpZJ9S068y5DSXqdC+G
	qR2UI4XsL5QKmIf3OoB0qbuR/tcew1KLAKt4EWXMVgBk6+/f9KWVpANmitr0RJtQsbc5iE1jPs2
	LTq3AVBpHhV1ZvCyuPXcBCPX+WGxObT2gLv0Crc6Jt3oHSLX0OQarzBNlxEpp5Et9UwIKZADIvj
	ndzCIsOrwC8lzc3iL16ibhyCgXf5SlMKQWBYlG/LGbs7nenLQtS3ccVR1du3AXjhjX2Kmn5Bsvy
	NFdOBHh2jyhw=
X-Received: by 2002:a05:622a:591b:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-532f8b3b7d0mr1642301cf.0.1790179791981; Wed, 23 Sep 2026
 09:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
 <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com> <arP0oJgrgZlgtrb6@gremlin>
In-Reply-To: <arP0oJgrgZlgtrb6@gremlin>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 09:09:38 -0700
X-Gm-Features: AclHuK-pjLwt7GcAJrmXZc-kWYiEiXZ02rewi0rtPA2ju4vBD2OPEsiN1JlMpG0
Message-ID: <CAJuCfpFPPGaK-grNx9qiQOhzAXbxU+SO+95Fht1571TGREx2oQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_170955_148358_B096C98D 
X-CRM114-Status: GOOD (  35.91  )
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgODo1NOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMDg6MzI6
NDNBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2FyeWFuIHdyb3RlOgo+ID4gT24gVGh1LCBTZXAgMTcs
IDIwMjYgYXQgOToyNOKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPgo+ID4gPiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRvIG1hbmlwdWxhdGUgVk1B
IGZpZWxkcyBpZiB3ZSBhbGxvY2F0ZWQgYSBuZXcgVk1BLAo+ID4gPiByYXRoZXIgdGhhbiBtZXJn
ZWQgaXQuCj4gPiA+Cj4gPiA+IFZNQSBtZXJnaW5nIGRvZXMgbm90IGNvbXBhcmUgdm1fb3BzIG9y
IHZtX3ByaXZhdGVfZGF0YSwgc28gYSBtZXJnZWQgVk1BCj4gPiA+IGtlZXBzIGl0cyBvd24sIHdo
aWNoIGlzIGFsc28gd2hhdCB0aGUgbGVnYWN5IGZfb3AtPm1tYXAgcGF0aCBkb2VzIHNpbmNlIGl0
Cj4gPiA+IG5ldmVyIHRvdWNoZXMgYW4gZXhpc3RpbmcgVk1BLiBQcmV2aW91c2x5IHNldF92bWFf
dXNlcl9kZWZpbmVkX2ZpZWxkcygpCj4gPiA+IG92ZXJ3cm90ZSB0aGUgbWVyZ2VkIFZNQSdzIGZp
ZWxkcyB3aXRoIHRob3NlIHNldCBmb3IgdGhlIG5ldyBtYXBwaW5nLiBJbgo+ID4gPiBwcmFjdGlj
ZSB0aGVzZSBhcmUgdGhlIHNhbWUgdmFsdWVzLCB3aXRoIHJhcmUgZXhjZXB0aW9ucyBzdWNoIGFz
IHNobWVtCj4gPiA+IHNlbGVjdGluZyB2bV9vcHMgYmFzZWQgb24gd2hldGhlciB0aGUgZmlsZSBo
YXMgYmVlbiB1bmxpbmtlZCwgc28gbm8KPiA+ID4gdXNlci12aXNpYmxlIGNoYW5nZSBpcyBleHBl
Y3RlZC4KPiA+ID4KPiA+ID4gTWFrZSB0aGlzIGRlcGVuZGVuY3kgZXhwbGljaXQsIGFuZCBhZGRp
dGlvbmFsbHkgY29uc3RpZnkgaGF2ZV9tbWFwX3ByZXBhcmUKPiA+ID4gd2hpbGUgd2UncmUgaGVy
ZS4KPiA+Cj4gPiBUaGUgZmFjdCB0aGF0IHdlIG1pZ2h0IGJlIG92ZXJyaWRpbmcgYXR0cmlidXRl
cyBvZiBhbiBleGlzdGluZyBWTUEKPiA+IHRoYXQgd2UgbWVyZ2VkIHdpdGggaXMgdGVjaG5pY2Fs
bHkgYSBidWcgZXZlbiBpZiB3ZSBuZXZlciBoaXQgaXQsCj4gPiByaWdodD8gSWYgc28sIHNob3Vs
ZCB3ZSBoYXZlOgo+ID4KPiA+IEZpeGVzOiBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5l
dyAubW1hcF9wcmVwYXJlKCkgZmlsZSBjYWxsYmFjayIpCj4KPiBJdCdzIG5vdCBhIGJ1ZywgaXQg
aXMgYW4gaW4tYnVpbHQgYXNzdW1wdGlvbiB0aGF0IHRoZSBzdGF0ZSB1c2VkIHRvIGFzc2Vzcwo+
IG1lcmdlYWJpbGl0eSBpbXBsaWVzIHRoZSBzYW1lIHByb3BlcnRpZXMuCgpIbW0uIFdoYXQgcHJl
dmVudHMgdHdvIFZNQXMgd2l0aCBkaWZmZXJlbnQgdm1fcHJpdmF0ZV9kYXRhIG1lbWJlcnMgdG8K
YmUgbWVyZ2VkPyBJSVVDIGlzX21lcmdlYWJsZV92bWEoKSBkb2VzIG5vdCBjaGVjayB2bV9wcml2
YXRlX2RhdGEuIEluCnN1Y2ggYSBjYXNlIHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcygpIHdv
dWxkIG92ZXJyaWRlCnZtX3ByaXZhdGVfZGF0YSBvZiBhbiBleGlzdGluZyBWTUEsIG5vPwoKPgo+
IEFuZCBpZiBpdCB3YXMsIGl0J2QgbmVlZCBmaXhpbmcgYSBkaWZmZXJlbnQgd2F5IChjaGVjayB0
aGUgZmllbGQgZm9yIGluc3RhbmNlKQo+IGFuZCB3b3VsZCBhcHBseSB0byB0aGUgbGVnYWN5IG1t
YXAgaG9vayBhbHNvLgo+Cj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIGZvciB0aGUgc2VyaWVzIHRo
b3VnaC4KPgo+ID4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChB
Uk0pIDxsanNAa2VybmVsLm9yZz4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KPgo+IFRoYW5rcyEKPgo+ID4KPiA+ID4gLS0tCj4gPiA+
ICBtbS92bWEuYyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL21tL3ZtYS5jIGIvbW0v
dm1hLmMKPiA+ID4gaW5kZXggZmE3ODRmMDY5ZGE0Li40Yjc0YjQ4YzI5YjcgMTAwNjQ0Cj4gPiA+
IC0tLSBhL21tL3ZtYS5jCj4gPiA+ICsrKyBiL21tL3ZtYS5jCj4gPiA+IEBAIC0yODk0LDcgKzI4
OTQsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX21tYXBfcmVnaW9uKHN0cnVjdCBmaWxlICpm
aWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiA+ICB7Cj4gPiA+ICAgICAgICAgc3RydWN0IG1t
X3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPiA+ID4gICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSA9IE5VTEw7Cj4gPiA+IC0gICAgICAgYm9vbCBoYXZlX21tYXBfcHJlcGFyZSA9
IGZpbGUgJiYgZmlsZS0+Zl9vcC0+bW1hcF9wcmVwYXJlOwo+ID4gPiArICAgICAgIGNvbnN0IGJv
b2wgaGF2ZV9tbWFwX3ByZXBhcmUgPSBmaWxlICYmIGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZTsK
PiA+ID4gICAgICAgICBWTUFfSVRFUkFUT1Iodm1pLCBtbSwgYWRkcik7Cj4gPiA+ICAgICAgICAg
Y29uc3QgcGdvZmZfdCBhbm9uX3Bnb2ZmID0gYWRkciA+PiBQQUdFX1NISUZUOwo+ID4gPiAgICAg
ICAgIE1NQVBfU1RBVEUobWFwLCBtbSwgJnZtaSwgYWRkciwgbGVuLCBwZ29mZiwgYW5vbl9wZ29m
Ziwgdm1hX2ZsYWdzLCBmaWxlKTsKPiA+ID4gQEAgLTI5MzcsNyArMjkzNyw3IEBAIHN0YXRpYyB1
bnNpZ25lZCBsb25nIF9fbW1hcF9yZWdpb24oc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxv
bmcgYWRkciwKPiA+ID4gICAgICAgICAgICAgICAgIGFsbG9jYXRlZF9uZXcgPSB0cnVlOwo+ID4g
PiAgICAgICAgIH0KPiA+ID4KPiA+ID4gLSAgICAgICBpZiAoaGF2ZV9tbWFwX3ByZXBhcmUgJiYg
IW1hcF9pc19hbm9uKCZtYXApKQo+ID4gPiArICAgICAgIGlmIChoYXZlX21tYXBfcHJlcGFyZSAm
JiBhbGxvY2F0ZWRfbmV3ICYmICFtYXBfaXNfYW5vbigmbWFwKSkKPiA+ID4gICAgICAgICAgICAg
ICAgIHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcyh2bWEsICZtYXApOwo+ID4gPgo+ID4gPiAg
ICAgICAgIF9fbW1hcF9jb21wbGV0ZSgmbWFwLCB2bWEpOwo+ID4gPgo+ID4gPiAtLQo+ID4gPiAy
LjU1LjAKPiA+ID4KPgo+IC0tCj4gQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
