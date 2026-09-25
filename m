Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D406CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piExdtlBDSScGxm18c2VWrtqYb1k8TN7HJgxMX9cVrc=; b=tyBbBbQ9reLWMM
	xUBR1a8uthDluoJ31+jZVMI5ZBOhXDxF3Sskd0OjgoCBOk2rKTz95UiXuMpBoeMUJ0sPgFbjUctI3
	IW9pA4BZ3z5HGcWwewmJo5jlo5kzpCl1qo+S5pxpoc8K3FTGbO6nNnNzuZtog+5M7umlSCUtZHvMX
	rDtW7Y+jVbrGb+gMDntnVkwuupHQ9DNsndUGz7w8CN9kDILCtJaUu5g6hejlVprk7V1iSirdL83LH
	uDzFlDSH9RZFuSCHk1/mwIuT4uNpAO1RY+KwiJ48qo98dcSYBv1GGLMjLSmrwgjscDnuzQxtiKPZh
	wIEcHCILjoFMCxsKnBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNH-000000020eT-1Nge;
	Tue, 29 Sep 2026 01:11:15 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0Mi-0000000CoAP-0mas
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:29:05 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-532e9ad9a1eso202641cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 00:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321342; cv=none;
        d=google.com; s=arc-20260327;
        b=XuTOJBCUPzH7ClDZr7roCkGsrT3EoNR1kxo0IVQ6iBZVbbkmfV1Zdg2N99vuWMMDjz
         8nOx9DFYtN7pBIk1ycGZgFpXTT6wQ2KBw9w8hG8zOP78HylpAcMp2M/GfV7xvaM62EFl
         yAUgN/MOlvTozqiOftYQbgTGyn1ouowzVweH9uCCRN/MIa7e4tBg1J+l5Li2k4FS6eRx
         rP50K/Ui+g0dbCHe7f0KJC2QpvgcsQJJqQL1Gs73lkRnOovbO1y6HmFdnkVUmDNMZepE
         E/FsheJ0sXbTwjl277/otvkFFNt9Ltr/lm0M1/9dFsIE95c1y87fu6zgcTb3m9FQrcEj
         10Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        fh=KLE6sUBbsAZ+yrVyW65ZzV0qXoK56HfFIrh84EyS4LQ=;
        b=gZ9nxcztK7rXg/z0nh+BOnMjynelu2ovlpAye4tdHVLZ14NTH2+j2zxV1gJdINk+iq
         XxzciWqBVXUBsr9sHXwUAaHeaIbEpVMQeA8gi9fXDiWderCFZpV36+5upNg1dpEDJFEm
         X0Si626Lr/3e/SyzadWRHXLEQdeYdJU/nVinxWoHhMx7qX7+jLW4ya9BMpOcF7WsMebs
         Lt99DT1l7cvdsZzPIqi8Iosi5KzMK9LNo8RwoJEALETtzX63x13ruefw0yqhGCGeFjIR
         hISTSmiuRv4RA9qn0Xq5XVJDqT8+ra6YwuR9ZVyjdgmvdZ4Qp0gQ4DIlo1nlJFOL+3Rn
         wwag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321342; x=1790926142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        b=gvKezrDZ13f7JZTvv1qfiJnyqVUkY2e3jNKsL49JpAe91oRSow93tfjGjWysHYnzHU
         MIBn2hyKF4UTutw8CEeDGRUFl08fFEq9YODusluMG1ViiAEPFQy7/7N8hJ7DRi4XeBLT
         7EY7exsupauK9ahhQypMF0HF4NlbeyTMABVXtiAeYpg9t+yStnf7tJuzK+/0v8NANPPM
         s5WJPf7NkkE+YHAi19M0bUlZsLQ28CFen2R8vRBU02HJG3CFZ5Qz0wm7qKdPSG+cIW57
         Q1ddyr4BmsOglenfOapwG2ikQnCym8NxMAghb+5jUJ/6d9RO08qN4fFLUHlIE3WG7pH6
         3JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321342; x=1790926142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKlx39bvD+La1fyAAMePfYRq9L+0k8EzNqVplWKbJoQ=;
        b=PAhZM8HNp3UcAmuW+x5Ys0LCH/A0HstMrX397Xoh8dVvrKWbJOTbDwTZdD00WJpvoO
         50kyppKUjBD6JCcfFiPVLP4QzwUNY7glTGA0QIkQu/4WQRGCCIUnvo7T0wmZXRKECnc1
         7nJEUVVi2gEcJjHUnyMB5w+jxoH98tgBsnFIpJCUS3opx4H2xg+Rjb3o1El3Ur+3MyIS
         fvpDUXVCo4/jTWSdOdo0pgFKULa5Cp+ub7EsRAD667HfFzG73TyiNxZvUjjlaifJz7Kt
         rmyuJ+5s+7fsYe/g96By1XjnIAl578VXXMuIuqNLT81q4EE390iSOliMZETZ64LC4XcC
         Pvkw==
