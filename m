Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F25606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PIv/uqPc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cPLj8Yt9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hC6LIkJb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=iYJrhVylA5e+NN38LfkqDeMQbrZHkEYFyB9ptY7XHWE=; b=PIv/uqPcqKQKHvRW1JlKtVsXEb
	LzmNfHz7oJynb0Y6kQItI6xSoB5MbjfuDmwp+fiKr8pLCxym12R6a/5iPfZsNUcmDyernZcceaF+w
	vlX9ccrKKbTYZXfGJjgWVWGlvN3iBwO7vFjQRHVWjfMiQcDnS/LYtQPWicfddL4mt66JSmuRAW4Si
	rpzm+oeFq6KeT83z4vCgIFetABvMTN/fKqMCGeAbSQvG24SBfysURUuao9HHhZNEm3E7CFASfoNtb
	5ajPuZeCQMDUEfglmGIs+bdcjdiDf6Fy9oDu+c79lrSMkxUBhk4zEyGXNsGkrmdxvNuN5gT09WGc8
	hZZOlsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUr9-00000003hV4-1cpc;
	Mon, 23 Nov 2026 14:17:19 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUr6-00000003hUO-3QNl
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 14:17:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id CA61AEC0B85
	for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 09:17:15 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 09:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795443431;
	 x=1795529831; bh=BHJ91NJtNYQ6/J6+FaRGzznho5yPOY/r3tuo2Sshg1o=; b=
	cPLj8Yt9KDzFT9oOBUn+/GuSsf5mynsPFU3peaGSzzjdcM3xPq2nCeDkNchhwU0y
	agEnTSgyBbGQ/yirLqdAtbec6K/eMPAPx84L678ABrYcb+wpXySl2GHRp4LB9WLN
	CFo2ebu58MUl9iNZ9Ieq9B5w0n8KUsPK5DwUz9m8y9EZ7/GezgGomuFh9mdki4r/
	+BIiXtKtzOGG5D+kuw3mpodMWyr20zPfOAhpC9pxJqrf1XcU6K399GtXsEQMc/8R
	39qj2UCf7kgamdATa+Pl6YH54Dj6cd0VQx4T8GjJ0eSyaIyzVoR7OVUL9GzpK8m7
	+ruoO3v7zMRO6WezXgniMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795443431; x=
	1795529831; bh=BHJ91NJtNYQ6/J6+FaRGzznho5yPOY/r3tuo2Sshg1o=; b=h
	C6LIkJbKj92f5S7k/JXfyeaid1Af9ZzNDUOfhQPFxJP9BRVK8CoFu3txAUBGFSdE
	kDtEOIgPiZzvlCZbCv4YLx/KipUoHlpFtABBaFDzTO/Eo99zurKqUHK11ZRFH3nk
	zrK7lUHYw/5sxSK66fxI2EBGUdhZg116RSbILC1OuB62zbnw2sD4sW3+a4PBWhw+
	vIkMNp+LX1SFD5zMvRTmes4VjgpqWOOFse8Womzu4lb2d/5udJ8V95DWmA0O1EvJ
	RGzmtn81sr/9oZLy7H3BztHTIli/UeDdJz4S0o8+2QlJ2kzB0w3ffJ58MILv/tOp
	VBsPDLa1+OUIFoA4NwwtQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795443431; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:LwjjlTmV5G2dH92B8tOhWU9vmH9bia9YDNoEh873KsNv2v4
	bdcEcsWHYyK1lemzRq8sVCxC5odMqo7sCiYJ597XRvVX5TQ6JWXusFn+GehdYWba
	5oh3yr2mZnTjud1mEL+R++hej/IVE0N5ubVzSA1e8O3xFxrga4PBlyocTm/dL/40
	zljip0uRo+TFOBhLP8t5GAxWTHagit5kR2AoFzoFJQ2WsBB1bD0FlxLtdTvGXHuI
	91AxzKZlZfBgIalrQf7BWAYCpaG3AG2vzlErmBqiWuhDhEeBPCVvF5PD5bbINBrq
	dQmvbzTHpB5nukPeRe80GTGu2GTW5QCHCYK6BhA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Sap56MIkcyZT8r4cYNPG+lEt8q7zj6cm/hR6DX/YHXU=:rDsMBjpfa65jK66igtyHf1M93PmlfJObl6/94lUiVSI=;
