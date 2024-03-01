Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57490C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bN6hOrrbkjnjzxJyqVfex6FWEi6eYVjwrZCFw58BSzQ=; b=K5U3B3KR4Z1qXE
	etns/Qap0UWOvM6cDZ9XDPQ3bzG0I4rVGIrXpsO4TIa2BRDq5S9fdwr8buAmi9FuLdqNP0luvOgAc
	hcYuVtQvJceRC9dGGEZVImve3L+1UmOX9VU2lP1RUdzcRZ92s6KFbwfYCvu80nevXwlnFhv3OZYUd
	9HJnNCmqQh9jrYLL4cIQURzdToAbFqkugAMxaaTIE5wJgHkWUcsld+/ZoT3Zz4nuforYKm4uNjG1a
	MkA/r+3rjY24iEmDZ8veo5XscptzAtCSxpw3nPaHOc/UheST9elzY3hfsN+LaKSCEbskgT6DgTD77
	lKWYHDVPjyn/Mt4pmtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyDk-0000000GtUV-2Zvh;
	Fri, 01 Mar 2024 08:26:20 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyDf-0000000GtRE-3WDX
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 08:26:18 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6e4ccfce9deso47495a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709281574; x=1709886374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0O2fV0WbAx46xM1Y6qPjUuO/OeNoTHA0KPqbfE4bGA=;
        b=SWL8Cv2Q9scXhu34QXJ2hveXqpIMTpAEUBKDFeNw1/gTFXypNw+7Blr2/5bV8qudqe
         aFrLYqXa3LO7OHpX2TIIvCQNYVYbSyBJkL6G8pYJwu37GsDSuSBCLC3/iHffHnPU8BJP
         0n5W0lrGzkE/cqET3GTA940j84N6t8+863fINSSj50/Xgy23xCena+row6LPJpo5+y0R
         aMOcE79dRXm2VuwYkSXsIRdjALRuG2lwA03lXeyznSVmy0canpqU1F2yrWxH561C553U
         qZp4r13dW8AvSQFjRqWPigbCw4PxYipYKmr2yWWk6oP5kRKipvRGZnun063sI0mrkDdZ
         RAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709281574; x=1709886374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0O2fV0WbAx46xM1Y6qPjUuO/OeNoTHA0KPqbfE4bGA=;
        b=II+RZDihTvnZT22wgnXOJNuXbxpYyUil3B7nbmfmsUSnirCIj0TpEQoXgQ2lrRUXv0
         gOsCPf0hMYzH1O1If8aslSTuTKFroA253HoWsEv062THxPUbopTE/zsPj4zWswiIPzMK
         GIgFJLPeAJJzo0MpA/ut2e7qwYH+SViYUFnWyzM47aOcAuDpKal6WXF+L83unSMD7jlm
         DK3Dsz+qGdmeaCdKXquEPr09pQN7zR6QVqopCQ7qHP5YR5dDuF56rs8Tr0+gP5//Xt2z
         aO8P4RMdurD+whNWwZXoEjdc0rnDt1VLYU2rjYv3Nrd6Xd9BQ7P8mfdU6scQbSO3Y8Ce
         AWsA==
X-Forwarded-Encrypted: i=1; AJvYcCXwNCIIUJggdu/XBlJi+5dkQPLStWv+r7sm0kn14Q9Ig66liJPbwuOgo9f3UdW9BzmGxd/0bcuPK/G+imVGWCEXEFBwDms9xJoqZ1ZUh4kn
X-Gm-Message-State: AOJu0YwggpzHaQ7PYs0ksDELcXR+eqgjJbt+xFn2dtSR5h0FgzsGTm5n
	S/0M9bzsvMhqJsSipjr8jKtfp+LEAQOYyNKVrFksNVbwvIbXXJ3lUwZtaDnXOGE=
