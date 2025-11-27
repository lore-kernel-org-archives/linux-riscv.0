Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436FD10375
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 04:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUMVNS2vI+wi/6kAKsl/+3J7jqhtSMmzB9zvT3WbRu4=; b=RmPc4Nt3wP+FS8
	K3ZFcuBfV/3IpaCxe1NAB4S3pKJ9fg4V9PGMgwvxGvWXc1/jdnpVZ/PeUDwZ7AUJ12cp74D2tjYNo
	9g5+o7tiqfC7TdYrzupJe/LyLFcdQkq5xNGX9vw2R3UT6RfM8TMlGKfp3fVivB78adt1F4nbXWP5G
	PGfFFUOJY3KeRMl7mSmEBE27lSaO0+elblsFwlb94SLRtF9IO7jVPurvAgBbWL/Oq2OPBVfNj8eU6
	pFNcAE+OPyUioYdpZutseJ1YD9Bj48a+BBsFv5Y+7QMQkRmWzIeWmgy2CTTW9YfaAKycRL3laR8rv
	iVhDTH4r3nuoWfr58bZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTq5-0000000FyYP-373z;
	Thu, 27 Nov 2025 04:42:41 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOTq2-0000000FyXl-041J
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 04:42:39 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso430785137.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 20:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764218556; x=1764823356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEhopEuyFNhgXqkSaWLWBfzS2UzIUD/ULoq0kMipD7w=;
        b=j8RWba/vrgT+Csu+s1rwFylb1pFWDB15iz0bIjrN9UCpukaI/0ZgaVVo4rSG1ct2ad
         7O+aZWooRkyXYFHt/5p1sc617wuUUTYxrZPbWALvpGyY4ZqmflfQRRrvJQs17vUDYpxq
         9s1jy8Iv1Vz+kupa2Ag1EBdybxNSWSQr//5XXDUOS33bl4Tm5PzIvWPBThvRr9GRkg2/
         iF+hb4P2RMB/yF+kUTIB40U+Ye60w35KcKEs/lYtybOAUa97dGaoEeerZ+yW/ta741yg
         atAWY1lrROReIhkUXJh2r74Imm9C7J/3d1TXnEzjyV+V2K4bCw7V91WCJDvWZDu21UUX
         K0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764218556; x=1764823356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEhopEuyFNhgXqkSaWLWBfzS2UzIUD/ULoq0kMipD7w=;
        b=RLcZqK1kMtgKsMxuUD5H2kVTagZyrKh3dhU7n6NAaQ6k5jJAGORHmqiTxqC9Ct7RvI
         fYbY8iDgG3/WdjUoZSRyBOTVNvR8Fm4gyytbZyDuXqG/IOniTiyG+n+HJoiilUa/jDiQ
         oYQklypOStfCoP2oHHNVt0PvdGH2A9R6WxRsfVF0JCD5nxUWn90afp9rKLxff9DnpKlU
         sXj0S51+Eprd9zraO1IQyLknkdFDtCjSK3ucjqBFJwl05GqBxlEnnfZQhDq2+jvAUA3a
         Wi1N/dY9CB4WuRM/nmI309yVs/pwE3TNBHf+6+9k0nREgdJMdwhkaLuPDGopx+biFwqu
         Q0kw==
X-Forwarded-Encrypted: i=1; AJvYcCWmaNJniEY2awOC9PklGZ+BFCDjNIJN7GAwGjnxqja/yUELEL/OjpY1GlGiUATGgqlTav9U7DmJYJB5oA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywihm2p9iHnOFKicB1VtRTwE0gFKvCTx3JHG3TfYRrVsxsmm9M+
	WRv3hc4tFpS95sOI/jNcKxXcANpQvqdLqcq44rbipwgknq0Of3efSiUx7n1VmWrIOf856m2b9Ky
	/peK4xNtuQQPxFxLP168s+gNGd6WQtu4=
X-Gm-Gg: ASbGncuWwQ9ea+MStziKPEa1ahGAp1htnQN/e7tGx+UBXSMEyHr0HaIpBkJM9BHO2+W
	RzFgoWvCxPDRV1dtGPU9Q0lQkjFiC/9sKNFnAoYXhYj5peOYMzf8xtKZgWaquin7j3UoNLneHyt
	UntGej5JvQLRKKumhKm0fdUHp6IM8XUHzRcFZRlIEZvVhv1EYJNiuuGyln1BbwPGfGikJUX8jaL
	syn9uC2ga2xYunU2q35n1BXE3MNfWhYlKCQWhJhjC2k7w1vlLKmXOQJYMHo9hwjrH+/+w==
