Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C00C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kp6OJyNnH0F6WA149/iE0oomYQJjQK1rdrQhVG3GkGI=; b=0qeOX40mcX3ijG
	bb6s8GVPk8AtyfmfqUyj/oSPvJ3DiOR2w2SrfmiZqtoWXVmBrj92e3ryuobD1Pn1p5tdEtsZOqLTF
	tMO32uhmtdHa+hGbthVhvAQJGlVx0CRGGAIrjsgnTlIJBMp3L8n8gD8JW/XoRNsWVm0rqudFzyyL6
	Vknr9yIeLMLI7ch2rpxRDwu6bdEXG2nq5c/0HygIShXLYTjP5c3CYmciBWAE8oLuM9dNtGON7P5s1
	BiNf3Lil4Xk52gNLye2gasWQ5hlJYxAwwSbat48nhC/jQbrr9LzsuLkCrCCtpxYbD1tYLTjJRsiNq
	XO1BgeH6dj3Pkt3o0qzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QNC-000P9o-0l;
	Tue, 06 Jun 2023 06:40:54 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QN9-000P99-1L
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 06:40:53 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3f8008cb772so50321651cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 23:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686033650; x=1688625650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqiAGy4qjIy1yaY4y/HmMSGJUjUy+hsSGeNr2uAnUAM=;
        b=jTFytEe+/lfsw/dBrLdsmHanoP8VdhpHPsJCubi7YBwlblGJ/ouddT/j4w58BKFhWd
         AvbdadsSZjKHMeeRE09GD4ihk74wGmuuVEdux0zDRKrscLa436PKCKWfDSnRLgZA6XT1
         qSEAexPWUGFF7FqfhVqDLZA/qbO7iKNMjgJveymS/dGZgYxVp0oaSeXBVzU+wYfaR+6J
         c+41Ysz3fAwxyr294QrsFzP1xy1gvTaAQtryY11QkMXcQliL26P+0bgAyxejveLAP79X
         b5QGXPGFBDOx+Jg6MScxQIophjY0w7NI3J+fYnYYDP379coJuRMsO8BquBCdax8fjg4W
         s6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033650; x=1688625650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqiAGy4qjIy1yaY4y/HmMSGJUjUy+hsSGeNr2uAnUAM=;
        b=hS8gga9HfYuOi9H6xHY2PaHbfKV8msjD1OwuImLLipPE/qJeGVxHB8naTFjYgbQUs2
         n22kVMt2qubQZEnbkE9ydHlwwUSTjEvKKfYwTqznqupsDAOwgGozylOL79I1uQn7MzMY
         Bd7r3vlPppZy8q75XStbXwCTLuCt1dAFI6LUCe4t5P7Gvtacou8h8bkvmQxp0SKehncM
         G/cAY4O9Fp/gu7yXfxW7LrERM7+QZUNsW+H6agU1vEcwEnQKtSV1HSyPI7cbUFF/djV7
         n2AVxVeaxRKLbmni5SV/blZhCM/8TuxOvlo3EawgkngXNAgk2weQ8maP7x8nCxcp6+16
         HTlA==
X-Gm-Message-State: AC+VfDzFGfKKffeT/81daxMVwLQNi8ix69u74iIwIWmcqcvZuEWR4FKy
	c1ze5y6XG0QoACZCEMb4n9cXEQ==
X-Google-Smtp-Source: ACHHUZ7hK2xB12BHJ6pZPC6BE+RPCtoGiN2HQvQ+oItvkSCnjbdaYZJ8dNPr3fXz+5gG//AJXkWHOQ==
X-Received: by 2002:a05:622a:3cd:b0:3f5:34fc:f216 with SMTP id k13-20020a05622a03cd00b003f534fcf216mr1073327qtx.54.1686033650038;
        Mon, 05 Jun 2023 23:40:50 -0700 (PDT)
