Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A4CDB471
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbTtlgJiPUYGUC+4wo3Pzdrk/ScGdbRhPwx51bYNVSI=; b=mVWuYdGh/d9zVp
	jB+pGDSZOelhgOR3NccTx1oEGc/amLJwEnLSknxenCCSYB6qUxXbofv7QgSzvbeSNE1IUi/r5rCfz
	ULnG8YthJYJQ3qAYLwOPvJJvQEaspGkburuBLq3H4zD4syLhJIFOtOhF58YUdVFMqZ7YxgNmyv60i
	yL0kHSpO1UWYsM+65Zu57N3CTpw7zvOmJ8MWQZTzO0P/IfpLxurd1HRgcznOcF80NivbXv/C/8lej
	8AceEgjvVZPGlmMQAOfynVtoELpRoQW1U6MYPE2ve+4FgLXfi/iBbhC2jCE/afdpAjNamhz9FDFMe
	zwr6zKdiz7XcctHN6hsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba1S-00000004fZQ-0BGN;
	Mon, 22 Jun 2026 08:28:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wba1R-00000004fZK-1G4i
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Jun 2026 08:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bbTyrnhqvWIcaXGI5ya6CH216d2F3ewFkzDXa3yFmPg=; b=JfJBOhMnP5yLYxb1TUJmIV3k3W
	bvDEHpVJOLzGrwPYiEZMexVe1cwXhJ7WA7O/wQMfJbczJU3pKj7Pt2HntYo2K0viOYJuuIaPE6zoP
	gnj6Py8/FSiFean+s4tC2MRe1sLbxfL2ML0WaSa5oFpmjTxN00XvDVyUaHRWkEaG/V8REbqwL2a0W
	getComPHsxZWERYn3U+N/OeI8ZjUI/WtzVLI/b0ssXSU9CDznuiazbAmYET+RljytwgDllD887NDg
	Xxt9F1YlHFJ2Wm8dEMN8u8BAjDYdDs36LB8N8IOQbOYpiZ0xGuW7/n9Xo9Fi7d9UMbrb28GCgwFdx
	LMjYg2eg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wba1L-0000000HCHO-3ygg;
	Mon, 22 Jun 2026 08:28:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D0349300B5F; Mon, 22 Jun 2026 10:28:41 +0200 (CEST)
Date: Mon, 22 Jun 2026 10:28:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Kees Cook <kees@kernel.org>, arnd@arndb.de, palmer@rivosinc.com,
	tglx@linutronix.de, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
	palmer@dabbelt.com, bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <20260622082841.GW49951@noisy.programming.kicks-ass.net>
References: <20230702025708.784106-1-guoren@kernel.org>
 <202606191652.38297DE51@keescook>
 <ajeKPpg2rwadVPY4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ajeKPpg2rwadVPY4@gmail.com>
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

