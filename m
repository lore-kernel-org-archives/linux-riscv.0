Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE0EC88E77
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOxaqghilQ/+9SkZe8yGv+VQ569Ajl+drTdLhiLw2Xo=; b=UGBviNuzjv9LCx
	b33KJNWvAXIdIAe2sgqqf6h7R6C4W2EuiF9V+iXQcwU4BLEMyM+0STFOOBBQQoUdmZzsGurmr3bhA
	7gWjWOtfFO8ZeTEUD1QY5wXtnNagMUgaOPHFugrz6L6jhJc+wfQwNiYpY/F/1gsgeYwxZ4st2Jqzx
	lvMJtn5z40EA5UYeMlSeG7jOioTkUE8BlwE4HbxlFFIoZVN0ipNBgejRRmj0kpQKiUcp9ooeZiMu4
	1Iuk6j0772P5dRWo5tOAfTDI3RIxcndZKbl3L5HcKZVgDP6QbGvdexSoU46/b0W3ik5LbueVMto3A
	O9+J7Wo5e4HEs9CoP0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YXB-00000007ppD-1v5D;
	Tue, 15 Sep 2026 19:09:37 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YX2-00000007pn1-0sj1
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:09:35 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd84862f2bso20205ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 12:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789499366; cv=none;
        d=google.com; s=arc-20260327;
        b=g79f1N64XQy/CwduldK+TcNNND6SnSxZi2FQQJMZjGTgTYU9a1ym8M3unOlOMhBO6X
         LGymRyJNgs1AiVvwbLOPkeeE+/fxOVVUaV6E19pZ9zlfJG0YjGYM8F/GEWsEsyP7s3p3
         86LvcmTfrShZwVl2XZdIJ8NaUlUIuF8UC3ISZx4AkI0+c0WBK/JP9usSEpSLXZS525zT
         xLFr3tJKsk6FLk696h0lBaHMcQ2p93kzH4bq3EVusDj/qczPCxHrd9fS/nKmhZnJUv8e
         SkB+DFfEMH5eG+Lug1gJ43FSQhBEWQkeCQnX9ZIROPe7P/QTL15k9yLuW2Vvgw3iBMzV
         JzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        fh=/y5aPf85Uu0KjBiOAmE4T2ykBXCVTQtl7qfp1Un4AIU=;
        b=OQBycwWSMrzTh7J+xtBbdtyUfH9jQ5Zy+OyxT0NQYH72N6ME5JTQ4YLaKfE14dogkk
         lzJYciDwkmxGVtNkWJzXD7AM9VKVHYkBkU2yHUPx/Vhh0V+sz8El3+qWNappFCnr3+Ky
         o1ourKRepuA018cXvJXk0R39oIIfGSy9rtI4DhBqC267lB1ZNj3Ddoh/TNQXZuPprZUA
         fOfeMPFQZ4evtLAcoIt1+97wFMNeknTDTQtpyDyFme+mIr4liP+HTb4A2QI97w4LvfU1
         wfl70AtSOaQSFkOSpHlkU5DpLw1suCW7HqsKqW9La2GRwNFbM68QfRRgOm2HkxlVcYbi
         GwYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789499366; x=1790104166; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        b=srNW1qvmle0r7qu6rH2Ck7Cr7FddKEZf0962uf6QB45yGJQZb9//mFJeHflFNQYgB6
         SNSop2oVHxA9+G+uubrE3xqIua3pC7XMNhKmzSZRYQw8TsC9syBuhkPHS3QIOfOGBAMr
         OZlcxV3LBNU4VTJve9OFuAEakqZOFnRcU2knsq8NNu1uwA7o6tQspUyr728CM9YU0led
         GtndBMaR8b5teeyNt7YNyzp+lI10bCYFsJW6WiDLi39SlGLlUfBwnXKpeY6nctOvdXbO
         KIzdvFECxgV/bwTTAaFiCQ3N5yjsdws98Ks6nVJ4lVqcsjvxkcRXmWc72vNAQkXslBJc
         Oj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499366; x=1790104166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpIpcLcM/osmLoQCFZCbJu3MqhGUPApffNClPFrK1qo=;
        b=WyUD+l/6HObGfulggwEmTAzm/dhqBVo2aUdEWEgE4rvefdy3kpAhIm+MM9J3KcY/NJ
         /Nm8pJmohqoLEPb8ARewS5lNx3hfWW2lWlDmVzxLX64p/Mui2JA9vI8AVOCkl5vXxaPi
         c/ETijcJsodou8I8jre7Tz4ORXoVUYnF9GUxnAUumuUYK15Yr+LUTefIrQOgUGs0SQU0
         97Mro9KqJalhykgBuZju4j72JG87KwOp8IOl/OnFOxXmfq6J+ajG7ro1z4paydj0eW5e
         NdqX/UwU291d5rUzcqbAZhabjHNi+QMzi3t1DeXnSEeAq/9Lcjwd1ozSl8tMNlEXqF2e
         C7HA==
