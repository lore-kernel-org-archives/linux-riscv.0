Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9ABC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wp/eTUbuRM/w/uSLGPMCSXWXPwKS2jDgcWiuYFri6LY=; b=aLxqjRDxPmTgqd
	8AdCacJMxHFRm5oTV2EAhw8bHy8AsubcSTzewhwdgYoHpBz313clCiwl1UalR1s5RLO75VKo/LW64
	t/dBZID9DHeKdRUOrl86zWQGqXyo34RoPrNpDKLScx3BBvki440oVViW3F4oHh9vGGXladi7REJCB
	Q7UHtkbqbwayP7Ts8K8h3WRHsMG6Q3+Kh8qR91N8RwzI5HR6PBjiAYjBxWpy5Yb3pY+uIT47EF20P
	LjbK+3Ec5L5l49C19zuTHvY9xqY5HdSgHkc+xKwjJ1iwXU916y6ywkkiRIJoJMKF/W/GDsL3RF7d+
	lzFoZKsSoZORtfm3VtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptis6-000GAt-2j;
	Tue, 02 May 2023 05:48:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptis2-000G91-10
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 05:48:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 758F161176;
	Tue,  2 May 2023 05:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E96C433A1;
	Tue,  2 May 2023 05:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683006492;
	bh=QFgaj7LjOrwpefjycjAmRiPltPmbzaKTfT0CxHr+JHM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hfa//+lu0sjGGGOxJsmQ44lujZhVUV+VfiLQUr0aH/LzssxPSs2lOuCQt22bq5KvA
	 Wd+Y8u5Apo4fAjESUe3gn7M49eiSL8pt6WCiAitd7kUMepo2bUEsdbhdV7J6az9z7n
	 I4LP9FNdulOHXU3bJqm5xUJhFQB+e8aFqAzD+0F3REly8K+dod9oBXxU3eVIfgYqh3
	 76np80FnIzeGF7TmEt7vw+0BPCnRB8z70XaLzMVW15BekKWUOdjb6NZxrhDIFwAu0v
	 p9qVVUBSc7TP6ffTQgWhCuoXxcH9ZqIzDGavMrYmeDb/GJviWwFQ564PsBSDWtEofD
	 JABXIA36Kf2oQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Kito Cheng <kito.cheng@sifive.com>, Conor
 Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, Heinrich
 Schuchardt <heinrich.schuchardt@canonical.com>, Greentime Hu
 <greentime.hu@sifive.com>, nick.knight@sifive.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 richard.henderson@linaro.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux
 vector
In-Reply-To: <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <87ednz7roh.fsf@all.your.base.are.belong.to.us>
 <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
Date: Tue, 02 May 2023 07:48:10 +0200
Message-ID: <878re77085.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_224814_386241_0FD67889 
X-CRM114-Status: GOOD (  10.35  )
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

SmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cml0ZXM6Cgo+IEFsbCBJIHdhbnRl
ZCB3YXMgc29tZSBzaW1wbGUgZXh0ZW5zaW9uIHN0cmluZyAtPiB2ZXJzaW9uIG51bWJlciBmdW5j
dGlvbgo+IGFzIGEgc3RhbmRhcmRpc2VkIHVzZXJzcGFjZSBpbnRlcmZhY2UuLi4gYmVjYXVzZSBh
dCB0aGUgZW5kIG9mIHRoZSBkYXkKPiBwZW9wbGUganVzdCB3YW50IHRvIGtub3cg4oCcY2FuIEkg
dXNlIGV4dGVuc2lvbiBZP+KAnSwgcG9zc2libHkgd2l0aCBhCj4gbWluaW11bSB2ZXJzaW9uLiBC
dXQgbWF5YmUgdGhlcmXigJlzIHNvbWUgaG9wZSB0aGF0IExpbnV4IGxpYmNzIHdpbGwKPiB0cmFu
c2xhdGUgc3VjaCBxdWVyaWVzIGludG8gcG9raW5nIGF0IHRoaXMgaHdwcm9iZSB0aGluZy4KClVz
aW5nIGh3cHJvYmUgdG8gcGx1bWIgc3VjaCBhbiBpbnRlcmZhY2UgZm9yLCBzYXkgbGliY3MsIHdh
cyB3aGF0IEkgd2FzCmVudmlzaW9uaW5nLgoKPiBUaG91Z2ggZ29kIGtub3dzIHdoYXQgdGhleeKA
mXJlIGdvaW5nIHRvIGRvIGFib3V0IHZlbmRvciBleHRlbnNpb25zLAo+IGVzcGVjaWFsbHkgaWYg
dGhvc2UgdmVuZG9yIGV4dGVuc2lvbnMgb25seSBnZXQgc3VwcG9ydGVkIGluIHZlbmRvcgo+IGZv
cmtzIG9mIHRoZSBrZXJuZWwgKHdob+KAmXMgYWxsb2NhdGluZyB0aGVpciBlbmNvZGluZ3M/IFh2
ZW5kb3Jmb28KPiBleGlzdHMgdG8gbmFtZXNwYWNlIHRoZW0gYW5kIGdpdmUgdmVuZG9ycyBjb250
cm9sLi4uKS4KCiJ0aGV5J3JlIj8gSSdtIHN1cmUgeW91ciBpbnB1dCBvbiBob3cgdG8gZGVzaWdu
IHN1Y2ggYW4gaW50ZXJmYWNlIHdvdWxkCmJlIGJlIG11Y2ggYXBwcmVjaWF0ZWQhCgpNeSB2aWV3
IGlzIHRoYXQgdGhlICJkZXNpZ24gdXBmcm9udCIgc3RyYXRlZ3kgaGVyZSBoYXNuJ3QgcmVhbGx5
IHdvcmtlZApvdXQsIHNvIHRoZSBod3Byb2JlIGFwcHJvYWNoIGlzIHRvIHN0YXJ0IHNtYWxsLCBh
bmQgZXh0ZW5kIHdoZW4gdGhlcmUncwpuZWVkLiBIb3BlZnVsbHksIHRoZXJlIHdpbGwgYmUgZmV3
ZXIgcGFpbnMgd2l0aCB0aGlzIGFwcHJvYWNoLgoKVGhhdCdzIHdoeSBJIHdhcyB2ZXJ5IHN1cnBy
aXNlZCB0byBzZWUgdGhpcyBzZXJpZXMsIHdoaWNoIGludHJvZHVjZXMgWWV0CkFub3RoZXIgSW50
ZXJmYWNlLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
