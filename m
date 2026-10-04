Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D411CA600B
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waENiEZFHs53uYQjqcKT8gaEsWQWFFiusJhFYx+VMeQ=; b=IG8M5WC3c5K82T
	xYGRzipEfuAOYdd4NS5+mfqK3bT8j3O+zUDyUvUnpqP8albHE+SktQiyw/J9KOsXtJpEICiZalKWL
	5HvFFz3Zus697erPUY+S3mKK3fVBgxDzidQR67b9W1TbfSMZea65iakmCv9eeZU+WfDwKENLRZPmU
	OSd0+fxSPfb6PO1aHQ1es/4/+bfRLQQ+860bh82J+L75kmPQv7LCkQDL1le/xsUXnofF47+eA6Cz6
	O20MigeFQeEc1Og42AJjApAHKHC/5f2Ob5HThYTuxKT+9y/5stiixEAtLBhXzZIyZ5sWqSpQET/PB
	e12d5CZbnialk9igROxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEVpb-00000002rjQ-3FvU;
	Wed, 07 Oct 2026 17:53:31 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPrv-0000000F6Vm-2ZuW
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:19:25 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5337c7b9937so259331cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134362; cv=none;
        d=google.com; s=arc-20260327;
        b=RH01sZJT02II2ADZF2jx3Gh+CTg9he65KCVMp4R8E6hfamndxcnuX17WHNrxWEZDrG
         9F1sYmC3kWBZpu/CfU/Bfs/SCZUcpU1R/n0mKBjEWVqhesY9HHCc2wzS9FemWeNf1S+i
         xmHsA3zRsqgSTW0/1NeXifpEVp5UmjVQ97POd7QNIGAiakEE98RPMk+PV/HBIxY0rE2n
         2h3jY74LrtQlV+R6vEnhiEgHYEgjbWr/Lj+nLLQrDtCvyk5WhOT1MmAF3CKMz9KdLRMg
         gKl2C+ThZ+8I8Obq2ijgWmsCDlbn0xZfAssSxDlvKmLqHOPgcxUwJaBxMfUxk2VByP8J
         3m+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        fh=7HnZ06p2Xvnpt6JHb6hOALtXanf589W3sE5GWBK+U3g=;
        b=eRtN8jRlV5x89Bf6BgVjOMQBEXP9iiSKOXQ0Xu9plzzW4TL4g/Pc1sBBg6iQMM0QUr
         37HjPAPMgVAvKA7kf8uzDTOO85STgNj9uJbg91dFGuDMHyMXXPaX7zVjByEqGtZZq2RE
         30yNN1ag3r45kv/3z53yh891eJblQyyaraJUpx1lZeHjIzA/sl8EAjnBguJUgr3x5RwD
         2B8a+0NxJZlMWiC6L4DYsbp8gVIxfyp9HFh5HoH/5z42jy8fKcU3i5T5zIIri60yGkqb
         GxYT/efres/sXVn7SbGxQVyL/TWnCwDqG6SNMR9ngCIYo9HtSEpmvtmLHYRZtpI+eB/K
         lQKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134362; x=1791739162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        b=hDpWHWxbSC0CWTpLWRjyzjuHp9OmvjPPjzY/E4SHCnS9B/Wof4OXlditxkBznv+ftc
         gW5huvE8bw54l/AhdkkCRwew28YO1GrltLhoa6WewqG626zbK9h5BoDOUycX5xxEF6HJ
         UKSLtIAZW+AvVWUXFi8JKg9cDKbqjV5dP1cLtbdRYel6Fj2yM1KCdTwPNJoNafHq9bnX
         LE+sdQIwNiC4Swqp6kbVIMdXMNZ0w5N+wu+75CwMYS3roCnCJ0H+hv6S/GfnKbPBhRrT
         Z3fculyqB/AC45WHs+TE3FhwLIaFrh8Yhaj6Y5V+GEvNCrO/NduOdAo1nh3iodV3p7ha
         u3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134362; x=1791739162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        b=bOl81M74oKX2fXSBhDwKU9wk9VW1MZz8aAAcMFliT3+p+YLXryAFRPLAr2lkY5yDo0
         aaAB20avUDUTr9qmXqYchxMZrzNY/ZvbqyV5K+8RpAZPKXNZ1wsOWvHR9xB+Imz9Mi2J
         aZGzF4lVSIT6urwf+BZ/o2QTnAcnBHLlBkiNp/H/56omvJ1t5dorEfoPBaLGVxRvz9BJ
         ZBMVqFF5OwzbZrJuuBBfsDVEkmpqWQCUrM3eE7W3Y/j9iJi19Jz2fNsqUaenrJ3YXc28
         wupP6sa2suXRt0EAKn4E7L7mf7K6K3VyQentMuu0Wk7Q/MAN5cneCj7SJBO70WoRGKFZ
         2DIA==
