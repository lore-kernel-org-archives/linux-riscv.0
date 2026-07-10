Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997DAC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 09:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CR8hyIurcQzSys01bceTetANXR43PuXh/3BbQbS9hec=; b=yvznUifNAjwwj5
	4y0HxwNM/itpZTSHvrHTjVGz8QP/U5y+F9+L+00Hw2oTreTBd5nR65+uYVCU8GNi/3jPF0LWjex3r
	uNI9eEhracAyAbsVH4ehOBDDyoCD7d6GzyH/v6r3lgoem9P4osocmaLovDZbaeRjF+53JBxPwFjnU
	vFrLr078hghIfF5EP/LAPXtO/gyZ5AEp+HXyEu26X91VCn9ODRtiaml4QLFKrZbJnF0SM4C3fuGny
	I5vdYyDoGJhkbb0XQ/EWxVJ+X/Ao3Z64y6FMqEWwynPfxzuF0XytXv/7azoFNJM4eEIqHofB7AtFt
	hL4Hm9RB8+36+HxzBTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Nk-00000004YDV-1T3V;
	Fri, 10 Jul 2026 09:18:52 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Nh-00000004YD0-0gII
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 09:18:51 +0000
X-UUID: 59324fb67c4011f1aa26b74ffac11d73-20260710
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:145b6373-83f6-4a8e-b0c1-ee32eda38774,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:cd795b6054e965ba326532fc26a42d67,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 59324fb67c4011f1aa26b74ffac11d73-20260710
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1856676913; Fri, 10 Jul 2026 17:18:44 +0800
Message-ID: <e453a825-4d73-4d35-a699-a495b0ca1058@kylinos.cn>
Date: Fri, 10 Jul 2026 17:18:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
 <DJUQ3TZHM7OO.34ULEC76Z2BDY@linux.spacemit.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <DJUQ3TZHM7OO.34ULEC76Z2BDY@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_021849_508942_6E53FB0D 
X-CRM114-Status: GOOD (  11.43  )
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

CgrlnKggMjAyNi83LzEwIDE1OjQ2LCBUcm95IE1pdGNoZWxsIOWGmemBkzoKPiBPbiBGcmkgSnVs
IDEwLCAyMDI2IGF0IDEyOjIxIEFNIFBEVCwgUGVpIFhpYW8gd3JvdGU6Cj4+IFdoZW4gdGhlIGlu
dGVycnVwdCBzdGF0dXMgcmVnaXN0ZXIgcmVhZHMgemVybywgdGhlIGhhbmRsZXIgc2hvdWxkCj4+
IHJldHVybiBJUlFfTk9ORSBpbnN0ZWFkIG9mIElSUV9IQU5ETEVELiBXaGF0IHRoZSByZXR1cm4g
dmFsdWUKPj4gYWN0dWFsbHkgZmVlZHMgaW50byBpcyB0aGUgc3B1cmlvdXMgaW50ZXJydXB0IGFj
Y291bnRpbmcgaW4KPj4gbm90ZV9pbnRlcnJ1cHQoKTogZmFsc2VseSBjbGFpbWluZyBJUlFfSEFO
RExFRCBkZWZlYXRzIHRoZSAiaXJxIFhYOgo+PiBub2JvZHkgY2FyZWQiIGRldGVjdGlvbiwgc28g
YSBzdHVjayBpbnRlcnJ1cHQgc291cmNlIHdvdWxkIG5ldmVyIGJlCj4+IGNhdWdodC4KPj4KPj4g
Rml4ZXM6IDVlYTU1ODQ3M2ZhMyAoImkyYzogc3BhY2VtaXQ6IGFkZCBzdXBwb3J0IGZvciBTcGFj
ZW1pVCBLMSBTb0MiKQo+PiBTaWduZWQtb2ZmLWJ5OiBQZWkgWGlhbyA8eGlhb3BlaTAxQGt5bGlu
b3MuY24+Cj4gVGhlIGNvbW1pdCBtZXNzYWdlIG5vdyBkZXNjcmliZXMgdGhlIGFjdHVhbCBtZWNo
YW5pc20gY29ycmVjdGx5LAo+IHRoYW5rcyBmb3IgcmV3b3JraW5nIGl0Ogo+Cj4gUmV2aWV3ZWQt
Ynk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+Cj4g
T25lIHByb2Nlc3Mgbm90ZSwgdGhvdWdoOiBwbGVhc2UgZG9uJ3QgcmVwb3N0IG5ldyB2ZXJzaW9u
cyB0aGlzCj4gcXVpY2tseS4gdjIgZm9sbG93ZWQgdGhlIHJldmlldyBjb21tZW50cyBhbG1vc3Qg
aW1tZWRpYXRlbHksIHdoaWNoCj4gbWVhbnMgb3RoZXIgcmV2aWV3ZXJzIHdobyB3ZXJlIHN0aWxs
IGxvb2tpbmcgYXQgdjEgbmV2ZXIgZ290IGEKPiBjaGFuY2UgdG8gY2hpbWUgaW4gYmVmb3JlIHRo
ZSB0aHJlYWQgbW92ZWQgb24sIGFuZCB0aGUgZGlzY3Vzc2lvbgo+IGdldHMgZnJhZ21lbnRlZCBh
Y3Jvc3MgdmVyc2lvbnMuCkJlY2F1c2UgSSBub3RpY2VkIGEgc2ltcGxlIG1pc3Rha2UgcmlnaHQg
YWZ0ZXIgc2VuZGluZyB2MQrigJRJIGZvcmdvdCB0byBpbmNsdWRlIHRoZSB2ZXJzaW9uIG51bWJl
ciBhbmQgY2hhbmdlbG9nIGZvciB2MuKAlApzbyBJIHRob3VnaHQgdGhhdCBieSBmaXhpbmcgaXQg
d2l0aG91dCB3YWl0aW5nIGZvciByZXZpZXdlcnMgdG8gcG9pbnQgaXQKb3V0LMKgCkkgY291bGQg
c2F2ZSByZXZpZXdlcnMnIHRpbWUgYW5kIGdldCB0aGUgcGF0Y2ggbWVyZ2VkIG1vcmUgcXVpY2ts
eS4KwqBJIG1heSBoYXZlIGJlZW4gd3JvbmcgYWJvdXQgdGhhdC4gU29ycnkuCgpQZWkuCj4gRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgKCJEb24ndCBnZXQKPiBk
aXNjb3VyYWdlZCAtIG9yIGltcGF0aWVudCIpIGFza3Mgc3VibWl0dGVycyB0byB3YWl0IGEgbWlu
aW11bSBvZgo+IG9uZSB3ZWVrIGJlZm9yZSByZXBvc3Rpbmc7IHRoZSBzYW1lIGNvdXJ0ZXN5IGFw
cGxpZXMgdG8gbmV3Cj4gdmVyc2lvbnMgd2hpbGUgcmV2aWV3IGlzIHN0aWxsIG9uZ29pbmcuIENv
bGxlY3RpbmcgYWxsIHRoZSBmZWVkYmFjawo+IG9uIG9uZSB2ZXJzaW9uIGFuZCB0aGVuIHNlbmRp
bmcgYSBzaW5nbGUgcmVzcGluIHNhdmVzIGV2ZXJ5b25lCj4gdGltZS4KPgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLSBUcm95Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
