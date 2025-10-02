Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D9BCAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Asd1UGYWyBUgRE5xm+zDjRwHAaeurMBqu0CqpN/SYlY=; b=ljCyBtzEihU3GV
	dUyckHKLzh1fSkTjlphxXcf1aeOjYS0P9pFt2CLmVK4usuP7XTD/5Eto+7EDujSAyk/xYT2UcJIoT
	ioQ8DUfrYT1v5/mjanHbiOlc0fhXJFZWyr57CfZxukiByc9hEmwaErTSledPcxkQTauk92mKM84jW
	ZjaezkQU2IbS03xuNP5MsxijToII1KZKC0ntiyU0dgm7S4R6LL7HjAxAKaZ6N0lqAhzOJ2bEjE6st
	yTQENijmAxpriyAteQLrx+ruiUeAV14YUa+Nr3Zg/JLbKk0Rvx+RbRZObdhXLKpskwHBLBm9AvrRL
	uyHji/iFrrOavDp2m37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KOZ-0000000Ac7r-0v7b;
	Thu, 02 Oct 2025 14:34:59 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KOW-0000000Ac7V-3s4m
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 14:34:58 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-36d77de259bso9796421fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759415695; x=1760020495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNmlYeXHhash5zxgH9DhIdlE2KIwH0wWzhgZasITOwI=;
        b=chgFDXEOcgeiIqt+DPL/KK9puYga7TMtevq3m69YfW52ZvpYOaKKeof8pr/6CUU7q4
         mFuWinM9jt2gMMAAeFVBOPXQpYYDHxttL4ez0th5UWoLmjXSNPFBXyoBe0pn0ziZLfNr
         iK2FzgUShePdvYBXOPQ/ngTDMGEpGtVGTe39S0rBFx3r70UHd6KuAmymHmjcwNFtSPa/
         CRzcG4qkOcdX1HmULAO/fne7aRKEUfzSIOqRcusG935VIfJGQsR/8Jya9zL0DNkdRRLS
         qcs4Es5ZA0+VWiMnpbP14WLdyIcxWEgsBXspUgjFn4/W2zhlW/ga8rq9M828u01jFp0n
         lovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415695; x=1760020495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNmlYeXHhash5zxgH9DhIdlE2KIwH0wWzhgZasITOwI=;
        b=S88wCMtILj0TXO/qmze87KDiZOAseyMr02tfAhXRE3CiT5iNca2few2BxGvE6bh6qG
         4VsO3Ggg68ecEWoQp75p8zl+nkcQYPB27nsEQZsE7f43hDF5VXZUpKpYfzBUHwmN6Gi2
         7KAHqRKQwCiROuBJCUqA9hkdmr+0frjTtoT+t0JrZwvUV+S2wxvItvG8w/oh2x8lV9dj
         kwC9Jg7cit0RrAxqXBJ+Q+2BQfkLaXJiNV9PDLtXt7WiG5ZzS/y1e5fMMrNFeVGZsIbL
         BfZkZdyvgsdOwLQ9R2DibrdeG1NqrVtsRguiCwkOmr+Q3fAagNBW90XSW3Q3tYotypW9
         9izg==
X-Forwarded-Encrypted: i=1; AJvYcCV371o2tTLtw34Lh1kyaC5d3ahG+cEsmm3xMZiqsa054QCKYUCrOYa+5PJ7UiiIVEm10kY9o/V5o/ceAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvNEADBMXA0TAjEZ8ekDofxhlerYt+PWHjHIIxvUJa9JgRsVGV
	4BdG/D79f1kYDU2+UdbdQAnsikRaiv4OGVUOSKOgSkd3CGGeGmwrha6joirxaUoxHoFx17eBhpx
	ooV28Jewu0fwCIzNWl+9wgubjnY7mFp1pX70eTYLtWA==
