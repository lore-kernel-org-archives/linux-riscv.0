Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20ADCD1284
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gp25wobIUdO2bzUxz5KD5+8PCoTU2HKqP3sC4W5pdl4=; b=wCxEn149IGls3IJFKcjao3g1EA
	EBQRKcxMeqnoGZyN1jq+KRvDO56QOvtw3FDn72brzvzJCXc4gFoHTZethCVx7hMS6jo8GqI1Mtm4E
	dAImB3ZO8EQohcS4MQR8N+vGyveSsCZLTBwyhw7sOocjnjN1Z7poeHGKWZcPkX+Ylq1A7A4V2lnP+
	FXGYILBtV264DlWYlxeK1LNkcnbUg8yRio552dD07FuNgmfS9jSRo/9NRZiR5qaBXJ+jB2WIN7Ypj
	To/IwPRAP0IhpyJak2IdKa1+boJpM2+LLoVLnjXb27WWi1AOhx0NVcx10gAEb7ucxWidwtVyAFIbI
	AuraTANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruggI-00000009HG6-39Uh;
	Wed, 10 Apr 2024 22:44:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruggG-00000009HF0-0bt9
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 22:44:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so5270141b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712789075; x=1713393875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2cgH2D45ho9cvREdXhs3e9eKM8qb8mttS4hZyQWXSk=;
        b=nPK4bw6W4yxPin6WQUTfanw0DqutD/HydeiBnYC5XL/Mg7xq4+YXl3HXetftq4Pt81
         nodvZAulraqxp8j5beVxNOqlYuaOZSck5MZma8z0jnwymYWG9Y54zuZ/FMlWnnh1I0BU
         YfDytPPx3DCP4Cz+anr3ZAJpfls35RiuFNDoSuzx7QBtQ6u36jlrV0FFaopgGTamRGku
         bf1SstPeNlZFveAu2SN2ND3xcgys1CFL1RIoKAu4F8gjTQcWRlzcmO1IjHKAUsJXdmFx
         7Og8EZILOYg1TFXIXHefSiocdwawsJwB079vcmqLqLhM8szeSmK8tnaac2sdASzbIQ2p
         QaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789075; x=1713393875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2cgH2D45ho9cvREdXhs3e9eKM8qb8mttS4hZyQWXSk=;
        b=bhs1OZ69+C4b4hTcO8CWRS7NSxn6m7ebJbYKu39skdRLaEnUp4Mmy4skygxlMhAs3B
         2qcPqin1vNVOiSJ92VDslmzUoIsLRbNFwlSTAcnIKpg4hJP/kfzuD0FloCZoEhWrzkxN
         k+E0X0caeNDPTG38IAeoRJv27Lf8HssRLgveWv88Qb8H58WExlFSgBwCZxZlxSxGHaJz
         TINgZ3cv42PgwLnkE4+NmmwbzG4eQTwpC4Z4IQ6I/nHQRBabKUvcWcYZc5ClrpKdGiz9
         rO5kNRHXeiHUtTWmGG/ZMzhQvjnTYAW3vH7jC0VU/aV5dz620w8I62/UCE30ApKkdTCS
         lAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7uqr06qcjnq4/RT8XpCs8grxyJqQwdBx9Ur66AqZ1E9ObOuCJSN0AJuVu6FmBZFBo8JwMC3K/OWsqqxIb0yMWXMLhocOdHtlEGMx0ItUo
X-Gm-Message-State: AOJu0Yw3bX4FtJKYF5px4ejtO32CjIpZDzP3pdEAV4UcqnHFjCcV99xf
	0oY0TSRNM/jL3Z8nUJF1DjJeEqpE/mAE5ZsAJ49cJVCrnVyLZNXHgwFb8iWTrfg=
X-Google-Smtp-Source: AGHT+IFOs0DWU7qRtLwZS8q4mBlc3GS6E0uhBHn2npU45ykLOXlx7J+qnf3/xj3qEtURDx9Q7UvkAw==
X-Received: by 2002:a05:6a21:6d85:b0:1a7:c67:82ff with SMTP id wl5-20020a056a216d8500b001a70c6782ffmr4674154pzb.13.1712789074961;
        Wed, 10 Apr 2024 15:44:34 -0700 (PDT)
