Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453A6CA600A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwKVHVhrsif6q7PljQZGNT5bEUXYevNSg32Ngky3dW4=; b=IQhoQzq2Rn9GeL
	8pcV/9vaAmKxhI8jXVfDXal05EvDVY8Bx1sDDE0qtSooaMC/MesvxDROnnd1EhdWI9L5BTbGfJ4GY
	k3xb6h68hOHjvgF8ZYezmQkcz8UfiEQ3n/uHDQoDah92X/AD0frH880O5Y6vtlzgMSFNsExpu0qfS
	W2afOBO2IYLPOFJLAmAm5rum8fqamc28IJwObGGugMfot41PInsHjbgQHairB0eNLnZxFfk7bwGA7
	gXsM6CbxVflzpEMW3tFC/kusckUqrJ08muNBeJdI12c1ZJ7wK60Mxf8qpDeHMSSJ3TMrPdaAc3itm
	AS0UHl+j7UmiQeaVEBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpw-00000002sr1-1QGg;
	Wed, 07 Oct 2026 17:53:52 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQej-0000000F9c0-0tQt
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:09:51 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5337fa12431so185341cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791137388; cv=none;
        d=google.com; s=arc-20260327;
        b=LFtgbYe/X4Jx5eAQca9khVGbfAu3C/z8Ni9/7+ji5wNh4EKhwrJ5YQKoWjeaLhOqzL
         rklu/7g6O3R61UZUMTNCjxG+pDR2QnaNf0+oK8DZlXotEQt4W9BXTc93KgV7XUYrl8jZ
         V0t75Klw0Ncw0eJ7eOnnb4zz6DgBpbtTUPeZ3heNcK2J/fdGyAE0LZ6xxTcg4u1UEGm7
         zemsZl/zQqtMrp0Wg0gaeFXAEhmD4wnD1eKd6AIjmTuhdR4Czbp/SjSxYbUUAPtusUGh
         RhpkXaBijgdCTRBcPhcujf2BuAq5pgD1miJynR4cTIhrfISP33tjtN0HrzARZf6BHlhI
         PtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        fh=26m3q58aAIrEAd/z1y/oO1gdBrqYWgd/u5afHSATD1k=;
        b=kFpNrgAZSHL7OIyaLtYSISEC5JIZF31DFfeZUw/P34dTANAgLvrjMRAE4Fha1jCJSI
         yDYdOIXg5bjQCySvCADMoeJWsMH+XDUvu/Y8Sn7kr0YIGxOgQj4SURF7Wx5M8+aRQ+SF
         07k5A7V/XF0BClSBmmaO9wxeR1Symbeqa8OpmtMNPh+/9aU3tYHHuwZGzsJBxqX7Nquc
         zyeAEZJwrU6A+5WMm+8pYlePICkL8d0nYxLM4rsQOw5cRanXsGa2iNMurA+RcdhLx31T
         Lras9bxTpQmfn7Kn8dUrOTd589FH3h2wAYbz8BcGpwfITC7qcLhUUQDCRqZb+FAKjJ7T
         jajA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791137388; x=1791742188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        b=YlXjEmadMb5PEe12T5JVQhvkIeTD8sK45dYgNfW4m0j5JWuhHMJDS/pHne6xrFD8QX
         OobhhBYYDZZDpoe8VxPpQ1TxRRJRVe/abfVf12B519+Aj4jHX56C1y4ZpqOQKxTl7tjv
         60comKGZMYJ09YYmF7w9krh5Dnq+tReyszVuYSosqS4OHhFr9gAx4dFLazO7W275vzHC
         zG9hhzVVWKxPfYMZ7Fc8qpEjUrh7ccLZgg1TvOwbzqP58T+UEY9vZ0uGA19ItwJx9OPF
         FhpB74cGq7RXZc1SC3u87VVk/f4kj+nV7sdPrpXSYfr6jyxnDGz6jCRnFdUxE1U7a8DG
         lvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137388; x=1791742188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        b=xHbbZTuEtJiwU+jmM15AIUX2ZZBihrM3x19QwZHCcXZt2xbF+YZ7Q+TTr8a9yrZFR1
         AWPu7gYG5RNNi0kHdba8zFr2Hl9bipLsOH1OZW8Ha1C+b0Mw7tfvHcNJQ9rh5F8tTQaf
         kT3NKLstBlOidptj9d1HrrbdUH9k4SsuXWFhAD6JdlxoTfyUup7DHrsdRcbd9YxZy4Fz
         PbgPh/e3vxvtQhnO7s7bG76UGlhZj8C6ZG/qUBvzKMEGd6Hj9j6pXP94CH1EPAHplaRo
         Dd3ODlDkSXoacPKhXOIGqD0KV1upElmIgIQ1BjxzvcOQYMDjfI75TEx3NcgurHdrtoXy
         Rb1w==