X-Gm-Gg: ASbGncvgE4QxSrOVNtq78aVMXDQMV4Fnc58SbKp/NG+z4fGhBB6a1XjcxQ384M36yVP
	pIISe6ihqGnpMFd8uf45vNUVFVL72adiZoE9QlUTu521gw5Nalh/IR/ndH3ZiLNEpDZmvApfRcY
	1AtjCQQNJO7dq5ap0AIA/h+vIcwJQLooPfB1SA1RAau9SrFRU/z010gZooeVZi7NDuu+JZrGvqZ
	AWxuJuezH7OPXJGYclPn/REiGpZHEgA
X-Google-Smtp-Source: AGHT+IFt+HGidyg8l78Emkvj1EGjWohAlX0+/ZRuiXiq0rypVlyjBUdN+69ueNvffFtVc0XtC12AKJQj+2BYsW5GjDM=
X-Received: by 2002:a2e:9a0a:0:b0:364:806d:85a6 with SMTP id
 38308e7fff4ca-373a7461b1cmr28467441fa.33.1759415694471; Thu, 02 Oct 2025
 07:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
 <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org> <20251002-rubbing-nucleus-b353e09be786@spud>
In-Reply-To: <20251002-rubbing-nucleus-b353e09be786@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 2 Oct 2025 20:04:39 +0530
X-Gm-Features: AS18NWCbya2v7nRYZXyrCc0tzPa3O3zZxhM0w6rmVq8q6ADee_VcxRzs9PCiAGY
Message-ID: <CAK9=C2VC2OHzNFXgxZ4eDCUv8MGsjK1OdrD0FR4WUSrOsyFemA@mail.gmail.com>
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rahul Pathak <rpathak@ventanamicro.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_073456_996884_449BB6B6 
X-CRM114-Status: GOOD (  26.39  )
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

