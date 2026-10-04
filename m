Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D314CA600B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1zy8hkukfW2JU8m9rcXSPubJ3dhp23yXh7FEFvOSKw=; b=1BTnOS2ExSD9mG
	JDJirVVahK7cMr3NGr4aQGazPAlM7qB9QuIrY/EmB7hPuSGxmyFaVGs1oI+TavsXttqcsHZD4L4JB
	HbYWffby3ZvGR/5NX4MRGG5pDosOETk4E9koz7y+VrLzNqFF6xOR7/8+FUDWCorEU/WWAuy3Af4sL
	SAbiyMd6NJufUf4GHKZHSCp89d3rMJpHmkGSF5YZuPXyBI6wZ0q4Nu2Kzmh23hMuTOIALvji+svrL
	OHJgvgFrFg6icM+IJNPvW/aO7oFLt+AoFGVSafvVw/riTply5MMQ4jjI1AwC5WgcXecuK8d0KP/z5
	BVRi9JwAGFgIuKVV9gLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVq1-00000002t5q-0SWY;
	Wed, 07 Oct 2026 17:53:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQso-0000000FA8x-0u6z
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:24:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso5497a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791138260; cv=none;
        d=google.com; s=arc-20260327;
        b=VJkI2Yw/w6kzHC+egWpez2loV/s5CC8r4VdOYYnnr0R21JBY/3XAl0rafCqRSZojnn
         k2EweszbofLfmYJlDEGmc+Yt5YNqR/YtYyVmzkZeH7RDGhSkddhXoalHXnlEv1ayws0o
         Pe/nfPjmFOIYbnmFTFSRX8RgTY8rolK86JB+g8FjCA6AamWrx1g4TAMYksOcM77zEH+F
         ICgKWxGwFfb3dMapglVl37JU9CnagNL9nzA4j+ldAO29PmGvU8IYQwD3XCZ5J3BcwGhX
         AAsRXGwnFd7luIBA+fZrHXMaUnyKDeG3ycTVE4MDmofuuGFqtwAheeUzRQm6+9zLMr9b
         AUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        fh=5BKJFUIp701WLvhFhbhthSH1GiQH2ZxG0i4m8qy1LKQ=;
        b=ptvZMMfo4zVa1BQ7Y2pMfwI/mYjgg0WDBWo8RmlgLeEwPa9YDw9PXEZZ+J4sOmvKzF
         Qf9OZxoTTY/3/OOCFKSM5ae9HpLPl8Rw0W3QXQHWdZHyYRDkqLr7VYmu5F1DUhCQK2Fo
         tGr/66iYVYjPyPxVJslNSTfqavzgqT6PVmtbzmUNrf89WYs/DbhYy0U7zBSsZYM9p4x9
         GvAzBkOEv2H5BrOC1Q2aOIukMCceBseVKS9LUtAoEIZgLiZgv9gx9XIy0efV3nyiAExe
         t9G0HYuI9vIB0/y23O4zp+Qrh7B/losT70dqG78hj/kewvysMAc3xdS65k8VxghALEg1
         fH8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791138260; x=1791743060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=tLlmnbx9L8bj6x7rEJIMXg9ufKs95uEC8vboVNVHE60iCMvffsYViwyyEz1eCBx+eC
         l8qwFueNZLYbT2g7DiVA+z8tudY4f4Xz9WL09tuBU4lsKWLKmsSu0tCqH91Q9vWLRKEX
         kCwTBCXLlLMhtOxYK2hUmW6/lV+MGuJLcLjU16341hdYz7psFvp/2xqDlnUlDDPuTBxh
         HVwLg2YPY6sMWvDezJUwVf6TQeI4T75bRglGhtw/hnF/shBQQdloPLg6b6w644/PDMc/
         1xeeABMYhLZRu3mfhWFEgPhlnK4HqVZqrtJ7R4/YqHNTt/I5fFSn9WowueNqnZehUX4L
         k+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138260; x=1791743060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=dAlpEZ9uGvLrb/hbw/sUppZwsNsbIDFBbH9f0H7IIc0KD+ocg3th5AOtCd/cmTkk4I
         qCbowIywuSVwvcuLlDkB03EWLNJ6tDsqtqBDALqpe71OXLu+uDdvSdIkbZswNb1s9FQM
         LW4bJMBl3m2sWyKxRH+Y57AVhfHbuOctB1i6+D4ucy595g8ohd0UB33zhqAwdN15guVG
         qyfsQ3pGx4+EHKZtekTM4IOU7aXexztElUafsS71vIiS/RzzAQRBxrYIrze4eFax58R2
         TQgFPTCPlHDhc0KLjlkYwj3MlC1wfidzwb64j7XZMC81AoAixv29uwnPhEAQFhNxhRQA
         yQJg==
X-Forwarded-Encrypted: i=1; AKwUvBxx6kC+u9MGYaBe6mo7GnS0uZ5fZptrs8whW1TY8p/IQFOFYRFBSnFfmmcKRBhEtKqIUYRUb4BvDHG2KQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEUv0GAeS7XKfJYUpGIqD5ugLp8bzb17w3WuC2kwhcBjTqJjH1
	tA8C4Lh4nwDlE8VLNaW4b2uL9oUEVX6ZgiocvkgP9scynBoDOfJScn9rq/Ld+Ts+bXx1pFJlQSW
	dRJB9K1gYTgzlMPCCf2c5MotzRRgc5GAILBdCyPOo
