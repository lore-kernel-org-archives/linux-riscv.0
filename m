Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA45C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2wCngbJsr2hSZc6djZjkfwt5Sn2aqrfWWlKmZT2OAs=; b=efClxCX76i9FbG
	GlxlXrdwsF5cQLBSM25+miSvDYbviNRJ8F0NRURa7RFTWrYOpwn57KQyiqzpwcnxRuRxXJPE6dq3m
	CNR8+yz+YVKlOUZJQCBrBqr5y+hOLF1UKlgtJaw53MmHe8oXHt53cqJV75AvXVUaigPu8l2ylU3DL
	5D3vJB1Nx+fmQ0oJT9gnddMbgc8U48NnzIjN8FFsWPht8+KxehTEYhotEGcoNeQ5gP/VhzS933nBG
	12v9fWo/dDe0zE+aZQPrYACF1dImjpBCkcUt22PB/PvK7o5Izrucp1tMiHVrzPNh+pQrWZojy611N
	hVpaFDvSUXSy/0nMSkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pva0w-00FZ7M-30;
	Sun, 07 May 2023 08:45:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvZ3Q-00FS7g-2y
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 07:43:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so6104308a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 May 2023 00:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683445412; x=1686037412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9wnpI4LY5XA7ZQ+x1OC+Dma/LdGYKig7MCJcU9UgWw=;
        b=ZhaZCy9KPVktg8gk9WLJpJ7otcDqj8JSnPjsZx621SYMTNO+STM7SMCG482IPpxMgB
         rIWJcxQxiG2o2RrweoZ0hdOTEwhzB0IC0v0BBryP6m1+VjRCXMAnMXyEQaZHRghEj/Ax
         zO7IQyrgB2UwvDdDQPVuZH9UHsF9eWasvcpJS1uf/WPTRlM8+RZKcePxyegpmo40DurV
         XtSog6pz8tYnfWyrBg64MUTELbjgWTyNcxilsqg40f+MxSZCe8kOzkn754NDbwyeETmE
         Exe5Mr0V8plqQ6dT4cpudrvIEwVA5/rU/o0hshSigsKoxqbuVanqYU7PlGsLSa284XM9
         RuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683445412; x=1686037412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9wnpI4LY5XA7ZQ+x1OC+Dma/LdGYKig7MCJcU9UgWw=;
        b=Dwm7Yi7MtudvNTrMiFhYr8QGdj6oB0iB3olfo3A7h0MO1qX8wUhpXLQJxeKkCh18OO
         F7MPfqsy571fXw2MKydt+gZ9W2+xYX5FDjNJlejSjG5Bik8ZCnLxizvmL5YhMk8r0tRg
         oFkxMXAYksHXtrm2S4QqVIiyMKPa7t3HESwjTA8aX/v1yqhA8eFUPXtdgh/0oatO8N31
         Wa4NhNbYgXpAZ1vf15wOR1huSCzlB3oHR5B3L0CvWHy47a3arFy3FhQDErFUtQKhKAN9
         PKMdcXj7uDkuIFyLTA/VsoBlgUWhmEcwRmkkX4Z+eHtS03aNgL6N0trC1zouXItcgDUX
         01GQ==
X-Gm-Message-State: AC+VfDx5elcnN1hyiSLPXu5c15Okp6ATsbXaVvh7huNYEcLDEVYDG2/l
	fbA1sywW2DGcypvido0iU9pcUw==
X-Google-Smtp-Source: ACHHUZ7+zmwIdFJH/nbHaLn4XM8hKakG/J5PsMXJK/E0DpgPAH+VwfRU3PK645C3P9HBQyyQ1RSHMg==
X-Received: by 2002:a17:906:9b89:b0:94a:5ecb:6ea7 with SMTP id dd9-20020a1709069b8900b0094a5ecb6ea7mr6771988ejc.43.1683445412357;
        Sun, 07 May 2023 00:43:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:183b:950f:b4d5:135a? ([2a02:810d:15c0:828:183b:950f:b4d5:135a])
        by smtp.gmail.com with ESMTPSA id n5-20020a1709065da500b00965e68b8df5sm3063825ejv.76.2023.05.07.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 00:43:31 -0700 (PDT)
Message-ID: <cab7a294-cc2e-6070-8c89-77ca93eb52ab@linaro.org>
Date: Sun, 7 May 2023 09:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/5] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329/D1/R528/T113s SPI
Content-Language: en-US
To: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-2-bigunclemax@gmail.com>
 <835082fe07b77db8598aebabe98a74c2c5ac47d1.camel@aosc.io>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <835082fe07b77db8598aebabe98a74c2c5ac47d1.camel@aosc.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_004336_966710_BDCF1676 
