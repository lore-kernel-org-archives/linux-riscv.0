Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F9DCA600A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4eKBRwSNLxyp1Fn289YIZWG0rGewGB/GrGYVu8a1sU=; b=vMclqJsEhMD8v2
	Lzuk5tDPlsIZG4nz2ChJ6j6rz4TtNWJkPc69A8iM0UC5cPjn2+CVtcdWmGZI2u9FBtAeNR1iBBy0g
	r/RH3xoBPti16EAxrqHlxCY7tSPDv3lcnO3Cm6XvXSVOQwTyylTEhvLycki/g3LDlRs6S8uThJYh+
	06bz+G/9ckqNIJVoCf/VwOb/SacvmdFp+B3Yp8qe799CEpxETwSeoPWByWe1eODzSQRQcXgD/yOZC
	+e6xBRDpbAcc8od/c8TYCgJP9PNKeYq43gmqWd57aMBGfHEAx6+3hR5B73u64YBVoyedGrqKd82ZB
	nvX3NJZyqqQ9Zc+IrdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpd-00000002rqZ-0iDq;
	Wed, 07 Oct 2026 17:53:33 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPvU-0000000F6yq-0ub2
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:23:05 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5337fa12431so181241cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134583; cv=none;
        d=google.com; s=arc-20260327;
        b=MHAepnbm0/G7e7xD5vt1TFr881MW2TAPab2BSWTObWBKM3euZ7uT6wOMcH+o/Iw136
         jf+zrNUcgBPcz0W9Y0155hJQ3KW0YeNkuHifl/GBl1Djg0z/h96XmDew6bbLoxL3d/Ci
         2U5V4Q1z6aQ9fJDYJzGm4q2lj2jWlVlBc2ksTLlhNW/Hh0taNG/eDEWkmL9eRvixIEnc
         9DvOwi0sDnudOdQcPy6qTk+/V/sdUWdruAWNAqviZhyi68U2kRr+yVyhvOdpbHrf3pK2
         ZjdRcvi928d042NtigGnPyj69BSxeKYt8xRnRqYzv5Uph8LXEJJDxGwBTauqNI0oZZUb
         kmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bqiCaT+6hB/MlQ3EgaRNQmjR57IQALnN7KoYl50i5vw=;
        fh=OyGU4w5X3MczQiabDFojC4i5zs6I3DXHf9Js4ira9Ic=;
        b=HJXKcWMYKQlxBoPAV+AAYf/WMf2E4bqoxA9IUBVivd/o8hv1nxBMANYUdz1y/pRLkl
         3/rLznVXvWuC/N+x8wD1vdLgCS/TFAZRxo5ihyNjeGMn4gvEa+1R2D/w1nbcwGZ+8ZFi
         GlBE1pmxlfLckLhyl1hXrA7HWS/Jg1MxpOvRouPMJ7AaqjnSNaktTesJ7y1lAvu8XwLf
         p9ps+YzH2OIWry1heEeFyaAAiFpqlIuLARY2SNkTcAxnJ2QGuxbUm4WiPwbVr4HA1HT3
         flLqoHgpCeS5n0GESF8LP43oQS4f8kCQMWzZhy6xY4l6KpogLcdhIRxAnfQfzcV63kuB
         m8aA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134583; x=1791739383; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqiCaT+6hB/MlQ3EgaRNQmjR57IQALnN7KoYl50i5vw=;
        b=YqWoY4ohagjv2qgGLv7aeYLJ81nFVjX4PFzEraWzdqcVbazXP9lfvOyTdYLIa0a4F4
         JhwhiiFsx43pP/BqzaGICSkhhNWTc8kwzuI0464lZ6JPInrH9osrLxceZHA/VytNZygf
         SWm5kS4Pj/TM2bdNymC8TQ/aOi4CxD6Xidxmoq5hxS8zCMoHYGPM7BMwUADbk1irsbe6
         EX65PGsIoEURHy7uYnu7MmbLDxejfBFdd0jZY69ZvtAlOOKw/l2cz3ghQhPP96MPsYz2
         9baVq09A828K0Fa1//QOLlFP6cmGUiJqsVPQDCvuJizjlm8il5GkZQhaAn+ogYvAxx92
         LE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134583; x=1791739383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqiCaT+6hB/MlQ3EgaRNQmjR57IQALnN7KoYl50i5vw=;
        b=CWpxRHHfVMvSySEMi2Q/fEFNkx0hRgakO+jRXxC8tcZJGVM0T4zlbmsg0Z2+IfxZ7d
         YXlj2Mp2Mk+JfRSr2C/22iuDw/5AXFjRMsV+cciapZwUIs3qloji6aH15ebiN9mD5oYT
         8ubnkY2KTBF7Di7l8aX8U1mkailaptUKbXwdymEaYsXhqnsxhClfevbL196z+47Kp1Z+
         1KehMnjfaMGqOp1Cw6RE4fkh/Pm8mTQEeBwH+JbeoHd9ZQQTcnqu3gQDzelAD5asnppT
         G8nxWDTOtm2FDCsVOqVYuglX4lZ7/0LMBqsxeRn7eHIWQbKnUZybEwsZvbFjXOaEavKr
         DJBA==
