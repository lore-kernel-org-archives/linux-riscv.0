Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3B0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 13:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B91361151
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 13:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B91361151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueIAOxx2jceKiltdUJSTKCNis1MPwJGoZaWeyXPfC9I=; b=F82f+ydTaDpfAa
	rPB2CPPtequmuuo6M8MkhuAbgZcrW7FbqkE618K9ztcdzwO6NxJG65B28Ck7ZqNlRlxl9UXNJqu/j
	rKarr0jJhbrwWDiR1iD2rYDAWNfHcdHg2rC1ULu13HJHyKnBLQjG+22kvt/K0PpY4wArXPRFloxIB
	dCK9TJTaxtN0rTm1La77bSqOYhZombE6PHp8Re3Jyn5Xo4vRKQjgOFmXFnJSKFhHW1bft+PnuvqPS
	GctIWapNxQg/l+DiwMtLq52izfvVyEE+7hF87lU4Jwbuf1jFI/0H6vGwr8Eo45jMDR1InxoX+myUm
	dNZBARgo8qbndq3KX7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbNNG-007HN1-G3; Fri, 15 Oct 2021 13:35:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNND-007HLg-LQ
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 13:35:49 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 667A761151;
 Fri, 15 Oct 2021 13:35:44 +0000 (UTC)
Date: Fri, 15 Oct 2021 09:35:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Cc: Petr Mladek <pmladek@suse.com>, Guo Ren <guoren@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <20211015093542.7d9a9671@gandalf.local.home>
In-Reply-To: <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
 <5e907ed3-806b-b0e5-518d-d2f3b265377f@linux.alibaba.com>
 <YWktujP6DcMnRIXT@alley>
 <3c87e825-e907-cba0-e95f-28878356fc71@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_063547_784523_4B689CC6 
X-CRM114-Status: GOOD (  22.07  )
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

