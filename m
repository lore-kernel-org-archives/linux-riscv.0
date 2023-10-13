Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CF3CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMugiUz2CQl28wfMYjWnwJdTYczrrRzPFf/Ajlbs6Uo=; b=wppsiwslJtKs5J
	Gv86nbdv8sQlFTuPTODoPPPvITerxg5HZNg2AuE9ywyxq8s1z3ZwzWK5xNhjiOK8eyy8sjKBntb0A
	qJkij+s6JWCjEFxUv2to2iK/B5i1qIwBY0yPDB5d8HrALYDK0fVa31wrVEjOyYDQMU6oqIxbNm2uO
	hwKMSw8d1mhfJlsVDv4f5J3BTPSo9Xk6QotvSG/Kzzxg9ha3af0rJ4vnXn7HwZUT+q5pbCNF7+BRw
	4CZGLJbMU+CTOs3hqHWuh2bGTwFCltrnvODVLJLP4tx1MlHY5zfrYjr7aHFbuZG7lAhQngpBY2vnB
	yQSz4i3JMHbxYTrtrSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrBvg-002cRz-0v;
	Fri, 13 Oct 2023 06:45:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrBvc-002cQJ-29
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 06:45:46 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53db3811d8fso3555849a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697179541; x=1697784341; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GsnPXTnd6aYctHxIKLVHp3QTPRApn/gCMd6+/Ix8ydk=;
        b=G+llU8w8PLQKK8QLAGPE8T5NwwXlnMS/dPkc1UK7Z9b+RuQeD7MAItAyCRVOV8rJJU
         2JzOuwrJyUY43KFRi7+UhqCi484EGepeyVN0BCV33cir2JdDlc2JTrO1J5GxnoTXJABo
         C4Jt67h1ArD+2DZrWkLFt5FlpHvF7VoDVGshLt4wTAKeANrPTJiobZRcZob1Nbif+/GN
         MA2Wa5M32aC/+GtolKaWiPabq/aXBe48gd3x9H7yW1tffFkFnDpIgCYd9uMSxcGWpMOa
         XNZbZ4/ycbWsvbHx9/wKR/m7fXcsrq67LL/+hqAmIBo51Ol9chfvOVZqvwuhsGBRuuit
         TN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697179541; x=1697784341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GsnPXTnd6aYctHxIKLVHp3QTPRApn/gCMd6+/Ix8ydk=;
        b=U+Lhx5kaaNycwrbtLKn/CQPDu0AuX0b8mxc2Rd5T8U8niWSOlO561dKm/nRcBdoTw4
         2Qrk9GPrJBObXAt8vbPiw9OdIp57vMpP6OukCy8ZvH0WBfT5RUOAtK3yWGZD82epfTVe
         fsRHMqNEgCQ7UZrbQqliLsobtoHPEiKXyzfhHolbEzqKKX9I4iW35SLyTTDUyjzWYAiU
         8wuPNe5XRzWB9A2CnQubw+yeUTMFFbYUlhUG7gRic1310o3Bl9SpkUqCqzaahpnL4TeK
         N2YyMOlrg/dz52+LVx+5nr9wmpXO9zsLxo3OtMOl8toKiMvYXxY9eZ87vSU9oMym+dyD
         Bk6Q==
X-Gm-Message-State: AOJu0YyJms5stBrQ4GYvzfiHWKWlG8URJzcD3uGqzcdEUJoGV59E1FYG
	iWYWn7z16To8sUT+y/LsuhPD/qefpyWxqujDY0A=
X-Google-Smtp-Source: AGHT+IGvJUJjvM7A0gFlJAefxn13BiAJrMcTYFOn+jQJl1whZ+XZHJLgln++gh3PrclNpR8lQLNRtA==
X-Received: by 2002:a05:6402:3228:b0:53d:e91b:7158 with SMTP id g40-20020a056402322800b0053de91b7158mr6256043eda.0.1697179540947;
        Thu, 12 Oct 2023 23:45:40 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402089400b005330e1e7da0sm10939839edy.92.2023.10.12.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 23:45:40 -0700 (PDT)
Date: Fri, 13 Oct 2023 08:45:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 2/6] RISC-V: Move the hwprobe syscall to its own file
Message-ID: <20231013-2f7672ff84aafb4b32143314@orel>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
 <20231011135610.122850-10-ajones@ventanamicro.com>
 <20231012-geologist-ramp-71c76a4305c7@spud>
 <20231012-3dc2e811d6a57ffe90719d2a@orel>
 <CALs-HssbhmFhH6BRUs+B7rwab5KGGaZRC67jOTJL5XJ9EsFa8g@mail.gmail.com>
 <20231012-unflawed-unison-cdb6921776c6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-unflawed-unison-cdb6921776c6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_234544_770023_DBAFAAD1 
X-CRM114-Status: GOOD (  30.17  )
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

