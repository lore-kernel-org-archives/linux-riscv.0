Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B2C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lr+L+dJQuVm6mrp6atb9M3xct7ble87ZwFYPfX/462s=; b=qYRn0BEKwG5Rt9
	YLAOSmiZ9OU3K6VkhLX2T8q949fG5ecxwpkdJNX3jQjqgseGQulqiabCvqJ0NEVmsDnXV/IHp6xbf
	raqVzI6nn9NYYckOgIZo8prCLLDOXEdhNCVR+JnHRmPDolmiR3gHPJnYWZfrlUcoh0pzgr4Hn6G5Q
	dUMFq+LawdVmdbNV59z8dozfkpqhESsneQQ5DMbFqzvwZHk+fHfJyRQlCiqEgHKZOg/ljRDCt6J4l
	gPSEZdpnnUMi80YPQnZzJOTgtpaEvtZa2A7p1rmKPQ2t4GyoxDZLtR1FH2R1RFnLnCWHagMkLNSjd
	tJKLMQ/JYZfbfWvM7+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjP1D-0000000AVTc-45zi;
	Mon, 13 Jul 2026 22:20:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjP1C-0000000AVTU-3EjI
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 22:20:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B6D060103;
	Mon, 13 Jul 2026 22:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFF31F000E9;
	Mon, 13 Jul 2026 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783981253;
	bh=w3UBKxF49r1FocG/e6uCyLxV81MIS/cKXMKj7GFa2dY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MpMCkP0Q6zqib0sjSPapvsNNpIi4SuIbRx2KpQXXh5WymOk/U9BYtzwUFKFSDJeFr
	 cs5Si8k2Jro4QstLfelU9720P5WxeuRbAnaxnadJdzaNvoaow0D7p7lmUZbQ5oMrrN
	 3o5UyHWDonKsgHBAuyv9ZXOcFD4wg3E4vkt4dz4QCFld69S4V95QQDPnbS7bjngziq
	 2jPG3bUh3nPhORy/xTSX0II1pDeNiDEJxCtsVmFL58A3GaH2iLUQD/2RQGNNGo+4RY
	 8iH8Ua+ASe9SPzJRnmuCPKTYmEYeFYtAmbx6vPkwBxZlSMFDBbTa0wDk4N8IQubbaz
	 LFd4xigUG0cCA==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Magnus Lindholm <linmag7@gmail.com>, "Mukesh Kumar Chaurasiya (IBM)"
 <mkchauras@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Radu Rendec
 <radu@rendec.net>
Subject: Re: [patch 4/4] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
In-Reply-To: <alSlg72c8xmjaj48@kunlun.suse.cz>
References: <20260712134433.549076055@kernel.org>
 <20260712141346.772209074@kernel.org> <alSlg72c8xmjaj48@kunlun.suse.cz>
Date: Tue, 14 Jul 2026 00:20:49 +0200
Message-ID: <871pd6r0ou.ffs@fw13>
MIME-Version: 1.0
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

