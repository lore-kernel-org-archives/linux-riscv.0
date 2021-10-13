Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC454C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDE860041
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 02:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EDE860041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RCbiyvuzEACD5l7XmHXLsLXXlnHlKe8m2inIOuMzTHU=; b=TXpR4mehpGJtbjvSwmPcZgwift
	VDieNWTo0ZJ4j2Cf7ZQ+h73ZG0NKjqtddKKqRWPvfHWsH4bdQHaE1IB2qIHxHMeSgTxFlDdZGVu4s
	BvYIX3Cj/AxLkG0CQW6nTLoGCtvgZj7ajlTs3DH4yViTn4q6yyA67AFjk3hEp7z+LR9ccAZGZWhZs
	1mAs9/JkCp96Am88QjU3cBrZgQmJf4dWnUfJREAblvcBxEsjFXJ2iy7WliEPD8gJgd/aTKn0+4845
	jCUlMOha1dpAcWDDgYoVw5aDzjcNt+ARtrlvZZr1wARpGo6qlDgefpIDy/KfY5lotf9WzqV+1jTdx
	5pruSt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maUAA-00EfEn-GO; Wed, 13 Oct 2021 02:38:38 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maUA6-00EfDs-Ta
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 02:38:36 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Urdkez0_1634092708; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Urdkez0_1634092708) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 10:38:30 +0800
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
 <1eab20c1-d69b-f94b-92ff-4329d0aff6a2@linux.alibaba.com>
 <20211012223039.78099c24@oasis.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <40a6e16f-6335-c271-c91b-622c8d7f6521@linux.alibaba.com>
Date: Wed, 13 Oct 2021 10:38:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012223039.78099c24@oasis.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_193835_139522_0E6CAE2A 
X-CRM114-Status: GOOD (  10.82  )
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

CgpPbiAyMDIxLzEwLzEzIOS4iuWNiDEwOjMwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBX
ZWQsIDEzIE9jdCAyMDIxIDEwOjA0OjUyICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+IEkgc2VlLCB3aGlsZSB0aGUgdXNlciBjYW4gc3RpbGwg
Y2hlY2sgc21wX3Byb2Nlc3Nvcl9pZCgpIGFmdGVyIHRyeWxvY2sKPj4gcmV0dXJuIGJpdCAwLi4u
Cj4gCj4gQnV0IHByZWVtcHRpb24gd291bGQgaGF2ZSBhbHJlYWR5IGJlZW4gZGlzYWJsZWQuIFRo
YXQncyBiZWNhdXNlIGEgYml0IDAKPiBtZWFucyB0aGF0IGEgcmVjdXJzaW9uIGNoZWNrIGhhcyBh
bHJlYWR5IGJlZW4gbWFkZSBieSBhIHByZXZpb3VzCj4gY2FsbGVyIGFuZCB0aGlzIG9uZSBpcyBu
ZXN0ZWQsIHRodXMgcHJlZW1wdGlvbiBpcyBhbHJlYWR5IGRpc2FibGVkLgo+IElmIGJpdCBpcyAw
LCB0aGVuIHByZWVtcHRpb24gaGFkIGJldHRlciBiZSBkaXNhYmxlZCBhcyB3ZWxsLgoKVGhhbmtz
IGZvciB0aGUgZXhwbGFpbiwgbm93IEkgZ2V0IHlvdXIgcG9pbnQgOi0pCgpMZXQncyBtYWtlIGJp
dCAwIGFuIGV4ZW1wdGlvbiB0aGVuLgoKUmVnYXJkcywKTWljaGFlbCBXYW5nCgo+IAo+IC0tIFN0
ZXZlCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
