Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1529BE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMonZnheQfp6/uXH53KODj7Kks+lr6BxwFu2Hf60/FY=; b=zini8p+Z/gwCxn
	wjnxN9IWcLky7DCRvCyOzkwLfaRVoZwClyNXM72+GKkuqp31mjrVNSNkPirdbjM+l8+QDuoWWti8G
	JZKVmFolKegkeHc0jCOYGcBz7TPN7MGzf5Ztd/TgUhcSIglOFHnAQ5H+ct4PEBmeU0e7Oxr+hf6ul
	XJ+TzO39E9aRN1A6pY4fvEqIHE9L+rWeVQKY+9ch0UuPcSQQaYyQYHu+jsEThYLekul8xP/VCMabX
	K09reivbpZ/Pmc+IRPUKAW+ZL4kk+HSFPpzAnBehM95HtaZdL7lTV2v2feR4CE9/96GDGyirE5fty
	vvbXrdmqA3+7jzifJ4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJwe-0000000Bawg-4A2U;
	Mon, 16 Dec 2024 22:52:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJwc-0000000BawH-3PIK
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 22:52:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso21805395e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 14:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1734389525; x=1734994325; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tUwsx0D7P57hByBMwwxCDPgoIVojOI2sOGJ5I23n0Q=;
        b=j5c2rkOr2PVcmx2zWGYmO1JMeyZO1/32Klqc2r+MZat0kPaYUAgxdBFnmEJbaL3CZC
         +fv7YFr3yUFjHt0fQW0XOTgrCI0i+oBcy/dvFQL499WOH47QIe5gWABtR8ltuh10NIsK
         0FHkkxGGndwr+jrIa+Fflti2CNXPb3tsrgtQ0Xau/iNMxIoW5Sv7KgDYCnKuEc8lCE7e
         lODMbwdvtzUuxUN6Upmx0/Z6OIzazm4eo5VjbNAnAZv6UqBeAly2tH56iblFYXe3F8T8
         OJvUMxxj1laO7QdKPMg9YQJlPu/0trMe0Le8+D0/3wosJYJp8Rl+4G1bCqrbOvlnu+qv
         xnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734389525; x=1734994325;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tUwsx0D7P57hByBMwwxCDPgoIVojOI2sOGJ5I23n0Q=;
        b=GwY9hvfyLbvGmXaV1r/C8La5W1oYR+rYufzKLAgQdWuqcpuFXF3LEIFj8skUwX70ZS
         p8nxeUk0aT8xOrqElLVHGLAK1F5RApwtjIPCF30OUlKwg+lxWM4AtToje8ubBTnfN8ib
         5FON8QCRgFIkgO+rqRbg37DOgUW9iWwn9frArZ57+LIgE/m0bo08j35rLwh8pxSuc4Kf
         lqjMjo9ZSJuV//d6brl48SCQUf/tN529mnW9DYsR2V3VSpZW9Kd4kAIM7pluy8Jd21bw
         CcYuTQlyh0W3Q9qoqLfl7yif7pp9kXMvGD9QKvyv6g5dpAtCVEk3hHZKnMDGxdYM8Rq9
         A0rA==
X-Forwarded-Encrypted: i=1; AJvYcCUbARC67gGeej1w6cdAiDLxEg3s4Q4kIF0D6yiVrctQYLXwd2OEo2kjZZ6yqRDTPYQhEFilvTJtNSBQSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVAI0Yv6tR5X0/xULzoDEuzDjRxp7uzGG3Bho9h5PnQA/TUUxA
	aVdeJ+7TkECOoQ5ttP5MEs90FfAmTpqkcnzbSvQHrfw4vPODz404lRQqLRBIEjY=
X-Gm-Gg: ASbGncuMn0Gxi1rjHAbSf2QPKmbB2Dy+JsIJJDCDhungOKexyWhjwL/+uedx+sAhPBH
	Jk/30KZyDFGODrS/ocbyMTd5zhPEGeFgTOOjbcpd1ynEQAlCDel+W84ua1P8dqyZ1EGTWtBnTLc
	tz3qLpapKb9SRXZiu+VbjugIyiChn7I4j68oX1h3qF9ow6wXEo2QwqWdlpTHv6ii+NEZaXs5828
	U+jP5U2NADuz5FS3b0SwsXI/dIK15HmPBXbhkmLR6tfX1ssfYEkHVeBNr0K6i/aIWLITQ==
