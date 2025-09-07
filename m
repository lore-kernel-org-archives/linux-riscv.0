Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD9CA1017
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Sep 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zC8PmnNjPLVWRA/QWiSql+wGsraYSH5IoGW1F+FKAUk=; b=o9AJGAkz69TARH
	sr5DOG3JP5yMDri1GjsjihpId+XezI7/qesioVYbhPEeG2D+2kQna6Ol1iguAKgF3+sgNSHGK8HLI
	mZ+uAzwnvRfjlOytWponnrz9yurzxvlhx/3IlK221mMXR69oSYrI++JYvi7nucxizFQqvBajIDTA0
	Rq8HlEBgamT79qylCFDEa7aLl1D29vxdVecdWhdvnjASfJgv8KrPCthGvAelScTMrwzysJdGTMNDn
	5rf6myQtM7U0oDZJ26YbS0wZ007PA9q4CkeKfSGls5YXqJ6THyHRdyYEeI+pLnHpepXzqfmNM7aEG
	QebU3ZnLWg7VANtumEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvAg7-0000000AB7m-3zwI;
	Sun, 07 Sep 2025 08:23:15 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvAg3-0000000AB5u-2ocv
	for linux-riscv@lists.infradead.org;
	Sun, 07 Sep 2025 08:23:14 +0000
Received: from [192.168.0.109] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowABX+hPUQL1oMWdTAQ--.2947S2;
	Sun, 07 Sep 2025 16:22:44 +0800 (CST)
Message-ID: <fbcc1ec3-7ff6-4891-97e3-9763355326f7@iscas.ac.cn>
Date: Sun, 7 Sep 2025 16:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <uwu@dram.page>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
 <20250905153500.GH553991@horms.kernel.org>
 <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
 <20250905160158.GI553991@horms.kernel.org>
 <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
 <20250905165908.69548ce0@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250905165908.69548ce0@kernel.org>
X-CM-TRANSID: zQCowABX+hPUQL1oMWdTAQ--.2947S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw47JryDGw4rtry5Kw4rKrg_yoW8Gr4rpF
	WrKFs2kFWvqw4xt3yvv3ykX343t3ZxZ3y5Gryqga47ta45Zryfu3yxKrWIyasrGrWkZ3y0
	vry5JFyjkFZ8JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYsSdPUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_012312_065898_45FD29DC 
X-CRM114-Status: UNSURE (   7.76  )
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

T24gOS82LzI1IDA3OjU5LCBKYWt1YiBLaWNpbnNraSB3cm90ZToKCj4gT24gU2F0LCA2IFNlcCAy
MDI1IDAwOjM1OjM3ICswODAwIFZpdmlhbiBXYW5nIHdyb3RlOgo+Pj4+IE9uIGEgY2xvc2VyIGxv
b2ssIHRoZXNlIGNvdW50ZXJzIGluIG5kZXYtPnN0YXRzIHNlZW1zIHRvIGJlIHJlZHVuZGFudAo+
Pj4+IHdpdGggdGhlIGhhcmR3YXJlLXRyYWNrZWQgc3RhdGlzdGljcywgc28gbWF5YmUgSSBzaG91
bGQganVzdCBub3QgYm90aGVyCj4+Pj4gd2l0aCB1cGRhdGluZyBuZGV2LT5zdGF0cy4gRG9lcyB0
aGF0IG1ha2Ugc2Vuc2U/ICAKPj4+IEZvciByeC90eCBwYWNrZXRzL2J5dGVzIEkgdGhpbmsgdGhh
dCBtYWtlcyBzZW5zZS4KPj4+IEJ1dCB3aGF0IGFib3V0IHJ4L3R4IGRyb3BzPyAgCj4+IFJpZ2h0
Li4uIGJ1dCB0c3RhdHMgZG9lc24ndCBoYXZlICpfZHJvcHBlZC4gSXQgc2VlbXMgdGhhdCB0eF9k
cm9wcGVkIGFuZAo+PiByeF9kcm9wcGVkIGFyZSBjb25zaWRlcmVkICJzbG93IHBhdGgiIGZvciBy
ZWFsIGRldmljZXMuIEl0IG1ha2VzIHNlbnNlCj4+IHRvIG1lIHRoYXQgdGhvc2Ugc2hvdWxkIGJl
IHZlcnkgcmFyZS4KPiBQcmV0dHkgc3VyZSBTaW1vbiBtZWFudCB0aGUgcGVyLWNwdSBuZXRkZXYg
c3RhdHMgaW4gZ2VuZXJhbC4KPiBUaGVyZSBhcmUgdGhyZWUgdHlwZXMgb2YgdGhlbSwgaWYgeW91
IG5lZWQgZHJvcHMgSSB0aGluayB5b3UKPiBwcm9iYWJseSB3YW50IGRzdGF0cy4gVGFrZSBhIGxv
b2suCgpBY2NvcmRpbmcgdG8gdGhpcyBjb21tZW50IGluIG5ldC9jb3JlL2Rldi5jIGRldl9nZXRf
c3RhdHMoKToKCsKgIMKgIC8qCsKgIMKgIMKgKiBJUHZ7NCw2fSBhbmQgdWRwIHR1bm5lbHMgc2hh
cmUgY29tbW9uIHN0YXQgaGVscGVycyBhbmQgdXNlCsKgIMKgIMKgKiBkaWZmZXJlbnQgc3RhdCB0
eXBlIChORVRERVZfUENQVV9TVEFUX1RTVEFUUyB2cwrCoCDCoCDCoCogTkVUREVWX1BDUFVfU1RB
VF9EU1RBVFMpLiBFbnN1cmUgdGhlIGFjY291bnRpbmcgaXMgY29uc2lzdGVudC4KwqAgwqAgwqAq
LwoKImRzdGF0cyIgaXMgbWVhbnQgZm9yIHR1bm5lbHMuIFRoaXMgZG9lc24ndCBsb29rIGxpa2Ug
dGhlIHJpZ2h0IHRoaW5nIHRvCnVzZSwgYW5kIG5vIG90aGVyIHBjcHVfc3RhdF90eXBlIGdpdmVz
IG1lIHR4X2Ryb3BwZWQuIERvIHlvdSB0aGluayBJCnNob3VsZCB1c2UgZHN0YXRzIGFueXdheT8K
CihBbmQgeWVzIHRoZSBvbmx5IHNvZnR3YXJlLXRyYWNrZWQgb25lIHNob3VsZCBiZSB0eF9kcm9w
cGVkLiBTaW5jZSB3ZQpwcmUtYWxsb2NhdGUgdGhlIFJYIGJ1ZmZlcnMsIHRoZXJlIGlzIG5vIG9w
cG9ydHVuaXR5IHRvIGRyb3Agb24gUlggaW4Kc29mdHdhcmUuKQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
