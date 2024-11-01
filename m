Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B054FE6F062
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsw2CEZXWdmEdVhk4xcvaRe3C5VGKMUxezbycDS9Xlc=; b=mP3iuVJqBeMk26
	xIIVGeU0IDaMZr0gpKlPj+Jf0XoyaowkJASNzj+2ewYu4b0qQs2rGDPfjc78bZic22WVfGUA/N/+o
	/QxI2txl3oAYs4H9SSXhPtv4z/GM8TxzFoKxbgP+6g3/1oxb+120WTrgnH57hp0ZDGa6hhNHEPuAP
	H8jzGmwpf2Szh2tyQWwuWXTEcJjQG9NdT0QTSiNtCQ+f7UEituBmNH1i4qny0LBXDA7fm8Sstx2ai
	v48MvAwZEdJnLm7q9jDEx7pEH0y5PlWT72KrO12UqWuzT0AbxnR4cgHASHadveCc51ChV5dRCBdJI
	OIXTDd+aOZzSNViw9n6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szI-00000007Opb-3nPX;
	Fri, 01 Nov 2024 14:50:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sfO-00000007LUs-2FZv
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 14:30:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso1519379a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471421; x=1731076221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GELZeM7SL+vX4J10M+PYFvjC1VtfZpBaaZsWDEcTe1o=;
        b=Q45baYRm0JZ8YWP8MhD5XBdCG1oYhy1GFqxzFBfbmc/UihYWGtJk+SawmKba3BjKLb
         FAh6FBooFwOXZE9gziZ0eHPDkvkChpe7JvTNFzb7wpRHgx887vvdBrA2nALi8icM5MzS
         aY/TE3P99hgvpBxfp/cNWFdmQcnandjfFOoKQmp33e98Pw+foKuOXSMazGQ6+q5Q4zix
         ZgjoDa4/unE3it4xPI1HbafBacZmvtP6XGaRIjORN+gv7Ya3npmtAU80c51PZn5EgQOb
         yh4qqrS39LC1VhYZtyxEiL+74QmzZEUbxIhjnbLrdp+dpdXRskOP2bGmLr7jH2r6b2JQ
         33oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471421; x=1731076221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GELZeM7SL+vX4J10M+PYFvjC1VtfZpBaaZsWDEcTe1o=;
        b=J58pDGMV/kh0ZxZ89yzRfWblGh+D0wvlNB/IiiXoThRRAphHymPbhj4G/JUXr04fNr
         dg89BJDO7suXJSE1DRuGE52cQextN8cB98/WllqJbg2A7TZUcoSFScH92FcFjrLkg4tN
         D35RlSzGSbtSXsjtRRnJGKlm4RETeUEYH0E24AZMsvY1ZQu8cU2m+GyQHV2sA6hSGD7w
         lT0iocpq1iJkCykfkcRWkjfg4QBjZ0Yij8FAVflHZINJg6JyIikyDWCXm0ig4Sgxty6z
         CoRPvrZMRLFWvng6XOIG61W60pT6a+arizWE7phxhigqp8xBrgJKKoCZTYaXVvUw4utD
         97sA==
X-Forwarded-Encrypted: i=1; AJvYcCW3XxLtJn8F9P7BkuMd32nhPNPDBaqg8bKrO2zleWIkOAbGFrLRpdEPoeIHnP4rskAUpcC7Ly0GxEu8Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKQb9W2ZoCiJE/3tUPjFiz8iPAwJYBL84kzoTTfXyP+sku43jj
	+flgte8rmCMsgGIbOsDtcVdafZ3vXB2/aonseNGtU885s2SpF2u6J1a1poti1C6y+0asIPpO0Xz
	XvNkUqRUTEeUCGffrTqSIpD7obXPBH3S4rLw=
X-Google-Smtp-Source: AGHT+IGdeX3stWgFTyf6spjEjN99PHriOnBxS+A509LgHsURAUxqmYxlKZ3iqTfB/zTj/U4sDz+/1hbT7XtnP492ocs=
X-Received: by 2002:a17:90b:4d06:b0:2e2:a2f0:e199 with SMTP id
 98e67ed59e1d1-2e94c29ec6fmr4741654a91.8.1730471421289; Fri, 01 Nov 2024
 07:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com> <6zx3tqdc5bma2vutexwigzlir6nr6adp7arg4qwl5ieyd3avbu@5yyhv57ttwcl>
 <dbeea869-54cd-43fe-9021-783d641f1278@gmail.com> <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
