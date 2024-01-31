Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCDC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkbMwB5JChIVoWDIS67pXqaz/za8LeM4HT60sknT/VY=; b=V7Jqm7Iws0Sy9L
	5ZsUulElUTy1FcOFRjwFO6o8GOmW43tBYXs8K+hIoJjka1buZvSnHGC1Pbz/X/e3DZik9V0EVEZN7
	ldQe5DHh8YBPSCGdTC51+7fD41yfFnddOBWlybvLO1PZg1eHXoMEWksfvVdJeQKsDTo+5n8ZGALfD
	k/i/jIUwV2KqHuU0MlUDfGyUJiSQYD9vhzGmXq7og1ro1374BzI2Fv8qGuPAG4bx83UmyQnLke3iA
	6qhd8yBfyD8aSTEkkUuflBW3p+/Hee0ot5XonDk9FgsGEKw0lE/w4BuWnbZBcWFaEOXZnfFx3mym+
	QkJR/X3jzD2Oi3wFo0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8oz-000000037As-2jNV;
	Wed, 31 Jan 2024 11:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7qO-00000002oAW-4860
	for linux-riscv@bombadil.infradead.org;
	Wed, 31 Jan 2024 10:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iKsNv795W6E/GbLdxQpU+VkSSklR3RfYg2NP17KrEuU=; b=EaTKu20ZJ9cx1kofZB8ZC6w7yS
	BuNru7oOj4B8E+NebrfC/ckj/N4QIsnIoICGrRYO+wToGyBgRGYqqX28T6frm26SeGotQyaNJ34Ld
	HoZUYxyEoZQwlAe2WFWwAxIeizPsMPRdFjbV7i+mNdsfel8MEila/FmCR59xcdkAeJ2qYLRXGIFqz
	T6yeC/aw8RJo8CoFdcHfOvHpMfm/IINeld6oWduEglkXdgBGQZjpUjHuFfU8BLM7GSl5MdGKN+y1q
	ltML8xTnXhb5DqDMRdK2G0CTYlemenUjzvhP8x6lLCn9z8qgT8slUQoRCcWaKEAYZ0swlKvp53QrH
	tHdBX7Aw==;
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7qL-00000008yA4-2sd6
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 10:29:23 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 677D15C00BF;
	Wed, 31 Jan 2024 05:29:20 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 31 Jan 2024 05:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1706696960;
	 x=1706783360; bh=iKsNv795W6E/GbLdxQpU+VkSSklR3RfYg2NP17KrEuU=; b=
	r1w+SIgGWw7dJyt3GzIZOgqo2n/eeg1SXNYzBJKIHR6M+ZtY9LOh/WzC8xl5ZyiX
	KGiDo4w+ZuwSEQ1vuvGYQvBLaMADawKJeAQY6vMvLojc2nTufc2dwLrdoan28w8L
	NX4TquETi11QgoauczLec/BpoD1TxBXJ0E5lzJwPQP1Z6V2oWv+o+FEyeeyPYpVn
	gT8ibuoLeRJlzl96Gs9TKtcIl7CcSgc/LXeZUQCWW8n7s5lOftNa2Mert2BDm2GP
	YaaVIomhQwxG6eFGNlsVVWMLtp8Y5UtRyG+22deQB/OrbIIMR0mNY97d5YsDwNXi
	l/a/oPZxoUjFG27YrK7sgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706696960; x=
	1706783360; bh=iKsNv795W6E/GbLdxQpU+VkSSklR3RfYg2NP17KrEuU=; b=p
	rxagr4LAAt5LDBTk5TLUgiJy31iihbvdHZuht6v/ZdhedjYllhFfqCe81x2f95Zo
	7c6qF6Vqn0Ct+PWPC0LPmC2q3oxm8PJ+97vM2ReNQS4BnfuikN8+tFzLSVwAiLnB
	XCwpMLMC/apTM5pOXQjPBmynVDClv9VC0FVmqluRrpBax54ys6yQVKOB8+JxDgx7
	CeJBEi5CJKu+A2PM+6A9QnmPb1gRmwAS45hIUBOcJLxv4NTuzCD+RmnYS8OKNWo/
	J/L2JLLQS3iQN6M066Waa64UWuCrsmuVL2LkuV7ucDjl3KDA2RKS79l+cG3uXD9h
	80+Nmub29smTdXwFwugbg==
