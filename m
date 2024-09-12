Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EADAEEE25C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIlKFbBzOpGJre0Mh12aFePPbq6MBrZtNPIS0/CFE7M=; b=ibeRUvL1xa1m5S
	QpyyaLW44tDpf6yOYvPqZipv7dma3keXD+15cOaXuDrkVCXaArNejDsNOCWTUFsEH/IVZx795TQHY
	4JkSWOXbN+qhrD87fcNQJRRRoMowiPIgyyOl03+H1DAzA9ejzYHNOcJnfnrCBqm0pdNy+J3OugnWp
	mMUJ29o51+4ycJ4gBNmuyMQaRXGuYgMGsIzEOb6Kb7nCCjteDAyopyFIdcdblNVUv5Py/E0pB5SHY
	gERfYehurHgSqYOveKuRTg4Q8y3+ByYFO9HbdoRCV6TvyN/y9UVR1TCNUI6cTB3YYZp+h5xhevNWZ
	YjHM3pOJimr2R0g/N8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorI7-0000000EH3f-4AJF;
	Thu, 12 Sep 2024 21:23:52 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorI5-0000000EH2u-0Iip
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 21:23:50 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-37636c3872bso1261805ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726176227; x=1726781027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cRBGtOuc/d2snZdpwSiAnIV7rHRa11MPF2f8u+9dU+0=;
        b=G3dLRyMzap4Yfd8/isJw3t4LMe6Ubp+d+00L7+qZEQWhgNt64S2PPPn8Kb2JjmTBgb
         MMhDYeebrPv9DG1J/apUPjXWcPoLj+53u+Ra4Mt91ie3H9pjUjvbDasCCtbIBKkNnGdU
         VNBwd6zSLezybOS1sh4/htBohJjRcufQlEOkdcLr1kGINCl/gfr4RFQ0WsZB315/Wq1D
         DsNohZGlRcexcTQY9LSTANSB0ILBHSO4WJCA1T4M3FTOMwqsticndzgNly0mpK99KtSa
         0y53Q6E83DfG/mgL5Cfn/EAwP5Xszwr7khrQnIeeo33gvpzDP6t1wwo//GAHPEjOLHJf
         wQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726176227; x=1726781027;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRBGtOuc/d2snZdpwSiAnIV7rHRa11MPF2f8u+9dU+0=;
        b=jvjX0AlSISa/G3492NVwhEq4fMuYp32qRvGPjSq8c7ad7pwtujNc1jjyfydI048sGn
         mxlVqZEztIyc6FhJHaupbQFamd6YD2mbkWj46y4H4SvAKb8MgEERht/kt0UGYD8BBMD5
         zdnw1k1hEgTHVo0dpykavDLneZ1yprA04gHAUw1HmCVvqesYXhB8tuTLrYolr3De+3nS
         08z5SSgcJCKxRYVWRJ3QW3atr8bxR/eq1vQVAuTiQAsfTyYDBQI5wDjqJypqt6qbuIr4
         LeuvIgCF2fTZhl/eO021UHvDcFmeFjyKjBxjHQN3jLmzxETzVzHxZ8fnpyrJXDPfGxy6
         Rxbg==
X-Gm-Message-State: AOJu0Yy7DDGL+DvhOGBSZgLPt9TDEPgBciDzIK5GCrSnzlhPyvneDm7r
	SpgnIXSqaP7NpXsDOjGJFMTUKCF3LPPuIzWwht5O6nMoiEIXkCFk9L6vzRShlE8=
X-Google-Smtp-Source: AGHT+IFaS4zkwnkNa1ce/QUNVKsECyunuGyCa52gZYcGRtm6HZ4hFf3rIXLzwBxv9bvQwEqPk/66pQ==
X-Received: by 2002:a05:6e02:1a81:b0:39d:637f:97bc with SMTP id e9e14a558f8ab-3a08b66273amr7178575ab.0.1726176227093;
        Thu, 12 Sep 2024 14:23:47 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d35f89137bsm814719173.104.2024.09.12.14.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 14:23:46 -0700 (PDT)
