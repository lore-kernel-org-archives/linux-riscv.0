Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF4C072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 16:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1j5NDA7XpUuKBVDDjKbJOnB9kv5E310MnA+ojIBwKE=; b=Wt+O1z7q77donP
	eF6Zz26iUs10aPBUdZJCmFIyDtZtZfEd/jHjFqa3BbI6dxk5mWi5C/cgJl7xe/DhC4cYAvtJhFdVl
	pqAhGk9FLpVm2vL50/Z85q6+jKpQuuo19PcZ2lcvP4tq2E0QytmgDzSyAAHY8aAPWtFzTUGgwxmww
	3BVNLsPdQOslf1gj4ynGflDmywoakH1Osm7QTaz8a7ncAP5od3Etd/edDU4G3JXZzytu20JQ5fDmr
	K3ef0bllLAz8siKtDBPUk6BqTXq3RWDtluxVLNvqpRq3Nz7y7alZl9m983wrhSQe5qz+mi9hGx47Q
	PY7VXND8PaCE3ZZnPy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IfF-001IxT-0e;
	Wed, 15 Nov 2023 16:22:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IfD-001Iwp-0C
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 16:22:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6c10f098a27so5637647b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 08:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700065366; x=1700670166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBJZJ6bkQq1mUBhOd//h5NnrzLlmIp6ZHxXr9VhrfWw=;
        b=UgCYIXHy7FBk/+QRg2E4HSXNkyKXOGaYN7LUmtAmjbHvyJ8hrG0DUJL1Z9naH+/lyq
         rAPE9IEA0dNV89icEPWOrw37G6zDKo8isyH7KmR3Zd2JHViOF6oljbNAAoU1G1pPNspV
         WURyARPWslQ2BWDbS4iebN9ZZVje7hKn6gZsg+m0LH+Nvruuh0jv59B1pJ+SBgmPkxnB
         SrbtFLVsfXAEC4KPPcKFgi/TEF32PSu5BQ1bWYDJwftA7yNrZAIQf4yjvETkWbSN0Hv/
         0nFZBU7tKI5PHCA0TQdFilwIsRk1sjELCwNjKPDWw4s6Sh61b8aI6ANT4EYda4EVzGCI
         4+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065366; x=1700670166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBJZJ6bkQq1mUBhOd//h5NnrzLlmIp6ZHxXr9VhrfWw=;
        b=p65lGVk2btZQGfnPXJhl+cclZqiN7GmjXYCA5l66CsiGiBeNsqh80mZDbvszPJElel
         WsCsvbhNUuahtmWqoaVXBfbAfP4/AgVrh43m/+ZG8RzEQ3HWPmGPi1IzEpXFl0nRTymJ
         Kxz8tLk99e13ZSeRoPgZvlLVBeTHtIUaHMo+0ShKHsdvXyPbTlCIw/MUvwaZvtfXfq/m
         XgF7r8cRx6d10lq3CM13gG7stxkKGGrGpHgwQIY1e0CeL+byRRDpxNPB+rdidNrV9PFm
         rCHR1XeGOAwQ4CFruw+3DIuus1iHMk23yk+q58ZLbv2pl9v36UyGxzg+RbedlwOUfeJB
         Eskg==
X-Gm-Message-State: AOJu0YzWmZDNvyVzalRM1WBpyLmhP5XZqbJ0lYnN567sdh/woaX8sQFc
	ZQ1kUHDFoeAVvTmgsisf83pfSlqUiY3/Un7bCGFe3A==
X-Google-Smtp-Source: AGHT+IEVxNUiSjjWM4GsZR8s0OEvIr+4VSShN4Neeu2xUy7A7sAsIBpzFFrbU6BYbzZ63zZn4PS+Fz6RtdFJuCoY67k=
X-Received: by 2002:a05:6a00:1ca9:b0:6c4:d5ee:c6 with SMTP id
 y41-20020a056a001ca900b006c4d5ee00c6mr12052350pfw.1.1700065366217; Wed, 15
 Nov 2023 08:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 Nov 2023 21:52:34 +0530
Message-ID: <CAK9=C2WV81L697Dw6ccXMnEbKvo2wiR8A_=yxuLGP6TXraOBwQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_082251_122606_7ABA952D 
X-CRM114-Status: GOOD (  19.08  )
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