X-ME-Sender: <xms:4koEa8b6jWHk9Km-gWsvkjXKBe9FOycLSAoQHdX1x28WgylltvrlXg>
    <xme:4koEayN-2NZ5tuVMTv_F6M4wNcDyjmgtjmjdAzvHywIA7KHMufFQZrYw4q170T5Th
    fPdBGfTNlodLlNUN9knmz7mxDJr9FP9Hc2uPOv3pg8T14AiyewMGhM>
X-ME-Proxy-Cause: dmFkZTGFrwq2MF5SSuOMe3naqs9tbtMAmc3XEG2p+PrgD+xfiVSS77ldCceRFMgHOXXvSL
    Ging+R6VT6K3yz4OUeCdmIETXjNj7XXI0r9Tg2543OHjiuaKhMh+yVJAoB6OkAWbwGP/U3
    JowxnSxhNhDyTsBNjiM7LlqkLGWpphbuTeJ0WjErvJ9KhK0fJtLolaHFC6Kw2talXF2YGF
    JN7yWyVcYnsY66wGn8uoBc1Op9fn/HtafFpC/Ha3Z7ng5ziTGTERGiQYQq5K4ZdS/5JuDE
    HH1gfdWjYiM0bW96wZfgClnWGF2XIAu99qwAHGam6Iwuv/kahBWnYmwWVFrVPNzzZ/ahP5
    U1UkBFU5ZxOctbFZFvYR87OCQ9D85IrFkHXF9AU7aFYWG6vLW8lI9uDg5E561v2/5hKHQA
    sjQFn5A8NcDFUKKIz/Gj2N6XcZVOTlbQkDMhl7pFKmJR0nTwtc/ea8J3ozLffLR/0wUUbB
    iamGkspUsbgem4niF9wBtKb8Aybdc10XaTbLUSATly8dgGeAoj4vWgf2FM9ltEDrHvDjNY
    51emBC5k6bV+SyYpJacMFkokFxMkxKPk9r+T99bzSjJsfdRVRAC/r+2KM3FJJSK6C1f8wW
    I+V82FhA+/RpOowStt3CO/53UAvaoCC1+Mr9HKqAkD73+MJL10fMk/SelFXQ
X-ME-Proxy: <xmx:5UoEa7zTEzd5mDVuAJ0khzXfAhl-NnyAwD2CijXl1cunNEN88JhvqQ>
    <xmx:5UoEa4LmzfnQ4K0KUaYuA7sCKQ4bXebQmmhpsTBdhtm50HSfa0pUZw>
    <xmx:5UoEa9456MjeyYgj744opH-waU6skY_xuQzxaCDvT7bwukaslpL8Pw>
    <xmx:5UoEa2xmieeiTKUZnDvuF-Yhydil8f6ZkK_qEXx5P2wofodg1yRZbQ>
    <xmx:50oEa5l_6AC-8c6ZgGJR10cedMu4FgnH1XmeVBS7jPfPPs2PoWN-CFom>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6EB4832A009C; Mon, 23 Nov 2026 09:17:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMjdjL9dYp0J
Date: Mon, 23 Nov 2026 15:16:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Kees Cook" <kees@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-alpha@vger.kernel.org, "Paul Walmsley" <pjw@kernel.org>,
 "Andy Chiu" <andybnac@gmail.com>, "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <b7b8e8cd-d0ba-4e37-93f3-0fa209207124@app.fastmail.com>
