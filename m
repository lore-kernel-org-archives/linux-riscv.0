Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B559C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt64UYo1aRN5gALvqRaSyswdKOwOnpda/O/HCHWsp94=; b=p2rCubJM1RxwZM
	8VC6/10EfpnXSeHoOUt0KLyaMx3m+bdmfKWe5+3zm6gCWPyP/RxkAzrcdXcTtbKNOuO8+SF1sf87P
	aUWjHKnY36V+T+pEfqkMgEggnuzGb+ynxBJIsc2zU41nab34xcwgItznQXCHkl+Rq+iLonqfj5L/a
	1KHQouKjPtybYH63hLIsfGclewhNrEIf23byDuOG3TY/nHvV2XuqgWZKwh02aTnTsBWGMNGiwpJHb
	FcCWOlwpqCrW16IZEqS8U2cX8jyl3MTSujnA6en/uL0waKAcgCCdbqTR1DlwOpu0TYkKxLxl+KWYd
	0d3fbg3F8Ww1YxV8sIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Djf-0000000551l-0IZT;
	Sun, 06 Sep 2026 14:20:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Dje-0000000551e-28hi
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 14:20:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 916D5600AA;
	Sun,  6 Sep 2026 14:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48D81F00A3A;
	Sun,  6 Sep 2026 14:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788704441;
	bh=0F1azxiMxjgKsUcEaIZbzvHWVTHkjTn5dRyqXspuLL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ELb99cvo0evuCmxptKEsJk8cWtGxtnh626IQnH09g+HlTzMSC+eiqvhOZeoob0zrv
	 EEL1tb7YbHjAocfoMPO0VntXZgkhKB74RRYfgPvnJX9wxTheLHQvfHW5YKA3b5THLP
	 JJvGu6JuYhnSeWailjn9o6R4YY7gQMwVw/2Zm/qJ0SD+nKzvmjgaPBwM8zsciizzs7
	 3VS0I9oVevjratMqLqhCeJanBEHEmLVOr3HiajOaR84DZDZsPJ2n4J6SJNdWfRDNeS
	 ef7fXtqnUzJHpZCo1mdU8fB4uka+eQCYc1Y3MDNlzdfARNZfr8YfGxgvk5j5pB4OdN
	 KtTrLZKoSjs7Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 puranjay@kernel.org
Cc: ihor.solodrai@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, pulehui@huawei.com, pjw@kernel.org,
 palmer@dabbelt.com, guoren@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH bpf v2] bpf, riscv: Make arena support depend on ZACAS
In-Reply-To: <20260902061451.1416-1-cp0613@linux.alibaba.com>
References: <20260902061451.1416-1-cp0613@linux.alibaba.com>
Date: Sun, 06 Sep 2026 16:20:37 +0200
Message-ID: <874ig2pikq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

