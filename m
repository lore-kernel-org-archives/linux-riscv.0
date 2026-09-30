Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62925CA5FBA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25wWxuFIfIodNs8/QJf8QTs5JsWQWvmbkmp83YQHWM0=; b=w3aJeNsXL8dQvm
	dys0w8lXyZltDwqaCOk3WnqvcngN1OnvGEJnzFgXTP8DWHSjxoxlWfeanPnGUALE8/XainVr2prpB
	ZEQpRN2JO/MdINvrBPgwe0EPwgzrzHFc73CFjseIrZwXWVRMGKwgDvazV5cZZ5O5C9RbPNRLcWGok
	UE2x/ZEdJO9BUEb+x/Y2A3mzwABviHr0635TaAyDQEb0qcMUD9Tv61ltGK3xc7yM/1/S7wdN8BDpB
	BnJam76idefGDjwERC8v4CaJjKjKnGClX9SQMQDBKLXmxR9wfV0SFX8MBkZ9aerR94ZDO31qpl6me
	+6qt6U9Hng94FTTLb8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrXM-00000005l7L-2mhW;
	Wed, 30 Sep 2026 10:27:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrXL-00000005l7C-0l8v
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=; b=mbcqDikdhAZUi2aLdtkIcDfC4U
	Sg3aCAMlwm6WatJxlZQkqy8cSqyg/TZxJD6k+pMWfPxSeu5SScmFX/2nn6BYCDnciy7ivzA4VpvN+
	1NwfXFC6wbEUAsxn54ZONUvBU+KDv7E+f39i37aM3d+uSHqx170fz/9OXYQDfQp0inF+RUXObntvl
	ZtZqLWfBlDBkoIzQIpxHLCk7iXMjj/a8/DkXdXHxJWRdYwj0NQsYIcttyrkfZI1h4Hdl2uCt+3Z2T
	HKcBie5iH61/RNo8REE2aM/uQYh6IndNFitB6iOqCY4VpgEQhQuGRDZROwlhdOj1ty2bhk8DpFjzS
	DBmuMp7A==;
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrXB-00000003eSo-1A50
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:27:41 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34c5d196b0bso93406eec.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 03:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764051; cv=none;
        d=google.com; s=arc-20260327;
        b=dZFULxg1XiBW7jeQacIKdo8wX8BPTrR21FsK5IdtydzAiQH4pb+up80I6Pw1bTyL6Q
         sB3rDjsT1zm0jjxzmvPhGJpTZq1o5jhNmZDCJDX7XTzWjZn+2HhAb65FbhzjtkTaEVtg
         Q3abo2x3TzhRZzYJyOz/rwrBhR99WWRK1jb2SEDaZq9u4WT23hp7ND1fVuvEHEDRfTtj
         5evQFg5rTjHX3DOoemjYaZbN+x0e7b0aU50VwVOG/Z4lfny4uR8fRemJdzKSGG2p+5a8
         6Dx/JG+8vpJysNZzETICC31bcQCmIVlHkoF/arZoZ/TtIfYya9jBhU5pu12rwpsrDp2l
         cXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        fh=9WTqbErO7DYc3bTkxRHUuVNWfR4e9V51CAbvR3ys4QY=;
        b=cPgYVNbX2ydIkCDhiwFVNWCbqVgLpOXm4Tu4jCHwKUlYSdf+FF2zoCEIo0qteLOHMN
         FQhj/5eC68sfZykB/IY2RzrczfEHELqXUs5MAWlUwjudHCN5TZSwBD4sJOX6E6juf9dk
         xcjYEw6OUFKdrDQuDDyooKRFjnw/Z0Q55leaGhKJDjLLpTztbzksegtZQ8kUl9c4cpwS
         gVPvVFRiaPyakJKokRhCZy14NZiqzyCTVlC2SrJIi4JdXD8Cq9hDk9ekpD0L1NYcOgNm
         uQ22xstCOzu14xe93ep9+Cp4ezxjNUHcF1m3D/J2yHX/0njOK3DGTNuCrAwagP60nDeB
         Fuvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764051; x=1791368851; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        b=eJarqGsI792aeK0iH/Na0rAV8WHW875nKRLltUXEl9NdwKW9cQU2IQg7rnMoXMV7rt
         ufy81IXLw7rdRcTqEJQZGTkrUkQK45ErikaxpBsA6WcKJkBNZaY1k/althDhn6sgNQao
         fEUAhRwNRDVCk0w8GUIgJbXmXZsnVDgubiqHOunRaA5dB7QFoIK/bK7ojeN4HTn21fGI
         IEtdI8DKN3VfOY48yFVxQ5TVauBtnQPR5Mk04t3rf/v1js0xNhQZfEaKQ8GBXHU1HfzI
         Y5A53YV7og5VCMoZjBLZgwaisLnvgnsRpouqPrlrd/J1We6PTexdRxmZRNd3mh0sSiAv
         +Ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764051; x=1791368851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnWslcQfJFoVXI2eTJRtMgF2Yhhk9njWDc0SCnJiKsg=;
        b=urgZHGE6jfJuubbmcJs2hu3VJzgn7MBBsE3b1jXbk1qtHhQjlMg14b/X8O4eMY27oB
         IAT9bB9V4HA+q5L1ppFJYjgzJmKrAtvg3IryIOTI2f1jM2PNDtYMrliYMLo+12kWi5kj
         yQe+N51POctkQ9b7RxP/IbWHRagK6CH+eNpa49GFWAKt9s8cbAkIJm9xCgVFU9UR+3SZ
         gxgWZfJLwd/je965uIgtA0R5DFC9aXiY9JpA8T1COD63px+HPZ5vMTtFzcEkBDoh94gb
         BsvIlGlf5+G8AMQfR3O32/08/8g5Kbpc2ZIbeoCX8pKvDcHHUjSVXk7sfg3RC1CkuJxX
         NcUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4HN47irHZ6EG6eutrOKBC+kK6HxcQ7LzGTrDNsGu96YuKbf3gTUMtiz02lxrl+bWfz+M+ehcsiY2akA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKJKygqSFIhZlawaDlHO8dKcWKiI6wagxw1sRthpO9mx8j5L9im
	sNyZsNlh3QpB/qlg/OrF2bBzy7n8vKqBuOwzde5ii2CKiwTFWctlauxbcPL27oINteyBJ6ro1vI
	B7VfMWqwZ1Hnmgr4JR/2VX0XDQFWxBqM=
