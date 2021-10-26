Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0D7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CA116109E
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CA116109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Nio4Skpm81YjFmbHfBE9Xev2exhkP9RjOBD+VMKVpM=; b=giVHiEr4HPCJ6Z
	ED/Cmmz+EKTR2XBlREdNPZsAfomNjVIKZx3rnGsV/wPkvdgNgt9k1PEYj9bIZUU8/xF5tG1s1sGwq
	xZZuy8NPT3S39WNOhcklm7WZwv07NhA72NZMorYysNysAjwLxqukuHzbQmFI9H9KnLkokrnLkxFp8
	JwgYCP1aZyxVEY/kX08PpvmvA7ctsPX3xLtGXQ+IoYdNWFfn17RB64KMnEjbN+DdrioeKcFjeRhr6
	dpiwKTXkTDJiGdrE6d4YqGZAT3OS51yoFjP/9FwEkBpbMJ2V52LciUTVUYp2UoPxNJpbnKFl4cZFp
	vU+Q4mNn6hr7ARNH3uCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfCQD-000UrX-Ew; Tue, 26 Oct 2021 02:42:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfCQ9-000UqZ-RW
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 02:42:39 +0000
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E000861074;
 Tue, 26 Oct 2021 02:42:34 +0000 (UTC)
Date: Mon, 25 Oct 2021 22:42:33 -0400
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
Subject: Re: [PATCH v4 0/2] fix & prevent the missing preemption disabling
Message-ID: <20211025224233.61b8e088@rorschach.local.home>
In-Reply-To: <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
 <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_194237_935961_72B22C4E 
X-CRM114-Status: GOOD (  17.92  )
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

T24gVHVlLCAyNiBPY3QgMjAyMSAxMDowOToxMiArMDgwMArnjovotIcgPHl1bi53YW5nQGxpbnV4
LmFsaWJhYmEuY29tPiB3cm90ZToKCj4gSnVzdCBhIHBpbmcsIHRvIHNlZSBpZiB0aGVyZSBhcmUg
YW55IG1vcmUgY29tbWVudHMgOi1QCgpJIGd1ZXNzIHlvdSBtaXNzZWQgd2hhdCB3ZW50IGludG8g
bWFpbmxpbmUgKGFuZCB5b3VyIG5hbWUgZm91bmQgYSBidWcKaW4gbXkgcGVybCBzY3JpcHQgZm9y
IGltcG9ydGluZyBwYXRjaGVzIDstKQoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MTEwMTkwOTEzNDQuNjU2MjkxOThAZ2FuZGFsZi5sb2NhbC5ob21lLwoKV2hpY2ggbWVhbnMgcGF0
Y2ggMSBuZWVkcyB0byBjaGFuZ2U6Cgo+ICsJLyoKPiArCSAqIERpc2FibGUgcHJlZW1wdGlvbiB0
byBmdWxmaWxsIHRoZSBwcm9taXNlLgo+ICsJICoKPiArCSAqIERvbid0IHdvcnJ5IGFib3V0IHRo
ZSBiaXQgMCBjYXNlcywgdGhleSBpbmRpY2F0ZQo+ICsJICogdGhlIGRpc2FibGluZyBiZWhhdmlv
dXIgaGFzIGFscmVhZHkgYmVlbiBkb25lIGJ5Cj4gKwkgKiBpbnRlcm5hbCBjYWxsIHByZXZpb3Vz
bHkuCj4gKwkgKi8KPiArCXByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7Cj4gKwo+ICAJcmV0dXJu
IGJpdCArIDE7Cj4gIH0KPiAKPiArLyoKPiArICogUHJlZW1wdGlvbiB3aWxsIGJlIGVuYWJsZWQg
KGlmIGl0IHdhcyBwcmV2aW91c2x5IGVuYWJsZWQpLgo+ICsgKi8KPiAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSB2b2lkIHRyYWNlX2NsZWFyX3JlY3Vyc2lvbihpbnQgYml0KQo+ICB7Cj4gIAlpZiAo
IWJpdCkKPiAgCQlyZXR1cm47Cj4gCj4gKwlpZiAoYml0ID4gMCkKPiArCQlwcmVlbXB0X2VuYWJs
ZV9ub3RyYWNlKCk7Cj4gKwoKV2hlcmUgdGhpcyB3b250IHdvcmsgYW55bW9yZS4KCk5lZWQgdG8g
cHJlZW1wdCBkaXNhYmxlIGFuZCBlbmFibGUgYWx3YXlzLgoKLS0gU3RldmUKCgo+ICAJYmFycmll
cigpOwo+ICAJYml0LS07Cj4gIAl0cmFjZV9yZWN1cnNpb25fY2xlYXIoYml0KTsKPiBAQCAtMjA5
LDcgKzIyNyw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFjZV9jbGVhcl9yZWN1
cnNpb24oaW50IGJpdCkKPiAgICogdHJhY2luZyByZWN1cnNlZCBpbiB0aGUgc2FtZSBjb250ZXh0
IChub3JtYWwgdnMgaW50ZXJydXB0KSwKPiAgICoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
