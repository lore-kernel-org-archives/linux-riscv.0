Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9DCCD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOtxotJSo2bGABaCzdvagItXhU7M0TeqCFl+eq7WUJ0=; b=rrzscK+9ynRIuU
	UPVio9YgxQ5HvetjiWvyabqM5ATbiJbiEkLdWx2zdJUMbdZIeJjVybkCf/mfLLPBhin2krnh/7y98
	K2liGy1mfjKFWi4Vq42ZXGVhjCcvF3+8vCk6FfhLAaEyTRqoJWBcpiiWX6vzb7j2ghZl2mHMVpdtX
	EAyoyQNaTpZxT8tBFcBgRmk20bOy4Lq2yNMdE+1D8UJl9JT+ebZMQmleNgZnG1fFJcibnHN3LkPbh
	+03IpAHy/eSzUL7vzkYxFO8FCP/z5DuP8n3yo214SPW/6DhfNSqaVKYg0Vy33NQv+Rmk/7zvjGbZ+
	+Jng9206LZdWge8EveOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupuh-0000000B7X1-3JCF;
	Thu, 11 Apr 2024 08:36:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupuc-0000000B7Um-40Cc
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 08:36:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50FBC1BF209;
	Thu, 11 Apr 2024 08:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712824557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1p7NHgdFRFW4BhKFxkt0bpU+PZz8Mug1imRTclDT8UQ=;
	b=JWIXirODoESQAgnqT43QvK+1ct3jUYCegnJvrN7hxW5xFqom7zT1woRDlqCMF0/3JyrUe0
	itYvrO3TgfEfm1JkPJ6PX2qZSJ34SYUx5631ox3QI8hr0YyPRRHhBDYcsGAjARL+n1ZdV2
	ec0J9zSlIUkxE7XUHSHJyKVyLuHKEjTfxcPsi8dbTaP6Bpenq2qUxojj5S7C41XJL4ZBoH
	hOgAK8x/UpYuhgOoZsPbzbIJKzL4vbiAQbMqnp6V7ncxwRlcOCRhpGPtjUzhGv4Bn79DRj
	Yqf+XAxM+0bFNxomoiJMoBn3nCSLz5SmX1jpq688FiaDxcKFc9omxyko62nf2Q==
Message-ID: <5fdda638-21ba-4fa7-b666-33cf2fd69dda@bootlin.com>
Date: Thu, 11 Apr 2024 10:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add initial Milk-V Duo S board device
 tree
To: Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: michael.opdenacker@bootlin.com, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240409064504.4010353-1-michael.opdenacker@bootlin.com>
 <IA1PR20MB49532A8D4294ADCE0C33A654BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240409-prevent-deepness-2d22bf009b16@spud>
 <IA1PR20MB49534E00CAE29D24F7D7E718BB072@IA1PR20MB4953.namprd20.prod.outlook.com>
 <1514d28a-5e96-4531-a972-894e41902efa@bootlin.com>
 <IA1PR20MB4953CA04D33EA0C7902DFA3ABB062@IA1PR20MB4953.namprd20.prod.outlook.com>
 <ZhZo0iJFSn1te-6d@xhacker>
Content-Language: en-US
In-Reply-To: <ZhZo0iJFSn1te-6d@xhacker>
Organization: Bootlin
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013603_292708_72BDC860 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmlzaGVuZywKCk9uIDQvMTAvMjQgYXQgMTI6MjQsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4g
c2V0dGluZyB0aGUgY29ycmVjdCBidXMtd2lkdGggaXMgbmVjZXNzYXJ5IGZvciBiZXR0ZXIgcGVy
Zm9ybWFuY2UKPiBuby0xLTgtdiBjYW4gYmUgcmVtb3ZlZCwgYnV0IGl0IGRvZXNuJ3QgaGFybSBh
bnl0aGluZyBiZWNhdXNlCj4gdGhlIGJvYXJkIGRvZXNuJ3Qgc3VwcGx5IDEuOHYKPgo+IG5vLW1t
YyBhbmQgbm8tc2RpbyB0byBtYWtlIHRoZSBwcm9iZSBhIGJpdCBxdWlja2VyCgpNYW55IHRoYW5r
cyBmb3IgeW91ciBhZHZpY2UhCgpIb3dldmVyLCB3aGV0aGVyIEkgYXBwbHkgdGhlc2UgY2hhbmdl
cyBvciBub3QsIApnaXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3Yv
bGludXguZ2l0IGlzIG5vdyBicm9rZW4gCmZvciBtZToKRXJyb3I6IGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjAwMC1taWxrdi1kdW9zLmR0czozMi4xLTggTGFiZWwgb3IgCnBhdGggc2Ro
Y2kwIG5vdCBmb3VuZAoKSSB3YXMgcHJldmlvdXNseSB0ZXN0aW5nIHdpdGggbGludXgtbmV4dCwg
YnV0IGl0J3Mgbm93IGJyb2tlbiB0b28sIAp0aG91Z2ggaW4gYSBkaWZmZXJlbnQgd2F5OgpbwqDC
oMKgIDEuMzA2ODExXSAvZGV2L3Jvb3Q6IENhbid0IG9wZW4gYmxvY2tkZXYKW8KgwqDCoCAxLjMx
MTIwMF0gVkZTOiBDYW5ub3Qgb3BlbiByb290IGRldmljZSAiL2Rldi9tbWNibGswcDIiIG9yIAp1
bmtub3duLWJsb2NrKDAsMCk6IGVycm9yIC02CgpTaGFsbCBJIHN1Ym1pdCBteSB1cGRhdGVzIGFu
eXdheT8KQ2hlZXJzCk1pY2hhZWwuCgotLSAKTWljaGFlbCBPcGRlbmFja2VyLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
