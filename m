Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D8BCA5FAB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPUKLwZChVgThjgER8tJ1WcgIIHHE1qKY42JXVhawl8=; b=oa6qYzq6R4SDum
	Bb9lmYZM8Yf/tcY/9e98eMO5K8Omr6kmX8dxe7pi4fBvrO2MFCIzIa0Mxtevf1T4quFTEjlmcWmed
	Wnlc2mAFyqNHidXp5V4nZ/Qi3UwKAI9qAY6k5iiVkCLkwsd/syPEy0JkVJpFbdwmkk1YI2avPAV9+
	niDP4kjYpfW8H498zxn89hwZjbJ4Qscci9f9qQUnyuj3Pl0Y2IF1lGgPn+t7F3aLzXbuzhvQG+/lH
	6gLcrvUKUyvhpZTQIqhYV+fCyDW/KPoHslOi8bLR/OySRmkS057SYYBn1jd2XTphlSzYum8ir00Ss
	rWspykbuNE3nPCObeBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMNG-000000020dz-2hmo;
	Tue, 29 Sep 2026 01:11:14 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O0E-00000008XGd-3cSk
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 14:31:22 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-532e9ad9a1eso208111cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 07:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790173876; cv=none;
        d=google.com; s=arc-20260327;
        b=UmdPBKnq+CurS1S15fLX82oHUntSn701ydNoVzKN35rHAnbbIAGsFDUhgDUiQT0Dv0
         Zkwulg38QM7uRS1AAuy2G9I6qikKNpaBMuFt1ZaT4nHa7xGQ7cZGbPrKP3emOtXsDffy
         Vc8bnfuxg7Lz28NlDiFr1LYYYNtraHYg1iZu6MI3HxFECB93TRxUphsHA99YXgk8yNR3
         MOPQ5/J3pDRqW1c2CFoDsPYtxyLNtjum75Js9nWKPwEtOppP0KgdQgBD4ig0yiiQo3fI
         2muUw4dxDn/msYUAe7yU5odzpIlq1/jcaYeEyvA0roNuUyzgV/koJGXsTRAkGuPdUT/q
         vb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        fh=KCoDbMwv2W5KiPHJ+4rCQ87TlxBMiIkdnl7eC7+4Ias=;
        b=biRu7y2ir/IjPZjKop614UEa2k0aPyfJGVYehgfd/xXDbabYXsrZkG/O/D2ar2kOtr
         1qFt4dfZkMosg1WJjwT6huU5V8KWkrK2ox4m/6YjcSN/KdyTpuAXxKaNF++fFb/D7AAY
         kQd2UHYCxVi2nEs2ht4rMKkA9fMWuCQ10XgqKP5GpRgesrM8CBxTKt7kUHP3P+1p7QE+
         Cd5e1u8wb6uyi9lPx/jTN9Fwx0p0E+YpwY9XMebjpTIPGWlNIKrwDgec8dsxuJeaEJFE
         RHX9uWUsedl/Y/JfKeXzPy39ePUx/xaMkGCPGBLU22QO32N3nPlKvcsmsCVY7ZEcakBC
         BGMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173876; x=1790778676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=HC0N1IuyPA8DrgPgWVM085ZGsjm9XpEIwaLiRt3QXfC513shUkcvZpKP+wnYXObQf1
         9FyTlFdBcAciBzL3X853O2JmyxjEBGr+Yyf4AZHRDWZ4tGRI0v+1VIS210m4aSP2lYjQ
         uE1yZSIOr/HXe5kWszka8YZVQ3yDY+a/omz03pFwaTUcZxZdIqCduUf6CBkCaUPBuuIj
         Z5tKX7ItdjJALztsJa8jerWkdqQ1hlpFEynTuR46zG7T8evk6aAtbjuVVjWoFNJ47GaN
         qRyFYIH8EpGL5+Gqlie/d5R4InhFJm5CY5v5rP4pWiirZuhbpORxeaAiUoGgio193g43
         CkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173876; x=1790778676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=ssUNMjSkuIeahEaWldSawYdcXVlYXpwTmuG9g2goTlIwg7TA20o1swuysS2HXHZC6w
         n4CYm70Xnf/jnpjhs7U0hLLq+rzP0jGBXu2jBeIO8TBmEUqCsAbyS9AaFFmoyzOLGTc8
         wuaFN7TocSaVxeWcy1ksfq95K8zzih4wpsK1PvA+oqVWH2OyaJXdEa0O9V2Gtx9kY7Sx
         6k2P8APLNmh680sHbu+VKNpxQLcRv1aHam4E0+P8yPsMMH1c2vS5jGZ4/SIsBoZBNtek
         ov1k1WFVuekGoOeuFWFwx8mj84c7Yc/qVvxafMr1oyut3A6wq/xAh7gu6zedIVVFYt6o
         RrSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVf2izJBo+Z5JgNCRFKCkrxIKXnVNlLC8C8akN+PDF4LuqYQzl4Ha6VUAo0SfzbXhps8RQCq1Z91tR8A==@lists.infradead.org
