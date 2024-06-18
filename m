Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C2C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 13:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3hz3Kak0DmfFOsKtDyKJAPqTDbILd0y0cMI2g+Qbjg=; b=HDd/rUyfBV7EpI
	OsMWJvU6oRD1DZpgMWtZTcpqSLy+zdU6z5iyPtVI4A0KzVcGFWVLeD/UqpOe6kQUzj1BYcTmTNO5l
	YbD6LYwAnL8j12Ys94l66BoxrxaNwM82fEDi4Q6kQOIXW27NEtvo/qi/ET5PxKDgAh7rSll/gxRBI
	90wEgXmN/gxU+HIILPflx5bfv4kmhKjUBrlPrdNjmwSNguZSnwjGavwPdEkX+ttjh2kyVSCRD4Es1
	0zc5LxdAomeyrW4+rZAUV0FQN67JxkcFBLR75zVYCPo4R6OUhu5Bdnsxaw4tOSGQZzaRbcwKKf8Le
	ajtswgcrhRgJaxeOVOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJZCv-0000000FDcw-38tm;
	Tue, 18 Jun 2024 13:49:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJZCr-0000000FDav-1D5y
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 13:49:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-35f0dac5909so408606f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718718541; x=1719323341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+A6Ln/tT358tVyqKy2/noXpOlJxyAQfqx2aBkUeUUbU=;
        b=Kk5/5AJE9Db1enBRn0lVf15fOg+Oleimws88dXos4FP2NX4R4LeYz/+rvwbHJlr96h
         9d7bGFoR2RxL5Rz553reoQKcGh8wzbJ/RHnHAtAe5LmZL6Y2SHP2z6nyTuTLu8+RN6L7
         zXFJZTZ+E9eAkGo1fZbsRk2jCLWWC3y7+jX/fDgLijpvsLYB4H5oWc26jBKNP9JIg1vT
         iFxZMZfsGkGPbfJrcj7HMzY5dmz3+vHC+GotWUwIS7VfxQuy/rdYn24roHETfDfkmzXw
         /xHXIKuvKQO45hFOhdTIwZ4YUdWDAbqFqmeE1IVbu4D29tbjibvpnLDSJWu2OWQGQx2m
         Il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718541; x=1719323341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+A6Ln/tT358tVyqKy2/noXpOlJxyAQfqx2aBkUeUUbU=;
        b=Mt7UXs/JQyh4BEuq++DIoSkAK+UEc2rTPbtRLNzt4Vv30oYvwypw6hnL307kPsY2pS
         GRui0hYW47UhbQuJGjJNntsM08mxKlxY/Sf63n4Pdtm1AkN4DM+CjRfEPIvfqVpQ/fcn
         fBzaJ/C57Ld+lkXanT0JwnIxo6opK91VvY8vbgOYBLjRpdavT0TJNXlpZFwr+Aw2EFSN
         O7VDUQpMRkA8N6iTRSorH5hjJvKYhJ5o5U5rgENSzNO57d0hXLbdaANmpYEPXmz21HdF
         RJhN4dWp/TdUFsPcgioL5GpsJ4wuHfULdptFRTxKHmhB2CwMzcP8Rtv/k8TUURcQ5d7I
         Zx3A==
X-Forwarded-Encrypted: i=1; AJvYcCWS2/n9Y4xeuZFvCaGSrS89BFV4l5V2GnVTWo+EPQKIvFET/C5CE0oS028sT0mSdLlH+EGps6QDIpvj/uUkdZLW1t0+Se2ts9pxu2jXL60y
X-Gm-Message-State: AOJu0Yy3blIPfhH7CT+cQHWCaQT0mhOO4jOBO4CYA84DDVrWiQqoeI8n
	ZXlIbXXxYVyYKepZhbIp1SyJvvQ7Ob+HhOiZVQ2htvVT8rckvWx0cXetSsErpm8=