T24gTW9uLCBKdWwgMTMgMjAyNiBhdCAxMDo0NCwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBP
biBTdW4sIEp1bCAxMiwgMjAyNiBhdCAxMToyNTozMlBNICswMjAwLCBUaG9tYXMgR2xlaXhuZXIg
d3JvdGU6Cj4+IFRoZSByZXR1cm4gdmFsdWVzIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21v
ZGVbX3dvcmtdKCkgYXJlCj4+IG5vbi1pbnR1aXRpdmUuIEJvdGggZnVuY3Rpb25zIHJldHVybiB0
aGUgc3lzY2FsbCBudW1iZXIgd2hpY2ggc2hvdWxkIGJlCj4+IGludm9rZWQgYnkgdGhlIGFyY2hp
dGVjdHVyZSBzcGVjaWZpYyBzeXNjYWxsIGVudHJ5IGNvZGUuIFRoZSByZXR1cm5lZAo+PiBudW1i
ZXIgY2FuIGJlOgo+PiAKPj4gICAtIHRoZSB1bm1vZGlmaWVkIHN5c2NhbGwgbnVtYmVyIHdoaWNo
IHdhcyBoYW5kZWQgaW4gYnkgdGhlIGNhbGxlcgo+PiAKPj4gICAtIGEgbW9kaWZpZWQgc3lzY2Fs
bCBudW1iZXIgKHB0cmFjZSwgc2VjY29tcCwgdHJhY2UvcHJvYmUvYnBmKQo+PiAKPj4gVGhhdCBo
YXMgYW4gYWRkaXRpb25hbCB0d2lzdC4gSWYgdGhlIHJldHVybiB2YWx1ZSBpcyAtMUwgdGhlbiB0
aGUgY2FsbGVyIGlzCj4+IG5vdCBhbGxvd2VkIHRvIG1vZGlmeSB0aGUgcmV0dXJuIHZhbHVlIGFz
IHRoYXQgaW5kaWNhdGVzIHRoYXQgdGhlIG1vZGlmeWluZwo+PiBlbnRpdHkgcmVxdWVzdHMgdG8g
YWJvcnQgdGhlIHN5c2NhbGwgYW5kIHNldCB0aGUgcmV0dXJuIHZhbHVlIGFscmVhZHkuIFRoYXQK
Pj4gY2FuIG9idmlvdXNseSBub3QgYmUgZGlmZmVyZW50aWF0ZWQgZnJvbSBhIHN5c2NhbGwgd2hp
Y2ggaGFuZGVkIGluIC0xIGFzCj4+IHN5c2NhbGwgbnVtYmVyLgo+PiAKPj4gVGhlIG1vc3QgdHJp
dmlhbCB3YXkgdG8gZGVhbCB3aXRoIHRoYXQgaXM6Cj4+IAo+PiAgICAgc2V0X3JldHVybl92YWx1
ZShyZWdzLCAtRU5PU1lTKTsKPj4gICAgIG5yID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZShyZWdzLCBucik7Cj4+ICAgICBpZiAodmFsaWQobnIpKQo+PiAgICAgCWhhbmRsZV9zeXNjYWxs
KHJlZ3MsIG5yKTsKPj4gCj4+IFRoYXQncyB3aGF0IExPT05HQVJDSCwgUklTQ1YsIGFuZCBYODYg
ZG8uIEJ1dCBQb3dlclBDIGFuZCBTMzkwIGRvIG5vdAo+PiBwcmVzZXQgdGhlIHJldHVybiB2YWx1
ZSwgc28gd2hlbiB1c2VyIHNwYWNlIGhhbmRzIGluIC0xIGFuZCB0aGVyZSBpcwo+PiBub3RoaW5n
IHNldHRpbmcgdGhlIHJldHVybiB2YWx1ZSBpbiB0aGUgZW50cnkgd29yayBjb2RlLCB0aGVuIHRo
ZSBzeXNjYWxsCj4+IGlzIHNraXBwZWQgYnV0IHRoZSByZXR1cm4gdmFsdWUgaXMgd2hhdGV2ZXIg
cmFuZG9tIGRhdGEgaGFzIGJlZW4gaW4gdGhlCj4+IHJldHVybiB2YWx1ZSByZWdpc3Rlci4KPgo+
IFRoZSByZWFzb24gd2h5IFBvd2VyUEMgYW5kIFMzOTAgZG8gbm90IHByZXNldCB0aGUgcmV0dXJu
IHZhbHVlIGlzIHRoYXQKPiB0aGUgcmV0dXJuIHZhbHVlIHVzZXMgdGhlIHNhbWUgcmVnaXN0ZXIg
YXMgdGhlIHN5c2NhbGwgbnVtYmVyLiBUaGVyZSBhcmUKPiBhcHBhcmVudGx5IG90aGVyIGFyY2hp
dGVjdHVyZXMgb24gd2hpY2ggdGhlIHJldHVybiB2YWx1ZSBvdmVybGFwcyB3aXRoCj4gdGhlIGFy
Z3VtZW50cyB3aGljaCBhbHNvIGRvIG5vdCBwcmVzZXQgdGhlIHJldHVybiB2YWx1ZSBmb3IgdGhh
dCByZWFzb24uCj4gSWYgdGhleSB3b3VsZCB1c2UgdGhlIGdlbmVyaWMgZW50cnkgdGhlIHNhbWUg
cHJvYmxlbSB3b3VsZCBhcmlzZS4KClRoYXQncyBhbiBpbXBsZW1lbnRhdGlvbiBjaG9pY2Ugb2Yg
UFBDL1MzOTAgYXMgSSBleHBsYWluZWQgYmVmb3JlLCB3aGljaApjb3VsZCB0cml2aWFsbHkgYmUg
c29sdmVkIGJ5IGhhdmluZyBhbiBleHBsaWNpdCBwdF9yZWdzLT5yZXR1cm5fdmFsCm1lbWJlciwK
Cj4+IENoYW5nZSB0aGUgcmV0dXJuIHZhbHVlcyBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlW193b3JrXSgpIHRvCj4+IGJvb2xlYW4gYW5kIHJldHVybiBmYWxzZSwgd2hlbiBlaXRoZXIg
cHRyYWNlIG9yIHNlY2NvbXAgcmVxdWVzdCB0byBza2lwIHRoZQo+Cj4gVGhlcmUgaXMgYSBkaWZm
ZXJlbmNlIGJldHdlZW4gc2VjY29tcCBhbmQgcHRyYWNlLgo+Cj4gV2hlbiBzZWNjb21wIGluZGlj
YXRlcyB0byBza2lwIHRoZSBzeXNjYWxsIGl0IGhhcyBhbHNvIHNldCB0aGUgc3lzY2FsbAo+IHJl
dHVybiB2YWx1ZS4KPgo+IEhvd2V2ZXIsIHdoZW4gdGhlIHN5c2NhbGwgbnVtYmVyIGlzIC0xIGFu
ZCB0aGUgcmV0dXJuIHZhbHVlIGlzIG5vdAo+IHByZXNldCB0aGF0IGRvZXMgbm90IGluZGljYXRl
IGFueXRoaW5nLgoKSSBhZ3JlZSBpdCdzIGFuIGludmFsaWQgc3lzY2FsbCwgYnV0IHRoZSBjdXJy
ZW50IGdlbmVyaWMgZW50cnkgY29kZSBtYWRlCnRoZSByaWdodGZ1bCBhc3N1bXB0aW9uIHRoYXQg
cmV0dXJuaW5nIC0xTCBhcyB0aGUgc3lzY2FsbCBudW1iZXIgZWl0aGVyCnJlc3VsdHMgaW4gLUVO
T1NZUyBvciBpbiB0aGUgdmFsdWUgd2hpY2ggd2FzIHNldCBieSBvbmUgb2YgdGhlIGVudHJ5Cm1l
Y2hhbmlzbXMgYXMgdGhhdCBjb2RlIG9yaWdpbmF0ZWQgZnJvbSB0aGUgeDg2IGltcGxlbWVudGF0
aW9uLgoKSXQncyBub3QgdGhlIGZhdWx0IG9mIHRoYXQgY29kZSB0aGF0IFBQQyBhbmQgUzM5MCBj
b252ZXJ0ZWQgdGhlaXIgc3R1ZmYKb3ZlciB3aXRob3V0IHBheWluZyBhdHRlbnRpb24gdG8gdGhh
dCBkZXRhaWwuCgo+IFRoZSByZXR1cm4gdmFsdWUgY2FuIHN0aWxsIGhvbGQgZ2FyYmFnZS4gcHRy
YWNlIGRvZXMgbm90IGhhdmUgdGhlCj4gYWJpbGl0eSB0byBpbmRpY2F0ZSB0aGF0IGEgc3lzY2Fs
bCBpcyB0byBiZSBza2lwcGVkLCBhdCBsZWFzdCBvbiB0aGUKPiBlbnRyeSB0cmFjZS4gSXQgbmVl
ZHMgdG8gYmUgc2tpcHBlZCBiYXNlZCBvbiB0aGUgc3lzY2FsbCBudW1iZXIgYmVpbmcKPiBpbnZh
bGlkLgoKVGhhdCdzIHdoYXQgSSBleHBsYWluZWQgeW91IGJlZm9yZSBhbmQgeW91IHRvbGQgbWUg
SSdtIGFsbCB3cm9uZy4KCkJ1dCB0aGF0J3MgbW9vdCBhcyB0aGlzIGxhdGVzdCB2ZXJzaW9uIGRv
ZXMgbm90IGNhcmUgYW55bW9yZS4gVGhlCmFyY2hpdGVjdHVyZXMgd2hpeGggcHJlc2V0IHRoZSBy
ZXR1cm4gdmFsdWUgYXJlIGNvcnJlY3QgdW5kZXIgYWxsCmNpcmN1bXN0YW5jZXMgYW5kIFBQQy9T
MzkwIGNhbiBrZWVwIHRoZWlyIG93biB3b3JsZCB2aWV3LgoKVGhhbmtzLAoKICAgICAgICB0Z2x4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
