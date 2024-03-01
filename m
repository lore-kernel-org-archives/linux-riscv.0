Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5295C48BF6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 02:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpNiDFsZB1g2I/MdkZUT/bM40Atpx2uC3Bw2vd9O6A8=; b=d5SU5OdCsunOVq
	k9AEGqHJZq9u9UCxhkTwx+MY+U6kh+TtDUChcqSZSIoNJtS29V3wSRymMKKJ04J4IRqONPuhGTY+1
	3jcxcx/BoIU5tEktYOqEMGIudvWxyaeisgDwXHJEq4dg8Jk7bY0siLi7Sbye1GEvTNaYDlbbDwbcC
	iEP0b9M1h8YLGJOV0NWNXG+MzddoWjJACQMKKOqY+bUCEwA1G1nqJb7CcIMspITita3NIGgATluSK
	7PAch16ibdTT4ITwfo86sYQbBJpEFYGgULZdVu4AfWd9HOwQ/G1P/UbJRqyDV187CI/XdWvyoQPQ5
	gVNneDM3dUNhugmzh7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsjL-0000000G1pN-2Uvf;
	Fri, 01 Mar 2024 02:34:35 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsjI-0000000G1nz-257A
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 02:34:33 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3657dbe2008so8021095ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 18:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709260471; x=1709865271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAET4leT0nXdUH/7/mbrBgjLpgYR5i4eKJ96mLEVZIk=;
        b=R+MX7OhtK4frhFCNhhGmaNmGRbqqwQs09yjfWeTLKWG8DodGSOU/j/xeZytwx1QxFD
         L05471WaUVYWWfsBINpBcx+3HiJqy0x67a1r7OBcg9J+aPd2/zfCYrBDzy+6xJHmTfIh
         RmeMFY2Mf9AiLpMsWULh0N412WZGlyRZzZ44cXC5yBVxCQnwja18Jaajq4Nme1SvY/gj
         vJEhrn3mMZI8oGiBNDaycmwL6/8Y7GMran0/jnz0R4atzmYxmjbNPkbihSnPcINySjg6
         1EqYOF0RyFIK1jMFPBevSr4nH4gjAFXFA7Ne7BO7+XMpv06DEHJJvpgHh0YhSCUaviqx
         RMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709260471; x=1709865271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAET4leT0nXdUH/7/mbrBgjLpgYR5i4eKJ96mLEVZIk=;
        b=n1yIDfTiWEw+YoxLNR29TW7eKc/YcPblrypqCMaAayojTBRD8cYtTu9wVajpURDXPH
         TyRt/HmgbFRD3S1xyyhzFvuBJOVLjOlQeEtiE7GsS0473QJ6Dem0Xni7nOKAnzOkoT6A
         BC8t0pQeMnjtMQvZI4R0Ymq+rbmndK31WOcLoj/f08B6DTo9cY0rASey/vvi0NU4phPE
         p8nPrj6e5I5Bp6MhIzNXWXGj7PmAkup1tEKVzY9vUaL0o0gMJjGjpIQZL3ywQotiTYxD
         fXqjDwzHukT+F28SzKFSgUjBLzawkuNXlKerEEe4i9YvwdaAhU07QcVwU2kpElIzBtlx
         4Fng==
X-Forwarded-Encrypted: i=1; AJvYcCXWCd9ba+icXmQaPrAMe9hm9wMtJWHGDIpKFFwrJitkG7o3XH69H+ifseDvLG3qK4QT8+osE5qeQfzTxQN+Bhi+YPhFB5bbyM3vHc04vSQy
X-Gm-Message-State: AOJu0Yy7AhSApg0cXMVAdQHwSHX9M2HFN4NCjSBmbV4i+ISOjskJb2Bw
	whVKTHgFjyM2dsTZ1usND39C26sswl4QQX9gNXul62ewtDIZeayZmRfC3qm+dsc=
