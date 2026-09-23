Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E298CA5FB4
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ait05iCzOywxrtv5udgoljGvy+qjvl2C40qdA3e/vnQ=; b=ENojdY2e7/koWL
	tBNMzSG4OE8kepLL2d4au8cgN/wGEm0YUr/Y4fN/HtEd2KK4/CWBstQlcTJDxRMu+HLIMBEWPrddK
	0b+ujzdBqlIWjcWS9YCUIqDvB8tWMXFE+0ZzRL+oihwF7iyBDdx754T2FvdlMPiSJ2kn79hcROc8a
	n1TcZRi9LIRq14EftzV26CeiNktB+NT30qsuBxK068Z7BqsxzkOYrdDtekdYYQSMiPh0L7y+SYDy+
	QvWifKWAKIgMNFs7BhSocylCABCLR4a+7+yy/d+ulxy8pITyUtC59nGfqE2oKE9b7t3Xuk5tELEKs
	4a020odUWEEOzqOAQFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNG-000000020e7-3aHm;
	Tue, 29 Sep 2026 01:11:14 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oxt-00000008kNc-12Bv
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 15:32:58 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-52faa58bff5so263791cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 08:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177576; cv=none;
        d=google.com; s=arc-20260327;
        b=cpikKlynrlbYl8r6+e50vBaByHLekYcHYW3G/WM0kQa8Sa3IumWmLOuzJYpcGiXx/G
         GYEX9tCncwnf6sVkYzvQdTk6xgcncj+QAziikPOnEaaAmnWvhXOdN6WV/hbW5Z14fMZA
         jXMdhJwrehGojh/HWn43efQBtGIE3yo7fAlnGrRWvgMkpILi4SOcuQeBlFJsT9+yfgO+
         r2vy/3pwoJwn5MYmFLH4mTnZvZ7/zp4KotARGYuUr1gkqqUUgMU2SP53jUCm52W7EvuK
         PyL6f9Zu1630PpKufOngdofvyWio1qxKHgArRjqBrhWsNeFbAs7I2YjsqYbahf30SGXl
         Hn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        fh=dSWu5GtRO6/V2FqjRNiRcAfameHgUpC8s1a8P1pMqto=;
        b=hPTDk/JUXB7iWN17L4LaT2zJ+A5NIEkydWAslL4ThqVQSQxStLgKP7G+HaHZMASq80
         Rjon6fgG5iwXKf9zIBEh3wD3kv61+0z2WgcNARwOM6A3vdsDg5v9BK+gUvvsxhwigW7G
         BUnJ0dbvc0//sWPqjim38snA368a5xRNhygqYbGsh5ZytP9mMAsxoJUrPDa6Pl+dM16p
         m4abOlt5ckHDltHFK2qDAcuIPL2LtrnpMOfyBiadawXVswW1U8la9DpaFpI2u/icAPcO
         z1QycCab5vFLIWo/ubNVvREdNLt/PmFPi2GGLpdRZFQ67/1lF8Tt6HLDXJaDS48UCk41
         fWSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790177576; x=1790782376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        b=jZpj0kIjhk7/C8z9++WTxRhH7jLp+o1E30z76tpy41q/hJcd4s6TA87m7pn/Q0omZa
         dK3ncI1ov9Mqpa7nKPP1IAtMzci6JbWwuH/wGIrm11n2CQ+wzsG0ACnx+qf4fP7bgnrv
         Hxlcpb30v9nZ+3KsShkOZ9PLWRa4cxbNIyu8d4q6QkJJRhFStNoEQbKBuyjLiic8XAuy
         b+vKuc0j+xaDSdsemJWJpmdVBSollDZ45nThgzhGRexjLfpbYgqSrFtr0r/ACfxNAqMi
         Ca1uAVicqIsBBx/A7qaBUEEbQpneK5unO1FSzu1IAydkdW1fOu1ggof8kfwOOM0EyM8H
         zstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177576; x=1790782376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKtcWNVFda3wl86zaKIN0hpMLzWuZcmeXVfEC0xSzRI=;
        b=RFzHepe/3NG4cPbEnrP3TfEQBU7qRPKUkjv0SqJ67X+7xBswsyV23mpSWUTzm5ytlh
         24lAAER0GEwic6lmdpVyY4RNg+PU9lMLWQjqBvvXv01rCyUsUjpm8EjscS63It61NF6p
         7+pV/ei0PsE0Z9SzGw0FK7dn8VVChpNwyLoVdwWpAjK0hOVAlrYJSOR77BYx8smC/8Bn
         0vxSqXhY5h1B1oapOw8i7S/RzmAnupsrzqNIo+QjK+LU1HRwXKf9iqWpByBuO31ztgRe
         i0GCpRtuCp8xZ9sgPlO7ZE9QY6txRu+xVnoKzo0ZmxzQRT3c+plamwh9kg8n0/E2hDfd
         Znkw==
