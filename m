Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2483C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/1lDhsJ4VXe3ehYKy0nr2lZSfR/9tYgP+KVnfuvIEg=; b=2K4MCplrmMZ1mr
	S2dmdAgiVGh6gXaP31HZpcbcSxWH3JHjkpfavXTkjiuXgxdRLyiS2hQEzEoQjJp4CGhtk4zMtSRRc
	BbHEUHC/9KQs3fufZHwkPuhMxgXBoyd/Q//W4sZnkgQ0lYmlwVgooEfaQrg72ILqmC7V5zvEbChOa
	rgMISerEffIF43+/8Pc46NOcLbH6WIT1eB/CMv9/ZCSyXICzypb6Kmw/I8BUbkhb5RfYm1b7XSfeI
	uhSgJpkeC9FLNFbbclxlWx/zGqPxPoYVmMcaK9lxW0UnJ5FUTBIxBL1yGcSABqc1s/IP3si8Y+dZI
	YRUAqedL1PV9mRH85N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4nU-0000000Dufr-1xwi;
	Wed, 17 Jul 2024 13:34:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4nR-0000000DufH-1JG6
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:34:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc0f82e4f5so6056205ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721223256; x=1721828056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Xw/N/Nknt+hnHErgAhb4sAGn5EWOvMdRK8INgc/iwE=;
        b=Lw0GhQLul6BvgLizcypD6bn0pWkIJwO8ju+WQrM6cRs5S6ONjNwuhipsMH9lS89bxM
         N8FmhZQp5Dq4E5Dx3JoWoBzaYvVTbNXEe0tE9gDJMk6wmYtWTBjT76JWqmkKJa8DHi4g
         7+Lh/N8R5T4OpoDjIrAxK8UqxgEqEJHEolpA3w8pbu4pkxj/y5ftb0A7fE8T+/cCRDuE
         mT/kZesVji0hyaf/KXKwpS8KpL0526YwCOHEdO0yjik0/cBTVeV/xfB+MwXcXL9B6D42
         vv//NWvKuU5PGcuwQG4+nwzyEj7kWTdn6PSpGXkFSj4It90mFc7FRTk9P9aV77rq2NZ6
         Iktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721223256; x=1721828056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Xw/N/Nknt+hnHErgAhb4sAGn5EWOvMdRK8INgc/iwE=;
        b=Ih7CSF8rQYr6b6+Ehlu4mp9kqyvodqZcB07GtzlY1UQgNzyShiPbZUtMBNWVX05PRr
         o7pIMiw2D+l6ov9CcmvBphhxckDBVm83vJATGvnmU+4XJYwyBDu0RUP3sYa12v9vmPqX
         lnV2/sP/wDCWtPjLDB4UN05Sm6a2Po8DoJ1pIZzMYCwrCuriZjlWdUpQ6JLK1tdvKaou
         YpWQAy4qOordwW+wnm+QePuj9o9B9MGwoN6MKqbic3bkcV8B919mN3y6C0vI8Cqm+QYA
         76/77igyGePfO7fjYjGyT12K3lp+XlkcE0fl9GjTmwPkJOXxPV/waQgiLaWXJmHQez4j
         PVqA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxWb2MKQlpo+tlHgnJT/VSa1zO3h7H3DCHB1aoJYpwtgO8TFjyLpc/9GeFucluApZukQpcznDjNHAOJp1By9cDVhHhCtrjtSP8GSvbB/O
X-Gm-Message-State: AOJu0YwH1DN1tIRcD5YhyQZlJj/Iwl/jAxeMBGeTah4mZP9UBeukUrw9
	12MEnfgpCxR55YE8MEpbq+QHehDxeSoObx3siRYDRS9g10aOKKGD8MKfTl1BcrE=
X-Google-Smtp-Source: AGHT+IHms1cWLCgQC4yvQAgbreOqMc80HS4eJgDWkU02jypBXGuCpbaumITC1nUfJM8C/W7W++ZkVA==
X-Received: by 2002:a17:903:248:b0:1f2:f9b9:8796 with SMTP id d9443c01a7336-1fc4e12608cmr10902955ad.2.1721223255347;
        Wed, 17 Jul 2024 06:34:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc381a1sm75109425ad.202.2024.07.17.06.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 06:34:14 -0700 (PDT)