T24gVGh1LCBPY3QgMiwgMjAyNSBhdCAzOjA24oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDAxLCAyMDI1IGF0IDA3OjE1OjU2UE0gLTA2
MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPiBPbiBUdWUsIDMwIFNlcCAyMDI1LCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPgo+ID4gPiBUaGUgUklTQy1WIHBsYXRmb3JtIG1hbmFnZW1l
bnQgaW50ZXJmYWNlIChSUE1JKSBpcyBvbmx5IGF2YWlsYWJsZSBvbgo+ID4gPiBSSVNDLVYgcGxh
dGZvcm1zLiAgSGVuY2UgYWRkIGEgZGVwZW5kZW5jeSBvbiBSSVNDViwgdG8gcHJldmVudCBhc2tp
bmcKPiA+ID4gdGhlIHVzZXIgYWJvdXQgdGhpcyBkcml2ZXIgd2hlbiBjb25maWd1cmluZyBhIGtl
cm5lbCBmb3IgYSBkaWZmZXJlbnQKPiA+ID4gYXJjaGl0ZWN0dXJlLgo+ID4gPgo+ID4gPiBGaXhl
czogNWJhOWY1MjBmNDFhMzNjOSAoImNsazogQWRkIGNsb2NrIGRyaXZlciBmb3IgdGhlIFJJU0Mt
ViBSUE1JIGNsb2NrIHNlcnZpY2UgZ3JvdXAiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4KPiA+IFRoYW5rcyBHZWVy
dCBmb3IgY2F0Y2hpbmcgdGhpcy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGlzIGFnYWluc3QgdW5tZXJn
ZWQgcGF0Y2hlcyBpbiAtbmV4dC4gIFNvIEknbGwgcGxhbiB0byBhZGQgdGhpcwo+ID4gdG8gdGhl
IFBSIHRoYXQgSSBwbGFuIHRvIHNlbmQgdG8gTGludXMgdG9tb3Jyb3cgLS0gdW5sZXNzIGFueSBv
ZiB0aGUKPiA+IGRyaXZlcnMvY2xrIG1haW50YWluZXJzIHdvdWxkIHByZWZlciB0aGF0IEkgbm90
Lgo+ID4KPiA+ID4gQW5kIHBlcmhhcHMgdGhlICJkZWZhdWx0IFJJU0NWIiBzaG91bGQgYmUgZHJv
cHBlZCwgdG9vPwo+ID4KPiA+IFByb2JhYmx5LiAgSSBndWVzcyB3ZSBzaG91bGQganVzdCBhZGQg
dGhpcyB0byB0aGUgYXJjaC9yaXNjdiBkZWZjb25maWcKPiA+IGluc3RlYWQuICBMZXQncyB3YWl0
IG9uIHRoaXMgb25lIGZvciBhIGZldyBkYXlzIHRvIHNlZSBpZiBhbnlvbmUgaGFzIGFueQo+ID4g
Y29tbWVudHMsIGFuZCBjb25zaWRlciB0aGF0IGNoYW5nZSBmb3IgdjYuMTgtcmMgZml4ZXMuCj4K
PiBUaGVyZSdzIGxpdHRsZSBwb2ludCBoYXZpbmcgImRlZmF1bHQgUklTQ1YiIGlmIGl0J3Mgb25s
eSBhdmFpbGFibGUgb24KPiBSSVNDViBpbiB0aGUgZmlyc3QgcGxhY2UsIG1heSBhcyB3ZWxsIGp1
c3QgYmUgImRlZmF1bHQgeSIgYW5kIGJlCj4gc2ltcGxlci4KPgo+IE15IDJjIGlzIHRoYXQgcHV0
dGluZyBpdCBpbiBkZWZjb25maWcgaXMgYmFyZWx5IHdvcnRoIGRvaW5nLCB1bmxlc3MgdGhlcmUK
PiBhcmUgYWN0dWFsIHBsYXRmb3JtcyB0aGF0IHVzZSBpdC4KPiBEb2VzIFFFTVUgcHJvdmlkZSBh
IHVzZWZ1bCB0ZXN0IGZvciBpdCB0aGF0IGV4ZXJjaXNlcyB0aGUgdmFyaW91cyBjb2RlCj4gcGF0
aHMsIHRoYXQgd291bGQgbWFrZSBpdCB3b3J0aHdoaWxlIHRvIGhhdmUgaW4gZGVmY29uZmlnIEFu
dXA/CgpZZXMsIFFFTVUgUlBNSSBzdXBwb3J0IGlzIGluIHRoZSBwaXBlbGluZS4gVGhlIE9wZW5T
QkkKdXBzdHJlYW1pbmcgd2FzIGNvbXBsZXRlZCBmZXcgbW9udGhzIGJhY2sgYW5kIExpbnV4IHBh
dGNoZXMKYXJlIGdvaW5nIGluIHRoaXMgbWVyZ2Ugd2luZG93IChMaW51eC02LjE4KQoKV2UgKFZl
bnRhbmEpIGhhdmUgYWxyZWFkeSBtYWRlIHRoZSBRRU1VIFJQTUkgaW1wbGVtZW50YXRpb24KcHVi
bGljIHdoaWNoIGNhbiBiZSB0cmllZCB1bnRpbCBRRU1VIFJQTUkgdXBzdHJlYW1pbmcgaXMgY29t
cGxldGVkLgooUmVmZXIsIGRldi11cHN0cmVhbSBicmFuY2ggb2YgaHR0cHM6Ly9naXRodWIuY29t
L3ZlbnRhbmFtaWNyby9xZW11LmdpdCkKCk5PVEU6IHRoZXNlIGRldGFpbHMgYXJlIG1lbnRpb25l
ZCBpbiBjb3Zlci1sZXR0ZXIgYXMgd2VsbC4KKFJlZmVyLCBodHRwczovL3d3dy5zcGluaWNzLm5l
dC9saXN0cy9saW51eC1jbGsvbXNnMTE4MjI5Lmh0bWwpCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
