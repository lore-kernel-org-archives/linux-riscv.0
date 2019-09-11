Return-Path: <SRS0=3S6Q=XG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA9DECDE27
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 09:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6052C21928
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 09:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/DiIPVz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VuZMT/9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6052C21928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leZjg2xUq5aeQue2lpq0kdAVfU+qzFndU4SDUEtvH2Y=; b=p/DiIPVzZm1p4I
	7Ip06SYGshhD/xj7BK4kc5gDJw+UaxxKEJmP0jcZCHQrZ4CcySmHSsagHhww17/UkIdx27UcCoto2
	jj1RcJp18V8lmUhVTBneN5yGyqegkABO997ohT4qi98ayH9oiw1WaoZIraixPFFPWW9bltlQccItf
	5ZYyZpAKq+g1tQCYp06JIsBQpAjJ0B4G0IZj3WUuiS+X2jyREDL4Ye7ZNnsYuDXyN0lEd6ya/bbZ7
	XhQE98Yrup4Apa1EaCxssj8OAOwlGTS+YS6xt1O/IMtExZrRqKKSM/S+8hBnsCNSqNaIrXf7MfTl9
	Bdy5XyInIHqAWBAZZ1jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7yZC-0004ZA-BB; Wed, 11 Sep 2019 09:05:34 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7yZ7-0004Xe-RJ
 for linux-riscv@lists.infradead.org; Wed, 11 Sep 2019 09:05:31 +0000
Received: by mail-io1-xd29.google.com with SMTP id k13so28918132ioj.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2019 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rcHZ7V9Te0/ZBIfH3p5NzVwZRy2kREKEbZcXarQ/wOM=;
 b=VuZMT/9XyJEIM69eA46bFbypZPJF66OB0+eSboBzzYL5ASttwOQDAvjxBBR4sJslqo
 RMQdGFnVp/sy5tBDcpa85qTZS9WjktN0bXZqAhhyXtpuS1uQTovRyqMQm8eXoPkA4rLt
 DZgllNzl7KB8TbmGFGr3QuS06gigYWatW9pjg0uU2D1wimW2rIhLCw+txOdMN51hhfB4
 45ndhddr33F7vXCu/e4xNx+hjQMJMa6fP+LveWJlypqHRWl5tfOFIn0D+HGp1JzB7v/0
 3NmwX/4Pi13AZbC/c2Q0EjUzPwNMM4HVXo0s9SirPfru7sxaCaBA8SeFZ9tBXWJDGlVP
 0VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rcHZ7V9Te0/ZBIfH3p5NzVwZRy2kREKEbZcXarQ/wOM=;
 b=bZ3Q/rOzP2BT0nIKfAeCosCHpnKCkjcwLuWmA6a+R5o4dEjRsu8GW+50K+6/ZyZLJ8
 2RaPAYjBkmFygoq7bjN0jviT/JpuLhfTrxqN5JDPZq9hFc79RvTMFVDdBvnhqrxcOsci
 +DZC7LejAEFgjLSrTu1HpSjuyKLC9o7MP+QDc5r0pcnL0kxJ3vNdeBd5RFqbipEz4sJi
 tu4So2NnOy6zI+626E3HPJm6Fyx1q84TXTfDNwhazuwXOcrNChjQZpxIitIXYPrfEphI
 glUeByK/Z0Aa6sAEVh6YwV+TdBGyjUiBZTDDZMF42FWxm2LCtKrxZe9gKW1KmXKSGQiu
 NJIg==
X-Gm-Message-State: APjAAAVPcHEGP46ZENZmco0RfEFgXPSz3pizFLjJ3qgImLTnHSVqsA9q
 CmPV5N/3Nb3qbOsHJhSmwuqdQg==
X-Google-Smtp-Source: APXvYqxMF51CnJ0mEaL1+NJdgmTNVeMqdL8V/PSvNSEU5r+6PqGq+T4qLRqwfbLWRxw4GTVfEcRVrw==
X-Received: by 2002:a02:c790:: with SMTP id n16mr37716992jao.10.1568192726929; 
 Wed, 11 Sep 2019 02:05:26 -0700 (PDT)
Received: from [192.168.1.138] ([216.160.37.230])
 by smtp.gmail.com with ESMTPSA id u6sm3745241iol.49.2019.09.11.02.05.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 02:05:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [RFC] buildtar: add case for riscv architecture
From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
In-Reply-To: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
Date: Wed, 11 Sep 2019 04:05:25 -0500
Message-Id: <8EF02DA7-46D3-4EA8-96FB-27708BF25DAC@sifive.com>
References: <NwVOGH2ZdDQaDK35QUy7y8GS__G8IYSIUUIBAJsimZq5BgvI3SzLS3uY6fV7Pgppq-RTRHzpT-8KrsLjDN74CPWwHTCWoSgHkGbeJNvyS30=@aurabindo.in>
To: Aurabindo Jayamohanan <mail@aurabindo.in>
X-Mailer: Apple Mail (2.3445.9.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_020529_922930_50200C4A 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Tm9uZSBvZiB0aGUgYXZhaWxhYmxlIFJpc2NWIHBsYXRmb3JtcyB0aGF0IEnigJltIGF3YXJlIG9m
IHVzZSBjb21wcmVzc2VkIGltYWdlcywgdW5sZXNzIHRoZXJlIGFyZSBzb21lIG5ldyBib290bG9h
ZGVycyBJIGhhdmVu4oCZdCBzZWVuIHlldC4KCgo+IE9uIFNlcCAxMSwgMjAxOSwgYXQgMjowNyBB
TSwgQXVyYWJpbmRvIEpheWFtb2hhbmFuIDxtYWlsQGF1cmFiaW5kby5pbj4gd3JvdGU6Cj4gCj4g
SGksCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGtub3cgaWYgc29tZXRoaW5nIGV4dHJhIG5lZWRzIHRv
IGJlIGRvbmUgb3RoZXIgdGhhbiBjb3B5aW5nIGNvbXByZXNzZWQga2VybmVsIGltYWdlLCB3aGVu
IG1ha2luZyB0YXIgcGFja2FnZSBmb3IgcmlzY3YgYXJjaGl0ZWN0dXJlLiBQbGVhc2Ugc2VlIHRo
ZSBhdHRhY2hlZCBwYXRjaC4KPiAKPiAtLQo+IAo+IFRoYW5rcyBhbmQgUmVnYXJkcywKPiBBdXJh
YmluZG8gSmF5YW1vaGFuYW4KPiA8MDAwMS1idWlsZHRhci1hZGQtcmlzY3YtY2FzZS5wYXRjaD5f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
