Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9108BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 22:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338B761166
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 22:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 338B761166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwZntcYqfRFFYx3M1J5yJe/6JyafRC24xsrTCzaiyHU=; b=VkOO0msssgvV4u
	KTCMXg8I4SB1sVQCgzPwvaSaUqbQHmVRdJHRe+w7rwh7DZ0cZ9fXCmjI6ERPbDKYHMbD/sj+PvZQY
	6QooA8L851AvA5yuwB3KZ8r9iQgy7LGLb3G7/A9R9lZZNZLsfjjQH8JCB/bkVO8GV/zR3YLb5F4mI
	HGW2fLdqmSaOGxEW9RHCusMHEeiYA/Ox/l03Uuy4vfzRi0TcxONHJ9vaSYD0ijgdnV1NRuvC/DQh8
	ytylTomdZ5Awh9tx9VxJZg1Ig+BzrK4apYfsq9TVJ+gZhGqqcgjwK6aVX4tUra8YhW/EnjVl6lCCV
	gR+KEcNTw1qnvT1akBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSS4x-003HaK-E3; Mon, 20 Sep 2021 22:48:03 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSS4u-003HZn-CK
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 22:48:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id A7DF31F426D9
Message-ID: <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
Date: Mon, 20 Sep 2021 19:47:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-kernel@vger.kernel.org, alistair23@gmail.com,
 linux-riscv@lists.infradead.org, namhyung@kernel.org, jolsa@redhat.com,
 linux-perf-users@vger.kernel.org, alexander.shishkin@linux.intel.com,
 mark.rutland@arm.com, acme@kernel.org, dave@stgolabs.net,
 dvhart@infradead.org, peterz@infradead.org, mingo@redhat.com,
 tglx@linutronix.de, atish.patra@wdc.com, arnd@arndb.de,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_154800_600740_14BDFB06 
X-CRM114-Status: GOOD (  12.55  )
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

SGkgQWxpc3RhaXIsCgrDgHMgMDM6MTAgZGUgMTcvMDkvMjEsIEFsaXN0YWlyIEZyYW5jaXMgZXNj
cmV2ZXU6Cj4gRnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pgo+IAo+IFNvbWUgMzItYml0IGFyY2hpdGVjdHVyZXMgKHN1Y2ggYXJlIDMyLWJpdCBSSVNDLVYp
IG9ubHkgaGF2ZSBhIDY0LWJpdAo+IHRpbWVfdCBhbmQgYXMgc3VjaCBkb24ndCBoYXZlIHRoZSBT
WVNfZnV0ZXggc3lzY2FsbC4gVGhpcyBwYXRjaCB3aWxsCj4gYWxsb3cgdXMgdG8gdXNlIHRoZSBT
WVNfZnV0ZXhfdGltZTY0IHN5c2NhbGwgb24gdGhvc2UgcGxhdGZvcm1zLgo+IAoKVGhhbmtzIGZv
ciB5b3VyIHBhdGNoISBIb3dldmVyLCBJIGRvbid0IHRoaW5rIHRoYXQgYW55IGZ1dGV4IG9wZXJh
dGlvbgphdCBwZXJmIGhhcyB0aW1lb3V0LiBEbyB5b3UgcGxhbiB0byBpbXBsZW1lbnQgYSB0ZXN0
IHRoYXQgdXNlIGl0PyBPciB0aGUKaWRlYSBpcyB0byBnZXQgdGhpcyByZWFkeSBmb3IgaXQgaW4g
Y2FzZSBzb21lb25lIHdhbnQgdG8gZG8gc28gaW4gdGhlCmZ1dHVyZT8KCgpBbHNvLCBJIGZhY2Vk
IGEgc2ltaWxhciBwcm9ibGVtIHdpdGggdGhlIG5ldyBmdXRleDIgc3lzY2FsbHMsIHRoYXQKc3Vw
cG9ydHMgZXhjbHVzaXZlbHkgNjRiaXQgdGltZXNwZWMuIEJ1dCBJIHRvb2sgYSBkaWZmZXJlbnQg
YXBwcm9hY2g6IEkKY2FsbGVkIF9fTlJfY2xvY2tfZ2V0dGltZTY0IGZvciAzMmJpdCBhcmNoaXRl
Y3R1cmVzIHNvIGl0IHdvdWxkbid0CnJlcXVpcmUgdG8gY29udmVydCB0aGUgc3RydWN0OgoKI2lm
IGRlZmluZWQoX19pMzg2X18pIHx8IF9fVElNRVNJWkUgPT0gMzIKIyBkZWZpbmUgTlJfZ2V0dGlt
ZTY0IF9fTlJfY2xvY2tfZ2V0dGltZTY0CiNlbHNlCiMgZGVmaW5lIE5SX2dldHRpbWU2NCBfX05S
X2Nsb2NrX2dldHRpbWUKI2VuZGlmCgpzdHJ1Y3QgdGltZXNwZWM2NCB7Cglsb25nIGxvbmcgdHZf
c2VjOwkvKiBzZWNvbmRzICovCglsb25nIGxvbmcgdHZfbnNlYzsJLyogbmFub3NlY29uZHMgKi8K
fTsKCmludCBnZXR0aW1lNjQoY2xvY2tfdCBjbG9ja2lkLCBzdHJ1Y3QgdGltZXNwZWM2NCAqdHYp
CnsKCXJldHVybiBzeXNjYWxsKE5SX2dldHRpbWU2NCwgY2xvY2tpZCwgdHYpOwp9CgpUaGVuIHdl
IGNhbiBqdXN0IHVzZSAmdGltZW91dCBhdCBfX05SX2Z1dGV4X3RpbWU2NCBmb3IgMzJiaXQgYXJj
aCBhbmQgYXQKX19OUl9mdXRleCBmb3IgNjRiaXQgYXJjaC4KClRoaXMgbWlnaHQgYmUgYSBzaW1w
bGVyIHNvbHV0aW9uIHRvIHRoZSBwcm9ibGVtIHRoYXQgeW91IGFyZSBmYWNpbmcgYnV0CkknbSBu
b3QgZW50aXJlbHkgc3VyZS4gQWxzbywgZnV0ZXgncyBzZWxmdGVzdHMgZG8gdXNlIHRoZSB0aW1l
b3V0CmFyZ3VtZW50IGFuZCBJIHRoaW5rIHRoYXQgdGhleSBhbHNvIHdvbid0IGNvbXBpbGUgaW4g
MzItYml0IFJJU0MtViwgc28KbWF5YmUgd2UgY2FuIHN0YXJ0IGZyb20gdGhlcmUgc28gd2UgY2Fu
IGFjdHVhbGx5IHRlc3QgdGhlIHRpbWVvdXQKYXJndW1lbnQgYW5kIGNoZWNrIGlmIGl0J3Mgd29y
a2luZy4KClRoYW5rcywKCUFuZHLDqQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
