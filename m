Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75ACC54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLjFwQ700xp//mj/I4TRQ4Rn91OV/+2fH2GOW6bAz+U=; b=BP4hx7uEYYXDpM
	sE5nJSj2PaPi8n0B2ejrOc9uFtNchcov2Ld4itnuFcgw3kUsPMQRav8ITBaVzStMmn6eXDX2wL8ZR
	xbNnH6OpOIqQ82msFH/ykLLglQtWNAe9dvWT7QVxhljEXrNJinuFVK4JMy4NzLYXizuMV2/CiSLI6
	2OaGS/tPDvmH+z8VWneYfd8yST4fMQBbT3L8ezKIXXPacO8sBC/WrUoalSljUiFkNQZwMr52q/FCS
	ErvQYe7nMuSQSE+sjqp+obB4Vb5SqN+UMSpTQEzwDCjRSJ9Oq1mOEu9ByFyV/TgY0KS08Hx+5G3ul
	+cjHeP9JyVXTwesGpQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYAs-00000008uhZ-3h22;
	Fri, 08 Mar 2024 11:14:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYAn-00000008uej-3VtA;
	Fri, 08 Mar 2024 11:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 60DF4CE28BB;
	Fri,  8 Mar 2024 11:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028C9C433F1;
	Fri,  8 Mar 2024 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709896433;
	bh=BuVBYWsmwX49Fhqo92Z/bLaqCoqyW2giAASonkICntE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=doMV37ORVKZTbNjfPd4LkcsHbDf049CRhYmqAaYiZNZzN0W5rrAo62vjMjGmvTH+G
	 K5Qhjgkb4HYKgoy9fIQJhgA3hxzzfQ3z5QUQ5ZXp7ISAsVRwHMcupZvmRJf2aiODVM
	 +v3CAZ3cd+auEYFqjnurAqd04Y1Wx/86wQiYHLAYjnLG4oHr+byuwM0q1JEzkB+D+9
	 q0pNsb5HMfpq+IEE300mVQ1bhreNlnxa2Vp6ehI4/d1+gGrUAS6M9ufFTPCVsbFPn9
	 1sS5xV3/Kq10al9t2op0LupDCYk6jNcOiY1UUZxyZCo0UO/rGB7wxfYgRFTOUDtZbF
	 U7osWCGz+9gaA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v16 0/9] Linux RISC-V AIA Support
In-Reply-To: <87edclou4v.fsf@all.your.base.are.belong.to.us>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
 <87edclou4v.fsf@all.your.base.are.belong.to.us>
Date: Fri, 08 Mar 2024 12:13:50 +0100
Message-ID: <877cidou1d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_031358_077563_CBB4D34B 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBbnVwIFBhdGVsIDxh
cGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+Cj4+IFRoZSBSSVNDLVYgQUlBIHNwZWNp
ZmljYXRpb24gaXMgcmF0aWZpZWQgYXMtcGVyIHRoZSBSSVNDLVYgaW50ZXJuYXRpb25hbAo+PiBw
cm9jZXNzLiBUaGUgbGF0ZXN0IHJhdGlmaWVkIEFJQSBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5k
IGF0Ogo+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL3JlbGVhc2VzL2Rvd25s
b2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKPgo+IEl0J3MgYmVlbiBhIGJlZW4gYSBs
b25nIHJpZGUsIGFuZCBJIGdvdCBpbiBsYXRlICh2MTApLi4uIFRoYW5rcyBmb3IgdGhlCj4gaGFy
ZCB3b3JrLCBBbnVwIQoKVG9vIGV4Y2l0ZWQhIDstKQoKcy9hIGJlZW4vLwoKPiBOb3RlIHRoYXQg
QWxleCcgdGV4dC1wYXRjaGluZy9JUEkgc2VyaWVzIFsxXSBuZWVkcyB0byBnbyBpbnRvIHRoZSBS
Vgo+IHRyZWUgYXQgcm91Z2hseSB0aGUgc2FtZSB0aW1lIGFzIEFJQS4KCi4uLmFuZCBtaXNzaW5n
IHJlZmVyZW5jZToKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0
MDIyOTEyMTA1Ni4yMDM0MTktMy1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwoKPiBJJ3ZlIG5vdCBj
YXVnaHQgYW55IHJlZ3Jlc3Npb25zIGZvciBrc2VsZnRlc3RzIG9uIHFlbXUgZm9yIHRoaXMgdmVy
c2lvbgo+ICh3aXRoIEFsZXgnIHNlcmllcyBhcHBsaWVkKS4gSSBoYXZlIG5vdCBydW4gaXQgb24g
cmVhbCBoYXJkd2FyZS4KPgo+IEZvciB0aGUgc2VyaWVzOgo+Cj4gVGVzdGVkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KCgpIYXZlIGEgbmljZSB3L2UsCkJqw7ZybgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
