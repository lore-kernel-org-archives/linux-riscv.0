Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033DBC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDQNCk+j9ZkIz6M7zZLkHnHyhVhswoD5H8kWeFa7xP4=; b=SoGS0mdUkHtKYs
	ijOf7fJ60WYTbNuYOweR6w7WNAsj7OYeo9Krm4wUeLD5o2u7m+2vGtHfeIbRvU3avms8w3vApooci
	5EHOOP2d/h8wvEe5yAOXvJZJcpfYnfq8k8BMc/eLFXvy6jY5PJrz356Wld9GnsXV8UDOb+ebRFgdZ
	9uyHARGCOmXT/+zuHvgzVsLz2UAFE9dbs/hKTQeg8g+aYatxdHgg0MtWADnMmCLUJwNMlgKm+pUAe
	TGAlRrxzXABU9aVC365vhwsTOVd7cVJNsGheP7LiWmtVG9m9SbG6tjtIb1hzOIO1kuxdofgYGFcbH
	1vVI8G4OwMkDmXrH0iAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQJG-00000004BCR-1zPa;
	Thu, 01 Aug 2024 07:33:14 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQJD-00000004BBK-2o0e
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 07:33:12 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4ef76f04977so2204437e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722497589; x=1723102389; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxR+keK0EoqoxbiDMpzy0xDwZ6lQuLfFwlbPoWTYpLE=;
        b=UIIu5ameDWlHHQPbeUdx+vLaUUHxBpd0OL6gPnsWXC9mDV/Cekxl7808F7R1vpmadp
         IqrA2gUkkNdL0APSiovCtPN487jWGrFqqJ4aL01sNr8tD3rsG7g4AlqWnZCcNksvMSIC
         CTdVEJVYbjwiodbq9LYrDmYH5h8GThcx6t9P+w6qx+MvPHOHvZdWkOhvoNmxCdpvuw2d
         HZ7aSK4Sfu3zDZghIl4Y54rx/hlFolo2rBJcopqXEAGtZBuKAOVj0Z5QbWnJcA/vRVCz
         epVZDYTjh17wQfUYEts14XQc80EDTBJSh2Q6HOnnL/YAwpVVb0/zja99LP5dI7NV+ISv
         silQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722497589; x=1723102389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxR+keK0EoqoxbiDMpzy0xDwZ6lQuLfFwlbPoWTYpLE=;
        b=pliiTBrsquc7G3btAOevUqhQrPxIeAqDPoNgyq7qX/ZO34/tGjwUle1uRiY9NYyBSW
         7rYAgXsEW+7LAGXFJOISmRFGFxMg4UfmgIaz8jIPkiPFnqQE4vnuLjLVEIO8pPi8oZgt
         XoKN+NKwHJdMXKR/R0jLYZm1HTl/QKsOvLb1ar+fNPENaQpf+I76sULjaDcVMU/VZJUc
         Mk9G9BzYluXpHtVkpUjV3Kzm7hwzca8aHg93Qc3pXFQ/X6BTGxvkDrfyJEcsonHFSs1a
         EdHsrSa4IlN17+8wYquBnUBK9Dx8zBj3pL0aovJ5fExM6AeP+iBzD1Ft/SyT4NB5JlCU
         4+4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAi/FUriTuSnusQQYCcicsbSjigNIg6sN94zBiLQ2V5G+yc8UXDe6UFmPOiYUZmcpwMhb2FuvkskL8vEWfRWmozznq3rI4r7cgsDMZ9Ge7
X-Gm-Message-State: AOJu0Yydccp+JCExtCPl1ymlrPfQnMkfstkyCMqy5vFfe6PgCSawFfPx
	ZeHaTG/WTUN7ue7Aqfw9R5wol4sa5phOV+sn4it3G3ioCg16hos054gaGAHityomQ3G50vpsLXX
	dE1JTY9rQUSk52549df0qwXdWD+g=