X-Google-Smtp-Source: AGHT+IHd7NbVyfUVYaIJTDtVo/BZe0JoHEDalKRgzupc9cLRGsTgC4gNqvIlKHujIa4XQO9kGrONMg==
X-Received: by 2002:a05:6e02:160d:b0:365:23fe:12fb with SMTP id t13-20020a056e02160d00b0036523fe12fbmr613992ilu.11.1709260471245;
        Thu, 29 Feb 2024 18:34:31 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.201])
        by smtp.gmail.com with ESMTPSA id x9-20020a92dc49000000b0036421b06054sm656564ilq.20.2024.02.29.18.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 18:34:30 -0800 (PST)
Message-ID: <952cad64-d022-4ace-8125-3b20d3684348@sifive.com>
Date: Thu, 29 Feb 2024 20:34:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v5 06/13] riscv: mm: Combine the SMP and UP TLB
 flush code
Content-Language: en-US
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
 <20240229232211.161961-7-samuel.holland@sifive.com>
 <CAEEQ3wnCAqPjXEnSXc9Vce-kWETmbUpyzBdXi_2K+h+NZt4SqQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAEEQ3wnCAqPjXEnSXc9Vce-kWETmbUpyzBdXi_2K+h+NZt4SqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_183432_652667_2181722D 
X-CRM114-Status: GOOD (  18.37  )
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

