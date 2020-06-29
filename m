Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C60DC433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:23:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DD820780
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 23:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x5gNHYlI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="cIXvVaSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DD820780
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5wACooxtJ0wxM4TschqaUr7H/mlh+57/kThrj/NoZvk=; b=x5gNHYlID4a+WK949F4P4+PXg
	51WfoLU8oVKYBAI0orrjn0AcEv/+bvV0ECJu+rUDLC1OOAV8Oq8ymjKo2xBDM1NJpWNo03UhDg3/b
	xI/LAl+njcB7JrhH3th7Ju1OemloB2BFJPKNfbTK0uTYDc3DBmUNH7gr7ZX2GtcFAuSh4D1W966od
	92JDFpBkz7zSft5W+FfqsTRcZqP9Hxd7IfPhUYzsk6aVp8nq5L4aHhGobEZ2RjPiqzTVoUG7dmPd+
	Hvj+z1uyPeHXQvfHO6Z5QUR42GVfuBFy8+W/C2L0PNnl3PpNIw1xX/r9UstIAJbbBRUP0o7wt/oXz
	0NiQZkGTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq374-00070C-4t; Mon, 29 Jun 2020 23:22:58 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq371-0006yl-75
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 23:22:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id e18so9022430pgn.7
 for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2020 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vosq3jM/Z3IP3Dh+gOgBhDGbMDQnYun30kIMF/La9o4=;
 b=cIXvVaSaQc5ILuJaRDR/wexJyYUN6n9xmX1Wz1HZxX80qts79UYOAhmSOBvWwYqI7g
 K9PB0H/wRCjKRAO+cLvtThHz32uLW5TIi6DgUzJTqZ9fuQUJDhotTkH9WXj6wAdvFPZE
 mwnev4Gi9EJBfAoFdE9KkeinMzAXYcwYebrUgBNbU/saUchbLqgoZ1oKO4V680pigEzj
 xrpYdpei+CQX0Rc5BW6sXS7yeV+GyYg2idYnOO9vrB8+HscqnaiJT0cJiUo6bv11ew4J
 MnJ68nn/9iGBayeJds85Ayzcn8jWktIo61przQX4SFL9ddvG6d9vRq01144dk5rq0wXq
 gwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vosq3jM/Z3IP3Dh+gOgBhDGbMDQnYun30kIMF/La9o4=;
 b=pjPqcQ+kASFW8wEpAts+tWF+JVo8GVZlDY7ypbZIfby/Tidc7KX0HswqrRmB41IXMb
 wZMzsvvHcud9B1qGZr0Po4echMh31DG6jxss2MX/B5rSngvju3wGp93Y/uGQR5HJnszv
 twiNLndmYKCJHoxKAwqQw3d1mv0Jql2UzNeDFA7HjSrsnQBUUs5PYpW0XK0590WLQv9+
 Sntma6VT4yr/1Iio3bHWuqjvGz9obuZk6u1Sn5XejJp9zLK+4sDPSGWwGBQsnPq884qz
 dEeLENnnBj8QuJgopRixRgds8FD7XoLytpo72ILDjw8/yhsceoddGjLr70T8fcd3XCP7
 OwnA==
X-Gm-Message-State: AOAM530t6vNMHoBOlLfRdYWhUJxWmrC1DZWGZUNuVgXDrYsrjc9z+kre
 ymcgmpbIWsJ1OgvBmMVV1qpt9g==
X-Google-Smtp-Source: ABdhPJx3JO3u4fG6Fd9hfA+ttXXsBjo2Fr8PGnVv+moeh/cJBgY7JGWNYXy+Pe70NRofreAkTSmyaQ==
X-Received: by 2002:a65:6883:: with SMTP id e3mr12506452pgt.5.1593472971349;
 Mon, 29 Jun 2020 16:22:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n137sm638694pfd.194.2020.06.29.16.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:22:50 -0700 (PDT)
