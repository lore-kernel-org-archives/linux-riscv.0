Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4110CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wQtaWlQHztspW499Vo7Uket50uQhEGePwPFSanxcOA=; b=e/b24wSFa4ohUW
	9gtFCGbwPbG4+/gVAZt9rras61GZoB0Wsd+kkpVH9GGKbfPU9hmHHnZtc6Ox3mPZt+PtskWbxLidp
	dMaAY6DGPkP2O7CtDxhs+mUlsAn33rZaeUudYMClMqNREwkaASnr37bMdV/ErzPFcS8S1/0IiWZ69
	cISNSvx8dFgW87SO4w2diUno47O7PAcgbgBhaJ4d7lplS1eAaJ7lBbU1g4lFIvzOkvJPbMOxzK8rT
	bl1y/gmbxkgZLtSheeB2jSK4iJeJkY+AHmgwkJjbrox4cwh9LwU9E3ulxSW7Lp/NxKsOfl5v422Nb
	Cf6xEOvmON9ACdEe/Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqKb-005Jd0-04;
	Mon, 08 Jan 2024 14:10:21 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMqKX-005Jcc-2p
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 14:10:19 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a29058bb2ceso196472266b.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 06:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704723014; x=1705327814; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sli6pHW4snD64U/PJNI9lNskueO/Odf6cbKyshVP46s=;
        b=phGBNgigefnxT2jzTho8zwf8s5SSxbX11h9X4PtFw5bmqTVvv2YCyT9KA2phKiOH72
         gOEkKK80Q3Ik+e7871dLabmtGQlf6UiqTxYHHIZXKDOmtENjcL4Tu7f3iEfp7gvFC/yi
         Tha3v+Ram+6g3dkX6NXALQUPlSpR8mIttASAupBHCCB9+rou7jQhZgt4TWKkLJ9KsJSb
         o0XEiWHhkKCbYb33HRhAQ45bT1zz9S6sMKmVMHV6/NdsA5NIONVR0FvVxzyp1zV5wpHf
         lIpvMqVHD1N7N+PA2+RwtId0LooE4Wa8E0exAEIuF/xBpsg5kgVEWHV4IGAcNhkvrZtt
         mVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704723014; x=1705327814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sli6pHW4snD64U/PJNI9lNskueO/Odf6cbKyshVP46s=;
        b=ZcTfWe2HR4WipIAw90WjamDRNeasaUVvVdsCNXgxyacCd/AKdUKBBFPg01PlzfllQ5
         3kj4Q7Yz9UebhlOlWb1TVWqJJFhAhRe4Aa0TgTiRPnQi7jd1C7IP8pwMebBPD/u5miL4
         +YvVElGZZKV+H80f2mxPcLB1ZtoY86Bwwu3vqBojNNaFSCXThjgAer7XedQKuv2B6ZNA
         xgS4rOEWjReqsNv7prCi/pCyFJiEEkKI5x2JDgDUzmR6yYO4uWim8QiiK8v41skNEBIY
         RyVKFvBNzh0HJf54dGr18pV6uL48VAJsRF/88eJvnjc7n8ou5FbP/ZpUgO5UPduBy+16
         54UQ==
X-Gm-Message-State: AOJu0YzmIUvdeUhHGsrOsxzTi/Hk7pGXlmlR/59mcUoF7V0EuM3bvvlf
	QxFgozzTYEvq38VDAG5pmg4+HAMltITdLweb3jpihbRzZXA=
X-Google-Smtp-Source: AGHT+IEc+ioqQCPkFv/0Qw/q3QTPky0In6mMez6POYkKj2fpR3ZXGVYyQe1Z8L4sJDJw2xb6XCq8Jw==
X-Received: by 2002:a17:907:77d5:b0:a28:c8bd:fbfc with SMTP id kz21-20020a17090777d500b00a28c8bdfbfcmr1079871ejc.215.1704723014062;
        Mon, 08 Jan 2024 06:10:14 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fi5-20020a1709073ac500b00a29db9e8c84sm2654238ejc.220.2024.01.08.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:10:13 -0800 (PST)
Date: Mon, 8 Jan 2024 15:10:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: Andrea Parri <parri.andrea@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, David.Laight@aculab.com, 
	Conor Dooley <conor@kernel.org>
Subject: Re: Re: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <20240108-2a146eb7def54f0ce0b0d930@orel>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea>
 <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
 <ZTJUOji+B+dDbMKh@andrea>
 <20240108-a56ba0dfd1779e4ab6893d16@orel>
 <CAEg0e7g34qXbtaGbQftqucRxopFKHvErm=DWx8N65kueDo2n4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7g34qXbtaGbQftqucRxopFKHvErm=DWx8N65kueDo2n4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_061017_917706_ECD02BE6 
X-CRM114-Status: GOOD (  31.59  )
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

