Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD60C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CA860F23
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6CA860F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+7eaxtO5u9SmZeWxZk7mhJvqLVd/Jq5z/hdEpMckhzk=; b=ygBIzBMMh9nQwraJsBGIdbPIum
	6Q1Qr8lMxFCRIBOZlMgCbrMfwfwpU083Ejt3WPaUQgTfDFOTpie8+FozKZ2ZWAiWg4K8iwJGdrmSg
	cHgVFUBGhFJD1C2r0+nm/GvchlOtu3dEQplRQX217vgasxRidNDjgGqLr//W8CX8OJurLAJmBSBAj
	hADlMwpa2hUorW9odQssemiszT88pi/fm9FWySfNByjeHZVB6/aLSGbPeEu+xDwDBNz98T2/vR5J1
	KwWUmx7jRrAhE8yIV6EF1UBfTTXhDCxfq8KcxY2NvCweTApO7QkAVpUKzfB9iAoHFkkFFhyGntk78
	glEVzs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maU81-00Ef1e-Is; Wed, 13 Oct 2021 02:36:25 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maU7y-00Ef0p-Ec
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 02:36:24 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Urdkedq_1634092576; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Urdkedq_1634092576) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 10:36:18 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Guo Ren <guoren@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
 <74090798-7d93-0713-982c-6f0247118d20@linux.alibaba.com>
 <20211012222758.1a029157@oasis.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <4b4be164-0095-90bc-a193-faa7100558d2@linux.alibaba.com>
Date: Wed, 13 Oct 2021 10:36:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012222758.1a029157@oasis.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_193622_678916_AC858916 
X-CRM114-Status: GOOD (  15.01  )
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

CgpPbiAyMDIxLzEwLzEzIOS4iuWNiDEwOjI3LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBX
ZWQsIDEzIE9jdCAyMDIxIDA5OjUwOjE3ICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+Pj4gLQlwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7Cj4+
Pj4gIAlmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGJpdCk7Cj4+Pj4gIH0gIAo+Pj4KPj4+
IEkgZG9uJ3QgbGlrZSB0aGlzIGNoYW5nZSBtdWNoLiBXZSBoYXZlIHByZWVtcHRfZGlzYWJsZSB0
aGVyZSBub3QgYmVjYXVzZSAKPj4+IG9mIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbiwgYnV0IGJlY2F1
c2Ugb2YgUkNVLiBmdHJhY2VfdGVzdF9yZWN1cnNpb24gd2FzIAo+Pj4gYWRkZWQgbGF0ZXIuIFll
cywgaXQgd291bGQgd29yayB3aXRoIHRoZSBjaGFuZ2UsIGJ1dCBpdCB3b3VsZCBhbHNvIGhpZGUg
Cj4+PiB0aGluZ3Mgd2hpY2ggc2hvdWxkIG5vdCBiZSBoaWRkZW4gaW4gbXkgb3Bpbmlvbi4gIAo+
Pgo+PiBOb3QgdmVyeSBzdXJlIGFib3V0IHRoZSBiYWNrZ3JvdXAgc3RvcmllcywgYnV0IGp1c3Qg
Zm91bmQgdGhpcyBpbgo+PiAnRG9jdW1lbnRhdGlvbi90cmFjZS9mdHJhY2UtdXNlcy5yc3QnOgo+
Pgo+PiAgIE5vdGUsIG9uIHN1Y2Nlc3MsCj4+ICAgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxv
Y2soKSB3aWxsIGRpc2FibGUgcHJlZW1wdGlvbiwgYW5kIHRoZQo+PiAgIGZ0cmFjZV90ZXN0X3Jl
Y3Vyc2lvbl91bmxvY2soKSB3aWxsIGVuYWJsZSBpdCBhZ2FpbiAoaWYgaXQgd2FzIHByZXZpb3Vz
bHkKPj4gICBlbmFibGVkKS4KPiAKPiBSaWdodCB0aGF0IHBhcnQgaXMgdG8gYmUgZml4ZWQgYnkg
d2hhdCB5b3UgYXJlIGFkZGluZyBoZXJlLgo+IAo+IFRoZSBwb2ludCB0aGF0IE1pcm9zbGF2IGlz
IGNvbXBsYWluaW5nIGFib3V0IGlzIHRoYXQgdGhlIHByZWVtcHRpb24KPiBkaXNhYmxpbmcgaXMg
c3BlY2lhbCBpbiB0aGlzIGNhc2UsIGFuZCBub3QganVzdCBmcm9tIHRoZSByZWN1cnNpb24KPiBw
b2ludCBvZiB2aWV3LCB3aGljaCBpcyB3aHkgdGhlIGNvbW1lbnQgaXMgc3RpbGwgcmVxdWlyZWQu
CgpNeSBiYWQuLi4gdGhlIHRpdGxlIGRvIGNvbmZ1c2luZyBwZW9wbGUsIHdpbGwgcmV3cml0ZSBp
dC4KClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiAKPiAtLSBTdGV2ZQo+IAo+IAo+Pgo+PiBTZWVt
cyBsaWtlIHRoaXMgbG9jayBwYWlyIHdhcyBzdXBwb3NlZCB0byB0YWtlIGNhcmUgdGhlIHByZWVt
dGlvbiBpdHNlbGY/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
