Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3209D16266
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocStBDHtMaHwNwTzl4K+s0tpRqd8PSmt3phz4WSyFYk=; b=FQ9Gm6Vj1Zj3oA
	VvT5/x74CixhfsN+KYRdHhEToPCuVIpq4HUtC27i6WrbpQLUsG2waRO27hKH+2/ljxUVp60elRFFv
	kuLjnd/WK6qhDmEltmHmLI9pUtlrMzGqkLrTE+Pc+6VbkUD5bkXKO/yhNjhrWhN8KzalYsaAVtJKO
	FQu13LzYwRZeTPgJ2LLVmgWPTui2yryhUFK0S5N5Fjv0eyK8RVzCmkZdJfp40ELxYm0VJNCw0yuQ4
	W8vQ78QmKOxU+vWKgfDBc9fdHq/gb6UQOp0ZFC2nqTcxyJvOWIJQTwhD65E8BdwSqrYPTlYCOxhqj
	I1E1kgyZMK9AfBMy9V1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LHo-00000005JyU-0nSQ;
	Mon, 14 Oct 2024 13:39:00 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KDz-000000055Rt-1bBz
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 12:31:00 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5e98a16ea68so1981248eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1728909057; x=1729513857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CGFfT/mM9dZiLWl4lLHcQIHCYREyp/vrqKgD4lxV88=;
        b=YWpRWGPmM7ivn75KkfwwhL1fk5snBwpdsFNdIiIyJ0AYQ5LGTWSEAXDIpYPwbUJnKJ
         01A7iGCmTl6p4NlbRfa+Cu8TzZIJ2TADXuahfap2G97EXdicpgL+Rvq1jgssVw+mle3w
         7mf/Ko4WqCxxheB2HnQEhLBuhYC8ZQXaP9hY1oAGcpQuHTu5voRDjAyMiMMpIRfhlSPE
         wbTpgF+UoGswdq8D+624QKhZi0ywcvt/2UYgOxtNSgPvllFD9Bcl2wgVJYU1gzPFbfxo
         62z7PgTKnxlMODzcP5h+geCh+/aLjEW/grURQHsXWr0QMy//TaL8jN+10/dtzViTO60C
         7whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728909057; x=1729513857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CGFfT/mM9dZiLWl4lLHcQIHCYREyp/vrqKgD4lxV88=;
        b=OH8JXNWWFiJdz3ztGZYgInwBD5ClD91Keg7vDQNK1fhPJc9MwBxkjuAajI00tPhXDJ
         Jlki8nPDrE6yBrg0I6XimWztCO15dMAbzRuz8CclSORfY4lFvLGAaYM9xHc8ebgkAjo7
         aH96OohD+vh4//wPsM9ziR18vCMr6llKfMkqYoKxr4p7Kytk1SK++ZqJRXdisLhnrgLn
         tMkWDjtjrwe5u/fa//iJM0lsdQHs1FcHlsZqjgthfzlLoC2qTleDjIm19D2GJORVDeXD
         cseyWq++bTIXfxtLpa7t68GNr12RVcJwM18VPZwxNO8z6qXsLCg9jMpOGtA6eFUTBrnJ
         qnvg==
X-Forwarded-Encrypted: i=1; AJvYcCXSSIzVz3OsnK7KK9P656Iz44HaBilJR4LvqJpovQONnoSxkWH9IVZ6ztszpM9RrjarnGraq1Fry0iwdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPrx03rtUXRtU1PTmY/DlFrDE6mnPFOClVLPhJBXSo/UvCR1Wq
	py8IshvyYTr9FN5SZF65cUKOQbxC0X2G3cP1bKfL4eFNW0OBboOWNgqCqUdiv4duQ0jiWaxCjDW
	1tKemL3qio+36jVQr5SdCbBR26aoUNOUMUsBSAg==
X-Google-Smtp-Source: AGHT+IHtPh/Wy5LDyoZaAbVy1b9YjnnlqFTXd+qK8W+k5kyPdk/Ov9fQAgwC+yPEyuQlptCVmmm4ihtg5TWIt6z6GFk=
X-Received: by 2002:a05:6820:22a1:b0:5e1:ba38:86e7 with SMTP id
 006d021491bc7-5eb1a1b39ebmr4116768eaf.5.1728909057240; Mon, 14 Oct 2024
 05:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241014094705.71775-1-cuiyunhui@bytedance.com> <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr>
