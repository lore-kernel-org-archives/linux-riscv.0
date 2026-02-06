Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56F0EE208C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVux6qXZVr2EbDRFct9YzANmSUOW6f/QIUhzv9E8+c8=; b=CwwzAWVPTXuZeh
	HSpfJDrUv6T7j5eVlCbK0sZ/4J99Iv8duHz2bbGRznx/lErTUF6UGH96Vu92F8ylv/0sKYJVgdJ8c
	ykLk1Na6LzPu+D7vDjGWzLBgWGG5sB2v3P8cA4JBSCCqF9gHf2pNnsvVzsR/ktF9JqevkyBdfezuy
	whU6WAKz446tcX0gzn7olb9EiVY6tfQSAXLH7lkJR2KaEEu3YJzRQvtkeRU7d+s9lGVBEkBLisbZN
	Dm3mNo2wNM6eDnONAPuFNSxzAhVssJ/qcEPcOslXileU41JoI+mqF9s23LgX5P7p+mQW2vXEOYfP/
	YE26VM6kns/HfbfQg20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voK4H-0000000BFJj-3X83;
	Fri, 06 Feb 2026 11:32:09 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voK4E-0000000BFFd-1SHT
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 11:32:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770377400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITumhlz+/UdtXGfg3WyulDtDYIlhfRGFQ9+Wjyji2Rk=;
	b=rQK0YrHArRPOsJYN3KiV7S4p3dtWZ8Tbj/6UY7zrqJPfGZtFxyHekDwmjG0sGFDoBoJgjb
	2Miw/wRC38H5Mz1a0tX5ea7YNdtcrr5x2wykbba6TOelzcCqA6tAA6cauqagNDreVejUm/
	8mzvFdpyvPhG9W5cdn2sVaIMdoerqUI=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next 0/3] bpf: fsession support for riscv
Date: Fri, 06 Feb 2026 19:29:30 +0800
Message-ID: <2830483.mvXUDI8C0e@7950hx>
In-Reply-To: <CAJ+HfNh63kg7QNOVhn4As1nGBLDLEy72zaiz0i2+CZKe=f9WuA@mail.gmail.com>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
 <CAJ+HfNh63kg7QNOVhn4As1nGBLDLEy72zaiz0i2+CZKe=f9WuA@mail.gmail.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_033206_532746_B55231AD 
X-CRM114-Status: UNSURE (   7.66  )
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

T24gMjAyNi8yLzYgMTk6MjAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gVGhhbmsgeW91IGZvciB3
b3JraW5nIG9uIHRoaXMhCj4gCj4gT24gVHVlLCAzIEZlYiAyMDI2IGF0IDA2OjUyLCBNZW5nbG9u
ZyBEb25nIDxtZW5nbG9uZzguZG9uZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEltcGxlbWVu
dCBicGYgZnNlc3Npb24gZm9yIHRoZSByaXNjdiBhcmNoaXRlY3R1cmUuCj4gPgo+ID4gTWVuZ2xv
bmcgRG9uZyAoMyk6Cj4gPiAgIGJwZixyaXNjdjogaW50cm9kdWNlIGVtaXRfc3RvcmVfc3RhY2tf
aW1tNjQoKSBmb3IgdHJhbXBvbGluZQo+ID4gICBicGYscmlzY3Y6IGFkZCBmc2Vzc2lvbiBzdXBw
b3J0IGZvciB0cmFtcG9saW5lcwo+ID4gICBzZWxmdGVzdHMvYnBmOiBlbmFibGUgZnNlc3Npb25f
dGVzdCBvbiByaXNjdjY0Cj4gCj4gSSdtIGhhcHB5IHdpdGggZWl0aGVyIGFkZHJlc3NpbmcgTGVv
bidzIGNvbW1lbnQgd2l0aCBhIGZvbGxvdy11cCwgb3IKPiBzcGlubmluZyBhIFYyLgo+IAo+IEZv
ciB0aGlzIHZlcnNpb24gcGx1cyBMZW9uJ3Mgbml0IGFzIGEgZm9sbG93LXVwLCBvciBhIFYyOgo+
IFRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gIyBRRU1VL1JWQTIz
L0RUCj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpIaSwgQmrD
tnJuLiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3aW5nIGFuZCB0ZXN0aW5nLiBJJ2xsIHNlbmQgYSBW
Mgpub3cgOikKCj4gCj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
