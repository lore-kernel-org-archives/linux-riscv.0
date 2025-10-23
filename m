Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED3CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 06:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87XDFCe76XPr9+AOy+IBvsk0jaTxeW4yq0ZDnckIASw=; b=nmTLBYT5fvGC9rzyF5NdKig2sd
	rWjvhQiY8eCLvCpZ2h2ESxn1/RUvKWE/3ZeDFL5BR3hrjLq/UJyWMjtS0zXcL9JgL1RfaNAnfwSEV
	Ib17dkNpZb1IfEi/uRQOeIR+u8Tn9H6rosoE9n45Lf12hkwWAokGj5cFoSowvf2sS8+owtOdKBMRu
	LjRalBjD+CDY+j8UY1wC6jV4rs3CIs+NCJdcv7GQhVR6pP75e5De+PNsAnSBYgo1o4Jzn7KgQ1KVe
	YQJp4jvFEK56ZV5AbQhjV2gf3IVDLJ4ZJKEFNl0caPEqkX8P4NWGKnP/1s6UdKGQUb/DO7NZ8H9oL
	a4sEfwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpEH-00000005GTz-3jm3;
	Thu, 23 Oct 2025 06:55:21 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpED-00000005GQ5-3Zfi;
	Thu, 23 Oct 2025 06:55:20 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9NM0floVqQZAA--.54990S3;
	Thu, 23 Oct 2025 14:55:09 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxusBK0flovcYCAQ--.20792S3;
	Thu, 23 Oct 2025 14:55:07 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
Date: Thu, 23 Oct 2025 14:55:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: qMiowJAxusBK0flovcYCAQ--.20792S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF4xZF48Kw18Gw1DJFy8Xrc_yoWfArX_ur
	Wxuwn7Cr4kGFyaya1DKwn8XFsxXw4UCFW5A3yjqryj93sxtrW7Cr48urn7ZF1DGF4kZrZx
	tFWv93y3Cr1v9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI
	0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc9a9UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235518_242970_2ACDF428 
X-CRM114-Status: GOOD (  11.08  )
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

SGkgSm9zaCBhbmQgQXJkLAoKT24gMjAyNS8xMC8yMCDkuIvljYgyOjU1LCBIdWFjYWkgQ2hlbiB3
cm90ZToKPiBPbiBNb24sIE9jdCAyMCwgMjAyNSBhdCA5OjI04oCvQU0gVGllemh1IFlhbmcgPHlh
bmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+Pgo+PiBIaSBKb3NoLCBBcmQgYW5kIEh1YWNh
aSwKPj4KPj4gT24gMjAyNS8xMC8xOCDkuIrljYgxOjA1LCBKb3NoIFBvaW1ib2V1ZiB3cm90ZToK
Pj4KPj4gLi4uCj4+Cj4+PiBCdXQgSUlVQywgdGhlIGxpYnN0dWIgY29kZSBydW5zICp2ZXJ5KiBl
YXJseSwgYW5kIHdvdWxkbid0IHNob3cgdXAgaW4gYQo+Pj4gc3RhY2sgdHJhY2UgYW55d2F5LCBi
ZWNhdXNlIHRoZXJlIGFyZSBubyB0cmFjZXMgb2YgaXQgb24gdGhlIHN0YWNrIG9uY2UKPj4+IGl0
IGJyYW5jaGVzIHRvIGhlYWQuUyBjb2RlICh3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGxpbmsgcmVn
aXN0ZXIpLgo+Pgo+PiBUaGFua3MgZm9yIHlvdXIgZGlzY3Vzc2lvbnMuCj4+Cj4+IEFyZSB5b3Ug
T0sgd2l0aCB0aGlzIGN1cnJlbnQgcGF0Y2g/Cj4gRm9yIG1lIHRoZSBjdXJyZW50IHBhdGNoIGlz
IGp1c3QgT0suCgpXZSBoYXZlIGRpc2N1c3NlZCB0aGlzIGEgZmV3IHRpbWVzIGJ1dCB0aGVyZSBp
cyBhbG1vc3Qgbm8gY29uc2Vuc3VzCm9mIHdoYXQgc2hvdWxkIGhhcHBlbiBuZXh0IGFuZCBub3Ro
aW5nIGNoYW5nZXMuCgpDb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgYSBjbGVhciByZXBseT8gVGhl
biBJIGNhbiBtYWtlIHByb2dyZXNzIGZvcgp0aGUgZm9sbG93aW5nIHNlcmllczoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xvb25nYXJjaC8yMDI1MDkxNzExMjcxNi4yNDQxNS0xLXlhbmd0aWV6
aHVAbG9vbmdzb24uY24vCgpUaGFua3MsClRpZXpodQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
