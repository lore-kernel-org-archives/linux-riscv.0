Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C0CD637A0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MXdjElWbL4ZaKI11+BXE45/8iGuwN2HRF6vMtmU3Wg=; b=GNlicZaYajg5QH
	cxD58X+EVWaQzEPU1+EHpFSuFOgP80/7Xdkdf7HC4nft57DUSuQER03I6AmPZ8Q1CxZnqlPCd0FdC
	tC/GOVVtfpAgsNp21+AgHdAJ9XWTfi4n+WgzQdsndUUmsUffzYYOHiuUlbzrP8M/+ee4Wat9Jw3/L
	pWoJMNp1eDcktzCzyjf3QvPKgvBq3viud3cGMKV2YEaAuZdrhDuVJnH3IR5HcbDGNm/Z9bMjA9um+
	0Y1XMEd/IKRf5afjzzjPeg+oFaVvp7HHOr2Vmc75tnFfjPBdLf7c1s29QsRMK1q8zciZUBRmPPCNn
	Ub56dqyCOFjaaTaUjW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHIu-00000007aJt-12Uj;
	Wed, 13 Nov 2024 17:37:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHIr-00000007aJE-3RSX
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 17:37:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d462c91a9so4548624f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731519435; x=1732124235; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=im7VLv5kLVhNsb/0wE3S9j1YXytxDziWmwsT4UuEatg=;
        b=SajJAGd7dKRUmD1W7fYwFYwhmdvW21WpqFyXFaqbcE0+alZ+Hs3nZ2SZyvRTgMZtTQ
         cpmn6GvfuvbtQzkUtxF3CUo74bvSOkyoF8pMw6RYj6RasjoaKsVeqRVk1Y/mvJKIgFfo
         L28WoIUDJamc7E0mAV5ztYDGLrccpvEm+aPIxLA0ksr/tDdO0gRYEfGexBAF79Lj0AyV
         /YNuBTGUcugKsy2rFRkHuqHVgoCHk10Bx7WM+tfCVtuZ8HfGxntXmZjl7jkwQzj6RDuj
         7AtbuD/nGHHgyyoLURB7BouqHfXpDvLRFFjfCRSGGxAe7bIGvxNPGSCntKgA5zXN7bWs
         6ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731519435; x=1732124235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=im7VLv5kLVhNsb/0wE3S9j1YXytxDziWmwsT4UuEatg=;
        b=VGyesMfUE2bhLuXrHJ1aWsxkiCbKhtuziFCFpkI+aCfyqiyMz+pYRBjKmyuWPUoTiW
         rUJEKiPCpdGxb2LOcgVUuAgAfVXyE2J9CjclTQf7l4HTHs94PN0HH1OGb78rtrlb2GYN
         N2r1uhj5LRI7u9EWG6GislEuy39YftXeVuW2837374PJcKOU/7WxfQdLyCSHhdaSl4Nd
         vsCDtiLMCFw26DuGInqdbnN1x/xcVS97Z6uSs5KURcfNiNM4uvj8MPHIItWCGG99utT8
         g5/CBtoqUb+sLnKDMDfbffZKNeKVRVURLxBh+Spzxr6d+txAo5seLQlp3+Kh6W3PChFe
         I/fg==
X-Forwarded-Encrypted: i=1; AJvYcCVU4hT5hcTcerWxlZ2KOXx23esjwQVn7y69PdCl7qViJ5MTiWNhvJ5BhDaYh0AmslaXLq6aAkQpl8lkEA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/lawP0lrxsZ9Sc8OAP7v0PjLcl6YkaYVGgdD8vpoTqUJFPnte
	vvijEtAW4wI0XCAdSn+gCoZnLfjSC1BWiPvTqZrpYn9ar/DpOUlmD6JLMjOkm6k=
X-Google-Smtp-Source: AGHT+IHzCwgR6nFayq9lZx6OFJtGnWn41SZ9+6i/I4rcB92bwXQ2Y7Ixz67I/Gp1Z88zhbCsztRx1w==
X-Received: by 2002:a05:6000:691:b0:37d:36f2:e2cb with SMTP id ffacd0b85a97d-382080817d9mr6391621f8f.0.1731519435006;
        Wed, 13 Nov 2024 09:37:15 -0800 (PST)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda036afsm19222464f8f.86.2024.11.13.09.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:37:14 -0800 (PST)
Date: Wed, 13 Nov 2024 18:37:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Conor Dooley <conor@kernel.org>, 
	punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com, charlie@rivosinc.com, evan@rivosinc.com, 
	samuel.holland@sifive.com, andybnac@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: Enable Zicbom in usermode
Message-ID: <20241113-ec9f91d62f4845df79bb21f3@orel>
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
 <20241025-puritan-sank-b8a828ef5872@spud>
 <3CCBB0AB-169D-4677-9A44-53E4148908D5@jrtc27.com>
 <CAEEQ3wmn9W8A5y37aFisQqd=8Ke7Lt6nY6am99j0O2cNbsVj-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmn9W8A5y37aFisQqd=8Ke7Lt6nY6am99j0O2cNbsVj-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_093717_888790_1B5A5E00 
