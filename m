Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E4FF885A
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2Z0aVR/xIB9RD2xZjAN4FhjuH5hRE+MBsnI1Y6a4u4=; b=RHsO8hCYxBGcUR
	D9gsJtCkHy5aAWX6YbZVZHjuTVJlXSqSILramk7JXyxUFFCbq0QtNZpARtrvwcekABghwZ2u1DhXG
	ytn/k1VFxHRgMbTHUoNip4Ih9peK43YB/+3rWxlVoQWhbiwKy7APtEm7/7dJrKQN7znPbtG632xdV
	hu6RpkY90d4YvGp7TPHygwKHNKGnqYEt1sdGsW5TsewHjQQCrRO4ZofwghODB/HGuQFZvnBc7V60N
	qCm4pXWOMz0KqOoz9j2we6x48NiLcB22wzQNUa76+e6//SZ4YwT14Cw3xsjrtubKCg1EsGd7Q+4iX
	Gd5FS/BJaWkYSLa2U1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGVUU-0000000E63J-19Da;
	Sat, 25 Apr 2026 05:23:42 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGVUQ-0000000E62W-04hO
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 05:23:40 +0000
Received: from [192.168.0.113] (unknown [123.118.218.47])
	by APP-05 (Coremail) with SMTP id zQCowADHWQ3PT+xpRbSGDg--.6270S2;
	Sat, 25 Apr 2026 13:23:28 +0800 (CST)
Message-ID: <0e139862-d41b-4b46-92f6-a1eb5bffc863@iscas.ac.cn>
Date: Sat, 25 Apr 2026 13:23:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: Do not probe satp mode limit if known in FDT
To: Guo Ren <guoren@kernel.org>
Cc: alex@ghiti.fr, gaohan@iscas.ac.cn, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org
References: <20260424-riscv-mm-trust-fdt-mmu-type-v1-1-57f3313275d2@iscas.ac.cn>
 <20260425020253.3323599-1-guoren@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260425020253.3323599-1-guoren@kernel.org>
X-CM-TRANSID: zQCowADHWQ3PT+xpRbSGDg--.6270S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4rWry3ur48Kr48WF45Wrg_yoW5XF45pF
	WfXrZ3tFn8tF12yrs7u34kZF15KanYgayUZ34rXryUCws0yF1Fvrsay3Wjqa4aqryfGF1I
	yw4jgFZ8Za45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUUUU=
