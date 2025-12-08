Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA882D3B7DE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkrW6h/ZuXUjNJQ1K7PxHX6Ist8ceK8wkIoveJyk7fw=; b=wnBDCk1CoTBACg
	THi14EKMb5l8nQvVIjpymFEh3alO/8bnz20ph15C5nfsLLnnd5zPdmLx1gYQTP1f0vYFkxLgD4wvP
	uCWjh3qV2owMr1eQW9VwWKT7IYIVsavGiPnBLrMm57jbmHZQzsnO5lbBhZaW1TnYQ0tOzPqzKw/w5
	ffP467nfyZGeZBjit2HfTHOspV4gEhbXLTs8yk5nV7UWa0Y7HxDJ/eqrZo42ipAaF/l+hSETI9DLu
	0318wwQQ/+y1+K7ygW662eDg8hNxbTF4PFsri3UnW3KMiRY5U63vxr5B4EjQS0Wa/iUKDgC3Gz73E
	uStRPUCor2K4SyoveU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZbq-0000000D1KS-3uwR;
	Mon, 08 Dec 2025 11:40:54 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZbo-0000000D1JM-1IZk
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 11:40:54 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-44ffaeda17fso2078738b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Dec 2025 03:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765194051; x=1765798851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQVOH2B/Iq6YYMqj4RgBo/zVXWWLuhChDWBfQft/cck=;
        b=lcN4P5EpX/Fo0K9u7MdlBHTkPcW0O8GhOaed0zvbIQJt12ieW7nwbOUq8vCOhQk3GQ
         RBQ1L0SWZaSbByDWDDOMAI9vTA5cgvMfeqSQWpG/WZxROIXcvvUA381eynYan37Va4LB
         6quCw8FlOY3vi8j8jKjmLpUbOifQ1YMe6n9JrTh25OLST+m8RBzLPnjZ0R8lhI1RQswS
         QxXjE/bE18YqnjadT5qhUFV5K7AvLDxM4/h5ChbhggLEI70Xxlx28FtIL9HCB0YWQUwo
         +qsxzpRWxdL/i/pjrlGtFA7JVQ4oDFhD9882jIuEsf5yzQvlc8ahGYbTnsACas2qCHFc
         I3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765194051; x=1765798851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SQVOH2B/Iq6YYMqj4RgBo/zVXWWLuhChDWBfQft/cck=;
        b=cOKmUngXCtv6DEG3stSHHEGhpmfuEg6FPG/B+4ATob6u143r7J2lsbM2fNKBT32byB
         LRG6kRSaEYCQsVbZfm/aFE7Ak7qSsatpfIdcu/MJ/nx+avGcRmOjjcMU6yK1cgu/EVWg
         sxJAnMHq/5Zk8dufe0ine6dzHWKvc6QqMNu9XDY7FLwmB1TtL4zPE5rOz5lQ/YFHbBHd
         Gkt1rqonMCRU0mgux+zxwWA1TevhieCKpGQ0f/nBI63y1uUCUAr1Gm2g2HPFO0rBHRrp
         m/ksespthfoYvu7KehKtNuFi4t/DMFTNocewdvEZrcivoQaRwgNdtm94F4nPtz0/vMap
         sVKw==
X-Forwarded-Encrypted: i=1; AJvYcCWz+4fvSpCQJL5aWs5AHg0mFq9dsdghVpRVctTUpxato1F7UZbFy4vsrclTw3YdO6zVo32xTfz3CqEKMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfdpzVBAs2VcNMuGX+nPnSbHeHMVLIGAA6djMUADcTjKn3L1WT
	Jw4ZPknKwIi4kJof7VbALM8K3HUXqZuY8RgQKlOALxH+cFnGDSBj0DIqzY+AUCcP7yDtuUqSCmD
	ckOU0AZV4dwFtQXMlGRB2o+vKD7ZqDd/wNdRu85R9tg==
