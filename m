Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D11C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+w1RPWyfrYjS6rDZIJ7kn4cavJ1/HHoZP6zMEJc+YHA=; b=dNQ4vHk8l0GflT
	EXWeTQYsE/h5LerqgikWEpEN+5wmziO4mJd4vYmpwc15EqOkGkHJhRnjEyIKOQqqFdM4AI9D0ufLw
	APbBv57oJ8gmlqw530p42Wn9f1sBNhay6hlwF+Wkx0TNRRc6qe7Qans84uI0EXE9pYepln+Q+b9O2
	Rgx49AL/+1XKqviJ200H6FuN9BWUHrjIgVW3Me0Q1n/TyNpX+yzEQV8hPRazwKBQzesguG9W4yMcv
	VW3uywjNDPf8JjyQDC33Xih7+vnzM34Jg5joDzVRXKPcWV3gPp+fWPEG9Pts2o6wtpEysDbmnbU7b
	AnvGgkkA9Yh/mT+bBBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxa5u-00000003ptl-2jpW;
	Thu, 18 Apr 2024 22:19:02 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxa5s-00000003ptJ-0yPc
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 22:19:01 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5aa17c29ba0so796597eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713478738; x=1714083538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjSNVaTp2CK2a3BXhVXbAXtv2UmAERGwn5Hrch+E7CU=;
        b=Jfqmk9NPhHClZhfkKFP75DbzPRDymZQsSe3cK++uDKiR087u0C2ggOjpXo06iT5R47
         AMkiQRDOJFKwmPTKvGLtfz6tkPx4eVHHat7DVY++rWCufdm/B4Xri+ip3AMH7I3RKUOi
         VgsLcxJu10P3a80O4fLSLHVeoCFHzeW7jkefHUaopusLcoFLYnolbbmRT4UvUyLwB3F3
         MlWMtj7jn9rHCAQaoNQurOOTmjBEIPjVkpKYE/IEaEyL43DZ36QBgINygk1e47O1RTLc
         90SUKjWaHF+wQyK10r15Sg3lk0I7yHSVch2RT/jxommOtVlDHoAYB2a//YW5FGfNsjbc
         Zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713478738; x=1714083538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjSNVaTp2CK2a3BXhVXbAXtv2UmAERGwn5Hrch+E7CU=;
        b=VbTyghagM66twXXBsaTIwyMgg02ITyIn76kYp6o0ndFwG6mZw76067vaLrkt8I3jNZ
         eRpd6qby0HfvyeZnz+E2hwz5b+CgJK8Tse0nooeoP9lTcrgtFgUluqrkIdLeY3WF5U/F
         oa6MwWNUOmoYdxmQcWI71MPZEfzviaD12I0nDx6l1Uq3vpiCsqUclmhhPKn6HiMOcgaL
         0xCH9qmAdh5hI4Y3WIBkNpF/zJpNvhyHAca4G0r8Yvee8jFhO4qxYWOKm208XsjbAUmK
         G1kDZqWAv22kY0FMP8Jwi9itat6rz2KX1DB8vREyevv3+DMT8ydPHCSJzihiwBUaLepf
         sSIA==
X-Forwarded-Encrypted: i=1; AJvYcCU8y/s62flEL+WYf+r9KRqFFr6g6PswxxdJF4QONIna+P3EyW6nGGmhK0DoQxILcDqc/j3Wo704Ci9qlVYa0zflobg31b8nDKgwgD7RqT6o
X-Gm-Message-State: AOJu0YwdPcDuOv5iJC0ailyNxUnVklDXuQFyZy+2/m1dHB+LGDCYfNmh
	pHQAO/TgWFUPHtiVRG8xN/nlF0NW95+LXo21iXSlFUY+jip9un8x0y6CnlIdN3Y=
