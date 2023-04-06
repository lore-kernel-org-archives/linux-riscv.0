Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E29C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 02:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ey7oIm5Xf/Z6ZhWde7r+WgboIEMo7Ne8glgJLLRJuI=; b=tEHyhd8t1nv6LQ
	xvEtnvNmpBh4/4GoXjnTcHjfqJn+S8DNXcBkbqVZDfhp7wEOZ9rMIwx69yyZ1fya3Ew+MQPfnaG8S
	Z0XZZIEG3+CjboKHw52jhyxAIJEZBZXSM4qKFSZpE2XRcaPfoCCYdWojWLsLWFNoY0HEmczJw7EFo
	93shND0ueLVq3TWNTwejudnUf0ESfq9zdtbCv/rekIgHj/ehygW4gIXOqFxRT6qDW61alZosR3ezL
	f+OhYYolv2fkoIUvQMjSw0/GDFhKf8vsA3y2QRC/QSUBi0c74SGO+0LedwcVxC1ZnRhmCt1kqDvDr
	mmbLB13uxDei4DJn/mUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFXr-0069u9-2O;
	Thu, 06 Apr 2023 02:40:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkFXo-0069tF-38
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 02:40:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFC1C62D65
	for <linux-riscv@lists.infradead.org>; Thu,  6 Apr 2023 02:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6162CC4339E
	for <linux-riscv@lists.infradead.org>; Thu,  6 Apr 2023 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680748811;
	bh=LkwP71SP/70ZN7M7Tv0EhvcohUjcinoOGkY82vHCOIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MTM6vfcXqjdgV9GdqsYJUtrE4BqMldYTjp7lpRIMw4s00ZdAmL8ieghHZMw5ZsteZ
	 axdWzcrxpeaSAPJ01Y9RjHvUWfdGDMlRKP8DrYisI9ce8HIBE+rf9iFO5f7HSViFDO
	 FitcbcvmEzDIdhBok/zX/6gaUJExy+GMQDidhcABEW9nFWXZbIXC/RAX6ouigQUN/J
	 EBApsb0loXxcBYx9es0E9qmjMHPzxgY1cPO06J3b3gZ35UveohjY5tfTR+F5Ht+g0j
	 a7gpjiYFnsBfQibKonJbnTgPU3C3Aa689O9QEVkI5dQJVtdiTlUlxIHdU1D5Ub5OLv
	 UvAsZAhEEVPbQ==
Received: by mail-ed1-f46.google.com with SMTP id cn12so145913569edb.4
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 19:40:11 -0700 (PDT)
X-Gm-Message-State: AAQBX9eTDwgRlLxK30pD0pqT96dbzaOIP814GId3euVXdGHIbaNWKIuc
	9iKOO4aV7k3z21p/nBXiV0lCvARYybxFW3ap304=
X-Google-Smtp-Source: AKy350aWeiHvNj8ZW9kSwuOqRDOkYxlEWFxyXAsuIiEnuRY8aPMiLWJ+5aUOybtMjd4vaa+r9GEyeboXqzRhZFPjj8Y=
X-Received: by 2002:a17:906:2b49:b0:939:e928:5323 with SMTP id
 b9-20020a1709062b4900b00939e9285323mr4893999ejg.54.1680748809602; Wed, 05 Apr
 2023 19:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230404163741.2762165-1-leobras@redhat.com>
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 6 Apr 2023 10:39:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBm7_krSFjfSjD62pbfcaUOrfUhXzoHUD1-DKQ_SCLhA@mail.gmail.com>
Message-ID: <CAJF2gTTBm7_krSFjfSjD62pbfcaUOrfUhXzoHUD1-DKQ_SCLhA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Deduplicating RISCV cmpxchg.h macros
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_194013_112400_634F7316 
X-CRM114-Status: GOOD (  19.25  )
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