T24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgNzowMeKAr1BNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPGhl
aW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBVcCB0byBub3cgYW4g
U0JJIGJhc2VkIGVhcmx5IGNvbnNvbGUgd2FzIGxpbWl0ZWQgdG8gU0JJIHZlcnNpb24gMC4xLgo+
IFdpdGggdGhlIERCQ04gU0JJIGV4dGVuc2lvbiB3ZSBjYW4gcHJvdmlkZSBhbiBlYXJseSBjb25z
b2xlIG9uIHN5c3RlbXMgdGhhdAo+IGhhdmUgYSByZWNlbnQgU0JJIGltcGxlbWVudGF0aW9uLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJk
dEBjYW5vbmljYWwuY29tPgoKVGhlcmUgaXMgYWxyZWFkeSBhIHNlcmllcyBpbi1mbGlnaHQgYWRk
aW5nIFNCSSBEQkNOIHN1cHBvcnQuClJlZmVyLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjMxMDIwMDcyMTQwLjkwMDk2Ny0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLwoKUmVnYXJk
cywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgfCAxNCArKysrKysr
KysrKysrKwo+ICBkcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyB8ICAxIC0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGluZGV4
IDVhNjJlZDFkYTQ1My4uNmUxNjQ0YTk1YmI3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3NiaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBAQCAtMTk1LDYgKzE5
NSwyMCBAQCBzdGF0aWMgdm9pZCBzYmlfc2V0X3Bvd2VyX29mZih2b2lkKQo+ICAgICAgICAgcG1f
cG93ZXJfb2ZmID0gc2JpX3NodXRkb3duOwo+ICB9Cj4gICNlbHNlCj4gKwo+ICsvKioKPiArICog
c2JpX2NvbnNvbGVfcHV0Y2hhcigpIC0gV3JpdGVzIGdpdmVuIGNoYXJhY3RlciB0byB0aGUgY29u
c29sZSBkZXZpY2UuCj4gKyAqIEBjaDogVGhlIGRhdGEgdG8gYmUgd3JpdHRlbiB0byB0aGUgY29u
c29sZS4KPiArICoKPiArICogUmV0dXJuOiBOb25lCj4gKyAqLwo+ICt2b2lkIHNiaV9jb25zb2xl
X3B1dGNoYXIoaW50IGNoKQo+ICt7Cj4gKyAgICAgICBzYmlfZWNhbGwoU0JJX0VYVF9EQkNOLCBT
QklfRVhUX0RCQ05fQ09OU09MRV9XUklURV9CWVRFLAo+ICsgICAgICAgICAgICAgICAgIGNoLCAw
LCAwLCAwLCAwLCAwKTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKHNiaV9jb25zb2xlX3B1dGNoYXIp
Owo+ICsKPiAgc3RhdGljIHZvaWQgX19zYmlfc2V0X3RpbWVyX3YwMSh1aW50NjRfdCBzdGltZV92
YWx1ZSkKPiAgewo+ICAgICAgICAgcHJfd2FybigiVGltZXIgZXh0ZW5zaW9uIGlzIG5vdCBhdmFp
bGFibGUgaW4gU0JJIHYlbHUuJWx1XG4iLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvS2NvbmZpZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4gaW5kZXggNzMyYzg5M2M4
ZDE2Li40NTRjMmE2MTIzODkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25m
aWcKPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+IEBAIC04Nyw3ICs4Nyw2IEBA
IGNvbmZpZyBTRVJJQUxfRUFSTFlDT05fU0VNSUhPU1QKPgo+ICBjb25maWcgU0VSSUFMX0VBUkxZ
Q09OX1JJU0NWX1NCSQo+ICAgICAgICAgYm9vbCAiRWFybHkgY29uc29sZSB1c2luZyBSSVNDLVYg
U0JJIgo+IC0gICAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfVjAxCj4gICAgICAgICBzZWxlY3Qg
U0VSSUFMX0NPUkUKPiAgICAgICAgIHNlbGVjdCBTRVJJQUxfQ09SRV9DT05TT0xFCj4gICAgICAg
ICBzZWxlY3QgU0VSSUFMX0VBUkxZQ09OCj4gLS0KPiAyLjQwLjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
