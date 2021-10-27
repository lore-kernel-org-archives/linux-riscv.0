Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E99CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE8E6103C
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 02:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE8E6103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y7UGw5IfXMT/smCRe4Ey9uAxRH3zWNfylChrOD8IGdc=; b=aBLY8dVtaMIUsfmoQuIAg+yvTY
	73IlyjwuIirwpb9Yv9cKQyFvEqWoozvj8Zt4kb2Brd4PPRRwi++j+kgUb30eGVOzInoJM1D/DluBr
	1U+nzmosGVznuVRTBUhQN8PNrNgKGzOH3GDuMMQ72D5Qmq82cJrQYn9FKSeyp+akdEAzLu9UKEFBD
	/iaDIm+IDhICI3TytgPjtkXVkvudxUzM0HHRS3U1/j0H2cAstII9kPBe0CLTYzJA6T8vhCxaSqjIS
	dw24WE4oJ3UxkkjDEjz31HjHSBYD9jfTkAS23c2RrFNJeJj1VRGpCD8OpuIFmG0LkkQz331fL1Iyq
	fc3lHI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYgS-003cGm-5G; Wed, 27 Oct 2021 02:28:56 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYgO-003cEX-S4
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 02:28:54 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=30; SR=0; TI=SMTPD_---0Utq-lV5_1635301725; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Utq-lV5_1635301725) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 27 Oct 2021 10:28:47 +0800
Subject: Re: [PATCH v5 1/2] ftrace: disable preemption when recursion locked
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Guo Ren <guoren@kernel.org>,
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
 <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
 <18ba2a71-e12d-33f7-63fe-2857b2db022c@linux.alibaba.com>
 <20211026080117.366137a5@gandalf.local.home>
 <3d897161-7b74-944a-f2a0-07311436fbd9@linux.alibaba.com>
 <20211026222600.7899126f@rorschach.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <f1bea3e5-005a-3109-d95c-d754530baeb2@linux.alibaba.com>
Date: Wed, 27 Oct 2021 10:28:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211026222600.7899126f@rorschach.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_192853_082084_6CF86597 
X-CRM114-Status: GOOD (  10.81  )
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

CgpPbiAyMDIxLzEwLzI3IOS4iuWNiDEwOjI2LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBPbiBX
ZWQsIDI3IE9jdCAyMDIxIDA5OjU0OjEzICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+IE15IGFwb2xvZ2l6ZSBmb3IgdGhlIHN0dXBpZCBjb21t
ZW50cy4uLiBJJ2xsIHNlbmQgYSB2NiBmb3IgdGhpcyBwYXRjaAo+PiBvbmx5IHRvIGZpeCB0aGF0
LCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBpcyBub3QgYSBnb29kIHdheSB0byBmaXgKPj4g
ZmV3IGxpbmVzIG9mIGNvbW1lbnRzLgo+IAo+IEFjdHVhbGx5LCBwbGVhc2UgcmVzZW5kIGJvdGgg
cGF0Y2hlcywgYXMgYSBuZXcgcGF0Y2ggc2V0LCBvbiBpdHMgb3duIHRocmVhZC4KPiAKPiBKdXN0
IHJlcGx5aW5nIGhlcmUgd29uJ3QgdHJpZ2dlciBteSBwYXRjaHdvcmsgc2NyaXB0cy4KPiAKPiBB
bmQgYWxzbywgaWYgeW91IGRvbid0IGluY2x1ZGUgdGhlIG90aGVyIHBhdGNoLCB0aGUgc2NyaXB0
cyB3aWxsIGRyb3AKPiBpdC4KCkdvdCBpdH4KClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKPiAKPiBU
aGFua3MsCj4gCj4gLS0gU3RldmUKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