X-Forwarded-Encrypted: i=1; AKwUvBxGOX6S8gHAnFLap+JYyNHRieEoF3gagbUsxm1O3ICnizVtkmZucq4+/X+r6ks+T0TGmcB37UOZhWPEpw==@lists.infradead.org
X-Gm-Message-State: AFuF++liuK64kI1X2DBHPiVjIvxAzAb8zYQ+gVfwNDp6AXwsmhol6VlQ
	4SPCwDrhS2qAY9iYNHR0zkqvcSbJy/4vedg17iODwrqWIVIZmFdl+IkvHGCGiaPW4tccpx1DHoq
	H40PpAfy46puQtPr5J1gbLYjJTID5wGOAiv4jTSU3
X-Gm-Gg: AYBFou2S2iHL+0TmIltUGVVP30HW5+XFzBah+4TApV73iOu+d5ndQO8pfihkDh1c6ju
	fHSLZRQ1doa6dfnBmrA0EHPPAK4jlmt0Y9qX1yDcPHs8SXnzK2JZK+eHtlPSUtnFsXspBRTPXSR
	vCdze+LbEuunKqxlE4zGHvG8U9FqeZ6gHptXR2Q24/KuR+4WlwjTKZh1EX1rYbRgerXEb2MfxJx
	KuBF1NiDCrrb7+IsKkZFK3SIDub+XwEX6SrDSjSx2xOxq7w9ishwtVi2/pbPv62jzNnNEQXEFpo
	U0/l0zYkdmxq7/O9RwtKXV1Q0acRWUJuaTJk21zS2JGF4LkYbc+lIvTr
X-Received: by 2002:a05:622a:e159:10b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-535146449camr14146121cf.14.1791137386702; Sun, 04 Oct 2026
 11:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-19-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-19-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:09:35 -0700
