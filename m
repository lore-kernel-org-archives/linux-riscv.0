Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CCC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYGeUY/gyu/n9aoMxIIbHYCOkba+b5zs8uey3YtL0Uk=; b=xixebf1rXfb4KA
	X2B+knBcq9Mj7rmGMNp4ATIq48xcuzRS1oXkplVzMC2a/jTNLuUyGDbasVvb7njEJz/rnD8h0vNAb
	8cLVxAVZSW38puyaCA8rmbobbpXgymULs1kAt+ODtJ2q6dGZPI72WctkhDmRqLyM6l5m41AuQIpqD
	x9Idv6kFeyAJIxZI7zh6e+xw77oGzfkqRAlfl+LzhIas1etzKgyT1qNkOvFjPCXSBaqOgT5bgM2rV
	ImD+PaKFcvSrDXkRuy1a4sZTBd66by7iM3Cvscxvn2IL0ZSTL7LhUaC8a5v3qEv9R+WujNFFA43+k
	vQpXbL94nu0Uo3uo93Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPANF-00000008Z0i-3VXh;
	Wed, 11 Jun 2025 01:35:29 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPAM4-00000008YtB-13ak
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 01:34:18 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-70e75f30452so39427027b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749605655; x=1750210455; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OfSC4aKAfG8eTdD02PuQcspqksT9Z9uW1xlgcKms2U=;
        b=VkQiJskq3YOA6Xk0NxxKDWWQ1A8qDsuGwD4jfatvCbo3JCztkmMarRAp5dLgKGCBel
         V6sNkPgxU3qm3NJrufJ6T+4sQeiiewZCzj/t5Y6E35xbbx9simn4RXyo2+b3WQjgB90p
         rWqpZQPFzPtVfdDO7xmJh8mi3AxILyeifNjBFekHYkLFZNHlk9ThiIkoLW/gMHaSZRQ1
         uLUotaXXEpgPXKibW/9E3g8tcMI6vft7Hz07CGUYWuvLNeeQh+2U4D2QCzgAMCh6d31w
         J45D2M5otpUzTqSuVUur7vMBbtklPfpmDyalFz5mxbQcmihjW8YL/b+gGfkK7nWKDErH
         NQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749605655; x=1750210455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OfSC4aKAfG8eTdD02PuQcspqksT9Z9uW1xlgcKms2U=;
        b=sV0YWBJDGyqzuUyKwuOYxj048H8i/eiORqJbJVOpHvd27b7KLIQMO4S7DBIRboN/vT
         /tuNHrV6MWULH6NVx0UWZLKy35gr32EAcRlOToNkh7wWuCNXHkJ4P1cmo1kyP9JCTsJL
         DoHIhX3qw1ODlE3Sm60UagMcpBbix626K/3VzBhXU8+xLmFo0tpWRuncc8W0L6z7MsPW
         e3Zq/vkMB0Fdv0A34ZzLmgIevOPYv2yR6WsN9HVwXGfIPNM2y7OauBjpQ1xxGKcxKAdy
         sJL2sCxlupN63nrPEgX7X3lwrRQdyXESsn+OJ7HgQOjgbrT6ISlJjK2oPaJO/dUp1nSW
         6Y4g==
X-Forwarded-Encrypted: i=1; AJvYcCWxuHJCG74DYCkblSf5sOHeGDAMyIi6Jt0T5gdwNfi8kBLN6B4/wGOEE83V0AWopkoyOSfo5ewBhH46aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5A8e+anVUOblH6zJMaEerOtBlol68eFOxFeizfol1zuv+cD4z
	U0cn49IYK2dpdHhMhpvCcXYln6LFQCtMotYCp5Ygo8cFqunThAuhmQzPVmry5DGQJXc=
X-Gm-Gg: ASbGnctB4BZ8qW8Sh8q3Kc3ckhQ6xAMCB62h6cWG2YBtZUWyslv4XBBO6DShqYHPYt2
	jQ0v4flklLxcRvy8I7a8u9o8CLS6xtO3lrWXwehilTwDvVHn27ysdW9hfE2jIYP6qkxpuPd3Ugq
	V5/za90Asv6mXtxejlR98yoS2T+ypWSFEcUfivYQbwgNd1VMJP//M+Bt15d3xOS2sXTBrzzwWyE
	MgYTdUN+kLD1GmYshsaHL5zMchgRk/9iyfgXCfGLMqPGdhPr7Z+xjd6Jcb99YAKF4hHnWmWWnf4
	9TKSVuHeV7AGcLWMPhgJkFFT5eMvSzqY/XRgS6qYdvgWmW6Lhg==
X-Google-Smtp-Source: AGHT+IHYGlstnL4M4iWhk6sxTD3RYWQKzXMATO+N4nls5RZd5bT+SAnIsznl4txVxtyAQOR8wSa7pQ==
X-Received: by 2002:a05:690c:62c1:b0:6ef:652b:91cf with SMTP id 00721157ae682-71140af6a29mr24008467b3.27.1749605654861;
        Tue, 10 Jun 2025 18:34:14 -0700 (PDT)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e8f15sm18416907b3.71.2025.06.10.18.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 18:34:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:34:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rabenda.cn@gmail.com, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jesse@rivosinc.com, andybnac@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
