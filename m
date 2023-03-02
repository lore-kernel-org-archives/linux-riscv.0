Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F12C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pTLhI0Ce6cgzMlpU5Q7OFHKfXaiTrrUTYIt7vRdXkU=; b=Z50+WAKe8pgdOC
	j2YnkMKzIeddhseBDWi7fBH1yjfpZqbsqBg2EqWdZEI8Wqcwlof8UjyYryPB6iZLdDRvHrFupkhsY
	YHO3iWpxRj9nqR/68CtmbF7FaR2In2MMX8y9oHXR8FVSjNBw5ZUnoHAyJGYHuBMz5TqHWfckXiPnk
	gkyVeYgrgKxs5vEWaXBUE5YwaPWki0vC3kMjP3HBQF/8XtVLP6A1aABeZIrKA6wdmG8rsm2aKGplZ
	GPd7fHQouPdo1CTO75onkH9wuO4/l8+BNMpKUcWkIHC0Uh2cRBBs2I3fanw1Gbe1sxI859tu9cJS3
	cNbKh8MUaxdPh/zgcM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgs2-001reU-5Q; Thu, 02 Mar 2023 11:13:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgrw-001rby-8K; Thu, 02 Mar 2023 11:13:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E4036159A;
	Thu,  2 Mar 2023 11:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341EFC4339C;
	Thu,  2 Mar 2023 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677755582;
	bh=78a13yEpeA5Ldcu7G0xUrs9jQbTgpI/ZVXJxl6apOi0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GHuu/UJ3xuwVyb2/hnG6qeRyFi+RH8qFcK805GHVNSg88LVuhf48SIZ55kUARSxBz
	 TqeUjyxV8iEvvkkGywqVkEzY7AbeEfVJRKjrpNzIQ7Y4PwGaWIeV0/PWKoaUs8pNmu
	 rORCVo3bA2M0KZMkk07U3Rj8In9+4I5GIc9ToDhcHT2M91CjxpkTK2CFYX7hgjdLPp
	 zhsjuu/cH25uMnFzwpj+h+e6RLY2Q7qRsyuFcjrvNKnQ2hEVC2PvDrGsJIpXKfc1fB
	 MTP/d61Ep7OwY+x2kwCrBbnghMk4hgQ/2ZS3BgmjQvu62nJTo3ytZAhnsqdMsoQl0v
	 P5fjQTmlDJK1g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
In-Reply-To: <20230224170118.16766-9-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-9-andy.chiu@sifive.com>
Date: Thu, 02 Mar 2023 12:12:59 +0100
Message-ID: <87r0u74dac.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_031304_409992_A72D8F92 
X-CRM114-Status: UNSURE (   7.57  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dmVjdG9yLmgKPiBpbmRleCA2OTJkM2VlMmQyZDMuLjljMDI1ZjJlZmRjMyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0zMSwxMSArNTQsNzIgQEAgc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIHJpc2N2X3ZfZGlzYWJsZSh2b2lkKQo+ICAJY3NyX2NsZWFyKENTUl9TU1RBVFVT
LCBTUl9WUyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0
ZV9jc3Jfc2F2ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqZGVzdCkKPiArewo+ICsJYXNt
IHZvbGF0aWxlICgKPiArCQkiY3NycgklMCwgIiBDU1JfU1RSKENTUl9WU1RBUlQpICJcblx0Igo+
ICsJCSJjc3JyCSUxLCAiIENTUl9TVFIoQ1NSX1ZUWVBFKSAiXG5cdCIKPiArCQkiY3NycgklMiwg
IiBDU1JfU1RSKENTUl9WTCkgIlxuXHQiCj4gKwkJImNzcnIJJTMsICIgQ1NSX1NUUihDU1JfVkNT
UikgIlxuXHQiCj4gKwkJOiAiPXIiIChkZXN0LT52c3RhcnQpLCAiPXIiIChkZXN0LT52dHlwZSks
ICI9ciIgKGRlc3QtPnZsKSwKPiArCQkgICI9ciIgKGRlc3QtPnZjc3IpIDogOik7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3JfcmVzdG9yZShzdHJ1
Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc3JjKQo+ICt7Cj4gKwlhc20gdm9sYXRpbGUgKAo+ICsJ
CSJ2c2V0dmwJIHgwLCAlMiwgJTFcblx0Igo+ICsJCSJjc3J3CSIgQ1NSX1NUUihDU1JfVlNUQVJU
KSAiLCAlMFxuXHQiCj4gKwkJImNzcncJIiBDU1JfU1RSKENTUl9WQ1NSKSAiLCAlM1xuXHQiCj4g
KwkJOiA6ICJyIiAoc3JjLT52c3RhcnQpLCAiciIgKHNyYy0+dnR5cGUpLCAiciIgKHNyYy0+dmwp
LAo+ICsJCSAgICAiciIgKHNyYy0+dmNzcikgOik7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnNh
dmVfdG8sIHZvaWQgKmRhdGFwKQo+ICt7Cj4gKwlyaXNjdl92X2VuYWJsZSgpOwo+ICsJX192c3Rh
dGVfY3NyX3NhdmUoc2F2ZV90byk7Cj4gKwlhc20gdm9sYXRpbGUgKAo+ICsJCSJ2c2V0dmxpCXQ0
LCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsJCSJ2c2U4LnYJCXYwLCAoJTApXG5cdCIKPiAr
CQkiYWRkCQklMCwgJTAsIHQ0XG5cdCIKPiArCQkidnNlOC52CQl2OCwgKCUwKVxuXHQiCj4gKwkJ
ImFkZAkJJTAsICUwLCB0NFxuXHQiCj4gKwkJInZzZTgudgkJdjE2LCAoJTApXG5cdCIKPiArCQki
YWRkCQklMCwgJTAsIHQ0XG5cdCIKPiArCQkidnNlOC52CQl2MjQsICglMClcblx0Igo+ICsJCTog
OiAiciIgKGRhdGFwKSA6ICJ0NCIsICJtZW1vcnkiKTsKPiArCXJpc2N2X3ZfZGlzYWJsZSgpOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHN0
cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlX2Zyb20sCj4gKwkJCQkgICAgdm9pZCAq
ZGF0YXApCj4gK3sKPiArCXJpc2N2X3ZfZW5hYmxlKCk7Cj4gKwlhc20gdm9sYXRpbGUgKAo+ICsJ
CSJ2c2V0dmxpCXQ0LCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsJCSJ2bGU4LnYJCXYwLCAo
JTApXG5cdCIKPiArCQkiYWRkCQklMCwgJTAsIHQ0XG5cdCIKPiArCQkidmxlOC52CQl2OCwgKCUw
KVxuXHQiCj4gKwkJImFkZAkJJTAsICUwLCB0NFxuXHQiCj4gKwkJInZsZTgudgkJdjE2LCAoJTAp
XG5cdCIKPiArCQkiYWRkCQklMCwgJTAsIHQ0XG5cdCIKPiArCQkidmxlOC52CQl2MjQsICglMClc
blx0Igo+ICsJCTogOiAiciIgKGRhdGFwKSA6ICJ0NCIpOwoKTml0L3F1ZXN0aW9uOiBGb3IgYm90
aCBlbmFibGUvZGlzYWJsZTsgQW55IHJlYXNvbiB0byBjbG9iYmVyIHQ0LCBpbnN0ZWFkCm9mIHVz
aW5nIGEgc2NyYXRjaCByZWc/CgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
