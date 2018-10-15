Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD7DC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 23:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BCC12089D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 23:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/5vkGYP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="afw/VZD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BCC12089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=D96BUAKZJsdW7EvcMrOLqlmpUbdyEZAge/IsKUHPOHs=; b=F/5vkGYP8BBGQFEziHLSlpIBR
	Dv8Kr4SMbXc+JNbtzFoAKxibZvd49aRJputnzHUPgBYtSY9QmTY1dmfMXQlDudpkZae1EuLbaBAKe
	YziMp4pUA/DP3le/fwHinOfKb3mRtw6XfKaqQ/sgDh+7hqdy7MGDuCQ98BtdOX64teybf3x8/Jjzm
	qOSQ3UiV2Ng8ILVbfea8XSesHZdCWgZ+SeOFafj6Cklg52f9gYOAz8pwmAwYGrQtGSlNjUvqQeVbO
	xZfPA0BPW1S7EpE7D/97dcKtvCYGB2sVnP4qXi6bJ3ug8LMW6S8IaH92lBMqMaTOlFLOdXYJv+/Kf
	QW1DzHPJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCC6X-00071t-55; Mon, 15 Oct 2018 23:16:53 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCC6T-0006zY-L2
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 23:16:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id s4-v6so10033554plp.0
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 16:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zY5FRFGJ1x+0u/V5mm5L6gboapti4teFd3k5CuR3lYA=;
 b=afw/VZD3n/lVtV9SV2RTXfAcuuZiK/C3lzJa7Yyar09LteLgZHDnw8mJXPSm3dxOo1
 RbFqJHtz5PUWT8ZxTH16C061i1grp8bJD2EriKxetMboEwPgYMa59si5UEFu3/8cYREN
 owS+O2OFgwfmi2DJiLZOb89g4cICP9kWyizmYS3zVRkM5ZxTtzl8FQk2bAGiaQlSa/X5
 2bnSmza3zY5wBaNT1njlN/hUO3CQpxBfo/eWMPBOCAoOJTR/eqHJRVdcgHVoW2LevK5P
 pA/K0RpN5EQ2iGl9zInUWKUOUO4N7s9CVQv9Q/k4fCPWUYo/ZW4asBdn0nfJ15e1FeTo
 gezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zY5FRFGJ1x+0u/V5mm5L6gboapti4teFd3k5CuR3lYA=;
 b=s38BUPD4eKXLMA9fXjEdoD26Hi0flKrcVwBm2ZAgvL6bBaugQCj+eSzd3JsrdpHPTz
 AnvksQbYi06J9QOlEbYVjFn723VwR5FcIYQ9+ywckaslyGq6p/xvBaOJwZe5JaIZDt81
 tizqoskZx/TrZZ59v728tcKmBHvYLcAxQCnVIxWJ6luDgs2TH6q45z0bM94KaD5nxHP7
 2w/dvrwdfOY6FaVEVElxV/6Qo3i3v+7SCAItXr753yv6ZIoUOFFZZPUpHHXYLTr1xNWr
 NdCGIf7/gX4pA59QaxHSTK1Tvj3XYhB98OXn4+b6DHV0v1HPZ+J7UgfFOV9jPUJTH/g6
 kSKA==
X-Gm-Message-State: ABuFfohLk2+YM9XCM0Oz2bm4BUIsa/xecLovuaUhZmW3BjuGUFoMH8OC
 ABBYk+uX7fH/1bMLL2ugxPDUtg==
X-Google-Smtp-Source: ACcGV61fuQQ0iW5aZeqcft2ermAFW27Wr/C+O6CPP7Vp30IhvtlV2VWS798LYnIlRwfhU2zx8xTnOw==
X-Received: by 2002:a17:902:b403:: with SMTP id
 x3-v6mr19232609plr.237.1539645398172; 
 Mon, 15 Oct 2018 16:16:38 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x20-v6sm20505698pfe.131.2018.10.15.16.16.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Oct 2018 16:16:37 -0700 (PDT)
Date: Mon, 15 Oct 2018 16:16:37 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Oct 2018 15:51:51 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Fix some bugs on RV32 build fail and issue
In-Reply-To: <CA+ZOyaig6dwzfhUn5CQ92P__yay2-aAgA4Nh+VxTs50FCbECwQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: zongbox@gmail.com
Message-ID: <mhng-4a97b34b-cb44-42cb-9fd8-d62b95edfa7e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_161649_690820_AF790BB9 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, zong@andestech.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015231637.t-_FAtJNjM4q18AUqwaGLmfqvV0vXwYKMzyIv3rUTeM@z>