X-ME-Sender: <xms:_iC6ZWx41lQGmTgxNQPv033inelQFUqqgqhGoRB1Yy_Suw3I8Xelgg>
    <xme:_iC6ZSRqCMMRGR4dsf2AkWDbTf6DTYgj0B5L_el4qpBjc-H_WY24kzGjuScisGao2
    yzSLAe8OaA_rRy8Tlo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtledgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_iC6ZYXhgaK38oMGNaGPwVUfqTjpiERjPnsH4firn_SwhCPxrErYHA>
    <xmx:_iC6ZcjvaWNtDsNaKMs_RAFWnK9ju6FdUo2vEcbE8gjZqfayeaG8bg>
    <xmx:_iC6ZYCMLDoeolGZs_ufJ7ezycNWlbfwu69_HSZoxwUOXAZXBSQ_Mw>
    <xmx:ACG6ZY2U-kSIMTC4srsLhXKXwUwJquPF-ApdBE0B8lL06BOUgQl9CQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 44453B6008D; Wed, 31 Jan 2024 05:29:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <1036060c-25dd-439b-b081-893d0cb000f6@app.fastmail.com>
In-Reply-To: <269edff0-d989-4ac8-b0c3-bce31283806b@kalrayinc.com>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-32-ysionneau@kalray.eu>
 <995eb624-3efe-10fc-a6ed-883d52d591bb@linaro.org>
 <269edff0-d989-4ac8-b0c3-bce31283806b@kalrayinc.com>
Date: Wed, 31 Jan 2024 11:28:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yann Sionneau" <ysionneau@kalrayinc.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Yann Sionneau" <ysionneau@kalray.eu>,
 "Jonathan Corbet" <corbet@lwn.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Marc Zyngier" <maz@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Will Deacon" <will@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Kees Cook" <keescook@chromium.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Waiman Long" <longman@redhat.com>,
 "Aneesh Kumar" <aneesh.kumar@linux.ibm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Paul Moore" <paul@paul-moore.com>, "Eric Paris" <eparis@redhat.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Jules Maselbas" <jmaselbas@kalray.eu>,
 "Guillaume Thouvenin" <gthouvenin@kalray.eu>,
 "Clement Leger" <clement@clement-leger.fr>,
 "Vincent Chardon" <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=C3=A8s?= <dkm@kataplop.net>,
 "Julian Vetter" <jvetter@kalray.eu>, "Samuel Jones" <sjones@kalray.eu>,
 "Ashley Lesdalons" <alesdalons@kalray.eu>,
 "Thomas Costis" <tcostis@kalray.eu>, "Marius Gligor" <mgligor@kalray.eu>,
 "Jonathan Borne" <jborne@kalray.eu>,
 "Julien Villette" <jvillette@kalray.eu>,
 "Luc Michel" <lmichel@kalray.eu>, "Louis Morhet" <lmorhet@kalray.eu>,
 "Julien Hascoet" <jhascoet@kalray.eu>,
 "Jean-Christophe Pince" <jcpince@gmail.com>,
 "Guillaume Missonnier" <gmissonnier@kalray.eu>,
 "Alex Michon" <amichon@kalray.eu>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <git@xen0n.name>,
 "Shaokun Zhang" <zhangshaokun@hisilicon.com>,
 "John Garry" <john.garry@huawei.com>,
 "Guangbin Huang" <huangguangbin2@huawei.com>,
 "Bharat Bhushan" <bbhushan2@marvell.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Atish Patra" <atishp@atishpatra.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, "Qi Liu" <liuqi115@huawei.com>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Brown" <broonie@kernel.org>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Alexey Dobriyan" <adobriyan@gmail.com>,
 "Julian Vetter" <jvetter@kalrayinc.com>, jmaselbas@zdiv.net
