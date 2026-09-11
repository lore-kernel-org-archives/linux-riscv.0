Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E0BC982DC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 23:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hiw5pQGaF5Ed5yXND19EgnJviHJ6501opfhlDA3dDXI=; b=INaOuyP+46t8Z+
	Sdgeq/jTQBkZFK+J/jDUa1Zlc37cQ07PrX3Uv9svcswl5nS+OjRui/HBBr0McLLarNj9eWS81JQ7n
	70TLSS67Xt4e3cXH2rCeeQhxeYrFcB11vj3+imac76JvaXroaF4n0bzwigri5rK19s7t2ScZr7ulA
	28I0MNQ0QKbehURns+IAK62qbNwcDovyzfOZOqzpyARflWQXuHBmGQcWAKgF9d/yjM8nzb19s92Tj
	YZRrnDDMM16vjxotPssrQYrlUH6wIJOZr9ZCk9CP72nToEBx5oBzz4Kg0Njr4OIVdoOPsS4e3vmEB
	yfpVUu3T5kxA15jCh4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7LgH-0000000CpE7-1YVe;
	Thu, 17 Sep 2026 23:38:17 +0000
Received: from mail-oo2-x0f.google.com ([2607:f8b0:4864:31::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52pN-0000000H03g-48w3
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 15:06:15 +0000
Received: by mail-oo2-x0f.google.com with SMTP id 006d021491bc7-6b1ae6f5fc4so460711eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139169; cv=none;
        d=google.com; s=arc-20260327;
        b=r1eF3+XXmQubV1QCNpBM71gd64z9XwhEVXh/6NwIviSwiQunYQ9FgKFiM8onU2SdsO
         EGwEc2uq8U+J80fTsA+ZBJD1CnPDQ6gJozGZol7rCGfQFAcQRZQcjGS0SJQtvuC7goDf
         p8zMY96zYCoOSlZdGPks8JAhVMMUlgZxDSAAWL2dikcMHFKxCLXSpT/Va/XYdXmHz04r
         Ao9BOu7/4Kt/BahH11oKNFeXWlr4kG4HX8Qa4r5zixqs473yEL5f+Q+3zkPd7yI9O371
         kCtrxI7zB0Yy4sYYT/8RfBubx9XXZ02rcGRfW9cccSaWxS4k6O2qS+5HGkgMHZBCPBxF
         706A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        fh=7xclTY4e2d/5aV/3Zw7C5yQHFugSt2yp9NCSrdKwYbQ=;
        b=dhIUBm9XUl66ubqdmgLXlNRgjyNVWOsFW/FBdSvnE6BQOXEX7stoj9yTIXXCzW5qgd
         tbpRtxrKecttKZn2cJlaW5yORFlNknL3JxY4FkPDrBzihtb7fqBbiltTGOqMTGNzBW7H
         mGJRdIPDmtopo/0wR6kMTJZhBOpvhh0L+cLAzXHp0/DL/g/3SGJ801QN+fgIwWOHv+OZ
         yxcIziKGXAghf21zyNZQQL1zZE64HXZHUVmalW0fPVQh5W19SleaApI43FG4ONVZ735t
         Uj3NqIGmCwowo0BhQ6ThmasgcCJpp3Xv/ewF1TGaAwtgddkw6x17Htj+MwQ+xUMkicxl
         HV/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789139169; x=1789743969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=Wwb+Vhcxqf0SFxlr5nOgWBdID0cDHNGCCvcXmVrx8xpahD4BfPigTtF6ZFUCYyh0Sq
         z6wXktpcC+2lEwzBCH+1rIcZU2hKswbnnl2Kz8CTJcJ/Q1JWGqFISwKDE7MBPU93q95b
         94tEP6Wq8HYI3Iw64mR7iJjH40gSHBLVd+tguUz5ox74mvUdfFKFtJ4R/4MMGrBotmi8
         Cq1Vv8EsCUoHxiRInha9X4/YznrBEZpaYSKUGA1zUrKFQpAi0kWt2vOxky+uJvH8v+NX
         UqykAdl+0w5OQ2VFmA5N8a4IMQfO8C1PDBfgEhbDfCvkH8mwXEDJkPyqbTz1+qZwoiYM
         yH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139169; x=1789743969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31WGPI9CsS8AEb1QmZigfY8oBbhGb6+EPuGPGJKusUg=;
        b=XW2Db7aA3OFdZi2hqji9BNR7TCgsRlmBLrqzwhnNjTtRjts4veDRR5Fp4Cyty3Z3Nw
         FOuEKTFaHsp7QkqzVwUaVS8rL1mvHQyPr0MgK+hK9nbZH/r2n6dlCAUlYOIpIwndGkUt
         y525LibblsTTT1YiOoDfJxlSvC8YxXqyndvsQZ8mwSYNwZkEsaV6eptvE3X/BKKEeCDN
         sijqnHHkR5V+tpx6XBbx/1aLYZz4VL1r/R3a1mARGNL+hbZRuRPqcubHR4UTxgD79jU1
         m1BVXq369QoZE17YtQYJVOnhBi05FpBASNEqsTuex3c6DGrT+HYRis9MeyNtTEmNlcv+
         z/wQ==
X-Forwarded-Encrypted: i=1; AKwUvBx83y+wp11LnmEAjs0JZS0EPIZHQ1tZRyRVSBahLGC9axWkB/QgVAXjVg42ZyFG4tsFHM05zc5Ao3Kf/w==@lists.infradead.org
X-Gm-Message-State: AFuF++mNMnkkKzei4rSV03E+BJXWrMRzcql2gWjP4A8VJ1UfdH/SPJ7I
	/ojogM6Owz37jRD4IcxRNupCurC7+oU7ZjBYMGP7zrWV/OE554RtwA3rDhwkXggnyO1Hs97wJqV
	R2c7Hm1bRpkP5NKYbjVii3AkWWdgVR6M=
X-Gm-Gg: AYBFou1sST02RZgvsK0BetoSIh71JiKBCLvIGvbGG/P5cV4rCWplOAwoyPb0e9CAdei
	HPg1UkKROABBLhQJ7qhma40DiT8IPg+JnkH+W9IlCa8tyhxlEfSxEKOL1eAV50c/SG35X0QDWEC
	NuEqEULwH3tsGWOU9uKKTM8jjPzBC7G6lB/K2oF6jAPcJJ7gJSw3YFCSHEbZliNRTMcW5WkL03h
	Xq4kdPgXKCAWqSA1NPv8x67mxAiyMl7yLgWwQ3qhBDJVzIgqDX2KmhvAU1mBvm/unMvVOj5Xkb5
	+rp1n32y+YolZSF5bsq/3azz4dIDp65dAAeC556sWA2xJg2xPXTd5mY=
X-Received: by 2002:a05:6820:8585:20b0:6b1:be9f:ce6c with SMTP id
 006d021491bc7-6c0b9d4e35dmr4967721eaf.4.1789139168581; Fri, 11 Sep 2026
 08:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
 <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com> <aqPUqU3eZeFrykj3@gremlin>
In-Reply-To: <aqPUqU3eZeFrykj3@gremlin>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 11 Sep 2026 11:05:57 -0400
X-Gm-Features: AcwNN1UL9TCHStClpz4OqpdpVCOHFGRlTtL1ELl-GfcxGBMtPjfBSuHNlaSY27Y
Message-ID: <CAEjxPJ6P19eKF-c+mm2BSr5_WpmhMTZjjUfSamv3SfOPO4SGVw@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_080613_271918_7FB07DC8 
X-CRM114-Status: GOOD (  23.17  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgNjoxNuKAr0FNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMDI6MTE6
MThQTSAtMDQwMCwgU3RlcGhlbiBTbWFsbGV5IHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgOCwgMjAy
NiBhdCA0OjA34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxsanNAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUgbWV0aG9kIGFuZCBp
cyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+ID4gPiBzZWxpbnV4X2ZpbGVzW10pLCB5
ZXQgc2VsX29wZW5fcG9saWN5KCkgcGVyZm9ybXMgbm8gb3BlbiBtb2RlIGNoZWNrLCBzbyBhCj4g
PiA+IENBUF9EQUNfT1ZFUlJJREUgY2FsbGVyIGNhbiBvcGVuIGl0IE9fUkRXUi4gUmVqZWN0IEZN
T0RFX1dSSVRFIGF0IG9wZW4sIGFzCj4gPiA+IGtlcm5mcyBkb2VzLgo+ID4gPgo+ID4gPiBUaGUg
ZmlsZSBjYW4gdGhlbiBuZXZlciBiZSBtYXBwZWQgd2l0aCBGTU9ERV9XUklURSwgc28gZG9fbW1h
cCgpIGFsd2F5cwo+ID4gPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQ
X1NIQVJFRCBtYXBwaW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+ID4gPiBjaGVjayBpbiBzZWxfbW1h
cF9wb2xpY3koKSBjYW5ub3QgYmUgcmVhY2hlZC4gUmVtb3ZlIGl0Lgo+ID4gPgo+ID4gPiBUaGlz
IGFsc28gc3RvcHMgc2VsX21tYXBfcG9saWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBt
YXBwaW5nIHRoYXQgaXMKPiA+ID4gbmVpdGhlciBhIFBGTiBtYXAgbm9yIGEgbWl4ZWQgbWFwLCBh
aGVhZCBvZiB0aGUgY29yZSBlbmZvcmNpbmcgdGhhdCBvbmx5Cj4gPiA+IHN1Y2ggbWFwcGluZ3Mg
bWF5IGRvIHNvLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFS
TSkgPGxqc0BrZXJuZWwub3JnPgo+ID4KPiA+IFdlIHNob3VsZCBsaWtlbHkgZG8gc29tZXRoaW5n
IHNpbWlsYXIgZm9yIHRoZSBvdGhlciBzZWxfb3Blbl8qKCkgYW5kCj4gPiBzZWxfbW1hcF8qKCkg
ZnVuY3Rpb25zIHRvby4KPiA+IEluIHBhcnRpY3VsYXIsIHRydW5jYXRpb24gb2YgdGhlIHN0YXR1
cyBmaWxlIGNhbiBicmluZyBkb3duIHN5c3RlbWQKPiA+IHNpbmNlIGl0IGlzIG1hcHBlZCBieSBs
aWJzZWxpbnV4Lgo+Cj4gWWVhaCBJIHRoaW5rIHRoZXJlJ3MgZGVmaW5pdGVseSBtb3JlIHRoYXQg
Y2FuIGJlIGRvbmUgdGhlcmUuCj4KPiBUaG91Z2ggSSB0aGluayBvYnZpb3VzbHkgdGhhdCBraW5k
IG9mIHN0dWZmIGlzIGJldHRlciBhcyBhIGZvbGxvdyB1cCBhcyB0aGlzCj4gcGF0Y2ggaXMgZm9j
dXNlZCBvbiBlbGltaW5hdGluZyBhIGNhc2Ugd2hlcmUgVk1BX01BWVdSSVRFX0JJVCBpcyBjbGVh
cmVkCj4gaW5jb3JyZWN0bHkuCgpBZ3JlZWQsIHBvc3RlZCBvbmUgZm9yIHRoZSBzdGF0dXMgaGFu
ZGxlcnMgYXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3NlbGludXgvMjAyNjA5MTExNDU4NDAu
MTkwMzktMi1zdGVwaGVuLnNtYWxsZXkud29ya0BnbWFpbC5jb20vCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
