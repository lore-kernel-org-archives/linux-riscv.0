Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6ACC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfbLKSw//MyqPDlbOYS0ISpc2/Ic1jvq6Yuko3rZFns=; b=gQOylqbt+VElpH
	vCRNU/jHiCmyiIdryCqJh4RZmzPfekvVHS5znQ90alAcviPbzZEdt3Hgdt7GRyl2fBW2HQG9tF0Hy
	E+rPRuk35BkHtEYWPGtIy1M2/slEDR62ci/oCiNEN8JYQVtDbhOrO3cBTJE5revuIEibCMNr2hSdh
	bTGQMKGG1GTFDnfVgP4DZazZHfguXqSrmZ2STVVIazcKuUjZDhboAcRm9Ii+BIWEcOoxpRD+7PAYR
	sZxc0tZsnU2q7M9TzmIFDQb/KtBtE9NyHlnZxeq+sjFlaXnmkJClMdXVUzedUAnsL5aH4xiz8/l2T
	if7QXGOrCDQj6Zg6mEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9DU-0000000DGNl-2YX9;
	Wed, 30 Apr 2025 15:19:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9DR-0000000DGN4-21QD
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:19:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c30d9085aso5506694f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026356; x=1746631156; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=OP7mX5MSboqV0P6SmqzZ69/ZAzPM7aF7Hr8EG47Cnza9n+gdSwYXE9p1q8I7Rl59G7
         HBMEB5ZI/oR7QW/sUv6V/BXKzQVJJlkqzzUqiChO7cYGsX5Y+VLPFwec1iLuIeCOeOAv
         vAn12A8WMJgXIGnF25Tq0xvGPkgsCYNQ5mbyJ2CQc8EXSMASzmPlqGcPOVZXNZDqfaPQ
         QZ2cNF0t2YYkPsfMh0XF4eRmQXoZZCsFfNFS1Z0RHZ9VfwPLamnDVXb+c2G044BbUdiz
         s96mYjrxi52NahRKMzSQgsRrCz8g895uBEn5CGwCsB8II/nmb3PzHXljArEdZSKsWPTI
         f3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026356; x=1746631156;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5c1usZQ21dQ4MFmT+Y0rgDHI5e8haxjXHW3GmOhQVg=;
        b=tiP1ZgpwBAMegJHdPTddQEqos6nG5AOXYgo0/FzxUiT+6q8Zgll3OXcEn5/AF9qhnn
         RRYbuhWtRTBjkl5zX9oLuI1Xq3kvUaxm4ponjW+iB+jnrfLaARnQZhJfbSw+Sud3jdn+
         jLp5/vFxX7GYgL2MyW4rj2AfhS2U16Lr3u/m0iKmcnOw8hXPhwXuWMLOa2HysXZeWlED
         ZGmkDWpny+yK17TMs6hUOLzqEWuy7nzAEJc3YO5g8l7HfXk5tD5FRsXbiqBm9zlIuK/k
         1djIdB7gbBaDInTHsD6psRpaeC/UqGq2uasF7qFPNzk597OJ61irSblxdJm7+NGLDA98
         5xWw==
X-Forwarded-Encrypted: i=1; AJvYcCWkOhVgW1SlHNykHZZF18FVu4hxxVITQpNj7Tc28JJdeHKp4a0JlPUKcumocXuoBf2MTleybJixZGAlCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV6qMjVOr7Vup2L0cfbswDFsEvXxHAAKQ+ZJ1Z+aMQaHc17C+x
	G1CNwdDjOm6rMgx2mdo+pqdZsh6OKlq8GpXz5yIoFYGPkcLLmneb
X-Gm-Gg: ASbGncvO4ZFSpudjC0waDf1ILSO+60uw4lpEl8hta3Sy44l+1ilmEQuTcS5MU6xp1Vo
	V4HdYyGbFXmKMJa+mwiqMFx14tErV2MTcLYGCnZajL/AkeghNHTq3wcpka5UsYutRgUTSMYswac
	h6Xk+NXIKmrwIc4l0oBkkPerCQciaQC1I5Gh843eE/8kOS71a/5hVLLvtFI5y5qUIO28w6u9J21
	HtSZazoS2HkbVOK8+Tx/vMvb3FqQSjWY6WX+y9rPbfm2wgXV2Zt0ujFxOuwYF1CH+N3MUoB0iOP
	yoVlUc7mfi4tDCGhRRHCFvOjxZvzklpMBMYwGevxnfPv68/DyNoeRGkV278XMb1RdVKtkWU=