X-Gm-Gg: AYBFou3xi6o+pTCDo4lFXFPdvq2T4sYno5gV3XSjCzkYRoBCQE4VJcNrSxDOsykoU8+
	Yk6k+lmT3gqjeyp5laYShAFSOOx5MpoDoua+MTwLWIFFkgToxH0hn+bYWclbu7NmIwKnKKti35M
	mmbVP7hJMDCWrjuOAdeplOfXGTAR/DtQHpfHe9h9TMuNqAHeI3asB/ex8jqdYTJwZwZbNV2ki3p
	MCdQU4ZLSwYUQfWhDnEJCKKK18eX65hKdeP1k8a9f456byewKI8tbjBy68pm1HzKk2WKqJY7kyw
	NoRxVSvd4wmCpJvx0cQk2+UQ5GFWhjpTXPCjBktlZ5+oMxwaP/7IBsW+2gVq3Q/1Suyx3Rkakp9
	YXVgTb6A+n8XBfU7iamu0rMkS5u8oZAPbn1HRhR2twqNSFwDv+mq/zfC/tIJHOXWfIEQSFg9W59
	9Hnq20eGxT0hpK+uNj/x9gNP+676hqydmp5hh3X5xO4zVQNAIoY1c=
X-Received: by 2002:a05:7300:e9c9:10b0:34b:7c9c:9a69 with SMTP id
 5a478bee46e88-34cd8795e5fmr2234714eec.0.1790764050978; Wed, 30 Sep 2026
 03:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260930101257.1649945-1-tomo@flapping.org>
In-Reply-To: <20260930101257.1649945-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 12:27:18 +0200
X-Gm-Features: AclHuK9Nh6JsI3E6OnYTw_dMYdR-qYkmEpYkodh3Keia0XE0NzXFf93RUybHrnk
Message-ID: <CANiq72nRjBM5gPGKbEka8M6uZ8aVmoCZx9z0aXSMCkm1Od42jg@mail.gmail.com>
Subject: Re: [PATCH v2] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ukleinek@kernel.org, 
	wefu@redhat.com, a.hindborg@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-riscv@lists.infradead.org, lossin@kernel.org, m.wilczynski@samsung.com, 
	ojeda@kernel.org, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_112736_826802_1E05026D 