X-Gm-Gg: AYBFou02Iit3Lh4dltyR6XMrNe0i2frJUXOU/SkTVgvgirA8TbQ7YjG5KABtG523p0+
	P88jYdCmAbNs7FhjQ/iX4Er6V2ehuHXFMdMiXfQzXl/mTS/WCJu3aExt16xotH2TQKQpxYdA+un
	172qa/MRGC/a0gdhGm5GCs17C8v2/DnV7/HW5IN2a7a0mXyjpWyjVR3aCh3i7LpbNaUFVht2mDH
	96jUq/OWbNGTEs+YcL62ijl4Rpk0+hbDfM8UB2m1lU5HyPnT2eQq5JQgBCFKNQg0hdZmqn0OXxZ
	2QJP6xbgTUQEhsftly1zAbD87IxxpzMsxb5uwI1YWIvGrbELxVEgbh/F3AW1eWR+JTQ=
X-Received: by 2002:a05:6402:a2cb:10b0:6af:7a5a:97e4 with SMTP id
 4fb4d7f45d1cf-6afaf6bf03amr34523a12.12.1791138257648; Sun, 04 Oct 2026
 11:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:24:03 -0700
X-Gm-Features: AclHuK9H1gPgFkK4n-5s4Gd8NQjwfuvbGlNRYoPrM6gC5ICSAC1H3Sf5qTdT1bA
Message-ID: <CAJuCfpHOo8UhAZMvO5A3dKbqxQGAWtKGMHXJ+Fc=qwH=Nm0b6w@mail.gmail.com>
Subject: Re: [PATCH v4 20/38] mm/gup: error out early on !VMA_MAYREAD_BIT VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_112422_288816_C79B3DD3 
X-CRM114-Status: GOOD (  22.01  )
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
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBXaGVuIHBvcHVsYXRpbmcgYSBWTUEgcmFuZ2Ugdmlh
IHRoZSBhcHRseSBuYW1lZCBwb3B1bGF0ZV92bWFfcGFnZV9yYW5nZSgpCj4gYW4gdW5yZWFkYWJs
ZSBWTUEgd2lsbCBhbHdheXMgZXZlbnR1YWxseSBmYWlsIHdpdGggLUVGQVVMVC4KPgo+IFRoYXQg
YSBWTUEgaXMgYWNjZXNzaWJsZSBpcyBhbHdheXMgY2hlY2tlZCwgaG93ZXZlciBWTUFfTUFZUkVB
RF9CSVQgaXMgbm90Lgo+Cj4gQWxsIHVzZXIgbWFwcGluZ3MgYWx3YXlzIGhhdmUgVk1BX01BWVJF
QURfQklUIHNldCwgc28gdGhpcyBjaGVjayBvbmx5Cj4gaW1wYWN0cyBrZXJuZWwgbWFwcGluZ3Mu
Cj4KPiBJdCBpcyBpbXBsZW1lbnRlZCBzcGVjaWZpY2FsbHkgdG8gZGlzYWxsb3cgcG9wdWxhdGlv
biBvZiB1cHJvYmVzIFhPTAo+IG1hcHBpbmdzIHdoaWNoIGFyZSBleGVjLW9ubHkuCj4KPiBBIG5h
c3R5IGludGVyYWN0aW9uIHdpdGggdGhlc2UgbWFwcGluZ3MgbWF5IG9jY3VyIGlmIHRoZXkgYXJl
IG1sb2NrZWQsIHNvCj4gYWN0aXZlbHkgZGlzYWxsb3cgdGhpcyBlYXJseS4KPgo+IFRoaXMgYWxs
b3dzIGEgc3Vic2VxdWVudCBjb21taXQgdG8gcmVtb3ZlIHRoZSBWTV9JTyBjaGVjayBpbgo+IF9f
bW1fcG9wdWxhdGUoKSB3aGljaCBvdGhlcndpc2UgcmVxdWlyZXMgbm9uLU1NSU8gbWFwcGluZ3Mg
dG8gYmUgd3JvbmdseQo+IGZsYWdnZWQgc2ltcGx5IGFzIGEgd29ya2Fyb3VuZC4KPgo+IEFja2Vk
LWJ5OiBaaSBZYW4gPHppeUBudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBtbS9ndXAuYyB8IDQgKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMg
Yi9tbS9ndXAuYwo+IGluZGV4IGMyZGZjYjQ3NDRiYy4uZTYzMTBhN2NjMDViIDEwMDY0NAo+IC0t
LSBhL21tL2d1cC5jCj4gKysrIGIvbW0vZ3VwLmMKPiBAQCAtMTgzNiw2ICsxODM2LDEwIEBAIGxv
bmcgcG9wdWxhdGVfdm1hX3BhZ2VfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4g
ICAgICAgICBpZiAoIXZtYV9pc19hY2Nlc3NpYmxlKHZtYSkpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZBVUxUOwo+Cj4gKyAgICAgICAvKiBVbnJlYWRhYmxlIFZNQXMgYWxzbyBjYW5ub3Qg
YmUgZmF1bHRlZCBpbi4gKi8KPiArICAgICAgIGlmICghdm1hX3Rlc3Qodm1hLCBWTUFfTUFZUkVB
RF9CSVQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArCj4gICAgICAgICBn
dXBfZmxhZ3MgPSBGT0xMX1RPVUNIOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFdlIHdhbnQg
dG8gdG91Y2ggd3JpdGFibGUgbWFwcGluZ3Mgd2l0aCBhIHdyaXRlIGZhdWx0IGluIG9yZGVyCj4K
PiAtLQo+IDIuNTUuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