X-Forwarded-Encrypted: i=1; AKwUvBxOHFyErUP/LW5yClefdfoZcyMxX92QLE+O81riJ6iw474SyzhCYYy7FKVSdf6gVe88Wcd781Y5rXPhug==@lists.infradead.org
X-Gm-Message-State: AFuF++nxxzM409HiP67LyM2DPdEs+8Wh7uSoLfeZZp+vZo0MqEoYoHpI
	w9GxPFAjzDKbXFh9jJSNP7mtjkPZv1XGa6M5GT5FzdmuOXNw2HJ/I/VcsdCKbsH/lFaX6+E1a5D
	yC6Y8sRw9gBrt2q/dFmYiOgUk7uNqK+nUJvmApXYt
X-Gm-Gg: AYBFou2o9bFFWLQpzq/sh9W4EWFxb28dlTtqrDFUtH5EFTVQpP5/VRhRl8Z0hn8EhIN
	eJCcccZmSUZ1d3BXGnZ+TFyl/0l3yPnr+y7cVlACZRkeMzTbFokD9AdXRhuyGOBAkbX9QgNPYKS
	q/iLYFqom24iKcIOFoKW0n5CzGCwMxEQuPA40vf1pZYTIkzchDeXT1rwAMA/BmoQjZiCifrpBEH
	n9UDiduRbkMgp8BDrCjyeT2rZY81JnOSEFHXwcYlIS9BpNiqpuZgYWB4ZGTVkopA78MRamNxFMl
	2LUAO/+XmI9Hab+twpVyoygOEObXxFMCepd/hKhVTYbpg9H7sQe2UhfeOILjNf6xkjKHxYsCbrR
	/Itt6MDbQzA==
X-Received: by 2002:a17:903:2312:b0:2dd:280b:cdfc with SMTP id
 d9443c01a7336-2dd89dbf5b6mr911345ad.17.1789499365825; Tue, 15 Sep 2026
 12:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260914124145.1257-1-cp0613@linux.alibaba.com>
 <20260914125814.C92251F000FF@smtp.kernel.org> <20260915015420.818-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260915015420.818-1-cp0613@linux.alibaba.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 12:09:13 -0700