Q2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4gd3JpdGVzOgoKPiBUaGUgYXJlbmEg
cmFuZ2UgdHJlZSBhbGxvY2F0ZXMgaXRzIG5vZGVzIHdpdGgga21hbGxvY19ub2xvY2soKSBzaW5j
ZQo+IGNvbW1pdCBmOGM2N2Q4NTUwZWUgKCJicGY6IFVzZSBrbWFsbG9jX25vbG9jaygpIGluIHJh
bmdlIHRyZWUiKS4KPiBrbWFsbG9jX25vbG9jaygpIHJlcXVpcmVzIHNsYWIgY2FjaGVzIHdpdGgg
Y21weGNoZzEyOCBzdXBwb3J0Cj4gKF9fQ01QWENIR19ET1VCTEUpOyBvbiByaXNjdiBjbXB4Y2hn
MTI4IGlzIHByb3ZpZGVkIGJ5IHRoZSBaQUNBUwo+IGV4dGVuc2lvbi4gT24gc3lzdGVtcyB3aXRo
b3V0IFpBQ0FTIGV2ZXJ5IGFyZW5hIG1hcCBjcmVhdGlvbiBmYWlscwo+IHdpdGggYSBtaXNsZWFk
aW5nIC1FTk9NRU0uCj4KPiBSZXBvcnQgdGhlIG1pc3Npbmcgc3VwcG9ydCBpbnN0ZWFkOiBtYWtl
IGJwZl9qaXRfc3VwcG9ydHNfYXJlbmEoKQo+IHJldHVybiBzeXN0ZW1faGFzX2NtcHhjaGcxMjgo
KSB3aGVyZSBpdCBpcyBkZWZpbmVkLCBzbyBhcmVuYSBtYXAKPiBjcmVhdGlvbiBmYWlscyB3aXRo
IC1FT1BOT1RTVVBQIG9uIHN5c3RlbXMgd2l0aG91dCBaQUNBUy4gVGhlIG1hY3JvCj4gaXMgb25s
eSBkZWZpbmVkIHdoZW4gYm90aCBDT05GSUdfUklTQ1ZfSVNBX1pBQ0FTIGFuZAo+IENPTkZJR19U
T09MQ0hBSU5fSEFTX1pBQ0FTIGFyZSBlbmFibGVkLCBzbyBndWFyZCBpdCB3aXRoICNpZmRlZiB0
aGUKPiBzYW1lIHdheSBtbS9zbGFiLmggY29uc3VtZXMgaXQsIGFuZCByZWplY3QgYXJlbmEgb3Ro
ZXJ3aXNlLiBUaGlzCj4gbWF0Y2hlcyBob3cgYXJlbmEgQlBGX0NNUFhDSEcgaW5zdHJ1Y3Rpb25z
IGFyZSBhbHJlYWR5IGdhdGVkIG9uIFpBQ0FTCj4gaW4gYnBmX2ppdF9zdXBwb3J0c19pbnNuKCku
Cj4KPiBGaXhlczogZjhjNjdkODU1MGVlICgiYnBmOiBVc2Uga21hbGxvY19ub2xvY2soKSBpbiBy
YW5nZSB0cmVlIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6
IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiAtIEd1YXJkIHN5c3RlbV9oYXNfY21weGNoZzEyOCgpIHdpdGggI2lmZGVmIGluc3Rl
YWQgb2YgY2FsbGluZyBpdAo+ICAgdW5jb25kaXRpb25hbGx5OiB0aGUgbWFjcm8gaXMgb25seSBk
ZWZpbmVkIHdoZW4gYm90aAo+ICAgQ09ORklHX1JJU0NWX0lTQV9aQUNBUyBhbmQgQ09ORklHX1RP
T0xDSEFJTl9IQVNfWkFDQVMgYXJlIGVuYWJsZWQKPiAgIChhcyByZXBvcnRlZCBieSBzYXNoaWtv
LWJvdCksIHNvIHYxIGJyb2tlIHRoZSBidWlsZCB3aGVuIGVpdGhlcgo+ICAgd2FzIGRpc2FibGVk
LiBUaGlzIG1pcnJvcnMgaG93IG1tL3NsYWIuaCBjb25zdW1lcyB0aGUgbWFjcm8uCj4KPiBXaHkg
I2lmZGVmIHJhdGhlciB0aGFuIHJ2X2V4dF9lbmFibGVkKFpBQ0FTKT8gVGhlIHByZWRpY2F0ZXMg
ZGlmZmVyCj4gZXhhY3RseSBpbiB0aGUgY29uZmlndXJhdGlvbnMgdGhhdCBtYXR0ZXI6Cj4KPiAg
IHNjZW5hcmlvIChJU0FfWkFDQVMvVE9PTENIQUlOL2h3KSAgdjEgICAgICAgICAgIHJ2X2V4dF9l
bmFibGVkICAjaWZkZWYKPiAgIElTQT1uIG9yIFRPT0xDSEFJTj1uICAgICAgICAgICAgICAgYnVp
bGQgZmFpbHMgIHJlamVjdHMgICAgICAgICByZWplY3RzCj4gICBJU0E9eSBUT09MQ0hBSU49biBo
dyBoYXMgWkFDQVMgICAgIGJ1aWxkIGZhaWxzICBhY2NlcHRzLCB0aGVuICAgcmVqZWN0cwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLUVOT01FTSBh
Z2Fpbgo+ICAgSVNBPXkgVE9PTENIQUlOPXkgaHcgaGFzIFpBQ0FTICAgICBleGFjdCAgICAgICAg
ZXhhY3QgICAgICAgICAgIGV4YWN0CgpUaGFua3MgZm9yIGNsYXJpZnlpbmcgdGhpczsgWWVhaCwg
WkFDQVMgcmVxdWlyZXMgcnVudGltZSAqYW5kKiB0b29sY2hhaW4Kc3VwcG9ydC4KCkFja2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