T24gTW9uLCBKYW4gMDgsIDIwMjQgYXQgMDM6MDA6MjlQTSArMDEwMCwgQ2hyaXN0b3BoIE3DvGxs
bmVyIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDgsIDIwMjQgYXQgMTI6MzXigK9QTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE9jdCAy
MCwgMjAyMyBhdCAxMjoxOTozOFBNICswMjAwLCBBbmRyZWEgUGFycmkgd3JvdGU6Cj4gPiA+IChS
ZW1vdmluZyBIZWlrbydzIEB2cnVsbCBhZGRyZXNzIGZyb20gQ2M6LCBzaW5jZSBpdCBzZWVtZWQg
dG8gYm91bmNlLCBrZWVwaW5nCj4gPiA+ICBoaXMgQHNudGVjaCBhZGRyZXNzLikKPiA+ID4KPiA+
ID4gPiBJIGhhZCBhIHF1aWNrIGxvb2sgYXQgeW91ciBjaGFuZ2VzLCBhbmQgdGhleSBsb29rIGdv
b2QgdG8gbWUuCj4gPiA+Cj4gPiA+IEdyZWF0LiAgVGhhbmsgeW91IGZvciBsb29raW5nIHRoZW0g
b3Zlci4KPiA+ID4KPiA+ID4gPiBEaWQgeW91IGFncmVlIHdpdGggUGFsbWVyIGFib3V0IHRlc3Rp
bmcgcmVxdWlyZW1lbnRzPwo+ID4gPiA+IEkuZS4sIGRvIHdlIG5lZWQgdG8gcnVuIHRoaXMgb24g
aGFyZHdhcmUgdGhhdCBpbXBsZW1lbnRzIFphd3JzIGluIGEKPiA+ID4gPiBub24tdHJpdmlhbCB3
YXk/Cj4gPiA+Cj4gPiA+IEkgZGlkbid0IHF1aXRlIGRpc2N1c3Mgc3VjaCBzcGVjaWZpYyByZXF1
aXJlbWVudHMgb3IgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zLAo+ID4gPiBidXQgSSBhZ3JlZSB0
aGF0J3MgYSB2YWxpZCBjb25jZXJuLiAgTm90IHRoYXQgSSBjdXJyZW50bHkgaGF2ZSBhY2Nlc3Mg
dG8gc3VjaAo+ID4gPiBoYXJkd2FyZTsgYW55IGZ1cnRoZXIgaW5wdXRzL2RhdGEgd2lsbCBiZSBh
cHByZWNpYXRlZC4KPiA+ID4KPiA+ID4gPiBJIGNhbiB0cnkgdG8gcmFpc2UgdGhlIHByaW9yaXR5
IG9uIHRoaXMgaGVyZSwgYnV0IGNhbid0IHByb21pc2UgYW55dGhpbmcuCj4gPiA+ID4gRm9yIG1l
IGl0IGlzIGFsc28gb2sgaWYgeW91IHRha2Ugb3ZlciB0aGlzIHBhdGNoc2V0Lgo+ID4gPgo+ID4g
PiBUaGFua3MuICBFaXRoZXIgd2F5IHdvcmtzIGZvciBtZS4gIE5vIHVyZ2VuY3kgZnJvbSBteSBz
aWRlLiAgSSdkIHNheSAtIGxldCB1cwo+ID4gPiBsZWF2ZSB0aGlzIHVwIHRvIHRoZSBjb21tdW5p
dHkvb3RoZXIgcmV2aWV3ZXJzLiAgKElJVUMsIFBhbG1lciB3YXMgcmVjb3ZlcmluZwo+ID4gPiBm
cm9tIGEgY2VydGFpbiBmbHUgYW5kIG1pZ2h0IG5lZWQgbW9yZSB0aW1lIHRoYW4gdXN1YWwgdG8g
Z2V0IGJhY2sgaGVyZS4pCj4gPiA+Cj4gPgo+ID4gSGkgZXZlcnlvbmUsCj4gPgo+ID4gSSdtIGFs
c28gaW50ZXJlc3RlZCBpbiBzZWVpbmcgdGhpcyBzZXJpZXMgcmVzdXJyZWN0ZWQgYW5kIG1ha2lu
ZyBwcm9ncmVzcwo+ID4gYWdhaW4uIEknZCBiZSBoYXBweSB0byBoZWxwIG91dCBpbiBhbnkgd2F5
LiBJdCdzIG5vdCBjbGVhciB0byBtZSBpZiBpdCBoYXMKPiA+IGEgY3VycmVudCBvd25lci4gSWYg
bm90LCB0aGVuIEkgY291bGQgc3RhcnQgc2hlcGhlcmRpbmcgdGhlIHBhdGNoZXMgd2l0aAo+ID4g
dGhlaXIgYXV0aG9yc2hpcHMgaW50YWN0Lgo+IAo+IFNvdW5kcyBnb29kIHRvIG1lIQo+IFRoYW5r
cyBmb3Igd29ya2luZyBvbiB0aGlzIQoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwbGllcyEgSSds
bCB0cnkgcHVsbCBzb21ldGhpbmcgdG9nZXRoZXIgaW4gdGhlIHZlcnkKbmVhciBmdXR1cmUuCgpk
cmV3Cgo+IAo+ID4KPiA+IEkgbWF5IGJlIGFibGUgdG8gZG8gc29tZSB0ZXN0aW5nIG9uIGFuIEZQ
R0EgdG9vLgo+ID4KPiA+IFRoYW5rcywKPiA+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
