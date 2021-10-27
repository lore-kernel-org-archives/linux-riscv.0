Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B26CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 03:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B8161074
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 03:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2B8161074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M/XFLm4wTVqbNfpFwARc4miAhTP8dPhPy6zIAEzorgs=; b=l/gUn38Ly3bcWktETYKQtoKNY8
	KhJK6go146Kuazh2TUNJxbtS8ahqDxWdPL0Y0XZU6WQ4u9q8ho49lZ/nFGUBOZQpfELklGB2jFryf
	cMS8nUBwp+1QXzb56iumROOTote9wFXLZDj+ZUYbWWLPJPFP/7QReWpmI2XKVjzNSD//OK/MRycph
	GIUR3MkPv2s2BQCSYYLQJV26WNgOlFU8+eZ/pJj8Mp6ZAp886lx3Nl8p3cFH3IKAOqnmL35BWN7of
	2BfD13n4oIdD8TanR77hDrmIjCUFnQnddtzuQahDT4oCqxCJAl7jdnCK24T13bmDj3XbCHJI00/9M
	gtGuoQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfZJx-003iVV-Ll; Wed, 27 Oct 2021 03:09:45 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfZJp-003iTv-0b
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 03:09:38 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0UtqSqrG_1635304169; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtqSqrG_1635304169) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 11:09:31 +0800
Subject: Re: [PATCH v6 1/2] ftrace: disable preemption when recursion locked
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <df8e9b3e-504c-635d-4e92-99cdf9f05479@linux.alibaba.com>
 <78c95844-16b7-8904-b48d-3b2ccd76a352@linux.alibaba.com>
 <20211026225552.72a7ee79@rorschach.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <e8bb4220-4895-e55d-4aea-cdd265fdfd38@linux.alibaba.com>
Date: Wed, 27 Oct 2021 11:09:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026225552.72a7ee79@rorschach.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_200937_291170_C0CAF14E 
X-CRM114-Status: GOOD (  12.17  )
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

CgpPbiAyMDIxLzEwLzI3IOS4iuWNiDEwOjU1LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBX
ZWQsIDI3IE9jdCAyMDIxIDEwOjM0OjEzICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+ICsvKgo+PiArICogUHJlZW1wdGlvbiB3aWxsIGJlIGVu
YWJsZWQgKGlmIGl0IHdhcyBwcmV2aW91c2x5IGVuYWJsZWQpLgo+PiArICovCj4+ICBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKGludCBiaXQpCj4+ICB7
Cj4+ICsJV0FSTl9PTl9PTkNFKGJpdCA8IDApOwo+IAo+IENhbiB5b3Ugc2VuZCBhIHY3IHdpdGhv
dXQgdGhlIFdBUk5fT04uCj4gCj4gVGhpcyBpcyBhbiBleHRyZW1lbHkgaG90IHBhdGgsIGFuZCB0
aGlzIHdpbGwgY2F1c2Ugbm90aWNlYWJsZSBvdmVyaGVhZC4KPiAKPiBJZiBzb21ldGhpbmcgd2Vy
ZSB0byBjYWxsIHRoaXMgd2l0aCBiaXQgPCAwLCB0aGVuIGl0IHdvdWxkIGNyYXNoIGFuZAo+IGJ1
cm4gcmF0aGVyIHF1aWNrbHkuCgpJIHNlZSwgaWYgdGhlIHByb2JsZW0gd2lsbCBiZSBub3RpZmll
ZCBhbnl3YXkgdGhlbiBpdCdzIGZpbmUsIHY3IG9uIHRoZSB3YXkuCgpSZWdhcmRzLApNaWNoYWVs
IFdhbmcKCj4gCj4gLS0gU3RldmUKPiAKPiAKPj4gKwo+PiArCXByZWVtcHRfZW5hYmxlX25vdHJh
Y2UoKTsKPj4gIAliYXJyaWVyKCk7Cj4+ICAJdHJhY2VfcmVjdXJzaW9uX2NsZWFyKGJpdCk7Cj4+
ICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