X-Forwarded-Encrypted: i=1; AKwUvBwx2B42hlhIluBHaA951wCpvgBynweUrGxK7hvqw1ITHBKFWYOCO1mrsGZ5UwUqZejp5K4LdPZc3YCEEg==@lists.infradead.org
X-Gm-Message-State: AFuF++lvN5pmEO1maHgbGeJzEvWobiZ2cWRW6Mb/gx12PfdzEXuOwblZ
	RSYwy/J0wc3DqxnhPB1J408oL6Yiqqrl9MvftYgZQwLvSsPn0ih++sYCK1QW+UzSSwm6gbNZlAj
	npFHpNCGoHQONBhr4Gx8JMBhYVdUpr0yM7wmddFiW
X-Gm-Gg: AYBFou2k8Y9HGgG/godXEKwoHj+tP/wnErZy1o0O/vOo7eI7+AlypzDCke9WwvwIvA5
	Q2n5/wb5xTnp8fX4o+yVpiYUqA6lsuMdMezjXo+TGDpO9YTKmwg9tEbsjmLNfsjk8pM1Sr0eDfU
	+57MbzXTHCNGxRdfJXznTb4HzJ+whxT/4Lcve3dlRrs+qG9VqLCeetdChCgrFFjJufhkJWsp0zC
	MHlo6AD2UXJJ7hp8r9Nt/3uwUSW1Hj98aswB6QHHsZL1hK6GbKRLqIXiJBufvFpKXAzWSEXD4wX
	woLCscFwyEQrtCZ3iFycokYfvaLGcFhp03nkWErB9kzLSk2lyqZdsg==
X-Received: by 2002:a05:622a:4c15:b0:531:d8:e437 with SMTP id
 d75a77b69052e-5330e1083a8mr8850471cf.7.1790321341004; Fri, 25 Sep 2026
 00:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:28:49 -0700