X-Google-Smtp-Source: AGHT+IGkXkCZ1V8JrmSX24LbWgYC0WbYIpEMJ6w9YigeL1K3Q2t7aofiKXEhAFod/RI2RSkoUoNckQ==
X-Received: by 2002:a05:600c:511a:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-4362aa9dd9emr108990445e9.20.1734389524669;
        Mon, 16 Dec 2024 14:52:04 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c462sm153527565e9.14.2024.12.16.14.52.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:52:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
Date: Mon, 16 Dec 2024 22:51:53 +0000
Cc: Inochi Amaoto <inochiama@gmail.com>,
 linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Message-Id: <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
 <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_145206_870145_4245084B 
X-CRM114-Status: GOOD (  11.46  )
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

T24gMTYgRGVjIDIwMjQsIGF0IDIyOjAwLCBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gCj4gT24gMjAyNC0xMi0wNSAxMTo1OCBQTSwgSW5vY2hpIEFt
YW90byB3cm90ZToKPj4gQWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgQkZsb2F0MTYgcHJlY2lzaW9u
IEZsb2F0aW5nLVBvaW50IElTQSBleHRlbnNpb24sCj4+IChaZmJmbWluLCBadmZiZm1pbiwgWnZm
YmZ3bWEpLiB3aGljaCB3YXMgcmF0aWZpZWQgaW4gY29tbWl0IDRkYzIzZDYyCj4+ICgiQWRkZWQg
Q2hhcHRlciB0aXRsZSB0byBCRjE2Iikgb2YgdGhlIHJpc2N2LWlzYS1tYW51YWwuCj4+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+PiBBY2tl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gLS0tCj4+
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDQ1ICsrKysr
KysrKysrKysrKysrKysKPj4gMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPj4gCj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbAo+PiBpbmRleCA5YzdkZDdlNzVlMGMuLjBhMWYxYTc2ZDEyOSAxMDA2NDQK
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lv
bnMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sCj4+IEBAIC0zMjksNiArMzI5LDEyIEBAIHByb3BlcnRpZXM6Cj4+ICAg
ICAgICAgICAgIGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDA1NmI2ZmYgKCJa
ZmEgaXMgcmF0aWZpZWQiKSBvZgo+PiAgICAgICAgICAgICByaXNjdi1pc2EtbWFudWFsLgo+PiAK
Pj4gKyAgICAgICAgLSBjb25zdDogemZiZm1pbgo+PiArICAgICAgICAgIGRlc2NyaXB0aW9uOgo+
PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYmZtaW4gZXh0ZW5zaW9uIHdoaWNoIHByb3Zp
ZGVzIG1pbmltYWwgc3VwcG9ydCBmb3IKPj4gKyAgICAgICAgICAgIDE2LWJpdCBoYWxmLXByZWNp
c2lvbiBicmFpbiBmbG9hdGluZy1wb2ludCBpbnN0cnVjdGlvbnMsIGFzIHJhdGlmaWVkCj4gCj4g
SSB0aGluayB5b3UgbWVhbiAiYmluYXJ5IiBoZXJlIGFuZCBpbiB0aGUgZW50cmllcyBiZWxvdywg
bm90ICJicmFpbuKAnS4KCk5vLCB0aGF04oCZcyBaZmhtaW4gLyBGUDE2IC8gYmluYXJ5MTYsIG5v
dCBaZmJmbWluIC8gQkYxNiAvIEJGbG9hdDE2PyBUaGUKQiBpcyBmb3IgQnJhaW4gYXMgaXQgY2Ft
ZSBvdXQgb2YgR29vZ2xlIEJyYWluLgoKaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvQmZs
b2F0MTZfZmxvYXRpbmctcG9pbnRfZm9ybWF0CgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
