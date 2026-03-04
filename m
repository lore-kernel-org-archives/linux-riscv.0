Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B117EFCE47
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg5/TlZFrrkUcSMcKKO2gfaJfcZaOh3cIw8uhE6sScs=; b=bhfbpoej1RFZTz
	c+E91FdKZFHDZc/VtfE+9DHx0UAyGMW9bprAUswBhgJErvTfF4WSLCJBSXn4ofLAYzuk8p7nwPtGF
	3YyzM3soShkjvh+scMtV8LpNuCUXxcepuzUUv6r3GGE/m+iiV4PPhBiRgvSmI45FZFHnJEkeo0e4w
	czA+tLZE1AAsR3co0rsE74ggmEJkApihRJnxilHj0pSTaugrCq8oKk0DrixSsCELHk9hn+tXMJJuH
	iIhrUDGqG9fB3OQRy7tXNxjjxjRGs2/5Lqxq7lLLDqoucUZAnP4oWAY4+h5FJvsk6mG2T25mtjR4g
	lOc0TvsI6Gehpe7iyW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxub1-00000000Zai-1oee;
	Wed, 04 Mar 2026 22:21:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuay-00000000ZaN-0K8A
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 22:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772662890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5IdMjdarsoIwJ3LjCSMsVj14yfAGd7U/YMfplj+8xe4=;
	b=IDx90jzCuGvYCwrB8R5xPoYorKHrKcue5ZRfkKAQ/qELjj+q3iLNYpg9AF2kO9dG6GGQba
	6saQIs32h4kdEGQqw8aA6zszWJIZ7cm2pEmNzsV2uLz8PDtAv+LYMhqEhBmhFQOiTOl/b4
	pu+L+Op+xiJJvFV17Q4HRmJkwkViniM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-qFIcrvB_P5yIQc1lqltpWQ-1; Wed, 04 Mar 2026 17:21:29 -0500
X-MC-Unique: qFIcrvB_P5yIQc1lqltpWQ-1
X-Mimecast-MFC-AGG-ID: qFIcrvB_P5yIQc1lqltpWQ_1772662888
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4156491985a.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 14:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772662888; x=1773267688;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IdMjdarsoIwJ3LjCSMsVj14yfAGd7U/YMfplj+8xe4=;
        b=p77vNq6E7iEOO0K190E/vRIsJow3JFc/CkNxDFuInjnpz1H3i3ahMi6DMKic7/UeC3
         Its9iZMGibYR8emTjWDVCaIcRR1AHfG2U/MlM2rPNTv+lJMXSn8iav73tNdN3HzwmUVg
         iq5okibTRYJmmLzp/QfNjQcB0oFIIS1npGE6fSo+KXGSjO6AoYalOOzsbNlXjU3J/6Fy
         fw8u3TUV3V90bMNgSiPbtVc803LXbhnKKFOn563TOIor9cqOamhtWkkMmfY49Sd2Zkl6
         I+4mgO+Jhzcahl2SJQbEPEoOezomIKTjtd3y/FyQR5YexjChXWjEMCXYaprqnl5KVlD1
         KwCg==
X-Forwarded-Encrypted: i=1; AJvYcCUMNXEqtgDTb4p+HmFriGA4N1Xyw117tjCsCVWNyiuvN9TgPSBQ0eyy3kW3ghvEO5D8lEaBWD7mnA3cYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhJdwEvSt9gyc49CpSf8VHvXfeZji0nUG0M8qWq/HdPWK7+iPz
	JeMn7wx6hAIL9Fd2DZhSTk9d9ry/3RVvTqN3CoPxIwNT6FBXvby1QAtJjNr/ZX6OPg7xLkAiyiQ
	ggFoLeVh8VKQcQ8S+Znnp/qYBN/22q1AgntaQRWX7yQpvi/Apv2y4nzBZ6ctTgVaU/0A33Q==
X-Gm-Gg: ATEYQzyX3qoUkLfjraQMbLqUnoEHw7VOXrdXWYq70EcT80i8W5w3gTukdB8RyJJvgl5
	hkdlNw5zMnZkK12PASfs6rVFSqkDSI08hI5KCnobInLemwg5Jil8d1xpnpKH1/nZbxCnB4en+92
	2oaEQR0/sf8Mg2IczEjKv3JgmR+7vGHu4zhUzjzSoGlJGVtDJyAj2V52nmHn6e2jT+6vWjSAt8W
	khKYu5K0tYiYX7+UJp2F70bXO+a5fpkOgDFtSfaXEE5t8rLV9r/3UwzfqHp/N6p2KRmeyPRtRWZ
	xRcnDgF6DTlnFywUv1qo5nN6WS7Vy4UlHmvy7zAyhEiPdXFjCDVk/w9nCY3VAnW+MGduN+rhHnk
	0CUj3hVOTPY8PNleU2B33