Cc: "Benjamin Mugnier" <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 31/31] kvx: Add IPI driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_102921_977956_6B06B9D2 
X-CRM114-Status: GOOD (  26.65  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQsIGF0IDEwOjUyLCBZYW5uIFNpb25uZWF1IHdyb3RlOgo+IE9u
IDIyLzAxLzIwMjMgMTI6NTQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIDIwLzAx
LzIwMjMgMTU6MTAsIFlhbm4gU2lvbm5lYXUgd3JvdGU6Cj4+PiArCj4+PiAraW50IF9faW5pdCBr
dnhfaXBpX2N0cmxfcHJvYmUoaXJxcmV0dXJuX3QgKCppcGlfaXJxX2hhbmRsZXIpKGludCwgdm9p
ZCAqKSkKPj4+ICt7Cj4+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4+PiArCWludCByZXQ7
Cj4+PiArCXVuc2lnbmVkIGludCBpcGlfaXJxOwo+Pj4gKwl2b2lkIF9faW9tZW0gKmlwaV9iYXNl
Owo+Pj4gKwo+Pj4gKwlucCA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJr
YWxyYXksa3Z4LWlwaS1jdHJsIik7Cj4+IE5vcGUsIGJpZyBuby4KPj4KPj4gRHJpdmVycyBnbyB0
byBkcml2ZXJzLCBub3QgdG8gYXJjaCBjb2RlLiBVc2UgcHJvcGVyIGRyaXZlciBpbmZyYXN0cnVj
dHVyZS4KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lgo+Cj4gSXQgcmFpc2VzIHF1ZXN0aW9u
cyBvbiBvdXIgc2lkZSBhYm91dCBob3cgdG8gaGFuZGxlIHRoaXMgY2hhbmdlLgo+Cj4gRmlyc3Qg
bGV0IG1lIGRlc2NyaWJlIHRoZSBoYXJkd2FyZToKPgo+IFRoZSBjb29saWRnZSBpcGkgY29udHJv
bGxlciBkZXZpY2UgaGFuZGxlcyBJUEkgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIGNwdXMKPiBpbnNp
ZGUgYSBjbHVzdGVyLgo+Cj4gRWFjaCBjcHUgaGFzIDggb2YgaXRzIGRlZGljYXRlZCBpcnEgbGlu
ZXMgKDI0IHRvIDMxKSBoYXJkLXdpcmVkIHRvIHRoZSBpcGkuCj4gVGhlIGlwaSBjb250cm9sbGVy
IGhhcyA4IHNldHMgb2YgMiByZWdpc3RlcnM6Cj4gLSBhIDE3LWJpdCAiaW50ZXJydXB0IiByZWdp
c3Rlcgo+IC0gYSAxNy1iaXQgIm1hc2siIHJlZ2lzdGVyCj4KPiBFYWNoIGNvdXBsZSBvZiByZWdp
c3RlciBpcyBkZWRpY2F0ZWQgdG8gMSBvZiB0aGUgOCBpcnFsaW5lcy4KPiBFYWNoIG9mIHRoZSAx
NyBiaXRzIG9mIGludGVycnVwdC9tYXNrIHJlZ2lzdGVyCj4gaWRlbnRpZmllcyBhIGNwdSAoY29y
ZXMgMCB0byAxNSArIHNlY3VyZV9jb3JlKS4KPiBXcml0aW5nIGJpdCBpIGluIGludGVycnVwdCBy
ZWdpc3RlciBzZW5kcyBhbiBpcnEgdG8gY3B1IGksIGFjY29yZGluZyB0byB0aGUgbWFzawo+IGlu
IG1hc2sgcmVnaXN0ZXIuCj4gV3JpdGluZyBpbiBpbnRlcnJ1cHQvbWFzayByZWdpc3RlciBjb3Vw
bGUgTiB0YXJnZXRzIGlycSBsaW5lIE4gb2YgdGhlIGNvcmUuCj4KPiAtIElwaSBnZW5lcmF0ZXMg
YW4gaW50ZXJydXB0IHRvIHRoZSBjcHUgd2hlbiBtZXNzYWdlIGlzIHJlYWR5Lgo+IC0gTWVzc2Fn
ZXMgYXJlIGRlbGl2ZXJlZCB2aWEgQXhpLgo+IC0gSXBpIGRvZXMgbm90IGhhdmUgYW55IGludGVy
cnVwdCBpbnB1dCBsaW5lcy4KPgo+Cj4gwqAgKy0tLS0tLS0tLS0tLS0tLSvCoMKgIGlyccKgwqDC
oMKgwqDCoCBheGlfdwo+IMKgIHzCoMKgwqDCoMKgwqDCoMKgIHzCoCBpwqAgfDwtLS8tLS0gaXBp
IDwtLS0tLS0KPiDCoCB8IENQVcKgwqDCoMKgIHzCoCBuwqAgfMKgIHg4Cj4gwqAgfMKgIGNvcmUw
wqAgfMKgIHTCoCB8Cj4gwqAgfMKgwqDCoMKgwqDCoMKgwqAgfMKgIGPCoCB8wqAgaXJxwqDCoMKg
wqDCoMKgwqDCoMKgIGlyccKgwqDCoMKgwqDCoMKgwqAgbXNpCj4gwqAgfMKgwqDCoMKgwqDCoMKg
wqAgfMKgIHTCoCB8PC0tLy0tLSBhcGljIDwtLS0tLSBtYm94IDwtLS0tLS0tCj4gwqAgfMKgwqDC
oMKgwqDCoMKgwqAgfMKgIGzCoCB8wqAgeDQKPiDCoCArLS0tLS0tLS0tLS0tLS0tKwo+IMKgIHdp
dGggaW50Y3RsID0gY29yZS1pcnEgY29udHJvbGxlcgo+wqDCoCDCoAo+Cj4gV2UgYW5hbHl6ZWQg
aG93IG90aGVyIExpbnV4IHBvcnRzIGFyZSBoYW5kbGluZyB0aGlzIHNpdHVhdGlvbiAoSVBJKSBh
bmQgCj4gaGVyZSBhcmUgc2V2ZXJhbCBwb3NzaWJsZSBzb2x1dGlvbnM6Cj4KPiAxLyBwdXQgZXZl
cnl0aGluZyBpbiBzbXAuYyBsaWtlIHdoYXQgbG9uZ2FyY2ggaXMgZG9pbmcuCj4gwqAgKiBFeGNl
cHQgdGhhdCBJUEkgaW4gbG9uZ2FyY2ggc2VlbXMgdG8gaW52b2x2ZSB3cml0aW5nIHRvIGEgc3Bl
Y2lhbCAKPiBwdXJwb3NlIENQVSByZWdpc3RlciBhbmQgbm90IGRvaW5nIGEgbWVtb3J5IG1hcHBl
ZCB3cml0ZSBsaWtlIGt2eC4KPgo+IDIvIHdyaXRlIGEgZGV2aWNlIGRyaXZlciBpbiBkcml2ZXJz
L3h4eC8gd2l0aCB0aGUgY29udGVudCBmcm9tIGlwaS5jCj4gwqAgKiB0aGUgcHJvYmUgd291bGQg
anVzdCBpb3JlbWFwIHRoZSByZWcgZnJvbSBEVCBhbmQgcmVnaXN0ZXIgdGhlIGlycSAKPiB1c2lu
ZyByZXF1ZXN0X3BlcmNwdV9pcnEoKQo+IMKgICogaXQgd291bGQgZXhwb3J0IGEgZnVuY3Rpb24g
Imt2eF9pcGlfc2VuZCgpIiB0aGF0IHdvdWxkIGRpcmVjdGx5IGJlIAo+IGNhbGxlZCBieSBzbXAu
Ywo+IMKgICogUXVlc3Rpb24gOiB3aGVyZSB3b3VsZCB0aGlzIGRyaXZlciBiZSBwbGFjZWQgaW4g
ZHJpdmVycy8gPyAKPiBkcml2ZXJzL2lycWNoaXAvID8gRXZlbiBpZiB0aGlzIGlzIG5vdCBwZXIt
c2UgYW4gaW50ZXJydXB0LWNvbnRyb2xsZXIgCj4gZHJpdmVyPwoKVGhpcyBsb29rcyBsaWtlIGl0
J3MgY2xvc2UgZW5vdWdoIHRvIHRoZSBpcnFjaGlwIGRyaXZlcgp0aGF0IHlvdSBjYW4ganVzdCBo
YXZlIGl0IGluIHRoZSBzYW1lIGZpbGUgYXMgdGhlICdpbnRjdGwnCnBvcnRpb24uCgpUb3AtbGV2
ZWwgaXJxY2hpcCBpbXBsZW1lbnRhdGlvbnMgdGVuZCB0byBiZSByYXRoZXIgYXJjaGl0ZWN0dXJl
CnNwZWNpZmljLCBhcyBkb2VzIHRoZSBJUEkgbWVjaGFuaXNtLiBEZXBlbmRpbmcgb24gdGhlIHJl
Z2lzdGVyCmxheW91dCwgSSB0aGluayB5b3UgY2FuIGhhdmUgYSBzaW5nbGUgZGV2aWNldHJlZSBu
b2RlIGZvcgp0aGUgY29tYmluYXRpb24gb2YgdGhlIGNvcmUtaXJxIChmb3IgbWFuYWdpbmcgeW91
cgpvd24gaW50ZXJydXB0cykgYW5kIHRoZSBpcGkgKGZvciByZWNlaXZpbmcgaW50ZXJydXB0cyBm
cm9tCm90aGVycyksIGFuZCB0aGVuIGhhdmUgYSBkcml2ZXIgaW4gZHJpdmVycy9pcnFjaGlwIHRv
CmRlYWwgd2l0aCBib3RoLiBGb3IgdGhlIGlwaSBtZWNoYW5pc20sIHRyeWluZyB0byBhYnN0cmFj
dAppdCB0b28gbXVjaCBnZW5lcmFsbHkgbWFrZXMgaXQgdG9vIHNsb3csIHNvIEkgd291bGQgbm90
CmdvIHRocm91Z2ggYSBuZXN0ZWQgaXJxY2hpcCBvciBhIG1haWxib3ggZHJpdmVyIGV0Yy4KCkkg
ZG9uJ3Qga25vdyB3aGF0IHRoZSAnYXBpYycgaW4geW91ciBkaWFncmFtIGlzLCBzbyB0aGF0Cndv
dWxkIGJlIGVpdGhlciBhIG5lc3RlZCBpcnFjaGlwIG9yIGNvdWxkIGJlIHBhcnQgb2YKdGhlIHNh
bWUgZHJpdmVyIGFzIHdlbGwuCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