X-CRM114-Status: GOOD (  14.14  )
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

T24gMDcvMDUvMjAyMyAwNjowNiwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyMy0wNS0w
N+aYn+acn+aXpeeahCAwMjoyNiArMDMwMO+8jE1ha3NpbSBLaXNlbGV25YaZ6YGT77yaCj4+IExp
c3RlZCBhYm92ZSBBbGx3aW5uZXIgU29DcyBoYXMgdHdvIFNQSSBjb250cm9sbGVycy4gRmlyc3Qg
aXMgdGhlCj4+IHJlZ3VsYXIKPj4gU1BJIGNvbnRyb2xsZXIgYW5kIHRoZSBzZWNvbmQgb25lIGhh
cyBhZGRpdGlvbmFsIGZ1bmN0aW9uYWxpdHkgZm9yCj4+IE1JUEktREJJIFR5cGUgQy4KPj4KPj4g
QWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgdGhlc2UgY29udHJvbGxlcnMKPj4KPj4gU2lnbmVk
LW9mZi1ieTogTWFrc2ltIEtpc2VsZXYgPGJpZ3VuY2xlbWF4QGdtYWlsLmNvbT4KPj4gLS0tCj4+
IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FsbHdpbm5lcixzdW42aS1hMzEtc3BpLnlh
bWzCoMKgIHwgNwo+PiArKysrKysrCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nw
aS9hbGx3aW5uZXIsc3VuNmktCj4+IGEzMS1zcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvYWxsd2lubmVyLHN1bjZpLQo+PiBhMzEtc3BpLnlhbWwKPj4gaW5k
ZXggZGUzNmM2YTM0YTBmLi44MDdkZGU0NTdlM2IgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYWxsd2lubmVyLHN1bjZpLWEzMS0KPj4gc3BpLnlh
bWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbGx3aW5u
ZXIsc3VuNmktYTMxLQo+PiBzcGkueWFtbAo+PiBAQCAtMjEsNiArMjEsNyBAQCBwcm9wZXJ0aWVz
Ogo+PiDCoMKgwqDCoCBvbmVPZjoKPj4gwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGFsbHdpbm5lcixz
dW42aS1hMzEtc3BpCj4+IMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuOGktaDMt
c3BpCj4+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW41MGktcjMyOS1zcGkKPj4g
wqDCoMKgwqDCoMKgIC0gaXRlbXM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW44aS1yNDAtc3BpCj4+
IEBAIC0yOCw2ICsyOSwxMiBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gYWxsd2lubmVyLHN1bjUwaS1oNjE2LXNwaQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0gYWxsd2lubmVyLHN1bml2LWYxYzEwMHMtc3BpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gY29uc3Q6IGFsbHdpbm5lcixzdW44aS1oMy1zcGkKPj4gK8KgwqDCoMKgwqAgLSBp
dGVtczoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGVudW06Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW4yMGktZDEtc3BpCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW4yMGktZDEtc3BpLWRiaQo+IAo+IEluIHRoaXMgY2Fz
ZSBJIHdpbGwgcHJlZmVyIHRvIGxpc3QgYWxsIDQgY29tcGF0aWJsZXMgaWYgYmFja3dhcmQKPiBj
b21wYXRpYmlsaXR5IGlzIHVzZWQ6Cj4gImFsbHdpbm5lcixzdW4yMGktZDEtc3BpLWRiaSIsICJh
bGx3aW5uZXItc3VuMjBpLWQxLXNwaSIsCj4gImFsbHdpbm5lcixzdW41MGktcjMyOS1zcGktZGJp
IiwgImFsbHdpbm5lciwgc3VuNTBpLXIzMjktc3BpIiwgaW4gY2FzZQo+IGlmIHdlIHdlcmUgZ2Fp
bmluZyBzdXBwb3J0IGZvciBlaXRoZXIgcXVpcmtzIG9mIEQxIGNvbnRyb2xsZXIgb3IKPiBTUElf
REJJIGNvbnRyb2xsZXJzLgo+IAoKSSBkb24ndCB1bmRlcnN0YW5kLiBJZiBJIHNlZSBjb3JyZWN0
bHksIGFsbCBmb3VyIG9mIHRoZW0gYXJlIHNwZWNpZmllZC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