Message-ID: <aEjdFYDO6AhtHEvf@ghost>
References: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
 <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_183416_527728_89B6BC73 
X-CRM114-Status: GOOD (  20.31  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMDM6MDU6NThQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gRnJpLCAyMyBNYXkgMjAyNSAwMjo0Njo1MCBQRFQgKC0wNzAwKSwgcmFiZW5k
YS5jbkBnbWFpbC5jb20gd3JvdGU6Cj4gPiBJIHdpbGwgcmVsZWFzZSB2MiBsYXRlciB0byBhZGQg
ZXhwbGFuYXRpb24gYW5kIGFkZCBmaXggdGFnCj4gCj4gU29ycnkgaWYgSSBtaXNzZWQgaXQsIGJ1
dCBJIGRvbid0IHNlZSBhIHYyIChJJ20gc2NydWJiaW5nIHRocm91Z2ggc3R1ZmYgcG9zdAo+IG1l
cmdlIHdpbmRvdykuCgp2MiBpcyBoZXJlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvOWI5
ZWIyMzM3ZjNkNTMzNmNlODEzNzIxZjhlYmVhNTFlMGIyYjU1My4xNzQ3OTk0ODIyLmdpdC5yYWJl
bmRhLmNuQGdtYWlsLmNvbS8KCi0gQ2hhcmxpZQoKPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gCj4g
PiBIYW4KPiA+IAo+ID4gT24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgNDo1NOKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBIaSBIYW4sCj4gPiA+
IAo+ID4gPiBPbiA1LzIyLzI1IDE5OjI3LCBIYW4gR2FvIHdyb3RlOgo+ID4gPiA+IEZpeCBbMV0g
c2F2ZS9yZXN0b3JlIHZlY3RvciByZWdpc3RlciBlcnJvcgo+ID4gPiA+Cj4gPiA+ID4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMTEzLXh0aGVhZHZlY3Rvci12MTEtOS0y
MzZjMjI3OTFlZjlAcml2b3NpbmMuY29tLyBbMV0KPiA+ID4gCj4gPiA+IAo+ID4gPiBXb3VsZCB5
b3UgbWluZCByZXBocmFzaW5nIHRoZSBsb2c/IEl0IHNob3VsZCBleHBsYWluIHdoYXQgd2FzIHdy
b25nIGFuZAo+ID4gPiBob3cgeW91IGZpeGVkIGl0Lgo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4g
PiAKPiA+ID4gQWxleAo+ID4gPiAKPiA+ID4gCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBIYW4gR2FvIDxyYWJlbmRhLmNuQGdtYWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggfCAxMiArKysrKystLS0tLS0KPiA+ID4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+ID4K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+ID4gPiBpbmRleCBlOGE4M2Y1NWJlMmIu
LjdkZjYzNTUwMjNhMyAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3ZlY3Rvci5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+
ID4gPiA+IEBAIC0yMDAsMTEgKzIwMCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92
X3ZzdGF0ZV9zYXZlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpzYXZlX3RvLAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0VUVkxJX1Q0WDBFOE04RDEKPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjBUMAo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAiYWRkICAgICAgICAgICAgdDAsIHQwLCB0NFxuXHQiCj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIFRIRUFEX1ZTQl9WX1YwVDAKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgVEhFQURfVlNCX1ZfVjhUMAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAiYWRk
ICAgICAgICAgICAgdDAsIHQwLCB0NFxuXHQiCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
IFRIRUFEX1ZTQl9WX1YwVDAKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNC
X1ZfVjE2VDAKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQw
LCB0MCwgdDRcblx0Igo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9W
MFQwCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZTQl9WX1YyNFQwCj4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIDogOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiLCAidDAi
LCAidDQiKTsKPiA+ID4gPiAgICAgICB9IGVsc2Ugewo+ID4gPiA+ICAgICAgICAgICAgICAgYXNt
IHZvbGF0aWxlICgKPiA+ID4gPiBAQCAtMjM2LDExICsyMzYsMTEgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fcmlzY3Zfdl92c3RhdGVfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAq
cmVzdG9yZV8KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNFVFZMSV9UNFgw
RThNOEQxCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YwVDAKPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0
Igo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBUSEVBRF9WTEJfVl9WMFQwCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1Y4VDAKPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0Igo+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICBUSEVBRF9WTEJfVl9WMFQwCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIFRIRUFEX1ZMQl9WX1YxNlQwCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICJh
ZGQgICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgVEhFQURfVkxCX1ZfVjBUMAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBUSEVBRF9W
TEJfVl9WMjRUMAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICA6IDogInIiIChkYXRhcCkg
OiAibWVtb3J5IiwgInQwIiwgInQ0Iik7Cj4gPiA+ID4gICAgICAgfSBlbHNlIHsKPiA+ID4gPiAg
ICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
