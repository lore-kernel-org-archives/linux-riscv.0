Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7870DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:33:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F9660D43
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 03:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35F9660D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qQvjSkxhN8T1y8HLSPFwNqMGAehhHn3TbxkEQ++kto8=; b=GcjUYb45eoqrJ0HOIC2t3l26+M
	nj+jrJTRT+VfXRcyWJdEYQx0g9Jy/1PGwMaLIvS7asYcfChD9VZwDRSDSpUDA8XrryQJ3+9ohe8Vu
	y+PFvH0IkWHbmPOnmT+HGU26emdCYMi9DWnvl3aNCPrm8HhitCCqX1xbEO/8Zzi/WJp7U9bfPhm6u
	6Rj0lwpPAK8cmdjTTuWiovhm0sK1939c9HFXEG+Sos+RXvuRzaFyonlnj6wl/P0meUmNazMo1y7t3
	nSM2uUfdpW0L4/QyCb+/tLw6GB0XhZEwdcM/jQjSyVlp75pM6eu/eAbXfcRsh5Zl8XUY373lbd0GA
	VnW+goIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maV1M-00Ekgj-07; Wed, 13 Oct 2021 03:33:36 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maV1I-00EkfZ-Tf
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 03:33:34 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0Ure8YWn_1634096007; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0Ure8YWn_1634096007) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 11:33:29 +0800
Subject: Re: [PATCH v2 0/2] fix & prevent the missing preemption disabling
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
 <1a8e8d73-b508-f90b-0d82-eb2da45a720e@linux.alibaba.com>
 <20211012232658.7dac3f43@oasis.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <69e9cf98-883c-0016-4b07-12afbf138094@linux.alibaba.com>
Date: Wed, 13 Oct 2021 11:33:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012232658.7dac3f43@oasis.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_203333_142651_DFB47772 
X-CRM114-Status: GOOD (  15.89  )
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

CgpPbiAyMDIxLzEwLzEzIOS4iuWNiDExOjI2LCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToKPiBQbGVh
c2Ugc3RhcnQgYSBuZXcgdGhyZWFkIHdoZW4gc2VuZGluZyBuZXcgdmVyc2lvbnMuIHYyIHNob3Vs
ZCBub3QgYmUgYQo+IHJlcGx5IHRvIHYxLiBJZiB5b3Ugd2FudCB0byByZWZlcmVuY2UgdjEsIGp1
c3QgYWRkIGl0IHRvIHRoZSBjb3Zlcgo+IGxldHRlciB3aXRoIGEgbGluayB0YWc6Cj4gCj4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzhjN2RlNDZkLTk4NjktYWE1ZS0yYmI5LTVk
YmMyZWRhMzk1ZUBsaW51eC5hbGliYWJhLmNvbS8KCk9rLCBJJ2xsIHJlc2VuZCBpdCB3aXRoIGxp
bmsgdGhlbi4KClJlZ2FyZHMsCk1pY2hhZWwgV2FuZwoKCj4gCj4gLS0gU3RldmUKPiAKPiAKPiBP
biBXZWQsIDEzIE9jdCAyMDIxIDExOjE2OjU2ICswODAwCj4g546L6LSHIDx5dW4ud2FuZ0BsaW51
eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gCj4+IFRoZSB0ZXN0aW5nIHNob3cgdGhhdCBwZXJmX2Z0
cmFjZV9mdW5jdGlvbl9jYWxsKCkgYXJlIHVzaW5nIHNtcF9wcm9jZXNzb3JfaWQoKQo+PiB3aXRo
IHByZWVtcHRpb24gZW5hYmxlZCwgYWxsIHRoZSBjaGVja2luZyBvbiBDUFUgY291bGQgYmUgd3Jv
bmcgYWZ0ZXIgcHJlZW1wdGlvbi4KPj4KPj4gQXMgUGV0ZXIgcG9pbnQgb3V0LCB0aGUgc2VjdGlv
biBiZXR3ZWVuIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90cnlsb2NrL3VubG9jaygpCj4+IHBhaXIg
cmVxdWlyZSB0aGUgcHJlZW1wdGlvbiB0byBiZSBkaXNhYmxlZCBhcyAnRG9jdW1lbnRhdGlvbi90
cmFjZS9mdHJhY2UtdXNlcy5yc3QnCj4+IGV4cGxhaW5lZCwgYnV0IGN1cnJlbnRseSB0aGUgd29y
ayBpcyBkb25lIG91dHNpZGUgb2YgdGhlIGhlbHBlcnMuCj4+Cj4+IFBhdGNoIDEvMiB3aWxsIG1h
a2Ugc3VyZSBwcmVlbXB0aW9uIGRpc2FibGVkIGFmdGVyIHRyeWxvY2soKSBzdWNjZWVkLAo+PiBw
YXRjaCAyLzIgd2lsbCBkbyBzbXBfcHJvY2Vzc29yX2lkKCkgY2hlY2tpbmcgYWZ0ZXIgdHJ5bG9j
ayB0byBhZGRyZXNzIHRoZQo+PiBpc3N1ZS4KPj4KPj4gTWljaGFlbCBXYW5nICgyKToKPj4gICBm
dHJhY2U6IGRpc2FibGUgcHJlZW1wdGlvbiBiZXR3ZWVuIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl90
cnlsb2NrL3VubG9jaygpCj4+ICAgZnRyYWNlOiBkbyBDUFUgY2hlY2tpbmcgYWZ0ZXIgcHJlZW1w
dGlvbiBkaXNhYmxlZAo+Pgo+PiAgYXJjaC9jc2t5L2tlcm5lbC9wcm9iZXMvZnRyYWNlLmMgICAg
IHwgIDIgLS0KPj4gIGFyY2gvcGFyaXNjL2tlcm5lbC9mdHJhY2UuYyAgICAgICAgICB8ICAyIC0t
Cj4+ICBhcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMtZnRyYWNlLmMgfCAgMiAtLQo+PiAgYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2Z0cmFjZS5jICAgIHwgIDIgLS0KPj4gIGFyY2gveDg2L2tl
cm5lbC9rcHJvYmVzL2Z0cmFjZS5jICAgICB8ICAyIC0tCj4+ICBpbmNsdWRlL2xpbnV4L3RyYWNl
X3JlY3Vyc2lvbi5oICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKystCj4+ICBrZXJuZWwv
bGl2ZXBhdGNoL3BhdGNoLmMgICAgICAgICAgICAgfCAgNiAtLS0tLS0KPj4gIGtlcm5lbC90cmFj
ZS90cmFjZV9ldmVudF9wZXJmLmMgICAgICB8ICA2ICsrKy0tLQo+PiAga2VybmVsL3RyYWNlL3Ry
YWNlX2Z1bmN0aW9ucy5jICAgICAgIHwgIDUgLS0tLS0KPj4gIDkgZmlsZXMgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
