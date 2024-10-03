Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D22CF34A0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vpotz9itKuxVhO90evqvcs0Np1kYZR6INRf7LETkdHc=; b=JAn+lp6kJVdoNR
	ozTwnkcWNNKpPLBTX6Ua8mUpjVEMZ/BdG/rmym2JhvIry5SUF3IeHCRdHmtdytrR4TJGEL+KfNuF4
	73DWNB9BRk96quRtKtRsxFxr5PqPmxt99aKys59w85q9/48k7v1dfcnohgbFhbbkkD51ZjtW7ekm4
	KagFJtxtTTgv/pXTX5HKowATlm9TbQ7uv5x0XGETaJgNMckscoauiTU1mnaWeAlb8RLjb6AWzBOa4
	Bj5k4+rRvZ3yt+hfbmLzlZZWw9sXdlmQkoKwAUuPqLmUezbKWk1AgGmpvbRMsJ8TOoiDGk9Yeyom1
	/RSBh7gYp72+6h/wox2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swK8g-00000008v95-16PM;
	Thu, 03 Oct 2024 11:36:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swK8d-00000008v8T-1Olq
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 11:36:57 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e075ceebdaso643228a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727955414; x=1728560214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JQor36jTy9xL586/Rs54JpiyHVbpn/Wm9HFv91ZHsxY=;
        b=GCtcXqisaS1q/nkFyUaJTfOimO6/0RIKlr8XcSI0Th7NEzpYjE4cn9IEywTsunXsFP
         JI6i+VwaE3VvHABQas6ZHPWC0IXtkwcGEIFus2/MbxCTc2pHYZ/gx8LidlnKfKwSJv1m
         xoJkQaLGNJ8cHGgDZfRi6UIqUpLT9wNXjfb7eyVucogrh0iaVA9B5d/0uSrOxTsho5GS
         nSS7BNcmebxWHfXOc21SJr4Lkz4RRQ4Us9mFk+87V0Rl8PgC5l4bpO6fMWyP6r5SKn6s
         IeL3/2TJ3s1jNok8566/O/fhWePcNrc5kHQsXMtCcExINslIZcxwxI84qPdlxQSFZOXf
         41JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727955414; x=1728560214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQor36jTy9xL586/Rs54JpiyHVbpn/Wm9HFv91ZHsxY=;
        b=j5SUPpdksQ7TycUS14Nk+z6V74Y4UPfcYMWLnWAh5+fsSom2aXDc7DmQcgtCCNW7Ik
         MWyrbie06XksZrwKCdj5FuVpsYveMc825XbpIgri9hOatYik41CUbPMs8xzFpSTYZGUO
         0UrlEJ1v6nzQTP6DMvzEH2ae+72BgUbcBR3yCmK30ZY3J/uzzEG+QcFfMdAHHM91XbE7
         SpwgXrnnhm79AAiP15dqa6nJqxq1iecKyPcEMvAXxbVpg6ndaI8Bx3mCmUi25MTUgX+h
         HiDxNHqOV4RjomvVG50sgDxSKXX4wAkKPOK/TaqKs8Eb0qJp1S22Y7iRMYzFbZiafEQd
         HnAA==
X-Gm-Message-State: AOJu0Yw8rGlESMfXgU44p35f7bHBl/4HizEsrt8c5/qizKW56atY4/NA
	X1Hfy0ZxlMESkFZFTEMz2OmKtxGBiAqc5FtnGNy/glLaemCKPr3RktwbyvqwS0qMRpzvEYiVqpv
	B
X-Google-Smtp-Source: AGHT+IEQ68PlX9h44E20F8mxHs7TxeSSTPFiB6+vSfinW6ZvpbDDUvkv5/aJJDNY6+Od8jkr6Cptog==
X-Received: by 2002:a17:90a:a10d:b0:2d8:e524:797b with SMTP id 98e67ed59e1d1-2e1846be8fbmr6630662a91.18.1727955414243;
        Thu, 03 Oct 2024 04:36:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18fa05087sm3476494a91.39.2024.10.03.04.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 04:36:53 -0700 (PDT)
Message-ID: <9858968e-178b-4357-9eff-3374df84ec90@rivosinc.com>
Date: Thu, 3 Oct 2024 13:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/5] dt-bindings: riscv: document vector crypto
 requirements
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-sincerity-urgent-acdb0e8d8a66@spud>
 <0fa7461f-5c7c-4f18-ac02-66d37e2c559c@rivosinc.com>
 <20241003-variable-quirk-9a13fe040e4a@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241003-variable-quirk-9a13fe040e4a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_043655_631546_E0C08EC8 
