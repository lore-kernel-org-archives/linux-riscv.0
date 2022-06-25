Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C60C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 05:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhTlUT7rTRbTlnSh5WBiIE/rNIEQxUaGvZyVSO6f9xA=; b=LeoZi6lqMhYumK
	Nk1LA25g5hH8j6JCspvvAKO69bBSF7zAi37QiUeBVHcb+rmxPGElPsrqyPHqn+VZdxe9S8+SGZ/Ks
	AdI6IkwpAb02/czhzB3xQbZ7aTAsfv+KmHhUN3UEQ5C6cWpEw/yrJRXz8LB2Rr0pvToFlGCRH6LCu
	FfXLtVRST+nw3N73gVCOEA3yAlFxaKeLQcfkP1y6Cc+kF3RSmDaoP4PcgyacIYwj4px/ubRZtNvdb
	841dGTBxMt+1s9akivry6ZV504VQAChUDvZYHqXtthmYQ9NFpmb6W89R7OIiHDgxUQnT2jjCs+fwV
	Iuda0hNDxPcw1W4zZegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yPq-004ix9-E0; Sat, 25 Jun 2022 05:33:06 +0000
Received: from forward500p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4yPn-004iv7-0F
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 05:33:04 +0000
Received: from sas1-0e0150e31af0.qloud-c.yandex.net (sas1-0e0150e31af0.qloud-c.yandex.net [IPv6:2a02:6b8:c14:392a:0:640:e01:50e3])
	by forward500p.mail.yandex.net (Yandex) with ESMTP id 7AF10F05027;
	Sat, 25 Jun 2022 08:32:56 +0300 (MSK)
Received: from sas2-cc22fd2335f8.qloud-c.yandex.net (sas2-cc22fd2335f8.qloud-c.yandex.net [2a02:6b8:c08:6c82:0:640:cc22:fd23])
	by sas1-0e0150e31af0.qloud-c.yandex.net (mxback/Yandex) with ESMTP id xFjlaQOfax-WufmqaGT;
	Sat, 25 Jun 2022 08:32:56 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1656135176;
	bh=T7iFQChTVP8pQJbKquVBw3SXg4q3eSNB/OuZ7Wdi5nY=;
	h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
	b=REi6Fi33vfxc6G8PQgKXwwVO4u9o8q/VvoTAvqLRbNsTxW9hdIp06YqD/hCHmNnSO
	 xW23Xm7/p0kMv4ZWgW5/tFLCLuJDC/aWx13KQOXFw8lIcbM8cATPtbMXbeuVQsq/jv
	 OFGm9C4oeoJ1feYjSmYn9YrtoWkSf4F/HqGZj6vI=
Authentication-Results: sas1-0e0150e31af0.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-cc22fd2335f8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id gseD0Q4hf9-WsNK6FZJ;
	Sat, 25 Jun 2022 08:32:55 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
Date: Sat, 25 Jun 2022 08:32:53 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup@brainfault.org>, =?UTF-8?B?Sm/Do28gTcOhcmlv?= Domingos
 <joao.mario@tecnico.ulisboa.pt>, linux <linux@yadro.com>, Nikita Shubin
 <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/5] perf arch events: riscv arch std event files
Message-ID: <20220625083253.61b3e0db@redslave.neermore.group>
In-Reply-To: <CAOnJCU+B+dXXhqL6CYRG7Lhr_QWwyxrDZdGZG6HphnTEE9o5Mw@mail.gmail.com>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
	<20220624160117.3206-4-nikita.shubin@maquefel.me>
	<CAOnJCU+B+dXXhqL6CYRG7Lhr_QWwyxrDZdGZG6HphnTEE9o5Mw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_223303_461982_747E0360 
X-CRM114-Status: GOOD (  22.63  )
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