T24gTW9uLCAxNSBPY3QgMjAxOCAwNTozMzoxNyBQRFQgKC0wNzAwKSwgem9uZ2JveEBnbWFpbC5j
b20gd3JvdGU6Cj4gWm9uZyBMaSA8em9uZ2JveEBnbWFpbC5jb20+IOaWvCAyMDE45bm0MTDmnIgz
5pelIOmAseS4iSDkuIrljYgxMToxMuWvq+mBk++8mgo+Pgo+PiBUaGlzIHBhdGNoZXMgY29udGFp
biB0aGUgbW9kaWZpY2Fpb24gYXMgZm9sbG93czoKPj4gMS4gRml4IHVwIHRoZSBidWlsZGluZyBm
YWlsIG9uIFJWMzIuCj4+IDIuIEFkZCB1bW9kZGkzIGFuZCB1ZGl2bW9kZGk0IGZ1bmN0aW9ucyBm
b3IgUlYzMi4KPj4gMy4gRml4IGlvcmVtYXAgcHJvYmxlbSBvbiBSVjMyLgo+Pgo+PiBUaGFua3Mg
YWxsIGZvciByZXZpZXcgdGhlc2UgY29kZSBhbmQgbW9kaWZ5IHRoZSBjb3B5cmlnaHQgZGVzY3Jp
cHRpb24uCj4+Cj4+IENoYW5nZXMgaW4gdjQ6Cj4+ICAtIFJldGFpbiB0aGUgY29tcGxldGUgY29w
eXJpZ2h0IGRlc2NyaXB0aW9uLgo+PiAgLSBNb2RpZnkgY29tbWl0IG1lc3NhZ2UuCj4+ICAtIFJl
YmFzZSB1cHN0cmVhbSBjb2RlLgo+Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiAgLSBDaGFuZ2UgdGhl
IGNvcHlyaWdodCBub3RpY2VzIHRvIEdQTHYyIGZyb20gIGdjYyA0LjIuMS4KPj4KPj4gQ2hhbmdl
cyBpbiB2MjoKPj4gIC0gUmV0YWluIHRoZSBjb3B5cmlnaHQgbm90aWNlcyBmcm9tIGxpYmdjYyBp
biB1bW9kZGkzLmMgYW5kIHVkaXZtb2RkaTQuYy4KPj4KPj4gVmluY2VudCBDaGVuICgxKToKPj4g
ICBSSVNDLVY6IEF2b2lkIGNvcnJ1cHRpbmcgdGhlIHVwcGVyIDMyLWJpdCBvZiBwaHlzX2FkZHJf
dCBpbiBpb3JlbWFwCj4+Cj4+IFpvbmcgTGkgKDQpOgo+PiAgIFJJU0MtVjogQnVpbGQgdGlzaGlm
dCBvbmx5IG9uIDY0LWJpdAo+PiAgIFJJU0MtVjogQWRkIHByZXByb2Nlc3NvciBkaXJlY3RpdmUg
Zm9yIHN3aW90bGIKPj4gICBsaWI6IEFkZCB1bW9kZGkzIGFuZCB1ZGl2bW9kZGk0IG9mIEdDQyBs
aWJyYXJ5IHJvdXRpbmVzCj4+ICAgUklTQy1WOiBTZWxlY3QgR0VORVJJQ19MSUJfVU1PRERJMyBv
biBSVjMyCj4+Cj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgIHwgICAxICsKPj4gIGFyY2gv
cmlzY3Yva2VybmVsL3NldHVwLmMgfCAgIDMgKwo+PiAgYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUg
ICB8ICAgMyArLQo+PiAgYXJjaC9yaXNjdi9tbS9pb3JlbWFwLmMgICB8ICAgMiArLQo+PiAgbGli
L0tjb25maWcgICAgICAgICAgICAgICB8ICAgMyArCj4+ICBsaWIvTWFrZWZpbGUgICAgICAgICAg
ICAgIHwgICAxICsKPj4gIGxpYi91ZGl2bW9kZGk0LmMgICAgICAgICAgfCAzMjYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgbGliL3Vtb2RkaTMuYyAg
ICAgICAgICAgICB8ICA0OCArKysrKysrCj4+ICA4IGZpbGVzIGNoYW5nZWQsIDM4NSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91ZGl2bW9k
ZGk0LmMKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdW1vZGRpMy5jCj4+Cj4+IC0tCj4+IDIu
Ny40Cj4+Cj4KPiBwaW5nCgpPaCwgc29ycnkgYWJvdXQgdGhhdCAtLSBJIHRvb2sgdGhlbSBpbnRv
IG15IGxvY2FsIHRyZWUgYnV0IHRoZXkgZGlkbid0IG1ha2UgaXQgCnRvIGtlcm5lbC5vcmcuICBU
aGV5IHNob3VsZCBiZSBpbiBmb3ItbmV4dCBub3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