X-Google-Smtp-Source: AGHT+IGIn0V0kb2C9GfnJ/5CLyyzx+tZkHiedxvdMFuq3KLnaanaavZNpCBz2NKWlJXZsQOPYupmgg==
X-Received: by 2002:a5d:5885:0:b0:360:83d6:e2f0 with SMTP id ffacd0b85a97d-36083d6e6d4mr8940241f8f.6.1718718541204;
        Tue, 18 Jun 2024 06:49:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:65d4:678c:278a:2de2? ([2a01:e0a:999:a3a0:65d4:678c:278a:2de2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104954sm14123280f8f.99.2024.06.18.06.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:49:00 -0700 (PDT)
Message-ID: <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
Date: Tue, 18 Jun 2024 15:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, anup@brainfault.org, atishp@atishpatra.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com,
 David.Laight@ACULAB.COM, parri.andrea@gmail.com, luxu.kernel@bytedance.com
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240426100820.14762-12-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_064905_345006_6CEB0A6F 
X-CRM114-Status: GOOD (  16.94  )
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

CgpPbiAyNi8wNC8yMDI0IDEyOjA4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gRXhwb3J0IFphd3Jz
IElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
ICAgICAgIHwgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IGluZGV4IGIyYmNjOWVlZDlhYS4uZTA3MmNl
ODI4NWQ4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IEBAIC0xODgs
NiArMTg4LDEwIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAgICAgIG1h
bnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA5NWNmMWY5ICgiQWRkIGNoYW5nZXMgcmVxdWVzdGVk
IGJ5IFZlZAo+ICAgICAgICAgZHVyaW5nIHNpZ25vZmYiKQo+ICAKPiArICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0VYVF9aQVdSU2A6IFRoZSBaYXdycyBleHRlbnNpb24gaXMgc3VwcG9ydGVk
IGFzCj4gKyAgICAgICByYXRpZmllZCBpbiBjb21taXQgOTg5MThjODQ0MjgxICgiTWVyZ2UgcHVs
bCByZXF1ZXN0ICMxMjE3IGZyb20KPiArICAgICAgIHJpc2N2L3phd3JzIikgb2YgcmlzY3YtaXNh
LW1hbnVhbC4KPiArCj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6
IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCj4gICAgaW5mb3JtYXRpb24gYWJv
dXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRleCA5ZjJhOGUzZmYyMDQuLmE1ZmNhMzg3OGEzMiAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC01OSw2ICs1OSw3IEBA
IHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRT
TwkJKDFVTEwgPDwgMzMpCj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pBQ0FTCQkoMVVM
TCA8PCAzNCkKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM1
KQo+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQVdSUwkJKDFVTEwgPDwgMzYpCj4gICNk
ZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKPiAgI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4g
aW5kZXggOGNhZTQxYTUwMmRkLi5iODZlMzUzMWE0NWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMKPiBAQCAtMTExLDYgKzExMSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAo
c3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gIAkJRVhUX0tFWShaVFNPKTsKPiAgCQlFWFRf
S0VZKFpBQ0FTKTsKPiAgCQlFWFRfS0VZKFpJQ09ORCk7Cj4gKwkJRVhUX0tFWShaQVdSUyk7Cj4g
IAo+ICAJCWlmIChoYXNfdmVjdG9yKCkpIHsKPiAgCQkJRVhUX0tFWShaVkJCKTsKCkFGQUlVLCB3
aGVuIHVzZWQgaW4gdXNlcnNwYWNlLCB0aGlzIHdpbGwgYWN0dWFsbHkgInN0YWxsIiB0aGUgcHJv
Y2Vzc29yCnVudGlsIGFuIGludGVycnVwdC90aW1lb3V0IGhhcHBlbnMsIHNvIHRoZSBjdXJyZW50
IHByb2Nlc3Mgd2lsbCBrZWVwCm9jY3VweWluZyB0aGUgcHJvY2Vzc29yIGRvaW5nIG5vdGhpbmcg
KHVwIHRvIHRoZSBuZXh0IGludGVycnVwdC90aW1lb3V0KQpyaWdodCA/CgpCVFcsIHRoZSBzcGVj
IGFsc28gc3RhdGVzIHRoYXQgIldoZW4gdGhlIFRXIChUaW1lb3V0IFdhaXQpIGJpdCBpbgptc3Rh
dHVzIGlzIHNldCBhbmQgV1JTLk5UTyBpcyBleGVjdXRlZCBpbiBhbnkgcHJpdmlsZWdlIG1vZGUg
b3RoZXIgdGhhbgpNIG1vZGUsIGFuZCBpdCBkb2VzIG5vdCBjb21wbGV0ZSB3aXRoaW4gYW4gaW1w
bGVtZW50YXRpb24tc3BlY2lmaWMKYm91bmRlZCB0aW1lIGxpbWl0LCB0aGUgV1JTLk5UTyBpbnN0
cnVjdGlvbiB3aWxsIGNhdXNlIGFuIGlsbGVnYWwKaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiIgc28g
SSBndWVzcyB0aGUgcHJvY2VzcyB3aWxsIGJlIGtpbGxlZCBpbiB0aGlzIGNhc2UgPwoKSWYgdGhp
cyBpcyBub3QgYSBjb25jZXJuOgoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