X-Gm-Gg: ASbGncvRyNVvro4o7aYFI2DvN03IcwFWD3iNtzdluefLNbsqwuc6FZR1ctsPLhdrxgP
	2BHdDGIRVeD/cHa7971fqrJpmlAOcYlcxnrfwUbC6qKP6dhqW8MZ/Jrm8IdutMUsTNq0Eof7PcE
	PCtBJgMH0suu5B6+PtJFKfY2Bvd9Hua5DvuQ1odnYW7Df7AFmqZcsAJnpVtwg5fNoAoPtVeTPn8
	62slId1Rcadw7i1LyzIckqRZDoriy4psXRmvoClQdiBrNcIDoKUwC2F/n+0emk4agw80cZtcyxq
	Ng==
X-Google-Smtp-Source: AGHT+IEECWwcEtv7SAXdvNWHH/vuEB3o8C72qYNlg5nTdw0L4CUHSC5qHDSb+PMHbRUu0R+XZrhTguRpCMBK3ZSfIxI=
X-Received: by 2002:a05:6808:e82:b0:450:3124:53b7 with SMTP id
 5614622812f47-4539e0cb238mr2880346b6e.67.1765194050990; Mon, 08 Dec 2025
 03:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com> <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
In-Reply-To: <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 8 Dec 2025 19:40:39 +0800
X-Gm-Features: AQt7F2p_htORIVLmGKEXqzC2TV1lLZw4ZgAjVo77H4ntTApfAZuYosNPg5AAU54
Message-ID: <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_034052_360186_5248284A 
X-CRM114-Status: GOOD (  20.64  )
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

