Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD27EDE996
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXrpiLzwplWn2R5quM4u575ntW+3DwE5fUQBNLOU8uQ=; b=FnG4JOhWrTwBSf
	uMXawORr3XxA1Kjyc4hwuVL9mVGEdUnZdut/U2mXbUTYf/8kPW0usPVep+os2TIGHloSGln/jkXcG
	jcJP3xjbtSZJozEvhUO5uVdeQhCtN2EUwIZRDz7TaheRS8Z9JlN9LkzWR+tPQQC2v8tDA5oI4f+iN
	TWdqyYl15ueMliCTg7tOX2olSK5k4LVK6kFtE50Np4UCAvK7tPVgZXiTX5fWjaa7l+sQfs5oGqS4T
	fjw2xa/+fHTd+AbLxeJRdruNPTN2Uit3e0pQ/m2Qi8zRkxqz+LNzvon7c+riFWDp/WpYfC+z082WL
	Y9ubI4P023AY6Ndm6qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqov-00000003zLa-0k4H;
	Tue, 10 Sep 2024 02:41:33 +0000
Received: from relay1.mymailcheap.com ([144.217.248.102])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqns-00000003zC1-1H8C;
	Tue, 10 Sep 2024 02:40:29 +0000
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 568D03E953;
	Tue, 10 Sep 2024 02:40:13 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 0A76A401AF;
	Tue, 10 Sep 2024 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1725936011; bh=46xTTPwnWBchAQHybHJcNZNB9Zo/4SV48mhuWkgpixQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWlnnbac+YgHD7nW+3TrMArNHmbcve/vPwa8lynBH81/CxzsDWv8HCd1s2gfIGk2t
	 jUkZdGkAhxhcaiwCiwHr4Ng9JmmOSivuaQyxgOWls0goWHtqwW3tkZRz5tbtFJ5T7n
	 H150KpcNEO0zZqhjN4oy/fL8LiMq4jCxSr/FXVU0=
Received: from [127.0.0.1] (unknown [38.207.154.157])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1DB46410D0;
	Tue, 10 Sep 2024 02:40:04 +0000 (UTC)
Message-ID: <f9070564-4672-4aee-8e63-c9ca9d985f4b@aosc.io>
Date: Tue, 10 Sep 2024 10:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow to enable PREEMPT_RT.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Clark Williams <williams@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 John Ogness <john.ogness@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 Will Deacon <will@kernel.org>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20240906111841.562402-1-bigeasy@linutronix.de>
X-Rspamd-Queue-Id: 0A76A401AF
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.09 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_194028_414281_540F0DEC 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgU2ViYXN0aWFuLAoK5ZyoIDIwMjQvOS82IDE4OjU5LCBTZWJhc3RpYW4gQW5kcnplaiBTaWV3
aW9yIOWGmemBkzoKPiBUaGUgcHJpbnRrIGJpdHMgcmVxdWlyZWQgZm9yIFBSRUVNUFRfUlQgYXJl
IHNpdHRpbmcgaW4gbGludXgtbmV4dC4gVGhpcwo+IHdhcyB0aGUgbGFzdCBrbm93biByb2FkYmxv
Y2sgZm9yIFBSRUVNUFRfUlQuIFRoZSBSVCBxdWV1ZSBoYXMKPiBhZGRpdGlvbmFsbHkgdGhlICJh
dG9taWMgY29uc29sZSIgZm9yIHRoZSA4MjUwIFVBUlQgd2hpY2ggaXMgbm90IHlldCBpbgo+IGxp
bnV4LW5leHQuIFRoaXMgbWVhbnMgImxlZ2FjeSBjb25zb2xlIiBiZWhhdmlvdXIgYXMgaW4gbm8g
cHJpbnRpbmcgZnJvbQo+IGF0b21pYyBjb250ZXh0IGluIGVtZXJnZW5jeSBjYXNlcy4gVGhlIDgy
NTAgVUFSVCBkcml2ZXIgaXMgdGhlIG9ubHkgb25lCj4gcHJvdmlkaW5nICJhdG9taWMgY29uc29s
ZSIgc3VwcG9ydCBhcyBvZiB0b2RheS4KPgo+IFdpdGggdGhlIHByaW50ayBiaXRzIG1lcmdlZCwg
UFJFRU1QVF9SVCBjb3VsZCBiZSBlbmFibGVkIG9uIFg4NiwgQVJNNjQKPiBhbmQgUmlzYy1WLiBU
aGVzZSB0aHJlZSBhcmNoaXRlY3R1cmVzIG1lcmdlZCByZXF1aXJlZCBjaGFuZ2VzIG92ZXIgdGhl
Cj4geWVhcnMgbGVhdmluZyBtZSBpbiBhIHBvc2l0aW9uIHdoZXJlIEkgaGF2ZSBubyBlc3NlbnRp
YWwgY2hhbmdlcyBpbiB0aGUKPiBxdWV1ZSB0aGF0IHdvdWxkIGFmZmVjdCB0aGVtLgo+IEFSTSBh
bmQgUE9XRVJQQyBoYXZlIGEgZmV3IGVzc2VudGlhbCBwYXRjaGVzIGxlZnQgYW5kIEkgbG9zdCB0
cmFjayBvZgo+IE1JUFMuCkNvbmdyYXR1bGF0aW9ucywgaXQncyBiZWVuIGEgbG9uZyB0aW1lIGNv
bWluZyEKCkknbSB3b25kZXJpbmcsIGZvciB0aGUgYXJjaGl0ZWN0dXJlcyBub3QgaW5jbHVkZWQg
aW4gdGhlIGVuYWJsZW1lbnQgdGhpcyAKdGltZSwgZG8gd2UgaGF2ZSBhIHJlYWRpbmVzcyBjaGVj
a2xpc3QvZ3VpZGUgZm9yIG1haW50YWluZXJzIHRvIHJlZmVyIHRvPwoKVGhhbmtzIGluIGFkdmFu
Y2UuCj4KPiBTZWJhc3RpYW4KPgo+CkJlc3QgUmVnYXJkcywKTWluZ2NvbmcgQmFpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