X-Received: by 2002:a05:620a:472a:b0:8cb:4d46:7a4b with SMTP id af79cd13be357-8cd5afcce10mr459514485a.81.1772662888524;
        Wed, 04 Mar 2026 14:21:28 -0800 (PST)
X-Received: by 2002:a05:620a:472a:b0:8cb:4d46:7a4b with SMTP id af79cd13be357-8cd5afcce10mr459511385a.81.1772662887989;
        Wed, 04 Mar 2026 14:21:27 -0800 (PST)
Received: from redhat.com ([2600:382:7705:162f:3db4:e16a:e5d8:352e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf66b9d9sm1740582885a.12.2026.03.04.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:21:27 -0800 (PST)
Date: Wed, 4 Mar 2026 17:21:23 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aaiwYxQuoptMDbBk@redhat.com>
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
 <aadhd3LwZQPkT3A4@redhat.com>
 <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
 <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 13KlcwS0wcT03NCZXdvx6Iovy_Lb4QVf3dSbjVA0Vmk_1772662888
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_142132_211033_EB6FD9C8 
X-CRM114-Status: GOOD (  29.78  )
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

SGkgQW5pcnVkaCwKCk9uIFdlZCwgTWFyIDA0LCAyMDI2IGF0IDExOjUzOjM4QU0gLTA2MDAsIEFu
aXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiBTb3JyeSBmb3IgdGhlIGZvbGxvdyB1cCwgYnV0IHdh
bnRlZCB0byBydW4gc29tZXRoaW5nIGJ5IHlvdS4KPiAKPiBPbiBXZWQsIE1hciA0LCAyMDI2IGF0
IDEwOjQw4oCvQU0gQW5pcnVkaCBTcmluaXZhc2FuIDwKPiBhc3Jpbml2YXNhbkBvc3MudGVuc3Rv
cnJlbnQuY29tPiB3cm90ZToKPiA+Cj4gPiBIZWxsbyBCcmlhbiwKPiA+Cj4gPiBPbiBUdWUsIE1h
ciAzLCAyMDI2IGF0IDQ6MzLigK9QTSBCcmlhbiBNYXNuZXkgPGJtYXNuZXlAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFuaXJ1ZGgsCj4gPiA+Cj4gPiA+IFRoYW5rcyBmb3IgdGhl
IHBhdGNoLiBBIGZldyBtaW5vciBjb21tZW50cyBiZWxvdyB3aXRoIHNvbWUgbWlub3IKPiA+ID4g
bml0cGlja3MsIGFkZGl0aW9uYWwgcGxhY2VzIHRvIHVzZSBGSUVMRF9HRVQoKSwgcGx1cyBzb21l
IHN1Z2dlc3Rpb25zCj4gPiA+IGZvciBhZGRpdGlvbmFsIHJlZ21hcCBoZWxwZXJzIHRvIHVzZS4K
PiA+ID4KPiAKPiAKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgYXRsYW50aXNfY2xrX3Bs
bF9pc19lbmFibGVkKHN0cnVjdCBjbGtfaHcgKmh3KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAg
c3RydWN0IGF0bGFudGlzX2Nsa19wbGwgKnBsbCA9IGh3X3RvX2F0bGFudGlzX3BsbChodyk7Cj4g
PiA+ID4gKyAgICAgdTMyIHZhbCwgZW5fdmFsLCBjZ192YWw7Cj4gPiA+ID4gKwo+ID4gPiA+ICsg
ICAgIHJlZ21hcF9yZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcucmVnX29mZnNl
dCwgJnZhbCk7Cj4gPiA+ID4gKyAgICAgcmVnbWFwX3JlYWQocGxsLT5jb21tb24ucmVnbWFwLCBw
bGwtPmNvbmZpZy5lbl9yZWdfb2Zmc2V0LAo+ICZlbl92YWwpOwo+ID4gPiA+ICsgICAgIHJlZ21h
cF9yZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcuY2dfcmVnX29mZnNldCwKPiAm
Y2dfdmFsKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgLyogQ2hlY2sgaWYgUExMIGlzIHBvd2Vy
ZWQgb24sIGxvY2tlZCwgbm90IGJ5cGFzc2VkIGFuZCBHYXRlCj4gY2xrIGlzIGVuYWJsZWQgKi8K
PiA+ID4gPiArICAgICByZXR1cm4gISEoZW5fdmFsICYgUExMX0NGR19FTl9CSVQpICYmICEhKHZh
bCAmCj4gUExMX0NGR19MT0NLX0JJVCkgJiYKPiA+ID4gPiArICAgICAgICAgICAgKCFwbGwtPmNv
bmZpZy5jZ19yZWdfZW5hYmxlIHx8IChjZ192YWwgJgo+IHBsbC0+Y29uZmlnLmNnX3JlZ19lbmFi
bGUpKSAmJgo+ID4gPiA+ICsgICAgICAgICAgICAhKHZhbCAmIFBMTF9DRkdfQllQQVNTX0JJVCk7
Cj4gPiA+Cj4gPiA+IENvdWxkIHJlZ21hcF90ZXN0X2JpdHMoKSBtYWtlIHRoaXMgYSBiaXQgY2xl
YW5lcj8KPiA+ID4KPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIGludCBhdGxh
bnRpc19jbGtfcGxsX2VuYWJsZShzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ID4gPiArewo+ID4gPiA+
ICsgICAgIHN0cnVjdCBhdGxhbnRpc19jbGtfcGxsICpwbGwgPSBod190b19hdGxhbnRpc19wbGwo
aHcpOwo+ID4gPiA+ICsgICAgIHUzMiB2YWwsIGVuX3ZhbCwgY2dfdmFsOwo+ID4gPiA+ICsgICAg
IGludCByZXQ7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJlZ21hcF9yZWFkKHBsbC0+Y29tbW9u
LnJlZ21hcCwgcGxsLT5jb25maWcucmVnX29mZnNldCwgJnZhbCk7Cj4gPiA+ID4gKyAgICAgcmVn
bWFwX3JlYWQocGxsLT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5lbl9yZWdfb2Zmc2V0LAo+
ICZlbl92YWwpOwo+ID4gPiA+ICsgICAgIHJlZ21hcF9yZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwg
cGxsLT5jb25maWcuY2dfcmVnX29mZnNldCwKPiAmY2dfdmFsKTsKPiA+ID4gPiArCj4gPiA+ID4g
KyAgICAgLyogQ2hlY2sgaWYgUExMIGlzIGFscmVhZHkgZW5hYmxlZCwgbG9ja2VkLCBub3QgYnlw
YXNzZWQgYW5kCj4gR2F0ZSBjbGsgaXMgZW5hYmxlZCAqLwo+ID4gPiA+ICsgICAgIGlmICgoZW5f
dmFsICYgUExMX0NGR19FTl9CSVQpICYmICh2YWwgJiBQTExfQ0ZHX0xPQ0tfQklUKSAmJgo+ID4g
PiA+ICsgICAgICAgICAoIXBsbC0+Y29uZmlnLmNnX3JlZ19lbmFibGUgfHwgKGNnX3ZhbCAmCj4g
cGxsLT5jb25maWcuY2dfcmVnX2VuYWJsZSkpICYmCj4gPiA+ID4gKyAgICAgICAgICEodmFsICYg
UExMX0NGR19CWVBBU1NfQklUKSkgewo+ID4gPgo+ID4gPiBTYW1lIGFib3V0IHJlZ21hcF90ZXN0
X2JpdHMoKSBoZXJlLgo+ID4KPiA+IFRoZXNlIGluc3RhbmNlcyBoYXZlIGl0IHJlYWRpbmcgMyBk
aWZmZXJlbnQgcmVnaXN0ZXJzICh1bmxpa2UgYWxtb3N0Cj4gPiBhbGwgdGhlIG90aGVyIGV4YW1w
bGVzIHRoYXQganVzdCByZWFkIG9uZSkgYW5kIHRlc3RpbmcgYml0cyBhY3Jvc3MKPiA+IHRoZW0u
IEJ1dCBJIGd1ZXNzIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byB1c2UgdGVzdF9iaXRzIGhlcmUg
dG9vLiBJCj4gPiB3aWxsIHVwZGF0ZSB0aGVtLgo+IAo+IFRoaXMgZW5kcyB1cCBiZWNvbWluZyBs
aWtlIHRoaXMuCj4gCj4gc3RhdGljIGludCBhdGxhbnRpc19jbGtfcGxsX2lzX2VuYWJsZWQoc3Ry
dWN0IGNsa19odyAqaHcpCj4gCj4gewo+IAo+ICAgICAgICAgc3RydWN0IGF0bGFudGlzX2Nsa19w
bGwgKnBsbCA9IGh3X3RvX2F0bGFudGlzX3BsbChodyk7Cj4gCj4gCj4gCj4gCj4gICAgICAgICAv
KiBDaGVjayBpZiBQTEwgaXMgcG93ZXJlZCBvbiwgbG9ja2VkLCBub3QgYnlwYXNzZWQgYW5kIEdh
dGUgY2xrIGlzCj4gZW5hYmxlZCAqLwo+ICAgICAgICAgcmV0dXJuIHJlZ21hcF90ZXN0X2JpdHMo
cGxsLT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0LAo+IFBMTF9DRkdfTE9D
S19CSVQpICYmCj4gCj4gICAgICAgICAgICAgICAgIHJlZ21hcF90ZXN0X2JpdHMocGxsLT5jb21t
b24ucmVnbWFwLAo+IHBsbC0+Y29uZmlnLmVuX3JlZ19vZmZzZXQsIFBMTF9DRkdfRU5fQklUKSAm
Jgo+IAo+ICAgICAgICAgICAgICAgICByZWdtYXBfdGVzdF9iaXRzKHBsbC0+Y29tbW9uLnJlZ21h
cCwKPiBwbGwtPmNvbmZpZy5jZ19yZWdfb2Zmc2V0LCBwbGwtPmNvbmZpZy5jZ19yZWdfZW5hYmxl
KSAmJgo+IAo+ICAgICAgICAgICAgICAgICAhcmVnbWFwX3Rlc3RfYml0cyhwbGwtPmNvbW1vbi5y
ZWdtYXAsCj4gcGxsLT5jb25maWcucmVnX29mZnNldCwgUExMX0NGR19CWVBBU1NfQklUKTsKPiAK
PiB9Cj4gCj4gV2UgY2FuJ3QgdXNlIGEgc2luZ2xlIGNhbGwgb2YgcmVnbWFwX3Rlc3RfYml0cyB0
byB0aGUKPiBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0IHJlZ2lzdGVyIGNhdXNlIHdlIG5lZWQgdG8g
Y2hlY2sgaWYgUExMX0NGR19MT0NLX0JJVAo+IGlzIHNldCBhbmQgUExMX0NGR19CWVBBU1NfQklU
IGlzIHVuc2V0LiBXZSBlbmQgdXAgbmVlZGluZyB0byBtYWtlIDIgcmVhZHMKPiB0byB0aGF0IHJl
Z2lzdGVyLgo+IAo+IEFueSB0aG91Z2h0cyBvbiB3aGV0aGVyIEkgc2hvdWxkIHN0aWxsIGJlIHVz
aW5nIHJlZ21hcF90ZXN0X2JpdHMgaGVyZT8KCklmIGl0J3Mgbm90IGxvb2tpbmcgZ29vZCBpbiBw
cmFjdGljZSBvbmNlIHlvdSBpbXBsZW1lbnQgaXQsIHRoZW4ganVzdApmYWxsIGJhY2sgdG8gdGhl
IG9sZGVyIGJlaGF2aW9yLiBJdCB3YXMganVzdCBhIHN1Z2dlc3Rpb24uCgpJIGhhdmVuJ3QgdXNl
ZCB0aGlzIHlldCwgaG93ZXZlciB0aGVyZSBhcmUgYWxzbyB0aGUgcmVnbWFwX2ZpZWxkX3h4eCgp
CmhlbHBlcnMgdGhhdCBhcmUgYWxzbyBhdmFpbGFibGUuIGRyaXZlcnMvY2xrL21zdGFyL2Nsay1t
c2MzMTMtbXBsbC5jCnVzZXMgdGhlc2UgaGVscGVycy4gSSBkb24ndCBrbm93IGlmIGl0IHdvdWxk
IGhlbHAgdG8gc2ltcGxpZnkgeW91ciBjb2RlLgoKQnJpYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
