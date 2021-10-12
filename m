Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF3AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96C4A61039
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96C4A61039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2ryQGagpPCdqiIaKM5BD4Ft0lWocHHZvqKiBPHJ6qw=; b=zVH2DaBFivDBUz
	2M1yibwENomZZ4QawafzHbJ0bE45O3NxdE9a235EIVEH7vdwfJxlE/4ecHeqViJ8+QqPRIgsoYwte
	9r3web0k2aUqtKRSQgu48jmZ3X7FAwHAeAcaNrKpCmg4FsEU31esf0YtVuu9gqfShpPzdH1oiKQaH
	CF5YHlUgOrtPPgLfX7qgOH9ZEmwbAziHZvdY9Oyujkhh70jPHJd2IUlmbjB7FgXu/pvFxuXrXfZhY
	4aqlh2U7EdVXA5Zh/4zGrTG2F3WKAnj8IOfDBN71elW+o5MbGe65jEp/N7AWfUUMlGXHjkL5KA0GU
	MUI0NdXI2dq+BsC2Ab9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maH86-00Cmmu-Ko; Tue, 12 Oct 2021 12:43:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maH83-00CmlS-QE
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 12:43:37 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A316660E97;
 Tue, 12 Oct 2021 12:43:32 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:43:31 -0400
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
Message-ID: <20211012084331.06b8dd23@gandalf.local.home>
In-Reply-To: <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_054335_893947_F36C7377 
X-CRM114-Status: GOOD (  15.53  )
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
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gLS0tIGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNp
b24uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvdHJhY2VfcmVjdXJzaW9uLmgKPiBAQCAtMjE0LDcg
KzIxNCwxNCBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdHJhY2VfY2xlYXJfcmVjdXJz
aW9uKGludCBiaXQpCj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGZ0cmFjZV90ZXN0X3Jl
Y3Vyc2lvbl90cnlsb2NrKHVuc2lnbmVkIGxvbmcgaXAsCj4gIAkJCQkJCQkgdW5zaWduZWQgbG9u
ZyBwYXJlbnRfaXApCj4gIHsKPiAtCXJldHVybiB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9u
KGlwLCBwYXJlbnRfaXAsIFRSQUNFX0ZUUkFDRV9TVEFSVCwgVFJBQ0VfRlRSQUNFX01BWCk7Cj4g
KwlpbnQgYml0Owo+ICsKPiArCXByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7CgpUaGUgcmVjdXJz
aW9uIHRlc3QgZG9lcyBub3QgcmVxdWlyZSBwcmVlbXB0aW9uIGRpc2FibGVkLCBpdCB1c2VzIHRo
ZSB0YXNrCnN0cnVjdCwgbm90IHBlcl9jcHUgdmFyaWFibGVzLCBzbyB5b3Ugc2hvdWxkIG5vdCBk
aXNhYmxlIGl0IGJlZm9yZSB0aGUgdGVzdC4KCgliaXQgPSB0cmFjZV90ZXN0X2FuZF9zZXRfcmVj
dXJzaW9uKGlwLCBwYXJlbnRfaXAsIFRSQUNFX0ZUUkFDRV9TVEFSVCwgVFJBQ0VfRlRSQUNFX01B
WCk7CglpZiAoYml0ID49IDApCgkJcHJlZW1wdF9kaXNhYmxlX25vdHJhY2UoKTsKCkFuZCBpZiB0
aGUgYml0IGlzIHplcm8sIGl0IG1lYW5zIGEgcmVjdXJzaW9uIGNoZWNrIHdhcyBhbHJlYWR5IGRv
bmUgYnkKYW5vdGhlciBjYWxsZXIgKGZ0cmFjZSBoYW5kbGVyIGRvZXMgdGhlIGNoZWNrLCBmb2xs
b3dlZCBieSBjYWxsaW5nIHBlcmYpLAphbmQgeW91IHJlYWxseSBkb24ndCBldmVuIG5lZWQgdG8g
ZGlzYWJsZSBwcmVlbXB0aW9uIGluIHRoYXQgY2FzZS4KCglpZiAoYml0ID4gMCkKCQlwcmVlbXB0
X2Rpc2FibGVfbm90cmFjZSgpOwoKQW5kIG9uIHRoZSB1bmxvY2ssIGhhdmU6Cgogc3RhdGljIF9f
YWx3YXlzX2lubGluZSB2b2lkIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soaW50IGJpdCkK
IHsKCWlmIChiaXQpCgkJcHJlZW1wdF9lbmFibGVfbm90cmFjZSgpOwogCXRyYWNlX2NsZWFyX3Jl
Y3Vyc2lvbihiaXQpOwogfQoKQnV0IG1heWJlIHRoYXQncyBvdmVyIG9wdGltaXppbmcgOy0pCgot
LSBTdGV2ZQoKCj4gKwliaXQgPSB0cmFjZV90ZXN0X2FuZF9zZXRfcmVjdXJzaW9uKGlwLCBwYXJl
bnRfaXAsIFRSQUNFX0ZUUkFDRV9TVEFSVCwgVFJBQ0VfRlRSQUNFX01BWCk7Cj4gKwlpZiAoYml0
IDwgMCkKPiArCQlwcmVlbXB0X2VuYWJsZV9ub3RyYWNlKCk7Cj4gKwo+ICsJcmV0dXJuIGJpdDsK
PiAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