T24gU3VuLCBKdW4gMjEsIDIwMjYgYXQgMDI6NTI6NDZBTSAtMDQwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIEp1biAxOSwgMjAyNiBhdCAwNDo1NDo1M1BNIC0wNzAwLCBLZWVzIENvb2sgd3Jv
dGU6Cj4gPiAqdGhyZWFkIGVuY3JvbWFuY3kqCj4gPiAKPiA+IE9uIFNhdCwgSnVsIDAxLCAyMDIz
IGF0IDEwOjU3OjA3UE0gLTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gPiBGcm9t
OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+IAo+ID4gPiBUaGUgaXJx
ZW50cnlfbm1pX2VudGVyL2V4aXQgd291bGQgZm9yY2UgdGhlIGN1cnJlbnQgY29udGV4dCBpbnRv
IGluX2ludGVycnVwdC4KPiA+ID4gVGhhdCB3b3VsZCB0cmlnZ2VyIHRoZSBrZXJuZWwgdG8gZGVh
ZCBwYW5pYywgYnV0IHRoZSBrZGIgc3RpbGwgbmVlZHMgImVicmVhayIgdG8KPiA+ID4gZGVidWcg
dGhlIGtlcm5lbC4KPiA+ID4gCj4gPiA+IE1vdmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQgdG8g
ZXhjZXB0aW9uX2VudGVyL2V4aXQgY291bGQgY29ycmVjdCBoYW5kbGVfYnJlYWsKPiA+ID4gb2Yg
dGhlIGtlcm5lbCBzaWRlLgo+ID4gPiAKPiA+ID4gQmVmb3JlIHRoZSBmaXh1cDoKPiA+ID4gJGVj
aG8gQlVHID4gL3N5cy9rZXJuZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1QKPiA+ID4gICBs
a2R0bTogUGVyZm9ybWluZyBkaXJlY3QgZW50cnkgQlVHCj4gPiA+ICAgLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiA+ICAga2VybmVsIEJVRyBhdCBkcml2ZXJzL21pc2Mv
bGtkdG0vYnVncy5jOjc4IQo+ID4gPiBbLi4uXQo+ID4gPiAgIEtlcm5lbCBwYW5pYyAtIG5vdCBz
eW5jaW5nOiBBaWVlLCBraWxsaW5nIGludGVycnVwdCBoYW5kbGVyIQo+ID4gCj4gPiBUaGlzIGFw
cGVhcnMgdG8gc3RpbGwgYmUgdW5maXhlZC4gV2hhdCdzIHRoZSBibG9ja2VyPyBUaGUgc29sdXRp
b25zIGluCj4gPiB0aGlzIHRocmVhZCBzZWVtIHRvIHdvcmsuLi4KPiA+IAo+ID4gSSdkIGxpa2Ug
dG8gYmUgZXhlcmNpc2luZyBhbiBPb3BzIHBhdGggdmlhIEtVbml0IChmb3IgS0NGSSksIGFuZCBy
aXNjdgo+ID4ganVzdCBpbnN0YW50bHkgZmFsbHMgb3ZlciBpbnN0ZWFkIG9mIHRocmVhZC1raWxs
aW5nIG9uIHRoZSBleGNlcHRpb24uCj4gVGhhbmtzIGZvciByZXZpdmluZyB0aGlzIHRocmVhZC4g
QXQgdGhlIHRpbWUgSSBkaWRu4oCZdCBmdWxseSB1bmRlcnN0YW5kCj4gUGV0ZXLigJlzIHBvaW50
LiBXZSBzaG91bGQgb25seSB1c2UgdGhlIE5NSSBwYXRoIHdoZW4gdGhlIHRyYXAgb2NjdXJzIHdp
dGgKPiBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+IEhlcmXigJlzIHRoZSB1cGRhdGVkIGZpeDoKPiAK
PiAgZG9fdHJhcF9icmVhayhzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAuLi4gCj4gIAkJaXJxZW50
cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gIAl9IGVsc2Ugewo+IC0JCWlycWVudHJ5X3N0
YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7Cj4gKwkJaWYgKHJlZ3MtPnN0
YXR1cyAmIFNSX0lFKSB7Cj4gKwkJCWVudW0gY3R4X3N0YXRlIHByZXZfc3RhdGUgPSBleGNlcHRp
b25fZW50ZXIoKTsKPiAgCj4gLQkJaGFuZGxlX2JyZWFrKHJlZ3MpOwo+ICsJCQloYW5kbGVfYnJl
YWsocmVncyk7Cj4gIAo+IC0JCWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKPiArCQkJ
ZXhjZXB0aW9uX2V4aXQocHJldl9zdGF0ZSk7Cj4gKwkJfSBlbHNlIHsKPiArCQkJaXJxZW50cnlf
c3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKPiArCj4gKwkJCWhhbmRs
ZV9icmVhayhyZWdzKTsKPiArCj4gKwkJCWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsK
PiArCQl9Cj4gIAl9Cj4gIH0KPiAKPiBJZiB5b3UgJiBQZXRlciBoYXZlIG5vIG9iamVjdGlvbiwg
SeKAmWxsIHBvc3QgYSB2Mi4KCkkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBpdC4gVGhpcyBjYW5u
b3QgZml4IGFueXRoaW5nLiBDb25zaWRlcjoKCiBFQlJFQUsKIHJhd19zcGluX2xvY2tfaXJxKCZ5
b3VyX2xvY2spCiBFQlJFQUsKClNvIG5vdyB0aGUgZmlyc3QgJ3dvcmtzJywgYnV0IHRoZSBzZWNv
bmQgd2lsbCBjcmFzaC4gQWRkaXRpb25hbGx5LApoYXZpbmcgdGhlIEVCUkVBSyBjb250ZXh0IGRp
ZmZlciBzbyBkcmFtYXRpY2FsbHkgYmV0d2VlbiBpbnZvY2F0aW9ucwpzZWVtcyBsaWtlIGEgdmVy
eSBiYWQgZGVhbCB0byBtZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
