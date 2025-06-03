Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F6CC5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR8ScT56bUTEqDTBwuilRPKKyGxfKFh0WShvrzEkiXA=; b=tUFw3a1yRhmwhv
	Y4zLYVonj+7u2W9kfZ/x9Sy/1e39uBHxJGajVD4k3p5K0mlq8Mx40XLi89d0kmTzMUX06NedFSoaK
	LseiCPA6ERkabrOgTIGqm8CAWEuFT/EyAoE/xT+S8HenywIf1zBRy3la+F+F6WE9ZXe1YUD3j/dxe
	nDNUs0gvhA72x4RaFPv0C6L12FNNL5Ld6dym7fHmp5s9yA/VaihXFLlxPAmfWN4mWApUD0hEEfM3n
	7FHaPWQQXPWr1+8zCRVENebixsi2bfyobm59SZMc9vrTv1AZtRKTDmjjfvXtV1tSR37erFDD4o2uL
	KpBPwZSaIVwmPirm7wlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMM8D-0000000A90u-3Liw;
	Tue, 03 Jun 2025 07:32:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMM8B-0000000A8zp-2hXO
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 07:32:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5052687f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748935937; x=1749540737; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq7+7aAzhRuHvWv/wqDQgLuDPLn9fzxK9ieIK4J/fJU=;
        b=uZ+XPrTDIJ9RjbBbFLkY9W1EoIVR0G7wO+7bm7Zq/LhYgqRArJ3SuJYLk2Dooi/qOx
         RHCQTP+BkT2mIzcoqorjJy+OFWnSVRcNgTDuZo2ycRYtNZKzwuhARbNr/LWASVfPRQAv
         7o6esnq1n5TwAOlWp49layxwCfGPI1iQjJoYxewWEXEfvTuiFaB3bg/0o9ZBl8xYZ27G
         ICMztSHoNlbVmljZNMIV5/OljR8xoahSFwWL35y1bLw5d8QnHgPmnd3F10hKJwBt323Z
         ot+yJqM4+488CRjs9QY35lUmKysFECiL4qz6rBs+SdYtoTcKceRGbS3Uam/c1pZNltbi
         xghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748935937; x=1749540737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq7+7aAzhRuHvWv/wqDQgLuDPLn9fzxK9ieIK4J/fJU=;
        b=lyRtjxlpFsTndvbx3EvSiVtsr8AgrCbbVUWQW70+Orotn3PboQ5gpgXczlVpIo6TeN
         O0RsaWeDhHWGbUPxcFhpLG668Ct5focZp5AF3bVSylyhoehD5VMhAdcKU550JY7gVbz+
         5oHT+Mbk08nfDtMNstJMnqd11Tsbjgky+Cp4WBMaBf30uFe2HEiu8jderDrYmfiXbYZ/
         FoCgBWoF2GCgOhSljtIOa3V3QMM70g7dIKXs311kAGWEUDyovCS9T/EicNcBr5F+K7Gg
         UhFUoNYEkRp6/VYEy5K7SJEr7Dqv3k+TcwcZ5tb1tWpLTShGHlPaU3n57SE2AcG95GQH
         ox+Q==
X-Gm-Message-State: AOJu0YyuKgcehsh+dD+EbjO7WTWalgHRz1zX3JlPstaOReeOovNtTqvF
	HYgKxt6sjXFYGM0Q68I0Xw8cOAc7cfkASuB2MVOF9qZ13obKgMpKk1wAx3Rq7s3dgag=
X-Gm-Gg: ASbGncuXMpNQuzEdiwdPy7EPxdkd/MWeoK/Aq7FEZcBjwFiEsdC39gVKunW8B3pOd7w
	LKb0Ny4Dzbr+VB4xRuLk8YqUYGMyMvL6mxPPeXN80cyNXNg8LmFZRwdTxuPWhAbhm+4pNneNgFb
	M9/mnRPgC0gmxdtdEZQnIjQEWHdDLsTyKbTW7WNWZXymREVFxn8NF9qjUqIbch8yLmbnR+d1UFS
	ed6EW7vf3Bl8jZHRHehi19D1yEYPBDG9jLMxgrgNab86XjSbVgxjyz+j2ewTCGYqtxMyN8+jNQJ
	3E3n73vfeBdApHugKYgB16ZyE/16TS4lfTrd2PYC1UHtcmUptpOOaGmnNtBSvWw/lEZEhO1OY64
	8k9kAnV8wPyP+BriBRdMKaArLCrH3nQ4=
X-Google-Smtp-Source: AGHT+IE2Mi4Z5YOiT+njzLQJlKfwA90YUri5XXdIsegDd6XhhsCquaKIJI0LZ5JZkaOJxhmlsXj2+g==
X-Received: by 2002:a05:6000:40c8:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a4f7ab1c5emr12846078f8f.57.1748935937440;
        Tue, 03 Jun 2025 00:32:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm17733484f8f.56.2025.06.03.00.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:32:16 -0700 (PDT)
Message-ID: <352704e1-2ef7-4141-a6a9-896981d8afa1@rivosinc.com>
Date: Tue, 3 Jun 2025 09:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in put/get_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, "Maciej W . Rozycki" <macro@orcam.me.uk>
References: <20250602193918.868962-1-cleger@rivosinc.com>
 <20250602220855.519e23e5@pumpkin>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250602220855.519e23e5@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_003219_928246_B1CCE2C7 
X-CRM114-Status: GOOD (  10.52  )
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

CgpPbiAwMi8wNi8yMDI1IDIzOjA4LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gT24gTW9uLCAgMiBK
dW4gMjAyNSAyMTozOToxMyArMDIwMAo+IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4gCj4gLi4uCj4+IFRoZSBzZWNvbmQgc29sdXRpb24gd2FzIHRoZSBvbmUg
Y2hvc2VuIGFzIHRoZXJlIGFyZSB0b28gbWFueSBjYWxsc2l0ZXMgdG8KPj4gcHV0L2dldF91c2Vy
KCkgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBkbyBtaXNhbGlnbmVkIGFjY2Vzc2VzLiBXZSB0cmll
ZAo+PiB0d28gYXBwcm9hY2hlcyBmb3IgdGhhdCwgZWl0aGVyIHNwbGl0IGFjY2VzcyBpbiB0d28g
YWxpZ25lZCBhY2Nlc3Nlcwo+PiAoYW5kIGRvIFJNVyBmb3IgcHV0X3VzZXIoKSkKPiAKPiBZb3Ug
Y2FuJ3QgZG8gUk1XIGJlY2F1c2UgaXQgaXMgdmlzaWJsZSB0byBvdGhlciB0aHJlYWRzLgoKQWhl
bSB5ZWFoIGluZGVlZCwgc28gdGhlIG9ubHkgd2F5IHdhcyB0byBkbyBpbmRpdmlkdWFsIGxiIGF0
IGxlYXN0IHVwIHRvCnNvbWUgYWxpZ25tZW50LgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gCURh
dmlkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
