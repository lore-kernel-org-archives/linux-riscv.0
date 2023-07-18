Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DC6C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6rZ1rJp94XXIATsm3RiMy8Lud+u10YW48Se907toBM=; b=PG4PRKkZxk5YHT
	ToESfzscYKB3QPMfyRk8w0toBtZ8LSa3gBN33bG8eM2CPcwp78NCHBbdiXykvDuUlxi29X8ibniWi
	2fkgJTQjzttn/1CHo+foNEK+y8iZcM0Sm/RIdClNDjpJ7IZUKx7uPqvKN/WBVGmSG9sSTIpsYv8ni
	TufTLTB5eG54kD5TiimmMi5w1COfXIcRPRqs//mfUpP8rXjG1lJQZTxR11cP8n4OpxNSyLloC+jyT
	83xy6u5rzI16uuPdDLMHy8CVXntzLxOX9Ww30QvH2IOvk8ZQaYopsB8fyV9UGwWn8RWwTLEfkdHs4
	8KiAEehthrIC4tHMwh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM139-005wfo-2c;
	Wed, 19 Jul 2023 06:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM137-005weQ-2J
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BNmey0qZr97jeo30G5U3uLZrj89rJCidj/kyhI65D0c=; b=JQEK3YObIkUsfoj9pXyghUu5de
	F2qRj714rcdUAmmAzLg3a80tZZKBDm3qvCypGHpIuEisFL5plKrCtevonLf7jEU3lFZNac0ZeNPQd
	IhDVyMd3a7uAi5/uSmKcNGZulA3i0sFZwWL34i/BeExdeSZi0qxU/SB6/CEwR8794BdQb7rdKh5OP
	jGYFm/MdUk/tBqJm+NAvSYJN92S0095aJrqMqF+LS4WJk6suJ2S/9FU2iWjX5iREyUejN0S7tcYl8
	6jXpuFXlCSLMIXnkEDVnkEsoIvfk3UBrSgGAG3njtctLVfHhTH1scTAHdZqOLRID9aifoHCku6GGd
	mwXTSVHA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLs7a-00C3hH-0R
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 21:20:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 388A560C5E;
	Tue, 18 Jul 2023 21:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD7EC433C7;
	Tue, 18 Jul 2023 21:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689715230;
	bh=BNmey0qZr97jeo30G5U3uLZrj89rJCidj/kyhI65D0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TGWyCWuGfwtm6RzVbBADCVL+Df6SgXsQAt+sY2GZ+UUNUYViUg2f1lYNlB/eGUrdO
	 RH/HcOzcrTsE0N/Tw5jkh4WY25SiL8MRai4bDMvUZsexYR2yD5/6i+EzDhOjUA8Lrp
	 lzIXLiKv5AN5SBXcwkHtHeAX0I6R/uRqV+X/hiH95oOBEpaJR5ETbAfu/3x2X7Ap2d
	 ALLQigK3dQLYLoNdWOheg3FzlKRpVsX0CgSIHwv0PcS4fblkvvpPf+sMPOdGertzcf
	 aLweMUgexBgjEliPFo4UFccw0FIM8ms1I5MNxMBvmKqInVsOagLjJdFwJf3m1XDQ9v
	 7Ax5DB6X7c24A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
In-Reply-To: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
Date: Tue, 18 Jul 2023 23:20:27 +0200
Message-ID: <871qh4lxwk.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_222041_090290_22DC4ABD 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4gV2hlbiB3
ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3Jvbmcg
dmFsdWUuCj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRl
ciBmMGJkZGY1MDU4NmQsIHdlIHdpbGwKPiBnZXQgRU5PU1lTIGluc3RlYWQuIFdlIGdvdCBzYW1l
IHJlc3VsdCB3aXRoIGNvbW1pdCA5YzI1OThkNDM1MTAgKCJyaXNjdjogZW50cnk6Cj4gU2F2ZSBh
MCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KPgo+IEFmdGVyIGFuYWx5
c2luZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgb25seSBi
ZSBleGVjdXRlZAo+IHdoZW4gc3lzY2FsbCAhPSAtMSBJbiBfX3NlY2NvbXBfZmlsdGVyLCB3aGVu
IHNlY2NvbXAgcmVqZWN0ZWQgdGhpcyBzeXNjYWxsIHdpdGgKPiBzcGVjaWZpZWQgZXJybm8sIHRo
ZXkgd2lsbCBzZXQgYTAgdG8gcmV0dXJuIG51bWJlciBhcyBzeXNjYWxsIEFCSSwgYW5kIHRoZW4K
PiByZXR1cm4gLTEuIFRoaXMgcmV0dXJuIG51bWJlciBpcyBmaW5hbGx5IHBhc3MgYXMgcmV0dXJu
IG51bWJlciBvZgo+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUsIGFuZCB0aGVuIGlzIGNv
bXBhcmVkIHdpdGggTlJfc3lzY2FsbHMgYWZ0ZXIKPiBjb252ZXJ0ZWQgdG8gdWxvbmcgKHNvIGl0
IHdpbGwgYmUgVUxPTkdfTUFYKS4gVGhlIGNvbmRpdGlvbgo+IHN5c2NhbGwgPCBOUl9zeXNjYWxs
cyB3aWxsIGFsd2F5cyBiZSBmYWxzZSwgc28gcmVncy0+YTAgPSAtRU5PU1lTIGlzIGFsd2F5cwo+
IGV4ZWN1dGVkLiBJdCBjb3ZlcmVkIGEwIHNldCBieSBzZWNjb21wLCBzbyB3ZSBhbHdheXMgZ2V0
IEVOT1NZUyB3aGVuIG1hdGNoCj4gc2VjY29tcCBSRVRfRVJSTk8gcnVsZS4KPgo+IEZpeGVzOiBm
MGJkZGY1MDU4NmQgKCJyaXNjdjogZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4g
UmVwb3J0ZWQtYnk6IEZlbGl4IFlhbiA8ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KPiBDby1k
ZXZlbG9wZWQtYnk6IFJ1aXpoZSBQYW4gPGMxNDEwMjhAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFJ1aXpoZSBQYW4gPGMxNDEwMjhAZ21haWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTogU2hp
cWkgWmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogU2hpcWkg
WmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBM
aXUgPENvZWxhY2FudGh1c0hleEBnbWFpbC5jb20+Cj4gVGVzdGVkLWJ5OiBGZWxpeCBZYW4gPGZl
bGl4b25tYXJzQGFyY2hsaW51eC5vcmc+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