X-Forwarded-Encrypted: i=1; AKwUvBxXZPPMLPC2W8Jmx9sFq3gFCDL7UYSRTSL7nou9MGv/nl/GKFOnperXb2qBnQXAUr/WBasabC08GttWyQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n6J9B3GrhdkQQWmoeLfD0YeFUgith1lKNB+w+KxTfWCJz+Qf3u
	aoeUmiqFgSj4R6mtqA3l4rxIBu/zBF6gmtF5Txp+AX1uLXR58bCq5aTXTqbx+HmVz6feEx7hmYU
	pQpBRIK3HcVVkwVsv72Db3R0CDnmmLlnaVq5JjjGh
X-Gm-Gg: AYBFou35zlTa2BXE/hos1TooRVgQI0Uq4No8R4fTqwrsC9RcTjkgznNsAq1fYHbGJbS
	i9u7FjCrwwYrcx+t8OEqN2VD6sRDcwL5sGM3vLs4W98OilVgLY5MeH4nx6DIK5FRYkbqw3jS+Lh
	zUqIQCLu1vFRTYHRlSRPuLcMcqsQ6pOe3LJs6z7Gm0VU6pxqCulhcg4yUIFhi1U3p0OcyfLdDEL
	lJ9czl6Fu4uOj6JiR5gI1p9IODoNSfGnw/bkpZLcHoQzGwbNSSysx1dKhxI3tyQEnD5ubB7f4jE
	z48CCQkuOO5i9WwTrbwd+8/UpsfmSObr7vamDHw7qhLb45RtWD4dDpe2esf//aWotEV0QmY/THm
	LU/FtL7qZtQ==
X-Received: by 2002:ac8:5f13:0:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-532f8eef5afmr573491cf.10.1790177574693; Wed, 23 Sep 2026
 08:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 08:32:43 -0700
