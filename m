Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C446DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D01160F92
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D01160F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uY/VTxE+Glm4PK048PV9vV8VmSvC74XA0oUw0yTaVy4=; b=o6e6LS+PzQKMnR
	UlYUpYUbaEMu90DV9g1KLiDUSHKsYMoaCAOgZtPHlWpLQBe7VKmmdH7ujVNqLrrpDeoBJTXGh72md
	Vd7uUHnfe8zvVCPTZIDNRAJ18AbCz/cfvJBwCtTj6k122BI/JuhVLRWkuh4AX7c0q4A3vG2KfZjX9
	0aFn8LevAGXQtI0/UMboRtKpuiMkrioepWM4XTf6gwp+roLrkg3AG2/yLATwDT1MLWm+2sfOh4tQe
	E2wVlHlm+YWZcSLN6fNCeM6VOfkSecqVBoldPbiakgVGPH1ZJitbWd7ghzSZP28sYDLUKDnxt+jco
	y3i1b+oat302bo06bV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTzy-00EeCl-Rs; Wed, 13 Oct 2021 02:28:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTzv-00EeBA-FN
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 02:28:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17A2560F11;
 Wed, 13 Oct 2021 02:28:00 +0000 (UTC)
Date: Tue, 12 Oct 2021 22:27:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Guo Ren <guoren@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
Message-ID: <20211012222758.1a029157@oasis.local.home>
In-Reply-To: <74090798-7d93-0713-982c-6f0247118d20@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
 <74090798-7d93-0713-982c-6f0247118d20@linux.alibaba.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_192803_554185_08E69D75 
X-CRM114-Status: GOOD (  17.17  )
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

T24gV2VkLCAxMyBPY3QgMjAyMSAwOTo1MDoxNyArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gPj4gLQlwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7Cj4g
Pj4gIAlmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGJpdCk7Cj4gPj4gIH0gIAo+ID4gCj4g
PiBJIGRvbid0IGxpa2UgdGhpcyBjaGFuZ2UgbXVjaC4gV2UgaGF2ZSBwcmVlbXB0X2Rpc2FibGUg
dGhlcmUgbm90IGJlY2F1c2UgCj4gPiBvZiBmdHJhY2VfdGVzdF9yZWN1cnNpb24sIGJ1dCBiZWNh
dXNlIG9mIFJDVS4gZnRyYWNlX3Rlc3RfcmVjdXJzaW9uIHdhcyAKPiA+IGFkZGVkIGxhdGVyLiBZ
ZXMsIGl0IHdvdWxkIHdvcmsgd2l0aCB0aGUgY2hhbmdlLCBidXQgaXQgd291bGQgYWxzbyBoaWRl
IAo+ID4gdGhpbmdzIHdoaWNoIHNob3VsZCBub3QgYmUgaGlkZGVuIGluIG15IG9waW5pb24uICAK
PiAKPiBOb3QgdmVyeSBzdXJlIGFib3V0IHRoZSBiYWNrZ3JvdXAgc3RvcmllcywgYnV0IGp1c3Qg
Zm91bmQgdGhpcyBpbgo+ICdEb2N1bWVudGF0aW9uL3RyYWNlL2Z0cmFjZS11c2VzLnJzdCc6Cj4g
Cj4gICBOb3RlLCBvbiBzdWNjZXNzLAo+ICAgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2so
KSB3aWxsIGRpc2FibGUgcHJlZW1wdGlvbiwgYW5kIHRoZQo+ICAgZnRyYWNlX3Rlc3RfcmVjdXJz
aW9uX3VubG9jaygpIHdpbGwgZW5hYmxlIGl0IGFnYWluIChpZiBpdCB3YXMgcHJldmlvdXNseQo+
ICAgZW5hYmxlZCkuCgpSaWdodCB0aGF0IHBhcnQgaXMgdG8gYmUgZml4ZWQgYnkgd2hhdCB5b3Ug
YXJlIGFkZGluZyBoZXJlLgoKVGhlIHBvaW50IHRoYXQgTWlyb3NsYXYgaXMgY29tcGxhaW5pbmcg
YWJvdXQgaXMgdGhhdCB0aGUgcHJlZW1wdGlvbgpkaXNhYmxpbmcgaXMgc3BlY2lhbCBpbiB0aGlz
IGNhc2UsIGFuZCBub3QganVzdCBmcm9tIHRoZSByZWN1cnNpb24KcG9pbnQgb2Ygdmlldywgd2hp
Y2ggaXMgd2h5IHRoZSBjb21tZW50IGlzIHN0aWxsIHJlcXVpcmVkLgoKLS0gU3RldmUKCgo+IAo+
IFNlZW1zIGxpa2UgdGhpcyBsb2NrIHBhaXIgd2FzIHN1cHBvc2VkIHRvIHRha2UgY2FyZSB0aGUg
cHJlZW10aW9uIGl0c2VsZj8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
