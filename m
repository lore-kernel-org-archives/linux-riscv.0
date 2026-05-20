Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B3FCD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICPHCTI2svLfzonHDKDFBtcfpeJR6SUub3HGUQ/RtHE=; b=qJ7dUzqq2Qwq+K
	3Icce5RvmTeoGj7nb3dwXzFa7vwq3IZcRY8DiVjP7PO4Q7yy+vDnoT3kU8iexaCdZ8LFKjOiAIB7b
	q7lqi84RnBrpTLMH+yJlKlNZouJ5BA6ZM+yc3rsaberd0gLM2GS+KYjyL468ae1r4b/PPnTbiBQpE
	0e7C/UzEUR7FmRevo4Sp1k4JA4W7krhAl3thkl/+vVef2yclcRnp88wW+8pDnkw5vtFI+fDuJAEcf
	VIgqfI3pRhx3Yxvrq82KuV7ebnwGIfFtbVbXimZsHOvDrgTj8GtrWPb5tM6VXaPOAf4wyjDn4aiSi
	nXHnBOfILe/webdNpQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoa1-00000005rH2-1i7u;
	Wed, 20 May 2026 21:35:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoZz-00000005rGE-2NE2;
	Wed, 20 May 2026 21:35:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA8D660098;
	Wed, 20 May 2026 21:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFDF1F00A3D;
	Wed, 20 May 2026 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779312950;
	bh=M4GlRj+JVNLEfSh+vgkfiIIQJ0TzUbveTmDP2V2Vkzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eyp0NelBt18y71uxyltCpRt5OnNFBW8axOeq1fjE5NvXM8d3rxebFRy0EoPeSOMnq
	 1ggxn6O6Q37L5TAs6pci0ZUofIhKmeCd6/LvI1Xk/YqQ88n1dMEv0pO9JtXc2uKC0M
	 ND+R1svTmDFr+E6HnUbF0zC+9c+rwnkItvU3DLvP9jGy25gnQJ09AH8v1htMUdhww6
	 51m/m0/HqRCbJMfu5PTLNMNNdMugTXPkHXY2+F47/4d8Kf/yYicHZR4vlx0GSjJ9Sn
	 hWzUfinW+0dkiP/hm67VEnrEEQhQIn7km7Thh0TUIna267F4RzyNfV6xulLyhthA8w
	 vI7NzcgDlEb3Q==
Message-ID: <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
Date: Wed, 20 May 2026 23:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>, Barry Song <baohua@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 akpm@linux-foundation.org, linux-mm@kvack.org, vbabka@kernel.org,
 rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
 wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
 kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
 kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
 bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
References: <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org>
 <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ag4kj84EcKqamdB-@casper.infradead.org>
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

T24gNS8yMC8yNiAyMzoxNSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjEs
IDIwMjYgYXQgMDU6MTQ6MjBBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPj4gTXkgdW5kZXJz
dGFuZGluZyBpcyB0aGF0IHdlIHNob3VsZCBub3QgYmxhbWUgYXBwbGljYXRpb25zIGhlcmUuIFRo
aXMgaXMgMjAyNjoKPj4gdGhlcmUgYXJlIGJhc2ljYWxseSBvbmx5IHR3byBraW5kcyBvZiBhcHBs
aWNhdGlvbnMg4oCUIHNpbmdsZS10aHJlYWRlZCBhbmQKPj4gbXVsdGktdGhyZWFkZWQg4oCUIGFu
ZCBzaW5nbGUtdGhyZWFkZWQgYXBwbGljYXRpb25zIGFyZSBuZWFybHkgZXh0aW5jdC4KPiAKPiBh
bGwgb2YgdGhlIGFwcGxpY2F0aW9ucyBpIHJ1biBhcmUgZWl0aGVyIHNpbmdsZSB0aHJlYWRlZCBv
ciBkb24ndCBmb3JrLgo+IHdoYXQgbXVsdGl0aHJlYWRlZCBhcHBsaWNhdGlvbnMgY2FsbCBmb3Jr
PwoKVHJhZGl0aW9uYWxseSB0aGUgcHJvYmxlbSB3YXMgcmFuZG9tIGxpYnJhcmllcyB1c2luZyBm
b3JrK2V4ZWN2ZSB0byBsYXVuY2ggb3RoZXIKcHJvZ3JhbXMgLi4uIGluc3RlYWQgb2YgdXNpbmcg
YWx0ZXJuYXRpdmVzIGxpa2UgcG9zaXhfc3B3YW4gKHNvbWUgdXNlIGNhc2VzCnJlcXVpcmUgbW9y
ZSB3b3JrIGRvbmUgYmVmb3JlIGV4ZWN2ZSBhbmQgY2Fubm90IHlldCBzd2l0Y2ggdG8gdGhhdCku
IEknZCBob3BlCnRoYXQgdGhhdCBpcyBsZXNzIG9mIGEgcHJvYmxlbSBvbiBBbmRyb2lkLgoKSSBh
c3N1bWUgQW5kcm9pZCB6eWdvdGUgbWlnaHQgYmUgbXVsdGkgdGhyZWFkZWQ/IE1heWJlIHNzaGQg
YXMgd2VsbD8gU3lzdGVtZD8KQnV0IEknZCBiZSBzdXJwcmlzZWQgaWYgdGhlcmUgYXJlIHJlYWxs
eSBwZXJmb3JtYW5jZSBpbXBsaWNhdGlvbnMuCgpOb3Qgc3VyZSBhYm91dCB3ZWJicm9zd2VycyAu
Li4uIEkgdGhpbmsgbW9zdCBvZiB0aGVtIHN3aXRjaGVkIHRvIGZvcmsgc2VydmVycywKd2hlcmUg
SSB3b3VsZCBhc3N1bWUgZm9yayBzZXJ2ZXJzIHdvdWxkIGJlIHNpbmdsZS10aHJlYWRlZC4KClNv
LCB5ZWFoLCBnZXR0aW5nIGEgY2xlYXIgdW5kZXJzdGFuZGluZyBob3cgdGhpcyBlbmRzIHVwIGJl
aW5nIGEgcHJvYmxlbSBvbgpBbmRyb2lkIHdvdWxkIGJlIGdyZWF0LgoKLS0gCkNoZWVycywKCkRh
dmlkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
