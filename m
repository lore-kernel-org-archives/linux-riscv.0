Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09223C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 23:07:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C057661186
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 23:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C057661186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11d4amU4iO1UfQ1XuOzN/YeuGRUSbRPFORK/2WzFQEQ=; b=WEvCzDTAHdON/8
	DVKIUpSspy0x4JZ7JbY32Fzckf8Xdf3NFFXFm5HDthxL8MiEsS5M+0pbik0lzshXnrLS5/pZZK6CL
	oF7hy3wkBez6GOhC4wSkMmPC+EJcVjhzQoyrmj+tCbJrOCM1LwmVgc95MYBJRU5m4QLlxmZRrp40Z
	BsKIqKkBnDJUwFYFsRkKD5Q59k/GkJqnzaX69L2JxJFJjoclmN3KZku1nnKXTVdcp7oYa0FbLLY3i
	h2PDVl/L8QqjE/HhajOpslKZfYuamEd56LLQ4hJou72BlXNlAQ8Jy1NxFdFUePmNxxaCb4HvhL/za
	YW4G6TPQS3ZzUv8hH8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSoqk-006DaY-Ks; Tue, 21 Sep 2021 23:06:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSoqR-006DZz-Lb
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 23:06:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 00F781F4358B
Message-ID: <9db8c79a-f704-84ce-360b-84335f926a48@collabora.com>
Date: Tue, 21 Sep 2021 20:06:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Darren Hart <dvhart@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
 <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_160635_897907_52217511 
X-CRM114-Status: GOOD (  20.60  )
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

w4BzIDA1OjA4IGRlIDIxLzA5LzIxLCBBcm5kIEJlcmdtYW5uIGVzY3JldmV1Ogo+IE9uIFR1ZSwg
U2VwIDIxLCAyMDIxIGF0IDEyOjQ3IEFNIEFuZHLDqSBBbG1laWRhCj4gPGFuZHJlYWxtZWlkQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiAjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgX19USU1F
U0laRSA9PSAzMgo+PiAjIGRlZmluZSBOUl9nZXR0aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lNjQK
Pj4gI2Vsc2UKPj4gIyBkZWZpbmUgTlJfZ2V0dGltZTY0IF9fTlJfY2xvY2tfZ2V0dGltZQo+PiAj
ZW5kaWYKPj4KPj4gc3RydWN0IHRpbWVzcGVjNjQgewo+PiAgICAgICAgIGxvbmcgbG9uZyB0dl9z
ZWM7ICAgICAgIC8qIHNlY29uZHMgKi8KPj4gICAgICAgICBsb25nIGxvbmcgdHZfbnNlYzsgICAg
ICAvKiBuYW5vc2Vjb25kcyAqLwo+PiB9Owo+Pgo+PiBpbnQgZ2V0dGltZTY0KGNsb2NrX3QgY2xv
Y2tpZCwgc3RydWN0IHRpbWVzcGVjNjQgKnR2KQo+PiB7Cj4+ICAgICAgICAgcmV0dXJuIHN5c2Nh
bGwoTlJfZ2V0dGltZTY0LCBjbG9ja2lkLCB0dik7Cj4+IH0KPj4KPj4gVGhlbiB3ZSBjYW4ganVz
dCB1c2UgJnRpbWVvdXQgYXQgX19OUl9mdXRleF90aW1lNjQgZm9yIDMyYml0IGFyY2ggYW5kIGF0
Cj4+IF9fTlJfZnV0ZXggZm9yIDY0Yml0IGFyY2guCj4gCj4gVGhpcyBpcyBzdGlsbCBicm9rZW4g
d2hlbiB5b3UgZGlzYWJsZSBDT05GSUdfQ09NUEFUXzMyQklUX1RJTUUsCj4gd2hpY2ggZGlzYWJs
ZXMgYWxsIHN5c3RlbSBjYWxscyB0aGF0IHRha2UgdGltZTMyIGFyZ3VtZW50cy4KPiAKCk9oLCBJ
IHRoaW5rIG15IHBvaW50IHdhcyBjb25mdXNpbmcgdGhlbi4gTXkgc3VnZ2VzdGlvbiB3YXMgdG8g
dXNlIG9ubHkKdGhlIGZ1dGV4IGVudHJ5IHBvaW50cyB0aGF0IGFjY2VwdHMgdGltZTY0LCBhbmQg
dG8gYWx3YXlzIHVzZQpjbG9ja19nZXR0aW1lIHRoYXQgdXNlcyB0aW1lNjQsIGZvciBhbGwgcGxh
dGZvcm1zLiBUaGVuIGl0IHdpbGwgd29yayBpZgp3ZSBkaXNhYmxlIENPTkZJR19DT01QQVRfMzJC
SVRfVElNRS4KCj4+IFRoaXMgbWlnaHQgYmUgYSBzaW1wbGVyIHNvbHV0aW9uIHRvIHRoZSBwcm9i
bGVtIHRoYXQgeW91IGFyZSBmYWNpbmcgYnV0Cj4+IEknbSBub3QgZW50aXJlbHkgc3VyZS4gQWxz
bywgZnV0ZXgncyBzZWxmdGVzdHMgZG8gdXNlIHRoZSB0aW1lb3V0Cj4+IGFyZ3VtZW50IGFuZCBJ
IHRoaW5rIHRoYXQgdGhleSBhbHNvIHdvbid0IGNvbXBpbGUgaW4gMzItYml0IFJJU0MtViwgc28K
Pj4gbWF5YmUgd2UgY2FuIHN0YXJ0IGZyb20gdGhlcmUgc28gd2UgY2FuIGFjdHVhbGx5IHRlc3Qg
dGhlIHRpbWVvdXQKPj4gYXJndW1lbnQgYW5kIGNoZWNrIGlmIGl0J3Mgd29ya2luZy4KPiAKPiBJ
IHdvdWxkIGxvdmUgdG8gc2VlIHRoZSB3cmFwcGVyIHRoYXQgQWxpc3RhaXIgd3JvdGUgYXMgcGFy
dCBvZiBzb21lIGtlcm5lbAo+IHVhcGkgaGVhZGVyIHByb3ZpZGVkIHRvIHVzZXIgc3BhY2UuIGZ1
dGV4IGlzIHVzZWQgYnkgdG9ucyBvZiBhcHBsaWNhdGlvbnMsCj4gYW5kIHdlIG5ldmVyIGhhZCBh
IGxpYnJhcnkgYWJzdHJhY3Rpb24gZm9yIGl0LCBzbyBldmVyeW9uZSBoYXMgdG8gZG8gdGhlc2UK
PiBieSBoYW5kLCBhbmQgdGhleSBhbGwgZ2V0IHRoZW0gc2xpZ2h0bHkgd3JvbmcgaW4gZGlmZmVy
ZW50IHdheXMuCgpXaHkgd2UgZG9uJ3QgaGF2ZSBhIGZ1dGV4KCkgd3JhcHBlciBhdCBnbGliYyBh
cyB3ZSBkbyBoYXZlIGZvciBvdGhlcnMKc3lzY2FsbHM/Cgo+IAo+IFdlIG5vcm1hbGx5IGRvbid0
IGRvIHRoaXMgaW4ga2VybmVsIGhlYWRlcnMsIGJ1dCBJIHRoaW5rIHRoZSBiZW5lZml0cwo+IHdv
dWxkIGJlIGZhciBncmVhdGVyIGNvbXBhcmVkIHRvIHRvZGF5J3Mgc2l0dWF0aW9uLgo+IAo+ICAg
ICAgIEFybmQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
