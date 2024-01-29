Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC8BC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOSmh8sNUgplAdD+HP1G6+QLfZ/5h7An+X+4TTpoMME=; b=WMdHAR1Jk3nIao
	E8WyUQfN6f1ZUcX1elnavjL+hEuHlEbQg5Vm/zm3dxeTVhK+XJdEY+QDdGFyFcz1lVJ50qwevxqJU
	X8EcTivT5mXzNABtLuRbyfY3X8fQnQgu7M7za3eHIE1nxBFk4COE2IqIeeFsJ9JzMG6cOAvJuMsxf
	UgmU2crhEvigpc2IGQPO+wPiCxrYVgkTb2eqD8Da7fxTeQhRCFAxXyKA9sAdIek6i3+91sgYlLizO
	GTXh3pWQg+KMpm1LVWt1oaTVkmKcDdxUT4YolmqioG1IwGBvKSuxfwyFlHcD30a7GFQSwYByjwH/n
	gCAlE+QM6Z4AprTKlgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOIt-0000000C79z-2qB1;
	Mon, 29 Jan 2024 09:51:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOIr-0000000C795-0C0c
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 09:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FFC361117;
	Mon, 29 Jan 2024 09:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEA8C43609;
	Mon, 29 Jan 2024 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706521904;
	bh=pPcqsz1uE3yIcm/qTdgdW4qxwK1Hx8R1HyPonk2uprY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oaqej0ZZ+tvwKJxMIRiPCQLm/V6l8p1aL0VAtqTi0s8D9hH7dH8niv1rBxXPTD78k
	 sn+ZxKcQ/phWalG8E0pi1o6nicXKbjsyVyK3ofnNJJFAXF1I0kdS4II2+Obj1hs5dh
	 Gc5ATdyDlG97DC13v2EpHxVVkrU2/7JH8UfAcdYX+8UKZsQEdbHyDxPgvyxNVHVbIr
	 9+8GIFKQL+23YlvYTwlB8VUsjEbAvQwWELbyrVHXAdOXYYNTS2fGj5EGnyETldEBBC
	 o9JYsU/52KZuWTGX7wFgmOAP3nAzL9lbAUgEa3AWcGqKywZsVVx/i2byqWZC8DPHdw
	 b4Uejvm5Pu5MQ==
Date: Mon, 29 Jan 2024 17:38:52 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, samuel.holland@sifive.com,
	ajones@ventanamicro.com, mchitale@ventanamicro.com,
	dylan@andestech.com, sergey.matyukevich@syntacore.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor
 flush_tlb_range() support
Message-ID: <ZbdyLJ24I2fa6oNb@xhacker>
References: <20240125062044.63344-1-cuiyunhui@bytedance.com>
 <ZbdYijWK1PnHXn47@xhacker>
 <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_015145_167856_B22146A4 
X-CRM114-Status: GOOD (  17.63  )
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

T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMDQ6MjY6NTdQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBKaXNoZW5nLAo+IAo+IE9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDQ6MDLigK9QTSBK
aXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
SmFuIDI1LCAyMDI0IGF0IDAyOjIwOjQ0UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+
IEFkZCBzdXBwb3J0IGZvciBmbHVzaF90bGJfcmFuZ2UoKSB0byBpbXByb3ZlIFRMQiBwZXJmb3Jt
YW5jZSBmb3IKPiA+ID4gVVAgc3lzdGVtcy4gSW4gb3JkZXIgdG8gYXZvaWQgdGhlIG11dHVhbCBp
bmNsdXNpb24gb2YgdGxiZmx1c2guaAo+ID4gPiBhbmQgaHVnZXRsYi5oLCB0aGUgVVAgcGFydCBp
cyBhbHNvIGltcGxlbWVudGVkIGluIHRsYmZsdXNoLmMuCj4gPgo+ID4gSGkgWXVuaHVpLAo+ID4K
PiA+IElJUkMsIFNhbXVlbCBzZW50IHNpbWlsYXIgcGF0Y2ggc2VyaWVzIGEgZmV3IHdlZWtzIGFn
by4KPiA+Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDEwMjIy
MDEzNC4zMjI5MTU2LTEtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8KPiA+Cj4gPiBBZnRlciB0
aGF0IHNlcmllcywgZG8geW91IHN0aWxsIG5lZWQgdGhpcyBwYXRjaD8KPiAKPiBUaGFuayB5b3Ug
Zm9yIHlvdXIgcmVtaW5kZXIuIEkgZGlkbid0IGZpbmQgaXQgYmVmb3JlIEkgbWFpbGVkIG15Cj4g
cGF0Y2guIEkganVzdCBsb29rZWQgYXQgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRjaC4gSSB1bmRl
cnN0YW5kIHRoYXQKPiBteSBwYXRjaCBpcyBuZWVkZWQuIEZvciBhIHNpbmdsZSBjb3JlLCBhIG1v
cmUgY29uY2lzZSBUTEIgZmx1c2ggbG9naWMKPiBpcyBuZWVkZWQsIGFuZCBpdCBpcyBoZWxwZnVs
IHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCgpDdXJyZW50bHksIHJpc2N2IFVQIGZsdXNoX3RsYl9y
YW5nZSBzdGlsbCB1c2UgZmx1c2ggYWxsIFRMQiBlbnRyaWVzLApvYnZpb3VzbHkgaXQncyBpcyBh
IGJpZyBoYW1tZXIsIHRoaXMgaXMgd2hhdCB5b3VyIHBhdGNoIGlzIHRyeWluZyB0bwpvcHRpbWl6
ZS4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgSSB1bmRlcnN0YW5kIHlvdXIgY29kZSBjb3JyZWN0bHkg
b3Igbm90LgpMZXQgbWUga25vdyBpZiBJIG1pc3VuZGVyc3RhbmQgeW91ciBjb2RlLgoKQWZ0ZXIg
cGF0Y2g1IG9mIHRoZSBTYW11ZWwncyBzZXJpZXMsIF9fZmx1c2hfdGxiX3JhbmdlIGlzIHVuaWZp
ZWQgZm9yClNNUCBhbmQgVVAsIHNvIHRoYXQgVVAgY2FuIGFsc28gYmVuZWZpdCBmcm9tIHJlY2Vu
dCBpbXByb3ZlbWVudHMsIHN1Y2gKYXMgcmFuZ2UgZmx1c2ggcmF0aGVyIHRoYW4gYWxsLgoKVGhh
bmtzCgo+IAo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
