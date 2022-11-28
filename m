Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A9C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BR+b4b/FYEFI3IxiSGLu7z/41Ff0VmH/oZXyw4ojpSE=; b=a8N01+hGWmgdjg
	q/gqVdsdnsFa4jNxmQ74Q4jUN+cxqWN4uyq5TqI98gNrVLmBOHytOOw7v+1qv6gJ3cHHlFFCBwXip
	w02iAQev7Rpos8LqkfrgV6WDMw8eqWcNMbg8/dAxw5HdqYvzN2yESH8s1y8YD47TWlO45ZXR4GawQ
	yRhFcQFlD9uM/KcHgsf6mplZ7N1UjG8xYDtPmHVi/77cMG+7pR4bq9FScIWjIjQ2rIRL29JwIUlDX
	nYDTGjeDhlNddUm2rsCW0IGidNRAgwgIurER/S1gWbIubJf7Prv2RwjdJO6CUHvyc97/5hv8qO4QD
	vTU25TX5M4Yrr4+JIWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeUF-001xen-T8; Mon, 28 Nov 2022 13:47:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeUE-001xeF-4U
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 13:47:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AF8761018
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD28C433B5
	for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669643272;
	bh=NIiDTX0/IjK4dtjmZD7V/yynqbAg+//GHEozsLGxsH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KshPOnfyCLWznAToN31NfIcDe5aiv9hZ4ImkGtkeeQTuS+h/uB67zD68drnt1rDE9
	 +jchvlEWofzWlvtT9W/HKiEiNN59JmG89kfzFn8kcRpgZ3MUH3Xz5Ho5ldDiZ1NzFJ
	 48sOHmcjf2kz4yglz1DQ+1JJfr13tEdPXq5TACjGkZ8L1zcgWytyDWrk1UKfTq5sG6
	 EVKmmnVBayHhCvdmACKlayxkuCoMw4QF9yoyAKRd4WfM1MH/aTvf4a5cAmQN7bAzZx
	 40XIGddkJISHdSQE6aQYftGBHSwmWXT37xD4lIWC3VpeGuTZ7sCHX/iDrLtvvIuzV5
	 eRCdPbeqqKybg==
Received: by mail-ed1-f52.google.com with SMTP id r26so13386113edc.10
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 05:47:52 -0800 (PST)
X-Gm-Message-State: ANoB5pl4M3XVRBr2VqXxW0TxcRvKehw9970i788XTu7plWMpnPJ5rNod
	lhbKCouGbRzA9gNCMQWNELzM9xfpK/dqyqA7V9Y=
X-Google-Smtp-Source: AA0mqf6OstHFr9LXQIKXtrTh06ozPyE/vLgj4i6TNZweiP9SGhZTDlo9YNG10HsMJtPgy16G4zfXLz4CefuLXXk12zg=
X-Received: by 2002:aa7:d551:0:b0:468:fb2c:6c8c with SMTP id
 u17-20020aa7d551000000b00468fb2c6c8cmr45770506edr.340.1669643270988; Mon, 28
 Nov 2022 05:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20220923100149.2647325-1-suagrfillet@gmail.com> <CAAYs2=hx49ahtY3pe1z241Vd1mRNZjc-oigubmKy0aGqg6T8ag@mail.gmail.com>
In-Reply-To: <CAAYs2=hx49ahtY3pe1z241Vd1mRNZjc-oigubmKy0aGqg6T8ag@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 28 Nov 2022 21:47:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRfWXZEbAjWQ0vPA8HWihkibPQ2Mb9hvYgQg+DdEFrZTA@mail.gmail.com>
Message-ID: <CAJF2gTRfWXZEbAjWQ0vPA8HWihkibPQ2Mb9hvYgQg+DdEFrZTA@mail.gmail.com>
Subject: Re: [PATCH RESEND] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@linux.alibaba.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_054754_274171_DE395D6F 
X-CRM114-Status: GOOD (  18.77  )
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

T24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgNjoxMSBQTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiDk
uo4yMDIy5bm0OeaciDIz5pel5ZGo5LqUIDEwOjAz5YaZ6YGT77yaCj4gPgo+ID4gcmlzY3Ygbm93
IHVzZXMgLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgd2l0aCBkeW5hbWljIGZ0cmFjZSBhZnRl
cgo+ID4gdGhlIGBhZmM3NmI4YjhgIGNvbW1pdCwgd2hpY2ggbWVhbnMgcmVjb3JkbWNvdW50IHNo
b3VsZG4ndCBiZSBjYWxsZWQKVGhlIHJlZiBjb21taXQgZm9ybWF0IG5lZWRzIHRvIGJlIGNvcnJl
Y3RlZC4gT3RoZXJzOgpUZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPiA+
IHRvIGNyZWF0ZSB0aGUgX19tY291bnRfbG9jIHNlY3Rpb24gYmVmb3JlIHRoZSB2bWxpbnV4IGxp
bmtpbmcuCj4gPgo+ID4gV2Ugc2hvdWxkIHNlbGVjdCBGVFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFC
TEVfRlVOQ1RJT05fRU5UUlkgdG8gdGVsbAo+ID4gTWFrZWZpbGUgbm90IHRvIHJ1biByZWNvcmRt
Y291bnQuCj4gPgo+IEhpLEd1bzoKPgo+IENhbiB0aGlzIHBhdGNoIHNxdWVlemUgaW50byB5b3Vy
IHYzIHNlcmllcyA/ClRoZXkgZG9uJ3QgaGF2ZSBhIGRlcGVuZGVuY3ksIGFuZCBpdCdzIHVubmVj
ZXNzYXJ5LiBBIHNpbmdsZSBwYXRjaCBpcwplYXN5IGZvciB0aGUgbWFpbnRhaW5lciB0byBwaWNr
IHVwLgoKPgo+IFRoYW5rcywKPiBTb25nCj4gPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNodWFpIDxz
dWFncmZpbGxldEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAx
ICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCBjMjJm
NTgxNTU5NDguLjI1ZGI4Y2VhODc2YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBAQCAtMjQ2LDYgKzI0Niw3IEBAIGNv
bmZpZyBBUkNIX1JWNjRJCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlm
ICFYSVBfS0VSTkVMICYmIE1NVSAmJiAkKGNjLW9wdGlvbiwtZnBhdGNoYWJsZS1mdW5jdGlvbi1l
bnRyeT04KQo+ID4gICAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1Mg
aWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+ID4gICAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0VfTUNP
VU5UX1JFQ09SRCBpZiAhWElQX0tFUk5FTAo+ID4gKyAgICAgICBzZWxlY3QgRlRSQUNFX01DT1VO
VF9VU0VfUEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIGlmIERZTkFNSUNfRlRSQUNFCj4gPiAgICAg
ICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+ID4gICAgICAgICBzZWxlY3Qg
SEFWRV9GVU5DVElPTl9UUkFDRVIgaWYgIVhJUF9LRVJORUwKPiA+ICAgICAgICAgc2VsZWN0IFNX
SU9UTEIgaWYgTU1VCj4gPiAtLQo+ID4gMi4yMC4xCj4gPgoKCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