X-Gm-Features: AclHuK8wpU_boMBtoQ2BxSfl48UrjTg974xy2tCF5bv_vM_I_Kq5OyVf7aIl6LM
Message-ID: <CAJuCfpF2U9rgHmhaDoXX1hxsuuS=s-oWK9Nk19TDQ6CLpjhFVA@mail.gmail.com>
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_002904_278051_BA160B24 
X-CRM114-Status: GOOD (  25.57  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgOToyNeKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gV2hlbiBhIHVzZXIgcmVxdWVzdHMgYW4gbW1hcF9h
Y3Rpb24gYmUgcGVyZm9ybWVkIGluIG1tYXBfcHJlcGFyZSwgdGhpcwo+IGludm9sdmVzIHBvcHVs
YXRpbmcgdGhlIFZNQSByYW5nZSB3aXRoIGRhdGEuCj4KPiBIb3dldmVyLCBpZiB0aGUgVk1BIGlz
IG1lcmdlYWJsZSwgaXQgbWlnaHQgdGhlbiBtaXN0YWtlbmx5IGJlIG1lcmdlZCB3aXRoCj4gYW5v
dGhlciBWTUEgd2l0aG91dCBoYXZpbmcgcG9wdWxhdGVkIHRoZSByYW5nZS4KPgo+IEV2ZXJ5IG1t
YXAgYWN0aW9uIGN1cnJlbnRseSBhdmFpbGFibGUgc2V0cyBWTUEgZmxhZ3Mgc3VjaCB0aGF0IHRo
ZSBWTUEKPiBjYW5ub3QgYmUgbWVyZ2VkLgo+Cj4gSG93ZXZlciwgdG8gZW5zdXJlIHRoYXQgbm8g
ZnV0dXJlIG1tYXAgYWN0aW9uIGZhbGxzIGZvdWwgb2YgdGhpcywgYXNzZXJ0Cj4gdGhhdCB0aGlz
IGlzIHRoZSBjYXNlIHVwb24gbW1hcF9wcmVwYXJlIHZhbGlkYXRpb24uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6
IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBtbS92bWEu
YyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9tbS92bWEuYyBiL21tL3ZtYS5jCj4gaW5kZXggZDZlZDEwY2VmYzhmLi42MmYy
Y2UxYWQ1YTEgMTAwNjQ0Cj4gLS0tIGEvbW0vdm1hLmMKPiArKysgYi9tbS92bWEuYwo+IEBAIC0y
ODA5LDYgKzI4MDksMTUgQEAgc3RhdGljIGludCBtbWFwX3ZhbGlkYXRlKHVuc2lnbmVkIGxvbmcg
cHJldl9zdGFydCwgdW5zaWduZWQgbG9uZyBwcmV2X2VuZCwKPiAgaW50IG1tYXBfcHJlcGFyZV92
YWxpZGF0ZShjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpwcmV2X2Rlc2MsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpkZXNjKQo+ICB7Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogSXQgaXMgbm90IHZhbGlkIHRvIGV4ZWN1dGUgbW1hcCBh
Y3Rpb25zIGZvciBWTUFzIHdoaWNoIGNhbiBiZSBtZXJnZWQsCj4gKyAgICAgICAgKiBhcyBhbnkg
c3VjaCBtZXJnZSB3b3VsZCBsZWF2ZSBwb3J0aW9ucyBvZiB0aGUgbWFwcGluZyBpbmNvcnJlY3Rs
eQo+ICsgICAgICAgICogdW5tYXBwZWQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmICh2bWFf
ZmxhZ3NfY2FuX21lcmdlKCZkZXNjLT52bWFfZmxhZ3MpICYmCj4gKyAgICAgICAgICAgV0FSTl9P
Tl9PTkNFKGRlc2MtPmFjdGlvbi50eXBlICE9IE1NQVBfTk9USElORykpCgpBbnkgcmVhc29uIHlv
dSBjaG9zZSB0aGlzICJpZiAoQSAmJiBXQVJOX09OX09OQ0UoQikpIiBwYXR0ZXJuIGluc3RlYWQK
b2YgYSBzaW1wbGVyICJpZiAoV0FSTl9PTl9PTkNFKEEgJiYgQikpIj8gVW5sZXNzIHRoZXJlIGFy
ZSByYWNlcwpiZXR3ZWVuIEEgYW5kIEIgdXBkYXRlcywgSSB0aGluayB0aGVzZSB3b3VsZCBiZSBl
cXVpdmFsZW50LCByaWdodD8KCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsK
PiAgICAgICAgIHJldHVybiBtbWFwX3ZhbGlkYXRlKHByZXZfZGVzYy0+c3RhcnQsIHByZXZfZGVz
Yy0+ZW5kLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVzYy0+c3RhcnQsIGRlc2Mt
PmVuZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwcmV2X2Rlc2MtPnZtYV9mbGFn
cywgJmRlc2MtPnZtYV9mbGFncyk7Cj4KPiAtLQo+IDIuNTUuMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
