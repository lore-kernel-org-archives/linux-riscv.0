Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6B1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 05:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1522760EB6
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 05:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1522760EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZtESGGJP4R1QSSjlR8ySTZ1J7F+XHpe05WTP4ro59xY=; b=BtObdUaapoL4KkwdEaOB413kYf
	yNII9N+10fy6LKQ1gzmNU9PPVE64fa5PgZg9owwS1/jsOTgL/Q7mKnHwUv3N+6FcohA5FGUCieZPm
	gs30bkWTTqP7PZpgCQprG/064rfwZBSe7PUKU73Q4iON1BGTWGnidrGEvuzs0m9HMlk+OYSzG52yU
	VQVtGbgPVrUdfPOL1Ll2RPmYwfXv7O5Qpq8gRiBJU55An5ZzKqI/Aeic4lZa2Y0rRGjtaUVnfVfMm
	NfelgENVV7Z2rIR0W5MmKOLscCHzIcQxDJqsa7ArybDhyzf7vJTcHKT7w6PYABVEGSKNg6ps9b6hP
	scmfQXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAXv-00Bdyq-4x; Tue, 12 Oct 2021 05:41:51 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAXs-00Bdxz-Nk
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 05:41:50 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R351e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrXyKWV_1634017303; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrXyKWV_1634017303) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Oct 2021 13:41:45 +0800
Subject: Re: [PATCH 0/2] ftrace: make sure preemption disabled on recursion
 testing
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
To: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <e2acaa5f-772e-5414-d81e-6536a9dd59b4@linux.alibaba.com>
Date: Tue, 12 Oct 2021 13:41:43 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_224148_963201_87BD3BF8 
X-CRM114-Status: GOOD (  11.45  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDE6MzksIOeOi+i0hyB3cm90ZToKPiBUaGUgdGVzdGluZyBz
aG93IHRoYXQgcGVyZl9mdHJhY2VfZnVuY3Rpb25fY2FsbCgpIGFyZSB1c2luZwo+IHNtcF9wcm9j
ZXNzb3JfaWQoKSB3aXRoIHByZWVtcHRpb24gZW5hYmxlZCwgYWxsIHRoZSBjaGVja2luZwo+IG9u
IENQVSBjb3VsZCBiZSB3cm9uZyBhZnRlciBwcmVlbXB0aW9uLCBQQVRDSCAxLzIgd2lsbCBmaXgK
PiB0aGF0LgoKMi8yIGFjdHVhbGx5LgoKPiAKPiBCZXNpZGVzLCBhcyBQZXRlciBwb2ludCBvdXQs
IHRoZSB0ZXN0aW5nIG9mIHJlY3Vyc2lvbiB3aXRoaW4KPiB0aGUgc2VjdGlvbiBiZXR3ZWVuIGZ0
cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrKCkvX3VubG9jaygpCj4gcGFpciBhbHNvIG5lZWQg
dGhlIHByZWVtcHRpb24gZGlzYWJsZWQgYXMgdGhlIGRvY3VtZW50YXRpb24KPiBleHBsYWluZWQs
IFBBVENIIDIvMiB3aWxsIG1ha2Ugc3VyZSBvbiB0aGF0LgoKMS8yIGFjdHVhbGx5Li4uCgpSZWdh
cmRzLApNaWNoYWVsIFdhbmcKCj4gCj4gTWljaGFlbCBXYW5nICgyKToKPiAgIGZ0cmFjZTogZGlz
YWJsZSBwcmVlbXB0aW9uIG9uIHRoZSB0ZXN0aW5nIG9mIHJlY3Vyc2lvbgo+ICAgZnRyYWNlOiBw
cmV2ZW50IHByZWVtcHRpb24gaW4gcGVyZl9mdHJhY2VfZnVuY3Rpb25fY2FsbCgpCj4gCj4gIGFy
Y2gvY3NreS9rZXJuZWwvcHJvYmVzL2Z0cmFjZS5jICAgICB8ICAyIC0tCj4gIGFyY2gvcGFyaXNj
L2tlcm5lbC9mdHJhY2UuYyAgICAgICAgICB8ICAyIC0tCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwv
a3Byb2Jlcy1mdHJhY2UuYyB8ICAyIC0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9mdHJh
Y2UuYyAgICB8ICAyIC0tCj4gIGFyY2gveDg2L2tlcm5lbC9rcHJvYmVzL2Z0cmFjZS5jICAgICB8
ICAyIC0tCj4gIGluY2x1ZGUvbGludXgvdHJhY2VfcmVjdXJzaW9uLmggICAgICB8IDEwICsrKysr
KysrKy0KPiAga2VybmVsL2xpdmVwYXRjaC9wYXRjaC5jICAgICAgICAgICAgIHwgIDYgLS0tLS0t
Cj4gIGtlcm5lbC90cmFjZS90cmFjZV9ldmVudF9wZXJmLmMgICAgICB8IDE3ICsrKysrKysrKysr
KystLS0tCj4gIGtlcm5lbC90cmFjZS90cmFjZV9mdW5jdGlvbnMuYyAgICAgICB8ICA1IC0tLS0t
Cj4gIDkgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
