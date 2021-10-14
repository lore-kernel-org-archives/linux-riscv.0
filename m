Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4128AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 09:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FCC6109E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 09:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7FCC6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PnGo4+KnoKeE7EpEANzfbGxU1KbIr9HEoLCw1whK9R4=; b=ufwi2q7tboygZFuyczKojqf8HM
	jtp5rI6yj5DLffZ1SSzmd77uFs0VTs7pUOHq18y4vlijOpBBs11bqFnI8kqUB84oUE73cIyttszjf
	iTDVWl7/LkPLKig6uUaLlIcdXv7J7ZSGjWJ73JDSiIyJviV7YM6lHAFdtI7l/HjIY8DKG2RmFUPX5
	yUXUBSWZrm3SQZL2KXlb3RTDIWgVZGC8Fxb0nB1X5YZ1uM70sToEZ1WUGOfpFVq+Ozekn2lA+k7qa
	5cGi4PqcZxcmlzYeAVrCwVoZ69zlf6+ksN+js6D6Ids+zpLf7ugnAV4bUCqSVbaOEwucGagU3oICW
	0AqpGThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mawww-002LjT-FC; Thu, 14 Oct 2021 09:22:54 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mawwt-002Li4-AQ
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 09:22:53 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrnMW2X_1634203363; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrnMW2X_1634203363) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 14 Oct 2021 17:22:45 +0800
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
To: Miroslav Benes <mbenes@suse.cz>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
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
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <alpine.LSU.2.21.2110141108150.23710@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <d293a0d2-9864-3f92-a333-e29d919d5a02@linux.alibaba.com>
Date: Thu, 14 Oct 2021 17:22:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110141108150.23710@pobox.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_022251_574356_39850F12 
X-CRM114-Status: GOOD (  15.93  )
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

CgpPbiAyMDIxLzEwLzE0IOS4i+WNiDU6MTMsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+PiBkaWZm
IC0tZ2l0IGEva2VybmVsL2xpdmVwYXRjaC9wYXRjaC5jIGIva2VybmVsL2xpdmVwYXRjaC9wYXRj
aC5jCj4+IGluZGV4IGU4MDI5YWUuLmI4ZDc1ZmIgMTAwNjQ0Cj4+IC0tLSBhL2tlcm5lbC9saXZl
cGF0Y2gvcGF0Y2guYwo+PiArKysgYi9rZXJuZWwvbGl2ZXBhdGNoL3BhdGNoLmMKPj4gQEAgLTQ5
LDE0ICs0OSwxNiBAQCBzdGF0aWMgdm9pZCBub3RyYWNlIGtscF9mdHJhY2VfaGFuZGxlcih1bnNp
Z25lZCBsb25nIGlwLAo+Pgo+PiAgCW9wcyA9IGNvbnRhaW5lcl9vZihmb3BzLCBzdHJ1Y3Qga2xw
X29wcywgZm9wcyk7Cj4+Cj4+ICsJLyoKPj4gKwkgKgo+IAo+IFRoaXMgZW1wdHkgbGluZSBpcyBu
b3QgdXNlZnVsLgo+IAo+PiArCSAqIFRoZSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jaygp
IHdpbGwgZGlzYWJsZSBwcmVlbXB0aW9uLAo+PiArCSAqIHdoaWNoIGlzIHJlcXVpcmVkIGZvciB0
aGUgdmFyaWFudCBvZiBzeW5jaHJvbml6ZV9yY3UoKSB0aGF0IGlzCj4+ICsJICogdXNlZCB0byBh
bGxvdyBwYXRjaGluZyBmdW5jdGlvbnMgd2hlcmUgUkNVIGlzIG5vdCB3YXRjaGluZy4KPj4gKwkg
KiBTZWUga2xwX3N5bmNocm9uaXplX3RyYW5zaXRpb24oKSBmb3IgbW9yZSBkZXRhaWxzLgo+PiAr
CSAqLwo+PiAgCWJpdCA9IGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKGlwLCBwYXJlbnRf
aXApOwo+PiAgCWlmIChXQVJOX09OX09OQ0UoYml0IDwgMCkpCj4+ICAJCXJldHVybjsKPj4gLQkv
Kgo+PiAtCSAqIEEgdmFyaWFudCBvZiBzeW5jaHJvbml6ZV9yY3UoKSBpcyB1c2VkIHRvIGFsbG93
IHBhdGNoaW5nIGZ1bmN0aW9ucwo+PiAtCSAqIHdoZXJlIFJDVSBpcyBub3Qgd2F0Y2hpbmcsIHNl
ZSBrbHBfc3luY2hyb25pemVfdHJhbnNpdGlvbigpLgo+PiAtCSAqLwo+PiAtCXByZWVtcHRfZGlz
YWJsZV9ub3RyYWNlKCk7Cj4+Cj4+ICAJZnVuYyA9IGxpc3RfZmlyc3Rfb3JfbnVsbF9yY3UoJm9w
cy0+ZnVuY19zdGFjaywgc3RydWN0IGtscF9mdW5jLAo+PiAgCQkJCSAgICAgIHN0YWNrX25vZGUp
Owo+PiBAQCAtMTIwLDcgKzEyMiw2IEBAIHN0YXRpYyB2b2lkIG5vdHJhY2Uga2xwX2Z0cmFjZV9o
YW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsCj4+ICAJa2xwX2FyY2hfc2V0X3BjKGZyZWdzLCAodW5z
aWduZWQgbG9uZylmdW5jLT5uZXdfZnVuYyk7Cj4+Cj4+ICB1bmxvY2s6Cj4+IC0JcHJlZW1wdF9l
bmFibGVfbm90cmFjZSgpOwo+PiAgCWZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soYml0KTsK
Pj4gIH0KPiAKPiBBY2tlZC1ieTogTWlyb3NsYXYgQmVuZXMgPG1iZW5lc0BzdXNlLmN6Pgo+IAo+
IGZvciB0aGUgbGl2ZXBhdGNoIHBhcnQgb2YgdGhlIHBhdGNoLgo+IAo+IEkgd291bGQgYWxzbyBh
c2sgeW91IG5vdCB0byBzdWJtaXQgbmV3IHZlcnNpb25zIHNvIG9mdGVuLCBzbyB0aGF0IHRoZSAK
PiBvdGhlciByZXZpZXdlcnMgaGF2ZSB0aW1lIHRvIGFjdHVhbGx5IHJldmlldyB0aGUgcGF0Y2gg
c2V0Lgo+IAo+IFF1b3RpbmcgZnJvbSBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLnJzdDoKPiAKPiAiV2FpdCBmb3IgYSBtaW5pbXVtIG9mIG9uZSB3ZWVrIGJlZm9yZSBy
ZXN1Ym1pdHRpbmcgb3IgcGluZ2luZyByZXZpZXdlcnMgLSAKPiBwb3NzaWJseSBsb25nZXIgZHVy
aW5nIGJ1c3kgdGltZXMgbGlrZSBtZXJnZSB3aW5kb3dzLiIKClRoYW5rcyBmb3IgdGhlIEFjayBh
bmQgc3VnZ2VzdGlvbiwgd2lsbCB0YWtlIGNhcmUgZnJvbSBub3cgb24gOi0pCgpSZWdhcmRzLApN
aWNoYWVsIFdhbmcKCj4gCj4gVGhhbmtzCj4gCj4gTWlyb3NsYXYKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
