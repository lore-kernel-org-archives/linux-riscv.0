Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9631BC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkUVt7MnXXi3UNcgW/pSvQwekJq9XpF3GsLs7Kr9+YI=; b=20bVJ6maPVdpl+
	gw+H2xeU4TNy0p5u2xY4suR76bT4e4cjJbmPAL95EgNlpdsVuFbmeUfWbB0xGOTPGFw6t2ZsEzrHb
	ippGE+Qj6pnNxauty7LpavW3L4N8X721ai7BMU6zU/+UU+2uUsPie699AdbBkGnMWBjladv+m+J3o
	I5JiLiUjz5pYly63JM9gNO6uD6vCZzoDfCA7f/n06fRSp9Lr0rSAxraRwvamfhSlSRPec1jKEL8hj
	irZVknvf+FQ1yGMVLRoOfk1IBz7KjnVe+rTAWJknudqjH5hPVvf/QKz1i8Lsza9VB98lciJUlSZ9E
	eNzk/S9QPnCl9TSvoAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERzq-002rcS-He; Thu, 21 Jul 2022 08:57:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERzn-002rRr-Bp
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 08:57:25 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 56FC63F0E1
	for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658393832;
	bh=9H9TiG4qwoak6oWFASq8Wfms+I3CmENOlQgsoIb4Ea4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=E0+LR2BIvfL3dhnqZdwVOm1rPUZB2W5aqaNWnlSgVH9/oZyYCdfhCNgEIsqy6JHE0
	 7UfVOHMnCl5AD1sNb+kMkNAzIr3wEB9P86WCok7RIViet+051KRY2PYYc6z0WbbhNY
	 kmyOMVMOHd0UiVRUg5pDGw0PFii0T0S0QwW5a8iMXgqBg+2+B4L9kT9O+hFujY7Z9x
	 3Yg6P9ANXOefcj+VJVP3nn4yWn/CRHaUZKafh1ehtZ3xyy+5KKQNpBA1lyPM2v077J
	 zqYuVzktwdLqfy30fil7foWNx2crMOQn5bXLKE/0+iRSNGik6AXzlkflCrN8ycq3ab
	 6KI3YmC1atlJg==
Received: by mail-wm1-f70.google.com with SMTP id r82-20020a1c4455000000b003a300020352so714139wma.5
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 01:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9H9TiG4qwoak6oWFASq8Wfms+I3CmENOlQgsoIb4Ea4=;
        b=h1RuEy8/rpyUJSB1xtYLYkqaaz7xBd35GhcZIJSsg7tOyK4AxYhPVoT6CzhU4955cT
         Ju8UlFFEIhKgGUvHnw116evefqDYLz0EBxHB3MfnS/C4jD/2oucqTpMbvEGisVTc8JU4
         pbS9Ax/YtjGnzRd3Py4re3LdHbHEz7bIhXPo3+bC27BcEMa4yriREgiP+yq9ylq814Zm
         5evfdgr29mW78nHhxxAeujI7POXXeFzQ0U1HJH8Fwys0It6VfC/zl6t6CgykL/rMirgr
         pzdC3dWZCQvPd7WbXm2dAT4X1mZlsD8FkCe5XysRhBqRN3fS1tibth0QrCdttdVTDJG1
         9PMA==
X-Gm-Message-State: AJIora/zUvFR9UdnioNtMe/49JHHL9Nn0qmL6CytdzMx1lw7U9WjljOj
	+WFw2ulNV5uMWdMcek6pI0zLsfamtcmlPEexyqOcs4cj168jc9QEu/TkWY3gZMOhUv8mmUf3tk0
	R7Kf/zDYsiuw8ntlWhk0Ek9DTETSHgVYj6LDV31QlZTntNg==
X-Received: by 2002:a5d:6d81:0:b0:21d:bb16:e6c8 with SMTP id l1-20020a5d6d81000000b0021dbb16e6c8mr33621041wrs.88.1658393831947;
        Thu, 21 Jul 2022 01:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vb/xJ7ZDLVfYE6sdTA+ATaDz7GuUZJ5kpeWUMmKtDpaADS/us8iAbKrrL32HwtkBu7ZhtTcg==
