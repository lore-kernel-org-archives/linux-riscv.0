Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1BACAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 18:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTF14jBiQw9QM7HpwUapN+E3VuZytqyKC6VGsiJBimw=; b=vnh/PCs8X57JVg
	IHAD9ogeLSNRQ/PvP4N3B4e6a5lDBGdr+c3XVIU37vOO8JAaZnLefAZhh5qE7OCmLNDh0LfTXS9LN
	tNoJ5e/+iK7mibAVxZTYWjmao+sm7qEPD31fXVcxeT1Oz5re49Ji8Z+RgnMk3gkDqIZswMX0seZL/
	WG+LGeXYys8lEwyg5VrUnFDnjFvGrWLbHM7ZYiO0tEpAapqLe7/NqhAHh1/MP0Bawf2ZFMz3QmuR7
	ceviH2ks6M3XsY3u6dTODB9N4iP9KOvVlaOJoW8SyejFxX3Tvu3NQ4IbA1xxiCRmzDyIhsfp16aOA
	1H8CoSGcwPRYtEmGiXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0PAX-0000000836U-2eIq;
	Sun, 21 Sep 2025 18:52:17 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0PAU-00000008362-1fsK
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 18:52:16 +0000
Received: from [192.168.0.106] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowAA3kaM3SdBo3kkjBA--.9911S2;
	Mon, 22 Sep 2025 02:51:35 +0800 (CST)
Message-ID: <411ade91-3fb5-40a3-baca-e6b03c5783ae@iscas.ac.cn>
Date: Mon, 22 Sep 2025 02:51:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-3-elder@riscstar.com>
 <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
 <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
X-CM-TRANSID: qwCowAA3kaM3SdBo3kkjBA--.9911S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWxZFW5Kr4xKry8CFy7GFg_yoW8WFyUpF
	95WFWYkFW5tFn3Xr17tF1UWa45Aw1rKa4DAFy8Xas0yr45uw1vgFW5XrWv93srJr4kJF1U
	Jw1UXr47Z3sxJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jfb18UUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_115214_815402_7BB083FE 
X-CRM114-Status: GOOD (  14.46  )
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

Ck9uIDkvMjAvMjUgMjM6NTksIEFsZXggRWxkZXIgd3JvdGU6Cj4gT24gOS8xOS8yNSAxMDo1MiBQ
TSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4+Cj4+IFsuLi5dCj4+Cj4+ICtzdGF0aWMgdm9pZCBrMV9z
cGlfcmVhZF93b3JkKHN0cnVjdCBrMV9zcGlfZHJpdmVyX2RhdGEgKmRydl9kYXRhKQo+PiArewo+
PiArwqDCoMKgIHN0cnVjdCBrMV9zcGlfaW8gKnJ4ID0gJmRydl9kYXRhLT5yeDsKPj4gK8KgwqDC
oCB1MzIgYnl0ZXMgPSBkcnZfZGF0YS0+Ynl0ZXM7Cj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4gKwo+
PiArwqDCoMKgIHZhbCA9IHJlYWRsKGRydl9kYXRhLT5iYXNlICsgU1NQX0RBVEFSKTsKPj4gK8Kg
wqDCoCByeC0+cmVzaWQgLT0gYnl0ZXM7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIXJ4LT5idWYpCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm47wqDCoMKgIC8qIE51bGwgcmVhZGVyOiBkaXNjYXJkIHRo
ZSBkYXRhICovCj4+ICsKPj4gK8KgwqDCoCBpZiAoYnl0ZXMgPT0gMSkKPj4gK8KgwqDCoMKgwqDC
oMKgICoodTggKilyeC0+YnVmID0gdmFsOwo+PiArwqDCoMKgIGVsc2UgaWYgKGJ5dGVzID09IDEp
Cj4+Cj4+IFR5cG8/IGVsc2UgaWYgKGJ5dGVzID09IDIpCj4KPiBXb3cuwqAgWWVzIHRoYXQgaXMg
YW4gZXJyb3IgdGhhdCBJJ2xsIGNvcnJlY3QuCj4KPj4+ICvCoMKgwqDCoMKgwqDCoCAqKHUxNiAq
KXJ4LT5idWYgPSB2YWw7Cj4+PiArwqDCoMKgIGVsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCAqKHUz
MiAqKXJ4LT5idWYgPSB2YWw7Cj4+Cj4+IE1heWJlCj4+Cj4+IMKgwqDCoMKgZWxzZSBpZiAoYnl0
ZXMgPT0gNCkKPj4gwqDCoMKgwqDCoMKgwqAgKih1MzIgKilyeC0+YnVmID0gdmFsOwo+PiDCoMKg
wqDCoGVsc2UKPj4gwqDCoMKgwqDCoMKgwqAgV0FSTl9PTl9PTkNFKDEpOwo+Cj4gVGhlIHZhbHVl
IG9mIGJ5dGVzIHdpbGwgYmUgMSwgMiwgb3IgNCwgd2hpY2ggd2UgY2FuIHRlbGwKPiBieSBpbnNw
ZWN0aW9uLsKgIEF0IG9uZSB0aW1lIEkgaGFkIGEgc3dpdGNoIHN0YXRlbWVudCB3aXRoCj4gYSBk
ZWZhdWx0LCBidXQgSSBkZWNpZGVkIHRvIGxlYXZlIG91dCB0aGUgZGVmYXVsdCwgd2hpY2gKPiB3
b24ndCBoYXBwZW4uCj4KPj4gSnVzdCB0byBtYWtlIHRoZSBwYXR0ZXJuIGNvbnNpc3RlbnQ/IFNh
bWUgZm9yIGsxX3NwaV93cml0ZV93b3JkLgo+Cj4gQ29uc2lzdGVudCB3aXRoIHdoYXQ/wqAKPgpJ
IHdhcyBqdXN0IHRoaW5raW5nIGl0IHdvdWxkIGJlIGNsZWFyZXIgaWYgdGhlIGNvZGUgc3RhdGVz
IGNsZWFybHk6CgogICAgMSAtPiB1OAogICAgMiAtPiB1MTYKICAgIDQgLT4gdTMyCiAgICBhbnl0
aGluZyBlbHNlIC0+IHNob3VsZG4ndCBoYXBwZW4KCkFzIGlzLCBpdCB3YXNuJ3Qgb2J2aW91cyB0
byBtZSB0aGF0IHdlJ3JlIGp1c3QgaGFuZGxpbmcgNCBhcyB1MzIuIE1heWJlCndlJ3JlIGp1c3Qg
Y2FwcGluZyBpdCBhdCB1MzIsIGFuZCA4IGlzIGFsc28gaGFuZGxlZC4KCldlbGwsIG1heWJlIEkn
bSBqdXN0IG5vdCBmYW1pbGlhciB3aXRoIFNQSSBzdHVmZiwgYW5kIHdvcmQgc2l6ZSBhYm92ZSA0
CmRvZXNuJ3QgbWFrZSBzZW5zZSBhbnl3YXkuCgpJdCBjb3VsZCBhbHNvIGJlIGEgY29tbWVudAoK
ICAgIGVsc2UgLyogNCAqLwoKSnVzdCBhIHN1Z2dlc3Rpb24sIG5vIHN0cm9uZyBwcmVmZXJlbmNl
IGZyb20gbWUuCgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
