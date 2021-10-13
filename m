Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730A9C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E55E60D42
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E55E60D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NAfIyloUXUdjL+I86r2yu0slVmM4eqd5UlLK8ujOYEA=; b=FUybumc1VS/lkjS3xqnZMsECrw
	0h1UYQzVGyWhK60UBHoPj9y7irVWf/3B25Ljy3k2tUZdceh9Gei8kjM/z2AZnOzPr66IAcfn+hb3p
	kGAnAAtkGmMcoh0oRnD2RYKrsmfzTM0BL304OqcNIMBM6V3ZS8GOamiLaAe3pAx6h5YVmp0/5yMII
	q5YXZ1HNsdJSfQDLyJk5+wiIgV5YXWTP9eq/Bs3E4eZyLtJ7YEEutXkKxogyx0ouId5hT10qq1HJE
	p+qY4x3/OdiurslRGaznRYbfKbd7V2T6TngVFmPOdsNhP5cOfIZgIIIyaG+CrLGz+tznpJ2D416sS
	8SZ8utAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTdd-00EcfS-Vq; Wed, 13 Oct 2021 02:05:02 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTda-00Ece6-ES
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 02:05:00 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdlKN._1634090692; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdlKN._1634090692) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 10:04:54 +0800
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Guo Ren <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <20211012084331.06b8dd23@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <1eab20c1-d69b-f94b-92ff-4329d0aff6a2@linux.alibaba.com>
Date: Wed, 13 Oct 2021 10:04:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012084331.06b8dd23@gandalf.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_190458_674890_7ED35C71 
X-CRM114-Status: GOOD (  18.52  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDg6NDMsIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+IE9uIFR1
ZSwgMTIgT2N0IDIwMjEgMTM6NDA6MDggKzA4MDAKPiDnjovotIcgPHl1bi53YW5nQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPiAKPj4gLS0tIGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNp
b24uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3RyYWNlX3JlY3Vyc2lvbi5oCj4+IEBAIC0yMTQs
NyArMjE0LDE0IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB0cmFjZV9jbGVhcl9yZWN1
cnNpb24oaW50IGJpdCkKPj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGZ0cmFjZV90ZXN0
X3JlY3Vyc2lvbl90cnlsb2NrKHVuc2lnbmVkIGxvbmcgaXAsCj4+ICAJCQkJCQkJIHVuc2lnbmVk
IGxvbmcgcGFyZW50X2lwKQo+PiAgewo+PiAtCXJldHVybiB0cmFjZV90ZXN0X2FuZF9zZXRfcmVj
dXJzaW9uKGlwLCBwYXJlbnRfaXAsIFRSQUNFX0ZUUkFDRV9TVEFSVCwgVFJBQ0VfRlRSQUNFX01B
WCk7Cj4+ICsJaW50IGJpdDsKPj4gKwo+PiArCXByZWVtcHRfZGlzYWJsZV9ub3RyYWNlKCk7Cj4g
Cj4gVGhlIHJlY3Vyc2lvbiB0ZXN0IGRvZXMgbm90IHJlcXVpcmUgcHJlZW1wdGlvbiBkaXNhYmxl
ZCwgaXQgdXNlcyB0aGUgdGFzawo+IHN0cnVjdCwgbm90IHBlcl9jcHUgdmFyaWFibGVzLCBzbyB5
b3Ugc2hvdWxkIG5vdCBkaXNhYmxlIGl0IGJlZm9yZSB0aGUgdGVzdC4KPiAKPiAJYml0ID0gdHJh
Y2VfdGVzdF9hbmRfc2V0X3JlY3Vyc2lvbihpcCwgcGFyZW50X2lwLCBUUkFDRV9GVFJBQ0VfU1RB
UlQsIFRSQUNFX0ZUUkFDRV9NQVgpOwo+IAlpZiAoYml0ID49IDApCj4gCQlwcmVlbXB0X2Rpc2Fi
bGVfbm90cmFjZSgpOwo+IAo+IEFuZCBpZiB0aGUgYml0IGlzIHplcm8sIGl0IG1lYW5zIGEgcmVj
dXJzaW9uIGNoZWNrIHdhcyBhbHJlYWR5IGRvbmUgYnkKPiBhbm90aGVyIGNhbGxlciAoZnRyYWNl
IGhhbmRsZXIgZG9lcyB0aGUgY2hlY2ssIGZvbGxvd2VkIGJ5IGNhbGxpbmcgcGVyZiksCj4gYW5k
IHlvdSByZWFsbHkgZG9uJ3QgZXZlbiBuZWVkIHRvIGRpc2FibGUgcHJlZW1wdGlvbiBpbiB0aGF0
IGNhc2UuCj4gCj4gCWlmIChiaXQgPiAwKQo+IAkJcHJlZW1wdF9kaXNhYmxlX25vdHJhY2UoKTsK
PiAKPiBBbmQgb24gdGhlIHVubG9jaywgaGF2ZToKPiAKPiAgc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSB2b2lkIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soaW50IGJpdCkKPiAgewo+IAlpZiAo
Yml0KQo+IAkJcHJlZW1wdF9lbmFibGVfbm90cmFjZSgpOwo+ICAJdHJhY2VfY2xlYXJfcmVjdXJz
aW9uKGJpdCk7Cj4gIH0KPiAKPiBCdXQgbWF5YmUgdGhhdCdzIG92ZXIgb3B0aW1pemluZyA7LSkK
Ckkgc2VlLCB3aGlsZSB0aGUgdXNlciBjYW4gc3RpbGwgY2hlY2sgc21wX3Byb2Nlc3Nvcl9pZCgp
IGFmdGVyIHRyeWxvY2sKcmV0dXJuIGJpdCAwLi4uCgpJIGd1ZXNzIFBldGVyJ3MgcG9pbnQgYXQg
dmVyeSBiZWdpbm5pbmcgaXMgdG8gcHJldmVudCBzdWNoIGNhc2VzLCBzaW5jZQprZXJuZWwgZm9y
IHByb2R1Y3Rpb24gd2lsbCBub3QgaGF2ZSBwcmVlbXB0aW9uIGRlYnVnIG9uLCBhbmQgc3VjaCBp
c3N1ZQp3b24ndCBnZXQgcmVwb3J0IGJ1dCBjb3VsZCBjYXVzZSB0cm91YmxlIHdoaWNoIHJlYWxs
eSBoYXJkIHRvIHRyYWNlIGRvd24KLCB3YXkgdG8gZWxpbWluYXRlIHN1Y2ggaXNzdWUgb25jZSBm
b3IgYWxsIHNvdW5kcyBhdHRyYWN0aXZlLCBpc24ndCBpdD8KClJlZ2FyZHMsCk1pY2hhZWwgV2Fu
ZwoKPiAKPiAtLSBTdGV2ZQo+IAo+IAo+PiArCWJpdCA9IHRyYWNlX3Rlc3RfYW5kX3NldF9yZWN1
cnNpb24oaXAsIHBhcmVudF9pcCwgVFJBQ0VfRlRSQUNFX1NUQVJULCBUUkFDRV9GVFJBQ0VfTUFY
KTsKPj4gKwlpZiAoYml0IDwgMCkKPj4gKwkJcHJlZW1wdF9lbmFibGVfbm90cmFjZSgpOwo+PiAr
Cj4+ICsJcmV0dXJuIGJpdDsKPj4gIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
