Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CC1C83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsMgvIAVjURA2Qmv76HscjGJm+6O69YgNieqveXc1UU=; b=tstbI+3QRK2C6M
	fLq1HWaBGC/P4szPdmiU1Eh3niuujUE86PgykJc5EVZQ+FDHXa4r4ULnOZYcAFGudkywq3osfoCmi
	769wkb4qT4B9Pcekh7J8RmG3AwrMUNs0GC+8FUAH1TP/b1zc7XcNcobbxFr6la1WHJg0WpmwJrNmS
	0Nle2pFOmcxs6Q0KzQvHl6kocXj5HhSxojLxC9q0+yOJ8/I4aze549+A4erhftk9r7MSfJXp9itFP
	XwoQ99XZbAytPTKWr0kFbv+fvWtS225xDHqkoO/7wakY4mEu777DIS8DerZJQGhGTD/qYkCH9KBYD
	hBGvE6K7en34ZkMSXFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfJb-00000006I8a-2CHF;
	Tue, 01 Jul 2025 18:02:43 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcnX-00000005s1h-25Ta
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:21:28 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id E517DB9E49;
	Tue,  1 Jul 2025 15:21:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 62A7A2000E;
	Tue,  1 Jul 2025 15:21:17 +0000 (UTC)
Date: Tue, 1 Jul 2025 11:21:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Yao Zi <ziyao@disroot.org>, Andy Chiu <andybnac@gmail.com>,
 alexghiti@rivosinc.com, palmer@dabbelt.com, Andy Chiu
 <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Mark Rutland <mark.rutland@arm.com>,
 puranjay12@gmail.com, paul.walmsley@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, eric.lin@sifive.com,
 vicent.chen@sifive.com, zong.li@sifive.com, yongxuan.wang@sifive.com,
 samuel.holland@sifive.com, olivia.chu@sifive.com, c2232430@gmail.com, Han
 Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [REGRESSION] Random oops on SG2042 with Linux 6.16-rc and
 dynamic ftrace
Message-ID: <20250701112116.24cf8163@batman.local.home>
In-Reply-To: <b060e694-caa0-4aa5-ac67-75531a5f60eb@ghiti.fr>
References: <aGODMpq7TGINddzM@pie.lan>
	<b060e694-caa0-4aa5-ac67-75531a5f60eb@ghiti.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 62A7A2000E
X-Stat-Signature: 59cfkw1pdim9kresnutii68uakri7p8t
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/NJMVWipJuBxIYkuT6e6RUoPIwwQiqAis=
X-HE-Tag: 1751383277-669370
X-HE-Meta: U2FsdGVkX182ALet42c3iMi2YFUYr6K+qXWSp9Nc2/oYd4UWY+lrz0yseqtNdf6s4czTyAhl5x/WZDEy3JbSXCbHDUBzGKoGw881QaXZ0ZsNE5KwJ/VDEiMwGYgEDlxQRRgmsoe+oGOwdoiHeZGVY8opsV8mRqdJhWy1IQGC73NeW1eMVY3rIrmb+6G0erF4jL93o1W4Wx3KJs1PLKxzpg7wAW1ad9oPC98SY87CUhOkRZE1ZzVdjmLD+HsHgydL+CSpVZ93Y8SBw2qi066qFiGHlmYeeyU+chGglyPEoNGNo5zNX5cGPjR0HknSPNxd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_082127_591557_550BAE62 
X-CRM114-Status: UNSURE (   9.33  )
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

T24gVHVlLCAxIEp1bCAyMDI1IDE0OjI3OjMyICswMjAwCkFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cgo+IEBAIC0xNDksMTYgKzE1NywxNyBAQCBpbnQgZnRyYWNlX2luaXRf
bm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IAo+IGR5bl9mdHJhY2UgKnJlYykKPiAgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5vcHNbMl0sIG9mZnNldDsKPiAgwqDCoMKgwqDCoMKg
wqAgaW50IHJldDsKPiAKPiArwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnRleHRfbXV0ZXgpOwoK
VGhpcyBsb29rcyBsaWtlIGEgcHJpbWUgY2FuZGlkYXRlIGZvcjoKCglndWFyZChtdXRleCkoJnRl
eHRfbXV0ZXgpOwoKPiAgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZnRyYWNlX3JlY19zZXRfbm9wX29w
cyhyZWMpOwo+ICDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBlbmQ7CgpUaGVuIHRoaXMgY2hhbmdlIHdvdWxkbid0IGJlIG5lZWRlZC4KCj4gCj4gIMKgwqDC
oMKgwqDCoMKgIG9mZnNldCA9ICh1bnNpZ25lZCBsb25nKSAmZnRyYWNlX2NhbGxlciAtIHBjOwo+
ICDCoMKgwqDCoMKgwqDCoCBub3BzWzBdID0gdG9fYXVpcGNfdDAob2Zmc2V0KTsKPiAgwqDCoMKg
wqDCoMKgwqAgbm9wc1sxXSA9IFJJU0NWX0lOU05fTk9QNDsKPiAKPiAtwqDCoMKgwqDCoMKgIG11
dGV4X2xvY2soJnRleHRfbXV0ZXgpOwo+ICDCoMKgwqDCoMKgwqDCoCByZXQgPSBwYXRjaF9pbnNu
X3dyaXRlKCh2b2lkICopcGMsIG5vcHMsIDIgKiBNQ09VTlRfSU5TTl9TSVpFKTsKPiArZW5kOgo+
ICDCoMKgwqDCoMKgwqDCoCBtdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOwoKYW5kICJlbmQ6IiBh
cyB3ZWxsIGFzIHRoZSBtdXRleF91bmxvY2soKSBjYW4gYmUgcmVtb3ZlZC4KCj4gCj4gIMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gCj4gCj4gQW5keSBpcyBhbHNvIHRha2luZyBhIGxvb2ss
IEknbGwgbGV0IGhpbSBjb25maXJtIHRoZSBhYm92ZSBmaXggaXMgY29ycmVjdC4KPiAKPiBUaGFu
a3MgZm9yIHRoZSB0aG9yb3VnaCByZXBvcnQhCgpZZXMsIHRoYW5rIHlvdSBZYW8gWmkgZm9yIHRo
ZSB2ZXJ5IGRldGFpbGVkIGJ1ZyByZXBvcnQhIFRoYXQgbWFkZQp0aGluZ3Mgc28gbXVjaCBlYXNp
ZXIuCgotLSBTdGV2ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
