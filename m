Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD8C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWBenOtAsyI95F0s7AMTK99tOZfMLeVjPtgQ/qiCjVE=; b=YuTjLplwPUJPn2
	Xbh/bUKFJiT1C3M6qQBZ1GDsVjcbsCGlDH1EO0N52qSFCDBtvtqVg6EgF8iDN+SABzbieebefWj0Q
	WE/+wYDUzuvdQX/56WugCBtJeTHKnsf2U7O9XOToUctvFNOVwDc2XNAJ/ulZX50EwWm/sgqJqGypU
	GjDkSS45nasw/e1ozCSr61I/bB8RRmpQgp2GcDO0BwDcaBq1xxbPImIFDz/MysI7cfm1sMVA9uB20
	d4uIHG22jvRDESW8JUYdrwr2H8E3VryzbitjSa3c1Vg/RMwGI5IcJqQ0TZD9GTce+CX4BsRdVDiMp
	y15byoSVWESj6t4rq0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Uld-00000007BXi-0g7Q;
	Wed, 09 Apr 2025 12:42:57 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Tp0-00000007221-3dqA;
	Wed, 09 Apr 2025 11:42:25 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113bd567b;
	Wed, 9 Apr 2025 19:42:11 +0800 (GMT+08:00)
Message-ID: <28abc527-5e73-418f-a242-e4a2ebf0d94a@whut.edu.cn>
Date: Wed, 9 Apr 2025 19:42:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Pan Junzhong <junzhong.pan@spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
 <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUwdVkwfShhJSR8fSRhIH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hJTEJLVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a961a5b942c03a1kunm113bd567b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6KDo4LzJMHjwOMB1MTh46
	KgIKCj9VSlVKTE9PSkJDQkhDT09NVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhKSEw3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_044223_109640_FF93B611 
X-CRM114-Status: UNSURE (   8.20  )
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

T24gNC85LzI1IDc6MzggUE0sIFBhbiBKdW56aG9uZyB3cm90ZToKPiBIaSBaZSwKPgo+PiArc3Rh
dGljIGludCBzcGFjZW1pdF9jb21icGh5X2luaXRfdXNiKHN0cnVjdCBzcGFjZW1pdF9jb21icGh5
X3ByaXYgKnByaXYpCj4gVGhlIFVTQjMgcGh5IGRyaXZlciBpcyB1cGRhdGVkIGluIHRoZSB2ZW5k
b3IncyB0cmVlLgo+IGh0dHBzOi8vZ2l0ZWUuY29tL2JpYW5idS1saW51eC9saW51eC02LjYvY29t
bWl0LzFjMGIzYjRiOWM3N2QyMmNhODg2YzhhNGM0NGU2MmI1ODkxZjhhYmMKPgo+IFlvdSBjYW4g
c3VibWl0IHYyIHRvZ2V0aGVyIHdpdGggdGhlIGNoYW5nZSBvZiBsZnBzX3RocmVzICh3cml0ZXMg
MHg1OCByZWdpc3RlcikKPiB3aXRob3V0IGFkZGluZyBuZXcgcHJvcGVydGllcyBmb3IgZHQgbm9k
ZS4KCk9LLCB0aGFua3MhCgo+IEIuUi4KPgo+Cj4gVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNo
bWVudCBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2Ug
cHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVj
aXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1l
bnQgZnJvbSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkg
cmVwbHkgZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHks
IGRpc2Nsb3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUg
Z3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRl
cmNlcHRlZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2Ug
ZnVsbCByZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuCj4gICAKPiDmnKzpgq7k
u7blj4rlhbbku7vkvZXpmYTku7blhbfmnInkv53lr4bmgKfotKjvvIzlubblj6/og73lj5flhbbk
u5bkv53miqTmiJbkuI3lhYHorrjooqvmiqvpnLLnu5nnrKzkuInmlrnjgILlpoLpmIHkuIvor6/m
lLbliLDmnKzpgq7ku7bvvIzmlazor7fnq4vljbPku6Xlm57lpI3nlLXlrZDpgq7ku7bnmoTmlrnl
vI/pgJrnn6Xlj5Hku7bkurrvvIzlubblsIbmnKzpgq7ku7blj4rlhbbku7vkvZXpmYTku7bku47p
mIHkuIvns7vnu5/kuK3kuojku6XliKDpmaTjgILlpoLpmIHkuIvlubbpnZ7mnKzpgq7ku7blhpnm
mI7kuYvmlLbku7bkurrvvIzmlazor7fliIfli7/kvb/nlKjjgIHlpI3liLbjgIHmiqvpnLLmnKzp
gq7ku7bmiJblhbbku7vkvZXlhoXlrrnvvIzkuqbor7fliIfli7/kvp3mnKzpgq7ku7bmiJblhbbk
u7vkvZXlhoXlrrnogIzph4flj5bku7vkvZXooYzliqjjgILnlLXlrZDpgq7ku7bml6Dms5Xkv53o
r4HmmK/kuIDnp43lronlhajlkozkuI3kvJrlh7rnjrDku7vkvZXlt67plJnnmoTpgJrkv6Hmlrnl
vI/vvIzlj6/og73kvJrooqvmi6bmiKrjgIHkv67mlLnjgIHkuKLlpLHmiJbmjZ/lnY/vvIzmlLbk
u7bkurrpnIDoh6rooYzotJ/otKPlgZrlpb3lronlhajmo4Dmn6XjgIIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
