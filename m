Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96957C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 393D5603E8
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 393D5603E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okD+65lmVq+yERzYtlhnPiAqMdPK9VG4DAD/A/kfrKM=; b=xumweQHUuUAOiW
	SfLxGY7zFMDm44BTVREjTyHlmxi7WHMb3MgzwifwqHgNOm/a0eFilUNPApenFhr9TckEiNW2fP9gy
	MPebwS3x7SbjsobRTFVpKqZXocKvv9HqVza0j3FAtuXyZkcrc6gFSMfG09hxfClixK3/GQCtf7hwq
	8KJ/TsOyyfMXA4m6dDxXctuIh4hML/L4q+nGuwvF97hz5yno7EcGnj5UkKyvAfJFTNxaykOjdUnA7
	sijj/LRJh5zbMXfiBffaRE9kVyrWrshEMt0hZLTV8fVoUT/2s3COXx9ivewPidZXPA05zpx6GUwj6
	TT2c7FJnb/E6pnFn1KBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maUv5-00EjEG-79; Wed, 13 Oct 2021 03:27:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maUv2-00EjCz-0e
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 03:27:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D494603E8;
 Wed, 13 Oct 2021 03:27:00 +0000 (UTC)
Date: Tue, 12 Oct 2021 23:26:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Guo Ren <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix & prevent the missing preemption disabling
Message-ID: <20211012232658.7dac3f43@oasis.local.home>
In-Reply-To: <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_202704_140304_6D67DCF0 
X-CRM114-Status: GOOD (  13.58  )
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

UGxlYXNlIHN0YXJ0IGEgbmV3IHRocmVhZCB3aGVuIHNlbmRpbmcgbmV3IHZlcnNpb25zLiB2MiBz
aG91bGQgbm90IGJlIGEKcmVwbHkgdG8gdjEuIElmIHlvdSB3YW50IHRvIHJlZmVyZW5jZSB2MSwg
anVzdCBhZGQgaXQgdG8gdGhlIGNvdmVyCmxldHRlciB3aXRoIGEgbGluayB0YWc6CgpMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOGM3ZGU0NmQtOTg2OS1hYTVlLTJiYjktNWRiYzJl
ZGEzOTVlQGxpbnV4LmFsaWJhYmEuY29tLwoKLS0gU3RldmUKCgpPbiBXZWQsIDEzIE9jdCAyMDIx
IDExOjE2OjU2ICswODAwCueOi+i0hyA8eXVuLndhbmdAbGludXguYWxpYmFiYS5jb20+IHdyb3Rl
OgoKPiBUaGUgdGVzdGluZyBzaG93IHRoYXQgcGVyZl9mdHJhY2VfZnVuY3Rpb25fY2FsbCgpIGFy
ZSB1c2luZyBzbXBfcHJvY2Vzc29yX2lkKCkKPiB3aXRoIHByZWVtcHRpb24gZW5hYmxlZCwgYWxs
IHRoZSBjaGVja2luZyBvbiBDUFUgY291bGQgYmUgd3JvbmcgYWZ0ZXIgcHJlZW1wdGlvbi4KPiAK
PiBBcyBQZXRlciBwb2ludCBvdXQsIHRoZSBzZWN0aW9uIGJldHdlZW4gZnRyYWNlX3Rlc3RfcmVj
dXJzaW9uX3RyeWxvY2svdW5sb2NrKCkKPiBwYWlyIHJlcXVpcmUgdGhlIHByZWVtcHRpb24gdG8g
YmUgZGlzYWJsZWQgYXMgJ0RvY3VtZW50YXRpb24vdHJhY2UvZnRyYWNlLXVzZXMucnN0Jwo+IGV4
cGxhaW5lZCwgYnV0IGN1cnJlbnRseSB0aGUgd29yayBpcyBkb25lIG91dHNpZGUgb2YgdGhlIGhl
bHBlcnMuCj4gCj4gUGF0Y2ggMS8yIHdpbGwgbWFrZSBzdXJlIHByZWVtcHRpb24gZGlzYWJsZWQg
YWZ0ZXIgdHJ5bG9jaygpIHN1Y2NlZWQsCj4gcGF0Y2ggMi8yIHdpbGwgZG8gc21wX3Byb2Nlc3Nv
cl9pZCgpIGNoZWNraW5nIGFmdGVyIHRyeWxvY2sgdG8gYWRkcmVzcyB0aGUKPiBpc3N1ZS4KPiAK
PiBNaWNoYWVsIFdhbmcgKDIpOgo+ICAgZnRyYWNlOiBkaXNhYmxlIHByZWVtcHRpb24gYmV0d2Vl
biBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jay91bmxvY2soKQo+ICAgZnRyYWNlOiBkbyBD
UFUgY2hlY2tpbmcgYWZ0ZXIgcHJlZW1wdGlvbiBkaXNhYmxlZAo+IAo+ICBhcmNoL2Nza3kva2Vy
bmVsL3Byb2Jlcy9mdHJhY2UuYyAgICAgfCAgMiAtLQo+ICBhcmNoL3BhcmlzYy9rZXJuZWwvZnRy
YWNlLmMgICAgICAgICAgfCAgMiAtLQo+ICBhcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMtZnRy
YWNlLmMgfCAgMiAtLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvZnRyYWNlLmMgICAgfCAg
MiAtLQo+ICBhcmNoL3g4Ni9rZXJuZWwva3Byb2Jlcy9mdHJhY2UuYyAgICAgfCAgMiAtLQo+ICBp
bmNsdWRlL2xpbnV4L3RyYWNlX3JlY3Vyc2lvbi5oICAgICAgfCAyMiArKysrKysrKysrKysrKysr
KysrKystCj4gIGtlcm5lbC9saXZlcGF0Y2gvcGF0Y2guYyAgICAgICAgICAgICB8ICA2IC0tLS0t
LQo+ICBrZXJuZWwvdHJhY2UvdHJhY2VfZXZlbnRfcGVyZi5jICAgICAgfCAgNiArKystLS0KPiAg
a2VybmVsL3RyYWNlL3RyYWNlX2Z1bmN0aW9ucy5jICAgICAgIHwgIDUgLS0tLS0KPiAgOSBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