X-Forwarded-Encrypted: i=1; AKwUvByPqI1xIP7wQE+JxPXVGAI6kQRgOJFFoaghxDyQ50Y3MZK5ywpG7TgAB0IF/BaZzjpNSBSmrSB9rFtXMw==@lists.infradead.org
X-Gm-Message-State: AFuF++mM5udP+E2Fu+1LtWFG6CJrg1cD7yPFdH14ImwTnXcvaxsThOo3
	Enq4XlCuhObZ2xF2JrWGVSOmKELfkurpVvMHn5mHv7MrS2qJa/z76m4KqAUVXsZyHvZhZ2IxA1N
	zdh3IMKF9Pbt9yJF1zcF9xxV5GzkKgyjTyhe/GxOe
X-Gm-Gg: AYBFou3fUzmKTrjGnc2h2o1zvBEzMsmdg0cmAbrsB5cJXguQ2prgi7C4nq/x6vwFr5e
	E1nsvIVQQejq4rpaNnnMjHMDTFOGWozWLTAN9IEALp/gzobkd1b9qj6cxq65pEajz7fYSvNRzWV
	g5mSoCayGAPFfTHtu76dcQYqdQlkATimvoBZzYwlznaDJ2OLXlH3ThKvbAOMwZBszLSfNMkMvnj
	I6cnHlsF2OFYuk7Ct8NQ1bUgkIAhNIwIBXX2FYApKr2WdAwjKvx2SKCYmvSjZQc73/BrIScVL9s
	xbn5nwqw+efv3Vce7RLqLUnPK5k3KDpGXbP6DawRn4pV4ZlI7CHcM/MDREjJb8n+X0s=
X-Received: by 2002:ac8:574c:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-535131b2b85mr16362481cf.9.1791134581910; Sun, 04 Oct 2026
 10:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-12-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-12-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:22:50 -0700
