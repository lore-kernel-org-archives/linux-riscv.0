Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048BEC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 17:24:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6BE22083B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 17:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zn1OSM4N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu/yMWgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6BE22083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNKQxdIeI2DA7vUEchmtGK7iENtgVtzpfcAn6hnSUl0=; b=Zn1OSM4NL4Avsk
	k58FMhkwB9nU9DKujR5pjfskWn0+MQvXqsMEweagQpQGieRb5uW5K8/8gfolMXun9AI6oAyxlLdLV
	GB+xo4f2QUpGjyL0RHktsCnWusuwzc1L6J2iV7YR55ZF9BXmXr66ODfXGOHnJO6A2rCQZjHQVNHda
	h21QAfnMP4nBbrDX7mSDCkTdh/9WO4dQB3MzqWFjL1U5U2/N5KOOedDtaQZGVu100+BFRZtpmvUg/
	RBMgFPmYd4cFTqQtZbQnY6HK9dtSHIz9WCvzKb+pUgrtXmtsolou26ONFt51a6h/oSGSsHJKBf9vy
	gNUdxXCAYxUZlVIReYZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gws5U-0001de-6e; Thu, 21 Feb 2019 17:24:44 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gws5Q-0001dJ-SX
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 17:24:42 +0000
Received: by mail-qt1-x82a.google.com with SMTP id w4so32447223qtc.1
 for <linux-riscv@lists.infradead.org>; Thu, 21 Feb 2019 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hr48U6mw5BpqnklG55KhB0R0Mxq/fdGaoI3k72fafdY=;
 b=mu/yMWggwZs51gQ7fYyoZ1bdUyRXHP3Z2CQ1AyzOBGXTn60A3Q4hNXYm4jVz14aqAo
 CdF9G4IYNYCHkj7214xiGFJ2mVnnI+LN6smStM7mJNmkcmWy0WGY3XbIMN9YePIJvbs4
 xrDr7orM5OGDMy5ecU5Ph4/6wiUODKKPUsc6oyhQhU+cb7sKDxJRkuXZujqaPIN/EsGr
 +an8RDVhMZhF7s2gGhslg9GFfFIS06JhMyAWGztqLNNPfWYW0xvTfVp0xcBm6nAKLnAu
 TU8Hynq+n3NlTBtnj9Q+7VqUrrOheuVPTQmSDh3XUF+eN0PEie+d1guw6iaVMgfdv9PG
 +KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hr48U6mw5BpqnklG55KhB0R0Mxq/fdGaoI3k72fafdY=;
 b=ers3cqdedlJEX786Y0N3pX7uN/i7/A9cuy5QO8ErZFwvmFYzv91Lekf8voiC0pP6IL
 q+bnlEr1pmaYqlHnmlvxqFFmkhGGmwKmmuvpWYl9+OUgfdD1mYITtDXBnK9iQEtXmFyL
 2y9+/GBwW/0849sP+LaOd2qWRR9iLXp7U/ReF5RqIx9CyuRLVBEChNUQNfSNzpK25ZRq
 OP8+b4Ao+nyxsnYb8MyJcGRIHxQ4UeoN+uaLpICbYrTEdGs1DD0kzR0rBPbiOojuz4Op
 GZFiiKriusjCDWqpeY47gVS7SM9d+08aYkpIyyHP77BzS3kt+ZE9rDH0HcU3Va4TYG+7
 czDg==
X-Gm-Message-State: AHQUAuZ9dFv8uYYOLLZOu8/afXAjkYxasiGzriIsx0eYJEz6ACJEl3MO
 lhJp0l17vzn6UnvLHFCSklSK5HlKG7Ud70qxFm4=
X-Google-Smtp-Source: AHgI3IbJl/EF2rB9UdcavksZW8rEkm5MXCHW5LD1PP4EW+GjFrJ7+YkOdYuochOle7LMGjgNbixkikQ3w9pHuNV5dcM=
X-Received: by 2002:ac8:1ba9:: with SMTP id z38mr32378429qtj.3.1550769877364; 
 Thu, 21 Feb 2019 09:24:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+HfNgwAFevO6cXMU_FjQtLJ=uxHmmWM8c-VWu58SMkKXgVyQ@mail.gmail.com>
 <alpine.DEB.2.21.999.1902211627330.8433@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.21.999.1902211627330.8433@utopia.booyaka.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 21 Feb 2019 18:24:25 +0100
Message-ID: <CAJ+HfNhmJq7ut2OsTvy8N8r2zeiJgBAYdUj0g-SoCso9Y-V6Gg@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Paul Walmsley <paul@pwsan.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_092440_947656_E9544D67 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: linux-riscv@lists.infradead.org, Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMSBGZWIgMjAxOSBhdCAxNzoyOCwgUGF1bCBXYWxtc2xleSA8cGF1bEBwd3Nhbi5j
b20+IHdyb3RlOgo+Cj4gT24gV2VkLCAyMCBGZWIgMjAxOSwgQmrDtnJuIFTDtnBlbCB3cm90ZToK
Pgo+ID4gQ2hyaXN0b3BoZXIgbWVudGlvbmVkICJwZXItY3B1IGF0b21pY2l0eSIgaW4gaGlzIFBs
dW1iZXJzIFJJU0MtViBIUEMKPiA+IHRhbGsgWzFdLiBUeXBpY2FsbHksIHRoaXMgd291bGQgYmUg
Zm9yIHRoZSBwZXItY3B1IGltcGxlbWVudGF0aW9uIGluCj4gPiBMaW51eCwgc28gSSBoYWQgYSBs
b29rIGF0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLgo+ID4KPiA+IEkgbm90aWNlZCB0aGF0
IFJJU0MtViBjdXJyZW50bHkgdXNlcyB0aGUgZ2VuZXJpYyBvbmUuIEhhcyB0aGVyZSBiZWVuCj4g
PiBhbnkgd29yayBvbiBtb3ZpbmcgdG8gYSBSSVNDLVYgc3BlY2lmaWMgaW1wbCwgYmFzZWQgb24g
dGhlCj4gPiBBLWV4dGVuc2lvbnMsIHNpbWlsYXIgdG8gd2hhdCBhYXJjaDY0IGRvZXM/IFdvdWxk
IHRoYXQgbWFrZSBzZW5zZT8KPgo+IFllcyBkb2luZyBhIFJJU0MtViBpbXBsZW1lbnRhdGlvbiB3
aXRoIHRoZSBBTU8gaW5zdHJ1Y3Rpb25zIHdvdWxkIG1ha2UKPiBzZW5zZS4gIENhcmUgdG8gdGFr
ZSB0aGF0IG9uPwo+CgpZZWFoLCBJJ2xsIHRha2UgYSBzdGFiIGF0IGl0ISBJIGd1ZXNzIEFNTyBp
cyBpbiBnZW5lcmFsIGZhdm9yZWQgb3Zlcgp0aGUgTEwvU0MgcGF0aCwgY29ycmVjdD8KCgpCasO2
cm4KCgo+Cj4gLSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