Received: from sunil-laptop ([106.51.186.3])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a2f0100b0023d386e4806sm7320837pjd.57.2023.06.05.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:40:49 -0700 (PDT)
Date: Tue, 6 Jun 2023 12:10:41 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Message-ID: <ZH7U6QTbKsO0kfYx@sunil-laptop>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
 <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
 <ZH37WMnx/rYSRF/o@sunil-laptop>
 <38747287-B219-4B48-B088-A33ADC7954A0@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38747287-B219-4B48-B088-A33ADC7954A0@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_234051_463608_2EFB69BA 
X-CRM114-Status: GOOD (  39.35  )
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

T24gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMTA6NDI6MzNQTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gNSBKdW4gMjAyMywgYXQgMTY6MTIsIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+IAo+ID4gT24gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMDQ6
MjU6MDZQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+IEhpIFNvbmcsCj4gPj4g
Cj4gPj4gT24gTW9uLCBKdW4gNSwgMjAyMyBhdCAxMjo1MuKAr1BNIFNvbmcgU2h1YWkgPHNvbmdz
aHVhaXNodWFpQHRpbnlsYWIub3JnPiB3cm90ZToKPiA+Pj4gCj4gPj4+IERlc2NyaXB0aW9uIG9m
IHByb2JsZW06Cj4gPj4+IAo+ID4+PiBCb290aW5nIExpbnV4IFdpdGggUmlzY1ZWaXJ0UWVtdSBl
ZGsyIGZpcm13YXJlLCBhIFN0b3JlL0FNTyBwYWdlIGZhdWx0IHdhcyB0cmFwcGVkIHRvIHRyaWdn
ZXIgYSBrZXJuZWwgcGFuaWMuCj4gPj4+IFRoZSBlbnRpcmUgbG9nIGhhcyBiZWVuIHBvc3RlZCBh
dCB0aGlzIGxpbmsgOiBodHRwczovL3Rlcm1iaW4uY29tL25nYTQuCj4gPj4+IAo+ID4+PiBZb3Ug
Y2FuIHJlcHJvZHVjZSBpdCB3aXRoIHRoZSBmb2xsb3dpbmcgc3RlcCA6Cj4gPj4+IAo+ID4+PiAx
LiBwcmVwYXJlIHRoZSBlbnZpcm9ubWVudCB3aXRoCj4gPj4+ICAgLSBRZW11LXZpcnQ6ICB2OC4w
LjAgKHdpdGggT3BlblNiaSB2MS4yKQo+ID4+PiAgIC0gZWRrMiA6IGF0IGNvbW1pdCAoMmJjODU0
NTg4MyAiVWVmaUNwdVBrZy9DcHVQYWdlVGFibGVMaWI6IFJlZHVjZSB0aGUgbnVtYmVyIG9mIHJh
bmRvbSB0ZXN0cyIpCj4gPj4+ICAgLSBMaW51eCA6IHY2LjQtcmMxIGFuZCBsYXRlciB2ZXJzaW9u
Cj4gPj4+IAo+ID4+PiAyLiBzdGFydCB0aGUgUWVtdSB2aXJ0IGJvYXJkCj4gPj4+IAo+ID4+PiBg
YGBzaAo+ID4+PiAkIGNhdCB+LzhfcmlzY3Yvc3RhcnRfbGF0ZXN0LnNoCj4gPj4+ICMhL2Jpbi9i
YXNoCj4gPj4+IC9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkvcWVtdS9vb28vdXNyL2xvY2FsL2Jp
bi9xZW11LXN5c3RlbS1yaXNjdjY0IFwKPiA+Pj4gICAgICAgIC1zIC1ub2dyYXBoaWMgLWRyaXZl
IGZpbGU9L2hvbWUvc29uZy84X3Jpc2N2LzNfYWNwaS9CdWlsZF92aXJ0L1Jpc2NWVmlydFFlbXUv
UkVMRUFTRV9HQ0M1L0ZWL1JJU0NWX1ZJUlQuZmQsaWY9cGZsYXNoLGZvcm1hdD1yYXcsdW5pdD0x
IFwKPiA+Pj4gICAgICAgIC1tYWNoaW5lIHZpcnQsYWNwaT1vZmYgLXNtcCAyIC1tIDJHIFwKPiA+
Pj4gICAgICAgIC1rZXJuZWwgL2hvbWUvc29uZy85X2xpbnV4L2xpbnV4LzAwX3J2X2RlZi9hcmNo
L3Jpc2N2L2Jvb3QvSW1hZ2UgXAo+ID4+PiAgICAgICAgLWluaXRyZCAvaG9tZS9zb25nLzhfcmlz
Y3YvM19hY3BpL2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyIFwKPiA+Pj4gICAg
ICAgIC1hcHBlbmQgInJvb3Q9L2Rldi9yYW0gcm8gY29uc29sZT10dHlTMCBlYXJseWNvbj11YXJ0
ODI1MCxtbWlvLDB4MTAwMDAwMDAgZWZpPWRlYnVnIGxvZ2xldmVsPTggbWVtYmxvY2s9ZGVidWci
ICMjIGFsc28gcGFuaWMgYnkgbWVtdGVzdAo+ID4+PiBgYGAKPiA+Pj4gMy4gVGhlbiB5b3Ugd2ls
bCBlbmNvdW50ZXIgdGhlIGtlcm5lbCBwYW5pYyBsb2dnZWQgaW4gdGhlIGFib3ZlIGxpbmsKPiA+
Pj4gCj4gPj4+IE90aGVyIEluZm9ybWF0aW9uOgo+ID4+PiAKPiA+Pj4gMS4gLS0tLS0tLQo+ID4+
PiAKPiA+Pj4gVGhpcyByZXBvcnQgaXMgbm90IGlkZW50aWNhbCB0byBteSBwcmlvciByZXBvcnQg
LS0gImtlcm5lbCBwYW5pY2VkIHdoZW4gc3lzdGVtIGhpYmVybmF0ZXMiIFsxXSwgYnV0IGJvdGgg
b2YgdGhlbQo+ID4+PiBhcmUgY2xvc2VseSByZWxhdGVkIHdpdGggdGhlIGNvbW1pdCAoMzMzNTA2
OGY4NzIxICJyaXNjdjogVXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBp
bmciKS4KPiA+Pj4gCj4gPj4+IFdpdGggdGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRyYXBw
ZWQgd2l0aCAiYWNjZXNzIGZhdWx0IiB3aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90ZWN0ZWQg
cmVnaW9ucyAobW1vZGVfcmVzdjBAODAwMDAwMDApCj4gPj4+IGZyb20gT3BlblNiaSAoQlRXLCBo
aWJlcm5hdGlvbiBpcyBtYXJrZWQgYXMgbm9ucG9ydGFibGUgYnkgQ29ub3JbMl0pLgo+ID4+PiAK
PiA+Pj4gSW4gdGhpcyByZXBvcnQsIGVmaV9pbml0IGhhbmRvZmZzIHRoZSBtZW1vcnkgbWFwcGlu
ZyBmcm9tIEJvb3QgU2VydmljZXMgdG8gbWVtYmxvY2sgd2hlcmUgcmVzZXJ2ZXMgbW1vZGVfcmVz
djBAODAwMDAwMDAsCj4gPj4+IHNvIHRoZXJlIGlzIG5vICJhY2Nlc3MgZmF1bHQiIGJ1dCAicGFn
ZSBmYXVsdCIuCj4gPj4+IAo+ID4+PiBBbmQgcmV2ZXJ0aW5nIGNvbW1pdCAzMzM1MDY4Zjg3MjEg
aW5kZWVkIGZpeGVkIHRoaXMgcGFuaWMuCj4gPj4+IAo+ID4+PiAyLiAtLS0tLS0tCj4gPj4+IAo+
ID4+PiBBcyB0aGUgZ2RiLXB0LWR1bXAgWzNdIHRvb2wgc2hvd3MsIHRoZSBQVEUgd2hpY2ggY292
ZXJlZCB0aGUgZmF1bHQgdmlydHVhbCBhZGRyZXNzIGhhZCB0aGUgYXBwcm9wcmlhdGUgcGVybWlz
c2lvbiB0byBzdG9yZS4KPiA+Pj4gSXMgdGhlcmUgYW5vdGhlciB3YXkgdG8gdHJpZ2dlciB0aGUg
IlN0b3JlL0FNTyBwYWdlIGZhdWx0Ij8gT3IgdGhlIGNyZWF0aW9uIG9mIGxpbmVhciBtYXBwaW5n
IGluIGNvbW1pdCAzMzM1MDY4Zjg3MjEgZGlkIHNvbWV0aGluZyB3cm9uZz8KPiA+Pj4gCj4gPj4+
IGBgYAo+ID4+PiAoZ2RiKSBwL3ggJHNhdHAKPiA+Pj4gJDEgPSAweGEwMDAwMDAwMDAwODE3MDgK
PiA+Pj4gKGdkYikgcHQgLXNhdHAgMHhhMDAwMDAwMDAwMDgxNzA4Cj4gPj4+ICAgICAgICAgICAg
IEFkZHJlc3MgOiAgICAgTGVuZ3RoICAgUGVybWlzc2lvbnMKPiA+Pj4gIDB4ZmYxYmZmZmZmZWEz
OTAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+Pj4gIDB4ZmYxYmZmZmZmZWJm
OTAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+Pj4gIDB4ZmYxYmZmZmZmZWMw
MDAwMCA6ICAgMHg0MDAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+Pj4gIDB4ZmY2MDAwMDAwMDAw
MDAwMCA6ICAgMHgxYzAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+Pj4gIDB4ZmY2MDAwMDAwMDIw
MDAwMCA6ICAgMHhhMDAwMDAgfCBXOjAgWDowIFI6MSBTOjEKPiA+Pj4gIDB4ZmY2MDAwMDAwMGMw
MDAwMCA6IDB4N2YwMDAwMDAgfCBXOjEgWDowIFI6MSBTOjEgIC8vIGJhZGFkZHI6IGZmNjAwMDAw
N2ZkYjEwMDAKPiA+Pj4gIDB4ZmY2MDAwMDA3ZmRjMDAwMCA6ICAgIDB4M2QwMDAgfCBXOjEgWDow
IFI6MSBTOjEKPiA+Pj4gIDB4ZmY2MDAwMDA3ZmZiZjAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDow
IFI6MSBTOjEKPiA+Pj4gIDB4ZmZmZmZmZmY4MDAwMDAwMCA6ICAgMHhjMDAwMDAgfCBXOjAgWDox
IFI6MSBTOjEKPiA+Pj4gIDB4ZmZmZmZmZmY4MGMwMDAwMCA6ICAgMHhhMDAwMDAgfCBXOjEgWDow
IFI6MSBTOjEKPiA+Pj4gCj4gPj4+IGBgYAo+ID4+PiAKPiA+Pj4gMy4gLS0tLS0tCj4gPj4+IAo+
ID4+PiBZb3UgY2FuIGFsc28gcmVwcm9kdWNlIHNpbWlsYXIgcGFuaWMgYnkgYXBwZW5kaW5nICJt
ZW10ZXN0IiBpbiBrZXJuZWwgY21kbGluZS4KPiA+Pj4gSSBoYXZlIHBvc3RlZCB0aGUgbWVtdGVz
dCBib290IGxvZyBhdCB0aGlzIGxpbms6IGh0dHBzOi8vdGVybWJpbi5jb20vMXR3bC4KPiA+Pj4g
Cj4gPj4+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZy4KPiA+Pj4gCj4gPj4+IFsxXTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWdRdmtoVGVpb01tcVJE
VkdqZHRORl92aEIrdm1fMWRISnhQTmk3NVlEUV9RQG1haWwuZ21haWwuY29tLwo+ID4+PiBbMl06
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNTI2LWFzdHJpZGUtZGV0
b25hdG9yLTlhZTEyMDA1MTE1OUB3ZW5keS8KPiA+Pj4gWzNdOiBodHRwczovL2dpdGh1Yi5jb20v
bWFydGlucmFkZXYvZ2RiLXB0LWR1bXAKPiA+PiAKPiA+PiBUaGFua3MgZm9yIHRoZSB0aG9yb3Vn
aCByZXBvcnQsIHJlYWxseSBhcHByZWNpYXRlZC4KPiA+PiAKPiA+PiBTbyB0aGVyZSBhcmUgbXVs
dGlwbGUgaXNzdWVzIGhlcmU6Cj4gPj4gCj4gPj4gLSB0aGUgZmlyc3Qgb25lIGlzIHRoYXQgdGhl
IG1lbW9yeSByZWdpb24gZm9yIG9wZW5zYmkgaXMgbWFya2VkIGFzIG5vdAo+ID4+IGNhY2hlYWJs
ZSBpbiB0aGUgZWZpIG1lbW9yeSBtYXAsIGFuZCB0aGVuIHRoaXMgcmVnaW9uIGlzIG5vdCBtYXBw
ZWQgaW4KPiA+PiB0aGUgbGluZWFyIG1hcHBpbmc6Cj4gPj4gWyAgICAwLjAwMDAwMF0gZWZpOiAg
IDB4MDAwMDgwMDAwMDAwLTB4MDAwMDgwMDNmZmZmIFtSZXNlcnZlZCAgICB8ICAgfAo+ID4+IHwg
IHwgIHwgIHwgIHwgIHwgIHwgIHwgICB8ICB8ICB8ICB8VUNdCj4gPj4gCj4gPj4gLSB0aGUgc2Vj
b25kIG9uZSAodGhhdCBJIGZlZWwgYSBiaXQgYXNoYW1lZCBvZi4uLikgaXMgdGhhdCBJIGRpZCBu
b3QKPiA+PiBjaGVjayB0aGUgYWxpZ25tZW50IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgd2hlbiBj
aG9vc2luZyB0aGUgbWFwIHNpemUKPiA+PiBpbiBiZXN0X21hcF9zaXplKCkgYW5kIHRoZW4gd2Ug
ZW5kIHVwIHRyeWluZyB0byBtYXAgYSBwaHlzaWNhbCByZWdpb24KPiA+PiBhbGlnbmVkIG9uIDJN
QiB0aGF0IGlzIGFjdHVhbGx5IG5vdCBhbGlnbmVkIG9uIDJNQiB2aXJ0dWFsbHkgYmVjYXVzZQo+
ID4+IHRoZSBvcGVuc2JpIHJlZ2lvbiBpcyBub3QgbWFwcGVkIGF0IGFsbC4KPiA+PiAKPiA+PiAt
IHRoZSBwb3NzaWJsZSB0aGlyZCBvbmUgaXMgdGhhdCB3ZSBzaG91bGQgbm90IG1hcCB0aGUgbGlu
ZWFyIG1hcHBpbmcKPiA+PiB1c2luZyA0SyBwYWdlcywgdGhpcyB3b3VsZCBiZSBzbG93IGluIG15
IG9waW5pb24sIGFuZCBJIHRoaW5rIHdlCj4gPj4gc2hvdWxkIHdhc3RlIGEgYml0IG9mIG1lbW9y
eSB0byBhbGlnbiB2YSBhbmQgcGEgb24gYSAyTUIgYm91bmRhcnkuCj4gPj4gCj4gPj4gU28gSSds
bCBmaXggdGhlIHNlY29uZCBpc3N1ZSwgYW5kIHBvc3NpYmx5IHRoZSB0aGlyZCBvbmUsIGFuZCBp
ZiBubwo+ID4+IG9uZSBsb29rcyBpbnRvIHdoeSB0aGUgb3BlbnNiaSByZWdpb24gaXMgbWFwcGVk
IGluIFVDLCBJJ2xsIHRha2UgYQo+ID4+IGxvb2sgYXQgZWRrMi4KPiA+PiAKPiA+IEhpIEFsZXgs
Cj4gPiAKPiA+IEVESzIgbWFya3Mgb3BlbnNiaSByYW5nZSBhcyByZXNlcnZlZCBtZW1vcnkgaW4g
RUZJIG1hcC4gQWNjb3JkaW5nIHRvIERUCj4gPiBzcGVjLCBpZiB0aGUgbm8tbWFwIGlzIG5vdCBz
ZXQsIHdlIG5lZWQgdG8gbWFyayBpdCBhcwo+ID4gRWZpQm9vdFNlcnZpY2VzRGF0YSBidXQgRWZp
Qm9vdFNlcnZpY2VzRGF0YSBpcyBhY3R1YWxseSBjb25zaWRlcmVkIGFzCj4gPiBmcmVlIG1lbW9y
eSBpbiBrZXJuZWwsIGFzIHBlciBVRUZJIHNwZWMuIFRvIGF2b2lkIGtlcm5lbCB1c2luZyB0aGlz
Cj4gPiBtZW1vcnksIHdlIGRldmlhdGVkIGZyb20gdGhlIERUIHNwZWMgZm9yIG9wZW5zYmkgcmFu
Z2VzLgo+IAo+IFZpb2xhdGluZyBzcGVjcyBpcyBuZXZlciB0aGUgYW5zd2VyLiBEbyBvbmUgb2Y6
Cj4gCj4gMS4gVXNlIG5vLW1hcCBhbmQgdGFrZSB0aGUgcGVyZm9ybWFuY2UgaGl0Cj4gMi4gRXhj
bHVkZSB0aGUgbWVtb3J5IHJhbmdlIGZyb20gL21lbW9yeSBpdHNlbGYKPiAzLiBDb21lIHVwIHdp
dGggYSBuZXcgbm8tYWNjZXNzIHByb3BlcnR5IHRoYXTigJlzIGEgd2Vha2VyIG5vLW1hcAo+ICAg
IChpLmUuIHRoYXQgYWxsb3dzIG1hcHBpbmcgYW5kIHNwZWN1bGF0aXZlIGFjY2VzcykgYW5kIHVz
ZXMKPiAgICBFZmlSdW50aW1lU2VydmljZXNEYXRhIGluIEVGSSBsYW5kCj4gCj4gMiBmZWVscyBt
b3N0IG5vcm1hbCB0byBtZSwgcGVyc29uYWxseSwgYnV0IGFsbCBhcmUgZmluZS4KPiAKSGkgSmVz
cywKCklNTywgYWxsIHRoZSBwaHlzaWNhbCBtZW1vcnkgaW5zdGFsbGVkIGJ5IHRoZSB1c2VyIHNo
b3VsZCBiZSB2aXNpYmxlLgpTb21lIHBhcnQgb2YgdGhlIG1lbW9yeSBtYXkgYmUgcmVzZXJ2ZWQg
YW5kIG5vdCBhdmFpbGFibGUgZm9yIHRoZSB1c2VyCmJ1dCBleGNsdWRpbmcgZnJvbSAvbWVtb3J5
IGNhbiBjYXVzZSBpc3N1ZXMuCgpXaGV0aGVyIHdlIG1hcmsgYXMgRWZpUmVzZXJ2ZWRNZW1vcnkg
b3IgRWZpUnVudGltZVNlcnZpY2VEYXRhLCBJIHRoaW5rCml0IHdpbGwgYmUgbWFya2VkIGFzIG5v
LW1hcCBpbiBtZW1ibG9jayBhbmQgY2FuIG5vdCBiZSB1c2VkIGJ5IHRoZSBPUwpsaW5lYXIgbWFw
cGluZy4gQWxleCBjYW4gY29uZmlybSB0aGlzLgoKU28sIG15IHByZWZlcmVuY2UgaXMgb3B0aW9u
IDEuCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