VGh4IExlb25hcmRvLAoKSXQncyBhIGdvb2QgcG9pbnQgZm9yIGNsZWFuaW5nIHVwLgoKT24gV2Vk
LCBBcHIgNSwgMjAyMyBhdCAxMjozN+KAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBXaGlsZSBzdHVkeWluZyByaXNjdidzIGNtcHhjaGcuaCBmaWxlLCBJ
IGdvdCByZWFsbHkgaW50ZXJlc3RlZCBpbgo+IHVuZGVyc3RhbmRpbmcgaG93IFJJU0NWIGFzbSBp
bXBsZW1lbnRlZCB0aGUgZGlmZmVyZW50IHZlcnNpb25zIG9mCj4ge2NtcCx9eGNoZy4KPgo+IFdo
ZW4gSSB1bmRlcnN0b29kIHRoZSBwYXR0ZXJuLCBpdCBtYWRlIHNlbnNlIGZvciBtZSB0byByZW1v
dmUgdGhlCj4gZHVwbGljYXRpb25zIGFuZCBjcmVhdGUgbWFjcm9zIHRvIG1ha2UgaXQgZWFzaWVy
IHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5Cj4gY2hhbmdlcyBiZXR3ZWVuIHRoZSB2ZXJzaW9u
czogSW5zdHJ1Y3Rpb24gc3VmaXhlcyAmIGJhcnJpZXJzLgo+Cj4gSSBzcGxpdCB0aG9zZSBjaGFu
Z2VzIGluIDMgbGV2ZWxzIGZvciBlYWNoIGNtcHhjaGcgYW5kIHhjaGcsIHJlc3VsdGluZyBhCkJ1
dCBob3cgYWJvdXQgbWVyZ2luZyAzIGxldmVscyBpbnRvIG9uZT8gKEkgbWVhbiBvbmUgZm9yIGNt
cHhjaGcgYW5kCm9uZSBmb3IgeGNoZywgcmVzdWx0aW5nIGluIDIgcGF0Y2hlcy4pCgo+IHRvdGFs
IG9mIDYgcGF0Y2hlcy4gSSBkaWQgdGhpcyBzbyBpdCBiZWNvbWVzIGVhc2llciB0byByZXZpZXcg
YW5kIHJlbW92ZQo+IHRoZSBsYXN0IGxldmVscyBpZiBkZXNpcmVkLCBidXQgSSBoYXZlIG5vIGlz
c3VlIHNxdWFzaGluZyB0aGVtIGlmIGl0J3MKPiBiZXR0ZXIuCj4KPiBQbGVhc2UgcHJvdmlkZSBj
b21tZW50cy4KPgo+IFRoYW5rcyEKPiBMZW8KPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBGaXhl
ZCAgbWFjcm9zIHRoYXQgZGVwZW5kIG9uIGhhdmluZyBhIGxvY2FsIHZhcmlhYmxlIHdpdGggYSBt
YWdpYyBuYW1lCj4gLSBQcmV2aW91cyBjYXN0IHRvIChsb25nKSBpcyBub3cgb25seSBhcHBsaWVk
IG9uIDQtYnl0ZXMgY21weGNoZwo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIEZpeGVkIHBhdGNo
IDQvNiBzdWZmaXggZnJvbSAndy5hcXJsJyB0byAnLncuYXFybCcsIHRvIGF2b2lkIGJ1aWxkIGVy
cm9yCj4KPgo+IExlb25hcmRvIEJyYXMgKDYpOgo+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNh
dGUgY21weGNoZygpIGFzbSBmdW5jdGlvbnMKPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRl
IGNtcHhjaGcoKSBtYWNyb3MKPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGFyY2hfY21w
eGNoZygpIG1hY3Jvcwo+ICAgcmlzY3YvY21weGNoZzogRGVkdXBsaWNhdGUgeGNoZygpIGFzbSBm
dW5jdGlvbnMKPiAgIHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIHhjaGcoKSBtYWNyb3MKPiAg
IHJpc2N2L2NtcHhjaGc6IERlZHVwbGljYXRlIGFyY2hfeGNoZygpIG1hY3Jvcwo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMzE5ICsrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDI1MiBkZWxldGlv
bnMoLSkKPgo+IC0tCj4gMi40MC4wCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
