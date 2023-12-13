Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9806C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNlcE61n+7xtXWagECUrtLp9QqJo7a9b0MUXrhfMCxI=; b=J4qJxOetbAJHVE
	tEN6g+/vawnXq/axyzjmqmhZ/w5q3ucl6v11slr7ZI7L4be4q0QZegmkE2V1paFyZ/xmc6P0cd85u
	U6LLPV/d1eD0immERcI5nHkHHQZD9q2nRc3TwWNvzjfblPzWXHIS3Aham5TjH419iMgipX37HNCbI
	Mt4YtuSp8+zha6I+PcBWvKz/C2d6L6o2Rcd4wt5cIMqNXdo88G81J9FPIc0JF5IeM6cNrAobhhZhY
	BJFv1NufXU6A5WwW/w5NYkD+hXTjIpOrpRYE9r0/Q2+RFQtv/XkP/YltgYJaBqvef75G51yLC+WQy
	Z8n9dE4AGjkCvRmWWivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDS5d-00FS8X-0Y;
	Wed, 13 Dec 2023 16:28:05 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDS5Z-00FS7X-2U
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 16:28:03 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dbcde128abeso177000276.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 08:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702484878; x=1703089678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwN+wNPTyEXCpp42soj4i392Xk+t7dyiyZpAtyDWMEo=;
        b=ZB5KRGMNkKei1QMp0WE/CqUsdqg18uMbwZyBkQHTnBlskx69IxihslFDdVaS1DN+9+
         Zfp8YsXIQN3Wq528nEJWvOvA3e6fdBAp7GZnDlLD6seRFGnmS21/Bb7VlX3emZrgTHjk
         1o4L7XF3aqK2Bs5ZXmM4bsYSEMJ7YtWnu/vZmtb4m5rhJEnmp2hEd7iDjz6WSrLFBLNP
         HVqYcgftKM0RMNRJm/ZpiQv2KoqbuxqheCogilPEzHDR4ArVDSFmxhTHNCSMq/NiRpuf
         gnno0Sy1NGf7X1aNdJ3YK7WRb6EO9Pf+8QQPCz+pWED5JJwABelCfQwS3t37XlpNHclK
         2otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484878; x=1703089678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwN+wNPTyEXCpp42soj4i392Xk+t7dyiyZpAtyDWMEo=;
        b=hkVMsioRJAa6yW95hWAKtLygIZzeU+byWpk2JgNojWk8xBBxC7i+npMoU5NBYj7uMp
         v0ByAsHRMnxqBVPSoz/hv1qScxMdlaJbb57vwVfoHl2LAzexzHZNUJzfWObAffYxqdYZ
         THvJjX/olJNaX7dxCpDb/tXOPEPFMcKgpu8+JrkfqRaG49hmg98dOG05ckO4ibXBv0OG
         K6EX0X64PQ3fRReWsXy40bOJkhCeJTqvZSmn5QeAYyyGm8T6QZ4YK0LlFRTPBtbMo1aO
         JyKv5Yh8owiRzCRhFX7hqIgZnQ0M4afyjkfWbIOA271hcVTULH63SNVglL39jJFLVwAR
         kh7Q==
X-Gm-Message-State: AOJu0YxGkbBT4J7UJE9I5kLK07KmJdAPVD9BSL0X8lALRcACdcBxj5kr
	kHP7+R5kK2/zRJuCN74w8wAm3/fTfgX1VODX6tCabA==
X-Google-Smtp-Source: AGHT+IGIMAXe9iUoZENamxfBq2v5A/ljH9uhwB9zsViZ6KKm+zFKaXMYXuDHPuUeofItu8Wh+2WIN54ripiKFmO34BU=
X-Received: by 2002:a25:8051:0:b0:db5:4731:eeb8 with SMTP id
 a17-20020a258051000000b00db54731eeb8mr5500365ybn.18.1702484878223; Wed, 13
 Dec 2023 08:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231212235003.2036221-1-debug@rivosinc.com> <mhng-ae72b5fd-358d-48e2-87cf-f571b67afe9e@palmer-ri-x1c9a>
 <ZXkCs9ypok5X/Wx2@debug.ba.rivosinc.com> <20231213-707b4e8b5a91ceedd557eb12@orel>
