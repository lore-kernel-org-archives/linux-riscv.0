Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654CCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sX4OHxDiS1j8qO5uP67NbtCyVELXLsgSLRLW14J26s=; b=YfApst8M75P0jGkTONhlkQW5OA
	BDB7SUhQnQ9Mzcv5m3OoYHzJ4BBxFpV+ifH2RNCtYmd5gunJigaScFU5gKnoypGmHedqaNY2Evk19
	34cUDknCi/4v9sz8k+nAVj8AIpperQHwZgqDYFxzpHWKxohakIT8Z92TXXuApPeZs6YaeZZQvdYbS
	Z8OAaikOLkMWAmFRFI+rYfuofvYUNpceeCDCzlAEewetNOaFWovqyBuIXa9uRqEkpHJ0kJeOz6rl5
	lnninOUA+u1lMmC1yWiFoXITeEeV0LnKYDR0W4+HSCoQDX8WlmteBo2yV5jGpbprU2hfOH5F5y+4m
	06mQFkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1nO-0000000GWit-17JE;
	Wed, 03 Apr 2024 14:40:58 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1nL-0000000GWhF-3jcu
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 14:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uicBnio8bSF9DNnpycUBJL1Q+Lal4LWdPwlItPeKwW8=; b=IPdAwJabygxRsrSF9Q+IWM4qvL
	DkEc3QUZnw0Hfp0paVdxSRdz/YF3XvHnIx5vZDQ6VEbqjmKXWScvLYOh18FCMfIcwdV0UeKhOKTAO
	rWgyf9XmSmOEx75/T5fAFJbfgNkuqPzeS2rwzc19BsbboL2qler/bq8/4GkWjfqWUuVgH+Mkshx/r
	ouABhQnMmViDhug5/DN1P10PAUO0I7Lj0KoBEp8u8PDGdYDFTC4FFd1EAIXEtr4/z1ggbMfeIiXoo
	vRpclL+AtnZsqgunSl3N5KMB3iQ3mBoUbR8jGN8Pdyre7mvKCR7QPY1GDUgkRtUbAeGrhXO9do2e3
	mTnKXw2g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1rs1n6-000Oqk-CH; Wed, 03 Apr 2024 16:40:40 +0200
Received: from [178.197.248.12] (helo=linux.home)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1rs1n5-001zbP-0p;
	Wed, 03 Apr 2024 16:40:39 +0200
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Add testcase where 7th
 argment is struct
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240403072818.1462811-1-pulehui@huaweicloud.com>
 <20240403072818.1462811-3-pulehui@huaweicloud.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <0f459fc1-1445-6e83-ace4-b2c42abfe884@iogearbox.net>
Date: Wed, 3 Apr 2024 16:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20240403072818.1462811-3-pulehui@huaweicloud.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27234/Wed Apr  3 10:25:27 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_074055_947707_23946B8F 
X-CRM114-Status: GOOD (  14.02  )
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