X-Google-Smtp-Source: AGHT+IGH43TrgsJFNtUr5ao/vogWT9GdRhnXVZ07KbbMX+jdayVJE8Rn0KQfN/TjkQoluZkh1Kzptkw+oLx2u2WmID0=
X-Received: by 2002:a05:6102:54a2:b0:5db:3c3b:7767 with SMTP id
 ada2fe7eead31-5e1dcfaca59mr9155596137.16.1764218556121; Wed, 26 Nov 2025
 20:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
In-Reply-To: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 27 Nov 2025 12:42:24 +0800
X-Gm-Features: AWmQ_blP9KP_04bFNRiiSxH6Z8Vu2JxzZ1V6hdafxe8pxPoB5frW9rAs1E64Uhk
Message-ID: <CAGsJ_4w8550U+1dah2VoZNuvLT7D15ktC6704AEmz6eui60YwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Barry Song <v-songbaohua@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Pedro Falcato <pfalcato@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Oven Liyang <liyangouwen1@oppo.com>, Mark Rutland <mark.rutland@arm.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
	=?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_204238_112567_D369E8D6 
X-CRM114-Status: GOOD (  26.25  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMTI6MjLigK9QTSBCYXJyeSBTb25nIDwyMWNuYmFvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCAxMjowOeKAr1BNIE1h
dHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUs
IE5vdiAyNywgMjAyNSBhdCAwOToxNDozNkFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4g
PiBUaGVyZSBpcyBubyBuZWVkIHRvIGFsd2F5cyBmYWxsIGJhY2sgdG8gbW1hcF9sb2NrIGlmIHRo
ZSBwZXItVk1BCj4gPiA+IGxvY2sgd2FzIHJlbGVhc2VkIG9ubHkgdG8gd2FpdCBmb3IgcGFnZWNh
Y2hlIG9yIHN3YXBjYWNoZSB0bwo+ID4gPiBiZWNvbWUgcmVhZHkuCj4gPgo+ID4gU29tZXRoaW5n
IEkndmUgYmVlbiB3b25kZXJpbmcgYWJvdXQgaXMgcmVtb3ZpbmcgYWxsIHRoZSAiZHJvcCB0aGUg
TU0KPiA+IGxvY2tzIHdoaWxlIHdlIHdhaXQgZm9yIEkvTyIgZ3Vuay4gIEl0J3MgYSBuaWNlIGFt
b3VudCBvZiBjb2RlIHJlbW92ZWQ6Cj4KPiBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHBhZ2Ug
ZmF1bHQgaGFuZGxlcnMgc2hvdWxkIGF2b2lkIGhvbGRpbmcgdGhlIFZNQQo+IGxvY2sgb3IgbW1h
cF9sb2NrIGZvciB0b28gbG9uZyB3aGlsZSB3YWl0aW5nIGZvciBJL08uIE90aGVyd2lzZSwgdGhv
c2UKPiB3cml0ZXJzIGFuZCByZWFkZXJzIHdpbGwgYmUgc3R1Y2sgZm9yIGEgd2hpbGUuCj4KPiA+
Cj4gPiAgaW5jbHVkZS9saW51eC9wYWdlbWFwLmggfCAgOCArLS0tCj4gPiAgbW0vZmlsZW1hcC5j
ICAgICAgICAgICAgfCA5OCArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgbW0vaW50ZXJuYWwuaCAgICAgICAgICAgfCAyMSAtLS0tLS0tLS0tLQo+
ID4gIG1tL21lbW9yeS5jICAgICAgICAgICAgIHwgMTMgKy0tLS0tLQo+ID4gIG1tL3NobWVtLmMg
ICAgICAgICAgICAgIHwgIDYgLS0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCAxMTkgZGVsZXRpb25zKC0pCj4gPgo+ID4gYW5kIEknbSBub3Qgc3VyZSB3ZSBzdGlsbCBu
ZWVkIHRvIGRvIGl0IHdpdGggcGVyLVZNQSBsb2Nrcy4gIFdoYXQgSQo+ID4gaGF2ZSBoZXJlIGRv
ZXNuJ3QgYm9vdCBhbmQgSSByYW4gb3V0IG9mIHRpbWUgdG8gZGVidWcgaXQuCj4KPiBJIGFncmVl
IHRoZXJl4oCZcyByb29tIGZvciBpbXByb3ZlbWVudCwgYnV0IG1lcmVseSByZW1vdmluZyB0aGUg
ImRyb3AgdGhlIE1NCj4gbG9ja3Mgd2hpbGUgd2FpdGluZyBmb3IgSS9PIiBjb2RlIGlzIHVubGlr
ZWx5IHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCj4KCk9uZSBpZGVhIEkgaGF2ZSBpcyB0aGF0IHdl
IGNvdWxkIGNvbmRpdGlvbmFsbHkgcmVtb3ZlIHRoZSAiZHJvcCBsb2NrIGFuZApyZXRyeSBwYWdl
IGZhdWx0IiBzdGVwIGlmIHdlIGFyZSByZWFzb25hYmx5IHN1cmUgdGhlIEkvTyBoYXMgYWxyZWFk
eQpjb21wbGV0ZWQ6CgpkaWZmIC0tZ2l0IGEvbW0vZmlsZW1hcC5jIGIvbW0vZmlsZW1hcC5jCmlu
ZGV4IDU3ZGZkMjIxMTEwOS4uMTUxZjZkMzhjMjg0IDEwMDY0NAotLS0gYS9tbS9maWxlbWFwLmMK
KysrIGIvbW0vZmlsZW1hcC5jCkBAIC0zNTE3LDcgKzM1MTcsOSBAQCB2bV9mYXVsdF90IGZpbGVt
YXBfZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAgICAgICAgICAgICAgICB9CiAgICAgICAg
fQoKLSAgICAgICBpZiAoIWxvY2tfZm9saW9fbWF5YmVfZHJvcF9tbWFwKHZtZiwgZm9saW8sICZm
cGluKSkKKyAgICAgICBpZiAoZm9saW9fdGVzdF91cHRvZGF0ZShmb2xpbykpCisgICAgICAgICAg
ICAgICBmb2xpb19sb2NrKGZvbGlvKTsKKyAgICAgICBlbHNlIGlmICghbG9ja19mb2xpb19tYXli
ZV9kcm9wX21tYXAodm1mLCBmb2xpbywgJmZwaW4pKQogICAgICAgICAgICAgICAgZ290byBvdXRf
cmV0cnk7CgogICAgICAgIC8qIERpZCBpdCBnZXQgdHJ1bmNhdGVkPyAqLwpkaWZmIC0tZ2l0IGEv
bW0vbWVtb3J5LmMgYi9tbS9tZW1vcnkuYwppbmRleCA3ZjcwZjAzMjRkY2YuLjM1NWVkMDI1NjBm
ZCAxMDA2NDQKLS0tIGEvbW0vbWVtb3J5LmMKKysrIGIvbW0vbWVtb3J5LmMKQEAgLTQ3NTgsNyAr
NDc1OCwxMCBAQCB2bV9mYXVsdF90IGRvX3N3YXBfcGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikK
ICAgICAgICB9CgogICAgICAgIHN3YXBjYWNoZSA9IGZvbGlvOwotICAgICAgIHJldCB8PSBmb2xp
b19sb2NrX29yX3JldHJ5KGZvbGlvLCB2bWYpOworICAgICAgIGlmIChmb2xpb190ZXN0X3VwdG9k
YXRlKGZvbGlvKSkKKyAgICAgICAgICAgICAgIGZvbGlvX2xvY2soZm9saW8pOworICAgICAgIGVs
c2UKKyAgICAgICAgICAgICAgIHJldCB8PSBmb2xpb19sb2NrX29yX3JldHJ5KGZvbGlvLCB2bWYp
OwogICAgICAgIGlmIChyZXQgJiBWTV9GQVVMVF9SRVRSWSkgewogICAgICAgICAgICAgICAgaWYg
KGZhdWx0X2ZsYWdfYWxsb3dfcmV0cnlfZmlyc3Qodm1mLT5mbGFncykgJiYKICAgICAgICAgICAg
ICAgICAgICAhKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkgJiYKCkluIHRo
YXQgY2FzZSwgd2UgYXJlIGxpa2VseSBqdXN0IHdhaXRpbmcgZm9yIHRoZSBtYXBwaW5nIHRvIGJl
IGNvbXBsZXRlZCBieQphbm90aGVyIHByb2Nlc3MuIEkgbWF5IGRldmVsb3AgdGhlIGFib3ZlIGlk
ZWEgYXMgYW4gaW5jcmVtZW50YWwgcGF0Y2ggYWZ0ZXIKdGhpcyBwYXRjaHNldC4KClRoYW5rcwpC
YXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
