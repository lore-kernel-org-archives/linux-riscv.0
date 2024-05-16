Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F61AC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnBCYDVmlUYpuPr9mVSx6fDHi9tPASkg/QNzp6lu+vw=; b=sAkeiDubLVz77J
	vRcsUe5haBFOFIxvGDoYQJXq1BizJCgz4cpl5KcHfqW2atfdM4E6rfDRDqCrQWWHZTS64HiE+Ahzy
	DohZTdmtc8erTBylQ2Ri3GfgEx1Z5W8/++7ON2LWbj1Ef0uuj5cH7o+w1gcRSIAZZBPK9wyE0DomB
	alGf0JNIcfemytDkX73ItKAaj75yj12ll6Vyu+PyQjsdkHi/mZ+DF5NpCw1smxAxeVs9qYrPSW1nc
	kbks/9qKMOqpWaf6tC4eBJw7AxYuIX6M2eWfL68gu8qLCJVu0KpvzeJDsp6pE1fvUrMeYLeT63CxP
	LQ3bfxRMW19LJnHKKQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7R79-00000003UvJ-1Rou;
	Thu, 16 May 2024 02:45:03 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7R6x-00000003UsK-44pf
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 02:44:54 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5b2baa24c2bso2362576eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 19:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715827483; x=1716432283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGxOV3wnS+g16tgOJzMj1a3n3g/6Jdh9v3a/SW6PknE=;
        b=Cdari3/v8HzwxJVkL8UQQgzqx3iK2t48G0bVu/SdnZqhpcpKsNsgxU0/DsnvsbLmID
         8VmckADZ/9MnHM0OVIT2hRAocA88VGfD5mRfqF8jcNGidveGitNww3q5V3zKI4MkCPur
         qFTwH7dF4hcKALCdy00hPl+SeZr/XI1wUJu7tvuu8nUN0sueiqWEtCSDrZMccPIfI374
         UwIagzPgOJ2jUo/uHjZFw7QhmxFwC2GeNPGew/CIx6Gc2kq56G79iIpxR8FstfzvpfqE
         V59q2BMhGFCZBCpGG6loLcyWAhhOoABtWDaYxQKhPedKd/DoTgHGfy15UOqLUZxktxzr
         GgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715827483; x=1716432283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGxOV3wnS+g16tgOJzMj1a3n3g/6Jdh9v3a/SW6PknE=;
        b=eLZpi6ZLyPw8TPyxsY1IiJa/oy6DfmxNL9XzGCBYaNWH4eSMhxNkOQb+gWRltI1PzO
         Prw/eorD6HL+1Vh0KrYxt184VBpktNKvgM4FcJw5vH+JyQHhFMbM8qHkrvpey8afXdMt
         FJzdQ6l8DtB85TbsOzwJq2mJdnYjsI47afwCApMjq9VIMkqTEiWuEZZTppZXoOj1lmvX
         yoKv8MsKCbO052n5db7WQTWSQ4pAa3sTYTcYWNtKV7LIems3OX+3aJJSGBPcdQo0GKuY
         Af3iynbCy31bSKWpZbqgfrid/yOWQqGfA+7sRGLWrIvkIvJHhU5rGgrsVQCvmHhHAqD8
         4Juw==
X-Forwarded-Encrypted: i=1; AJvYcCWjBko61mp6hxHjvRta3kOaMBxtbBN3l6OipZII+a0UtxMgPKFcCJYvFxY9ahy88QrV8eoJOssjwVGWd/wNO6eZKAYQFL4Suessr39gfweg
X-Gm-Message-State: AOJu0YwAnnHSYLdXyZ42+r1N8F0W3z+S0b5cK/KXJTN5itw1gXBUYLde
	xYJg7J1Hc/jP8rxtfte8F67nY9mLwHoiyEnRz2ztDAsSY9usKVSjlga3qHjXflallTmZ6f6ZwcA
	BdHTB5H0WoYWGIpnHjI6qVHMVldEIwPwx52Qi+w==
