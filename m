Return-Path: <SRS0=kybu=OQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF126C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Sep 2021 21:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CB9C60F9E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Sep 2021 21:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CB9C60F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzk3fRiqUVdRAjKmxW6Nz1GAzAWcYRWcejvftwFrvTA=; b=fsPtN9Q8umDZp1
	o7WjeqqsgFXmnjUif8Of0v9gn3aank5fa4PaH5w21Sl5mMzrAxqbJgeLvn+x3TtAPxzwICxTlYokw
	6Ea4vRIJ4bXwlsBoCZkWrqQvdDc+b9luHg5UvLcvw2Jha89NpCkP6y5ueSS+YT9rb0NOzS3Xxl95O
	FETdhcc4KfQnaaDINjpAZbYC9yKLTNJgR4i8OEDfISDLRW2MuBSIbxS4jkLi4IM9yqXcKVq7il+Kn
	Ee0L7rIxi4VqjtXAc4ni2Zsmd9ObBgsoVQ18aLqoA23OXk1I9BMGS5MG9Vm7ci1+h2EYL51XG785X
	0Jh1KSM8UtXyS8k1zZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUbmD-0016OH-Ri; Sun, 26 Sep 2021 21:33:37 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUblo-0016NT-Qc
 for linux-riscv@lists.infradead.org; Sun, 26 Sep 2021 21:33:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id 8B0D01F4239D
Message-ID: <a65dfe31-a355-8cf8-99d8-70ddf23c5384@collabora.com>
Date: Sun, 26 Sep 2021 18:32:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-perf-users@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Darren Hart <dvhart@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
 <CAKmqyKM+VN-KST9-VMULZMC=2sNbjH2wiE-CZ1WRfVFj3WmpdQ@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAKmqyKM+VN-KST9-VMULZMC=2sNbjH2wiE-CZ1WRfVFj3WmpdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_143313_034737_E2BD8A80 
X-CRM114-Status: GOOD (  27.86  )
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