Message-ID: <cba0c880-a1b2-4bb8-bef0-d280d87ec308@rivosinc.com>
Date: Wed, 17 Jul 2024 15:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0()
 alphabetically
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
References: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_063417_373698_2043A0F9 
X-CRM114-Status: GOOD (  18.81  )
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

CgpPbiAxNy8wNy8yMDI0IDEwOjU0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gRnJvbTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBDdXJyZW50bHkgdGhlIGVu
dHJpZXMgYXBwZWFyIHRvIGJlIGluIGEgcmFuZG9tIG9yZGVyIChhbHRob3VnaCBhY2NvcmRpbmcK
PiB0byBQYWxtZXIgaGUgaGFzIHRyaWVkIHRvIHNvcnQgdGhlbSBieSBrZXkgdmFsdWUpIHdoaWNo
IG1ha2VzIGl0IGhhcmRlcgo+IHRvIGZpbmQgZW50cmllcyBpbiBhIGdyb3dpbmcgbGlzdCwgYW5k
IG1vcmUgbGlrZWx5IHRvIGhhdmUgY29uZmxpY3RzIGFzCj4gYWxsIHBhdGNoZXMgYXJlIGFkZGlu
ZyB0byB0aGUgZW5kIG9mIHRoZSBsaXN0LiBTb3J0IHRoZW0gYWxwaGFiZXRpY2FsbHkKPiBpbnN0
ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4gLS0tCj4gQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZl
LmNvbT4KPiBDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDQzogbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENDOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgfCA0MyArKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IGlu
ZGV4IDY4NTU5NDc2OTUzNS4uOGExYzljZTE3MGU4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jCj4gQEAgLTkzLDQ0ICs5Myw0NSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0
cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAJCSAqIHJlZ2FyZGxlc3Mgb2YgdGhlIGtlcm5l
bCdzIGNvbmZpZ3VyYXRpb24sIGFzIG5vIG90aGVyIGNoZWNrcywgYmVzaWRlcwo+ICAJCSAqIHBy
ZXNlbmNlIGluIHRoZSBoYXJ0X2lzYSBiaXRtYXAsIGFyZSBtYWRlLgo+ICAJCSAqLwo+ICsJCUVY
VF9LRVkoWkFDQVMpOwo+ICsJCUVYVF9LRVkoWkFXUlMpOwo+ICAJCUVYVF9LRVkoWkJBKTsKPiAg
CQlFWFRfS0VZKFpCQik7Cj4gLQkJRVhUX0tFWShaQlMpOwo+IC0JCUVYVF9LRVkoWklDQk9aKTsK
PiAgCQlFWFRfS0VZKFpCQyk7Cj4gLQo+ICAJCUVYVF9LRVkoWkJLQik7Cj4gIAkJRVhUX0tFWSha
QktDKTsKPiAgCQlFWFRfS0VZKFpCS1gpOwo+ICsJCUVYVF9LRVkoWkJTKTsKPiArCQlFWFRfS0VZ
KFpDQSk7Cj4gKwkJRVhUX0tFWShaQ0IpOwo+ICsJCUVYVF9LRVkoWkNNT1ApOwo+ICsJCUVYVF9L
RVkoWklDQk9aKTsKPiArCQlFWFRfS0VZKFpJQ09ORCk7Cj4gKwkJRVhUX0tFWShaSUhJTlROVEwp
Owo+ICsJCUVYVF9LRVkoWklISU5UUEFVU0UpOwo+ICsJCUVYVF9LRVkoWklNT1ApOwo+ICAJCUVY
VF9LRVkoWktORCk7Cj4gIAkJRVhUX0tFWShaS05FKTsKPiAgCQlFWFRfS0VZKFpLTkgpOwo+ICAJ
CUVYVF9LRVkoWktTRUQpOwo+ICAJCUVYVF9LRVkoWktTSCk7Cj4gIAkJRVhUX0tFWShaS1QpOwo+
IC0JCUVYVF9LRVkoWklISU5UTlRMKTsKPiAgCQlFWFRfS0VZKFpUU08pOwo+IC0JCUVYVF9LRVko
WkFDQVMpOwo+IC0JCUVYVF9LRVkoWklDT05EKTsKPiAtCQlFWFRfS0VZKFpJSElOVFBBVVNFKTsK
PiAtCQlFWFRfS0VZKFpJTU9QKTsKPiAtCQlFWFRfS0VZKFpDQSk7Cj4gLQkJRVhUX0tFWShaQ0Ip
Owo+IC0JCUVYVF9LRVkoWkNNT1ApOwo+IC0JCUVYVF9LRVkoWkFXUlMpOwo+ICAKPiAgCQkvKgo+
ICAJCSAqIEFsbCB0aGUgZm9sbG93aW5nIGV4dGVuc2lvbnMgbXVzdCBkZXBlbmQgb24gdGhlIGtl
cm5lbAo+ICAJCSAqIHN1cHBvcnQgb2YgVi4KPiAgCQkgKi8KPiAgCQlpZiAoaGFzX3ZlY3Rvcigp
KSB7Cj4gLQkJCUVYVF9LRVkoWlZFMzJYKTsKPiAtCQkJRVhUX0tFWShaVkUzMkYpOwo+IC0JCQlF
WFRfS0VZKFpWRTY0WCk7Cj4gLQkJCUVYVF9LRVkoWlZFNjRGKTsKPiAtCQkJRVhUX0tFWShaVkU2
NEQpOwo+ICAJCQlFWFRfS0VZKFpWQkIpOwo+ICAJCQlFWFRfS0VZKFpWQkMpOwo+ICsJCQlFWFRf
S0VZKFpWRTMyRik7Cj4gKwkJCUVYVF9LRVkoWlZFMzJYKTsKPiArCQkJRVhUX0tFWShaVkU2NEQp
Owo+ICsJCQlFWFRfS0VZKFpWRTY0Rik7Cj4gKwkJCUVYVF9LRVkoWlZFNjRYKTsKPiArCQkJRVhU
X0tFWShaVkZIKTsKPiArCQkJRVhUX0tFWShaVkZITUlOKTsKPiAgCQkJRVhUX0tFWShaVktCKTsK
PiAgCQkJRVhUX0tFWShaVktHKTsKPiAgCQkJRVhUX0tFWShaVktORUQpOwo+IEBAIC0xMzksMTYg
KzE0MCwxNCBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3By
b2JlICpwYWlyLAo+ICAJCQlFWFRfS0VZKFpWS1NFRCk7Cj4gIAkJCUVYVF9LRVkoWlZLU0gpOwo+
ICAJCQlFWFRfS0VZKFpWS1QpOwo+IC0JCQlFWFRfS0VZKFpWRkgpOwo+IC0JCQlFWFRfS0VZKFpW
RkhNSU4pOwo+ICAJCX0KPiAgCj4gIAkJaWYgKGhhc19mcHUoKSkgewo+IC0JCQlFWFRfS0VZKFpG
SCk7Cj4gLQkJCUVYVF9LRVkoWkZITUlOKTsKPiAtCQkJRVhUX0tFWShaRkEpOwo+ICAJCQlFWFRf
S0VZKFpDRCk7Cj4gIAkJCUVYVF9LRVkoWkNGKTsKPiArCQkJRVhUX0tFWShaRkEpOwo+ICsJCQlF
WFRfS0VZKFpGSCk7Cj4gKwkJCUVYVF9LRVkoWkZITUlOKTsKPiAgCQl9Cj4gICN1bmRlZiBFWFRf
S0VZCj4gIAl9CgpJJ2QgcHJlZmVyIHRoYXQgdG8gYmUgZG9uZSBhZnRlciByZW1vdmluZyB0aGUg
ImlmCihoYXNfdmVjdG9yKCkvaGFzX2ZwdSgpKSBieSB1c2luZyB0aGUgLnZhbGlkYXRlIGNhbGxi
YWNrIGZvciBJU0EKZXh0ZW5zaW9uLiBUaGlzIHdheSwgeW91J2xsIGhhdmUgb25seSBhIHNpbmds
ZSBjb21taXQgcmVvcmRlcmluZyBldmVyeXRoaW5nLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