Received: from [172.16.0.69] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001d8be6d1ec4sm63707plh.39.2024.04.10.15.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:44:34 -0700 (PDT)
Message-ID: <7d02c86e-8c36-4e78-9fa8-5e30f3431eb3@rivosinc.com>
Date: Wed, 10 Apr 2024 15:44:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
 <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
 <20240404-ea40bc0237635d671e64fef6@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240404-ea40bc0237635d671e64fef6@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154436_230094_815FBE8D 
X-CRM114-Status: GOOD (  37.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC80LzI0IDA1OjE2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMDEsIDIw
MjQgYXQgMDM6Mzc6MDFQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+IE9uIFNhdCwgTWFy
IDIsIDIwMjQgYXQgMTI6MTbigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPiB3cm90ZToKPj4+Cj4+PiBPbiBXZWQsIEZlYiAyOCwgMjAyNCBhdCAwNTowMToyMlBNIC0w
ODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+PiBDdXJyZW50bHksIHdlIHJldHVybiBhIGxpbnV4
IGVycm9yIGNvZGUgaWYgY3JlYXRpbmcgYSBwZXJmIGV2ZW50IGZhaWxlZAo+Pj4+IGluIGt2bS4g
VGhhdCBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5IGFzIGd1ZXN0IGNhbiBjb250aW51ZSB0byBvcGVy
YXRlCj4+Pj4gd2l0aG91dCBwZXJmIHByb2ZpbGluZyBvciBwcm9maWxpbmcgd2l0aCBmaXJtd2Fy
ZSBjb3VudGVycy4KPj4+Pgo+Pj4+IFJldHVybiBhcHByb3ByaWF0ZSBTQkkgZXJyb3IgY29kZSB0
byBpbmRpY2F0ZSB0aGF0IFBNVSBjb25maWd1cmF0aW9uCj4+Pj4gZmFpbGVkLiBBbiBlcnJvciBt
ZXNzYWdlIGluIGt2bSBhbHJlYWR5IGRlc2NyaWJlcyB0aGUgcmVhc29uIGZvciBmYWlsdXJlLgo+
Pj4KPj4+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIHBlcmYgc3Vic3lzdGVtIHRvIGtu
b3cgaWYgdGhlcmUgbWF5IGJlCj4+PiBhIGNvbmNlcm4gdGhhdCByZXNvdXJjZXMgYXJlIHRlbXBv
cmFyaWx5IHVuYXZhaWxhYmxlLiBJZiBzbywgdGhlbiB0aGlzCj4+Cj4+IERvIHlvdSBtZWFuIHRo
ZSBoYXJkd2FyZSByZXNvdXJjZXMgdW5hdmFpbGFibGUgYmVjYXVzZSB0aGUgaG9zdCBpcyB1c2lu
ZyBpdCA/Cj4gCj4gWWVzIChJIHRoaW5rKS4gVGhlIGlzc3VlIEknbSB0aGlua2luZyBvZiBpcyBp
ZiBrdm1fcG11X2NyZWF0ZV9wZXJmX2V2ZW50Cj4gKHBlcmZfZXZlbnRfY3JlYXRlX2tlcm5lbF9j
b3VudGVyKSByZXR1cm5zIHNvbWV0aGluZyBsaWtlIEVCVVNZIGFuZCB0aGVuCj4gd2UgdHJhbnNs
YXRlIHRoYXQgdG8gU0JJX0VSUl9OT1RfU1VQUE9SVEVELiBJJ20gbm90IHN1cmUgZ3Vlc3RzIHdv
dWxkCj4gaW50ZXJwcmV0IG5vdC1zdXBwb3J0ZWQgYXMgYW4gZXJyb3Igd2hpY2ggbWVhbnMgdGhl
eSBjYW4gcmV0cnkuIE9yIGlmCj4gdGhleSByZXRyeSBhbmQgZ2V0IHNvbWV0aGluZyBvdGhlciB0
aGFuIG5vdC1zdXBwb3J0ZWQgaWYgdGhleSdkIGJlCj4gY29uZnVzZWQuCj4gCgpBdCBsZWFzdCBp
biBMaW51eCBkcml2ZXIsIHRyZWF0cyAtRU5PVFNVUFAgYW5kIGl0IGp1c3QgZmFpbHMuIE90aGVy
IApndWVzdCBPUyBpbXBsZW1lbnRhdGlvbiBtYXkgaW50ZXJwcmV0IGl0IGRpZmZlcmVudGx5LiBC
dXQgdGhleSBzaG91bGQgCmZhaWwgYXQgdGhhdCBwb2ludCBhcyB3ZWxsLiBJIGRvbid0IHNlZSBo
b3cgY2FuIHRoZXkgaW50ZXJwcmV0IHRvIGJlIHJldHJ5LgoKVGhlIHBlcmYgdXNlciBjYW4gcmV0
cnkgYWdhaW4gd2l0aCBhc3N1bXB0aW9uIHRoYXQgbWF5IGJlIGVub3VnaCAKY291bnRlcnMgYXJl
IG5vdCBhdmFpbGFibGUgYXQgdGhpcyBtb21lbnQuIEJ1dCB0aGF0J3MgZGlmZmVyZW50IGZyb20g
CnJldHVybiBhIHJldHJ5IGZyb20gZHJpdmVyIGNvZGUuCgpFdmVuIGlmIHdlIHN1cHBvcnQgYSBy
ZXRyeSBlcnJvciBjb2RlLCB3aGVuIGRvZXMgdGhlIGNhbGxlciByZXRyeSBpdCA/ClRoZSBkcml2
ZXIgZG9lc24ndCBrbm93IGhvdyBsb25nIHRoZSB1c2VyIGlzIGdvaW5nIHRvIHJ1biB0aGUgcGVy
ZiAKY29tbWFuZCB0byBrZWVwIHRoZSBoYXJkd2FyZSByZXNvdXJjZXMgb2NjdXBpZWQuCgpJIGZl
ZWwgdGhlIHBlcmYgdXNlciBpcyB0aGUgYmVzdCBlbnRpdHkgdG8ga25vdyB0aGF0IGFuZCBzaG91
bGQgcmV0cnkgaWYgCml0IGtub3dzIHRoZSBwcmV2aW91cyBydW4gaXMgb3ZlciB3aGljaCBtaWdo
dCBoYXZlIHJlbGVhc2VkIHRoZSBoYXJkd2FyZSAKcmVzb3VyY2VzLgoKPiBUaGFua3MsCj4gZHJl
dwo+ICAgIAo+IAo+Pgo+Pj4gcGF0Y2ggd291bGQgbWFrZSBpdCBwb3NzaWJsZSBmb3IgYSBndWVz
dCB0byBkbyB0aGUgZXhhY3Qgc2FtZSB0aGluZywKPj4+IGJ1dCBzb21ldGltZXMgc3VjY2VlZCBh
bmQgc29tZXRpbWVzIGdldCBTQklfRVJSX05PVF9TVVBQT1JURUQuCj4+PiBzYmlfcG11X2NvdW50
ZXJfY29uZmlnX21hdGNoaW5nIGRvZXNuJ3QgY3VycmVudGx5IGhhdmUgYW55IGVycm9yIHR5cGVz
Cj4+PiBzcGVjaWZpZWQgdGhhdCBzYXkgInVuc3VwcG9ydGVkIGF0IHRoZSBtb21lbnQsIG1heWJl
IHRyeSBhZ2FpbiIsIHdoaWNoCj4+PiB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlIGluIHRoYXQg
Y2FzZS4gSSBkbyBzZWUKPj4+IHBlcmZfZXZlbnRfY3JlYXRlX2tlcm5lbF9jb3VudGVyKCkgY2Fu
IHJldHVybiBFTk9NRU0gd2hlbiBtZW1vcnkgaXNuJ3QKPj4+IGF2YWlsYWJsZSwgYnV0IGlmIHRo
ZSBrZXJuZWwgaXNuJ3QgYWJsZSB0byBhbGxvY2F0ZSBhIHNtYWxsIGFtb3VudCBvZgo+Pj4gbWVt
b3J5LCB0aGVuIHdlJ3JlIGluIGJpZ2dlciB0cm91YmxlIGFueXdheSwgc28gdGhlIGNvbmNlcm4g
d291bGQgYmUKPj4+IGlmIHRoZXJlIGFyZSBwZXJmIHJlc291cmNlIHBvb2xzIHdoaWNoIG1heSB0
ZW1wb3JhcmlseSBiZSBleGhhdXN0ZWQgYXQKPj4+IHRoZSB0aW1lIHRoZSBndWVzdCBtYWtlcyB0
aGlzIHJlcXVlc3QuCj4+Pgo+Pgo+PiBGb3Igb3RoZXIgY2FzZXMsIHRoaXMgcGF0Y2ggZW5zdXJl
cyB0aGF0IGd1ZXN0cyBjb250aW51ZSB0byBydW4gd2l0aG91dCBmYWlsdXJlCj4+IHdoaWNoIGFs
bG93cyB0aGUgdXNlciBpbiB0aGUgZ3Vlc3QgdG8gdHJ5IGFnYWluIGlmIHRoaXMgZmFpbHMgZHVl
IHRvIGEgdGVtcG9yYXJ5Cj4+IHJlc291cmNlIGF2YWlsYWJpbGl0eS4KPj4KPj4+IE9uZSBjb21t
ZW50IGJlbG93Lgo+Pj4KPj4+Pgo+Pj4+IEZpeGVzOiAwY2I3NGI2NWQyZTUgKCJSSVNDLVY6IEtW
TTogSW1wbGVtZW50IHBlcmYgc3VwcG9ydCB3aXRob3V0IHNhbXBsaW5nIikKPj4+PiBSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4+PiAtLS0KPj4+PiAgIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgIHwgMTQgKysrKysrKysrLS0tLS0KPj4+PiAgIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jIHwgIDYgKysrLS0tCj4+Pj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMK
Pj4+PiBpbmRleCBiMTU3NGMwNDNmNzcuLjI5YmY0Y2E3OThjYiAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYwo+Pj4+IEBAIC0yMjksOCArMjI5LDkgQEAgc3RhdGljIGludCBrdm1fcG11X3ZhbGlkYXRl
X2NvdW50ZXJfbWFzayhzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUsIHVuc2lnbmVkIGxvbmcgY3QKPj4+
PiAgICAgICAgcmV0dXJuIDA7Cj4+Pj4gICB9Cj4+Pj4KPj4+PiAtc3RhdGljIGludCBrdm1fcG11
X2NyZWF0ZV9wZXJmX2V2ZW50KHN0cnVjdCBrdm1fcG1jICpwbWMsIHN0cnVjdCBwZXJmX2V2ZW50
X2F0dHIgKmF0dHIsCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzLCB1bnNpZ25lZCBsb25nIGVpZHgsIHVuc2lnbmVkIGxvbmcgZXZ0ZGF0
YSkKPj4+PiArc3RhdGljIGxvbmcga3ZtX3BtdV9jcmVhdGVfcGVyZl9ldmVudChzdHJ1Y3Qga3Zt
X3BtYyAqcG1jLCBzdHJ1Y3QgcGVyZl9ldmVudF9hdHRyICphdHRyLAo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHVuc2lnbmVkIGxv
bmcgZWlkeCwKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGV2dGRhdGEpCj4+Pj4gICB7Cj4+Pj4gICAgICAgIHN0cnVjdCBwZXJmX2V2ZW50ICpl
dmVudDsKPj4+Pgo+Pj4+IEBAIC00NTQsNyArNDU1LDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X3Bt
dV9jdHJfY2ZnX21hdGNoKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjdHJf
YmEKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGVpZHgsIHU2NCBldnRkYXRhLAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKQo+Pj4+ICAgewo+Pj4+IC0g
ICAgIGludCBjdHJfaWR4LCByZXQsIHNiaXJldCA9IDA7Cj4+Pj4gKyAgICAgaW50IGN0cl9pZHgs
IHNiaXJldCA9IDA7Cj4+Pj4gKyAgICAgbG9uZyByZXQ7Cj4+Pj4gICAgICAgIGJvb2wgaXNfZmV2
ZW50Owo+Pj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGV2ZW50X2NvZGU7Cj4+Pj4gICAgICAgIHUz
MiBldHlwZSA9IGt2bV9wbXVfZ2V0X3BlcmZfZXZlbnRfdHlwZShlaWR4KTsKPj4+PiBAQCAtNTEz
LDggKzUxNSwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAga3ZwbXUtPmZ3X2V2ZW50W2V2ZW50X2NvZGVdLnN0YXJ0ZWQgPSB0cnVlOwo+Pj4+
ICAgICAgICB9IGVsc2Ugewo+Pj4+ICAgICAgICAgICAgICAgIHJldCA9IGt2bV9wbXVfY3JlYXRl
X3BlcmZfZXZlbnQocG1jLCAmYXR0ciwgZmxhZ3MsIGVpZHgsIGV2dGRhdGEpOwo+Pj4+IC0gICAg
ICAgICAgICAgaWYgKHJldCkKPj4+PiAtICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
Pj4+PiArICAgICAgICAgICAgIGlmIChyZXQpIHsKPj4+PiArICAgICAgICAgICAgICAgICAgICAg
c2JpcmV0ID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4+PiArICAgICAgICAgICAgIH0KPj4+PiAgICAgICAgfQo+Pj4+Cj4+Pj4g
ICAgICAgIHNldF9iaXQoY3RyX2lkeCwga3ZwbXUtPnBtY19pbl91c2UpOwo+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3BtdS5jCj4+Pj4gaW5kZXggN2VjYTcyZGYyY2JkLi5iNzAxNzllOWU4NzUgMTAwNjQ0Cj4+
Pj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMKPj4+PiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9wbXUuYwo+Pj4+IEBAIC00Miw5ICs0Miw5IEBAIHN0YXRpYyBpbnQg
a3ZtX3NiaV9leHRfcG11X2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3Zt
X3J1biAqcnVuLAo+Pj4+ICAgI2VuZGlmCj4+Pj4gICAgICAgICAgICAgICAgLyoKPj4+PiAgICAg
ICAgICAgICAgICAgKiBUaGlzIGNhbiBmYWlsIGlmIHBlcmYgY29yZSBmcmFtZXdvcmsgZmFpbHMg
dG8gY3JlYXRlIGFuIGV2ZW50Lgo+Pj4+IC0gICAgICAgICAgICAgICogRm9yd2FyZCB0aGUgZXJy
b3IgdG8gdXNlcnNwYWNlIGJlY2F1c2UgaXQncyBhbiBlcnJvciB3aGljaAo+Pj4+IC0gICAgICAg
ICAgICAgICogaGFwcGVuZWQgd2l0aGluIHRoZSBob3N0IGtlcm5lbC4gVGhlIG90aGVyIG9wdGlv
biB3b3VsZCBiZQo+Pj4+IC0gICAgICAgICAgICAgICogdG8gY29udmVydCB0byBhbiBTQkkgZXJy
b3IgYW5kIGZvcndhcmQgdG8gdGhlIGd1ZXN0Lgo+Pj4+ICsgICAgICAgICAgICAgICogTm8gbmVl
ZCB0byBmb3J3YXJkIHRoZSBlcnJvciB0byB1c2Vyc3BhY2UgYW5kIGV4aXQgdGhlIGd1ZXN0Cj4+
Pgo+Pj4gUGVyaW9kIGFmdGVyIGd1ZXN0Cj4+Pgo+Pj4KPj4+PiArICAgICAgICAgICAgICAqIG9w
ZXJhdGlvbiBjYW4gY29udGludWUgd2l0aG91dCBwcm9maWxpbmcuIEZvcndhcmQgdGhlCj4+Pgo+
Pj4gVGhlIG9wZXJhdGlvbgo+Pj4KPj4KPj4gRml4ZWQgdGhlIGFib3ZlIHR3by4KPj4KPj4KPj4+
PiArICAgICAgICAgICAgICAqIGFwcHJvcHJpYXRlIFNCSSBlcnJvciB0byB0aGUgZ3Vlc3QuCj4+
Pj4gICAgICAgICAgICAgICAgICovCj4+Pj4gICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2
X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2godmNwdSwgY3AtPmEwLCBjcC0+YTEsCj4+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3AtPmEyLCBj
cC0+YTMsIHRlbXAsIHJldGRhdGEpOwo+Pj4+IC0tCj4+Pj4gMi4zNC4xCj4+Pj4KPj4+Cj4+PiBU
aGFua3MsCj4+PiBkcmV3Cj4+Cj4+Cj4+Cj4+IC0tCj4+IFJlZ2FyZHMsCj4+IEF0aXNoCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