X-Google-Smtp-Source: AGHT+IEO2VE95MaGXRr6VmSeAK9U9lNiLgxplCLbWJe649iHowWVgQB/IkCDcUSOog4HOG7PQm9Yjw==
X-Received: by 2002:a05:6820:41:b0:5a0:4216:c5f0 with SMTP id v1-20020a056820004100b005a04216c5f0mr887748oob.0.1709281573977;
        Fri, 01 Mar 2024 00:26:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:1070:febd:b4af:e79a? ([2a01:e0a:999:a3a0:1070:febd:b4af:e79a])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78b87000000b006e13e202914sm2449292pfd.56.2024.03.01.00.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 00:26:13 -0800 (PST)
Message-ID: <9c466c89-3788-4473-a657-1f117cd5e5ab@rivosinc.com>
Date: Fri, 1 Mar 2024 09:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] RISC-V: Fix the typo in Scountovf CSR name
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-2-atishp@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240229010130.1380926-2-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_002616_191937_BBEA3A4D 
X-CRM114-Status: GOOD (  12.44  )
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

CgpPbiAyOS8wMi8yMDI0IDAyOjAxLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBUaGUgY291bnRlciBv
dmVyZmxvdyBDU1IgbmFtZSBpcyAic2NvdW50b3ZmIiBub3QgInNzY291bnRvdmYiLgo+IAo+IEZp
eCB0aGUgY3NyIG5hbWUuCj4gCj4gRml4ZXM6IDQ5MDVlYzJmYjdlNiAoIlJJU0MtVjogQWRkIHNz
Y29mcG1mIGV4dGVuc2lvbiBzdXBwb3J0IikKPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgICAg
IHwgMiArLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmggfCAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jc3IuaAo+IGluZGV4IDUxMDAxNDA1MWY1ZC4uNjAzZTVhM2M2MWY5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Nzci5oCj4gQEAgLTI4MSw3ICsyODEsNyBAQAo+ICAjZGVmaW5lIENTUl9IUE1D
T1VOVEVSMzBICTB4YzllCj4gICNkZWZpbmUgQ1NSX0hQTUNPVU5URVIzMUgJMHhjOWYKPiAgCj4g
LSNkZWZpbmUgQ1NSX1NTQ09VTlRPVkYJCTB4ZGEwCj4gKyNkZWZpbmUgQ1NSX1NDT1VOVE9WRgkJ
MHhkYTAKPiAgCj4gICNkZWZpbmUgQ1NSX1NTVEFUVVMJCTB4MTAwCj4gICNkZWZpbmUgQ1NSX1NJ
RQkJCTB4MTA0Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xp
c3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaAo+IGluZGV4IGVhMzMy
ODhmOGEyNS4uY2Q0OWViMDI1ZGRmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZXJyYXRhX2xpc3QuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xp
c3QuaAo+IEBAIC0xMTQsNyArMTE0LDcgQEAgYXNtIHZvbGF0aWxlKEFMVEVSTkFUSVZFKAkJCQkJ
CVwKPiAgCj4gICNkZWZpbmUgQUxUX1NCSV9QTVVfT1ZFUkZMT1coX19vdmwpCQkJCQlcCj4gIGFz
bSB2b2xhdGlsZShBTFRFUk5BVElWRSgJCQkJCQlcCj4gLQkiY3NyciAlMCwgIiBfX3N0cmluZ2lm
eShDU1JfU1NDT1VOVE9WRiksCQkJXAo+ICsJImNzcnIgJTAsICIgX19zdHJpbmdpZnkoQ1NSX1ND
T1VOVE9WRiksCQkJCVwKPiAgCSJjc3JyICUwLCAiIF9fc3RyaW5naWZ5KFRIRUFEX0M5WFhfQ1NS
X1NDT1VOVEVST0YpLAkJXAo+ICAJCVRIRUFEX1ZFTkRPUl9JRCwgRVJSQVRBX1RIRUFEX1BNVSwJ
CQlcCj4gIAkJQ09ORklHX0VSUkFUQV9USEVBRF9QTVUpCQkJCVwKCgpSZXZpZXdlZC1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