X-CRM114-Status: GOOD (  16.04  )
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

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMTI6MTPigK9QTSBGVUpJVEEgVG9tb25vcmkgPHRvbW9A
ZmxhcHBpbmcub3JnPiB3cm90ZToKPgo+IEZyb206IEZVSklUQSBUb21vbm9yaSA8ZnVqaXRhLnRv
bW9ub3JpQGdtYWlsLmNvbT4KPgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIG9uIDMy
LWJpdCBBUk0gd2l0aCBDT01QSUxFX1RFU1Q6Cj4KPiAgIEVSUk9SOiBtb2Rwb3N0OiBkcml2ZXJz
L3B3bS9wd21fdGgxNTIwLmtvOiBzeW1ib2wgJ19fYWVhYmlfdWxkaXZtb2QnIHVuZGVmaW5lZCEK
Pgo+IFRoZSBkcml2ZXIgZGl2aWRlcyB1NjQgdmFsdWVzIHdoZW4gaXQgY29udmVydHMgYmV0d2Vl
biBuYW5vc2Vjb25kcyBhbmQKPiBjbG9jayBjeWNsZXMuIE9uIDMyLWJpdCBBUk0sIHRoZXNlIGRp
dmlzaW9ucyBhcmUgY29tcGlsZWQgdG8gY2FsbHMgdG8KPiBfX2FlYWJpX3VsZGl2bW9kLCB3aGlj
aCB0aGUga2VybmVsIGRvZXMgbm90IHByb3ZpZGUuCj4KPiBUaGUgVEgxNTIwIGlzIGEgNjQtYml0
IFJJU0MtViBTb0MsIHNvIHRoZSBkcml2ZXIgaXMgb25seSB1c2VkIG9uCj4gNjQtYml0IGtlcm5l
bHMuIFRoZXJlIGlzIG5vIHBvaW50IGluIGNvbXBpbGUgdGVzdGluZyBpdCBvbiAzMi1iaXQuCj4g
TGltaXQgQ09NUElMRV9URVNUIHRvIDY0QklUIGluc3RlYWQgb2YgY2hhbmdpbmcgdGhlIGFyaXRo
bWV0aWMgdG8gdXNlCj4gdGhlIGRpdjY0IGhlbHBlcnMuCj4KPiBGaXhlczogM2MxODAwMDNkZmZi
ICgicHdtOiB0aDE1MjA6IEZpeCBtaXNzaW5nIEtjb25maWcgZGVwZW5kZW5jaWVzIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFJlcG9ydGVkLWJ5OiBBbmRyZWFzIEhpbmRib3JnIDxh
LmhpbmRib3JnQGtlcm5lbC5vcmc+Cj4gQ2xvc2VzOiBodHRwczovL3J1c3QtZm9yLWxpbnV4Lnp1
bGlwY2hhdC5jb20vI25hcnJvdy9jaGFubmVsLzI5MTU2NS1IZWxwL3RvcGljLzY0Yml0LjIwZGl2
aXNpb24uMjBpbi4yMC42MHB3bV90aDE1MjAuMkVycy42MC9uZWFyLzYyNjgyNTU5OQo+IFJldmll
d2VkLWJ5OiBBbmRyZWFzIEhpbmRib3JnIDxhLmhpbmRib3JnQGtlcm5lbC5vcmc+Cj4gUmV2aWV3
ZWQtYnk6IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0Pgo+IFNpZ25lZC1vZmYtYnk6IEZVSklU
QSBUb21vbm9yaSA8ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4KClRoYW5rcyBUb21vIQoKSWYg
UFdNIHdhbnRzIG1lIHRvIHBpY2sgaXQgdXAgZm9yIHNvbWUgcmVhc29uLCBwbGVhc2UgbGV0IG1l
IGtub3cgKEkKZG9uJ3QgcGxhbiBhdCB0aGUgbW9tZW50IHRvIHNlbmQgYSBmaXhlcyBQUiwgdGhv
dWdoKS4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
