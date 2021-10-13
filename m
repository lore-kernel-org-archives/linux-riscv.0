Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFBEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA176101D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CA176101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OU9Mxn7auciFW5MOddpnjPoOPhbLg6DOLqUFetYoB+I=; b=nYvGsSX11EqsC5q39rCRIDmKYA
	LJKW9KqFZQ71CAbX9LXhxjMUFsLDTnTjcK7kCrG4zjtO2ikAMFsVZwvushWUJeqKtOBqBMskxqwe2
	7KRP8/gTaMTh87hwWz+FOaulRWJ8OQa/vXXOh988CCl0Hd/MyEg+GBrxY50AC08BZ4B+Kj50j7+9i
	sRH62cJqyqU/8CUrvifdTmwkeKO5Riw//rxatxcxbLdsA/A/nwyvoyhUyjNvFkV+7zEmG/xbuz54D
	5D0elPr3MxZn7y+P4SO8fjGA3Zs3uc1+6iY/i0DA5hNSMIUvH0JgXqYiLzRavx/xHgKWi51jg/rZp
	7HEo3atA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTLt-00EaiA-Tw; Wed, 13 Oct 2021 01:46:41 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTLp-00EagY-7Z
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:46:40 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdGZLQ_1634089590; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdGZLQ_1634089590) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:46:32 +0800
Subject: Re: [PATCH 2/2] ftrace: prevent preemption in
 perf_ftrace_function_call()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <7ec34e08-a357-58d6-2ce4-c7472d8b0381@linux.alibaba.com>
 <YWVvfBybqjKuifum@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <1193d016-ec4d-2b29-4d33-5a04ca85c14d@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:45:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWVvfBybqjKuifum@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_184637_456716_3C2971AE 
X-CRM114-Status: GOOD (  13.05  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDc6MjAsIFBldGVyIFppamxzdHJhIHdyb3RlOgo+IE9uIFR1
ZSwgT2N0IDEyLCAyMDIxIGF0IDAxOjQwOjMxUE0gKzA4MDAsIOeOi+i0hyB3cm90ZToKPiAKPj4g
ZGlmZiAtLWdpdCBhL2tlcm5lbC90cmFjZS90cmFjZV9ldmVudF9wZXJmLmMgYi9rZXJuZWwvdHJh
Y2UvdHJhY2VfZXZlbnRfcGVyZi5jCj4+IGluZGV4IDZhZWQxMGUuLjMzYzJmNzYgMTAwNjQ0Cj4+
IC0tLSBhL2tlcm5lbC90cmFjZS90cmFjZV9ldmVudF9wZXJmLmMKPj4gKysrIGIva2VybmVsL3Ry
YWNlL3RyYWNlX2V2ZW50X3BlcmYuYwo+PiBAQCAtNDQxLDEyICs0NDEsMTkgQEAgdm9pZCBwZXJm
X3RyYWNlX2J1Zl91cGRhdGUodm9pZCAqcmVjb3JkLCB1MTYgdHlwZSkKPj4gIAlpZiAoIXJjdV9p
c193YXRjaGluZygpKQo+PiAgCQlyZXR1cm47Cj4+Cj4+ICsJLyoKPj4gKwkgKiBQcmV2ZW50IENQ
VSBjaGFuZ2luZyBmcm9tIG5vdyBvbi4gcmN1IG11c3QKPj4gKwkgKiBiZSBpbiB3YXRjaGluZyBp
ZiB0aGUgdGFzayB3YXMgbWlncmF0ZWQgYW5kCj4+ICsJICogc2NoZWR1bGVkLgo+PiArCSAqLwo+
PiArCXByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7Cj4+ICsKPj4gIAlpZiAoKHVuc2lnbmVkIGxv
bmcpb3BzLT5wcml2YXRlICE9IHNtcF9wcm9jZXNzb3JfaWQoKSkKPj4gLQkJcmV0dXJuOwo+PiAr
CQlnb3RvIG91dDsKPj4KPj4gIAliaXQgPSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhp
cCwgcGFyZW50X2lwKTsKPj4gIAlpZiAoYml0IDwgMCkKPj4gLQkJcmV0dXJuOwo+PiArCQlnb3Rv
IG91dDsKPj4KPj4gIAlldmVudCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBwZXJmX2V2ZW50
LCBmdHJhY2Vfb3BzKTsKPj4KPiAKPiBUaGlzIHNlZW1zIHJhdGhlciBkYWZ0LCB3b3VsZG4ndCBp
dCBiZSBlYXNpZXIgdG8ganVzdCBwdXQgdGhhdCBjaGVjawo+IHVuZGVyIHRoZSByZWN1cnNpb24g
dGhpbmc/CgpJbiBjYXNlIGlmIHRoZSBjb25kaXRpb24gbWF0Y2hlZCwgZXh0cmEgbG9jay91bmxv
Y2sgd2lsbCBiZSBpbnRyb2R1Y2VkLApidXQgSSBndWVzcyB0aGF0J3MgYWNjZXB0YWJsZSBzaW5j
ZSB0aGlzIHNlZW1zIHVubGlrZWx5IHRvIGhhcHBlbiA6LVAKCldpbGwgbW92ZSB0aGUgY2hlY2sg
aW4gdjIuCgpSZWdhcmRzLApNaWNoYWVsIFdhbmcKCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