SGkgUmFkaW0sCgpPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDk6MTbigK9QTSBSYWRpbSBLcsSNbcOh
xZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTEyLTA0VDEzOjI4
OjQ1KzA4OjAwLCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT46Cj4gPiBIaSBS
YWRpbSwKPiA+Cj4gPiBPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDEyOjA34oCvUE0gUmFkaW0gS3LE
jW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gMjAyNS0x
MS0yN1QyMDo1MzowMiswODowMCwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Ogo+ID4+ID4gVXNlIE5NSSBpbnN0ZWFkIG9mIElQSSBmb3IgQ1BVIHN0b3AgaWYgUklTQy1WIFNT
RSBOTUkgaXMgc3VwcG9ydGVkLgo+ID4+ID4KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9zc2Vfbm1pLmMgYi9kcml2ZXJzL2Zpcm13
YXJlL3Jpc2N2L3Jpc2N2X3NzZV9ubWkuYwo+ID4+ID4gQEAgLTU4LDYgKzU4LDcgQEAgc3RhdGlj
IGludCBsb2NhbF9ubWlfaGFuZGxlcih1MzIgZXZ0LCB2b2lkICphcmcsIHN0cnVjdCBwdF9yZWdz
ICpyZWdzKQo+ID4+ID4gICAgICAgdHlwZSA9IGF0b21pY19yZWFkKHRoaXNfY3B1X3B0cigmbG9j
YWxfbm1pKSk7Cj4gPj4gPgo+ID4+ID4gICAgICAgTk1JX0hBTkRMRShMT0NBTF9OTUlfQ1JBU0gs
IGNwdV9jcmFzaF9zdG9wLCBjcHUsIHJlZ3MpOwo+ID4+ID4gKyAgICAgTk1JX0hBTkRMRShMT0NB
TF9OTUlfU1RPUCwgY3B1X3N0b3ApOwo+ID4+Cj4gPj4gUGxlYXNlIGRvY3VtZW50IHRoZSBpbnRl
bmRlZCBwcmVlbXB0aW9uIGRlc2lnbiBmb3IgYWxsIFNTRSBldmVudHMsCj4gPj4gYmVjYXVzZSBp
dCB3aWxsIGJlIGEgbmlnaHRtYXJlIGlmIHdlIGZvcmdldCBzb21lIGFzc3VtcHRpb25zIGluIHRo
ZQo+ID4+IGNvbWluZyB5ZWFycy4gIChUaGF0IGluY2x1ZGVzIHRoZSByZWxhdGl2ZSBwcmlvcml0
aWVzIG9mIFJBUy9QTVUvLi4uKQo+ID4KPiA+IEFjdHVhbGx5LCBMT0NBTF9OTUlfQ1JBU0gsIExP
Q0FMX05NSV9TVE9QLCBMT0NBTF9OTUlfQkFDS1RSQUNFLAo+ID4gTE9DQUxfTk1JX0tHREIsIC4u
LiBhcmUgYWxsIGltcGxlbWVudGVkIHZpYSB0aGUgc2luZ2xlIFNTRSBldmVudAo+ID4gU0JJX1NT
RV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRC4gUGVyIHRoZSBTU0UgZGVzaWduLCBubwo+
ID4gcHJlZW1wdGlvbiB3aWxsIG9jY3VyIGFtb25nIENSQVNILCBTVE9QLCBCQUNLVFJBQ0UsIGFu
ZCBLR0RCIGV2ZW50cy4KPgo+IFRoYXQgaXMgaG93IGl0IGlzLiAgSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSBpdCBtdXN0IGJlIGxpa2UgdGhhdC4KPgo+IEZvciBleGFtcGxlOiBQTVVfT1ZFUkZMT1cg
aGFzIGxvd2VyIGV2ZW50X2lkIHRoYW4gU09GVFdBUkVfSU5KRUNURUQsIHNvCj4gaXQgd2lsbCBj
dXJyZW50bHkgaW50ZXJydXB0IE5NSV9DUkFTSCBhcyB0aGV5IGJvdGggaGF2ZSBwcmlvcml0eSAw
LAo+IGFsdGhvdWdoIE5NSV9DUkFTSCBwcm9iYWJseSBzaG91bGRuJ3QgYmUgbWFza2VkIGJ5IGFu
eXRoaW5nLCBhbmQgc2hvdWxkCj4gcHJlZW1wdCBldmVyeXRoaW5nLgo+IE5NSV9CQUNLVFJBQ0Us
IG9uIHRoZSBvdGhlciBoYW5kLCBwcm9iYWJseSBzaG91bGRuJ3QgaGF2ZSB0aGF0IGhpZ2gKPiBw
cmlvcml0eSBhcyB0aGVyZSBzZWVtIG1vcmUgaW1wb3J0YW50IGV2ZW50cyAoZS5nLiBSQVMgYW5k
IE5NSV9DUkFTSCkuCj4KPiBUaGUgaXNzdWVzIGNhbiBiZSBhdm9pZGVkIGJ5IGV2ZW50IHByaW9y
aXRpZXMsIG1hc2tpbmcsIG9yIGRlZW1lZCBhcwo+IG5vbi1pc3N1ZSwgYnV0IEkgdGhpbmsgaXQg
d291bGQgYmUgYmVuZWZpY2lhbCB0byBwcm92aWRlIHNvbWUgcmVhc29uaW5nCj4gYmVoaW5kIHRo
ZSBkZXNpZ24sIGFzIHRoZSBjaG9pY2VzIGRvbid0IHNlZW0gb2J2aW91cyB0byBtZS4KCkluZGVl
ZCwgaXQgaXMgbmVjZXNzYXJ5IHRvIGNvbnNpZGVyIHRoZSBwcmlvcml0eSBhbW9uZyBkaWZmZXJl
bnQKZXZlbnRzLiBTaG91bGQgZGlmZmVyZW50IHByaW9yaXRpZXMgYWxzbyBiZSBhc3NpZ25lZCB0
byBOTUlfQ1JBU0gsCk5NSV9CQUNLVFJBQ0UsIE5NSV9TVE9QLCBhbmQgTk1JX0tHREI/IERvIHRo
ZXNlIG9wZXJhdGlvbnMgbmVlZCB0byBiZQp2aXNpYmxlIHRvIHRoZSBCSU9TPyBDb3VsZCB5b3Ug
a2luZGx5IHByb3ZpZGUgc29tZSBnb29kIHN1Z2dlc3Rpb25zPwoKPgo+IFRoYW5rcy4KClRoYW5r
cywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
