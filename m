Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE11E85376
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4fA3rG6R1nq/u6BhgMwjbJIvxpWb9npF5KtUr+liBE=; b=ZEzy5GNN/hFMD5
	7y9VdpwoN9dpvEhdkf3ReekAJZzYFJ4mc/87L3tzdNtfq5Mxk6jAfyyQ2kO/wpsB8U70uIfK1miUy
	C0Xyr65lDTinCYraGPXpcuwLJW8s8KHuK1ustiwaqw+T2Qvz7Y1RGV9dhFaNyy0Jag8yeHPRsyju1
	zdaNOugiXlfTigVFKJLdIMKY2CcYRXVWj59v4HHPjSySfnlYG9CxOiOUwDlD110iSkUVArpJE1QKC
	tKLlgsYjVHKpwEnUEwREGH4Rsqv8WWvMZxFK72y6J5cfWtpuGxkzW3YSBHzE4e7WlRoIZ+aD0Asi3
	D6Ws3DeTruTyHyJQmr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8glw-00000002EfK-36Rv;
	Fri, 03 Apr 2026 15:49:24 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gls-00000002EcA-3O8H
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:49:23 +0000
X-QQ-mid: esmtpsz10t1775231306tbc31840b
X-QQ-Originating-IP: owd/ZAH23iPp9F6xVeHnPfmkH8GIX/XfUh5Y8wCvIis=
Received: from [192.168.0.106] ( [58.19.101.85])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Apr 2026 23:48:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 486216961482427586
EX-QQ-RecipientCnt: 7
Message-ID: <16CD0FBE02F047CE+d9f92da1-e06f-4d9c-803d-b6929e9b699d@nucleisys.com>
Date: Fri, 3 Apr 2026 23:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] riscv: Kernel panic in free_initmem when driver triggers
 modprobe
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: palmer <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?5pa55Y2O5ZCv?=
 <hqfang@nucleisys.com>
References: <3D34B48DF08573FE+e70f68e9-59f7-4b41-bcce-3c58d4cea05b@nucleisys.com>
 <819bb897-3bce-4c8e-81f0-1f36956cdf2e@iscas.ac.cn>
From: guibing <guibing@nucleisys.com>
In-Reply-To: <819bb897-3bce-4c8e-81f0-1f36956cdf2e@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:nucleisys.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N5B2KL7CljI0Ls81/t/sUI9aRAWHPSyg/nuaWbbRvRbMgf9i0ecm59Bk
	ypkb9iI/fzER1IWTEh3qzNwpoxZF81wy9hbpkqjVPr/yoWgzIF6MgjlVT/hviDZZAvcqyHq
	AmQkUf2YsW4XiD496HYsTDbY0nstTbujoA5kDMN3MHNiV6uWIsiEOUS3KA8nxLHGBAleKt5
	BFg6kkIhwqimpb5kFtjripRa6cJSS9Gj4YQEMcUYTMP+9Rz2WswDzM18J4++aILJdmhTjAR
	uMw0aw15RNMM2z1tcZ5DpQnnBPYwOlcMGl3jTgNWPDaaav9V4u+IICsl6k7LCf0SQ7iiAck
	kT71RTZj0K3TbG7g5ImiXcA5ycyHYwXwIFTO6L4O4f++2w3n982JCJteQjHPzJpL0+O2Glk
	mea/dw5jqARd/UmewB8l2q5up+4N+ksWvHDr0JnVa9qLM2WG13Xpf39hjUxY/IZganyhjwZ
	3jJCsX35c5vXBFceW9UfRpkOgZU9u4GZ6hEcFj1jcfP3WbORNtcpkCvTrVvUpr4N/TbCDz4
	fj7//Sc6W+ntgU2z41fXYPSe4vWm77qFdl0wjS6nMVkViQz5/pCpgld4ladoFOoL+7QXVKn
	dVLch8Ml1yX1Kqc9+4FOdC4N4+/WHD1H4JfkYXBVkejEeSvke0dp1ZUHHBNfybuxJ0X65p7
	VXO9sPtYrXVkwdrJcd1xYL7pDHlYKwOF1BWQvscyx9IUmdNxzWBJIzFHdft7ev7DIxd35Qr
	zmMbOMRTMyDodWWmh7FlVbeXOzbdD3FULFZOwls5AO7s4kGYitUJ/ALjXSIVInpkK03Jepy
	ojizVvdOmb+jYFyDiS4Si6Cr1zRDEGBe4eTC/hmGHeNc8LAgf03/H3/exE5U478YL3YgxX/
	e304qq5zvGB0xfop4s9gNMo775jqghfBBAsfEEQe6MtUcjMHJFQPT9gxorwKyFTYwuOmHKx
	C0NPWnW86/QINEtbX68LKR4VW+xV7QEkHwCHAbXvwtzyWcZqCHqiBpbNzaFGYeTwnbl2ZXC
	eh1GYXPi1sRucJBF+3xdd181fUsRY=