X-Gm-Features: AclHuK8Inh8u6lJouEWaJf_8_dOxdEc__Ja8ROlufrRS70N8N3MQ9iMsAEM4G5I
Message-ID: <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083257_297159_139CD280 
X-CRM114-Status: GOOD (  24.06  )
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
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSXQgb25seSBtYWtlcyBzZW5zZSB0byBtYW5pcHVs
YXRlIFZNQSBmaWVsZHMgaWYgd2UgYWxsb2NhdGVkIGEgbmV3IFZNQSwKPiByYXRoZXIgdGhhbiBt
ZXJnZWQgaXQuCj4KPiBWTUEgbWVyZ2luZyBkb2VzIG5vdCBjb21wYXJlIHZtX29wcyBvciB2bV9w
cml2YXRlX2RhdGEsIHNvIGEgbWVyZ2VkIFZNQQo+IGtlZXBzIGl0cyBvd24sIHdoaWNoIGlzIGFs
c28gd2hhdCB0aGUgbGVnYWN5IGZfb3AtPm1tYXAgcGF0aCBkb2VzIHNpbmNlIGl0Cj4gbmV2ZXIg
dG91Y2hlcyBhbiBleGlzdGluZyBWTUEuIFByZXZpb3VzbHkgc2V0X3ZtYV91c2VyX2RlZmluZWRf
ZmllbGRzKCkKPiBvdmVyd3JvdGUgdGhlIG1lcmdlZCBWTUEncyBmaWVsZHMgd2l0aCB0aG9zZSBz
ZXQgZm9yIHRoZSBuZXcgbWFwcGluZy4gSW4KPiBwcmFjdGljZSB0aGVzZSBhcmUgdGhlIHNhbWUg
dmFsdWVzLCB3aXRoIHJhcmUgZXhjZXB0aW9ucyBzdWNoIGFzIHNobWVtCj4gc2VsZWN0aW5nIHZt
X29wcyBiYXNlZCBvbiB3aGV0aGVyIHRoZSBmaWxlIGhhcyBiZWVuIHVubGlua2VkLCBzbyBubwo+
IHVzZXItdmlzaWJsZSBjaGFuZ2UgaXMgZXhwZWN0ZWQuCj4KPiBNYWtlIHRoaXMgZGVwZW5kZW5j
eSBleHBsaWNpdCwgYW5kIGFkZGl0aW9uYWxseSBjb25zdGlmeSBoYXZlX21tYXBfcHJlcGFyZQo+
IHdoaWxlIHdlJ3JlIGhlcmUuCgpUaGUgZmFjdCB0aGF0IHdlIG1pZ2h0IGJlIG92ZXJyaWRpbmcg
YXR0cmlidXRlcyBvZiBhbiBleGlzdGluZyBWTUEKdGhhdCB3ZSBtZXJnZWQgd2l0aCBpcyB0ZWNo
bmljYWxseSBhIGJ1ZyBldmVuIGlmIHdlIG5ldmVyIGhpdCBpdCwKcmlnaHQ/IElmIHNvLCBzaG91
bGQgd2UgaGF2ZToKCkZpeGVzOiBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5ldyAubW1h
cF9wcmVwYXJlKCkgZmlsZSBjYWxsYmFjayIpCgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBT
dG9ha2VzIChBUk0pIDxsanNAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFz
YXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgoKPiAtLS0KPiAgbW0vdm1hLmMgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9tbS92bWEuYyBiL21tL3ZtYS5jCj4gaW5kZXggZmE3ODRmMDY5ZGE0Li40Yjc0YjQ4
YzI5YjcgMTAwNjQ0Cj4gLS0tIGEvbW0vdm1hLmMKPiArKysgYi9tbS92bWEuYwo+IEBAIC0yODk0
LDcgKzI4OTQsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX21tYXBfcmVnaW9uKHN0cnVjdCBm
aWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSA9IE5VTEw7Cj4gLSAgICAgICBib29sIGhhdmVfbW1hcF9wcmVwYXJlID0gZmlsZSAmJiBm
aWxlLT5mX29wLT5tbWFwX3ByZXBhcmU7Cj4gKyAgICAgICBjb25zdCBib29sIGhhdmVfbW1hcF9w
cmVwYXJlID0gZmlsZSAmJiBmaWxlLT5mX29wLT5tbWFwX3ByZXBhcmU7Cj4gICAgICAgICBWTUFf
SVRFUkFUT1Iodm1pLCBtbSwgYWRkcik7Cj4gICAgICAgICBjb25zdCBwZ29mZl90IGFub25fcGdv
ZmYgPSBhZGRyID4+IFBBR0VfU0hJRlQ7Cj4gICAgICAgICBNTUFQX1NUQVRFKG1hcCwgbW0sICZ2
bWksIGFkZHIsIGxlbiwgcGdvZmYsIGFub25fcGdvZmYsIHZtYV9mbGFncywgZmlsZSk7Cj4gQEAg
LTI5MzcsNyArMjkzNyw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fbW1hcF9yZWdpb24oc3Ry
dWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAgYWxs
b2NhdGVkX25ldyA9IHRydWU7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGlmIChoYXZlX21tYXBf
cHJlcGFyZSAmJiAhbWFwX2lzX2Fub24oJm1hcCkpCj4gKyAgICAgICBpZiAoaGF2ZV9tbWFwX3By
ZXBhcmUgJiYgYWxsb2NhdGVkX25ldyAmJiAhbWFwX2lzX2Fub24oJm1hcCkpCj4gICAgICAgICAg
ICAgICAgIHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcyh2bWEsICZtYXApOwo+Cj4gICAgICAg
ICBfX21tYXBfY29tcGxldGUoJm1hcCwgdm1hKTsKPgo+IC0tCj4gMi41NS4wCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