T24gNC8zLzI0IDk6MjggQU0sIFB1IExlaHVpIHdyb3RlOgo+IEZyb206IFB1IExlaHVpIDxwdWxl
aHVpQGh1YXdlaS5jb20+Cj4gCj4gQWRkIHRlc3RjYXNlIHdoZXJlIDd0aCBhcmd1bWVudCBpcyBz
dHJ1Y3QgZm9yIGFyY2hpdGVjdHVyZXMgd2l0aCA4Cj4gYXJndW1lbnQgcmVnaXN0ZXJzLCBhbmQg
aW5jcmVhc2UgdGhlIGNvbXBsZXhpdHkgb2YgdGhlIHN0cnVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvREVOWUxJ
U1QuYWFyY2g2NCAgfCAgMSArCj4gICAuLi4vc2VsZnRlc3RzL2JwZi9icGZfdGVzdG1vZC9icGZf
dGVzdG1vZC5jICAgfCAxOSArKysrKysrKysrCj4gICAuLi4vc2VsZnRlc3RzL2JwZi9wcm9nX3Rl
c3RzL3RyYWNpbmdfc3RydWN0LmMgfCAxMyArKysrKysrCj4gICAuLi4vc2VsZnRlc3RzL2JwZi9w
cm9ncy90cmFjaW5nX3N0cnVjdC5jICAgICAgfCAzNSArKysrKysrKysrKysrKysrKysrCj4gICA0
IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFhcmNoNjQgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvREVOWUxJU1QuYWFyY2g2NAo+IGluZGV4IGQ4YWRlMTVlMjc4OS4uNjM5ZWUz
ZjViYzc0IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElT
VC5hYXJjaDY0Cj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL0RFTllMSVNULmFh
cmNoNjQKPiBAQCAtNiw2ICs2LDcgQEAga3Byb2JlX211bHRpX3Rlc3QgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICMgbmVlZHMgQ09ORklHX0ZQUk9CRQo+ICAgbW9kdWxlX2F0dGFjaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgcHJvZyAna3Byb2JlX211bHRpJzog
ZmFpbGVkIHRvIGF1dG8tYXR0YWNoOiAtOTUKPiAgIGZlbnRyeV90ZXN0L2ZlbnRyeV9tYW55X2Fy
Z3MgICAgICAgICAgICAgICAgICAgICAjIGZlbnRyeV9tYW55X2FyZ3M6RkFJTDpmZW50cnlfbWFu
eV9hcmdzX2F0dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAtNTI0Cj4gICBmZXhpdF90ZXN0L2ZleGl0
X21hbnlfYXJncyAgICAgICAgICAgICAgICAgICAgICAgIyBmZXhpdF9tYW55X2FyZ3M6RkFJTDpm
ZXhpdF9tYW55X2FyZ3NfYXR0YWNoIHVuZXhwZWN0ZWQgZXJyb3I6IC01MjQKPiArdHJhY2luZ19z
dHJ1Y3QgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgdGVzdF9mZW50cnk6RkFJ
TDp0cmFjaW5nX3N0cnVjdF9fYXR0YWNoIHVuZXhwZWN0ZWQgZXJyb3I6IC01MjQKCkRvIHdlIG5l
ZWQgdG8gYmxhY2tsaXN0IHRoZSB3aG9sZSB0ZXN0IGdpdmVuIGl0IGhhZCBjb3ZlcmFnZSBvbiBh
cm02NApiZWZvcmUuLiBwZXJoYXBzIHRoaXMgdGVzdCBoZXJlIGNvdWxkIGJlIGRvbmUgYXMgYSBu
ZXcgc3VidGVzdCBhbmQgb25seQp0aGF0IG9uZSBpcyBsaXN0ZWQgZm9yIGFybTY0PwoKPiAgIGZp
bGxfbGlua19pbmZvL2twcm9iZV9tdWx0aV9saW5rX2luZm8gICAgICAgICAgICAjIGJwZl9wcm9n
cmFtX19hdHRhY2hfa3Byb2JlX211bHRpX29wdHMgdW5leHBlY3RlZCBlcnJvcjogLTk1Cj4gICBm
aWxsX2xpbmtfaW5mby9rcmV0cHJvYmVfbXVsdGlfbGlua19pbmZvICAgICAgICAgIyBicGZfcHJv
Z3JhbV9fYXR0YWNoX2twcm9iZV9tdWx0aV9vcHRzIHVuZXhwZWN0ZWQgZXJyb3I6IC05NQo+ICAg
ZmlsbF9saW5rX2luZm8va3Byb2JlX211bHRpX2ludmFsaWRfdWJ1ZmYgICAgICAgICMgYnBmX3By
b2dyYW1fX2F0dGFjaF9rcHJvYmVfbXVsdGlfb3B0cyB1bmV4cGVjdGVkIGVycm9yOiAtOTUKClRo
YW5rcywKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
