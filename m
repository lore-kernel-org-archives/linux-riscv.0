Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256A4C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qv1MtZ1s/eTuUfGg5xwOEQrOM4MkMoG1kCaOlYsD19s=; b=uvvGVIVB0EzpIN
	B6iQxaq/lJzeyJpNDT0gQ5QwcjRLedkRkwV9foknITDvbDkK96q9ce+7rmTNmx3Xa6snHGKPZkZqr
	DUfAh53RZdGdSd0RChFnoPtKvX+foNcF0GXcJUAYoef/v5XAgIVct4MZWSjRNjfR/n7vCglFJmTWw
	gFi/jvsMD3Chv3A3QmBr5C41QlQLdhPBozRuK9I/Nl5S0smC+AxDPP43F+IJb9YtNXOS54pGXnDV2
	eIqVTxSYZox9nhx/eRilx2rDa0NwyWTuMwu3jCPnvD3DVwqscZVK9wkhcBtROsdIDDkiTIkBX5ojI
	GdWKo8zQ+j9mxlLoTMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SZU-000ve1-12;
	Tue, 06 Jun 2023 09:01:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SZR-000vdY-2d
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 09:01:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b05e96dabbso33910935ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686042099; x=1688634099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6GNn4GUsKMsL/pW57HJSd6ui2CnlDqJZ6BWEi8KGSY=;
        b=C7FjtbGAH3IyOKQiiyPjCTc4qAzVIgfuvRCHvDA0Te8mpBU42JH0oIWodfPPF+El1b
         67Hjku/zAZCZSqNUIdh2nrGlK3hp+tnR5JWCwmcMcNzreS36HnuZ5idn+qMx1lkkTjrW
         Q/37SmSDoBVgJg9JU5msuxzNdDto/evJlUoamRjs6GMAqZ1S06Egl6NaoaOuGhwe+oBN
         MxPmC/1pgV9K2rD3D2xfanHoS33gtw1DhTT0PXOjuaW7Wk8p5c74owWsglmM1QaHLSA3
         iaCAAB4WgEOzaS8Cs5BF9FnZyy+x/PBGLMAMFgQGKfGslDLjs8xE4Jykz7I64quDU4Wk
         l3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042099; x=1688634099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6GNn4GUsKMsL/pW57HJSd6ui2CnlDqJZ6BWEi8KGSY=;
        b=MdP+mM0BW4Lh+xkWPeGLIfTyJKb1dUOZqPugZc1d9J7y4RshB9DctTnyzxOuw8dLAD
         XNXWoRd+nnLbsOofhri8sqFqzBE6DuXX6b+0khDS+T5IRz1AUTFdFxslpot0uT4QP6Ms
         gMOM1ZF1y0efIrJdN1SNkVIm/ogCPe2XQEb7jteEHrrRbM5AONk9TdV3BdnpGcl19BLm
         P79s6sbv8GT+LzyB4M0ipjy04qJNVTO5BkqFhHwbeGTY4PzN+L1a5rauBLmC5oATAYdl
         gRc4Oj3EzirBiUr+PEBY5TyLluW4A50cGTVFj5QxltftTpail27oQ0g20Dz1mAjgPkZo
         HZ+A==
X-Gm-Message-State: AC+VfDx58yrAwMfa4R99ZazZkncZ0MCyURmBaQiL8H5UP/KtuN+0izT8
	fqy9LIC9gpx6mBPmBchM935/Pw==
X-Google-Smtp-Source: ACHHUZ53GMdii/+LP4ueXdHs8VsgDNcktxztQynmtThIFWFOHmTJgv/iK1/vT3PZrXG5ASVrIfLj6g==
X-Received: by 2002:a17:902:bcc1:b0:1ac:482e:ed4d with SMTP id o1-20020a170902bcc100b001ac482eed4dmr959740pls.18.1686042098819;
        Tue, 06 Jun 2023 02:01:38 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b001b03ae38496sm8029457plg.48.2023.06.06.02.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:01:38 -0700 (PDT)