X-Received: by 2002:a5d:6d81:0:b0:21d:bb16:e6c8 with SMTP id l1-20020a5d6d81000000b0021dbb16e6c8mr33621025wrs.88.1658393831618;
        Thu, 21 Jul 2022 01:57:11 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id d16-20020adff2d0000000b0021d4aca9d1esm1455386wrp.99.2022.07.21.01.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 01:57:11 -0700 (PDT)
Message-ID: <c8fa1471-a6dd-9357-484d-1816c903dd4e@canonical.com>
Date: Thu, 21 Jul 2022 10:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [Crash-utility][PATCH 1/8] Add RISCV64 framework code support
Content-Language: en-US
To: =?UTF-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+IOS4gOS7gSk=?=
 <k-hagio-ab@nec.com>, Xianting Tian <xianting.tian@linux.alibaba.com>,
 "crash-utility@redhat.com" <crash-utility@redhat.com>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "guoren@kernel.org" <guoren@kernel.org>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "hschauhan@nulltrace.org" <hschauhan@nulltrace.org>,
 "huanyi.xj@alibaba-inc.com" <huanyi.xj@alibaba-inc.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
 <20220718025346.411758-2-xianting.tian@linux.alibaba.com>
 <8f6d9af6-36e0-1fe4-17fa-ef5f04130619@nec.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <8f6d9af6-36e0-1fe4-17fa-ef5f04130619@nec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_015723_832864_AB187378 
X-CRM114-Status: GOOD (  15.71  )
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

