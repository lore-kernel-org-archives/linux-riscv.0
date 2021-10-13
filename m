Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E445C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 09:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB88560E74
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 09:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB88560E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y1cYw0VKsHL2IztmquUtDcC++p1avLs3kEqNRNbJO50=; b=loNfg0INUg1JXZzTSxsNeMTrpi
	ms4P0SBSk19JqeoJsKQXz4N6nAMfbANOXAGlT8Mba81SglN/Y9C35984mf9nkYGYOZQxFpm0uC/4T
	Be++ds77DHDiqCMtNwxJAfeC/z8F+82MQ6w7w0df2YspZMLPgJEZWOwmo/snFIjIzXNaKix/173dY
	Xi8vMpunSI2PW9hRgXLPE8yPODwlkaAr/wd8qQkc7EJmywrSlCByscqOHsmLNMENQnJ6m27/S/foG
	ydvSqiBk7VV2BoOISIsJ2Jo6VtxEfbea48OtYI/tFsjNeDRqKfDyEnZfkmj8wgGIeCCrJ4M3B0uzJ
	XPiEXPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mab19-00Frcj-9p; Wed, 13 Oct 2021 09:57:47 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZM8-00FVmx-Go
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 08:11:22 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R641e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrfoBuS_1634112670; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrfoBuS_1634112670) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 16:11:12 +0800
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
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
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
 <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <d5fbd49a-55c5-a9f5-6600-707c8d749312@linux.alibaba.com>
Date: Wed, 13 Oct 2021 16:11:10 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_011120_816477_BEC44202 
X-CRM114-Status: GOOD (  12.74  )
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

CgpPbiAyMDIxLzEwLzEzIOS4i+WNiDM6NTUsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNpb24uaCBiL2luY2x1ZGUvbGludXgv
dHJhY2VfcmVjdXJzaW9uLmgKPj4gaW5kZXggYTlmOWM1Ny4uMTAxZTFmYiAxMDA2NDQKPj4gLS0t
IGEvaW5jbHVkZS9saW51eC90cmFjZV9yZWN1cnNpb24uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4
L3RyYWNlX3JlY3Vyc2lvbi5oCj4+IEBAIC0yMDgsMTMgKzIwOCwyOSBAQCBzdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKGludCBiaXQpCj4+ICAgKiBVc2Ug
dGhpcyBmb3IgZnRyYWNlIGNhbGxiYWNrcy4gVGhpcyB3aWxsIGRldGVjdCBpZiB0aGUgZnVuY3Rp
b24KPj4gICAqIHRyYWNpbmcgcmVjdXJzZWQgaW4gdGhlIHNhbWUgY29udGV4dCAobm9ybWFsIHZz
IGludGVycnVwdCksCj4+ICAgKgo+PiArICogVGhlIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnls
b2NrKCkgd2lsbCBkaXNhYmxlIHByZWVtcHRpb24sCj4+ICsgKiB3aGljaCBpcyByZXF1aXJlZCBm
b3IgdGhlIHZhcmlhbnQgb2Ygc3luY2hyb25pemVfcmN1KCkgdGhhdCBpcwo+PiArICogdXNlZCB0
byBhbGxvdyBwYXRjaGluZyBmdW5jdGlvbnMgd2hlcmUgUkNVIGlzIG5vdCB3YXRjaGluZy4KPj4g
KyAqIFNlZSBrbHBfc3luY2hyb25pemVfdHJhbnNpdGlvbigpIGZvciBtb3JlIGRldGFpbHMuCj4+
ICsgKgo+IAo+IEkgdGhpbmsgdGhhdCB5b3UgbWlzdW5kZXJzdG9vZC4gU3RldmVuIHByb3Bvc2Vk
IHRvIHB1dCB0aGUgY29tbWVudCBiZWZvcmUgCj4gZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxv
Y2soKSBjYWxsIHNpdGUgaW4ga2xwX2Z0cmFjZV9oYW5kbGVyKCkuCgpPaCwgSSBzZWUuLi4gdGhh
bmtzIGZvciBwb2ludGluZyBvdXQgOi0pCgo+IAo+PiAgICogUmV0dXJuczogLTEgaWYgYSByZWN1
cnNpb24gaGFwcGVuZWQuCltzbmlwXQo+PiAgfQo+IAo+IFNpZGUgbm90ZS4uLiB0aGUgY29tbWVu
dCB3aWxsIGV2ZW50dWFsbHkgY29uZmxpY3Qgd2l0aCBwZXRlcnoncyAKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMTA5MjkxNTI0MjkuMTI1OTk3MjA2QGluZnJhZGVhZC5vcmcvLgoK
U3RldmVuLCB3b3VsZCB5b3UgbGlrZSB0byBzaGFyZSB5b3VyIG9waW5pb24gb24gdGhpcyBwYXRj
aD8KCklmIGtscF9zeW5jaHJvbml6ZV90cmFuc2l0aW9uKCkgd2lsbCBiZSByZW1vdmVkIGFueXdh
eSwgdGhlIGNvbW1lbnRzCndpbGwgYmUgbWVhbmluZ2xlc3MgYW5kIHdlIGNhbiBqdXN0IGRyb3Ag
aXQgOi1QCgpSZWdhcmRzLApNaWNoYWVsIFdhbmcKCgo+IAo+IE1pcm9zbGF2Cj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