X-Gm-Features: AclHuK9b8f-m7wgF2pmH0VTlVxkwioKHBPR714nLjuu-GaXS_Vt3fJyAlsba0Do
Message-ID: <CAJuCfpH8GeLKqFtfC_a5i08dQ2ZyyROSrYqYP6Btq03xbF_nXA@mail.gmail.com>
Subject: Re: [PATCH v4 12/38] ALSA: pcm: use vm_insert_page() to map PCM
 status page
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_102304_290886_6371599D 
X-CRM114-Status: GOOD (  26.85  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGVyZSdzIG5vIG5lZWQgdG8ga2VlcCBhIGZhdWx0
IGhhbmRsZXIgYXJvdW5kIGZvciB0aGlzLCBpbnN0ZWFkIG1hcCBvbgo+IG1tYXAuCj4KPiBXaGls
ZSB3ZSdyZSBoZXJlLCByZW5hbWUgYXJlYSB0byB2bWEgdG8gYmUgY29uc2lzdGVudC4KPgo+IFRo
aXMgY29ycmVjdGx5IG1ha2VzIHRoZSBtYXBwaW5nIGEgbWl4ZWQgbWFwIG1hcHBpbmcuCj4KPiBU
aGlzIHdvcmtzIHRvd2FyZHMgZXN0YWJsaXNoaW5nIHRoZSBpbnZhcmlhbnQgdGhhdCBvbmx5IFBG
TiBtYXBwZWQgb3IgbWl4ZWQKPiBtYXAgbWFwcGluZ3MgbWF5IGNsZWFyIHRoZSBWTV9NQVlXUklU
RSBmbGFnLiBUaGUgc3RhdHVzIHBhZ2UgbWFwcGluZyBjbGVhcnMKPiBWTV9NQVlXUklURSwgc28g
aXQgbXVzdCBub3QgYmUgbW0tbWFuYWdlZDsgdGhlIGNvbnRyb2wgcGFnZSBtYXBwaW5nIHJlbWFp
bnMKPiB3cml0YWJsZSBhbmQgaXMgbGVmdCBmYXVsdC1iYXNlZC4KPgo+IFRoZSBhc3N1bXB0aW9u
IGlzIG1hZGUgdGhhdCB0aGUgc3RydWN0IHBjbV9tbWFwX3N0YXR1cyBzdHJ1Y3R1cmUgaXMgYXQg
bW9zdAo+IGEgcGFnZSBpbiBzaXplLCB3aGljaCBpcyBhc3NlcnRlZCBhcyBhIGJ1aWxkIGJ1Zy4K
Pgo+IFRoaXMgaXMgc2FmZSB0byBhc3N1bWUsIGFzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUg
aXMgNTYgYnl0ZXMgYXQgbW9zdC4KPgo+IEFja2VkLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1
c2UuZGU+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2VybmVs
Lm9yZz4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29t
PgoKCj4gLS0tCj4gIHNvdW5kL2NvcmUvcGNtX25hdGl2ZS5jIHwgMzggKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDI1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL2NvcmUvcGNtX25hdGl2
ZS5jIGIvc291bmQvY29yZS9wY21fbmF0aXZlLmMKPiBpbmRleCA2MjMyNDI4MmZjYWUuLmM5OGZi
M2RmMTRmMyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9jb3JlL3BjbV9uYXRpdmUuYwo+ICsrKyBiL3Nv
dW5kL2NvcmUvcGNtX25hdGl2ZS5jCj4gQEAgLTM3NjAsMzkgKzM3NjAsMjcgQEAgc3RhdGljIF9f
cG9sbF90IHNuZF9wY21fcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwgcG9sbF90YWJsZSAqd2FpdCkK
PiAgLyoKPiAgICogbW1hcCBzdGF0dXMgcmVjb3JkCj4gICAqLwo+IC1zdGF0aWMgdm1fZmF1bHRf
dCBzbmRfcGNtX21tYXBfc3RhdHVzX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICtzdGF0
aWMgaW50IHNuZF9wY21fbW1hcF9zdGF0dXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJz
dHJlYW0sIHN0cnVjdCBmaWxlICpmaWxlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgewo+IC0gICAgICAgc3RydWN0IHNuZF9w
Y21fc3Vic3RyZWFtICpzdWJzdHJlYW0gPSB2bWYtPnZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICsg
ICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBzaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0
YXJ0Owo+ICAgICAgICAgc3RydWN0IHNuZF9wY21fcnVudGltZSAqcnVudGltZTsKPiAtCj4gLSAg
ICAgICBpZiAoc3Vic3RyZWFtID09IE5VTEwpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBWTV9G
QVVMVF9TSUdCVVM7Cj4gLSAgICAgICBydW50aW1lID0gc3Vic3RyZWFtLT5ydW50aW1lOwo+IC0g
ICAgICAgdm1mLT5wYWdlID0gdmlydF90b19wYWdlKHJ1bnRpbWUtPnN0YXR1cyk7Cj4gLSAgICAg
ICBnZXRfcGFnZSh2bWYtPnBhZ2UpOwo+IC0gICAgICAgcmV0dXJuIDA7Cj4gLX0KPiArICAgICAg
IHN0cnVjdCBwYWdlICpwYWdlOwo+Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9u
c19zdHJ1Y3Qgc25kX3BjbV92bV9vcHNfc3RhdHVzID0KPiAtewo+IC0gICAgICAgLmZhdWx0ID0g
ICAgICAgIHNuZF9wY21fbW1hcF9zdGF0dXNfZmF1bHQsCj4gLX07Cj4gKyAgICAgICBCVUlMRF9C
VUdfT04oc2l6ZW9mKHN0cnVjdCBzbmRfcGNtX21tYXBfc3RhdHVzKSA+IFBBR0VfU0laRSk7Cj4K
PiAtc3RhdGljIGludCBzbmRfcGNtX21tYXBfc3RhdHVzKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVh
bSAqc3Vic3RyZWFtLCBzdHJ1Y3QgZmlsZSAqZmlsZSwKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICphcmVhKQo+IC17Cj4gLSAgICAgICBsb25n
IHNpemU7Cj4gLSAgICAgICBpZiAoIShhcmVhLT52bV9mbGFncyAmIFZNX1JFQUQpKQo+ICsgICAg
ICAgaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX1JFQUQpKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiAtICAgICAgIHNpemUgPSBhcmVhLT52bV9lbmQgLSBhcmVhLT52bV9zdGFy
dDsKPiAtICAgICAgIGlmIChzaXplICE9IFBBR0VfQUxJR04oc2l6ZW9mKHN0cnVjdCBzbmRfcGNt
X21tYXBfc3RhdHVzKSkpCj4gKyAgICAgICBpZiAoc2l6ZSAhPSBQQUdFX1NJWkUpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+IC0gICAgICAgYXJlYS0+dm1fb3BzID0gJnNuZF9w
Y21fdm1fb3BzX3N0YXR1czsKPiAtICAgICAgIGFyZWEtPnZtX3ByaXZhdGVfZGF0YSA9IHN1YnN0
cmVhbTsKPiAtICAgICAgIHZtX2ZsYWdzX21vZChhcmVhLCBWTV9ET05URVhQQU5EIHwgVk1fRE9O
VERVTVAsCj4gKwo+ICsgICAgICAgdm1fZmxhZ3NfbW9kKHZtYSwgVk1fRE9OVEVYUEFORCB8IFZN
X0RPTlREVU1QLAo+ICAgICAgICAgICAgICAgICAgICAgIFZNX1dSSVRFIHwgVk1fTUFZV1JJVEUp
Owo+ICsgICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1f
ZmxhZ3MpOwo+Cj4gLSAgICAgICByZXR1cm4gMDsKPiArICAgICAgIHJ1bnRpbWUgPSBzdWJzdHJl
YW0tPnJ1bnRpbWU7Cj4gKyAgICAgICBwYWdlID0gdmlydF90b19wYWdlKHJ1bnRpbWUtPnN0YXR1
cyk7Cj4gKyAgICAgICByZXR1cm4gdm1faW5zZXJ0X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0LCBw
YWdlKTsKPiAgfQo+Cj4gIC8qCj4KPiAtLQo+IDIuNTUuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