X-Gm-Message-State: AFuF++nxB+5nbzbTVS6ChpTqW9rmYreqQ/czx3vGYcvEhRi+3Gryb/gM
	1CwOEeeNrJNJhG+BVsk9NICy7D/c5AA1Ryu8G7eUw7FvyyC2MzIyRK79AGTr4jgYnYSmdZnJ9wW
	uMb4iQnfSQ5NHcdhzgoIVnkU2OnKqbndGqahy/cU6
X-Gm-Gg: AYBFou3uX/UNWosDuWLFdJaaNFBH229Z+F9uInBWnxnunHPU+xNSWx4bxvHIdB9y2Mn
	oTlZ3Vgbx7xYllO8Qb9SrtebzPvWF+6pw9EqP5GgUhSmno04IVfEgU1D/dDvh6NdrsHeR57My1F
	U6QoT0ZeIV2FYziCPqHQJT6zKUDpUlYU6XeV3Z9jjcQ66Bi3I8C8XJrAzR8+pgs+xyaNepIZjmk
	l0KGgSecAbiVux4MQNyqOI/UpnPMJOzJu5iPzbVV2e+ExiofJBiRxs9tMwGNoFb/pauI9lJ9okX
	4K/AcoQprPrslkQCMWghGxjagI9LnWebk9tw4hvBVB+buEl/BBUeX7LviYaHPMeIr0sq5/81ZC9
	CHH6z+oWlaA==
X-Received: by 2002:a05:622a:260e:b0:532:9d15:2e5a with SMTP id
 d75a77b69052e-532ede89b29mr14598791cf.1.1790173874906; Wed, 23 Sep 2026
 07:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org> <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
 <aq6kzpK7wPl3iFGe@gremlin> <aq6lW9FvL69QeA9H@gremlin> <arOCPN02xB7mykju@gremlin>
 <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
In-Reply-To: <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 07:31:02 -0700
X-Gm-Features: AclHuK_ZGTwaB8ygIyiOyIIeQNRzbEtns-G_Cds8CuZ4q61CHw7YMjTifucik0o
Message-ID: <CAJuCfpHL=dHjT=O4S88ZBvT1DyodAtCL9QTryepzs3EMwoECDQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate VM_SPECIAL
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073118_925628_7C877098 
X-CRM114-Status: GOOD (  22.18  )
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMTo0MOKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIChBcm0p
CjxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDkvMjMvMjYgMTA6MTMsIExvcmVuem8g
U3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIFNhdCwgU2VwIDE5LCAyMDI2IGF0IDA0OjA5OjEz
UE0gKzAxMDAsIExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+PiBPbiBTYXQsIFNlcCAx
OSwgMjAyNiBhdCAwNDowNTo1N1BNICswMTAwLCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6
Cj4gPj4+Cj4gPj4+IFRoYW5rcyBndXlzIQo+ID4+Cj4gPj4gTm90ZSB2MyBoYXMgYmVlbiBwb3N0
ZWQgdG8gZml4IGEgc3R1cGlkIGJ1ZyBpbiAxLzQwICsgYXR0YWNrIHNvbWUgdmVyeSB0cml2aWFs
Cj4gPj4gc2FzaGlrbyBzdHVmZgo+ID4+Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtbW0vMjAyNjA5MTctYjQtbW1hcC1wcmVwYXJlLXZtYS1mbGFnLXNhbmlmeS12My0wLTQ1ODNk
OGEyM2JjYUBrZXJuZWwub3JnLwo+ID4KPiA+IEp1c3QgYSBnZW50bGUgbnVkZ2Ugb24gdGhpcyA6
KQo+ID4KPiA+IElmIHlvdSBndXlzIG9yIGFueWJvZHkgZWxzZSBoYXMgc29tZSB0aW1lIGl0J2Qg
YmUgYXBwcmVjaWF0ZWQhIChvYnYuIHRoZSB2MyBhcwo+ID4gbGlua2VkIGFib3ZlIG5vdCB0aGlz
IHYyISkKPiA+Cj4gPiBJIGtub3cgdGhlIHNlcmllcyBzZWVtcyBpbnRpbWlkYXRpbmcgYnV0IG1v
c3Qgb2YgdGhlIGNvbW1pdHMgYXJlIHZlcnkgc21hbGwgYW5kCj4gPiBpdCdzIGJlZW4gaW4gLW5l
eHQgZm9yIGEgd2hpbGUuCj4KPiBCdXN5IHdpdGggdG9vIG1hbnkgb3RoZXIgdGhpbmdzIHNvcnJ5
LiBJdHMgdGltZSB3aWxsIGNvbWUuCgpIYWQgdG8gdGFrZSBjYXJlIG9mIHRoZSBwaWxlIG9mIGJ1
Z3MgYnV0IEknbSBvbiBpdCBub3cuCgo+Cj4gLS0KPiBDaGVlcnMsCj4KPiBEYXZpZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