SGVsbG8gQXRpc2ghCgpPbiBGcmksIDI0IEp1biAyMDIyIDEwOjAxOjA3IC0wNzAwCkF0aXNoIFBh
dHJhIDxhdGlzaHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgoKPiBPbiBGcmksIEp1biAyNCwgMjAy
MiBhdCA5OjAxIEFNIE5pa2l0YSBTaHViaW4KPiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4g
d3JvdGU6Cj4gPgo+ID4gRnJvbTogTmlraXRhIFNodWJpbiA8bi5zaHViaW5AeWFkcm8uY29tPgo+
ID4KPiA+IGN5Y2xlcywgdGltZSBhbmQgaW5zdHJldCBjb3VudGVycyBhcmUgZGVmaW5lZCBieSBS
SVNDLVYgcHJpdmlsZWdlZAo+ID4gc3BlYyBhbmQgdGhleSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IGFueSBSSVNDLVYgaW1wbGVtZW50YXRpb24sCj4gPiBlcG9zZSB0aGVtIHRvIGFyY2ggc3RkIGV2
ZW50IGZpbGVzLCBzbyB0aGV5IGNhbiBiZSByZXVzZWQgYnkKPiA+IHBhcnRpY3VsYXIgUE1VIGJp
bmRpbmdzLgo+ID4KPiA+IERlcml2ZWQtZnJvbS1jb2RlLWJ5OiBKb8OjbyBNw6FyaW8gRG9taW5n
b3MKPiA+IDxqb2FvLm1hcmlvQHRlY25pY28udWxpc2JvYS5wdD4gU2lnbmVkLW9mZi1ieTogTmlr
aXRhIFNodWJpbgo+ID4gPG4uc2h1YmluQHlhZHJvLmNvbT4gIAo+IAo+IFdoeSBkbyB3ZSBuZWVk
IHRoaXMgPyBUaGUgUE1VIGRyaXZlciBhbHJlYWR5IHBhcnNlcyB0aGUgc3RhbmRhcmQgcGVyZgo+
IGV2ZW50cy4gU28geW91IGNhbiBwYXNzIC1lIGN5Y2xlcyAtZSBpbnN0cnVjdGlvbnMuCj4gCj4g
RXZlbiB0aG91Z2ggdGltZSBpcyBkZXNjcmliZWQgYXMgYSBjb3VudGVyIGFuZCBhY2Nlc3NpYmls
aXR5Cj4gY29udHJvbGxlZCBieSBtY291bnRlcmVuLCB5b3UgY2FuIG5vdCBzdGFydC9zdG9wIGl0
IChubyBiaXQgaW4KPiBtY291bnRpbmhpYml0KS4KPiBUaHVzLCBpdCBjYW4ndCBiZSB1c2VkIGZy
b20gcGVyZi4KCk15IGZpcnN0IHRob3VnaHQgd2FzIHRoYXQgd2UgY2FuIHVzZSBjeWNsZSwgdGlt
ZSwgaW5zdHJldCBvbiBhbnkgUklTQy1WCnBsYXRmb3JtIGV2ZW4gd2l0aG91dCBhbnkgYmluZGlu
Z3MsIGJ1dCBhcyB5b3UgcG9pbnRlZCBvdXQgaXQncwppbmRlZWQgdXNlbGVzcy4KCkknbGwgZHJv
cCB0aGlzIG9uZS4KCj4gCj4gPiAtLS0KPiA+ICAuLi4vcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jp
c2N2LWdlbmVyaWMuanNvbiAgfCAyMAo+ID4gKysrKysrKysrKysrKysrKysrKyAxIGZpbGUgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gdG9vbHMv
cGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvcmlzY3YtZ2VuZXJpYy5qc29uCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LWdlbmVyaWMu
anNvbgo+ID4gYi90b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9yaXNjdi1nZW5lcmlj
Lmpzb24gbmV3IGZpbGUgbW9kZQo+ID4gMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uYTdmZmJl
ODdhMGY3Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi90b29scy9wZXJmL3BtdS1ldmVudHMv
YXJjaC9yaXNjdi9yaXNjdi1nZW5lcmljLmpzb24KPiA+IEBAIC0wLDAgKzEsMjAgQEAKPiA+ICtb
Cj4gPiArICB7Cj4gPiArICAgICJQdWJsaWNEZXNjcmlwdGlvbiI6ICJDUFUgQ3ljbGVzIiwKPiA+
ICsgICAgIkV2ZW50Q29kZSI6ICIweDAwIiwKPiA+ICsgICAgIkV2ZW50TmFtZSI6ICJyaXNjdl9j
eWNsZXMiLAo+ID4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgY3ljbGVzIFJJU0MtViBn
ZW5lcmljIGNvdW50ZXIiCj4gPiArICB9LAo+ID4gKyAgewo+ID4gKyAgICAiUHVibGljRGVzY3Jp
cHRpb24iOiAiQ1BVIFRpbWUiLAo+ID4gKyAgICAiRXZlbnRDb2RlIjogIjB4MDEiLAo+ID4gKyAg
ICAiRXZlbnROYW1lIjogInJpc2N2X3RpbWUiLAo+ID4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6
ICJDUFUgdGltZSBSSVNDLVYgZ2VuZXJpYyBjb3VudGVyIgo+ID4gKyAgfSwKPiA+ICsgIHsKPiA+
ICsgICAgIlB1YmxpY0Rlc2NyaXB0aW9uIjogIkNQVSBJbnN0cnVjdGlvbnMiLAo+ID4gKyAgICAi
RXZlbnRDb2RlIjogIjB4MDIiLAo+ID4gKyAgICAiRXZlbnROYW1lIjogInJpc2N2X2luc3RyZXQi
LAo+ID4gKyAgICAiQnJpZWZEZXNjcmlwdGlvbiI6ICJDUFUgcmV0aXJlZCBpbnN0cnVjdGlvbnMg
UklTQy1WIGdlbmVyaWMKPiA+IGNvdW50ZXIiCj4gPiArICB9Cj4gPiArXQo+ID4gLS0KPiA+IDIu
MzUuMQo+ID4gIAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