T24gNy8yMS8yMiAxMDoxNywgSEFHSU8gS0FaVUhJVE8o6JCp5bC+IOS4gOS7gSkgd3JvdGU6Cj4g
T24gMjAyMi8wNy8xOCAxMTo1MywgWGlhbnRpbmcgVGlhbiB3cm90ZToKPj4gVGhpcyBwYXRjaCBt
YWlubHkgYWRkZWQgc29tZSBlbnZpcm9ubWVudCBjb25maWd1cmF0aW9ucywgbWFjcm8gZGVmaW5p
dGlvbnMsCj4+IHNwZWNpZmljIGFyY2hpdGVjdHVyZSBzdHJ1Y3R1cmVzIGFuZCBzb21lIGZ1bmN0
aW9uIGRlY2xhcmF0aW9ucyBzdXBwb3J0ZWQKPj4gYnkgdGhlIFJJU0NWNjQgYXJjaGl0ZWN0dXJl
Lgo+Pgo+PiBXZSBjYW4gdXNlIHRoZSBidWlsZCBjb21tYW5kIHRvIGdldCB0aGUgc2ltcGxlc3Qg
dmVyc2lvbiBjcmFzaCB0b29sOgo+PiAJbWFrZSB0YXJnZXQ9UklTQ1Y2NCAtajIKPj4KPj4gU2ln
bmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNv
bT4KPj4gLS0tCj4+ICAgIE1ha2VmaWxlICAgICAgICAgICAgfCAgIDcgKy0KPj4gICAgUkVBRE1F
ICAgICAgICAgICAgICB8ICAgMiArLQo+PiAgICBjb25maWd1cmUuYyAgICAgICAgIHwgIDM5ICsr
KysrKysrKystCj4+ICAgIGRlZnMuaCAgICAgICAgICAgICAgfCAxNTUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gICAgZGlza2R1bXAuYyAgICAgICAgICB8
ICAxMSArKystCj4+ICAgIGhlbHAuYyAgICAgICAgICAgICAgfCAgIDIgKy0KPj4gICAgbGtjZF92
bWR1bXBfdjJfdjMuaCB8ICAgMiArLQo+PiAgICBuZXRkdW1wLmMgICAgICAgICAgIHwgICA5ICsr
LQo+PiAgICByYW1kdW1wLmMgICAgICAgICAgIHwgICAyICsKPj4gICAgcmlzY3Y2NC5jICAgICAg
ICAgICB8ICA1NiArKysrKysrKysrKysrKysrCj4+ICAgIHN5bWJvbHMuYyAgICAgICAgICAgfCAg
MTAgKysrCj4+ICAgIDExIGZpbGVzIGNoYW5nZWQsIDI4NSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKPj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2NjQuYwo+Pgo+PiBkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+PiBpbmRleCAxNjJjMmJhLi41NGViYjQzIDEwMDY0
NAo+PiAtLS0gYS9NYWtlZmlsZQo+PiArKysgYi9NYWtlZmlsZQo+PiBAQCAtNjQsNyArNjQsNyBA
QCBDRklMRVM9bWFpbi5jIHRvb2xzLmMgZ2xvYmFsX2RhdGEuYyBtZW1vcnkuYyBmaWxlc3lzLmMg
aGVscC5jIHRhc2suYyBcCj4+ICAgIAlrZXJuZWwuYyB0ZXN0LmMgZ2RiX2ludGVyZmFjZS5jIGNv
bmZpZ3VyZS5jIG5ldC5jIGRldi5jIGJwZi5jIFwKPj4gICAgCXByaW50ay5jIFwKPj4gICAgCWFs
cGhhLmMgeDg2LmMgcHBjLmMgaWE2NC5jIHMzOTAuYyBzMzkweC5jIHMzOTBkYmYuYyBwcGM2NC5j
IHg4Nl82NC5jIFwKPj4gLQlhcm0uYyBhcm02NC5jIG1pcHMuYyBtaXBzNjQuYyBzcGFyYzY0LmMg
XAo+PiArCWFybS5jIGFybTY0LmMgbWlwcy5jIG1pcHM2NC5jIHJpc2N2NjQuYyBzcGFyYzY0LmMg
XAo+PiAgICAJZXh0ZW5zaW9ucy5jIHJlbW90ZS5jIHZhX3NlcnZlci5jIHZhX3NlcnZlcl92MS5j
IHN5bWJvbHMuYyBjbWRsaW5lLmMgXAo+PiAgICAJbGtjZF9jb21tb24uYyBsa2NkX3YxLmMgbGtj
ZF92Ml92My5jIGxrY2RfdjUuYyBsa2NkX3Y3LmMgbGtjZF92OC5jXAo+PiAgICAJbGtjZF9maXhf
bWVtLmMgczM5MF9kdW1wLmMgbGtjZF94ODZfdHJhY2UuYyBcCj4+IEBAIC04NCw3ICs4NCw3IEBA
IE9CSkVDVF9GSUxFUz1tYWluLm8gdG9vbHMubyBnbG9iYWxfZGF0YS5vIG1lbW9yeS5vIGZpbGVz
eXMubyBoZWxwLm8gdGFzay5vIFwKPj4gICAgCWJ1aWxkX2RhdGEubyBrZXJuZWwubyB0ZXN0Lm8g
Z2RiX2ludGVyZmFjZS5vIG5ldC5vIGRldi5vIGJwZi5vIFwKPj4gICAgCXByaW50ay5vIFwKPj4g
ICAgCWFscGhhLm8geDg2Lm8gcHBjLm8gaWE2NC5vIHMzOTAubyBzMzkweC5vIHMzOTBkYmYubyBw
cGM2NC5vIHg4Nl82NC5vIFwKPj4gLQlhcm0ubyBhcm02NC5vIG1pcHMubyBtaXBzNjQubyBzcGFy
YzY0Lm8gXAo+PiArCWFybS5vIGFybTY0Lm8gbWlwcy5vIG1pcHM2NC5vIHJpc2N2NjQubyBzcGFy
YzY0Lm8gXAo+PiAgICAJZXh0ZW5zaW9ucy5vIHJlbW90ZS5vIHZhX3NlcnZlci5vIHZhX3NlcnZl
cl92MS5vIHN5bWJvbHMubyBjbWRsaW5lLm8gXAo+PiAgICAJbGtjZF9jb21tb24ubyBsa2NkX3Yx
Lm8gbGtjZF92Ml92My5vIGxrY2RfdjUubyBsa2NkX3Y3Lm8gbGtjZF92OC5vIFwKPj4gICAgCWxr
Y2RfZml4X21lbS5vIHMzOTBfZHVtcC5vIG5ldGR1bXAubyBkaXNrZHVtcC5vIG1ha2VkdW1wZmls
ZS5vIHhlbmR1bXAubyBcCj4+IEBAIC00MzgsNiArNDM4LDkgQEAgbWlwcy5vOiAke0dFTkVSSUNf
SEZJTEVTfSAke1JFREhBVF9IRklMRVN9IG1pcHMuYwo+PiAgICBtaXBzNjQubzogJHtHRU5FUklD
X0hGSUxFU30gJHtSRURIQVRfSEZJTEVTfSBtaXBzNjQuYwo+PiAgICAJJHtDQ30gLWMgJHtDUkFT
SF9DRkxBR1N9IG1pcHM2NC5jICR7V0FSTklOR19PUFRJT05TfSAke1dBUk5JTkdfRVJST1J9Cj4+
ICAgIAo+PiArcmlzY3Y2NC5vOiAke0dFTkVSSUNfSEZJTEVTfSAke1JFREhBVF9IRklMRVN9IHJp
c2N2NjQuYwo+PiArCSR7Q0N9IC1jICR7Q1JBU0hfQ0ZMQUdTfSByaXNjdjY0LmMgJHtXQVJOSU5H
X09QVElPTlN9ICR7V0FSTklOR19FUlJPUn0KPj4gKwo+PiAgICBzcGFyYzY0Lm86ICR7R0VORVJJ
Q19IRklMRVN9ICR7UkVESEFUX0hGSUxFU30gc3BhcmM2NC5jCj4+ICAgIAkke0NDfSAtYyAke0NS
QVNIX0NGTEFHU30gc3BhcmM2NC5jICR7V0FSTklOR19PUFRJT05TfSAke1dBUk5JTkdfRVJST1J9
Cj4+ICAgIAo+PiBkaWZmIC0tZ2l0IGEvUkVBRE1FIGIvUkVBRE1FCj4+IGluZGV4IDVhYmJjZTEu
LjVhYzViNjAgMTAwNjQ0Cj4+IC0tLSBhL1JFQURNRQo+PiArKysgYi9SRUFETUUKPj4gQEAgLTM3
LDcgKzM3LDcgQEAKPj4gICAgICBUaGVzZSBhcmUgdGhlIGN1cnJlbnQgcHJlcmVxdWlzaXRlczoK
Pj4gICAgCj4+ICAgICAgbyAgQXQgdGhpcyBwb2ludCwgeDg2LCBpYTY0LCB4ODZfNjQsIHBwYzY0
LCBwcGMsIGFybSwgYXJtNjQsIGFscGhhLCBtaXBzLAo+PiAtICAgICBtaXBzNjQsIHMzOTAgYW5k
IHMzOTB4LWJhc2VkIGtlcm5lbHMgYXJlIHN1cHBvcnRlZC4gIE90aGVyIGFyY2hpdGVjdHVyZXMK
Pj4gKyAgICAgbWlwczY0LCByaXNjdjY0LCBzMzkwIGFuZCBzMzkweC1iYXNlZCBrZXJuZWxzIGFy
ZSBzdXBwb3J0ZWQuICBPdGhlciBhcmNoaXRlY3R1cmVzCj4+ICAgICAgICAgbWF5IGJlIGFkZHJl
c3NlZCBpbiB0aGUgZnV0dXJlLgo+PiAgICAKPj4gICAgICBvICBPbmUgc2l6ZSBmaXRzIGFsbCAt
LSB0aGUgdXRpbGl0eSBjYW4gYmUgcnVuIG9uIGFueSBMaW51eCBrZXJuZWwgdmVyc2lvbgo+IAo+
IEZvciBSRUFETUUsIHBsZWFzZSBhcHBlbmQgYSBkZXNjcmlwdGlvbiBvZiB4ODZfNjQgYmluYXJ5
IGZvciByaXNjdjY0Cj4gZHVtcGZpbGVzIGhlcmU6Cj4gLS0tCj4gICAgIG8gIE9uIGFuIHg4Nl82
NCBob3N0LCBhbiB4ODZfNjQgYmluYXJ5IHRoYXQgY2FuIGJlIHVzZWQgdG8gYW5hbHl6ZQo+ICAg
ICAgICBwcGM2NGxlIGR1bXBmaWxlcyBtYXkgYmUgYnVpbHQgYnkgdHlwaW5nICJtYWtlIHRhcmdl
dD1QUEM2NCIuCgpTaG91bGRuJ3QgZGVidWdnaW5nIG9mIGEgcmlzY3Y2NCBjcmFzaCBiaW5hcnkg
YWxzbyBiZSBwb3NzaWJsZSBvbiByaXNjdjY0PwoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