In-Reply-To: <ariqiukhztgziwwgaauqy6q3pghflnoeuwtag4izwkfmtvi2kh@gnlq4d7jsaw4>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 1 Nov 2024 10:29:44 -0400
Message-ID: <CAJFTR8T60Azb3refwAB9LALJthKxQz8E1ixZyEA0K=hXfNcUyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073022_601703_F16E9698 
X-CRM114-Status: GOOD (  20.28  )
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

T24gRnJpLCBOb3YgMSwgMjAyNCBhdCAxMDoyNOKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAyOSwgMjAyNCBhdCAwNDozNjow
MFBNICswODAwLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+ID4gT24gMjAyNC8xMC8yOCAxNTozOCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+ID4gT24gTW9uLCBPY3QgMjgsIDIwMjQgYXQg
MDE6MzI6MTlQTSArMDgwMCwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4+IFRoZSBJMkMgb2Yg
SzEgc3VwcG9ydHMgZmFzdC1zcGVlZC1tb2RlIGFuZCBoaWdoLXNwZWVkLW1vZGUsCj4gPiA+PiBh
bmQgc3VwcG9ydHMgRklGTyB0cmFuc21pc3Npb24uCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1i
eTogVHJveSBNaXRjaGVsbCA8VHJveU1pdGNoZWxsOTg4QGdtYWlsLmNvbT4KPiA+ID4+IC0tLQoK
Q2hhbmdlIGluIHYyOgotIGRyb3AgZmlmby1kaXNhYmxlIHByb3BlcnR5Ci0gdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzIGdvZXMgYWZ0ZXIgcmVxdWlyZWQ6IGJsb2NrCi0gZHJvcCBhbGlhcwoKPiA+ID4K
PiA+ID4gV2hlcmUgaXMgdGhlIGNoYW5nZWxvZz8gTm90aGluZyBoZXJlLCBub3RoaW5nIGluIGNv
dmVyIGxldHRlci4KSXQgc2VlbXMgbGlrZSBpdCB3YXMgYWNjaWRlbnRhbGx5IGRyb3BwZWQgc2Vl
aW5nIHRoZXJlIGFyZSB0aGUgZGFzaGVzLgoKPiA+ID4KPiA+ID4gSSBhc2tlZCBmb3Igc2V2ZXJh
bCBjaGFuZ2VzLCBzbyBub3cgSSBkb24ndCBrbm93IGlmIHlvdSBpbXBsZW1lbnRlZAo+ID4gPiB0
aGVtLgo+ID4KPiA+IEkgZGVsZXRlZCB0aGUgRklGTyBwcm9wZXJ0eSBiZWNhdXNlIEkgYmVsaWV2
ZSB5b3VyIHN1Z2dlc3Rpb24gaXMgY29ycmVjdC4KPiA+IHRoaXMgc2hvdWxkIGJlIGRlY2lkZWQg
YnkgdGhlIGRyaXZlciwgZXZlbiB0aG91Z2ggdGhlIEZJRk8gaXMgcHJvdmlkZWQKPiA+IGJ5IHRo
ZSBoYXJkd2FyZS4KPiA+Cj4gPiBBcG9sb2dpZXMgZm9yIG1pc3NpbmcgdGhlIGNoYW5nZWxvZy4g
VG8gY29ycmVjdCB0aGlzLCBzaG91bGQgSSBzZW5kIGEgdjMKPiA+IHZlcnNpb24gd2l0aCB0aGUg
Y2hhbmdlbG9nIG9yIHJlc2VuZCB2Mj8KPgo+IFJlcGx5IG5vdyB3aXRoIGNoYW5nZWxvZy4gWW91
ciBiaW5kaW5nIGhhcyBzb21lIG90aGVyIHVucmVsYXRlZCBhbmQKPiBpbmNvcnJlY3QgY2hhbmdl
cywgd2hpY2ggSSBkbyBub3QgdW5kZXJzdGFuZC4KCi4uLgoKVGhhbmtzLApKZXNzZSBUYXViZQoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