X-Originating-IP: [123.118.218.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_222338_448832_B07C946F 
X-CRM114-Status: GOOD (  19.76  )
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

T24gNC8yNS8yNiAxMDowMiwgR3VvIFJlbiB3cm90ZToKPj4gU29tZSBzeXN0ZW1zIG1heSBvbmx5
IGhhdmUgbWVtb3J5IGF0IHN1Y2ggYSBoaWdoIGFkZHJlc3MgdGhhdCBhbgo+PiBpZGVudGl0eSBt
YXBwaW5nIGNhbm5vdCBiZSBtYWRlIGluIFN2NDgsIG9yIGV2ZW4gU3Y1Ny4gVG8gYXZvaWQgY3Jh
c2hpbmcKPj4gd2hpbGUgcHJvYmluZyBzYXRwIG1vZGUgc3VwcG9ydCwgdHJ1c3QgdGhlIG1tdS10
eXBlIHByb3BlcnR5IGZyb20gRkRUCj4+IGFuZCBhdm9pZCBwcm9iaW5nIGlmIGl0IGlzIHNldC4K
Pj4KPj4gRm9yIGV4YW1wbGUsIGlmIGEgQ1BVIHN1cHBvcnRzICh1cCB0bykgU3Y1NyBidXQgdGhl
IFNvQyBpdCBpcyBvbiBvbmx5Cj4+IGhhcyBtZW1vcnkgc3RhcnRpbmcgYXQgMTI4IFRpQiwgYW4g
aWRlbnRpdHkgbWFwcGluZyBjYW5ub3QgYmUgbWFkZSBpbgo+PiBTdjQ4LiBJZiB0aGUgdXNlciBz
cGVjaWZpZXMgIm5vNWx2bCIgb24gdGhlIGNvbW1hbmQgbGluZSwKPj4gc2V0X3NhdHBfbW9kZSgp
IHdpbGwgYXR0ZW1wdCB0byB0ZXN0IFN2NDggc3VwcG9ydCBhbmQgY3Jhc2gsIHNpbmNlIHRoZQo+
PiB2aXJ0dWFsIGFkZHJlc3MgaXMgdG9vIGhpZ2guIEluc3RlYWQsIGdpdmVuIHRoZSBjb3JyZWN0
IEZEVCBDUFUgbm9kZQo+PiBwcm9wZXJ0eSBtbXUtdHlwZSA9ICJyaXNjdixzdjU3Iiwgc2V0X3Nh
dHBfbW9kZSgpIGNhbiBwaWNrIHRoZSBtYXhpbXVtCj4+IGFsbG93ZWQgbW9kZSBmcm9tIGNvbW1h
bmQgbGluZSBhbmQgRkRULCBuYW1lbHkgU3Y0OCwgd2l0aG91dCBwcm9iaW5nLgo+Pgo+PiBIYW5k
bGluZyBvZiBtbXUtdHlwZSAicmlzY3Ysc3Y1NyIgaW4gc2V0X3NhdHBfbW9kZV9mcm9tX2ZkdCgp
IGlzIGFkZGVkCj4+IHNpbmNlIGl0IGlzIG5vdyBuZWVkZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFZpdmlhbiBXYW5nIDx3YW5ncnVpa2FuZ0Bpc2Nhcy5hYy5jbj4KPj4gLS0tCj4+IFRlc3RlZCBv
biBRRU1VIDEwLjIuMiBvbiBhbGwgMyozIGNvbWJpbmF0aW9ucyBvZiBTdjM5L1N2NDgvU3Y1NyBh
bmQKPj4gKG5vbmUpL25vNGx2bC9ubzVsdmwuCj4+Cj4+IEluIHRoZW9yeSB0aGlzIGNvdWxkIGJl
IGEgYnJlYWsgaWYgbW11LXR5cGUgaXMgd3JvbmcsIGJ1dCBzbyBtYW55IG90aGVyCj4+IHRoaW5n
cyB3b3VsZCBicmVhayBpZiB0aGUgRkRUIGlzIHdyb25nIGFueXdheS4KPj4KPj4gQWxzbyBub3Rl
IHRoYXQgdGhpcyBkb2Vzbid0IGFwcGx5IG9uIEFDUEkgc2luY2UgaXQgaXMgZGlmZmljdWx0IHRv
IHVzZQo+PiBBQ1BJQ0EgYW5kIHJlYWQgQUNQSSBSSENUIGF0IHRoaXMgcG9pbnQsIHNvIHRoYXQg
d2lsbCBqdXN0IGZhbGwgYmFjayB0bwo+PiBwcm9iaW5nLiBIb3BlZnVsbHkgVUVGSS9BQ1BJICsg
dGhpcyBhdHJvY2lvdXMgU29DIGRlc2lnbiBuZXZlciBoYXBwZW5zLAo+PiBzaW5jZSB0aGUgaGln
aCBtZW1vcnkgYmFzZSBhZGRyZXNzIHdvdWxkIHByZXZlbnQgYSBsb3Qgb2YgUENJKGUpIGRldmlj
ZXMKPj4gZnJvbSB3b3JraW5nIHdpdGhvdXQgYW4gSU9NTVUuIChGaW5nZXJzIGNyb3NzZWQuKQo+
IE1pc3NpbmcgVUVGSS9BQ1BJIGlzIGluY29ycmVjdC4gUklTQy1WIHNlcnZlcnMgc3RhbmRhcmRp
emUgb24gVUVGSStBQ1BJLgo+IFdlIHNob3VsZCBzdXBwb3J0IFJIQ1QgcGFyc2luZyBpbnN0ZWFk
IG9mIGhvcGluZyBoaWdoLW1lbW9yeSBBQ1BJIHN5c3RlbXMKPiDigJxuZXZlciBoYXBwZW7igJ0u
Cj4KPiBDYWxsaW5nIHRoZSBoaWdoLW1lbW9yeSBTb0MgZGVzaWduIOKAnGF0cm9jaW91c+KAnSBp
cyB0ZWNobmljYWxseSB3cm9uZyBhbmQKPiBjb25jZXJuaW5nLiBUaGUgUklTQy1WIHNwZWMgZXhw
bGljaXRseSBhbGxvd3MgRFJBTSBhdCBhbnkgcGh5c2ljYWwgYWRkcmVzcwo+IChlLmcuIDEyOCBU
aUIpLiBXaXRoIFRCL1BCLXNjYWxlIG1lbW9yeSBvbiB0aGUgaG9yaXpvbiwgdGhpcyBpcyBhIHZh
bGlkIFNvQwo+IGNob2ljZS4KPgo+IFRoaXMgcGF0Y2ggZG9lcyBub3Qgc29sdmUgdGhlIHByb2Js
ZW0gYXQgaXRzIHJvb3QuIFRoZSBjb3JlIGlzc3VlIGlzIHRoYXQKPiB3ZSBhcmUgcGFzc2luZyBh
biBpbnZhbGlkIHZpcnR1YWwgYWRkcmVzcyAoVkEpIGFzIGlucHV0IHRvIHNhdHAgbW9kZQo+IHBy
b2JpbmcuIFN0cmVuZ3RoZW5pbmcgdGhlIFZBIGNoZWNrIG9uIHRoZSBpbnB1dCBzaWRlIHdvdWxk
IGZpeCBpdCBjbGVhbmx5Lgo+Cj4gSSBhbHJlYWR5IHBvc3RlZCB0aGUgZml4IGZvciB0aGlzIGV4
YWN0IGlzc3VlIHRocmVlIG1vbnRocyBhZ286IFsxXS4KPiBUaGlzIHNob3VsZCBhZGRyZXNzIGJv
dGggRFQgYW5kIFVFRkkvQUNQSSBzY2VuYXJpb3MuCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwMTI1MDU1MjEyLjQzMzE2My0xLWd1b3JlbkBrZXJuZWwu
b3JnLwoKU29ycnkgZm9yIHRoZSB0cm91YmxlLCBpdCBzZWVtcyB0aGF0IHNvbWUgbWlzY29tbXVu
aWNhdGlvbiBoYXMgb2NjdXJyZWQuCldoaWxlIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMg
cHJvYmxlbSBpbiBhbiBlbXVsYXRvciwgSSBkbyBub3QgaGF2ZQphY2Nlc3MgdG8gdGhpcyBoYXJk
d2FyZSBhbmQgaGFkIG1pc3VuZGVyc3Rvb2QgdGhlIGNvbnRleHQgYW5kIHRoZSBuYXR1cmUKb2Yg
dGhpcyBwbGF0Zm9ybS4KClBsZWFzZSBjb25zaWRlciB0aGlzIHBhdGNoIGFiYW5kb25lZC4KCldp
dGggYXBvbG9naWVzLApWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
