Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702E4C388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 12:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1CB22224B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 12:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiVqxkqP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nO19WHU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1CB22224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxsPiNwVNbAeTe+JH+ZO3XApHk9H5m5T3ypm7XiQxNw=; b=MiVqxkqPUt/blYNYOtr1Zt3m6
	2mLZdaqPqjcKShhvB4gA+IeUMMPdOnnxUltAhiE1dKccm7Z5AD3h8R9Fo/ewtNrw7TU/M4KQPPIa8
	P/dWlwYeeZRxRwDLrfWEXZxoRIWBB4z/ZfOrsGHLXxhkNyvTxDWBZ/Ec39YhHa6OniFy8LuGq4nFC
	IpVvBPTg7gixXpSo0EgwkZGCEvDf4ys/gAm4sY92+dQMd93n0hSPdGTD8mRBodeJYsLHeA18xXc14
	1QWyZRjE+f0KMb8sPck56V0lhfYFw0wI7NYLCYtRdUQOtR4qCaYUemInp/qVM8iHM637hM/RRBaKj
	4JcQrO5qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdY8Y-00065b-3c; Fri, 13 Nov 2020 12:25:06 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdY8T-00064N-HW
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 12:25:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id za3so13117066ejb.5
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 04:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=49p0EnMEE9ULp6RJvcOQnpqAXD/aUtdl46fmyb4bTSU=;
 b=nO19WHU9K3WItec+KVPJVHUqvwtTzRt+j/mXcIiYgkmvXhlRTvIvFkZ+Sta+7UNx7D
 JZIfSYkuu8HqGUpd/U/FDCl+tPgU/Ob8v+ihVpSnvh6bL35FM3CZTNCkT/d6TOaUww/5
 wwhF5rCMGRgFiLeL3Mb5jNXGEe0mF8NXok7ojTV5tMNzIJ2Bx4u5qrem56iYy8pEQg+/
 JwlN1Omd31B05HH2t608K+ryyPeYCTudWl8MC/YrhbKjV7DTjoRFQvXxCisziceK0Pqo
 5U4wEUgv0yT7OGhG28I9Dh3GYWebxOgcxYEbMX7XMVki2U9q0z/t40kSD6oS99psbbbU
 2WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=49p0EnMEE9ULp6RJvcOQnpqAXD/aUtdl46fmyb4bTSU=;
 b=G/+z4BE22VfCA2ARyhSs2bPhdR5rnkEk2CHrmEPJbcTOSRypVFXuFivRtN1FNkQfT0
 0dSH5tXyqw4cnMuhyMBwtq9dFhVwHRpxoj84XPdINK7xJfmbPb8UuJxc/2ofRvivxtWm
 JinPCEDL85rfvVIN83Ns2fE1JDFNIR8eiFulIL9MHCvVh2/RurT7hv3V78SKLieE4A06
 IZRM8QVivataxqsfluyPIzThfBfqkhgGqMcLTK89+rAuiCIUhX/zTpf2YOrFossnLj7/
 +p8QziihUa5CFZ9jxYNVsi7osJ17jhXmjQcCH+nQzkWb0aA/WZ5530g1670Cy+1+QuUy
 dvxA==
X-Gm-Message-State: AOAM530aHbXy/wcr+H/g6d1yrP1cdKs9dxp347IpqEPEnm4LejTAl43R
 TwOtP5xXRphqEeyiJxQ6CzzHAA==
X-Google-Smtp-Source: ABdhPJwq1S/7g8AUo4BVeZ5WDLRYa9p01thBZjKrjBXbTHHThI0S2zQXwN7XtuLcdpvWQdEycjya6g==
X-Received: by 2002:a17:906:d9dd:: with SMTP id
 qk29mr1695474ejb.487.1605270300119; 
 Fri, 13 Nov 2020 04:25:00 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n1sm3818181edt.66.2020.11.13.04.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 04:24:59 -0800 (PST)
Date: Fri, 13 Nov 2020 13:24:40 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Subject: Re: csum_partial() on different archs (selftest/bpf)
Message-ID: <20201113122440.GA2164@myrica>
References: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_072501_725002_98A5AF66 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Netdev <netdev@vger.kernel.org>, Anders Roxell <anders.roxell@gmail.com>,
 Tom Herbert <tom@herbertland.com>, bpf <bpf@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBGcmksIE5vdiAxMywgMjAyMCBhdCAxMTozNjowOEFNICswMTAwLCBCasO2cm4gVMO2
