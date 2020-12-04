Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091E4C4361A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 09:06:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708252255F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 09:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 708252255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WPQek0D6ozS7tZHfODQpEIWQ/mg6ig44DV+qtbC4Dv0=; b=L/UqyhJUkGQzlQLSn8PWYAcw/
	WVmJcuSoqXsjk+6LqV2yvEsrvaoH0B9SDo9dDkyfkOE8W6ulDk+IR2/ITThfvXqWp7wnLqJWpcP71
	bSsR20hMDXHc98+m2TC6/ThpoDnOjkPZsKgUUtSVxLM0PejoPlFVVXCE91Dcocl6SDIgvi68VPM5f
	TDfQlJ8qSf+fVIYO6EgJA6xDnf/KQNdTxH9fmZxQ8gWox1J9FfgIC1Ff4eZS0PiqYBspzg+XpwbGo
	u+S/HINNa6Mxgghn8/08oJapcDffvyWungQVuYQod/w9iWtoNQO790d5g8lM2NFCxjgRn0OIPt8Gm
	c22nJgPog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl72h-0003Uc-Hz; Fri, 04 Dec 2020 09:06:19 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl72f-0003UK-0n
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 09:06:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 982AD22FB3;
 Fri,  4 Dec 2020 10:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607072770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkNJaPluVvv+Tgikv99K04Dg3690ZJDLlH87exn6LzY=;
 b=JW5j1Xw1BL9NmJQmZ4uE36/eh60zijRhhyEQJRwX0zz2jRUxEhkuOEELk0hupoOHt4Hxtr
 UBvJ0dJBhNv9hnLNBl/tFYM7ZpkcmpjnR13T/z5nYHWtul/6s+zXfaTg3wUdiZkM0+lrD+
 2zpJ+iCfUh94Sasx1TxTFOg7UAB83CU=
MIME-Version: 1.0
Date: Fri, 04 Dec 2020 10:06:10 +0100
From: Michael Walle <michael@walle.cc>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
In-Reply-To: <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
 <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
 <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <0dde3c67e0e895b8ce70de910a285fd8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_040617_213286_15701A23 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, linux-gpio <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW0gMjAyMC0xMi0wNCAwOToyOCwgc2NocmllYiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29u
c3VsdDoKPiBPbiAwMy4xMi4yMCAyMzozNSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gQW0gMjAy
MC0xMi0wMyAyMDowMCwgc2NocmllYiBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdDoK
Pj4+IE9uIDAyLjEyLjIwIDE1OjE1LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBidWZ3YWxrID0gbmFtZV9idWZmZXI7Cj4+Pj4+
ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKGlkeCA8IHByaXYt
Pm51bV9ncGlvcyAmJgo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJ1ZndhbGsgPCAobmFtZV9idWZmZXIrY2YubmFtZXNfc2l6ZSkpIHsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9fbmFtZXNbaWR4
XSA9IChzdHJsZW4oYnVmd2FsaykgPyAKPj4+Pj4gYnVmd2Fsawo+Pj4+PiA6IE5VTEwpOwo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmd2FsayAr
PSBzdHJsZW4oYnVmd2FsaykrMTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlkeCsrOwo+Pj4+IAo+Pj4+IAo+Pj4+IFNvbWV0aGluZydzIHdyb25n
IHdpdGggaW5kZW50YXRpb24gaGVyZS4KPj4+IAo+Pj4gaSBkb250IHRoaW5rIHNvOiB0aGUgImJ1
ZndhbGsgLi4uIiBsaW5lIGJlbG9uZ3MgdG8gdGhlIHdoaWxlIAo+Pj4gZXhwcmVzc2lvbgo+Pj4g
YW5kIGlzIHJpZ2h0IHVuZGVyIHRoZSAiaWR4IiwgYXMgaXQgc2hvdWxkIGJlLiBJIGRpZG4ndCB3
YW50IHRvIGJyZWFrIAo+Pj4gdXAKPj4+IGF0IHRoZSAiPCIgb3BlcmF0b3IuIHNoYWxsIGkgZG8g
dGhpcyBpbnN0ZWFkID8KPj4gCj4+IE9yIGRvbid0IGJyZWFrIHRoZSBsaW5lcyBhdCBhbGwuIEJv
dGggbGluZXMgZG9uJ3QgYWRkIHVwIHRvIG1vcmUgdGhhbgo+PiAxMDAgY2hhcnMsCj4+IHJpZ2h0
Pwo+IAo+IElJUkMgY2hlY2twYXRjaCBjb21wbGFpbnMgYXQgODAgY2hhcnMuIEhhcyB0aGF0IGJl
ZW4gY2hhbmdlZCA/Cgp5ZXMsCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWJkYzQ4ZmExMWU0NmY4Njdl
YTRkNzVmYTU5ZWU4N2E3ZjQ4YmUxNDQKCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