X-Google-Smtp-Source: AGHT+IHy0fL7lXQuzGDsR89q1qBuUYQhGBkh8xPVh4GAWuHmBlphok2cL4joZuVDX6t12N8GeqlFGA==
X-Received: by 2002:a05:6870:32cf:b0:22e:9792:97ed with SMTP id r15-20020a05687032cf00b0022e979297edmr521699oac.38.1713478737800;
        Thu, 18 Apr 2024 15:18:57 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id iz27-20020a056638881b00b0047ecd14e8fcsm639381jab.130.2024.04.18.15.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 15:18:57 -0700 (PDT)
Message-ID: <979139a9-3f87-4c42-8849-4909311f0891@sifive.com>
Date: Thu, 18 Apr 2024 17:18:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: clarify what some RISCV_ISA* config options do
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240418-stable-railway-7cce07e1e440@spud>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240418-stable-railway-7cce07e1e440@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151900_309374_45C74E18 
X-CRM114-Status: GOOD (  15.09  )
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

T24gMjAyNC0wNC0xOCA5OjIxIEFNLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBEdXJpbmcgc29tZSBkaXNj
dXNzaW9uIG9uIElSQyB5ZXN0ZXJkYXkgYW5kIG9uIFB1J3MgYnBmIHBhdGNoIFsxXQo+IEkgbm90
aWNlZCB0aGF0IHRoZXNlIFJJU0NWX0lTQSogS2NvbmZpZyBvcHRpb25zIGFyZSBub3QgcmVhbGx5
IGNsZWFyCj4gYWJvdXQgdGhlaXIgaW1wbGljYXRpb25zLiBNYW55IG9mIHRoZXNlIG9wdGlvbnMg
aGF2ZSBubyBpbXBhY3Qgb24gd2hhdAo+IHVzZXJzcGFjZSBpcyBhbGxvd2VkIHRvIGRvLCBmb3Ig
ZXhhbXBsZSBhbiBhcHBsaWNhdGlvbiBjYW4gdXNlIFpiYgo+IHJlZ2FyZGxlc3Mgb2Ygd2hldGhl
ciBvciBub3QgdGhlIGtlcm5lbCBkb2VzLiBDaGFuZ2UgdGhlIGhlbHAgdGV4dCB0bwo+IHRyeSBh
bmQgY2xhcmlmeSB3aGV0aGVyIG9yIG5vdCBhbiBvcHRpb24gYWZmZWN0cyBqdXN0IHRoZSBrZXJu
ZWwsIG9yCj4gYWxzbyB1c2Vyc3BhY2UuIE5vbmUgb2YgdGhlc2Ugb3B0aW9ucyBhY3R1YWxseSBj
b250cm9sIHdoZXRoZXIgb3Igbm90IGFuCj4gZXh0ZW5zaW9uIGlzIGRldGVjdGVkIGR5bmFtaWNh
bGx5IGFzIHRoYXQncyBkb25lIHJlZ2FyZGxlc3Mgb2YgS2NvbmZpZwo+IG9wdGlvbnMsIHNvIGRy
b3AgYW55IHRleHQgdGhhdCBpbXBsaWVzIHRoZSBvcHRpb24gaXMgcmVxdWlyZWQgZm9yCj4gZHlu
YW1pYyBkZXRlY3Rpb24sIHJld29yZGluZyB0aGVtIGFzICJkbyB4IHdoZW4geSBpcyBkZXRlY3Rl
ZCIuCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDAz
MjgtZmVyb2NpdHktcmVwb3NlLWM1NTRmNzVhNjc2Y0BzcHVkLyBbMV0KPiBSZXZpZXdlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gCj4gVmVjdG9yIGNv
cHktcGFzdGUtbyBmaXhlZCwgY29ycmVjdCBzcGVsbGluZyBvZiBvcHRpbWlzYXRpb25zIGtlcHQu
Cj4gCj4gQ0M6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+IEND
OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+Cj4gQ0M6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQGtlcm5lbC5vcmc+Cj4gQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lm
aXZlLmNvbT4KPiBDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDQzog
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENDOiBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDI4ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