In-Reply-To: <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 14 Oct 2024 20:30:46 +0800
Message-ID: <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_053059_445995_C326BC9B 
X-CRM114-Status: GOOD (  26.70  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, haibo1.xu@intel.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQWxleCwKCk9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDg6MTLigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4gT24gMTQvMTAvMjAy
NCAxMTo0NywgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gU1ZQQk1UIGlzIGVuYWJsZWQsIF9f
YWNwaV9tYXBfdGFibGUoKSB3aWxsIGRpcmVjdGx5IGFjY2VzcyB0aGUKPiA+IGRhdGEgaW4gRERS
IHRocm91Z2ggdGhlIElPIGF0dHJpYnV0ZSwgcmF0aGVyIHRoYW4gdGhyb3VnaCBoYXJkd2FyZQo+
ID4gY2FjaGUgY29uc2lzdGVuY3ksIHJlc3VsdGluZyBpbiBpbmNvcnJlY3QgZGF0YSBpbiB0aGUg
b2J0YWluZWQgQUNQSQo+ID4gdGFibGUuCj4gPgo+ID4gVGhlIGxvZzogQUNQSTogW0FDUEk6MHgx
OF0gSW52YWxpZCB6ZXJvIGxlbmd0aC4KPiA+Cj4gPiBXZSBkbyBub3QgYXNzdW1lIHdoZXRoZXIg
dGhlIGJvb3Rsb2FkZXIgZmx1c2hlcyBvciBub3QuIFdlIHNob3VsZAo+ID4gYWNjZXNzIGluIGEg
Y2FjaGVhYmxlIHdheSBpbnN0ZWFkIG9mIG1haW50YWluaW5nIGNhY2hlIGNvbnNpc3RlbmN5Cj4g
PiBieSBzb2Z0d2FyZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMg
fCAyICstCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9hY3BpLmMKPiA+IGluZGV4IDZlMGQzMzNmNTdlNS4uMzE3N2M5YWY4NzY0IDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9hY3BpLmMKPiA+IEBAIC0yMTAsNyArMjEwLDcgQEAgdm9pZCBfX2luaXQgX19p
b21lbSAqX19hY3BpX21hcF90YWJsZSh1bnNpZ25lZCBsb25nIHBoeXMsIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKPiA+ICAgICAgIGlmICghc2l6ZSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7
Cj4gPgo+ID4gLSAgICAgcmV0dXJuIGVhcmx5X2lvcmVtYXAocGh5cywgc2l6ZSk7Cj4gPiArICAg
ICByZXR1cm4gZWFybHlfbWVtcmVtYXAocGh5cywgc2l6ZSk7Cj4gPiAgIH0KPiA+Cj4gPiAgIHZv
aWQgX19pbml0IF9fYWNwaV91bm1hcF90YWJsZSh2b2lkIF9faW9tZW0gKm1hcCwgdW5zaWduZWQg
bG9uZyBzaXplKQo+Cj4KPiBJdCBtYWtlcyBzZW5zZSB0byBtZSBzaW5jZSB3aXRoIHRoaXMsIHdl
IGRvbid0IGhhdmUgdG8gY2FyZSBhYm91dCBob3cKPiB0aGUgZmlybXdhcmUgbWFwcGVkIHRoZSB0
YWJsZS4gQW5kIGl0IG1pbWljcyBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcwo+IChhcm02NCwgbG9v
bmdhcmNoIGFuZCB4ODYpLgo+Cj4gSGVyZSBpcyB0aGUgY29ycmVzcG9uZGluZyBmaXhlcyB0YWc6
Cj4KPiBGaXhlczogM2I0MjZkNGI1YjE0ICgiUklTQy1WOiBBQ1BJIDogRml4IGZvciB1c2FnZSBv
ZiBwb2ludGVycyBpbgo+IGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlIikKPgo+IFdpdGggdGhlIGNv
cnJlc3BvbmRpbmcgZml4IGluIF9fYWNwaV91bm1hcF90YWJsZSgpIGFzIHBvaW50ZWQgYnkgU3Vu
aWwsCj4geW91IGNhbiBhZGQ6Cj4KPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgo+Cj4gQW5kIHJlZ2FyZGluZyB0aGUgc3BhcnNlIGVycm9yLCBJ
IGRvbid0IHNlZSBhbnkgb3RoZXIgYXJjaGl0ZWN0dXJlCj4gY2FzdGluZyB0byBfX2lvbWVtLCBz
byBtYXliZSB0aGF0J3Mgbm90IG5lY2Vzc2FyeSBhbnltb3JlPwoKT0suIEkgd2lsbCBtYWtlIHRo
ZSBjaGFuZ2VzIGluIHYyLiBSZWdhcmRpbmcgdGhlIHNwYXJzZSBlcnJvciwgSSB3aWxsCnVzZSBh
bm90aGVyIHBhdGNoIHNwZWNpZmljYWxseSB0byBzb2x2ZSBpdC4gSXMgdGhhdCBva2F5PwoKPgo+
IFRoYW5rcywKPgo+IEFsZXgKPgo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