w4BzIDAxOjM0IGRlIDI0LzA5LzIxLCBBbGlzdGFpciBGcmFuY2lzIGVzY3JldmV1Ogo+IE9uIFR1
ZSwgU2VwIDIxLCAyMDIxIGF0IDg6NDcgQU0gQW5kcsOpIEFsbWVpZGEgPGFuZHJlYWxtZWlkQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBBbGlzdGFpciwKPj4KPj4gw4BzIDAzOjEwIGRl
IDE3LzA5LzIxLCBBbGlzdGFpciBGcmFuY2lzIGVzY3JldmV1Ogo+Pj4gRnJvbTogQWxpc3RhaXIg
RnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgo+Pj4KPj4+IFNvbWUgMzItYml0IGFy
Y2hpdGVjdHVyZXMgKHN1Y2ggYXJlIDMyLWJpdCBSSVNDLVYpIG9ubHkgaGF2ZSBhIDY0LWJpdAo+
Pj4gdGltZV90IGFuZCBhcyBzdWNoIGRvbid0IGhhdmUgdGhlIFNZU19mdXRleCBzeXNjYWxsLiBU
aGlzIHBhdGNoIHdpbGwKPj4+IGFsbG93IHVzIHRvIHVzZSB0aGUgU1lTX2Z1dGV4X3RpbWU2NCBz
eXNjYWxsIG9uIHRob3NlIHBsYXRmb3Jtcy4KPj4+Cj4+Cj4+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCEgSG93ZXZlciwgSSBkb24ndCB0aGluayB0aGF0IGFueSBmdXRleCBvcGVyYXRpb24KPj4gYXQg
cGVyZiBoYXMgdGltZW91dC4gRG8geW91IHBsYW4gdG8gaW1wbGVtZW50IGEgdGVzdCB0aGF0IHVz
ZSBpdD8gT3IgdGhlCj4+IGlkZWEgaXMgdG8gZ2V0IHRoaXMgcmVhZHkgZm9yIGl0IGluIGNhc2Ug
c29tZW9uZSB3YW50IHRvIGRvIHNvIGluIHRoZQo+PiBmdXR1cmU/Cj4gCj4gSSBkb24ndCBoYXZl
IHBsYW5zIHRvIGltcGxlbWVudCBhbnkgbmV3IHRlc3RzIChhbHRob3VnaCBJJ20gaGFwcHkgdG8K
PiBhZGQgb25lIGlmIG5lZWQgYmUpLgo+IAo+IE15IGdvYWwgd2FzIGp1c3QgdG8gZ2V0IHRoaXMg
dG8gYnVpbGQgZm9yIFJJU0MtViAzMi1iaXQuIFRoZSB0aW1lb3V0Cj4gd2FzIGFscmVhZHkgZXhw
b3NlZCBieSB0aGUgb2xkIGZ1dGV4IG1hY3JvLCBzbyBJIHdhcyBqdXN0IGZvbGxvd2luZwo+IHRo
YXQuCj4gCgpJIHNlZSwgdGhhbmtzIGZvciB3b3JraW5nIG9uIHRoYXQuCgo+Pgo+Pgo+PiBBbHNv
LCBJIGZhY2VkIGEgc2ltaWxhciBwcm9ibGVtIHdpdGggdGhlIG5ldyBmdXRleDIgc3lzY2FsbHMs
IHRoYXQKPj4gc3VwcG9ydHMgZXhjbHVzaXZlbHkgNjRiaXQgdGltZXNwZWMuIEJ1dCBJIHRvb2sg
YSBkaWZmZXJlbnQgYXBwcm9hY2g6IEkKPj4gY2FsbGVkIF9fTlJfY2xvY2tfZ2V0dGltZTY0IGZv
ciAzMmJpdCBhcmNoaXRlY3R1cmVzIHNvIGl0IHdvdWxkbid0Cj4+IHJlcXVpcmUgdG8gY29udmVy
dCB0aGUgc3RydWN0Ogo+Pgo+PiAjaWYgZGVmaW5lZChfX2kzODZfXykgfHwgX19USU1FU0laRSA9
PSAzMgo+PiAjIGRlZmluZSBOUl9nZXR0aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lNjQKPj4gI2Vs
c2UKPj4gIyBkZWZpbmUgTlJfZ2V0dGltZTY0IF9fTlJfY2xvY2tfZ2V0dGltZQo+PiAjZW5kaWYK
Pj4KPj4gc3RydWN0IHRpbWVzcGVjNjQgewo+PiAgICAgICAgIGxvbmcgbG9uZyB0dl9zZWM7ICAg
ICAgIC8qIHNlY29uZHMgKi8KPj4gICAgICAgICBsb25nIGxvbmcgdHZfbnNlYzsgICAgICAvKiBu
YW5vc2Vjb25kcyAqLwo+PiB9Owo+Pgo+PiBpbnQgZ2V0dGltZTY0KGNsb2NrX3QgY2xvY2tpZCwg
c3RydWN0IHRpbWVzcGVjNjQgKnR2KQo+PiB7Cj4+ICAgICAgICAgcmV0dXJuIHN5c2NhbGwoTlJf
Z2V0dGltZTY0LCBjbG9ja2lkLCB0dik7Cj4+IH0KPj4KPj4gVGhlbiB3ZSBjYW4ganVzdCB1c2Ug
JnRpbWVvdXQgYXQgX19OUl9mdXRleF90aW1lNjQgZm9yIDMyYml0IGFyY2ggYW5kIGF0Cj4+IF9f
TlJfZnV0ZXggZm9yIDY0Yml0IGFyY2guCj4gCj4gU28gdGhlIGlkZWEgaXMgdG8gdXNlIDY0LWJp
dCB0aW1lX3QgZXZlcnl3aGVyZSBhbmQgb25seSB3b3JrIG9uIDUuMSsga2VybmVscy4KPiAKPiBJ
ZiB0aGF0J3MgdGhlIGZhdm91cmVkIGFwcHJvYWNoIEkgY2FuIGNvbnZlcnQgdGhpcyBzZXJpZXMg
dG8geW91ciBpZGVhLgo+IAoKWWVzLCB0aGlzIGlzIHdoYXQgSSB0aGluayBpdCB3aWxsIGJlIHRo
ZSBiZXN0IGFwcHJvYWNoLiBJIGJlbGlldmUgdGhlCmNvZGUgd2lsbCBiZSBsZXNzIGNvbXBsZXgs
IGl0J3MgbW9yZSBmdXR1cmUgcHJvb2YgKGl0J3MgcmVhZHkgZm9yIHkyMDM4KQphbmQgd2hlbiBn
bGliYyBzdXBwb3J0cyB0aW1lNjQsIHdlIGNhbiBtYWtlIHRoaXMgY29kZSBldmVuIHNpbXBsZXIg
dXNpbmcKYC1EX19VU0VfVElNRV9CSVRTNjRgIHRvIGNvbXBpbGUgaXQuIFRoYW5rcyBhZ2FpbiBm
b3Igd29ya2luZyBvbiB0aGF0IQoKPiBBbGlzdGFpcgo+IAo+Pgo+PiBUaGlzIG1pZ2h0IGJlIGEg
c2ltcGxlciBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbSB0aGF0IHlvdSBhcmUgZmFjaW5nIGJ1dAo+
PiBJJ20gbm90IGVudGlyZWx5IHN1cmUuIEFsc28sIGZ1dGV4J3Mgc2VsZnRlc3RzIGRvIHVzZSB0
aGUgdGltZW91dAo+PiBhcmd1bWVudCBhbmQgSSB0aGluayB0aGF0IHRoZXkgYWxzbyB3b24ndCBj
b21waWxlIGluIDMyLWJpdCBSSVNDLVYsIHNvCj4+IG1heWJlIHdlIGNhbiBzdGFydCBmcm9tIHRo
ZXJlIHNvIHdlIGNhbiBhY3R1YWxseSB0ZXN0IHRoZSB0aW1lb3V0Cj4+IGFyZ3VtZW50IGFuZCBj
aGVjayBpZiBpdCdzIHdvcmtpbmcuCj4+Cj4+IFRoYW5rcywKPj4gICAgICAgICBBbmRyw6kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