Date: Tue, 6 Jun 2023 14:31:30 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Song Shuai <songshuaishuai@tinylab.org>, robh <robh@kernel.org>,
	ajones <ajones@ventanamicro.com>, anup <anup@brainfault.org>,
	palmer <palmer@rivosinc.com>,
	"jeeheng.sia" <jeeheng.sia@starfivetech.com>,
	"leyfoon.tan" <leyfoon.tan@starfivetech.com>,
	"mason.huo" <mason.huo@starfivetech.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	"conor.dooley" <conor.dooley@microchip.com>,
	guoren <guoren@kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Bug report: kernel paniced while booting
Message-ID: <ZH716mJDnHlj1OBz@sunil-laptop>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
 <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
 <ZH37WMnx/rYSRF/o@sunil-laptop>
 <CAOnJCU+v-tinJb3=FY9GKzR=CGc+AE45wVdpVVZLSG1WOR2PLA@mail.gmail.com>
 <0855b8d6-e1e0-fea6-2b15-d7cc66d34e02@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0855b8d6-e1e0-fea6-2b15-d7cc66d34e02@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_020141_883642_E1DFDC9E 
X-CRM114-Status: GOOD (  48.51  )
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

T24gVHVlLCBKdW4gMDYsIDIwMjMgYXQgMDk6MjA6MzRBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IAo+IE9uIDA1LzA2LzIwMjMgMjI6NTUsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4g
T24gTW9uLCBKdW4gNSwgMjAyMyBhdCA4OjEz4oCvQU0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1biAwNSwgMjAyMyBhdCAwNDoyNTow
NlBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+ID4gSGkgU29uZywKPiA+ID4g
PiAKPiA+ID4gPiBPbiBNb24sIEp1biA1LCAyMDIzIGF0IDEyOjUy4oCvUE0gU29uZyBTaHVhaSA8
c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gRGVzY3JpcHRpb24g
b2YgcHJvYmxlbToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gQm9vdGluZyBMaW51eCBXaXRoIFJpc2NW
VmlydFFlbXUgZWRrMiBmaXJtd2FyZSwgYSBTdG9yZS9BTU8gcGFnZSBmYXVsdCB3YXMgdHJhcHBl
ZCB0byB0cmlnZ2VyIGEga2VybmVsIHBhbmljLgo+ID4gPiA+ID4gVGhlIGVudGlyZSBsb2cgaGFz
IGJlZW4gcG9zdGVkIGF0IHRoaXMgbGluayA6IGh0dHBzOi8vdGVybWJpbi5jb20vbmdhNC4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gWW91IGNhbiByZXByb2R1Y2UgaXQgd2l0aCB0aGUgZm9sbG93aW5n
IHN0ZXAgOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAxLiBwcmVwYXJlIHRoZSBlbnZpcm9ubWVudCB3
aXRoCj4gPiA+ID4gPiAgICAgLSBRZW11LXZpcnQ6ICB2OC4wLjAgKHdpdGggT3BlblNiaSB2MS4y
KQo+ID4gPiA+ID4gICAgIC0gZWRrMiA6IGF0IGNvbW1pdCAoMmJjODU0NTg4MyAiVWVmaUNwdVBr
Zy9DcHVQYWdlVGFibGVMaWI6IFJlZHVjZSB0aGUgbnVtYmVyIG9mIHJhbmRvbSB0ZXN0cyIpCj4g
PiA+ID4gPiAgICAgLSBMaW51eCA6IHY2LjQtcmMxIGFuZCBsYXRlciB2ZXJzaW9uCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IDIuIHN0YXJ0IHRoZSBRZW11IHZpcnQgYm9hcmQKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gYGBgc2gKPiA+ID4gPiA+ICQgY2F0IH4vOF9yaXNjdi9zdGFydF9sYXRlc3Quc2gKPiA+
ID4gPiA+ICMhL2Jpbi9iYXNoCj4gPiA+ID4gPiAvaG9tZS9zb25nLzhfcmlzY3YvM19hY3BpL3Fl
bXUvb29vL3Vzci9sb2NhbC9iaW4vcWVtdS1zeXN0ZW0tcmlzY3Y2NCBcCj4gPiA+ID4gPiAgICAg
ICAgICAtcyAtbm9ncmFwaGljIC1kcml2ZSBmaWxlPS9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkv
QnVpbGRfdmlydC9SaXNjVlZpcnRRZW11L1JFTEVBU0VfR0NDNS9GVi9SSVNDVl9WSVJULmZkLGlm
PXBmbGFzaCxmb3JtYXQ9cmF3LHVuaXQ9MSBcCj4gPiA+ID4gPiAgICAgICAgICAtbWFjaGluZSB2
aXJ0LGFjcGk9b2ZmIC1zbXAgMiAtbSAyRyBcCj4gPiA+ID4gPiAgICAgICAgICAta2VybmVsIC9o
b21lL3NvbmcvOV9saW51eC9saW51eC8wMF9ydl9kZWYvYXJjaC9yaXNjdi9ib290L0ltYWdlIFwK
PiA+ID4gPiA+ICAgICAgICAgIC1pbml0cmQgL2hvbWUvc29uZy84X3Jpc2N2LzNfYWNwaS9idWls
ZHJvb3Qvb3V0cHV0L2ltYWdlcy9yb290ZnMuZXh0MiBcCj4gPiA+ID4gPiAgICAgICAgICAtYXBw
ZW5kICJyb290PS9kZXYvcmFtIHJvIGNvbnNvbGU9dHR5UzAgZWFybHljb249dWFydDgyNTAsbW1p
bywweDEwMDAwMDAwIGVmaT1kZWJ1ZyBsb2dsZXZlbD04IG1lbWJsb2NrPWRlYnVnIiAjIyBhbHNv
IHBhbmljIGJ5IG1lbXRlc3QKPiA+ID4gPiA+IGBgYAo+ID4gPiA+ID4gMy4gVGhlbiB5b3Ugd2ls
bCBlbmNvdW50ZXIgdGhlIGtlcm5lbCBwYW5pYyBsb2dnZWQgaW4gdGhlIGFib3ZlIGxpbmsKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gT3RoZXIgSW5mb3JtYXRpb246Cj4gPiA+ID4gPiAKPiA+ID4gPiA+
IDEuIC0tLS0tLS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyByZXBvcnQgaXMgbm90IGlkZW50
aWNhbCB0byBteSBwcmlvciByZXBvcnQgLS0gImtlcm5lbCBwYW5pY2VkIHdoZW4gc3lzdGVtIGhp
YmVybmF0ZXMiIFsxXSwgYnV0IGJvdGggb2YgdGhlbQo+ID4gPiA+ID4gYXJlIGNsb3NlbHkgcmVs
YXRlZCB3aXRoIHRoZSBjb21taXQgKDMzMzUwNjhmODcyMSAicmlzY3Y6IFVzZSBQVUQvUDREL1BH
RCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nIikuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdp
dGggdGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRyYXBwZWQgd2l0aCAiYWNjZXNzIGZhdWx0
IiB3aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90ZWN0ZWQgcmVnaW9ucyAobW1vZGVfcmVzdjBA
ODAwMDAwMDApCj4gPiA+ID4gPiBmcm9tIE9wZW5TYmkgKEJUVywgaGliZXJuYXRpb24gaXMgbWFy
a2VkIGFzIG5vbnBvcnRhYmxlIGJ5IENvbm9yWzJdKS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSW4g
dGhpcyByZXBvcnQsIGVmaV9pbml0IGhhbmRvZmZzIHRoZSBtZW1vcnkgbWFwcGluZyBmcm9tIEJv
b3QgU2VydmljZXMgdG8gbWVtYmxvY2sgd2hlcmUgcmVzZXJ2ZXMgbW1vZGVfcmVzdjBAODAwMDAw
MDAsCj4gPiA+ID4gPiBzbyB0aGVyZSBpcyBubyAiYWNjZXNzIGZhdWx0IiBidXQgInBhZ2UgZmF1
bHQiLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbmQgcmV2ZXJ0aW5nIGNvbW1pdCAzMzM1MDY4Zjg3
MjEgaW5kZWVkIGZpeGVkIHRoaXMgcGFuaWMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IDIuIC0tLS0t
LS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gQXMgdGhlIGdkYi1wdC1kdW1wIFszXSB0b29sIHNob3dz
LCB0aGUgUFRFIHdoaWNoIGNvdmVyZWQgdGhlIGZhdWx0IHZpcnR1YWwgYWRkcmVzcyBoYWQgdGhl
IGFwcHJvcHJpYXRlIHBlcm1pc3Npb24gdG8gc3RvcmUuCj4gPiA+ID4gPiBJcyB0aGVyZSBhbm90
aGVyIHdheSB0byB0cmlnZ2VyIHRoZSAiU3RvcmUvQU1PIHBhZ2UgZmF1bHQiPyBPciB0aGUgY3Jl
YXRpb24gb2YgbGluZWFyIG1hcHBpbmcgaW4gY29tbWl0IDMzMzUwNjhmODcyMSBkaWQgc29tZXRo
aW5nIHdyb25nPwo+ID4gPiA+ID4gCj4gPiA+ID4gPiBgYGAKPiA+ID4gPiA+IChnZGIpIHAveCAk
c2F0cAo+ID4gPiA+ID4gJDEgPSAweGEwMDAwMDAwMDAwODE3MDgKPiA+ID4gPiA+IChnZGIpIHB0
IC1zYXRwIDB4YTAwMDAwMDAwMDA4MTcwOAo+ID4gPiA+ID4gICAgICAgICAgICAgICBBZGRyZXNz
IDogICAgIExlbmd0aCAgIFBlcm1pc3Npb25zCj4gPiA+ID4gPiAgICAweGZmMWJmZmZmZmVhMzkw
MDAgOiAgICAgMHgxMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ID4gPiAgICAweGZmMWJmZmZm
ZmViZjkwMDAgOiAgICAgMHgxMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ID4gPiAgICAweGZm
MWJmZmZmZmVjMDAwMDAgOiAgIDB4NDAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ID4gPiAg
ICAweGZmNjAwMDAwMDAwMDAwMDAgOiAgIDB4MWMwMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+
ID4gPiAgICAweGZmNjAwMDAwMDAyMDAwMDAgOiAgIDB4YTAwMDAwIHwgVzowIFg6MCBSOjEgUzox
Cj4gPiA+ID4gPiAgICAweGZmNjAwMDAwMDBjMDAwMDAgOiAweDdmMDAwMDAwIHwgVzoxIFg6MCBS
OjEgUzoxICAvLyBiYWRhZGRyOiBmZjYwMDAwMDdmZGIxMDAwCj4gPiA+ID4gPiAgICAweGZmNjAw
MDAwN2ZkYzAwMDAgOiAgICAweDNkMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ID4gPiAgICAw
eGZmNjAwMDAwN2ZmYmYwMDAgOiAgICAgMHgxMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ID4g
PiAgICAweGZmZmZmZmZmODAwMDAwMDAgOiAgIDB4YzAwMDAwIHwgVzowIFg6MSBSOjEgUzoxCj4g
PiA+ID4gPiAgICAweGZmZmZmZmZmODBjMDAwMDAgOiAgIDB4YTAwMDAwIHwgVzoxIFg6MCBSOjEg
UzoxCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGBgYAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAzLiAtLS0t
LS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gWW91IGNhbiBhbHNvIHJlcHJvZHVjZSBzaW1pbGFyIHBh
bmljIGJ5IGFwcGVuZGluZyAibWVtdGVzdCIgaW4ga2VybmVsIGNtZGxpbmUuCj4gPiA+ID4gPiBJ
IGhhdmUgcG9zdGVkIHRoZSBtZW10ZXN0IGJvb3QgbG9nIGF0IHRoaXMgbGluazogaHR0cHM6Ly90
ZXJtYmluLmNvbS8xdHdsLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBQbGVhc2UgY29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWdRdmtoVGVpb01tcVJEVkdqZHRORl92aEIrdm1fMWRI
SnhQTmk3NVlEUV9RQG1haWwuZ21haWwuY29tLwo+ID4gPiA+ID4gWzJdOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDUyNi1hc3RyaWRlLWRldG9uYXRvci05YWUxMjAw
NTExNTlAd2VuZHkvCj4gPiA+ID4gPiBbM106IGh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5yYWRl
di9nZGItcHQtZHVtcAo+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHRob3JvdWdoIHJlcG9ydCwgcmVh
bGx5IGFwcHJlY2lhdGVkLgo+ID4gPiA+IAo+ID4gPiA+IFNvIHRoZXJlIGFyZSBtdWx0aXBsZSBp
c3N1ZXMgaGVyZToKPiA+ID4gPiAKPiA+ID4gPiAtIHRoZSBmaXJzdCBvbmUgaXMgdGhhdCB0aGUg
bWVtb3J5IHJlZ2lvbiBmb3Igb3BlbnNiaSBpcyBtYXJrZWQgYXMgbm90Cj4gPiA+ID4gY2FjaGVh
YmxlIGluIHRoZSBlZmkgbWVtb3J5IG1hcCwgYW5kIHRoZW4gdGhpcyByZWdpb24gaXMgbm90IG1h
cHBlZCBpbgo+ID4gPiA+IHRoZSBsaW5lYXIgbWFwcGluZzoKPiA+ID4gPiBbICAgIDAuMDAwMDAw
XSBlZmk6ICAgMHgwMDAwODAwMDAwMDAtMHgwMDAwODAwM2ZmZmYgW1Jlc2VydmVkICAgIHwgICB8
Cj4gPiA+ID4gICB8ICB8ICB8ICB8ICB8ICB8ICB8ICB8ICAgfCAgfCAgfCAgfFVDXQo+ID4gPiA+
IAo+ID4gQEFsZXg6IFRoZSBPcGVuU0JJIHJlZ2lvbiBpcyBtYXJrZWQgcmVzZXJ2ZWQgYmVjYXVz
ZSBFREsyIGNob29zZXMgdG8KPiA+IGRvIHRoYXQgZXhwbGljaXRseSBhcyBleHBsYWluZWQgYnkg
U3VuaWwuCj4gPiBJIGRvbid0IHRoaW5rIFVDIGhhcyB0byBkbyBhbnl0aGluZyB3aXRoIGl0LiBB
bGwgdGhlIEVGSSBtZW1vcnkgcmVnaW9ucyBhcmUgVUMuCj4gCj4gCj4gT29wcywgdGhhbmtzIGZv
ciBjb3JyZWN0aW5nIG1lLCBVQyBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoYXQgaW5kZWVkLCBJ
Cj4gbWlzcmVhZCBpc191c2FibGVfbWVtb3J5KCkgKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLWluaXQuYyNMMTI3
KToKPiBFRklfUkVTRVJWRURfVFlQRSB3aWxsIHJldHVybiBmYWxzZS4KPiAKPiBBbmQgdGhlbiB0
aGlzIHJlZ2lvbiB3b24ndCBnZXQgbWFwcGVkLCBzbyB0aGF0J3MgdGhlIGVxdWl2YWxlbnQgb2Yg
Im5vLW1hcCIuCj4gCj4gCj4gPiAKPiA+ID4gPiAtIHRoZSBzZWNvbmQgb25lICh0aGF0IEkgZmVl
bCBhIGJpdCBhc2hhbWVkIG9mLi4uKSBpcyB0aGF0IEkgZGlkIG5vdAo+ID4gPiA+IGNoZWNrIHRo
ZSBhbGlnbm1lbnQgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyB3aGVuIGNob29zaW5nIHRoZSBtYXAg
c2l6ZQo+ID4gPiA+IGluIGJlc3RfbWFwX3NpemUoKSBhbmQgdGhlbiB3ZSBlbmQgdXAgdHJ5aW5n
IHRvIG1hcCBhIHBoeXNpY2FsIHJlZ2lvbgo+ID4gPiA+IGFsaWduZWQgb24gMk1CIHRoYXQgaXMg
YWN0dWFsbHkgbm90IGFsaWduZWQgb24gMk1CIHZpcnR1YWxseSBiZWNhdXNlCj4gPiA+ID4gdGhl
IG9wZW5zYmkgcmVnaW9uIGlzIG5vdCBtYXBwZWQgYXQgYWxsLgo+ID4gPiA+IAo+ID4gPiA+IC0g
dGhlIHBvc3NpYmxlIHRoaXJkIG9uZSBpcyB0aGF0IHdlIHNob3VsZCBub3QgbWFwIHRoZSBsaW5l
YXIgbWFwcGluZwo+ID4gPiA+IHVzaW5nIDRLIHBhZ2VzLCB0aGlzIHdvdWxkIGJlIHNsb3cgaW4g
bXkgb3BpbmlvbiwgYW5kIEkgdGhpbmsgd2UKPiA+ID4gPiBzaG91bGQgd2FzdGUgYSBiaXQgb2Yg
bWVtb3J5IHRvIGFsaWduIHZhIGFuZCBwYSBvbiBhIDJNQiBib3VuZGFyeS4KPiA+ID4gPiAKPiA+
ID4gPiBTbyBJJ2xsIGZpeCB0aGUgc2Vjb25kIGlzc3VlLCBhbmQgcG9zc2libHkgdGhlIHRoaXJk
IG9uZSwgYW5kIGlmIG5vCj4gPiA+ID4gb25lIGxvb2tzIGludG8gd2h5IHRoZSBvcGVuc2JpIHJl
Z2lvbiBpcyBtYXBwZWQgaW4gVUMsIEknbGwgdGFrZSBhCj4gPiA+ID4gbG9vayBhdCBlZGsyLgo+
ID4gPiA+IAo+ID4gPiBIaSBBbGV4LAo+ID4gPiAKPiA+ID4gRURLMiBtYXJrcyBvcGVuc2JpIHJh
bmdlIGFzIHJlc2VydmVkIG1lbW9yeSBpbiBFRkkgbWFwLiBBY2NvcmRpbmcgdG8gRFQKPiA+ID4g
c3BlYywgaWYgdGhlIG5vLW1hcCBpcyBub3Qgc2V0LCB3ZSBuZWVkIHRvIG1hcmsgaXQgYXMKPiA+
ID4gRWZpQm9vdFNlcnZpY2VzRGF0YSBidXQgRWZpQm9vdFNlcnZpY2VzRGF0YSBpcyBhY3R1YWxs
eSBjb25zaWRlcmVkIGFzCj4gPiA+IGZyZWUgbWVtb3J5IGluIGtlcm5lbCwgYXMgcGVyIFVFRkkg
c3BlYy4gVG8gYXZvaWQga2VybmVsIHVzaW5nIHRoaXMKPiA+ID4gbWVtb3J5LCB3ZSBkZXZpYXRl
ZCBmcm9tIHRoZSBEVCBzcGVjIGZvciBvcGVuc2JpIHJhbmdlcy4KPiA+ID4gCj4gPiBJTU8sIHRo
YXQgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IHdheSB1bmxlc3Mgd2UgY2FuIGNoYW5nZSBpdCB0bwo+
ID4gRWZpUnVuU2VydmljZXNEYXRhL0NvZGUuCj4gCj4gCj4gSSdkIHNheSB0aGF0IGV2ZXJ5dGhp
bmcgZGVwZW5kcyBvbiAicmV1c2FibGUiIG5vPwo+IAo+IElmICJuby1tYXAiIHRoZW4KPiDCoMKg
IEVmaVJlc2VydmVkCj4gZWxzZQo+IMKgwqAgaWYgcmV1c2FibGUgdGhlbgo+IMKgwqDCoMKgwqAg
RWZpQm9vdFNlcnZpY2VzRGF0YQo+IMKgwqAgZWxzZQo+IMKgwqDCoMKgwqAgRWZpUnVudGltZVNl
cnZpY2VzRGF0YQo+IMKgwqAgZW5kaWYKPiBlbmRpZgo+IApIaSBBbGV4LAoKSXMgdGhpcyB5b3Vy
IHByb3Bvc2FsIG9yIGRvY3VtZW50ZWQgc29tZXdoZXJlPyBJZiBpdCBpcyBwcm9wb3NhbCwgdGhp
cwpvcHRpb24gd2FzIGludGVudGlvbmFsbHkgbm90IGFsbG93ZWQgYXMgSSB1bmRlcnN0YW5kIGZy
b20gQXJkJ3MgcmVzcG9uc2UKYXQgWzFdLgoKWzFdIC0gaHR0cHM6Ly9naXRodWIuY29tL0FSTS1z
b2Z0d2FyZS9lYmJyL2lzc3Vlcy81MiNpc3N1ZWNvbW1lbnQtNjkwMzYyMjk0CgpUaGFua3MsClN1
bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
