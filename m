Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61F5C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+CzW8Eii8b8gAGas4xKinMX7jZyAMC7zIzUOGpAmNI=; b=Ly/zRnsWnIrPHS
	EiNc/ymY8hh/1W8JAVYdqmkO7fAg9JygYl/DERkjYw+ODXNTXbrT9mxiyPWcACwNwZAoQfzOojEcu
	Y8xC76pSUrvjUVy4gf8vjV/COt50zcIgB+MPGA9OxXLiD5tCsb4nin3MYqpalai5q20U0yadTZgQ0
	TKPDC3cEVfSrGPjzM1g3ot7ZqXYy/dxIL89qwZ2XWzRVB7kQPKfa5egxoI49NvjQ1UsgsfUhml7Xu
	b/PB48lqoTNJjlTQwO6TUahhLWyAMWx8EZKYN90B0dHdtUE5rIx3HWKkLQJ1rWENBAuBsYk8Si7sw
	Wa56rC64U6K6RP91UKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBS9-0000000Bw1y-3qsh;
	Tue, 05 Aug 2025 06:47:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBJV-0000000BuiE-3BF8
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 06:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E928DA55BDC;
	Tue,  5 Aug 2025 06:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA29C4CEF4;
	Tue,  5 Aug 2025 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754375900;
	bh=8d7lQ+bhoPsmFsa1MIngmQ0m5Nr+uRObrl36ZfQiDrI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LqmA5t7mJbOw85Yc5AKoUnfbM5kB2zW3Ed2Qi5Psb7G4aeX8SuzJW1be/pAN4RG8+
	 R9syhpjBP0LAXUBohfI86R8S5mP1ZDmITx9UMwZi+cdRyWVjPBvQVJOeub5DEn6eQW
	 0YSX+1Qbe7U6jYCDnAVPYTDnuVa2V8mc9Nl98uxf6wwSHZy8I6qKSD7YKc6llR/Q9l
	 juw7TU6MfEM/WQHcJYpGi0DRoWO86YteUog6USFInEhnICNAcMhF6M0MiqATtRspUf
	 mCe+xAJ9DpcEgoNi3JtueEI9bLgBqiNjqFokbtZjnx/5NQEHd6uNZRC3HVF/PTR9Rn
	 AnIPea5OI7Jgg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Pu Lehui
 <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
Date: Tue, 05 Aug 2025 08:38:17 +0200
Message-ID: <87v7n21deu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_233821_982061_D67CCA86 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBwYXRjaCAxLTMgcmVmYWN0b3IgcmVkdW5kYW50
IGxvYWQgYW5kIHN0b3JlIG9wZXJhdGlvbnMuCj4gcGF0Y2ggNC03IGFkZCBaYWNhcyBpbnN0cnVj
dGlvbnMgZm9yIGNtcHhjaGcuCj4gcGF0Y2ggOCBvcHRpbWl6ZXMgZXhjZXB0aW9uIHRhYmxlIGhh
bmRsaW5nLgo+IHBhdGNoIDktMTAgYWRkIHN1cHBvcnQgYXJlbmEgYXRvbWljcyBmb3IgUlY2NC4K
Pgo+IFRlc3RzIGB0ZXN0X3Byb2dzIC10IGF0b21pYyxhcmVuYWAgaGF2ZSBwYXNzZWQgYXMgc2hv
d24gYmVsbG93LAo+IGFzIHdlbGwgYXMgYHRlc3RfdmVyaWZpZXJgIGFuZCBgdGVzdF9icGYua29g
IGhhdmUgcGFzc2VkLgoKWy4uLl0KCj4gUHUgTGVodWkgKDEwKToKPiAgIHJpc2N2LCBicGY6IEV4
dHJhY3QgZW1pdF9zdHgoKSBoZWxwZXIKPiAgIHJpc2N2LCBicGY6IEV4dHJhY3QgZW1pdF9zdCgp
IGhlbHBlcgo+ICAgcmlzY3YsIGJwZjogRXh0cmFjdCBlbWl0X2xkeCgpIGhlbHBlcgo+ICAgcmlz
Y3Y6IFNlcGFyYXRlIHRvb2xjaGFpbiBzdXBwb3J0IGRlcGVuZGVuY3kgZnJvbSBSSVNDVl9JU0Ff
WkFDQVMKPiAgIHJpc2N2LCBicGY6IEFkZCBydl9leHRfZW5hYmxlZCBtYWNybyBmb3IgcnVudGlt
ZSBkZXRlY3Rpb24gZXh0ZW50c2lvbgo+ICAgcmlzY3YsIGJwZjogQWRkIFphY2FzIGluc3RydWN0
aW9ucwo+ICAgcmlzY3YsIGJwZjogT3B0aW1pemUgY21weGNoZyBpbnNuIHdpdGggWmFjYXMgc3Vw
cG9ydAo+ICAgcmlzY3YsIGJwZjogQWRkIGV4X2luc25fb2ZmIGFuZCBleF9qbXBfb2ZmIGZvciBl
eGNlcHRpb24gdGFibGUKPiAgICAgaGFuZGxpbmcKPiAgIHJpc2N2LCBicGY6IEFkZCBzdXBwb3J0
IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQKPiAgIHNlbGZ0ZXN0cy9icGY6IEVuYWJsZSBhcmVuYSBh
dG9taWNzIHRlc3RzIGZvciBSVjY0Cj4KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxIC0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hn
LmggICAgICAgICAgICAgIHwgICA2ICstCj4gIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAg
ICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAg
ICAgICAgICAgICAgICAgICB8ICA3MCArKy0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyAgICAgICAgICAgICAgIHwgNTE2ICsrKysrLS0tLS0tLS0tLS0tLQo+ICAuLi4vc2VsZnRl
c3RzL2JwZi9wcm9ncy9hcmVuYV9hdG9taWNzLmMgICAgICAgfCAgIDkgKy0KPiAgNiBmaWxlcyBj
aGFuZ2VkLCAyMTQgaW5zZXJ0aW9ucygrKSwgMzg5IGRlbGV0aW9ucygtKQoKV2hhdCBhIG5pY2Ug
c2VyaWVzISBUaGUgYmVzdCBraW5kIG9mIGNoYW5nZXNldCAtLSBuZXcgZmVhdHVyZSwgbGVzcwpj
b2RlISBUaGFuayB5b3UsIExlaHVpISBBZ2FpbiwgYXBvbG9naWVzIGZvciB0aGUgaG9ycmlibGUg
U0xBLiBUaGUKd2VhdGhlciBpbiBTd2VkZW4gd2FzIHNpbXBseSBUb28gR29vZCB0aGlzIHN1bW1l
ciEKClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPiAjIFFFTVUg
b25seQpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