X-Gm-Features: AcwNN1VEnCQGYjVI_5aMVzakyKX12QfH25O8aH1TDijDh6nLV8Gvbs5KkQU6zmM
Message-ID: <CAP-5=fWE7gjkpZdnHh_QAiVBKTF=1tsUE+ezDxW8SaCsaS-s5w@mail.gmail.com>
Subject: Re: [PATCH] perf riscv: Add perf_regs_load and enable the dwarf
 unwind test
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	guoren@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_120928_253970_89218302 
X-CRM114-Status: GOOD (  20.68  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgNjo1NOKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gQm90aCBpdGVtcyBjaGVja2VkLiBOZWl0aGVyIG5lZWRz
IGEgdjIgb2YgdGhpcyBwYXRjaC4KPgo+ID4gRG9lcyB0aGlzIGZpbGUgbmVlZCB0byBleHBsaWNp
dGx5IGluY2x1ZGUgPHN0ZGxpYi5oPj8gU2luY2UgbXVzbCBsaWJjCj4gPiBlbmZvcmNlcyBzdHJp
Y3QgUE9TSVggaGVhZGVyIGluY2x1c2lvbnMsIG1pc3NpbmcgdGhlIGRlY2xhcmF0aW9uIGZvcgo+
ID4gbWFsbG9jIGNvdWxkIGxlYWQgdG8gYSBidWlsZCBmYWlsdXJlIHJlZ3Jlc3Npb24gb24gbXVz
bCBsaWJjIHN5c3RlbXMuCj4KPiBJdCBpcyBub3QgbWlzc2luZy4gInBlcmZfcmVncy5oIiB0aHJl
ZSBsaW5lcyBhYm92ZSByZXNvbHZlcyB0bwo+IGFyY2gvcmlzY3YvaW5jbHVkZS9wZXJmX3JlZ3Mu
aCwgd2hpY2ggaGFzICNpbmNsdWRlIDxzdGRsaWIuaD4gYW5kIGlzCj4gYWxzbyB3aGVyZSBQRVJG
X1JFR1NfTUFYIGNvbWVzIGZyb20sIHNvIHRoaXMgZmlsZSBjYW5ub3QgYmUgYnVpbHQKPiB3aXRo
b3V0IGl0LiBhcm02NCByZWxpZXMgb24gdGhlIHNhbWUgdHJhbnNpdGl2ZSBpbmNsdWRlLiBDaGVj
a2VkIHdpdGgKPiByaXNjdjY0IGdjYyAxNS4zLCB3aGVyZSBhbiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBpcyBhIGhhcmQgZXJyb3I6Cj4gaW5jbHVkaW5nIG9ubHkgdGhhdCBoZWFkZXIgaXMgZW5vdWdo
IHRvIGNhbGwgbWFsbG9jKCkgYW5kIGNhbGxvYygpLgoKSGkgUGVpLAoKVGhhbmtzIGZvciB0aGUg
cGF0Y2ghIFBsZWFzZSBkb24ndCByZWx5IG9uIHRyYW5zaXRpdmUgaW5jbHVkZXMgYXMgYQpjaGFu
Z2UgaW4gdGhlIG90aGVyIGhlYWRlciBmaWxlIHdpbGwgYnJlYWsgY29kZSBoZXJlLiBTaW5jZSB0
aGlzIGNvZGUKb25seSBidWlsZHMgZm9yIFJJU0MtViwgd2UncmUgbGlrZWx5IHRvIG1pc3MgdGhl
IHByb2JsZW0gaWYgdGhlIG90aGVyCmhlYWRlciBjaGFuZ2VzLiBPdGhlciB0aGFuIHRoaXMsCgpS
ZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLApJYW4K
Cgo+ID4gQ2FuIHBlcmZfc2FtcGxlX191c2VyX3JlZ3MoKSByZXR1cm4gTlVMTCBoZXJlPwo+Cj4g
SXQgY2FuLCBidXQgdGhhdCBpcyBub3QgaW50cm9kdWNlZCBoZXJlIGFuZCBjYW5ub3QgYmUgZml4
ZWQgZnJvbSB0aGlzCj4gZmlsZS4gYXJjaC94ODYsIGFyY2gvYXJtLCBhcmNoL2FybTY0IGFuZCBh
cmNoL3Bvd2VycGMgYWxsIGRlcmVmZXJlbmNlCj4gaXQgdGhlIHNhbWUgd2F5LCBhbmQgdGVzdHMv
ZHdhcmYtdW53aW5kLmM6MTE4IGRvZXMKPiB6ZnJlZSgmc2FtcGxlLnVzZXJfcmVncy0+cmVncykg
dW5jb25kaXRpb25hbGx5LCBzbyBhbiBlYXJseSByZXR1cm4gaGVyZQo+IHdvdWxkIHN0aWxsIGNy
YXNoIGluIHRoZSBjYWxsZXIuIEEgZml4IGhhcyB0byBjb3ZlciB0aGUgd2hvbGUgIlRlc3QKPiBk
d2FyZiB1bndpbmQiIHBhdGgsIG9yIHRoZSBjb250cmFjdCBvZiBwZXJmX3NhbXBsZV9fdXNlcl9y
ZWdzKCkgaXRzZWxmLgo+IEVpdGhlciBpcyBhIHNlcGFyYXRlIHNlcmllcywgd2hpY2ggSSBjYW4g
c2VuZCBpZiB3YW50ZWQuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUGVpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