X-QQ-XMRINFO: NS+P29fieYNwWhG5A17Q5+5AEf2AXH/Rog==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_084921_658826_627D193E 
X-CRM114-Status: UNSURE (   7.96  )
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

SGkgVml2aWFu77yMCgp0aGFuayB5b3UgZm9yIHlvdXIgcmVwbHnvvIx0aGUgYmVzdF9tYXBfc2l6
ZSBmdW5jdGlvbiBwYXRjaCBjYW4gc29sdmUgdGhlIApwYW5pY+OAggpJIGNoZWNrIGl0IGFnYWlu
IG9uIHY2LjYuOTAgcnYzMiBxZW11IHZpcnQgcGxhdGZvcm0sIHRoZXJlIGlzIG5vIApwcm9ibGVt
LiBUaGUgcHJvYmxlbSBtYXkgY29tZSBmcm9tIG15IGdkYiB2YTJwYSBzY3JpcHQgd2hpY2ggZGly
ZWN0bHkgCnJlYWQgcGh5c2ljYWwgbWVtb3J5IGFkZHJlc3Mgb24gRlBHQSwgaSdtIG5vdCBzdXJl
ICJ4IC94IHBoeV9hZGRyIiBjYW4gCndvcmsgd2VsbCwgSSB3aWxsIGNoZWNrIGl0IGxhdGVyLgoK
dnAxOjc3MAp2cDA6MAp2aXJ0dWFsIGFkZHI6YzA4MDAwMDAKc2F0cDo4MDA4MWM5NApMMSBwYWdl
IGJhc2UgOjgxYzk0MDAwCkwxIHB0ZTozMDBjMDQwMQpMMiBwYWdlIGJhc2UgOmMwMzAxMDAwCkwy
IHB0ZTo4NTk1YmRlOSAtLT5oZXJlIGlzIGVycm9yCnBoeSBhZGRyOmZmZmZmZmZlMTY1NmYwMDAK
ClRoYW5rcy4KCuWcqCAyMDI2LzQvMyAxOjQ1LCBWaXZpYW4gV2FuZyDlhpnpgZM6Cj4gICBzdGF0
aWMgdWludHB0cl90IF9faW5pdCBiZXN0X21hcF9zaXplKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNf
YWRkcl90IHNpemUpCj4gICB7Cj4gKwkvKgo+ICsJICogT24gMzItYml0LCBhdm9pZCBQR0QgKGku
ZS4gUE1EKSBzaXplZCBtYXBwaW5ncywgc2luY2Ugd2UgYXJlIG5vdAo+ICsJICogZ29pbmcgdG8g
cHJvcGFnYXRlIFBHRCBsZXZlbCBjaGFuZ2VzLgo+ICsJICovCj4gKwlpZiAoIUlTX0VOQUJMRUQo
Q09ORklHXzY0QklUKSkKPiArCQlyZXR1cm4gUEFHRV9TSVpFOwo+ICsKPiAgIAkvKiBVcGdyYWRl
IHRvIFBNRF9TSVpFIG1hcHBpbmdzIHdoZW5ldmVyIHBvc3NpYmxlICovCj4gICAJaWYgKChiYXNl
ICYgKFBNRF9TSVpFIC0gMSkpIHx8IChzaXplICYgKFBNRF9TSVpFIC0gMSkpKQo+ICAgCQlyZXR1
cm4gUEFHRV9TSVpFOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