X-CRM114-Status: GOOD (  13.93  )
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

CgpPbiAwMy8xMC8yMDI0IDEzOjA1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MDMsIDIwMjQgYXQgMDk6NTk6MzhBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwMi8xMC8yMDI0IDE4OjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IFNlY3Rpb24g
MzUuMi4gRXh0ZW5zaW9ucyBPdmVydmlldyBvZiBbMV0gc2F5czoKPj4+IHwgVGhlIFp2a25oYiBh
bmQgWnZiYyBWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgLS1hbmQgYWNjb3JkaW5nbHkgdGhlIGNv
bXBvc2l0ZSBleHRlbnNpb25zIFp2a24gYW5kCj4+PiB8IFp2a3MtLSAoc2ljKSByZXF1aXJlIGEg
WnZlNjR4IGJhc2UsIG9yIGFwcGxpY2F0aW9uICgiViIpIGJhc2UgVmVjdG9yIEV4dGVuc2lvbi4K
Pj4+IHwgQWxsIG9mIHRoZSBvdGhlciBWZWN0b3IgQ3J5cHRvIEV4dGVuc2lvbnMgY2FuIGJlIGJ1
aWx0IG9uIGFueSBlbWJlZGRlZCAoWnZlKikgb3IgYXBwbGljYXRpb24gKCJWIikgYmFzZQo+Pj4g
fCBWZWN0b3IgRXh0ZW5zaW9uCj4+Pgo+Pj4gQXBwbHkgdGhlc2UgcnVsZXMgaW4gdGhlIGJpbmRp
bmcsIHNvIHRoYXQgaW52YWxpZCBjb21iaW5hdGlvbnMgY2FuIGJlCj4+PiBhdm9pZGVkLgo+Pj4K
Pj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL3JlbGVh
c2VzL3RhZy9yaXNjdi1pc2EtcmVsZWFzZS02OThlNjRhLTIwMjQtMDktMDkgWzFdCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4g
LS0tCj4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwg
MzIgKysrKysrKysrKysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+PiBpbmRleCBhYmYyNTc5MTcxYzViLi4wMmI4MjJi
YmYzNDFkIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+Pj4gQEAgLTY1MSw2ICs2NTEsMzggQEAg
cHJvcGVydGllczoKPj4+ICAgICAgICAgICAgICAtIGNvbnRhaW5zOgo+Pj4gICAgICAgICAgICAg
ICAgICBjb25zdDogenZlNjRmCj4+PiAgCj4+PiArICAgICAgLSBpZjoKPj4+ICsgICAgICAgICAg
Y29udGFpbnM6Cj4+PiArICAgICAgICAgICAgYW55T2Y6Cj4+PiArICAgICAgICAgICAgICAtIGNv
bnN0OiB6dmJjCj4+PiArICAgICAgICAgICAgICAtIGNvbnN0OiB6dmtuCj4+PiArICAgICAgICAg
ICAgICAtIGNvbnN0OiB6dmtuaGIKPj4+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IHp2a3MKPj4K
Pj4gU2hvdWxkbid0IHp2a3NlZCBhbmQgenZrc2ggYmUgcGFydCBvZGYgdGhpcyBsaXN0ID8gTXkg
dW5kZXJzdGFuZGluZyBvZgo+PiB0aGUgc3BlYyBtaWdodCBiZSB3cm9uZyBidXQgIlp2a3MtLSIg
c2VlbXMgbGlrZSBhIHBvb3ItbWFuJ3Mgd2lsZGNhcmQKPj4gZm9yIFp2a3MqIGV4dGVuc2lvbnMg
Pwo+IAo+IEkgZG9uJ3QgdGhpbmsgc28sIHRoZXJlJ3MgYSBjb3JyZXNwb25kaW5nIC0tIG9uIHRo
ZSBmaXJzdCBsaW5lIG9mIHRoZQo+IHF1b3RlLiBJIHRoaW5rIGl0IGlzIHNvbWUgcmVhbGx5IG9k
ZCBzdHlsaW5nIHRoYXQgc2hvdWxkIGJlIHJlcGxhY2VkIGJ5Cj4gY29tbWFzLgo+IAoKT2ggeWVz
LCBteSBiYWQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