X-Google-Smtp-Source: AGHT+IEC4F/yNfXSGbEXf6Ys7ewuz6Z6FPtAktCV2Nmk0h8hk03wn2JqMTg2HFgP4Cz1BNs61Ncn+lGomRaLwAS/APc=
X-Received: by 2002:a05:6122:901:b0:4ec:f8f0:7175 with SMTP id
 71dfb90a1353d-4f89654563fmr1999871e0c.11.1722497589401; Thu, 01 Aug 2024
 00:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
In-Reply-To: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Aug 2024 08:32:43 +0100
Message-ID: <CA+V-a8tKdwvDxYqxyf9JwDa4ZPz41=+ecJ5cf7ZO-G_PAk26-Q@mail.gmail.com>
Subject: Re: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003311_733523_BBF65E79 
X-CRM114-Status: GOOD (  21.92  )
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

SGkgR2VlcnQsCgpPbiBUdWUsIEp1bCAzMCwgMjAyNCBhdCA0OjM34oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuCjxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cj4KPiBUaGVyZSBpcyBub3Qg
bXVjaCBwb2ludCBpbiBrZWVwaW5nIHN1cHBvcnQgZm9yIFJaL0ZpdmUgcGVyaXBoZXJhbHMKPiBl
bmFibGVkLCBhcyB0aGUgUlovRml2ZSBwbGF0Zm9ybSBvcHRpb24gKEFSQ0hfUjlBMDdHMDQzKSBp
cyBnYXRlZCBiZWhpbmQKPiBOT05QT1JUQUJMRS4gIEhlbmNlIGRyb3AgYWxsIGNvbmZpZyBvcHRp
b25zIHRoYXQgZW5hYmxlIGJ1aWx0LWluIG9yCj4gbW9kdWxhciBzdXBwb3J0IGZvciBwZXJpcGhl
cmFscyBmb3VuZCBvbiBSWi9GaXZlIFNvQ3MuCj4KPiBEaXNhYmxlIFVTQl9YSENJX1JDQVIgZXhw
bGljaXRseSwgYXMgaXRzIHZhbHVlIGRlZmF1bHRzIHRvIHRoZSB2YWx1ZSBvZgo+IEFSQ0hfUkVO
RVNBUywgd2hpY2ggaXMgc3RpbGwgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gLS0tCj4gUXVlc3Rpb25zOgo+
ICAgMS4gUGVyaGFwcyB0aGUgaW50ZW50aW9uIGlzIHRvIGtlZXAgYWxsIFJaL0ZpdmUgcGVyaXBo
ZXJhbCBzdXBwb3J0Cj4gICAgICBlbmFibGVkLCBzbyBSWi9GaXZlIHVzZXJzIGNhbiBzdGFydCBm
cm9tIHRoZSBkZWZjb25maWcsIGFuZAo+ICAgICAgImp1c3QiWzFdIGVuYWJsZSBOT05QT1JUQUJM
RSBhbmQgQVJDSF9SOUEwN0cwNDM/Cj4KPiAgICAgIFsxXSBOb3BlLCBuZWVkIHRvIGRpc2FibGUg
UklTQ1ZfSVNBX1pJQ0JPTSBhbmQgRVJSQVRBX1RIRUFEX0NNTwo+ICAgICAgICAgIChhbmQgd2hh
dGV2ZXIgZWxzZSBpbiB0aGUgZnV0dXJlPyksIHRvby4KPgo+ICAgMi4gUGVyaGFwcyBDT05GSUdf
QVJDSF9SRU5FU0FTPXkgc2hvdWxkIGJlIGRyb3BwZWQsIHRvbz8KPiAgICAgIEluIGFkZGl0aW9u
IHRvIFVTQl9YSENJX1JDQVIsIHRoYXQgd291bGQgZ2V0IHJpZCBvZiBTT0NfQlVTLAo+ICAgICAg
UElOQ1RSTF9SRU5FU0FTLCBDTEtfUkVORVNBUywgYW5kIFNPQ19SRU5FU0FTLgo+CkkgdGhpbmsg
aXQgZG9lcyBtYWtlIHNlbnNlIGlmIHdlIGRyb3AgdGhlIGFib3ZlIGNvbmZpZ3MgdG9vIGFzIGFu
eXdheQp1c2VycyB3aWxsIGhhdmUgdG8gc2VsZWN0IHRoZSBjb25maWdzIG1hbnVhbGx5IHRvIGdl
dCBhIGJvb3RhYmxlIGltYWdlCmZvciBSWi9GaXZlLgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9jb25m
aWdzL2RlZmNvbmZpZyB8IDEyICstLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDExIGRlbGV0aW9ucygtKQo+ClJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxw
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpDaGVlcnMsClByYWJoYWth
cgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWcKPiBpbmRleCAwZDY3ODMyNTQ0NGZjY2RjLi5iNTFlZjZjZDFl
Mzk4NmVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiArKysg
Yi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gQEAgLTEzNywxMiArMTM3LDEwIEBAIENP
TkZJR19WSVJUSU9fTkVUPXkKPiAgQ09ORklHX01BQ0I9eQo+ICBDT05GSUdfRTEwMDBFPXkKPiAg
Q09ORklHX1I4MTY5PXkKPiAtQ09ORklHX1JBVkI9eQo+ICBDT05GSUdfU1RNTUFDX0VUSD1tCj4g
IENPTkZJR19NSUNSRUxfUEhZPXkKPiAgQ09ORklHX01JQ1JPU0VNSV9QSFk9eQo+ICBDT05GSUdf
TU9UT1JDT01NX1BIWT15Cj4gLUNPTkZJR19DQU5fUkNBUl9DQU5GRD1tCj4gIENPTkZJR19JTlBV
VF9NT1VTRURFVj15Cj4gIENPTkZJR19LRVlCT0FSRF9TVU40SV9MUkFEQz1tCj4gIENPTkZJR19T
RVJJQUxfODI1MD15Cj4gQEAgLTE1MCw3ICsxNDgsNiBAQCBDT05GSUdfU0VSSUFMXzgyNTBfQ09O
U09MRT15Cj4gIENPTkZJR19TRVJJQUxfODI1MF9EVz15Cj4gIENPTkZJR19TRVJJQUxfT0ZfUExB
VEZPUk09eQo+ICBDT05GSUdfU0VSSUFMX0VBUkxZQ09OX1JJU0NWX1NCST15Cj4gLUNPTkZJR19T
RVJJQUxfU0hfU0NJPXkKPiAgQ09ORklHX1ZJUlRJT19DT05TT0xFPXkKPiAgQ09ORklHX0hXX1JB
TkRPTT15Cj4gIENPTkZJR19IV19SQU5ET01fVklSVElPPXkKPiBAQCAtMTU5LDExICsxNTYsOSBA
QCBDT05GSUdfSTJDPXkKPiAgQ09ORklHX0kyQ19DSEFSREVWPW0KPiAgQ09ORklHX0kyQ19ERVNJ
R05XQVJFX1BMQVRGT1JNPXkKPiAgQ09ORklHX0kyQ19NVjY0WFhYPW0KPiAtQ09ORklHX0kyQ19S
SUlDPXkKPiAgQ09ORklHX1NQST15Cj4gIENPTkZJR19TUElfQ0FERU5DRV9RVUFEU1BJPW0KPiAg
Q09ORklHX1NQSV9QTDAyMj1tCj4gLUNPTkZJR19TUElfUlNQST1tCj4gIENPTkZJR19TUElfU0lG
SVZFPXkKPiAgQ09ORklHX1NQSV9TVU42ST15Cj4gICMgQ09ORklHX1BUUF8xNTg4X0NMT0NLIGlz
IG5vdCBzZXQKPiBAQCAtMTcyLDcgKzE2Nyw2IEBAIENPTkZJR19QT1dFUl9SRVNFVF9HUElPX1JF
U1RBUlQ9eQo+ICBDT05GSUdfU0VOU09SU19TRkNURU1QPW0KPiAgQ09ORklHX0NQVV9USEVSTUFM
PXkKPiAgQ09ORklHX0RFVkZSRVFfVEhFUk1BTD15Cj4gLUNPTkZJR19SWkcyTF9USEVSTUFMPXkK
PiAgQ09ORklHX1dBVENIRE9HPXkKPiAgQ09ORklHX1NVTlhJX1dBVENIRE9HPXkKPiAgQ09ORklH
X01GRF9BWFAyMFhfSTJDPXkKPiBAQCAtMjAxLDExICsxOTUsMTEgQEAgQ09ORklHX1VTQj15Cj4g
IENPTkZJR19VU0JfT1RHPXkKPiAgQ09ORklHX1VTQl9YSENJX0hDRD15Cj4gIENPTkZJR19VU0Jf
WEhDSV9QTEFURk9STT15Cj4gKyMgQ09ORklHX1VTQl9YSENJX1JDQVIgaXMgbm90IHNldAo+ICBD
T05GSUdfVVNCX0VIQ0lfSENEPXkKPiAgQ09ORklHX1VTQl9FSENJX0hDRF9QTEFURk9STT15Cj4g
IENPTkZJR19VU0JfT0hDSV9IQ0Q9eQo+ICBDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNPXkK
PiAtQ09ORklHX1VTQl9SRU5FU0FTX1VTQkhTPW0KPiAgQ09ORklHX1VTQl9TVE9SQUdFPXkKPiAg
Q09ORklHX1VTQl9VQVM9eQo+ICBDT05GSUdfVVNCX0NETlNfU1VQUE9SVD1tCj4gQEAgLTIxNyw3
ICsyMTEsNiBAQCBDT05GSUdfVVNCX01VU0JfSERSQz1tCj4gIENPTkZJR19VU0JfTVVTQl9TVU5Y
ST1tCj4gIENPTkZJR19OT1BfVVNCX1hDRUlWPW0KPiAgQ09ORklHX1VTQl9HQURHRVQ9eQo+IC1D
T05GSUdfVVNCX1JFTkVTQVNfVVNCSFNfVURDPW0KPiAgQ09ORklHX1VTQl9DT05GSUdGUz1tCj4g
IENPTkZJR19VU0JfQ09ORklHRlNfU0VSSUFMPXkKPiAgQ09ORklHX1VTQl9DT05GSUdGU19BQ009
eQo+IEBAIC0yMzUsNyArMjI4LDYgQEAgQ09ORklHX01NQ19TREhDSV9QTFRGTT15Cj4gIENPTkZJ
R19NTUNfU0RIQ0lfT0ZfRFdDTVNIQz15Cj4gIENPTkZJR19NTUNfU0RIQ0lfQ0FERU5DRT15Cj4g
IENPTkZJR19NTUNfU1BJPXkKPiAtQ09ORklHX01NQ19TREhJPXkKPiAgQ09ORklHX01NQ19EVz15
Cj4gIENPTkZJR19NTUNfRFdfU1RBUkZJVkU9eQo+ICBDT05GSUdfTU1DX1NVTlhJPXkKPiBAQCAt
MjUwLDcgKzI0Miw2IEBAIENPTkZJR19WSVJUSU9fSU5QVVQ9eQo+ICBDT05GSUdfVklSVElPX01N
SU89eQo+ICBDT05GSUdfQ0xLX1NPUEhHT19DVjE4MDA9eQo+ICBDT05GSUdfU1VOOElfREUyX0ND
VT1tCj4gLUNPTkZJR19SRU5FU0FTX09TVE09eQo+ICBDT05GSUdfU1VONTBJX0lPTU1VPXkKPiAg
Q09ORklHX1JQTVNHX0NIQVI9eQo+ICBDT05GSUdfUlBNU0dfQ1RSTD15Cj4gQEAgLTI1OCw3ICsy
NDksNiBAQCBDT05GSUdfUlBNU0dfVklSVElPPXkKPiAgQ09ORklHX1BNX0RFVkZSRVE9eQo+ICBD
T05GSUdfSUlPPXkKPiAgQ09ORklHX1BIWV9TVU40SV9VU0I9bQo+IC1DT05GSUdfUEhZX1JDQVJf
R0VOM19VU0IyPXkKPiAgQ09ORklHX1BIWV9TVEFSRklWRV9KSDcxMTBfRFBIWV9SWD1tCj4gIENP
TkZJR19QSFlfU1RBUkZJVkVfSkg3MTEwX1BDSUU9bQo+ICBDT05GSUdfUEhZX1NUQVJGSVZFX0pI
NzExMF9VU0I9bQo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
