Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C863CD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7ahKVDr4QvnTGnHCsAB3HKLdbQG1utiUFTLgw+ePx0=; b=b7cMa+z6Er08ET
	xi/YiSjZ6xd10lVjElrViU0AeayFtg4qKM7q94MfBLorrht9vHma53Oa0L55H/fRkt0kVDvaZmzaI
	rVxGtCk74tF32spkZq8DyRgIjjiklMpv6DaCV8BX+sHEMS1xR7hCspbhXpA/1/J3iyvSNX0Kf25iz
	AWFNmqeMABLsUuLg7Mb1wA0R6KYNmgFs+19nlC6KiXxOLtIslijK8DqE5mjtswo4Gik0YUFSPBUmT
	lPRAsvJQ2xIOq3dhUQaCdUvgBzECH9Rzw7PH+zHlrf3n9B9A8YY2w0Nq6jfvcSxsKXWowhWRR0XBF
	EwE/YnKLeRzz/9pLOJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoGw-00000005oYW-0Qzc;
	Wed, 20 May 2026 21:16:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoGu-00000005oY8-1Q6i;
	Wed, 20 May 2026 21:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fU02cunUf5qx+CTJ998toCQden5I5L9eTw1htlE14B4=; b=Ahb0j2Ei6nx5qSArSbx3QXwe7j
	nN0qnERaYLGpASZAP09LlU+EPQowKBvJPWhRsI00juo+im78mkgYHs+sP5ZWwXXBd7zRVmKWFHh91
	ozzCsrVpwBFURX4JqqoPT0iEmX8E9NvxsJFClE4jAwVlL4pGe782qw3PvR74tDYThCZ3q+fwmuY2k
	TzdU054pRFbgWK4qDrlWLvQekRsHk+y4KM+0uWUFsCECk4H+2CGnBJFwpoiJbHR/MvjI7M4kc/Ssx
	zg1lHxgjWogJBSyWKXMDALCFwuerNCe/Tci5nkDTpyDfHMo2R9PAJoJdp1sxjZy6+MelEhK4vLDAA
	A5g2JMmA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPoGl-00000007air-0tv9;
	Wed, 20 May 2026 21:15:59 +0000
Date: Wed, 20 May 2026 22:15:59 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, david@kernel.org, vbabka@kernel.org,
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag4kj84EcKqamdB-@casper.infradead.org>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
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

T24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgMDU6MTQ6MjBBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgd2Ugc2hvdWxkIG5vdCBibGFtZSBhcHBsaWNh
dGlvbnMgaGVyZS4gVGhpcyBpcyAyMDI2Ogo+IHRoZXJlIGFyZSBiYXNpY2FsbHkgb25seSB0d28g
a2luZHMgb2YgYXBwbGljYXRpb25zIOKAlCBzaW5nbGUtdGhyZWFkZWQgYW5kCj4gbXVsdGktdGhy
ZWFkZWQg4oCUIGFuZCBzaW5nbGUtdGhyZWFkZWQgYXBwbGljYXRpb25zIGFyZSBuZWFybHkgZXh0
aW5jdC4KCmFsbCBvZiB0aGUgYXBwbGljYXRpb25zIGkgcnVuIGFyZSBlaXRoZXIgc2luZ2xlIHRo
cmVhZGVkIG9yIGRvbid0IGZvcmsuCndoYXQgbXVsdGl0aHJlYWRlZCBhcHBsaWNhdGlvbnMgY2Fs
bCBmb3JrPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