X-Forwarded-Encrypted: i=1; AKwUvBw9KJWYkOaN10q0288i3YTXOTkZaL+AivbXLb+6N9PTtcu8tdSXFWu/Tn2kY3O167OhIxmFQJiMN4KUuw==@lists.infradead.org
X-Gm-Message-State: AFuF++mVeCPTJ4EQyvvKhcx/rK2mjj4xbL5BX+qFb0KPje2UF/MjN4JO
	/Ajxyg3CzZLI2Gqu3r1wHSw5mwhp3P5kTbwAhiO+M43SqHrhcSOohhQOMR1GVt0D+b1E7p97g5R
	7M1PmYS+eXl9JVNPQS8PE1BiEZ5TDrdzO14cmAgJf
X-Gm-Gg: AYBFou0H3UhU3w+v42AX1fxLGosrjbvd/m6y6GVjeLXRvPNUtmQiEGDyombecZekclY
	PkoRHnXPmAGulxmQFjw5wGuNGETw0oqpa/e+2wU/H9WnKkD/IKE53Tnm0PEd6tV9Qf7G47Segk7
	KIckOHTt+Jlw8gU0blJ5o0m2T6qA+O6QiSc4SHNRZ7KKYvYTVcFcM7/fQ9Hm7nbOzChznJ8SiVq
	ENBUt0BxACYYr4smF/ab5fO5/MFqhXtZDWK4AoOFoR26JjrGv7J3R81YKyPZINlBA6V9SE6+DTv
	FradI4pQ17jIBGgVVwdcybiWt4ZKd9OcISCnIkza9p6nYSg9BIphkoUuwQ==
X-Received: by 2002:ac8:5e4d:0:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-535131e75aemr16242571cf.10.1791134361196; Sun, 04 Oct 2026
 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-11-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-11-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:19:09 -0700
X-Gm-Features: AclHuK8q5domRMZg3DAHzMyB2slG297Lp1_L7hWmlqEUWco5tu_MI_s_DzFbhWI
Message-ID: <CAJuCfpGdJM=J+6tkzid_Mu+7nevdhFaTW0E9tbKXoLmzC951Fw@mail.gmail.com>
Subject: Re: [PATCH v4 11/38] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101923_674868_B320D107 
X-CRM114-Status: GOOD (  24.06  )
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
dCBvbmx5Cj4gc3VjaCBtYXBwaW5ncyBtYXkgZG8gc28uCj4KPiBBY2tlZC1ieTogU3RlcGhlbiBT
bWFsbGV5IDxzdGVwaGVuLnNtYWxsZXkud29ya0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEph
bm4gSG9ybiA8amFubmhAZ29vZ2xlLmNvbT4KPiBBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBw
YXVsLW1vb3JlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxq
c0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdv
b2dsZS5jb20+CgoKPiAtLS0KPiAgc2VjdXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYyB8IDExICsr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYyBiL3NlY3Vy
aXR5L3NlbGludXgvc2VsaW51eGZzLmMKPiBpbmRleCBjN2Q5MTQ3Njk3MWMuLjU0NWE2Zjg5Zjll
NyAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9zZWxpbnV4L3NlbGludXhmcy5jCj4gKysrIGIvc2Vj
dXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYwo+IEBAIC0zNDAsNiArMzQwLDkgQEAgc3RhdGljIGlu
dCBzZWxfb3Blbl9wb2xpY3koc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbHAp
Cj4gICAgICAgICBzdHJ1Y3QgcG9saWN5X2xvYWRfbWVtb3J5ICpwbG0gPSBOVUxMOwo+ICAgICAg
ICAgaW50IHJjOwo+Cj4gKyAgICAgICBpZiAoZmlscC0+Zl9tb2RlICYgRk1PREVfV1JJVEUpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRUFDQ0VTOwo+ICsKPiAgICAgICAgIHJjID0gYXZjX2hh
c19wZXJtKGN1cnJlbnRfc2lkKCksIFNFQ0lOSVRTSURfU0VDVVJJVFksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICBTRUNDTEFTU19TRUNVUklUWSwgU0VDVVJJVFlfX1JFQURfUE9MSUNZLCBO
VUxMKTsKPiAgICAgICAgIGlmIChyYykKPiBAQCAtNDI0LDE0ICs0MjcsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHNlbF9tbWFwX3BvbGljeV9vcHMgPSB7Cj4K
PiAgc3RhdGljIGludCBzZWxfbW1hcF9wb2xpY3koc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gLSAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZN
X1NIQVJFRCkgewo+IC0gICAgICAgICAgICAgICAvKiBkbyBub3QgYWxsb3cgbXByb3RlY3QgdG8g
bWFrZSBtYXBwaW5nIHdyaXRhYmxlICovCj4gLSAgICAgICAgICAgICAgIHZtX2ZsYWdzX2NsZWFy
KHZtYSwgVk1fTUFZV1JJVEUpOwo+IC0KPiAtICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxh
Z3MgJiBWTV9XUklURSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVBQ0NFUzsK
PiAtICAgICAgIH0KPiAtCj4gICAgICAgICB2bV9mbGFnc19zZXQodm1hLCBWTV9ET05URVhQQU5E
IHwgVk1fRE9OVERVTVApOwo+ICAgICAgICAgdm1hLT52bV9vcHMgPSAmc2VsX21tYXBfcG9saWN5
X29wczsKPgo+Cj4gLS0KPiAyLjU1LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
