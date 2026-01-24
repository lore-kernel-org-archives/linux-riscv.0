Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7BDD715CA
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 06:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4mxWUG+kSL+k9SyRtt4gDpTlktCkrbOgnP37tbMIdQ=; b=qxOESTgwCgNYNQ
	uYaD2TGq6liGWOZEV179NOXzCbdsmmlkccgH674wMTGGsspMnBJWVnM798/FatSzY65Z9UqxmeJTC
	ImR5D46ZumEC+Gab+UWhJqond3OWSYGqYH9fyxnccQWMVBca3AUlokUacCye4WsC6/A5y0fT3JqDi
	IxcTuXUsKcdHQFo6bmkeY2P+3ZH0N6o3flmeM5SPE+nFPiYPbzZ3ARiutsjrACddNWdnzw7wdU7cx
	C3ounkR5cnD8hxz4IC7ULsTQoJ4tFoQx6HJjyJdN5r6bCACt5mAmgUcG7yCdHDEFlcOkssI+IfcC9
	/FH+B48rqQ3z5l7Lts3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjX53-0000000A2bR-3M9w;
	Sat, 24 Jan 2026 06:25:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjX4z-0000000A2ap-28Sj
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 06:25:08 +0000
Received: from [192.168.0.108] (unknown [123.118.222.47])
	by APP-03 (Coremail) with SMTP id rQCowACHa+KhZXRphz94Bg--.7034S2;
	Sat, 24 Jan 2026 14:24:34 +0800 (CST)
Message-ID: <76bd53dd-0ca9-4358-a0b6-a49283e43c5f@iscas.ac.cn>
Date: Sat, 24 Jan 2026 14:24:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
X-CM-TRANSID: rQCowACHa+KhZXRphz94Bg--.7034S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr13Jr47ZFW7Zr4rtFWUJwb_yoW3Gwb_A3
	4Igas7Z3WkuFWa93Z7JFs0yF98Xa1jkFyavr1rJ348X34YkFykC3s2g3sIvr18Gr4UKr1D
	Wr4kKr4UAFnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU30PfDUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_222505_937287_E30F5276 
X-CRM114-Status: UNSURE (   7.17  )
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

Ck9uIDEvMjQvMjYgMDg6MjAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gWy4uLl0KPgo+IE5vdGU6IFBh
dGNoIDMgaW50cm9kdWNlcyBhIGJpc2VjdCBicmVha2FnZSBieSB0cmFuc2l0aW9uaW5nIHRvCj4g
cGluLXNwZWNpZmljIHN1cHBseSBuYW1lcy4gUHJvYmUgZmFpbHVyZXMgd2lsbCBvY2N1ciBvbiBl
eGlzdGluZyBib2FyZHMKPiB1bnRpbCBQYXRjaCA0IHVwZGF0ZXMgdGhlIGNvcnJlc3BvbmRpbmcg
RFRTIGZpbGUuCgpPdWNoLCB0aGF0J3Mgbm90IGEgYmlzZWN0IGJyZWFrYWdlLCB0aGF0J3MgYW4g
KkFCSSBicmVha2FnZSouIEFuZCBBRkFJQ1QKdGhpcyBpcyBzdGlsbCBub3Qgb2theSBpbiAyMDI2
LApzZWXCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9BQkkucnN0CgpTbyB0aGUg
YmluZGluZ3Mgd291bGQgbmVlZCB0byBiZSBjaGFuZ2VkIHRvIGFjY2VwdCBib3RoIHRoZSBuZXcg
YW5kIG9sZCB3YXkuCgpEcml2ZXItd2lzZSwgYXQgYSBjdXJzb3J5IGxvb2sgZnJvbSBzb21lb25l
IG5vdCBmYW1pbGlhciB3aXRoIHRoZQpyZWd1bGF0b3Igc3R1ZmYsIG1heWJlIHdlIGNhbiBtYWtl
IGl0IGNvbXBhdGlibGUgd2l0aCBvbGQgRFRTIGJ5IGFkZGluZwp0aGUgbmV3IG5hbWVzIGFzIGFs
aWFzZXMgKHtkZXZtXyx9cmVndWxhdG9yX3JlZ2lzdGVyX3N1cHBseV9hbGlhcz8pIGFzCiJ2aW4i
IG9yICJidWNrNSIsIGlmIHdlIHNlZSB0aGUgb2xkIHZpbi1zdXBwbHkgZGVmaW5pdGlvbnM/CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