In-Reply-To: <20261123110111-6431e85f-39a4-427e-b545-2e7a590a6c19@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
 <ec5359c1-c16e-4177-8dfa-2ae5ab8a874f@app.fastmail.com>
 <20261123110111-6431e85f-39a4-427e-b545-2e7a590a6c19@linutronix.de>
Subject: Re: [PATCH v3 00/15] exec: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_061717_224195_9EF0143A 
X-CRM114-Status: GOOD (  17.21  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMjMsIDIwMjYsIGF0IDExOjAzLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBPbiBNb24sIE5vdiAyMywgMjAyNiBhdCAxMDo0NDo0MEFNICswMTAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+PiBPbiBNb24sIE5vdiAyMywgMjAyNiwgYXQgMTA6MzcsIFRob21hcyBXZWnDn3Nj
aHVoIHdyb3RlOgo+PiA+IFRoZXJlIGlzIG5vdGhpbmcgdXNlcnNwYWNlIGNhbiBkbyB3aXRoIHRo
aXMgdmFsdWUuIEluIHRoZSBrZXJuZWwgaXMKPj4gPiBhbHdheXMgY29tYmluZWQgd2l0aCBBVF9W
RUNUT1JfU0laRV9CQVNFLCB3aGljaCBpcyBub3QgZXhwb3NlZCB0bwo+PiA+IHVzZXJzcGFjZSBh
bmQgYWxzbyBjaGFuZ2VzIGZyb20gdGltZSB0byB0aW1lLgo+PiA+Cj4+ID4gTW92ZSB0aGUgc3lt
Ym9sIHRvIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXJzLgo+PiA+Cj4+ID4gTWVhbnQgdG8gYmUgYXBw
bGllZCB0aHJvdWdoIHRoZSBhc20tZ2VuZXJpYyBvciBleGVjdmUgdHJlZS4KPj4gPiBUaGUgZGVm
YXVsdCByZWNpcGllbnQgbGlzdCB3YXMgaHVnZS4gSSB0cmltbWVkIGl0IHRvIG9ubHkgdGhlCj4+
ID4gYXJjaGl0ZWN0dXJlIGxpc3RzLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdl
acOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Cj4+IAo+PiBIaSBUaG9t
YXMsCj4+IAo+PiBJJ20gaGFwcHkgdG8gdGFrZSB0aGlzIHRocm91Z2ggdGhlIGFzbS1nZW5lcmlj
IHRyZWUuIEkndmUgYWxyZWFkeQo+PiBtYWRlIHN1cmUgaXQgYWxsIGFwcGxpZXMgYW5kIHRoZSBw
YXRjaGVzIGxvb2sgZ29vZCB0byBtZS4gSSdkCj4+IHdhaXQgYSBmZXcgbW9yZSBkYXlzIGZvciBh
ZGRpdGlvbmFsIEFjayBvciBhbnkgb3RoZXIgcmVwbGllcywKPj4gbGV0IG1lIGtub3cgb25jZSB5
b3UgdGhpbmsgSSBzaG91bGQgYXBwbHkgdGhpcyB2ZXJzaW9uLgo+Cj4gVGhpcyB2MyBpcyBmdW5j
dGlvbmFsbHkgaWRlbnRpY2FsIHRvIHYxIGFuZCB2MiB3aGljaCBoYXZlIGJlZW4gb24gdGhlCj4g
bGlzdCBvZiBhIGxvbmcgdGltZS4gSSBhbSBub3Qgc3VyZSBob3cgbXVjaCBtb3JlIGZlZWRiYWNr
IHdpbGwgY29tZS4KPiBJTU8gaXQgY2FuIGFscmVhZHkgYmUgYXBwbGllZCB0byBnYWluIG1vcmUg
ZXhwb3N1cmUgaW4gLW5leHQuCgpGYWlyIGVub3VnaCwgcHVzaGVkIG91dCB0byB0aGUgYXNtLWdl
bmVyaWMgdHJlZSBub3cuCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