T24gRnJpLCAxNSBPY3QgMjAyMSAxNzoxMjoyNiArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gTWF5YmUgdGFrZSBzb21lIGV4YW1wbGUgd291bGQgYmUg
ZWFzaWVyIHRvIHVuZGVyc3RhbmQuLi4KPiAKPiBDdXJyZW50bHkgdGhlcmUgYXJlIHR3byB3YXkg
b2YgdXNpbmcgZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soKSwKPiBvbmUgd2l0aCBUUkFD
RV9GVFJBQ0VfWFhYIHdlIG1hcmsgYXMgQSwgb25lIHdpdGggVFJBQ0VfTElTVF9YWFggd2UgbWFy
awo+IGFzIEIsIHRoZW46Cj4gCj4gQSBmb2xsb3dlZCBieSBCIG9uIHNhbWUgY29udGV4dCBnb3Qg
Yml0ID4gMAo+IEIgZm9sbG93ZWQgYnkgQSBvbiBhbnkgY29udGV4dCBnb3QgYml0IDAKPiBBIGZv
bGxvd2VkIGJ5IEEgb24gc2FtZSBjb250ZXh0IGdvdCBiaXQgPiAwCj4gQSBmb2xsb3dlZCBieSBB
IGZvbGxvd2VkIGJ5IEEgb24gc2FtZSBjb250ZXh0IGdvdCBiaXQgLTEKPiBCIGZvbGxvd2VkIGJ5
IEIgb24gc2FtZSBjb250ZXh0IGdvdCBiaXQgPiAwCj4gQiBmb2xsb3dlZCBieSBCIGZvbGxvd2Vk
IGJ5IEIgb24gc2FtZSBjb250ZXh0IGdvdCBiaXQgLTEKPiAKPiBJZiB3ZSBnZXQgcmlkIG9mIHRo
ZSBUUkFDRV9UUkFOU0lUSU9OX0JJVCB3aGljaCBhbGxvd2VkIHJlY3Vyc2lvbiBmb3IKPiBvbmV0
aW1lLCB0aGVuIGl0IHdvdWxkIGJlOgoKV2UgY2FuJ3QgZ2V0IHJpZCBvZiB0aGUgdHJhbnNpdGlv
biBiaXQuIEl0J3MgdGhlcmUgdG8gZml4IGEgYnVnLiBPciBhdApsZWFzdCB1bnRpbCB3ZSBmaW5p
c2ggdGhlICJub2luc3QiIGlzc3VlIHdoaWNoIG1heSBiZSB0cnVlIG5vdz8gSSBoYXZlIHRvCmdv
IHJldmlzaXQgaXQuCgpUaGUgcmVhc29uIGZvciB0aGUgdHJhbnNpdGlvbiBiaXQsIGlzIGJlY2F1
c2Ugd2Ugd2VyZSBkcm9wcGluZyBmdW5jdGlvbgp0cmFjZXMsIHRoYXQgcGVvcGxlIHJlbGllZCBv
biBiZWluZyB0aGVyZS4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUKcmVjdXJzaW9uIHByb3RlY3Rp
b24gYWxsb3dzIGZvciBuZXN0ZWQgY29udGV4dC4gVGhhdCBpcywgaXQgd2lsbCBub3QgZGV0ZWN0
CnJlY3Vyc2lvbiBpZiB3ZSBhbiBpbnRlcnJ1cHQgdHJpZ2dlcnMgZHVyaW5nIGEgdHJhY2UgKHdo
aWxlIHRoZSByZWN1cnNpb24KbG9jayBpcyBoZWxkKSBhbmQgdGhlbiB0aGF0IGludGVycnVwdCBk
b2VzIGEgdHJhY2UuIEl0IGlzIGFsbG93ZWQgdG8gY2FsbAp0aGUgZnRyYWNlX3Rlc3RfcmVjdXJz
aW9uX3RyeWxvY2soKSBhZ2Fpbi4KCkJ1dCwgd2hhdCBoYXBwZW5zIGlmIHRoZSB0cmFjZSBvY2N1
cnMgYWZ0ZXIgdGhlIGludGVycnVwdCB0cmlnZ2VycywgYnV0CmJlZm9yZSB0aGUgcHJlZW1wdF9j
b3VudCBzdGF0ZXMgdGhhdCB3ZSBhcmUgbm93IGluIGludGVycnVwdCBjb250ZXh0PyBBcwpwcmVl
bXB0X2NvdW50IGlzIHVzZWQgYnkgdGhpcyBjb2RlIHRvIGRldGVybWluZSB3aGF0IGNvbnRleHQg
d2UgYXJlIGluLCBpZgphIHRyYWNlIGhhcHBlbnMgaW4gdGhpcyAidHJhbnNpdGlvbiIgc3RhdGUs
IHdpdGhvdXQgdGhlIHRyYW5zaXRpb24gYml0LCBhCnJlY3Vyc2lvbiBpcyBkZXRlY3RlZCAoZmFs
c2UgcG9zaXRpdmUpIGFuZCB0aGUgZXZlbnQgaXMgZHJvcHBlZC4gUGVvcGxlIGFyZQp0aGVuIGNv
bmZ1c2VkIG9uIGhvdyBhbiBpbnRlcnJ1cHQgaGFwcGVuZWQsIGJ1dCB0aGUgZW50cnkgb2YgdGhl
IGludGVycnVwdApuZXZlciB0cmlnZ2VyZWQgKGFjY29yZGluZyB0byB0aGUgdHJhY2UpLgoKVGhl
IHRyYW5zaXRpb24gYml0IGFsbG93cyBvbmUgbGV2ZWwgb2YgcmVjdXJzaW9uIHRvIGhhbmRsZSB0
aGlzIGNhc2UuCgpUaGUgIm5vaW5zdCIgd29yayBtYXkgYWxzbyByZW1vdmUgYWxsIGxvY2F0aW9u
cyB0aGF0IGNhbiBiZSB0cmFjZWQgYmVmb3JlCnRoZSBjb250ZXh0IGlzIHVwZGF0ZWQuIEkgbmVl
ZCB0byBzZWUgaWYgdGhhdCBpcyBub3cgdGhlIGNhc2UsIGFuZCBpZiBpdAppcywgd2UgY2FuIHJl
bW92ZSB0aGUgdHJhbnNpdGlvbiBiaXQuCgpUaGlzIGlzIG5vdCB0aGUgZGVzaWduIGlzc3VlIEkg
bWVudGlvbmVkIGVhcmxpZXIuIEknbSBzdGlsbCB3b3JraW5nIG9uIHRoYXQKb25lLgoKLS0gU3Rl
dmUKCgo+IAo+IEEgZm9sbG93ZWQgYnkgQiBvbiBzYW1lIGNvbnRleHQgZ290IGJpdCA+IDAKPiBC
IGZvbGxvd2VkIGJ5IEEgb24gYW55IGNvbnRleHQgZ290IGJpdCAwCj4gQSBmb2xsb3dlZCBieSBB
IG9uIHNhbWUgY29udGV4dCBnb3QgYml0IC0xCj4gQiBmb2xsb3dlZCBieSBCIG9uIHNhbWUgY29u
dGV4dCBnb3QgYml0IC0xCj4gCj4gU28gYXMgbG9uZyBhcyBubyBjb250aW51b3VzbHkgQUFBIGl0
J3Mgc2FmZT8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