In-Reply-To: <20231213-707b4e8b5a91ceedd557eb12@orel>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 13 Dec 2023 08:27:46 -0800
Message-ID: <CAKC1njQ16drCZzWCS8PuX1U7x1UfC3bwpEmeizs1L5z4KHFaPw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: envcfg save and restore on trap entry/exit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, guoren@kernel.org, mchitale@ventanamicro.com, 
	waylingii@gmail.com, greentime.hu@sifive.com, samitolvanen@google.com, 
	Bjorn Topel <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	jeeheng.sia@starfivetech.com, Heiko Stuebner <heiko@sntech.de>, 
	Evan Green <evan@rivosinc.com>, jszhang@kernel.org, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_082801_989015_A270F96F 
X-CRM114-Status: GOOD (  26.55  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgNDoyNOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMDU6MDI6
NDNQTSAtMDgwMCwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMTIsIDIwMjMg
YXQgMDQ6NTM6NDhQTSAtMDgwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwg
MTIgRGVjIDIwMjMgMTU6NDk6MjUgUFNUICgtMDgwMCksIGRlYnVnQHJpdm9zaW5jLmNvbSB3cm90
ZToKPiA+ID4gPiBlbnZjZmcgQ1NSIGRlZmluZXMgZW5hYmxpbmcgYml0cyBmb3IgY2FjaGUgbWFu
YWdlbWVudCBpbnN0cnVjdGlvbnMgYW5kIHNvb24KPiA+ID4gPiB3aWxsIGNvbnRyb2wgZW5hYmxp
bmcgZm9yIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgYW5kIHBvaW50ZXIgbWFza2luZyBmZWF0dXJl
cy4KPiA+ID4gPgo+ID4gPiA+IENvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgYW5kIHBvaW50ZXIgbWFz
a2luZyBmZWF0dXJlcyBuZWVkIHRvIGJlIGVuYWJsZWQgb24gcGVyCj4gPiA+ID4gdGhyZWFkIGJh
c2lzLiBBZGRpdGlvbmFsbHksIEkgYmVsaWV2ZSBjYWNoZSBtYW5hZ2VtZW50IGluc3RydWN0aW9u
cyBuZWVkIHRvIGJlCj4gPiA+ID4gZW5hYmxlZCBvbiBwZXIgdGhyZWFkIGJhc2lzLiBBcyBhbiBl
eGFtcGxlIGEgc2VjY29tcGVkIHRhc2sgb24gcmlzY3YgbWF5IGJlCj4gPiA+ID4gcmVzdHJpY3Rl
ZCB0byBub3QgdXNlIGNhY2hlIG1hbmFnZW1lbnQgaW5zdHJ1Y3Rpb25zCj4gPiA+Cj4gPiA+IERv
IHdlIGhhdmUgYW55dGhpbmcgaW4gdGhlIGtlcm5lbCB0aGF0IGFjdHVhbGx5IGRvZXMgdGhhdD8g
IEdlbmVyYWxseSB3ZQo+ID4gPiBuZWVkIHNvbWUgdXNlLCBJIGNvdWxkbid0IGZpbmQgYW55IHVz
ZXItbW9kZSB3cml0YWJsZSBlbnZjZmcgYml0cyBpbiBhbnkKPiA+ID4gZXh0ZXNpb25zIEkgbG9v
a2VkIGF0IChhZG1pdHRpZGx5IGp1c3QgQ0ZJIGFuZCBwb2ludGVyIG1hc2tpbmcpLCBhbmQKPiA+
ID4gdW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyB0aGVyZSdzIG5vIHBlci10aHJlYWQgc3Rh
dGUgaW4gdGhlIGtlcm5lbC4KPiA+ID4KPiA+Cj4gPiBDYWNoZSBtYW5hZ2VtZW50IG9wZXJhdGlv
bnM/Cj4gPiBBcyBvZiBub3cga2VybmVsIGJsaW5kbHkgZW5hYmxlcyB0aGF0IGZvciBhbGwgdGhl
IHVzZXIgbW9kZS4gSXQgd2lsbCBiZSBnb29kIGlmCj4gPiB0aGF0IGlzIGVuYWJsZWQgb24gcGVy
LXRocmVhZCBiYXNpcy4gU3VyZSwgYWxsIHRocmVhZHMgY2FuIGhhdmUgaXQgZW5hYmxlZCBieQo+
ID4gZGVmYXVsdC4gQnV0IGlmIHN0cmljdCBzZWNjb21wIGlzIGVuYWJsZWQsIEkgd291bGQgYXJn
dWUgdGhhdCBjYWNoZSBtYW5hZ2VtZW50Cj4gPiBvcGVyYXRpb25zIGZvciB0aGF0IHRocmVhZCB0
byBiZSBkaXNhYmxlZCBhcyBpcyBkb25lIG9uIG90aGVyIGFyY2hlcy4gQXMgYW4KPiA+IGV4YW1w
bGUgeDg2IGRpc2FibGUgcmR0c2Mgb24gc3RyaWN0IHNlY2NvbXAuIFJJU0NWIGFsbG93cyB0aGlz
IENNTyBleHRlbnNpb24KPiA+IGFuZCBJIGV4cGVjdCBDTU8gdG8gbGV2ZXJhZ2UgdGhpcyAoY3Vy
cmVudGx5IGl0Cj4gPiBkb2Vzbid0KS4KPiA+Cj4gPiBJIHdhcyBiZWluZyBvcHBvcnR1bmlzdGlj
IGhlcmUgc28gdGhhdCBJIGNhbiByZWR1Y2UgbnVtYmVyIG9mIHBhdGNoZXMgb24gQ0ZJCj4gPiBl
bmFibGluZyBwYXRjaHNldC4KPiA+Cj4gPiBXaWxsIGl0IGJlIG9rYXkgaWYgSSByZXZpc2UgdGhp
cyBwYXRjaCB0byBpbmNsdWRlIHdpdGggYSB1c2VjYXNlIHRvIHJlc3RyaWN0IENNTwo+ID4gKHNh
eSBmb3IgY2FzZSBvZiBzdHJpY3Qgc2VjY29tcCBvbiByaXNjLXYpPwo+Cj4gSSBvcHRlZCB0byBv
bmx5IGV4cG9zZSBjYWNoZSBibG9jayB6ZXJvIHNpbmNlIGdpdmluZyB1c2Vyc3BhY2UgdGhlCj4g
YWJpbGl0eSB0byBpbnZhbGlkYXRlIGNhY2hlIGJsb2NrcyBzZWVtcyByaXNreSBmcm9tIGEgc2lk
ZS1jaGFubmVsIGF0dGFjawo+IHBlcnNwZWN0aXZlLgoKSSBkaWRuJ3QgcGF5IGF0dGVudGlvbi4g
WW91J3JlIHJpZ2h0LCBpdCdzIG9ubHkgY2JvLnplcm8gdGhhdCdzIGV4cG9zZWQuCkkgd2lsbCBy
b2xsIHVwIG15IHBhdGNoIHdpdGggY2ZpIHNldCB0aGVuLgoKPgo+IEknbSBubyBzZWN1cml0eSBl
eHBlcnQsIHNvIGZlZWRiYWNrIHdlbGNvbWUsIGJ1dCBJIGRvbid0IHNlZSBhIHJpc2sgd2l0aAo+
IHVzZXJzcGFjZSBiZWluZyBncmFudGVkIGNiby56ZXJvLCBldmVuIGZvciBzdHJpY3Qgc2VjY29t
cCBwcm9jZXNzZXMuCgpZZWFoIEkgZG9uJ3Qgc2VlIGEgcmlzayB3aXRoIGNiby56ZXJvIHRvIHN0
cmljdCBzZWNjb21wIHRocmVhZCBlaXRoZXIuCgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
