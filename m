Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A08C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FEA60E52
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 01:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0FEA60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3gE+0W7N6U0jtaQgj4IQTD3FOYMhm7mQrov9MCASoAQ=; b=3jZoCTf1mImOOrWYNzD2ipeSlH
	+PUuzh4/BzyI65UrJe/8MpF08uUaAv4xt80FGEXlqipm5GnijoSEE2l0NdIfO/g6KOHRV11eSLWDb
	Vpb6d9YWdgTzeETYO87dG7uluZBRgTr9NXQOzG0OdIxns+pAxj8k5I2Bed6YDc2QjpfmgvaFzqFKm
	6HT/3/27kyZ6Gm2I/T1ssprZpNqqb4TX3J/ZQ0qYb9XIM2V5Nh1pjEmAMBWkYC2mQMVkkBOcQSiO6
	JEVDo31NXf7VRnjehACKbYOS0MQm4VSv04WAS5U3iLSOIiTf2REQ6V9n56ywvTpR8kQ5/M3ELwj5G
	dJ0nwk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maTMl-00Eao6-HY; Wed, 13 Oct 2021 01:47:35 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maTMi-00Ean0-Ln
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 01:47:34 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yun.wang@linux.alibaba.com;
 NM=1; PH=DS; RN=31; SR=0; TI=SMTPD_---0UrdGZW4_1634089648; 
Received: from testdeMacBook-Pro.local(mailfrom:yun.wang@linux.alibaba.com
 fp:SMTPD_---0UrdGZW4_1634089648) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 13 Oct 2021 09:47:29 +0800
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
 <20211012081728.5d357d6c@gandalf.local.home>
From: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>
Message-ID: <d079d249-b603-230a-a905-3f0df55056ae@linux.alibaba.com>
Date: Wed, 13 Oct 2021 09:46:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211012081728.5d357d6c@gandalf.local.home>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_184732_897968_7B6F86D3 
X-CRM114-Status: GOOD (  13.18  )
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

CgpPbiAyMDIxLzEwLzEyIOS4i+WNiDg6MTcsIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+IE9uIFR1
ZSwgMTIgT2N0IDIwMjEgMTM6NDA6MDggKzA4MDAKPiDnjovotIcgPHl1bi53YW5nQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPiAKPj4gQEAgLTUyLDExICs1Miw2IEBAIHN0YXRpYyB2b2lkIG5v
dHJhY2Uga2xwX2Z0cmFjZV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgaXAsCj4+ICAJYml0ID0gZnRy
YWNlX3Rlc3RfcmVjdXJzaW9uX3RyeWxvY2soaXAsIHBhcmVudF9pcCk7Cj4+ICAJaWYgKFdBUk5f
T05fT05DRShiaXQgPCAwKSkKPj4gIAkJcmV0dXJuOwo+PiAtCS8qCj4+IC0JICogQSB2YXJpYW50
IG9mIHN5bmNocm9uaXplX3JjdSgpIGlzIHVzZWQgdG8gYWxsb3cgcGF0Y2hpbmcgZnVuY3Rpb25z
Cj4+IC0JICogd2hlcmUgUkNVIGlzIG5vdCB3YXRjaGluZywgc2VlIGtscF9zeW5jaHJvbml6ZV90
cmFuc2l0aW9uKCkuCj4+IC0JICovCj4gCj4gSSBoYXZlIHRvIHRha2UgYSBkZWVwZXIgbG9vayBh
dCB0aGlzIHBhdGNoIHNldCwgYnV0IGRvIG5vdCByZW1vdmUgdGhpcwo+IGNvbW1lbnQsIGFzIGl0
IGV4cGxhaW5zIHRoZSBwcm90ZWN0aW9uIGhlcmUsIHRoYXQgaXMgbm90IG9idmlvdXMgd2l0aCB0
aGUKPiBjaGFuZ2VzIHlvdSBtYWRlLgoKV2lsbCBrZWVwIHRoYXQgaW4gdjIuCgpSZWdhcmRzLApN
aWNoYWVsIFdhbmcKCj4gCj4gLS0gU3RldmUKPiAKPiAKPj4gLQlwcmVlbXB0X2Rpc2FibGVfbm90
cmFjZSgpOwo+Pgo+PiAgCWZ1bmMgPSBsaXN0X2ZpcnN0X29yX251bGxfcmN1KCZvcHMtPmZ1bmNf
c3RhY2ssIHN0cnVjdCBrbHBfZnVuYywKPj4gIAkJCQkgICAgICBzdGFja19ub2RlKTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
