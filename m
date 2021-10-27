Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037CCC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A125610C7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A125610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sd3oJ/WMFkPVVxAyiSJT+PdRpVtwt4vhXVlTJXddiCQ=; b=x3HeAHyl8cQtJg
	boRaSTJildKj8G8M/SENYlkHRJ0Tl/LvU+qOeL1UXmki9PyCU6Ld0o8f7fKB6i0PhsYt/HH+axk0J
	TFfvXVJonHoiqncbm2NU6a1JT8pO2xoMEW1kBd5KP5KDFDVzO3XoDRu4LzB21Ko0FkPQwL30qCv6z
	HvTpKo6odvl4ysDPdF1H1JftxaUuuV2FkeyG7MtDHoMEDySv4CSh92iFRgBRHOOeJH5747elZrbxW
	z8BMoueCbNdpBGCPnG9uaJbN8OlFck5KX8/cgPhnVHyO5FcfE/hqBNyuVs0iiwbmo/e9SE95sG6/E
	FvwaHu0Df9dVjuobpFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZ6d-003hCq-Ku; Wed, 27 Oct 2021 02:55:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZ6b-003hB9-30
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 02:55:58 +0000
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03365610C7;
 Wed, 27 Oct 2021 02:55:53 +0000 (UTC)
Date: Tue, 26 Oct 2021 22:55:52 -0400
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
 <joe.lawrence@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v6 1/2] ftrace: disable preemption when recursion locked
Message-ID: <20211026225552.72a7ee79@rorschach.local.home>
In-Reply-To: <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
References: <df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com>
 <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_195557_176974_4C88532D 
X-CRM114-Status: GOOD (  10.55  )
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

T24gV2VkLCAyNyBPY3QgMjAyMSAxMDozNDoxMyArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gKy8qCj4gKyAqIFByZWVtcHRpb24gd2lsbCBiZSBlbmFi
bGVkIChpZiBpdCB3YXMgcHJldmlvdXNseSBlbmFibGVkKS4KPiArICovCj4gIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgdm9pZCB0cmFjZV9jbGVhcl9yZWN1cnNpb24oaW50IGJpdCkKPiAgewo+ICsJ
V0FSTl9PTl9PTkNFKGJpdCA8IDApOwoKQ2FuIHlvdSBzZW5kIGEgdjcgd2l0aG91dCB0aGUgV0FS
Tl9PTi4KClRoaXMgaXMgYW4gZXh0cmVtZWx5IGhvdCBwYXRoLCBhbmQgdGhpcyB3aWxsIGNhdXNl
IG5vdGljZWFibGUgb3ZlcmhlYWQuCgpJZiBzb21ldGhpbmcgd2VyZSB0byBjYWxsIHRoaXMgd2l0
aCBiaXQgPCAwLCB0aGVuIGl0IHdvdWxkIGNyYXNoIGFuZApidXJuIHJhdGhlciBxdWlja2x5LgoK
LS0gU3RldmUKCgo+ICsKPiArCXByZWVtcHRfZW5hYmxlX25vdHJhY2UoKTsKPiAgCWJhcnJpZXIo
KTsKPiAgCXRyYWNlX3JlY3Vyc2lvbl9jbGVhcihiaXQpOwo+ICB9CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