Date: Mon, 29 Jun 2020 16:22:50 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Jun 2020 16:22:41 PDT (-0700)
Subject: Re: [PATCH V2] riscv: Fixup compile error BUILD_BUG_ON failed
In-Reply-To: <20200629012524.c941a5f18aa7f312d325f714@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: mhiramat@kernel.org
Message-ID: <mhng-37e70bbc-2616-41e6-bc8a-f144ca647c97@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
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
Cc: guoren@linux.alibaba.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, guoren@kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyOCBKdW4gMjAyMCAwOToyNToyNCBQRFQgKC0wNzAwKSwgbWhpcmFtYXRAa2VybmVs
Lm9yZyB3cm90ZToKPiBPbiBTdW4sIDI4IEp1biAyMDIwIDE2OjA3OjM3ICswMDAwCj4gZ3VvcmVu
QGtlcm5lbC5vcmcgd3JvdGU6Cj4KPj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+Pgo+PiBVbmZvcnR1bmF0ZWx5LCB0aGUgY3VycmVudCBjb2RlIGNvdWxkbid0IGJl
IGNvbXBpbGVkOgo+Pgo+PiAgIENDICAgICAgYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gubwo+PiBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjExLAo+PiAgICAg
ICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2xpc3QuaDo5LAo+PiAgICAgICAgICAg
ICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3ByZWVtcHQuaDoxMSwKPj4gICAgICAgICAgICAg
ICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9zcGlubG9jay5oOjUxLAo+PiAgICAgICAgICAgICAg
ICAgIGZyb20gYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYzo2Ogo+PiBJbiBmdW5jdGlvbiDigJhm
aXhfdG9fdmlydOKAmSwKPj4gICAgIGlubGluZWQgZnJvbSDigJhwYXRjaF9tYXDigJkgYXQgYXJj
aC9yaXNjdi9rZXJuZWwvcGF0Y2guYzozNzoxNzoKPj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVy
Lmg6MzkyOjM4OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF8yMDXigJkg
ZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiBmYWlsZWQ6IGlkeCA+
PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXMKPj4gICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRp
dGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBp
bGVyLmg6MzczOjQ6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19jb21waWxldGlt
ZV9hc3NlcnTigJkKPj4gICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgXAo+PiAgICAgXn5+fn5+
Cj4+IC4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjM5MjoyOiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8g4oCYX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQo+PiAgIF9jb21waWxldGltZV9hc3Nl
cnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVSX18pCj4+
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fgo+PiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6
Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkK
Pj4gICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2Vy
dCghKGNvbmQpLCBtc2cpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn4KPj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjUwOjI6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUdfT05fTVNH4oCZCj4+ICAgQlVJ
TERfQlVHX09OX01TRyhjb25kaXRpb24sICJCVUlMRF9CVUdfT04gZmFpbGVkOiAiICNjb25kaXRp
b24pCj4+ICAgXn5+fn5+fn5+fn5+fn5+fgo+PiAuL2luY2x1ZGUvYXNtLWdlbmVyaWMvZml4bWFw
Lmg6MzI6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTuKAmQo+
PiAgIEJVSUxEX0JVR19PTihpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzKTsKPj4gICBe
fn5+fn5+fn5+fn4KPj4KPj4gQmVjYXVzZSBmaXhfdG9fdmlydCgsIGlkeCkgbmVlZHMgYSBjb25z
dCB2YWx1ZSwgbm90IGEgZHluYW1pYyB2YXJpYWJsZSBvZgo+PiByZWctYTAgb3IgQlVJTERfQlVH
X09OIGZhaWxlZCB3aXRoICJpZHggPj0gX19lbmRfb2ZfZml4ZWRfYWRkcmVzc2VzIi4KPgo+IExv
b2tzIGdvb2QgdG8gbWUgOikKPgo+IFJldmlld2VkLWJ5OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGly
YW1hdEBrZXJuZWwub3JnPgoKSXMgdGhlcmUgYSBjb25maWd1cmF0aW9uIHRoYXQgcnVucyBpbnRv
IHRoaXMgYnVnPyAgSXQncyBub3Qgc2hvd2luZyB1cCBmb3IgbWUsCmFuZCBJIGdlbmVyYWxseSB0
cnkgdG8gYWRkIHJlZ3Jlc3Npb25zIHRvIG15IHRlc3Qgc3VpdGUuCgo+IFRoYW5rcyEKPgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+IENj
OiBNYXNhbWkgSGlyYW1hdHN1IDxtaGlyYW1hdEBrZXJuZWwub3JnPgo+PiBDYzogWm9uZyBMaSA8
em9uZy5saUBzaWZpdmUuY29tPgo+PiAtLS0KPj4gQ2hhbmdlbG9nIFYyOgo+PiAgLSBVc2UgX19h
bHdheXNfaW5saW5lIGFzIHNhbWUgYXMgZml4X3RvX3ZpcnQKPj4gIC0gVXNlIGNvbnN0ICJjb25z
dCB1bnNpZ25lZCBpbnQiIGZvciAydGggcGFyYW0KPj4KPj4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLmMgfCA4ICsrKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0
Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPj4gaW5kZXggZDRhNjRkZi4uMzE3OWE0
ZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+PiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4+IEBAIC0yMCw3ICsyMCwxMiBAQCBzdHJ1Y3QgcGF0Y2hf
aW5zbiB7Cj4+ICB9Owo+Pgo+PiAgI2lmZGVmIENPTkZJR19NTVUKPj4gLXN0YXRpYyB2b2lkICpw
YXRjaF9tYXAodm9pZCAqYWRkciwgaW50IGZpeG1hcCkKPj4gKy8qCj4+ICsgKiBUaGUgZml4X3Rv
X3ZpcnQoLCBpZHgpIG5lZWRzIGEgY29uc3QgdmFsdWUgKG5vdCBhIGR5bmFtaWMgdmFyaWFibGUg
b2YKPj4gKyAqIHJlZy1hMCkgb3IgQlVJTERfQlVHX09OIGZhaWxlZCB3aXRoICJpZHggPj0gX19l
bmRfb2ZfZml4ZWRfYWRkcmVzc2VzIi4KPj4gKyAqIFNvIHVzZSAnX19hbHdheXNfaW5saW5lJyBh
bmQgJ2NvbnN0IHVuc2lnbmVkIGludCBmaXhtYXAnIGhlcmUuCj4+ICsgKi8KPj4gK3N0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgdm9pZCAqcGF0Y2hfbWFwKHZvaWQgKmFkZHIsIGNvbnN0IHVuc2lnbmVk
IGludCBmaXhtYXApCj4+ICB7Cj4+ICAJdWludHB0cl90IHVpbnRhZGRyID0gKHVpbnRwdHJfdCkg
YWRkcjsKPj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4gQEAgLTM3LDcgKzQyLDYgQEAgc3RhdGlj
IHZvaWQgKnBhdGNoX21hcCh2b2lkICphZGRyLCBpbnQgZml4bWFwKQo+PiAgCXJldHVybiAodm9p
ZCAqKXNldF9maXhtYXBfb2Zmc2V0KGZpeG1hcCwgcGFnZV90b19waHlzKHBhZ2UpICsKPj4gIAkJ
CQkJICh1aW50YWRkciAmIH5QQUdFX01BU0spKTsKPj4gIH0KPj4gLU5PS1BST0JFX1NZTUJPTChw
YXRjaF9tYXApOwo+Pgo+PiAgc3RhdGljIHZvaWQgcGF0Y2hfdW5tYXAoaW50IGZpeG1hcCkKPj4g
IHsKPj4gLS0KPj4gMi43LjQKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
