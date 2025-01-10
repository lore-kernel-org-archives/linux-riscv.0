Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B3CE7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 23:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlY7jOo1bnc3LqWlSyJsBKqdBCfSEzpGNXvBqFhEV+U=; b=B3FvUTGJVWb/OO
	0H6Lee6P72HvViyFbvxOYrPVJdQOBlkKIcs2D6rgSaD2EWd1z8uUYdmDdNmt6JCytcIxHJWSSgL9A
	BovmkJOHBF44Ozb1/Th8YhEDRWxDO52TL/HZCIzHzKXgnkdmpkO3CXE8AZF9fT5LyGAM4nNucOeee
	CHGHsNT6HSy/e/yYnCwD+B/21uqTHCkXQ9VU+NlgJb1LBPiAwfg00hFpijZ5Y/46Me6p768Ezx9PG
	tyMGo0lxIpFL/wBfoLDq8QpKMNm7R7qRCEpjFgaDq+DUnSoNH9X7ZguYDJux/TzUMSGJRdh4sI28N
	WGZLqgyPUFKuk3eVSFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOqz-0000000HJtH-08NZ;
	Fri, 10 Jan 2025 23:55:49 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOqw-0000000HJsE-0MZR
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 23:55:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ab29214f45so8192905ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736553345; x=1737158145; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83wRULGvUmj10rdkn50Twrq4N8VlHWb+qzAtMGfh0G4=;
        b=I8j2lImGkNcWaZ/8LE+NYpFdV0tMTKzolHVqPmjV1XxvulPWpO5mOxZKMYiRENhFUr
         dd+A8LKQKsp03PheYLkDlDiIbHMppR1TrQKL2o+jzp1p7qftHKzPyCvgctONT9dtIzIn
         gFj7sMeLw4Jm0pzsyKEF9X7TFB4gync+dGrTFQaM1e8w6ap+mHZZSJxboz77xsNifhhN
         jRl8M9fkix2dgTPjAC4dbZTuC4Dtbs8zAuDCwYAR7sptP9zDhzDEuZMwiK1Qb64FTDwd
         MWVMOwiZEkNjwMeTJ1Ca3rdZJ/om0FXhIv4zBvzpxwMw1r65iDb63bMwX3ned5UZ6Al1
         SZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736553345; x=1737158145;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83wRULGvUmj10rdkn50Twrq4N8VlHWb+qzAtMGfh0G4=;
        b=Nmacs8IcbSt4q8jVhZsHNgRS7a9lRLqSkR96y8iJKdVfljlpZgFj3SeqgX1Ohr+AuX
         4zdOr0FYOTm1y0UXfqhBldaTeLLmyffH/Bai8HG5bHFLBRXAXUgQTgwT6kPdlpy+5+jt
         yCN1zh7YHDLZZQTFdQygLisnfwuMK8vCTusD+53HVbout0aE5JqM+pzXyoI1DGYJaylf
         XzKwubSNS7NpzK+OTWrTSNtL3ekpMNqjHLFmjIdgSOAum7piD/dioKFl+2+R8u9J92+r
         xk3U51ue4Pc/6yIcH2gL0iSiFChV7AFhum8HewtEGDnVJ0uz+S9ulYzibrSGBS7FC+NI
         QggQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUkhIj7rwcFY44jtF6lpw/TIHUF4dRYqiphO30QFyzs6UNTR3ItrjCiSiuLc0tYEDVHFle0XTQ8+KsJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVp4rId2mJmubWkIzqhL7Q+8BQ7eIpFLrvI7dYbMUFMMy5e/uB
	ncvVO4lWkL7VOIF3atq5M6j/uFPeWoR8rOHZLvkllAeGOaazcoCamy/fQ0Vxa58=
X-Gm-Gg: ASbGnctHltx4+NUDA3zQdkANVbu4VC+JfJXNX/0NpCtqXeiKSr/mIrGwFpdRo/+HKII
	V1wCnylTOGSPi/jT+ckxhPpCzm95OwG/tio2FmdL+CDsItz+e71pszkxOBArExfYOB2g0PbDAxW
	RCpLM5jglI20vl1Vac5/gIBw3gT9vml1V5sYAQlUUEbjSpFBhARwvLbXDldpGPTmx9NRdyR9hg7
	6zBdpzn3xZDaXH++MpsGGM74dZOfO8oS3uKG8Uh0eaO5tw0NNc+1zQVFaAXjy1Y3L0Bk21UWAou
	sFsI