cGVsIHdyb3RlOgo+IEkgd2FzIHJ1bm5pbmcgdGhlIHNlbGZ0ZXN0L2JwZiBvbiByaXNjdiwgYW5k
IGhhZCBhIGNsb3NlciBsb29rIGF0IG9uZQo+IG9mIHRoZSBmYWlsaW5nIGNhc2VzOgo+IAo+ICAg
IzE0L3AgdmFsaWQgcmVhZCBtYXAgYWNjZXNzIGludG8gYSByZWFkLW9ubHkgYXJyYXkgMiBGQUlM
IHJldHZhbAo+IDY1NTA3ICE9IC0yOSAocnVuIDEvMSkKPiAKPiBUaGUgdGVzdCBkb2VzIGEgY3N1
bV9wYXJ0aWFsKCkgY2FsbCB2aWEgYSBCUEYgaGVscGVyLiByaXNjdiB1c2VzIHRoZQo+IGdlbmVy
aWMgaW1wbGVtZW50YXRpb24uIGFybTY0IHVzZXMgdGhlIGdlbmVyaWMgY3N1bV9wYXJ0aWFsKCkg
YW5kIGZhaWwKPiBpbiB0aGUgc2FtZSB3YXkgWzFdLgoKSXQncyB3b3JzZSB0aGFuIHRoYXQsIGJl
Y2F1c2UgYXJtNjQsIHBhcmlzYywgYWxwaGEgYW5kIG90aGVycyBpbXBsZW1lbnQKZG9fY3N1bSgp
LCBjYWxsZWQgYnkgdGhlIGdlbmVyaWMgY3N1bV9wYXJ0aWFsKCksIGFuZCB0aG9zZSBhbGwgcmV0
dXJuIGEKMTYtYml0IHZhbHVlLgoKSXQgd291bGQgYmUgZ29vZCB0byBmaXJzdGx5IGZvcm1hbGl6
ZSB0aGUgc2l6ZSBvZiB0aGUgdmFsdWUgcmV0dXJuZWQgYnkKdGhlIGJwZl9jc3VtX2RpZmYoKSBo
ZWxwZXIsIGJlY2F1c2UgaXQncyBub3QgY2xlYXIgZnJvbSB0aGUgZG9jIChhbmQgdGhlCmhlbHBl
ciByZXR1cm5zIGEgczY0KS4KClRoZW4gaG9tb2dlbml6aW5nIHRoZSBjc3VtX3BhcnRpYWwoKSBp
bXBsZW1lbnRhdGlvbnMgaXMgZGlmZmljdWx0LiBPbmUgd2F5CmZvcndhcmQsIHdpdGhvdXQgaGF2
aW5nIHRvIGltbWVkaWF0ZWx5IHJld3JpdGUgYWxsIGFyY2gtc3BlY2lmaWMKaW1wbGVtZW50YXRp
b25zLCB3b3VsZCBiZSB0byByZXBsYWNlIGNzdW1fcGFydGlhbCgpIGFuZCBkb19jc3VtKCkgd2l0
aApjc3VtX3BhcnRpYWxfMzIoKSwgY3N1bV9wYXJ0aWFsXzE2KCksIGRvX2NzdW1fMzIoKSBhbmQg
ZG9fY3N1bV8xNigpLiBUaGF0CndheSB3ZSBjYW4gdXNlIGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlv
biBvZiB0aGUgMzItYml0IHZhcmlhbnQgaWYgdGhlCmFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRp
b24gaXMgMTYtYml0LgoKVGhhbmtzLApKZWFuCgo+IGFybSAoMzItYml0KSBoYXMgYSBhcmNoIHNw
ZWNmaWMgaW1wbGVtZW50YXRpb24sCj4gYW5kIGZhaWwgaW4gYW5vdGhlciB3YXkgKEZBSUwgcmV0
dmFsIDEzMTA0MiAhPSAtMjkpIFsyXS4KPiAKPiBJIG1pbWlja2VkIHRoZSB0ZXN0IGNhc2UgaW4g
YSB1c2VybGFuZCBwcm9ncmFtLCBjb21wYXJpbmcgdGhlIGdlbmVyaWMKPiBjc3VtX3BhcnRpYWwo
KSB0byB0aGUgeDg2IGltcGxlbWVudGF0aW9uIFszXSwgYW5kIHRoZSBnZW5lcmljIGFuZCB4ODYK
PiBpbXBsZW1lbnRhdGlvbiBkb2VzIHlpZWxkIGEgZGlmZmVyZW50IHJlc3VsdC4KPiAKPiB4ODYg
ICAgIDogICAgLTI5IDogMHhmZmZmZmZlMwo+IGdlbmVyaWMgOiAgNjU1MDcgOiAweDAwMDBmZmUz
Cj4gYXJtICAgICA6IDEzMTA0MiA6IDB4MDAwMWZmZTIKPiAKPiBXaG8gaXMgY29ycmVjdD8gOi0p
IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHJpZCBvZiB0aGlzIGZhaWxlZCBjYXNlLi4uCj4gCj4g
Cj4gVGhhbmtzLAo+IEJqw7Zybgo+IAo+IAo+IFsxXSBodHRwczovL3FhLXJlcG9ydHMubGluYXJv
Lm9yZy9sa2Z0L2xpbnV4LW5leHQtbWFzdGVyL2J1aWxkL25leHQtMjAyMDExMTIvdGVzdHJ1bi8z
NDMwNDAxL3N1aXRlL2tzZWxmdGVzdC90ZXN0L2JwZi50ZXN0X3ZlcmlmaWVyL2xvZwo+IFsyXSBo
dHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LW1haW5saW5lLW1hc3Rlci9i
dWlsZC92NS4xMC1yYzMtMjA3LWc1ODVlNWIxN2I5MmQvdGVzdHJ1bi8zNDMyMzYxL3N1aXRlL2tz
ZWxmdGVzdC90ZXN0L2JwZi50ZXN0X3ZlcmlmaWVyL2xvZwo+IFszXSBodHRwczovL2dpc3QuZ2l0
aHViLmNvbS9iam90by9kYzIyZDU5M2FhM2FjNjNjMmM5MDYzMmRlNWVkODJlMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
