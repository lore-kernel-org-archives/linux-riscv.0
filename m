Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DC5E92716
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X34LK61oE0AW3NZoxHJN42z3trHLD7Bdv1R+/UNu0xM=; b=TQpz3OMIyf/XIt
	q5Pu9bWqxrB39AVC+2ryYWSHDUMXOterIFivnj9PeYYE1s3V/4wPP9vBwlBjzBmly2+0WoxXjayLz
	vkwVR+XgrXs46fjNgUjnymxmOmkMko7lOFFHxFJhkfFpZochz7RBCGb9UzIfoxHh/RT7iYl/Faaoa
	sIu3Q3tGNulJTm7Snc6K8ZjrOw+oJwKQ1K+YLPbv/vaY5lMXLkk5zsFUTLSPvcLi6OadtBcQxLYgx
	LT2JvUPKIY7GndxNVMx3wE7w4qFSLehu24EHvfj/pqGbuOhiCblHHofcUz37IgkCEQtRlc0HLHbcS
	eXvTIfgGPz9jwQ2smjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZvr-000000029Pw-0K0G;
	Sat, 27 Dec 2025 19:26:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZZvp-000000029PX-1JDz
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 19:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1783A43D31;
	Sat, 27 Dec 2025 19:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A4BC4CEF1;
	Sat, 27 Dec 2025 19:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766863587;
	bh=g6XM4F8uz0727eTzV4+CObVOUm/jIwZfW3Pg+ZtYyqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AlOUttL+vXbzz9KSbTnp6sMpeWUu4zX1iCBTZ5zfLx/SuhKrgfxW3fQg9qzMX4A5q
	 U8PNbnNtxJr3AfJ3S2j0G7Ux3naYZMFitjcriQdkVamRTzpsBum2s7d4es1aXno1q7
	 OcpI/MWNclC8ExQ3QRQWhWtZJxFJ7mTfnCMXc9IHv4Uq36atnXXDc89lztcMGByIHR
	 XbtMBELD6KiwpKHZcWfz1VZCaoFDbn+o9TpMB2NB8o7soDB9D6NpiI5op8PgDKUApS
	 oDhwCTjbLJTLi1RlQ/F60v+KvMlEzdLJDX/+/V597F5E3Z0/0XI86GtAq7Gt6kQsXQ
	 OX1NcdFeUUOtw==
Date: Sat, 27 Dec 2025 20:26:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Encrow Thorne <jyc0019@gmail.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
 <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_112629_408277_3008C346 
X-CRM114-Status: GOOD (  12.07  )
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

SGkgR3VvZG9uZywKCk9uIEZyaSwgRGVjIDI2LCAyMDI1IGF0IDA3OjM4OjIyQU0gKzA4MDAsIEd1
b2RvbmcgWHUgd3JvdGU6Cj4gT24gRnJpLCBEZWMgMjYsIDIwMjUgYXQgNTowMeKAr0FNIEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ICsgICAgIHJzdCA9IGRl
dm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQoZGV2LCBO
VUxMKTsKPiA+ID4gKyAgICAgaWYgKElTX0VSUihyc3QpKQo+ID4gPiArICAgICAgICAgICAgIHJl
dHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyc3QpLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gYWNxdWlyZSBkZWFzc2VydGVkIHJlc2V0
XG4iKTsKPiA+Cj4gPiBJZiB0aGlzIGlzIG9wdGlvbmFsLCB3aHkgYXJlIHdlIHJldHVybmluZyB3
aXRoIGVycm9yPwo+ID4KPiAKPiBBY2NvcmRpbmcgdG8gaW5jbHVkZS9saW51eC9yZXNldC5oLCBp
ZiB0aGUgcmVxdWVzdGVkIHJlc2V0IGlzIG5vdAo+IHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRy
ZWUsIHRoaXMgZnVuY3Rpb24gcmV0dXJucyBOVUxMIGluc3RlYWQgb2YKPiBhbiBlcnJvci4gVGhl
cmVmb3JlLCBJU19FUlIocnN0KSB3aWxsIG9ubHkgYmUgdHJ1ZSBmb3IgYWN0dWFsCj4gZXJyb3Jz
IChlLmcgcHJvYmUgZGVmZXJyYWwpLgoKQW5kIHRoaXMgaXMgcXVpdGUgb2J2aW91cywgYnV0IHlv
dSBoYXZlbid0IGFuc3dlcmVkIG15IHFlc3Rpb24uCgpXaHkgZG8gd2UgY2FyZSBvZiBpbnRlcm5h
bCBmYWlsdXJlcyBpbiByZXNldD8gSWYgcmVzZXQgZmFpbHMgb24KYW4gb3B0aW9uYWwgcmVzZXQg
Y29udHJvbCBmdW5jdGlvbiB3aHkgc2hvdWxkIHdlIGtpbGwgb3VyIGRyaXZlcj8KSnVzdCBpZ25v
cmUgdGhlIGVycm9yIGFuZCBtb3ZlIGZvcndhcmQgYXMgd2UgaGF2ZSBkb25lIHVudGlsIG5vdy4K
CklmIHRoZSBrZXJuZWwgaXMgc3VmZmVyaW5nIGZyb20gaW50ZXJuYWwgZmFpbHVyZXMgKHNheSBF
Tk9NRU0pLAppdCB3aWxsIGZhaWwgYW55d2F5IG9yLCB3aXRoIHNvbWUgbHVjaywgcmVjb3Zlci4K
CkFuZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