X-Gm-Features: AclHuK-kwJ_Uo7kW-aV-ulJRzQPF_vjK2tdCaS-4gRgk6ACv9UztvH0OKE8MWEw
Message-ID: <CAJuCfpFKJ+31TZOWhwoTQTseOEy0AgAjz5eK9fdXmL40D0OY6Q@mail.gmail.com>
Subject: Re: [PATCH v4 19/38] HSI: cmt_speech: convert mmap hook to
 mmap_prepare, refactor
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_110949_276099_C88320BA 
X-CRM114-Status: GOOD (  24.92  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM54oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIG1tYXBfcHJlcGFyZSBpbiBmYXZvdXIg
b2YgdGhlIGRlcHJlY2F0ZWQgbW1hcCBob29rIGFzIHBhcnQgb2YgdGhlCj4gd29yayB0byBjb252
ZXJ0IG9uZSB0byBhbm90aGVyLgo+Cj4gU2luY2UgdGhpcyBpcyBzaW1wbHkgYSByZWZjb3VudGVk
IGtlcm5lbCBwYWdlIHRoYXQgaGFzIGJlZW4gYWxsb2NhdGVkLCBpdAo+IHNob3VsZCBub3QgYmUg
bWFya2VkIFZNX0lPIGFuZCBzaG91bGQgYmUgaW5zZXJ0ZWQgdXNpbmcgdGhlIGtlcm5lbCBwYWdl
Cj4gaW5zZXJ0aW9uIG1lY2hhbmlzbSwgc28gY29udmVydCBpdCB0byBkbyB0aGlzIGluc3RlYWQu
Cj4KPiBVc2UgdGhlIFZNQSBkZXNjcmlwdG9yJ3MgcHJpdmF0ZSBkYXRhIGZpZWxkIGFzIGEgc2Ny
YXRjaCBidWZmZXIgdG8gc3RvcmUKPiB0aGUgcGFnZSBpbiAtIHRoaXMgc3RheXMgdmFsaWQgdGhy
b3VnaG91dCB0aGUga2VybmVsIHBhZ2UgbWFwcGluZwo+IG9wZXJhdGlvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1i
eTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBkcml2
ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYyB8IDMzICsrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYyBi
L2RyaXZlcnMvaHNpL2NsaWVudHMvY210X3NwZWVjaC5jCj4gaW5kZXggNzIyNjY3N2ViZGU3Li44
MDE2OTdiNzRkNGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oc2kvY2xpZW50cy9jbXRfc3BlZWNo
LmMKPiArKysgYi9kcml2ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYwo+IEBAIC0xMDg0LDIy
ICsxMDg0LDYgQEAgc3RhdGljIHZvaWQgY3NfaHNpX3N0b3Aoc3RydWN0IGNzX2hzaV9pZmFjZSAq
aGkpCj4gICAgICAgICBrZnJlZShoaSk7Cj4gIH0KPgo+IC1zdGF0aWMgdm1fZmF1bHRfdCBjc19j
aGFyX3ZtYV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiAtewo+IC0gICAgICAgc3RydWN0
IGNzX2NoYXIgKmNzZGF0YSA9IHZtZi0+dm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gLSAgICAgICBz
dHJ1Y3QgcGFnZSAqcGFnZTsKPiAtCj4gLSAgICAgICBwYWdlID0gdmlydF90b19wYWdlKCh2b2lk
ICopY3NkYXRhLT5tbWFwX2Jhc2UpOwo+IC0gICAgICAgZ2V0X3BhZ2UocGFnZSk7Cj4gLSAgICAg
ICB2bWYtPnBhZ2UgPSBwYWdlOwo+IC0KPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4gLQo+IC1z
dGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGNzX2NoYXJfdm1fb3BzID0g
ewo+IC0gICAgICAgLmZhdWx0ICA9IGNzX2NoYXJfdm1hX2ZhdWx0LAo+IC19Owo+IC0KPiAgc3Rh
dGljIGludCBjc19jaGFyX2Zhc3luYyhpbnQgZmQsIHN0cnVjdCBmaWxlICpmaWxlLCBpbnQgb24p
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCBjc19jaGFyICpjc2RhdGEgPSBmaWxlLT5wcml2YXRlX2Rh
dGE7Cj4gQEAgLTEyNTYsMTggKzEyNDAsMTkgQEAgc3RhdGljIGxvbmcgY3NfY2hhcl9pb2N0bChz
dHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKPiAgICAgICAgIHJldHVybiByOwo+
ICB9Cj4KPiAtc3RhdGljIGludCBjc19jaGFyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50IGNzX2NoYXJfbW1hcF9wcmVwYXJl
KHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiAtICAgICAgIGlmICh2bWEtPnZtX2Vu
ZCA8IHZtYS0+dm1fc3RhcnQpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgICAgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxlOwo+ICsgICAgICAgc3RydWN0IGNz
X2NoYXIgKmNzZGF0YSA9IGZpbGUtPnByaXZhdGVfZGF0YTsKPiArICAgICAgIHN0cnVjdCBwYWdl
ICoqcGFnZXMgPSAoc3RydWN0IHBhZ2UgKiopJmRlc2MtPnByaXZhdGVfZGF0YTsKPgo+IC0gICAg
ICAgaWYgKHZtYV9wYWdlcyh2bWEpICE9IDEpCj4gKyAgICAgICBpZiAodm1hX2Rlc2NfcGFnZXMo
ZGVzYykgIT0gMSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAtICAgICAg
IHZtX2ZsYWdzX3NldCh2bWEsIFZNX0lPIHwgVk1fRE9OVERVTVAgfCBWTV9ET05URVhQQU5EKTsK
PiAtICAgICAgIHZtYS0+dm1fb3BzID0gJmNzX2NoYXJfdm1fb3BzOwo+IC0gICAgICAgdm1hLT52
bV9wcml2YXRlX2RhdGEgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gKyAgICAgICB2bWFfZGVzY19z
ZXRfZmxhZ3MoZGVzYywgVk1BX0RPTlREVU1QX0JJVCwgVk1BX0RPTlRFWFBBTkRfQklUKTsKPgo+
ICsgICAgICAgKnBhZ2VzID0gdmlydF90b19wYWdlKCh2b2lkICopY3NkYXRhLT5tbWFwX2Jhc2Up
Owo+ICsgICAgICAgbW1hcF9hY3Rpb25fbWFwX2tlcm5lbF9wYWdlc19mdWxsKGRlc2MsIHBhZ2Vz
KTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtMTM1Myw3ICsxMzM4LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgY3NfY2hhcl9mb3BzID0gewo+ICAgICAg
ICAgLndyaXRlICAgICAgICAgID0gY3NfY2hhcl93cml0ZSwKPiAgICAgICAgIC5wb2xsICAgICAg
ICAgICA9IGNzX2NoYXJfcG9sbCwKPiAgICAgICAgIC51bmxvY2tlZF9pb2N0bCA9IGNzX2NoYXJf
aW9jdGwsCj4gLSAgICAgICAubW1hcCAgICAgICAgICAgPSBjc19jaGFyX21tYXAsCj4gKyAgICAg
ICAubW1hcF9wcmVwYXJlICAgPSBjc19jaGFyX21tYXBfcHJlcGFyZSwKPiAgICAgICAgIC5vcGVu
ICAgICAgICAgICA9IGNzX2NoYXJfb3BlbiwKPiAgICAgICAgIC5yZWxlYXNlICAgICAgICA9IGNz
X2NoYXJfcmVsZWFzZSwKPiAgICAgICAgIC5mYXN5bmMgICAgICAgICA9IGNzX2NoYXJfZmFzeW5j
LAo+Cj4gLS0KPiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
