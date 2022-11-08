Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D789DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 11:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKWtR2E6ITlmeApPa3X6xUiBZHWDNNhqlQ7YSPPpPNI=; b=CuULrBR5p4y73q
	Z3y159a48Z8G+xoHdinxJ7lginXDbqvdB6msmkxx8AgWxZtX+FDs/Qho4BUcp1YScWNF1AXF/utUe
	aIzh9oxz9qQZMdpe28ewzR4xYHeEJ4d/fanXVRMbgrpOi+QWOGcZnhNh8wo/w20t8T5pYPE7XHvZ0
	aTROhjaCXQ35V2bjT6W0bXuvS3kTvN9HI0G7Puj3ZdcPrBhUtrx5l5/z1RvuWxzKYa2PW9BuNGIiK
	PF4uf8zmTu78fOD6uE4vz8iCccowKJJFs1d+QNIIwNLwTF+Qk9faSSjgYuKvgF/AnqQ6Dfk7IL2Nu
	tN8ZpM3JPS1XXy02tT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMPH-004ji0-RX; Tue, 08 Nov 2022 11:04:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osMPD-004jfH-5G
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 11:04:38 +0000
Received: from smtpclient.apple (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowABXX4+qN2pj8Y3iCA--.26885S3;
	Tue, 08 Nov 2022 19:04:10 +0800 (CST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v4 0/8] Add OPTPROBES feature on RISCV
From: Xim <chenguokai17@mails.ucas.ac.cn>
In-Reply-To: <87y1sm1z8j.fsf@all.your.base.are.belong.to.us>
Date: Tue, 8 Nov 2022 19:04:09 +0800
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 rostedt@goodmis.org,
 mingo@redhat.com,
 sfr@canb.auug.org.au,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 liaochang1@huawei.com,
 Liao Chang <liaoclark@163.com>
Message-Id: <9A705974-A007-45E2-BC5D-A7E90821A258@mails.ucas.ac.cn>
References: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
 <87y1sm1z8j.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CM-TRANSID: qwCowABXX4+qN2pj8Y3iCA--.26885S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW7WF1xAF4DWw48urW3Wrg_yoW8Cryfpa
	yIkws8Ka1vyasFg3WqvF4xX3WS9r4jqrWUZFnrGw15Gw15XF9avw4Sg3y5uFn8KrWFyr4I
	vFyjyw1kZ3s7AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx
	0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAC
	I402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxU4nmiDUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiBwIEE2Np+0jc0gAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_030435_627491_235BA349 
X-CRM114-Status: GOOD (  16.81  )
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

SGkgQmrDtnJuLAoKVGhhbmtzIGZvciB5b3VyIGdyZWF0IHJldmlldyEgU29tZSBleHBsYW5hdGlv
bnMgYmVsb3cuCgo+IDIwMjLlubQxMeaciDjml6UgMDA6NTTvvIxCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPiDlhpnpgZPvvJoKPiAKPiBIYXZlIHlvdSBydW4gdGhlIHNlcmllcyBvbiBy
ZWFsIGhhcmR3YXJlLCBvciBqdXN0IHFlbXU/CgpDdXJyZW50bHkgb25seSBxZW11IHRlc3RzIGFy
ZSBtYWRlLCBJIHdpbGwgdHJ5IHRvIHRlc3QgaXQgb24gYSBGUEdBIHJlYWwgaGFyZHdhcmUgc29v
bi4KCj4gQUZBSVUsIHRoZSBhbGdvcml0aG0gb25seSB0cmFja3MgcmVnaXN0ZXJzIHRoYXQgYXJl
ICppbiB1c2UqLiBZb3UgYXJlCj4gYWxyZWFkeSBzY2FubmluZyB0aGUgd2hvbGUgZnVuY3Rpb24g
KG5leHQgcGF0Y2gpLiBXaGF0IGFib3V0IHRoZSBjYWxsZXIKPiBzYXZlZCByZWdpc3RlcnMgdGhh
dCBhcmUgKm5vdCogdXNlZCBieSB0aGUgZnVuY3Rpb24gaW4gdGhlIHByb2JlIHJhbmdlPwo+IENh
biB0aG9zZSwgcG90ZW50aWFsbHkgdW51c2VkLCByZWdzIGJlIHVzZWQ/CgpHcmVhdCBtaXNzaW5n
IHBhcnQhIEkgaGF2ZSBtYWRlIGEgc3RhdGljIGFuYWx5emF0aW9uIHJpZ2h0IHVwb24gcmVjZWl2
aW5nIHRoaXMgbWFpbC4KVGhlIHJlc3VsdCBzaG93cyB0aGF0IHRoaXMgbmV3bHkgcHVycG9zZWQg
aWRlYSByZWFjaGVzIGFib3V0IHRoZSBzYW1lCnN1Y2Nlc3MgcmF0ZSBvbiBteSB0ZXN0IHNldCAo
cnY2NCBkZWZjb25mIHdpdGggUlZJIG9ubHkpIHdoaWxlIHdoZW4gY29tYmluZWQsCnRoZXkgY2Fu
IHJlYWNoIGEgaGlnaGVyIHN1Y2Nlc3MgcmF0ZSwgMS8zIGFib3ZlIHRoZWlyIGJhc2VsaW5lLiBB
IHBhdGNoIHRoYXQKaW5jbHVkZXMgdGhpcyBzdHJhdGVneSB3aWxsIGJlIHNlbnQgc29vbi4KPiAK
Pj4gK3N0YXRpYyB2b2lkIGFyY2hfZmluZF9yZWdpc3Rlcih1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIGVuZCwKPiAKPiBOaXQ7IFdoZW4gSSBzZWUgImFyY2hfIiBJIHRoaW5rIGl0
J3MgZnVuY3Rpb25hbGl0eSB0aGF0IGNhbiBiZQo+IG92ZXJyaWRkZW4gcGVyLWFyY2guIFRoaXMg
aXMgbm90IHRoZSBjYXNlLCBidXQganVzdCBhIGhlbHBlciBmb3IgUlYuCgpJdCBjYW4gYmUgZXhw
bGFpbmVkIGZyb20gdHdvIGFzcGVjdHMuIEZpcnN0LCBpdCBjYW4gYmUgZXh0ZW5kZWQgdG8gbW9z
dCBSSVNDCmFyY2hzLCB3aGljaCBjYW4gYmUgZXh0cmFjdGVkIGludG8gdGhlIGNvbW1vbiBmbG93
IG9mIEtwcm9iZS4gU2Vjb25kLCBpdCBpcyBpbmRlZWQKYSBpbnRlcm5hbCBoZWxwZXIgZm9yIG5v
dywgc28gSSB3aWxsIGNvcnJlY3QgdGhlIG5hbWUgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4+IHN0
YXRpYyB2b2lkIGZpbmRfZnJlZV9yZWdpc3RlcnMoc3RydWN0IGtwcm9iZSAqa3AsIHN0cnVjdCBv
cHRpbWl6ZWRfa3Byb2JlICpvcCwKPj4gLQkJCQlpbnQgKnJkMSwgaW50ICpyZDIpCj4+ICsJCQkJ
aW50ICpyZCwgaW50ICpyYSkKPiAKPiBOaXQ7IFBsZWFzZSBnZXQgcmlkIG9mIHRoaXMgY29kZSBj
aHVybiwganVzdCBuYW1lIHRoZSBwYXJhbWV0ZXJzCj4gY29ycmVjdGx5IG9uIGludHJvZHVjdGlv
biBpbiB0aGUgcHJldmlvdXMgcGF0Y2guCgpXaWxsIGJlIGZpeGVkLgoKPj4gKwkqcmQgPSAoKGt3
IHwgb3cpID09IDFVTCkgPyAwIDogX19idWlsdGluX2N0emwoKGt3IHwgb3cpICYgfjFVTCk7Cj4+
ICsJKnJhID0gKGt3ID09IDFVTCkgPyAwIDogX19idWlsdGluX2N0emwoa3cgJiB+MVVMKTsKPiAK
PiBIbW0sIF9fYnVpbHRpbl9jdHpsIGlzIHVuZGVmaW5lZCBmb3IgMCwgcmlnaHQ/IENhbiB0aGF0
IGJlIHRyaWdnZXJlZAo+IGhlcmU/CgpXaWxsIGJlIGZpeGVkLgoKUmVnYXJkcywKR3Vva2FpIENo
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
