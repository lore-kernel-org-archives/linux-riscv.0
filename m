Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4070FC0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDmLF0S4ezinJZev4TH4bPtQmun3jxcuu3w4rQSaGnY=; b=QIDkL93vzJiHmI
	1dZkCACOn1UpntPBAF9c/7um328HJMbhZNxtC/hMmG4C1hGeNAuQmBaK9doCPRp3CFZ1BjbfR05wi
	vQwwqsk8T7anrK8tuEibCaZWvHVIh29IyUOI/esid6cFNvd1LH7AeXVN6zIjXRNs5xIy9QJCpce8m
	51lmv/7nJnKdSOXtuozi2CA10H0nhVIAggSWjxyjOa4tQA2W4ASfX71oHPynUiuxBraqzx/9bnQTo
	BvBo0I3GKwy/V38My8ul8ujiAKiiVqmouYckmtpZR7AcGhavpseZEGRshC5pygp0gnmSLQvmRroge
	n6Y3hiuZfz1gmXzV+lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdB7P-00000007P6a-42YV;
	Wed, 29 Jan 2025 16:40:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdB7F-00000007P4j-02AD
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 16:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62E1EA4157E;
	Wed, 29 Jan 2025 16:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B609EC4CED1;
	Wed, 29 Jan 2025 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738168835;
	bh=fQHwilHCkmzvP+LtfBPpLrp6GzI+AORKtJJ51bDVNC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVd5HPtBR130PvxqyvqF0UjsAU3QxxJTZWvYXs1z5NBnDH7UHaaFEcb42m6uSEnvY
	 oJPyks39sAxUcXiP1vCaTREnDQpPUch1ocZt3XAL6/PHW+p/t3fCcgJqRp1Wnabzbv
	 xUJRNtRxU9iboPtZgBlqtz5795aI2MQEkF0tJhBazq/GjUqP+s+04kG/yu7BNiYBWc
	 5CSG16CQJHx6SR/04OrQYZje0Ytqy4EWfX8YE8k7YqGd25xE/sNu66H/3w35Np6YF3
	 8bgHGEs+XKXi4Yj2y0DqS9iCVahEJ5olgo+ZNvM3l5IGsUXy6MxWvUkkt+szUaGTwn
	 S4eqcDU49uSpg==
Date: Wed, 29 Jan 2025 10:40:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Message-ID: <173816883375.2207117.18376328133127394018.robh@kernel.org>
References: <87ed0o87qg.ffs@tglx>
 <20250129091637.1667279-1-vladimir.kondratiev@mobileye.com>
 <20250129091637.1667279-2-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129091637.1667279-2-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_084037_110226_B947A310 
X-CRM114-Status: GOOD (  17.21  )
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

Ck9uIFdlZCwgMjkgSmFuIDIwMjUgMTE6MTY6MzYgKzAyMDAsIFZsYWRpbWlyIEtvbmRyYXRpZXYg
d3JvdGU6Cj4gRG9jdW1lbnQgb3B0aW9uYWwgcHJvcGVydHkgInJpc2N2LGhhcnQtaW5kZXhlcyIK
PiAKPiBSaXNjLVYgQVBMSUMgc3BlY2lmaWNhdGlvbiBkZWZpbmVzICJoYXJ0IGluZGV4IiBpbiBb
MV06Cj4gCj4gV2l0aGluIGEgZ2l2ZW4gaW50ZXJydXB0IGRvbWFpbiwgZWFjaCBvZiB0aGUgZG9t
YWlu4oCZcyBoYXJ0cyBoYXMgYQo+IHVuaXF1ZSBpbmRleCBudW1iZXIgaW4gdGhlIHJhbmdlIDAg
dG8gMl4xNCDiiJIgMSAoPSAxNiwzODMpLiBUaGUgaW5kZXgKPiBudW1iZXIgYSBkb21haW4gYXNz
b2NpYXRlcyB3aXRoIGEgaGFydCBtYXkgb3IgbWF5IG5vdCBoYXZlIGFueQo+IHJlbGF0aW9uc2hp
cCB0byB0aGUgdW5pcXVlIGhhcnQgaWRlbnRpZmllciAo4oCcaGFydCBJROKAnSkgdGhhdCB0aGUK
PiBSSVNDLVYgUHJpdmlsZWdlZCBBcmNoaXRlY3R1cmUgYXNzaWducyB0byB0aGUgaGFydC4gVHdv
IGRpZmZlcmVudAo+IGludGVycnVwdCBkb21haW5zIG1heSBlbXBsb3kgZW50aXJlbHkgZGlmZmVy
ZW50IGluZGV4IG51bWJlcnMgZm9yCj4gdGhlIHNhbWUgc2V0IG9mIGhhcnRzLgo+IAo+IEZ1cnRo
ZXIsIHRoaXMgZG9jdW1lbnQgc2F5cyBpbiAiNC41IE1lbW9yeS1tYXBwZWQgY29udHJvbAo+IHJl
Z2lvbiBmb3IgYW4gaW50ZXJydXB0IGRvbWFpbiI6Cj4gCj4gVGhlIGFycmF5IG9mIElEQyBzdHJ1
Y3R1cmVzIG1heSBpbmNsdWRlIHNvbWUgZm9yIHBvdGVudGlhbCBoYXJ0IGluZGV4Cj4gbnVtYmVy
cyB0aGF0IGFyZSBub3QgYWN0dWFsIGhhcnQgaW5kZXggbnVtYmVycyBpbiB0aGUgZG9tYWluLiBG
b3IKPiBleGFtcGxlLCB0aGUgZmlyc3QgSURDIHN0cnVjdHVyZSBpcyBhbHdheXMgZm9yIGhhcnQg
aW5kZXggMCwgYnV0IDAgaXMKPiBub3QgbmVjZXNzYXJpbHkgYSB2YWxpZCBpbmRleCBudW1iZXIg
Zm9yIGFueSBoYXJ0IGluIHRoZSBkb21haW4uCj4gCj4gU3VwcG9ydCBhcmJpdHJhcnkgaGFydCBp
bmRleGVzIHNwZWNpZmllZCBpbiBvcHRpb25hbCBBUExJQyBwcm9wZXJ0eQo+ICJyaXNjdixoYXJ0
LWluZGV4ZXMiIHRoYXQgc2hvdWxkIGJlIGFycmF5IG9mIHUzMiBlbGVtZW50cywgb25lIHBlcgo+
IGludGVycnVwdCB0YXJnZXQuIElmIHRoaXMgcHJvcGVydHkgbm90IHNwZWNpZmllZCwgZmFsbGJh
Y2sgaXMgdG8gdXNlCj4gbG9naWNhbCBoYXJ0IGluZGV4ZXMgd2l0aGluIHRoZSBkb21haW4uCj4g
Cj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gLS0t
Cj4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sICAg
ICAgICB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAoK
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
