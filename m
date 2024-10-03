Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6678BCF8567
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmNABhtlVT6f7VcYI/5iASTop9G8HGw0pNDyRl1/+bA=; b=RCVvmddnd7sbVl
	bGh77imjszli68qN+hIuwG/+7k7eKXt9l80KBTXZJkaX94nl9bd4TC1l8ePu2/kNZz8q4/Xx/o2ID
	hz4Y4XGU8MjSKlua3Mw/EZg8AwdQ/N9Nl5TbrdZaUjwAd8lpg5FbQr9sMFqSzB9FkeEPkajy3CKF4
	kzMoozz6o4sHawcUk3RtT7RzrWP3CQCMLPmR2mwt1bmUtRvPpilNOiZ0wj9nejQT7GpxqheEjEf6R
	E58YVnIR/cDnniyUz915ZyUfu2Uzn0aPwwn+FC7ZpkSK50ZjkeURRdw8KTISY2/pLBuWn6YP+Wddj
	oJFlkhuqJ0GjLfqMkKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swGig-00000008T1Z-1W41;
	Thu, 03 Oct 2024 07:57:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swGXf-00000008QrC-0S7N
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 07:46:33 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d04b32ea6so435846f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Oct 2024 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727941589; x=1728546389; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+01MGWoHABznmzKKhj+zA/q5OKddZoPDhpHMTncA3w=;
        b=zI4CJy/q4pkrtcG8p8LdUII7dMz8wy7KYcHNRE4iJtBqgbBvP2WO1mCJr1rY9RNVZd
         jMbsvDdGPVwbdSv7yYaxUCnRaVAQ5ssWvfHJqATANkn3JVyJVzrUnYlZwLVoC3tWM8Pl
         nzJmkJmn2uK20JKaGLmo4UAUSC3H7VWGzKYjHJv0lTh88cZtTOW8yp6yWVtCmZ1/Gdpr
         NRawXTl0SdmaLI7W8AbtZYcQLX0vKTwOHFCMuPX6Og6JnjdqzCWIGIieLGUdy5mzqmwo
         V5+9XYLm623up7fTd5AXX4df1Lqd+tVyF92XUPpfSejGwgWYa7EWloC+y4M4huDfDBdK
         idMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941589; x=1728546389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+01MGWoHABznmzKKhj+zA/q5OKddZoPDhpHMTncA3w=;
        b=FYOcc7eVvBRorh4mDPCtT4DFycoCP0WwqEX92LVG6OtApm7x88PMWU+BaagFxGZ8rE
         WmUrKsaluPFeZ2wyH+9XmKSZs6sKNQCGNcKe6GNXc7p2XlrWznoFGtVLY64WVyeUltG3
         UQuexYyZccgoOvHhjg+/OHe/GLCLWi+ykA161AIJFEXZ89/sRQntNp0PTAQGn6R8VojL
         LCLN2iAB8/6U6HxYcizEE5lMrSc4uPs7o4Tz5qYOLCCDzMT8yu1vIa1II0SoAuGLN+my
         rQ4GvxnMEi3WXplm5nvOt98r6bPZYJyGaAJ8iVvfGzrSeT1r/vSBxe0oVEfXhPlwAW3u
         B+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnjg7nsx4U1uVG94D80a5O2T9vnbK1gegbP2PVZSuo7TIsNmVclGM7f9aqs0ObPLja+Hy4wKeUJwBrtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo2GLmsU0kTT4JBxbZ2xZ7fTe8xPq0x4HYzI+WSMwBmFEfInGq
	QQZ40MId4NIaoCdzNorUhi2/XWbMPxroYXDSqnUKXZM+wuWiLtYYxi1UHZMTavw=
X-Google-Smtp-Source: AGHT+IFmSxB/Q7EYZFD10s5+kDNUAXKpfZGMfXmV7w3NC8ZyQpx6+9a9lJjBbEZrMdcUell4hVXdqQ==
X-Received: by 2002:adf:b609:0:b0:37c:d198:3167 with SMTP id ffacd0b85a97d-37cfba1849fmr4170560f8f.53.1727941588751;
        Thu, 03 Oct 2024 00:46:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082a6c2fsm657088f8f.72.2024.10.03.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:46:28 -0700 (PDT)
Message-ID: <ae3f50dc-8712-4ae1-b0c1-3f0b9058f77b@rivosinc.com>
Date: Thu, 3 Oct 2024 09:46:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 3/5] dt-bindings: riscv: d requires f
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-deliverer-recite-2c5a05f50721@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241002-deliverer-recite-2c5a05f50721@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_004631_444282_AEF16E89 
X-CRM114-Status: GOOD (  12.79  )
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

CgpPbiAwMi8xMC8yMDI0IDE4OjEwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBQZXIgdGhlIHNwZWNpZmlj
YXRpb25zLCB0aGUgZCBleHRlbnNpb24gZm9yIGRvdWJsZS1wcmVjaXNpb24gZmxvYXRpbmcKPiBw
b2ludCBvcGVyYXRpb25zIGRlcGVuZHMgb24gdGhlIGYgZXh0ZW5zaW9uIGZvciBzaW5nbGUtcHJl
Y2lvdXMgZmxvYXRpbmcKPiBwb2ludC4gQWRkIHRoYXQgcmVxdWlyZW1lbnQgdG8gdGhlIGJpbmRp
bmdzLiBUaGlzIGRpZmZlcnMgZnJvbSB0aGUKPiBMaW51eCBpbXBsZW1lbnRhdGlvbiwgd2hlcmUg
c2luZ2xlLXByZWNpb3VzIG9ubHkgaXMgbm90IHN1cHBvcnRlZC4KCkhleSBDb25vciwKCldoaWxl
IGZsb2F0aW5nIHBvaW50IGlzIHByZWNpb3VzIHRvIGhhdmUsIEkgZG9uJ3QgdGhpbmsgc2luZ2xl
LXByZWNpb3VzCmlzIHRoZSBleHBlY3RlZCB3b3JkIGhlcmUgOikuCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA2
ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCj4gaW5kZXggYTA2ZGJjNmI0OTI4OS4uNzc5ZjVjZmFiODA2ZSAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAo+IEBAIC01NjQsNiArNTY0LDEyIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgIGh0
dHBzOi8vd3d3LmFuZGVzdGVjaC5jb20vd3AtY29udGVudC91cGxvYWRzL0FYNDVNUC0xQy1SZXYu
LTUuMC4wLURhdGFzaGVldC5wZGYKPiAgCj4gICAgICBhbGxPZjoKPiArICAgICAgLSBpZjoKPiAr
ICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBjb25zdDogZAo+ICsgICAgICAgIHRo
ZW46Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29uc3Q6IGYKPiAgICAg
ICAgIyBaY2IgZGVwZW5kcyBvbiBaY2EKPiAgICAgICAgLSBpZjoKPiAgICAgICAgICAgIGNvbnRh
aW5zOgoKT3RoZXJ3aXNlLCBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KCkNsw6ltZW50CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