X-Google-Smtp-Source: AGHT+IE+AorXjKiDhK6gFlMN5F8GI0I/gxP966lZSFfLKOiXPDnBZKxKMe4kgkVyKv3bdhlJJbDGdmSOXBhj6AdnN88=
X-Received: by 2002:a05:6871:1ce:b0:233:60e7:52bf with SMTP id
 586e51a60fabf-24172fca296mr22838572fac.50.1715827483168; Wed, 15 May 2024
 19:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
 <20240509073300.4968-2-cuiyunhui@bytedance.com> <ZjzrXnOc5AAost4O@bogus> <CAEEQ3wkHc-EaRPKLivZoxO6jKXv9bigbYhacWouL7+KbgbwWpQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wkHc-EaRPKLivZoxO6jKXv9bigbYhacWouL7+KbgbwWpQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 16 May 2024 10:44:31 +0800
Message-ID: <CAEEQ3wkpKHryCcNXpDXCi5tsfz2ryc9y_7JbvREg3D2MMic2ng@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_194452_256647_0C59C469 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, rafael@kernel.org, jhugo@codeaurora.org, tiantao6@huawei.com, john.garry@huawei.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org, pierre.gondois@arm.com, james.morse@arm.com, Jonathan.Cameron@huawei.com, paul.walmsley@sifive.com, bhelgaas@google.com, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKR2VudGxlIHBpbmcgLi4uCgpPbiBGcmksIE1heSAxMCwgMjAyNCBhdCA1OjA5
4oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gSGkg
UGFsbWVyLAo+Cj4gVGhlcmUgYXJlIGFscmVhZHkgcmVsYXRlZCBSZXZpZXdlZC1ieSwgR2VudGxl
IHBpbmcuLi4KPgo+IE9uIFRodSwgTWF5IDksIDIwMjQgYXQgMTE6MjfigK9QTSBTdWRlZXAgSG9s
bGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE1heSAwOSwg
MjAyNCBhdCAwMzozMjo1OVBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gPiBCZWZvcmUg
Y2FjaGVpbmZvIGNhbiBiZSBidWlsdCBjb3JyZWN0bHksIHdlIG5lZWQgdG8gaW5pdGlhbGl6ZSBs
ZXZlbAo+ID4gPiBhbmQgdHlwZS4gU2luY2UgUklTQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBoYXZl
IGEgcmVnaXN0ZXIgZ3JvdXAgdGhhdAo+ID4gPiBkZXNjcmliZXMgY2FjaGUtcmVsYXRlZCBhdHRy
aWJ1dGVzIGxpa2UgQVJNNjQsIHdlIGNhbm5vdCBvYnRhaW4gdGhlbQo+ID4gPiBkaXJlY3RseSwg
c28gbm93IHdlIG9idGFpbiBjYWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4g
PiA+IChhY3BpX2dldF9jYWNoZV9pbmZvKCkpIGFuZCBzZXQgdGhlIGNhY2hlIHR5cGUgdGhyb3Vn
aCBzcGxpdF9sZXZlbHMuCj4gPiA+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogSmVyZW15IExpbnRvbiA8
amVyZW15LmxpbnRvbkBhcm0uY29tPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8
c3VkZWVwLmhvbGxhQGFybS5jb20+Cj4gPgo+ID4gSSBhbSBub3Qgc3VyZSB3aHkgeW91IGhhdmUg
bm90IGFkZGVkIG15IHJldmlld2VkLWJ5IGFzIEkgd2FzIGhhcHB5IHdpdGgKPiA+IHYzIG9ud2Fy
ZHMgSUlSQy4gQW55d2F5cywgSSB3aWxsIGdpdmUgaXQgYWdhaW4g8J+YhAo+ID4KPiA+IFJldmll
d2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+ID4KPiA+IC0tCj4g
PiBSZWdhcmRzLAo+ID4gU3VkZWVwCj4KPiBUaGFua3PvvIwKPiBZdW5odWkKClRoYW5rcywKWXVu
aHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