Message-ID: <b4acc0a7-b7da-4947-904d-8406aa5ba95b@sifive.com>
Date: Thu, 12 Sep 2024 16:23:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, ycliang@andestech.com,
 jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org,
 conor.dooley@microchip.com
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_142349_156387_2F9EFC90 
X-CRM114-Status: GOOD (  24.54  )
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

SGkgVmFsZW50aW5hLAoKT24gMjAyNC0wOS0xMiAxMjowMCBQTSwgVmFsZW50aW5hIEZlcm5hbmRl
eiB3cm90ZToKPiBBZGQgYSBkdC1iaW5kaW5nIGZvciB0aGUgTWljcm9jaGlwIEludGVyLVByb2Nl
c3NvciBDb21tdW5pY2F0aW9uIChJUEMpCj4gbWFpbGJveCBjb250cm9sbGVyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFZhbGVudGluYSBGZXJuYW5kZXogPHZhbGVudGluYS5mZXJuYW5kZXphbGFuaXNA
bWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL21haWxib3gvbWljcm9jaGlwLHNi
aS1pcGMueWFtbCAgIHwgMTE1ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MTE1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwKPiAKPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvbWljcm9j
aGlwLHNiaS1pcGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWls
Ym94L21pY3JvY2hpcCxzYmktaXBjLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZGMyY2JkNWViMjhmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L21pY3JvY2hpcCxzYmktaXBjLnlh
bWwKPiBAQCAtMCwwICsxLDExNSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21haWxib3gvbWljcm9jaGlwLHNiaS1pcGMueWFt
bCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCj4gKwo+ICt0aXRsZTogTWljcm9jaGlwIEludGVyLXByb2Nlc3NvciBjb21tdW5pY2F0aW9u
IChJUEMpIG1haWxib3ggY29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBWYWxl
bnRpbmEgRmVybmFuZGV6IDx2YWxlbnRpbmEuZmVybmFuZGV6YWxhbmlzQG1pY3JvY2hpcC5jb20+
Cj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArICBUaGUgTWljcm9jaGlwIEludGVyLXByb2Nlc3NvciBD
b21tdW5pY2F0aW9uIChJUEMpIGZhY2lsaXRhdGVzCj4gKyAgbWVzc2FnZSBwYXNzaW5nIGJldHdl
ZW4gcHJvY2Vzc29ycyB1c2luZyBhbiBpbnRlcnJ1cHQgc2lnbmFsaW5nCj4gKyAgbWVjaGFuaXNt
Lgo+ICsgIFRoaXMgU0JJIGludGVyZmFjZSBpcyBjb21wYXRpYmxlIHdpdGggdGhlIE1pLVYgSW50
ZXItaGFydAo+ICsgIENvbW11bmljYXRpb24gKElIQykgSVAuCj4gKyAgVGhlIG1pY3JvY2hpcCxz
YmktaXBjIGNvbXBhdGlibGUgc3RyaW5nIGlzIGludGVkZWQgZm9yIHVzZSBieSBzb2Z0d2FyZQo+
ICsgIHJ1bm5pbmcgaW4gc3VwZXJ2aXNvciBwcml2aWxlZ2VkIG1vZGUgKHMtbW9kZSkuIFRoZSBT
b0Mtc3BlY2lmaWMKPiArICBjb21wYXRpYmxlcyBhcmUgaW50ZWRlZCBmb3IgdXNlIGJ5IHRoZSBT
QkkgaW1wbGVtZW50YXRpb24gaW4gbWFjaGluZQo+ICsgIG1vZGUgKG0tbW9kZSkuCgpUaGVyZSBp
cyBhIGxvdCBvZiBjb25kaXRpb25hbCBsb2dpYyBpbiB0aGlzIGJpbmRpbmcgZm9yIGhvdyBzbWFs
bCBpdCBpcy4gV291bGQKaXQgbWFrZSBzZW5zZSB0byBzcGxpdCB0aGlzIGludG8gdHdvIHNlcGFy
YXRlIGJpbmRpbmdzPyBGb3IgZXhhbXBsZSwgd2l0aCB0aGUKY3VycmVudCBiaW5kaW5nIG1pY3Jv
Y2hpcCxpaGMtY2hhbi1kaXNhYmxlZC1tYXNrIGlzIGFsbG93ZWQgZm9yIHRoZSBTQkkKaW50ZXJm
YWNlLCBidXQgZG9lc24ndCBsb29rIGxpa2UgaXQgYmVsb25ncyB0aGVyZS4KCj4gKwo+ICtwcm9w
ZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAgICAtIG1pY3JvY2hp
cCxzYmktaXBjCj4gKyAgICAgIC0gbWljcm9jaGlwLG1pdi1paGMtcnRsLXYyCj4gKwo+ICsgIHJl
ZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtaW5JdGVt
czogMQo+ICsgICAgbWF4SXRlbXM6IDUKPiArCj4gKyAgaW50ZXJydXB0LW5hbWVzOgo+ICsgICAg
bWluSXRlbXM6IDEKPiArICAgIG1heEl0ZW1zOiA1Cj4gKwo+ICsgICIjbWJveC1jZWxscyI6Cj4g
KyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgRm9yIHRoZSBTQkkgImRldmljZSIsIHRoZSBjZWxs
IHJlcHJlc2VudHMgdGhlIGdsb2JhbCAibG9naWNhbCIgY2hhbm5lbCBJRHMuCj4gKyAgICAgIFRo
ZSBtZWFuaW5nIG9mIGNoYW5uZWwgSURzIGFyZSBwbGF0Zm9ybSBmaXJtd2FyZSBkZXBlbmRlbnQu
IFRoZQo+ICsgICAgICBTb0Mtc3BlY2lmaWMgY29tcGF0aWJsZXMgYXJlIGludGVuZGVkIGZvciB1
c2UgYnkgdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiwKPiArICAgICAgcmF0aGVyIHRoYW4gcy1tb2Rl
IHNvZnR3YXJlLiBUaGVyZSB0aGUgY2VsbCB3b3VsZCByZXByZXNlbnQgdGhlIHBoeXNpY2FsCj4g
KyAgICAgIGNoYW5uZWwgYW5kIGRvIG5vdCB2YXJ5IGRlcGVuZGluZyBvbiBwbGF0Zm9ybSBmaXJt
d2FyZS4KPiArICAgIGNvbnN0OiAxCj4gKwo+ICsgIG1pY3JvY2hpcCxpaGMtY2hhbi1kaXNhYmxl
ZC1tYXNrOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIFJlcHJlc2VudHMgdGhlIGVuYWJs
ZS9kaXNhYmxlIHN0YXRlIG9mIHRoZSBiaS1kaXJlY3Rpb25hbCBJSEMgY2hhbm5lbHMKPiArICAg
ICAgd2l0aGluIHRoZSBNSVYtSUhDIElQIGNvbmZpZ3VyYXRpb24uIFRoZSBtYXNrIGlzIGEgMTYt
Yml0IHZhbHVlLCBidXQgb25seQo+ICsgICAgICB0aGUgZmlyc3QgMTUgYml0cyBhcmUgdXRpbGl6
ZWQuRWFjaCBvZiB0aGUgYml0cyBjb3JyZXNwb25kcyB0bwo+ICsgICAgICBvbmUgb2YgdGhlIDE1
IElIQyBjaGFubmVscy4KPiArICAgICAgQSBiaXQgc2V0IHRvICcxJyBpbmRpY2F0ZXMgdGhhdCB0
aGUgY29ycmVzcG9uZGluZyBjaGFubmVsIGlzIGRpc2FibGVkLAo+ICsgICAgICBhbmQgYW55IHJl
YWQgb3Igd3JpdGUgb3BlcmF0aW9ucyB0byB0aGF0IGNoYW5uZWwgd2lsbCByZXR1cm4gemVyby4K
PiArICAgICAgQSBiaXQgc2V0IHRvICcwJyBpbmRpY2F0ZXMgdGhhdCB0aGUgY29ycmVzcG9uZGlu
ZyBjaGFubmVsIGlzIGVuYWJsZWQKPiArICAgICAgYW5kIHdpbGwgYmUgYWNjZXNzaWJsZSB0aHJv
dWdoIGl0cyBkZWRpY2F0ZWQgYWRkcmVzcyByYW5nZSByZWdpc3RlcnMuCj4gKyAgICAgIFRoZSBy
ZW1haW5pbmcgYml0IG9mIHRoZSAxNi1iaXQgbWFzayBpcyByZXNlcnZlZCBhbmQgc2hvdWxkIGJl
IGlnbm9yZWQuCj4gKyAgICAgIFRoZSBhY3R1YWwgZW5hYmxlL2Rpc2FibGUgc3RhdGUgb2YgZWFj
aCBjaGFubmVsIGlzIGRldGVybWluZWQgYnkgdGhlCj4gKyAgICAgIElQIGJsb2Nr4oCZcyBjb25m
aWd1cmF0aW9uLgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDE2Cj4gKyAgICBkZWZhdWx0OiAwCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGli
bGUKPiArICAtIGludGVycnVwdHMKPiArICAtIGludGVycnVwdC1uYW1lcwo+ICsgIC0gIiNtYm94
LWNlbGxzIgo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICthbGxPZjoK
PiArICAtIGlmOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4g
KyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29uc3Q6IG1pY3JvY2hpcCxzYmkt
aXBjCj4gKyAgICB0aGVuOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIHJlZzogZmFs
c2UKPiArICAgIGVsc2U6Cj4gKyAgICAgIHJlcXVpcmVkOgo+ICsgICAgICAgIC0gcmVnCj4gKwo+
ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiAr
ICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBjb25zdDogbWljcm9jaGlwLG1pdi1p
aGMtcnRsLXYyCj4gKyAgICB0aGVuOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGlu
dGVycnVwdC1uYW1lczoKPiArICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAgICBwYXR0ZXJu
OiAiXmhhcnQtWzAtNV0rJCIKClRoZSBkcml2ZXIgaW4gcGF0Y2ggMyB1c2VzIHRoaXMgcGF0dGVy
biBmb3IgdGhlIFNCSSBpbnRlcmZhY2UsIHNvIHNob3VsZCBpdAphcHBseSB0aGVyZSBhcyB3ZWxs
PwoKUmVnYXJkcywKU2FtdWVsCgo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBtYWls
Ym94IHsKPiArICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2JpLWlwYyI7Cj4gKyAgICAg
IGludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+ICsgICAgICBpbnRlcnJ1cHRzID0gPDE4MD4s
IDwxNzk+LCA8MTc4PjsKPiArICAgICAgaW50ZXJydXB0LW5hbWVzID0gImhhcnQtMSIsICJoYXJ0
LTIiLCAiaGFydC0zIjsKPiArICAgICAgI21ib3gtY2VsbHMgPSA8MT47Cj4gKyAgICB9Owo+ICsg
IC0gfAo+ICsgICAgbWFpbGJveEA1MDAwMDAwMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAibWlj
cm9jaGlwLG1pdi1paGMtcnRsLXYyIjsKPiArICAgICAgbWljcm9jaGlwLGloYy1jaGFuLWRpc2Fi
bGVkLW1hc2s9ICAvYml0cy8gMTYgPDA+Owo+ICsgICAgICByZWcgPSA8MHg1MDAwMDAwMCAweDFD
MDAwPjsKPiArICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gKyAgICAgIGludGVy
cnVwdHMgPSA8MTgwPiwgPDE3OT4sIDwxNzg+Owo+ICsgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAi
aGFydC0xIiwgImhhcnQtMiIsICJoYXJ0LTMiOwo+ICsgICAgICAjbWJveC1jZWxscyA9IDwxPjsK
PiArICAgIH07CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