X-Google-Smtp-Source: AGHT+IH0fgQxMOSKadJfIoy2Nj8jc7fKrOvZJO0N4J4fYEHjn0eRwTiFqc8rtxsnNitjP7FoCOy29w==
X-Received: by 2002:a05:6e02:1c81:b0:3a7:6636:eb3b with SMTP id e9e14a558f8ab-3ce3aa5ad65mr87898675ab.17.1736553344919;
        Fri, 10 Jan 2025 15:55:44 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4ad94327sm11932995ab.15.2025.01.10.15.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:55:44 -0800 (PST)
Message-ID: <b3f54d34-bc77-46db-88da-70c0c602081f@sifive.com>
Date: Fri, 10 Jan 2025 17:55:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-7-cleger@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
In-Reply-To: <20250106154847.1100344-7-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_155546_177123_187C355E 
X-CRM114-Status: GOOD (  19.95  )
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

T24gMjAyNS0wMS0wNiA5OjQ4IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gU0JJX0ZXRlRf
TUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRvIGRlbGVnYXRl
Cj4gbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGV4Y2VwdGlvbnMuIFNhdmUgYW5kIHJlc3RvcmUgaXQg
ZHVyaW5nIENQVQo+IGxvYWQvcHV0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAg
ICAgICAgIHwgIDMgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDM5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDM0MjBhNGE2MmM5NC4uYmI2Zjc4OGQ0NmY1IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L3ZjcHUuYwo+IEBAIC02NDEsNiArNjQxLDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAgCXZvaWQgKm5zaDsKPiAgCXN0cnVjdCBrdm1fdmNw
dV9jc3IgKmNzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPiArCXN0cnVjdCBrdm1fdmNwdV9j
b25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPiAgCj4gIAl2Y3B1LT5jcHUgPSAtMTsKPiAg
Cj4gQEAgLTY2Niw2ICs2NjcsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKPiAgCQljc3ItPnZzdHZhbCA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfVlNU
VkFMKTsKPiAgCQljc3ItPmh2aXAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hWSVApOwo+ICAJ
CWNzci0+dnNhdHAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKPiArCQljZmctPmhl
ZGVsZWcgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hFREVMRUcpOwo+ICAJfSBlbHNlIHsKPiAg
CQljc3ItPnZzc3RhdHVzID0gY3NyX3JlYWQoQ1NSX1ZTU1RBVFVTKTsKPiAgCQljc3ItPnZzaWUg
PSBjc3JfcmVhZChDU1JfVlNJRSk7Cj4gQEAgLTY3Niw2ICs2NzgsNyBAQCB2b2lkIGt2bV9hcmNo
X3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgCQljc3ItPnZzdHZhbCA9IGNzcl9y
ZWFkKENTUl9WU1RWQUwpOwo+ICAJCWNzci0+aHZpcCA9IGNzcl9yZWFkKENTUl9IVklQKTsKPiAg
CQljc3ItPnZzYXRwID0gY3NyX3JlYWQoQ1NSX1ZTQVRQKTsKPiArCQljZmctPmhlZGVsZWcgPSBj
c3JfcmVhZChDU1JfSEVERUxFRyk7Cj4gIAl9Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQu
Ywo+IGluZGV4IDU1NDMzZTgwNWJhYS4uMWU4NWZmNjY2NmFmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2Z3ZnQuYwo+IEBAIC0xNCw2ICsxNCw4IEBACj4gICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2Jp
Lmg+Cj4gICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaD4KPiAgCj4gKyNkZWZpbmUg
TUlTX0RFTEVHICgxVUwgPDwgRVhDX0xPQURfTUlTQUxJR05FRCB8IDFVTCA8PCBFWENfU1RPUkVf
TUlTQUxJR05FRCkKPiArCj4gIHN0YXRpYyBjb25zdCBlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCBr
dm1fZndmdF9kZWZpbmVkX2ZlYXR1cmVzW10gPSB7Cj4gIAlTQklfRldGVF9NSVNBTElHTkVEX0VY
Q19ERUxFRywKPiAgCVNCSV9GV0ZUX0xBTkRJTkdfUEFELAo+IEBAIC0zNSw3ICszNyw0NCBAQCBz
dGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0
dXJlX3QgZmVhdHVyZSkKPiAgCXJldHVybiBmYWxzZTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wg
a3ZtX3NiaV9md2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQo+ICt7Cj4gKwlpZiAoIXVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKCkpCgpUaGlz
IHNlZW1zIGxpa2UgdGhlIHdyb25nIGNvbmRpdGlvbi4gUGF0Y2ggMiByZXF1ZXN0cyBkZWxlZ2F0
aW9uIHJlZ2FyZGxlc3Mgb2YKd2hhdCBwcm9iaW5nIGRldGVjdHMuIEZvciBNSVNBTElHTkVEX1ND
QUxBUl9GQVNULCB0aGUgZGVsZWdhdGlvbiBsaWtlbHkgZG9lc24ndApjaGFuZ2UgYW55IGFjdHVh
bCBiZWhhdmlvciwgYmVjYXVzZSB0aGUgaGFyZHdhcmUgbGlrZWx5IG5ldmVyIHJhaXNlcyB0aGUK
ZXhjZXB0aW9uLiBCdXQgaXQgZG9lcyBlbnN1cmUgTS1tb2RlIG5ldmVyIGVtdWxhdGVzIGFueXRo
aW5nLCBzbyBpZiB0aGUKZXhjZXB0aW9uIHdlcmUgdG8gb2NjdXIsIHRoZSBrZXJuZWwgaGFzIHRo
ZSBjaG9pY2Ugd2hldGhlciB0byBoYW5kbGUgaXQuIEFuZAp0aGlzIGxldHMgdXMgcHJvdmlkZSB0
aGUgc2FtZSBndWFyYW50ZWUgdG8gS1ZNIGd1ZXN0cy4gU28gSSB0aGluayB0aGlzIGZlYXR1cmUK
c2hvdWxkIGFsc28gYmUgc3VwcG9ydGVkIGlmIHdlIHN1Y2Nlc3NmdWxseSBkZWxlZ2F0ZWQgdGhl
IGV4Y2VwdGlvbiBvbiB0aGUgaG9zdApzaWRlLgoKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJ
cmV0dXJuIHRydWU7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X3NldF9taXNh
bGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsJCQkJCXN0cnVjdCBr
dm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsJCQkJCXVuc2lnbmVkIGxvbmcgdmFsdWUpCj4g
K3sKPiArCWlmICh2YWx1ZSA9PSAxKQo+ICsJCWNzcl9zZXQoQ1NSX0hFREVMRUcsIE1JU19ERUxF
Ryk7Cj4gKwllbHNlIGlmICh2YWx1ZSA9PSAwKQo+ICsJCWNzcl9jbGVhcihDU1JfSEVERUxFRywg
TUlTX0RFTEVHKTsKPiArCWVsc2UKPiArCQlyZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+
ICsKPiArCXJldHVybiBTQklfU1VDQ0VTUzsKPiArfQo+ICsKPiArc3RhdGljIGludCBrdm1fc2Jp
X2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
KwkJCQkJc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKwkJCQkJdW5zaWduZWQg
bG9uZyAqdmFsdWUpCj4gK3sKPiArCSp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVERUxFRykgJiBN
SVNfREVMRUcpICE9IDA7Cj4gKwo+ICsJcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJlIGZlYXR1cmVzW10gPSB7Cj4g
Kwl7Cj4gKwkJLmlkID0gU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCj4gKwkJLnN1cHBv
cnRlZCA9IGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkLAo+ICsJ
CS5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPiArCQkuZ2V0
ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4gKwl9CgpuaXQ6IFBs
ZWFzZSBhZGQgYSB0cmFpbGluZyBjb21tYSBoZXJlIGFzIGZ1dHVyZSBwYXRjaGVzIHdpbGwgZXh0
ZW5kIHRoZSBhcnJheS4KClJlZ2FyZHMsClNhbXVlbAoKPiAgfTsKPiAgCj4gIHN0YXRpYyBzdHJ1
Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