SGkgWXVuaHVpLAoKT24gMjAyNC0wMi0yOSA4OjEyIFBNLCB5dW5odWkgY3VpIHdyb3RlOgo+IE9u
IEZyaSwgTWFyIDEsIDIwMjQgYXQgNzoyMuKAr0FNIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9s
bGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gSW4gU01QIGNvbmZpZ3VyYXRpb25zLCBhbGwg
VExCIGZsdXNoaW5nIG5hcnJvd2VyIHRoYW4gZmx1c2hfdGxiX2FsbCgpCj4+IGdvZXMgdGhyb3Vn
aCBfX2ZsdXNoX3RsYl9yYW5nZSgpLiBEbyB0aGUgc2FtZSBpbiBVUCBjb25maWd1cmF0aW9ucy4K
Pj4KPj4gVGhpcyBhbGxvd3MgVVAgY29uZmlndXJhdGlvbnMgdG8gdGFrZSBhZHZhbnRhZ2Ugb2Yg
cmVjZW50IGltcHJvdmVtZW50cwo+PiB0byB0aGUgY29kZSBpbiB0bGJmbHVzaC5jLCBzdWNoIGFz
IHN1cHBvcnQgZm9yIGh1Z2UgcGFnZXMgYW5kIGZsdXNoaW5nCj4+IG11bHRpcGxlLXBhZ2UgcmFu
Z2VzLgo+Pgo+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHY0KQo+Pgo+PiBDaGFu
Z2VzIGluIHY0Ogo+PiAgLSBNZXJnZSB0aGUgdHdvIGNvcGllcyBvZiBfX2ZsdXNoX3RsYl9yYW5n
ZSgpIGFuZCByZWx5IG9uIHRoZSBjb21waWxlcgo+PiAgICB0byBvcHRpbWl6ZSBvdXQgdGhlIGJy
b2FkY2FzdCBwYXRoIChib3RoIGNsYW5nIGFuZCBnY2MgZG8gdGhpcykKPj4gIC0gTWVyZ2UgdGhl
IHR3byBjb3BpZXMgb2YgZmx1c2hfdGxiX2FsbCgpIGFuZCByZWx5IG9uIGNvbnN0YW50IGZvbGRp
bmcKPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gIC0gTW92ZSB0aGUgU01QL1VQIG1lcmdlIGVhcmxp
ZXIgaW4gdGhlIHNlcmllcyB0byBhdm9pZCBidWlsZCBpc3N1ZXMKPj4gIC0gTWFrZSBhIGNvcHkg
b2YgX19mbHVzaF90bGJfcmFuZ2UoKSBpbnN0ZWFkIG9mIGFkZGluZyBpZmRlZnMgaW5zaWRlCj4+
ICAtIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKSBpcyB0aGUgb25seSBmdW5jdGlvbiB1c2VkIG9uICFN
TVUgKHNtcGJvb3QuYykKPj4KPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICB8
ICAyICstCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAzMCArKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gIGFyY2gvcmlzY3YvbW0vTWFrZWZpbGUgICAgICAg
ICAgICB8ICA1ICstLS0tCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMzIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gaW5kZXggMGJmY2ZlYzY3ZWQ1Li5kZTliNmYyMjc5ZmYgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
Pj4gQEAgLTYwLDcgKzYwLDcgQEAgY29uZmlnIFJJU0NWCj4+ICAgICAgICAgc2VsZWN0IEFSQ0hf
VVNFX01FTVRFU1QKPj4gICAgICAgICBzZWxlY3QgQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1MKPj4g
ICAgICAgICBzZWxlY3QgQVJDSF9VU0VTX0NGSV9UUkFQUyBpZiBDRklfQ0xBTkcKPj4gLSAgICAg
ICBzZWxlY3QgQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIIGlmIFNNUCAmJiBNTVUK
Pj4gKyAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIIGlmIE1N
VQo+PiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01NQVBfTEFZT1VU
IGlmIE1NVQo+PiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKPj4gICAg
ICAgICBzZWxlY3QgQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQiBpZiAhUklTQ1ZfSVNBX1NWTkFQ
T1QKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+PiBpbmRleCA5MjhmMDk2ZGNhMjEuLjRm
ODY0MjRiMWJhNSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVz
aC5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+PiBAQCAtMjcs
MTIgKzI3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHVuc2ln
bmVkIGxvbmcgYWRkcikKPj4gIHsKPj4gICAgICAgICBBTFRfRkxVU0hfVExCX1BBR0UoX19hc21f
XyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1hICUwIiA6IDogInIiIChhZGRyKSA6ICJtZW1vcnki
KSk7Cj4+ICB9Cj4+IC0jZWxzZSAvKiBDT05GSUdfTU1VICovCj4+IC0jZGVmaW5lIGxvY2FsX2Zs
dXNoX3RsYl9hbGwoKSAgICAgICAgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPj4gLSNkZWZp
bmUgbG9jYWxfZmx1c2hfdGxiX3BhZ2UoYWRkcikgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgw
KQo+PiAtI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPj4KPj4gLSNpZiBkZWZpbmVkKENPTkZJR19T
TVApICYmIGRlZmluZWQoQ09ORklHX01NVSkKPj4gIHZvaWQgZmx1c2hfdGxiX2FsbCh2b2lkKTsK
Pj4gIHZvaWQgZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsKPj4gIHZvaWQgZmx1
c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+PiBAQCAtNTQsMjcgKzQ5LDggQEAgdm9pZCBhcmNoX3RsYmJhdGNoX2FkZF9wZW5kaW5nKHN0
cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCwKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdWFkZHIpOwo+PiAgdm9pZCBhcmNoX2ZsdXNo
X3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+PiAgdm9pZCBhcmNo
X3RsYmJhdGNoX2ZsdXNoKHN0cnVjdCBhcmNoX3RsYmZsdXNoX3VubWFwX2JhdGNoICpiYXRjaCk7
Cj4+IC0KPj4gLSNlbHNlIC8qIENPTkZJR19TTVAgJiYgQ09ORklHX01NVSAqLwo+PiAtCj4+IC0j
ZGVmaW5lIGZsdXNoX3RsYl9hbGwoKSBsb2NhbF9mbHVzaF90bGJfYWxsKCkKPj4gLSNkZWZpbmUg
Zmx1c2hfdGxiX3BhZ2Uodm1hLCBhZGRyKSBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyKQo+PiAt
Cj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAo+PiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWdu
ZWQgbG9uZyBlbmQpCj4+IC17Cj4+IC0gICAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+PiAt
fQo+PiAtCj4+IC0vKiBGbHVzaCBhIHJhbmdlIG9mIGtlcm5lbCBwYWdlcyAqLwo+PiAtc3RhdGlj
IGlubGluZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwK
Pj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGVuZCkKPj4gLXsKPj4gLSAgICAgICBsb2NhbF9mbHVz
aF90bGJfYWxsKCk7Cj4+IC19Cj4+IC0KPj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVz
aF90bGJfYWxsKCkKPj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5k
LCBwYWdlX3NpemUpIGZsdXNoX3RsYl9hbGwoKQo+PiAtI2VuZGlmIC8qICFDT05GSUdfU01QIHx8
ICFDT05GSUdfTU1VICovCj4+ICsjZWxzZSAvKiBDT05GSUdfTU1VICovCj4+ICsjZGVmaW5lIGxv
Y2FsX2ZsdXNoX3RsYl9hbGwoKSAgICAgICAgICAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPj4g
KyNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4+Cj4+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJG
TFVTSF9IICovCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL01ha2VmaWxlIGIvYXJjaC9y
aXNjdi9tbS9NYWtlZmlsZQo+PiBpbmRleCAyYzg2OWY4MDI2YTguLmNiZTRkNzc1ZWY1NiAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3Jpc2N2L21t
L01ha2VmaWxlCj4+IEBAIC0xMywxNCArMTMsMTEgQEAgZW5kaWYKPj4gIEtDT1ZfSU5TVFJVTUVO
VF9pbml0Lm8gOj0gbgo+Pgo+PiAgb2JqLXkgKz0gaW5pdC5vCj4+IC1vYmotJChDT05GSUdfTU1V
KSArPSBleHRhYmxlLm8gZmF1bHQubyBwYWdlYXR0ci5vIHBndGFibGUubwo+PiArb2JqLSQoQ09O
RklHX01NVSkgKz0gZXh0YWJsZS5vIGZhdWx0Lm8gcGFnZWF0dHIubyBwZ3RhYmxlLm8gdGxiZmx1
c2gubwo+PiAgb2JqLXkgKz0gY2FjaGVmbHVzaC5vCj4+ICBvYmoteSArPSBjb250ZXh0Lm8KPj4g
IG9iai15ICs9IHBtZW0ubwo+Pgo+PiAtaWZlcSAoJChDT05GSUdfTU1VKSx5KQo+PiAtb2JqLSQo
Q09ORklHX1NNUCkgKz0gdGxiZmx1c2gubwo+PiAtZW5kaWYKPj4gIG9iai0kKENPTkZJR19IVUdF
VExCX1BBR0UpICs9IGh1Z2V0bGJwYWdlLm8KPj4gIG9iai0kKENPTkZJR19QVERVTVBfQ09SRSkg
Kz0gcHRkdW1wLm8KPj4gIG9iai0kKENPTkZJR19LQVNBTikgICArPSBrYXNhbl9pbml0Lm8KPj4g
LS0KPj4gMi40My4xCj4+Cj4gCj4gZ2l0IGFtIHRoZSBwYXRjaCBmYWlsZWQuIFdhcyBpdCBhIHBh
dGNoIGJhc2VkIG9uIHRoZSB0b3AgY29tbWl0IG9mIGxpbnV4LW5leHQgPwoKVGhpcyBzZXJpZXMg
aXMgYmFzZWQgb24gdGhlIGZvci1uZXh0IGJyYW5jaCBvZiByaXNjdi5naXQsIHdoaWNoIGlzIHdo
ZXJlIGl0CndvdWxkIGJlIGFwcGxpZWQuIFRoZXJlIGlzIGEgY29uZmxpY3Qgd2l0aCBjb21taXQg
ZDk4MDdkNjBjMTQ1ICgicmlzY3Y6IG1tOgpleGVjdXRlIGxvY2FsIFRMQiBmbHVzaCBhZnRlciBw
b3B1bGF0aW5nIHZtZW1tYXAiKSBpbiB0aGUgcmlzY3YuZ2l0IGZpeGVzCmJyYW5jaCwgd2hpY2gg
YWRkZWQgYSB1bmlwcm9jZXNzb3Itc3BlY2lmaWMgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5n
ZSgpCmRlZmluaXRpb24uIFRoZSBhcHByb3ByaWF0ZSBtZXJnZSBjb25mbGljdCByZXNvbHV0aW9u
IGlzIHRvIHJlbW92ZSB0aGF0IG5ldwptYWNybywgaS5lLiB0YWtlIHRoZSB2ZXJzaW9uIG9mIHRo
ZSBmaWxlIGZyb20gdGhpcyBwYXRjaCBzZXJpZXMuCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
