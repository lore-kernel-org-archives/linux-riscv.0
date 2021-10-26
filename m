Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB20C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:11:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC396103C
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 02:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EC396103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i+U6MFqBm/ggGAwcYBMbR0T0WT17qL3KYWlVkiiO4Xk=; b=EhaD8Kf1+1b3hU/J8tXjKDkW3M
	19j7E2A8HMsjKKcPbyk1LdotLK42LNbWm49S5BON/V1cTJdUJNDNTJ1wCI9KIuDACP2co6CIE7po+
	P9SI0zBk8nDlDNoO1tBgDcjLl0Wi3F6ycNVfGYXusXZLhR2m5NfX9/3goc525aYUCgrUmIdCV60FC
	6q0oIDE92xWXjQzqA2acxTb7y8iQHbPMCI9scHCByFFXrF3J8Bh6Ab9TitonJk5zoub+HR4AyhzGI
	q/fHrM2DT7es50IWwkTh7TKg3fnYLz2cZjhM6hsv0vKAnsjPZYtLa2oKNYCoNI4Nz1sXblmTi8r7S
	BB6+ronQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfBvp-000TTi-Jt; Tue, 26 Oct 2021 02:11:17 +0000
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfBvl-000TSh-HC
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 02:11:15 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UtjMs7q_1635214264; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UtjMs7q_1635214264) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Oct 2021 10:11:06 +0800
Subject: Re: [PATCH v4 0/2] fix & prevent the missing preemption disabling
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
References: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
Message-ID: <71c21f78-9c44-fdb2-f8e2-d8544b3421bd@linux.alibaba.com>
Date: Tue, 26 Oct 2021 10:09:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <32a36348-69ee-6464-390c-3a8d6e9d2b53@linux.alibaba.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_191113_762243_362C929D 
X-CRM114-Status: GOOD (  15.29  )
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

SnVzdCBhIHBpbmcsIHRvIHNlZSBpZiB0aGVyZSBhcmUgYW55IG1vcmUgY29tbWVudHMgOi1QCgpS
ZWdhcmRzLApNaWNoYWVsIFdhbmcKCk9uIDIwMjEvMTAvMTgg5LiK5Y2IMTE6MzgsIOeOi+i0hyB3
cm90ZToKPiBUaGUgdGVzdGluZyBzaG93IHRoYXQgcGVyZl9mdHJhY2VfZnVuY3Rpb25fY2FsbCgp
IGFyZSB1c2luZyBzbXBfcHJvY2Vzc29yX2lkKCkKPiB3aXRoIHByZWVtcHRpb24gZW5hYmxlZCwg
YWxsIHRoZSBjaGVja2luZyBvbiBDUFUgY291bGQgYmUgd3JvbmcgYWZ0ZXIgcHJlZW1wdGlvbi4K
PiAKPiBBcyBQZXRlciBwb2ludCBvdXQsIHRoZSBzZWN0aW9uIGJldHdlZW4gZnRyYWNlX3Rlc3Rf
cmVjdXJzaW9uX3RyeWxvY2svdW5sb2NrKCkKPiBwYWlyIHJlcXVpcmUgdGhlIHByZWVtcHRpb24g
dG8gYmUgZGlzYWJsZWQgYXMgJ0RvY3VtZW50YXRpb24vdHJhY2UvZnRyYWNlLXVzZXMucnN0Jwo+
IGV4cGxhaW5lZCwgYnV0IGN1cnJlbnRseSB0aGUgd29yayBpcyBkb25lIG91dHNpZGUgb2YgdGhl
IGhlbHBlcnMuCj4gCj4gQW5kIHNpbmNlIHRoZSBpbnRlcm5hbCB1c2luZyBvZiB0cmFjZV90ZXN0
X2FuZF9zZXRfcmVjdXJzaW9uKCkKPiBhbmQgdHJhY2VfY2xlYXJfcmVjdXJzaW9uKCkgYWxzbyBy
ZXF1aXJlIHByZWVtcHRpb24gdG8gYmUgZGlzYWJsZWQsIHdlCj4gY2FuIGp1c3QgbWVyZ2UgdGhl
IGxvZ2ljYWwgdG9nZXRoZXIuCj4gCj4gUGF0Y2ggMS8yIHdpbGwgbWFrZSBzdXJlIHByZWVtcHRp
b24gZGlzYWJsZWQgd2hlbiByZWN1cnNpb24gbG9jayBzdWNjZWVkLAo+IHBhdGNoIDIvMiB3aWxs
IGRvIHNtcF9wcm9jZXNzb3JfaWQoKSBjaGVja2luZyBhZnRlciB0cnlsb2NrKCkgdG8gYWRkcmVz
cyB0aGUKPiBpc3N1ZS4KPiAKPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzhjN2Rl
NDZkLTk4NjktYWE1ZS0yYmI5LTVkYmMyZWRhMzk1ZUBsaW51eC5hbGliYWJhLmNvbS8KPiB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2IxZDdmZTQzLWNlODQtMGVkNy0zMmY3LWVhMWQx
MmQwYjcxNkBsaW51eC5hbGliYWJhLmNvbS8KPiB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzYwOWI1NjVhLWVkNmUtYTFkYS1mMDI1LTE2NjY5MWI1ZDk5NEBsaW51eC5hbGliYWJhLmNv
bS8KPiAKPiBNaWNoYWVsIFdhbmcgKDIpOgo+ICAgZnRyYWNlOiBkaXNhYmxlIHByZWVtcHRpb24g
d2hlbiByZWN1cnNpb24gbG9ja2VkCj4gICBmdHJhY2U6IGRvIENQVSBjaGVja2luZyBhZnRlciBw
cmVlbXB0aW9uIGRpc2FibGVkCj4gCj4gIGFyY2gvY3NreS9rZXJuZWwvcHJvYmVzL2Z0cmFjZS5j
ICAgICB8ICAyIC0tCj4gIGFyY2gvcGFyaXNjL2tlcm5lbC9mdHJhY2UuYyAgICAgICAgICB8ICAy
IC0tCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jlcy1mdHJhY2UuYyB8ICAyIC0tCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9mdHJhY2UuYyAgICB8ICAyIC0tCj4gIGFyY2gveDg2L2tl
cm5lbC9rcHJvYmVzL2Z0cmFjZS5jICAgICB8ICAyIC0tCj4gIGluY2x1ZGUvbGludXgvdHJhY2Vf
cmVjdXJzaW9uLmggICAgICB8IDIwICsrKysrKysrKysrKysrKysrKystCj4gIGtlcm5lbC9saXZl
cGF0Y2gvcGF0Y2guYyAgICAgICAgICAgICB8IDEzICsrKysrKystLS0tLS0KPiAga2VybmVsL3Ry
YWNlL2Z0cmFjZS5jICAgICAgICAgICAgICAgIHwgMTUgKysrKystLS0tLS0tLS0tCj4gIGtlcm5l
bC90cmFjZS90cmFjZV9ldmVudF9wZXJmLmMgICAgICB8ICA2ICsrKy0tLQo+ICBrZXJuZWwvdHJh
Y2UvdHJhY2VfZnVuY3Rpb25zLmMgICAgICAgfCAgNSAtLS0tLQo+ICAxMCBmaWxlcyBjaGFuZ2Vk
LCAzNCBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
