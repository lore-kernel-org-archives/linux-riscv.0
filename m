Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B124AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:31:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5267960F92
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5267960F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCrhG1KVrBN6/bqdYdS8bsK6Qwvqwc+df07tscx0RHg=; b=p+gDc+6GcJFZQX
	uJJ8mVMhGbQw65czllUkhy8fiAYLOlxc8TcfwLGJwfjgA/+yih2fVpG1XCiyv2O9R5AoSqktFIGbD
	yH/xwNBV5aJ/2/U0MkgARubHYiyVTVI9KY+n0tbiTgspdZVfiEyTe8pwv1TGcqhqa08JllzgPno11
	oukUkNqY9n5w4rMG34X2Q9lDv0jCU6hUcnmRjms9RMh+WY6U+22gxBsoNMX8ggnUWU1md2GcdreDI
	4ti/5sness9jddD4nQk1TfiHthvlhMQtbrzCtcipjL3XWunnVwRbrcCACV05jdP/ir8j3Z3hIS4xl
	PfNi5i/HgIJrDQvvVTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maU2Z-00EeYr-Fo; Wed, 13 Oct 2021 02:30:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maU2W-00EeXk-Jf
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 02:30:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE40C6101D;
 Wed, 13 Oct 2021 02:30:40 +0000 (UTC)
Date: Tue, 12 Oct 2021 22:30:39 -0400
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
Message-ID: <20211012223039.78099c24@oasis.local.home>
In-Reply-To: <1eab20c1-d69b-f94b-92ff-4329d0aff6a2@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <20211012084331.06b8dd23@gandalf.local.home>
 <1eab20c1-d69b-f94b-92ff-4329d0aff6a2@linux.alibaba.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_193044_686705_E94FA8AA 
X-CRM114-Status: UNSURE (   8.15  )
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

T24gV2VkLCAxMyBPY3QgMjAyMSAxMDowNDo1MiArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gSSBzZWUsIHdoaWxlIHRoZSB1c2VyIGNhbiBzdGlsbCBj
aGVjayBzbXBfcHJvY2Vzc29yX2lkKCkgYWZ0ZXIgdHJ5bG9jawo+IHJldHVybiBiaXQgMC4uLgoK
QnV0IHByZWVtcHRpb24gd291bGQgaGF2ZSBhbHJlYWR5IGJlZW4gZGlzYWJsZWQuIFRoYXQncyBi
ZWNhdXNlIGEgYml0IDAKbWVhbnMgdGhhdCBhIHJlY3Vyc2lvbiBjaGVjayBoYXMgYWxyZWFkeSBi
ZWVuIG1hZGUgYnkgYSBwcmV2aW91cwpjYWxsZXIgYW5kIHRoaXMgb25lIGlzIG5lc3RlZCwgdGh1
cyBwcmVlbXB0aW9uIGlzIGFscmVhZHkgZGlzYWJsZWQuCklmIGJpdCBpcyAwLCB0aGVuIHByZWVt
cHRpb24gaGFkIGJldHRlciBiZSBkaXNhYmxlZCBhcyB3ZWxsLgoKLS0gU3RldmUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
