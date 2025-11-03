Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967E4CCFA00
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 02:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+b3DG92qHVMs5FTuJpmJP8xvI+4BbM+C+Q1jnw+EPm8=; b=bx3P2SyaoEXaCl
	DEfD9mkEGl9e3FYfOYcCl/sZ2bo0NPX2YUILLm/Ubjhy0VvKEw9vi0pWIsVg4xyUoqkHb7XJus8Ty
	qUomkXqvUxwTglZkKslP2lKK+0JL0UCDUPF8ZtLL5RLoTqoMsvWFmIBME0o/sz9FnVmd/K9+Zn9Fo
	X1UdMYU2eun43azMBrKASk2WiIj0uvzg5bd4BNiLvnz/JALFVyFr6aCnx7SZV7m1wECqXqlVOiW2C
	rIO1QjfwJbrHlk4GAw9IVh7+rpe6NZ7s5AVJCrsgrq4mOKrIiwFZgHcFAZUn/sOagCVFlB7lBwy2Z
	vTqqt5BhPrNyCXm7Y6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkZ8-000000094sj-0JOa;
	Mon, 03 Nov 2025 02:45:06 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkZ4-000000094qp-1FC1
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 02:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762137874;
	bh=EzhqW4LTolUoeFR6p40cCHk6rVnU+KQUnuF+gS36JjM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=q4JkamuKKZTlgKGhfP9hJrv85LD7eIagA4Rl7OwJnkdKsDI7rR6oqEocYmpBq0s/l
	 qgJcIrAlwGmEN3KEG+g/SI/EHjFwiMNrezTPWgse0+Tw+Zkl6k4vZs4zC1/mTQSksF
	 oOKES8Jf12DBEOkxz//ZMVDwNXvvEQ6fx4t4UqP8=
X-QQ-mid: esmtpgz15t1762137867ta3d9be05
X-QQ-Originating-IP: ULHth8tWTgPrwdTvp7p10X6LZ87YT7f4b9dFm0/Sijg=
Received: from = ( [183.48.244.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 10:44:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7644360371679395444
EX-QQ-RecipientCnt: 4
Date: Mon, 3 Nov 2025 10:44:25 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_184503_292389_886B64E6 
X-CRM114-Status: GOOD (  10.64  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgMDk6MTg6NTBBTSArMDgwMCwgVHJveSBNaXRjaGVsbCB3
cm90ZToKPiBPbiBTYXQsIE9jdCAyNSwgMjAyNSBhdCAwNzo0ODo0NUFNICswMDAwLCBNaWNoYWVs
IE9wZGVuYWNrZXIgd3JvdGU6Cj4gPiBHcmVldGluZ3MsCj4gPiAKPiA+IE9uIDEwLzI1LzI1IDA5
OjQ1LCBtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20gd3JvdGU6Cj4gPiA+IEZyb206
IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29tPgo+
IFsuLi5dCj4gPiA+ICsmaTJjMiB7Cj4gPiA+ICsJcGluY3RybC0wID0gPCZpMmMyXzBfY2ZnPjsK
PiA+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiArCXN0YXR1cyA9ICJva2F5
IjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gKyZpMmM4IHsKPiA+ID4gKwlwaW5jdHJsLTAgPSA8
JmkyYzhfY2ZnPjsKPiA+ID4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiArCXN0
YXR1cyA9ICJva2F5IjsKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gICAmcGRtYSB7Cj4gPiA+ICAg
CXN0YXR1cyA9ICJva2F5IjsKPiA+ID4gICB9Owo+ID4gCj4gPiAKPiA+IFVuZm9ydHVuYXRlbHks
IHRoZXNlIGNoYW5nZXMgYXJlIG5vdCBmdW5jdGlvbmFsIHlldCBvbiBPcmFuZ2VQaSBSVjIsIHRl
c3RpbmcKPiA+IG9uIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0
cy9rMS9kdC1mb3ItbmV4dAo+ID4gCj4gPiAjIGkyY2RldGVjdCAtciAyCj4gPiBXQVJOSU5HISBU
aGlzIHByb2dyYW0gY2FuIGNvbmZ1c2UgeW91ciBJMkMgYnVzLCBjYXVzZSBkYXRhIGxvc3MgYW5k
IHdvcnNlIQo+ID4gSSB3aWxsIHByb2JlIGZpbGUgL2Rldi9pMmMtMiB1c2luZyByZWNlaXZlIGJ5
dGUgY29tbWFuZHMuCj4gPiBJIHdpbGwgcHJvYmUgYWRkcmVzcyByYW5nZSAweDA4LTB4NzcuCj4g
PiBDb250aW51ZT8gW1kvbl0KPiA+IMKgIMKgIMKgMMKgIDHCoCAywqAgM8KgIDTCoCA1wqAgNsKg
IDfCoCA4wqAgOcKgIGHCoCBiwqAgY8KgIGTCoCBlwqAgZgo+ID4gMDA6wqAgwqAgwqAgwqAgW8Kg
IDEyNC42NzUzMjFdIGkyYy1rMSBkNDAxMjAwMC5pMmM6IGkyYyB0cmFuc2ZlciBmYWlsZWQsIHJl
dCAtMTEKPiA+IGVyciAweDQwMDAwMApJIHJlY2FsbCB0aGF0IHRoZSBQTUlDIHNvbWV0aW1lcyBy
ZXBvcnRzIEkyQyB0aW1lb3V0cy4KQ291bGQgeW91IHBsZWFzZSBjb25maXJtIGlmIHlvdeKAmXJl
IHNlZWluZyB0aGlzIGlzc3VlIG9uIHlvdXIgc2lkZT8KSWYgc28sIGRvZXMgaXQgc3RpbGwgb2Nj
dXIgd2hlbiB1c2luZyBteSBicmFuY2g/CgpUaGFua3MhCgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBUcm95CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