X-CRM114-Status: GOOD (  37.08  )
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

T24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMDQ6Mjk6NDlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBKZXNzaWNhLAo+IAo+IE9uIFNhdCwgT2N0IDI2LCAyMDI0IGF0IDEyOjMy4oCvQU0g
SmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAyNSBP
Y3QgMjAyNCwgYXQgMTE6MTYsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgT2N0IDI1LCAyMDI0IGF0IDA1OjE1OjI3UE0gKzA4MDAsIFl1bmh1aSBD
dWkgd3JvdGU6Cj4gPiA+PiBMaWtlIFppY2JveiwgYnkgZW5hYmxpbmcgdGhlIGNvcnJlc3BvbmRp
bmcgYml0cyBvZiBzZW52Y2ZnLAo+ID4gPj4gdGhlIGluc3RydWN0aW9ucyBjYm8uY2xlYW4sIGNi
by5mbHVzaCwgYW5kIGNiby5pbnZhbCBjYW4gYmUKPiA+ID4+IGV4ZWN1dGVkIG5vcm1hbGx5IGlu
IHVzZXIgbW9kZS4KPiA+ID4+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jIHwgMiArLQo+ID4gPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gPj4g
aW5kZXggMTk5MmVhNjQ3ODZlLi5iYzg1MDUxOGFiNDEgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYwo+ID4gPj4gQEAgLTkyNCw3ICs5MjQsNyBAQCB1bnNpZ25lZCBsb25nIHJp
c2N2X2dldF9lbGZfaHdjYXAodm9pZCkKPiA+ID4+IHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNh
X2VuYWJsZSh2b2lkKQo+ID4gPj4gewo+ID4gPj4gaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5s
aWtlbHkoUklTQ1ZfSVNBX0VYVF9aSUNCT1opKQo+ID4gPj4gLSBjdXJyZW50LT50aHJlYWQuZW52
Y2ZnIHw9IEVOVkNGR19DQlpFOwo+ID4gPj4gKyBjdXJyZW50LT50aHJlYWQuZW52Y2ZnIHw9IEVO
VkNGR19DQklFIHwgRU5WQ0ZHX0NCQ0ZFIHwgRU5WQ0ZHX0NCWkU7Cj4gPiA+Cj4gPiA+IEkgYmVs
aWV2ZSB3ZSBwcmV2aW91c2x5IGRlY2lkZWQgdGhhdCB1c2Vyc3BhY2Ugc2hvdWxkIG5vdCBiZSBh
bGxvd2VkIHRvCj4gPiA+IHVzZSB6aWNib20sIGJ1dCB0aGF0IG5vdCB3aXRoc3RhbmRpbmcgLSB0
aGlzIGlzIHdyb25nLiBJdCBzaG91bGQgYmUKPiA+ID4gY2hlY2tpbmcgZm9yIFppY2JvbSwgbm90
IFppY2Jvei4KPiA+Cj4gPiBBbGxvd2luZyBjbGVhbi9mbHVzaCBpcyBzYWZlIGJ1dCBoYXMgdGhl
IHNhbWUgcHJvYmxlbXMgYXMgZmVuY2UuaSB3aXRoCj4gPiByZWdhcmRzIHRvIG1pZ3JhdGluZyBi
ZXR3ZWVuIGhhcnRzLiBBbGxvd2luZyBpbnZhbGlkYXRlLCB1bmxlc3MgbWFwcGVkCj4gPiB0byBm
bHVzaCwgaXMgbm90IHNhZmUgaW4gZ2VuZXJhbCB1bmxlc3MgdGhlIGtlcm5lbCBkb2VzIGEgbG90
IG9mCj4gPiBmbHVzaGluZyB0byBhdm9pZCB1c2Vyc3BhY2UgYWNjZXNzaW5nIGRhdGEgaXQgc2hv
dWxkbuKAmXQgYmUgYWJsZSB0byBzZWUuCj4gPgo+ID4gQWxzbywgRU5WQ0ZHX0NCSUUgaXMgYSBt
YXNrIGZvciBhIG11bHRpLWJpdCBmaWVsZCwgd2hpY2ggaGFwcGVucyB0bwo+ID4gaGF2ZSB0aGUg
c2FtZSB2YWx1ZSBhcyBFTlZDRkdfQ0JJRV9JTlYgKGkuZS4gcmVhbGx5IGlzIG1ha2luZyBjYm8u
aW52YWwKPiA+IGJlIGFuIGludmFsaWRhdGUpLiBJIG5vdGUgdGhhdCB0aGUgS1ZNIGNvZGUsIHdo
aWNoIHRoaXMgbGlrZWx5IGNvcGllZAo+ID4gZnJvbSg/KSwgbWFrZXMgdGhlIHNhbWUgbWlzdGFr
ZSwgYnV0IHRoZXJlIHRoYXQgaXMgdGhlIGludGVuZGVkCj4gPiBiZWhhdmlvdXIsIGlmIG1pc2xl
YWRpbmcgYWJvdXQgd2hhdCB0aGUgZmllbGQgcmVhbGx5IGlzLgo+ID4KPiA+IFNvLCB3aXRoIHN1
aXRhYmxlIGNhdmVhdHMsIGFsbG93aW5nIGNsZWFuL2ZsdXNoIGNvdWxkIGJlIGEgcmVhc29uYWJs
ZQo+ID4gdGhpbmcgdG8gZG8gKG1heWJlIHVzZWZ1bCBmb3IgdXNlcnNwYWNlIGRyaXZlcnMgc28g
bG9uZyBhcyB0aGV5IHBpbgo+ID4gdGhlbXNlbHZlcyB0byBhIHNwZWNpZmljIGhhcnQ/KSwgYnV0
IGludmFsaWRhdGUgc2hvdWxkIG9ubHkgZXZlciBiZQo+ID4gYWxsb3dlZCBpZiBtYXBwZWQgdG8g
Zmx1c2guCj4gPgo+ID4gSmVzcwo+ID4KPiBZZXMuIFRoZSBvcmlnaW5hbCBpbnRlbnRpb24gaXMg
dG8gZW5hYmxlIGNsZWFuL2ZsdXNoL2ludmFsaWQuIFNvCj4gRU5WQ0ZHX0NCSUUgfCBFTlZDRkdf
Q0JDRkUgaXMgYWRkZWQuIFdoZW4gb25lIGNvcmUgaW5pdGlhdGVzIGFuCj4gaW52YWxpZGF0aW9u
LCBvdGhlciBjb3JlcyB3aWxsIGFsc28gaW52YWxpZGF0ZSB0aGUgY29ycmVzcG9uZGluZyBjYWNo
ZQo+IGxpbmUuIFNvIGRvIHdlIG5vdCBuZWVkIHRvIHdvcnJ5IGFib3V0IHRoaXMgcHJvYmxlbT8g
TW9yZW92ZXIsCj4gaW52YWxpZGF0aW9uIGlzIG5vdCBmb3VuZCBpbiB0aGUgbG9naWMgb2YgZGlz
YWJsaW5nIHByZWVtcHRpb24gaW4gdGhlCj4ga2VybmVsLiBPciBwZXJoYXBzIGJpbmRpbmcgY29y
ZXMgYmVsb25ncyB0byB0aGUgdXNlci1zcGFjZSdzIG93bgo+IGxvZ2ljLiBDYW4gdGhpcyBwYXRj
aCBiZSBmaXhlZCBhcyBSSVNDVl9JU0FfRVhUX1pJQ0JPTSBhbmQgdGhlbiBhIHYyCj4gYmUgc2Vu
dD8KCkplc3NpY2EgcG9pbnRzIG91dCB0aGF0IENCSUUgc2hvdWxkIG9ubHkgYmUgc2V0IGlmIGl0
J3MgMGIwMSBidXQgaXQncwpjdXJyZW50bHkgMGIxMSwgc28ganVzdCBjaGFuZ2luZyBSSVNDVl9J
U0FfRVhUX1pJQ0JPTSBpcyBpbnN1ZmZpY2llbnQKZm9yIHYyLgoKSXMgdGhlcmUgYSB1c2UgY2Fz
ZSBmb3IgdXNlcm1vZGUgdG8gaGF2ZSBhbiBpbnZhbGlkYXRlIHdpdGhvdXQgYSBjbGVhbj8KSWYg
c28sIHRoZW4gaXMgdGhhdCB1c2UgY2FzZSBub3QgcHJlc2VudCBvbiBBcm0gcGxhdGZvcm1zIG9y
IGlzIHRoZXJlIGEKd29ya2Fyb3VuZCBmb3IgQXJtIHBsYXRmb3Jtcz8gQmVjYXVzZSBBcm0ncyAn
REMgSVZBQycgaXMgb25seSBhbGxvd2VkIGZvcgpFTDEgYW5kIGhpZ2hlci4gVG8gYmUgY29uc2lz
dGVudCB3aXRoIEFybSB3ZSBjYW4gYWRkIGNiby5mbHVzaCBhbmQKY2JvLmNsZWFuIChDQkNGRSkg
c2luY2UgQXJtIGRvZXMgYWxsb3cgZXhwb3NpbmcgJ0RDIENJVkFDJyBhbmQgJ0RDIENWQUMnCnRv
IEVMMC4gU2luY2UgaXQgbG9va3MgbGlrZSBDQklFPTBiMDEgd291bGQganVzdCBtYWtlIGNiby5p
bnZhbCBhbiBhbGlhcwpvZiBjYm8uZmx1c2gsIHRoZW4gSSdtIG5vdCBzdXJlIGl0IG1ha2VzIHNl
bnNlIHRvIHNldCBpdCwgaW4gZmFjdCBpdCBtYXkKanVzdCBjb25mdXNlIHRoaW5ncy4KClRoYW5r
cywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