T24gVGh1LCBPY3QgMTIsIDIwMjMgYXQgMDY6MDI6MzhQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEyLCAyMDIzIGF0IDA5OjQyOjM5QU0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCA5OjEx4oCvQU0gQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwg
T2N0IDEyLCAyMDIzIGF0IDAyOjQ1OjE0UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+
ID4gPiBPbiBXZWQsIE9jdCAxMSwgMjAyMyBhdCAwMzo1NjoxM1BNICswMjAwLCBBbmRyZXcgSm9u
ZXMgd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMKPiA+ID4gPiA+IEBAIC0wLDAgKzEsMjc2IEBACj4gPiA+ID4gPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiAr
ICogVGhlIGh3cHJvYmUgaW50ZXJmYWNlLCBmb3IgYWxsb3dpbmcgdXNlcnNwYWNlIHRvIHByb2Jl
IHRvIHNlZSB3aGljaCBmZWF0dXJlcwo+ID4gPiA+ID4gKyAqIGFyZSBzdXBwb3J0ZWQgYnkgdGhl
IGhhcmR3YXJlLiAgU2VlIERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgZm9yIG1vcmUK
PiA+ID4gPiA+ICsgKiBkZXRhaWxzLgo+ID4gPiA+ID4gKyAqCj4gPiA+ID4gPiArICogQ29weXJp
Z2h0IChDKSAyMDEyIFJlZ2VudHMgb2YgdGhlIFVuaXZlcnNpdHkgb2YgQ2FsaWZvcm5pYQo+ID4g
PiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNCBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMu
Y29tPgo+ID4gPiA+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNyBTaUZpdmUKPiA+ID4gPgo+ID4g
PiA+IFNvIHVoLCB0aGlzIGlzIGFsbCBuZXcoaXNoKSBjb2RlLCBvcmlnaW5hbGx5IHdyaXR0ZW4g
bGFzdCBTZXB0ZW1iZXIsCj4gPiA+ID4gdGhhdCBpcyBiZWluZyBtb3ZlZCwgcmlnaHQ/Cj4gPiA+
Cj4gPiA+IFllYWgsIEkganVzdCBwdWxsZWQgdGhlIENvcHlyaWdodHMgb3ZlciBieSBzdGFuZGFy
ZCBwcmFjdGljZSBvZiBjb2RlCj4gPiA+IG1vdmVtZW50LCBidXQgSSBhZ3JlZSB0aGV5IGRvbid0
IG1ha2UgbXVjaCBzZW5zZSBmb3IgdGhlIGNvZGUgSSBtb3ZlZC4KPiA+ID4gSSBzdWNrIGF0IGNv
cHlyaWdodCBtYW5hZ2VtZW50IGFuZCB3b3VsZCBiZSBoYXBweSBmb3Igc3VnZ2VzdGlvbnMgaGVy
ZS4KPiA+ID4gSWYgUml2b3Mgd291bGQgbGlrZSB0byBwdXQgb25lIGhlcmUgZm9yIHRoZSB3b3Jr
IEV2YW4gZGlkLCB0aGVuIEknbGwgYmUKPiA+ID4gaGFwcHkgdG8gYWRkIGl0LiBPciwgaWYgcGVv
cGxlIHByZWZlciwgSSBjb3VsZCBhZGQgYSBWZW50YW5hIGNvcHlyaWdodC4KPiA+IAo+ID4gSSBw
cm9iYWJseSB3b3VsZCBoYXZlIHN0dWNrIGEgUml2b3MgYmFubmVyIG9uIGl0IGlmIEkgaGFkIHdy
aXR0ZW4gaXQKPiA+IGFzIGEgbmV3IGZpbGUgbXlzZWxmLCBhcyBJIHRoaW5rIHRoZXkgIm93biIg
dGhlIHdvcmsgSSBkby4gQnV0IGl0IGFsbCBmZWVscwo+ID4gYSBiaXQgbGlrZSB2YW5pdHkgbGlj
ZW5zZSBwbGF0ZXMgZ2l2ZW4gaXQncyBHUEwsIHNvIEkgaW1hZ2luZSB3aGF0ZXZlcgo+ID4geW91
IGRvIHdpbGwgZ2V0IG5vIHJlYWwgY29tcGxhaW50cy4KPiAKPiBBeWUsIHRoYXQncyBob3cgSSBz
ZWUgaXQgdG9vLiBJJ3ZlIG5vdCBib3RoZXJlZCBhZGRpbmcgdGhhdCBzdHVmZiB3aGVyZQo+IEkg
Y291bGQgaGVscCBpdC4gVGhlIGdpdCBoaXN0b3J5IHNob3dzIHdobyBtYWRlIGNvcHlyaWdodGFi
bGUgY2hhbmdlcyB0bwo+IHRoZSBmaWxlIGFueXdheSwgYnV0IG9idi4gSSBhbSBubyBsYXd5ZXIu
Cj4gSnVzdCBpbiB0aGlzIGNhc2UsIHNpbmNlIGFzIGZhciBhcyBJIGNvdWxkIHRlbGwgdGhpcyBj
b2RlIHdhcyB3cml0dGVuCj4gZnJvbSBMUEMgb253YXJkcywgaXQgbWFkZSBsaXR0bGUgc2Vuc2Ug
dG8gY29weSBvdmVyIHNvbWUgMjAxMiBlcmEKPiBjb3B5cmlnaHQgaW5mb3JtYXRpb24uCj4KClNv
IHdoYXQncyB0aGUgZmluYWwgcGxhbj8gSSBmZWVsIGEgYml0IHN0cmFuZ2UgYWRkaW5nIGEgUml2
b3MgY29weXJpZ2h0CndoaWxlIGNvcHlpbmcgdGhlIFJpdm9zIGNvZGUgb3ZlciBzaW5jZSBJIGRv
bid0IGNvbnNpZGVyIG15c2VsZgoiYXV0aG9yaXplZCIgdG8gZG8gc28uIEkgYWxzbyBkb24ndCB3
YW50IHRvIGFkZCBhIFZlbnRhbmEgb25lIGZvciBqdXN0CmNvZGUgbW92ZW1lbnQuIERvIHdlIG5l
ZWQgYSBjb3B5cmlnaHQgb24gdGhpcyBmaWxlIGF0IGFsbD8gU2hvdWxkIEkgbW92ZQppdCB3aXRo
b3V0IGFueXRoaW5nIGFuZCB0aGVuIGFkZCBhIFZlbnRhbmEgY29weXJpZ2h0IHdoZW4gYWRkaW5n
IHRoZQp3aGljaC1jcHVzIHN0dWZmPwoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
