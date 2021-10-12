Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17709C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AAC60E74
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9AAC60E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIiLHFFoslt+be5Fq2OblcP9nwxAXnXWhDhaoDyW4K0=; b=b2HiRODKCavKpj
	179BC/qMcdfCyD6RNYhedwPP6f9R/v4w4HlF4epcR/DE7J1bAO3Lch0eE6+hpbiGSXFnirNFCGFKP
	QJfdraQG993hlreYNMxbx9vACgxexnHsvPDeRM15h750YEYpLLWSUqXjHGkJgk/n88cexqnmD6ejP
	MVkzAtg4LgWdTXIZ/xXxxGI/7fMXqQizKcvNtMubOb6Oil4wUE4mNflC/RIo68yR1Z92ptWAigweh
	c81HVlDwBtTNCmOLUQVGWuR0pNc2l96Db/ifs1cr3JebHAINoWuUsEVQmCjNCYMALl1QcPz7s3Wsu
	+lRksXO6rChd9tVOZakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maGit-00CkMA-2a; Tue, 12 Oct 2021 12:17:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maGir-00CkLQ-C8
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 12:17:34 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD5ED60E97;
 Tue, 12 Oct 2021 12:17:29 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:17:28 -0400
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
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
Message-ID: <20211012081728.5d357d6c@gandalf.local.home>
In-Reply-To: <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_051733_447914_D11ED7FA 
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

T24gVHVlLCAxMiBPY3QgMjAyMSAxMzo0MDowOCArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gQEAgLTUyLDExICs1Miw2IEBAIHN0YXRpYyB2b2lkIG5v
dHJhY2Uga2xwX2Z0cmFjZV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsCj4gIAliaXQgPSBmdHJh
Y2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsKPiAgCWlmIChXQVJOX09O
X09OQ0UoYml0IDwgMCkpCj4gIAkJcmV0dXJuOwo+IC0JLyoKPiAtCSAqIEEgdmFyaWFudCBvZiBz
eW5jaHJvbml6ZV9yY3UoKSBpcyB1c2VkIHRvIGFsbG93IHBhdGNoaW5nIGZ1bmN0aW9ucwo+IC0J
ICogd2hlcmUgUkNVIGlzIG5vdCB3YXRjaGluZywgc2VlIGtscF9zeW5jaHJvbml6ZV90cmFuc2l0
aW9uKCkuCj4gLQkgKi8KCkkgaGF2ZSB0byB0YWtlIGEgZGVlcGVyIGxvb2sgYXQgdGhpcyBwYXRj
aCBzZXQsIGJ1dCBkbyBub3QgcmVtb3ZlIHRoaXMKY29tbWVudCwgYXMgaXQgZXhwbGFpbnMgdGhl
IHByb3RlY3Rpb24gaGVyZSwgdGhhdCBpcyBub3Qgb2J2aW91cyB3aXRoIHRoZQpjaGFuZ2VzIHlv
dSBtYWRlLgoKLS0gU3RldmUKCgo+IC0JcHJlZW1wdF9kaXNhYmxlX25vdHJhY2UoKTsKPiAKPiAg
CWZ1bmMgPSBsaXN0X2ZpcnN0X29yX251bGxfcmN1KCZvcHMtPmZ1bmNfc3RhY2ssIHN0cnVjdCBr
bHBfZnVuYywKPiAgCQkJCSAgICAgIHN0YWNrX25vZGUpOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