X-Google-Smtp-Source: AGHT+IFmefUVJ6/gagwWms/2NhJFqSEeEmwPNox/ehYzux4BtgClLHXr43p5sjL1gtcn7wjV25ZOiw==
X-Received: by 2002:a5d:588f:0:b0:3a0:8070:8af8 with SMTP id ffacd0b85a97d-3a08ff3755dmr2980301f8f.18.1746026355424;
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca42cdsm17020431f8f.22.2025.04.30.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:19:15 -0700 (PDT)
Message-ID: <94f4bbd9dbf4da9c056f90dff3028e45a659c8ac.camel@gmail.com>
Subject: Re: [PATCH 1/4] riscv: dts: sophgo: Move all soc specific device
 into soc dtsi file
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Chen Wang	 <unicorn_wang@outlook.com>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>,  Longbin Li <looong.bin@gmail.com>
Date: Wed, 30 Apr 2025 17:19:16 +0200
In-Reply-To: <20250430012654.235830-2-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-2-inochiama@gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_081917_517715_C04EA09C 
X-CRM114-Status: GOOD (  14.60  )
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

SGkgSW5vY2hpIQoKT24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjI2ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IEFsdGhvdWdoIHRoZSBjdjE4MDBiL2N2MTgxMmgvc2cyMDAwL3NnMjAwMiBz
aGFyZSBtb3N0IHBlcmlwaGVyYWxzLAo+IHNvbWUgYmFzaWMgcGVyaXBoZXJhbHMsIGxpa2UgY2xv
Y2ssIHBpbmN0cmwsIGNsaW50IGFuZCBwbGludCwgYXJlCj4gbm90IHNoYXJlZC4gVGhlc2UgYXJl
IGNhdXNlZCBieSBub3Qgb25seSBoaXN0b3JpY2FsIHJlYXNvbiAocGxpYywKPiBjbGludCksIGJ1
dCBhbHNvIHRoZSBmYWN0IHRoZSBkZXZpY2UgaXMgbm90IHRoZSBzYW1lIChjbG9jaywgcGluY3Ry
bCkuCj4gCj4gSXQgaXMgZ29vZCB0byBvdmVycmlkZSBkZXZpY2UgY29tcGF0aWJsZSB3aGVuIHRo
ZSBzb2MgbnVtYmVyIGlzIHNtYWxsLAo+IGJ1dCBub3cgaXQgaXMgYSBidXJkZW4gZm9yIG1haW50
ZW5hbmNlLCBhbmQgaXQgaXMga2luZCBvZiBhbm5veWVkIHRvCj4gZXhwbGFpbiB3aHkgdXNpbmcg
b3ZlcnJpZGUuIFNvIGl0IGlzIHRpbWUgdG8gbW92ZSB0aGlzIG91dCBvZiB0aGUKPiBjb21tb24g
cGVyaXBoZXJhbCBoZWFkZXIuCj4gCj4gTW92ZSBhbGwgc29jIHJlbGF0ZWQgcGVyaXBoZXJsYSBk
ZXZpY2UgZnJvbSBjb21tb24gcGVyaXBoZXJhbCBoZWFkZXIKPiB0byB0aGUgc29jIHNwZWNpZmlj
IGhlYWRlciB0byBnZXQgcmlkIG9mIG1vc3QgY29tcGF0aWJsZSBvdmVycmlkZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4g
LS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgfCAzOCArKysr
KysrKysrKysrKysrKy0tLS0tLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4
MTJoLmR0c2kgfCAzOCArKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gwqBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9jdjE4eHguZHRzacKgIHwgMjIgLS0tLS0tLS0tLS0tLS0KPiDCoGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi5kdHNpwqAgfCAzOCArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDU4IGRlbGV0
aW9ucygtKQoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
