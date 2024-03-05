Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE42C54E49
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wVy7sam4KpzdzPuFR4qGwVKXKpU03HFtySKxiW0WCs=; b=jrvr0+1OgD9SNN
	13liDCdHGDYZOHVYVIVXYnCFkVIhm8vy/EfmGVxPKAICDmYQB4am2uH/IgOB1uRkRRrqNh4Becf2q
	bCfFF4M3/b3uIc/d1CAkkeVWtX8cUQyNj1oK09eDedU1iYqubpG7WZyWnKFYMBOfA6lcdSVB3WaUI
	7kOC6xsZrPEcI7uxlIlAlpwv5o1uL8YmDqTmjcHp3ParOJ79RYxBamMGJIZW6hWbSestt7nmqqujC
	ddixprfawGaGJgRm2n4uOUf7gbgiFolytZZvgUP2bYW8DuEORYcEORBpFykwsXRHrANSp5hmtwEcd
	XO7NFh0pZXYEDqfxcysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhKaB-0000000BZ48-3fTA;
	Tue, 05 Mar 2024 02:31:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhKa5-0000000BZ2r-2KQT
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 02:31:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5132181d54bso5889597e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 18:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709605857; x=1710210657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJxBJuXmvGHQUImyHIJdK0gOdBp3H9ixn+SkaIN8FCM=;
        b=lSYhEM7CVRRwu0HhccnwKQkGIyRzh9JxVZx+rj8Q5k9Rfcs8QnWF+1p90a6TbBT1tc
         O2KaElR5Urd1S2xQ7C0F1l4CfDxpm1EfxPIKNhHT+koITSXQ2OmOz4cWljB4IxPLmnKJ
         0YRcWSfeDpgEwmY8eE8ZL+nKsMyDYLvhLpY+SSllvvI7jgvDFANBPW3ur6UPOm8zP+we
         YbOvu4nKZOOXpnZhEoxaGB02MVQORQcd2u1N2NKryTorSHwVxrLXXQen8Ze8V4Vv56uA
         zixeqy1yk6SIfaZbpjCK5u/SPhFzsktF5GerCFvjvo4JwUSGGBvGGdQIiI7QYL+wMu7I
         tRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709605857; x=1710210657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJxBJuXmvGHQUImyHIJdK0gOdBp3H9ixn+SkaIN8FCM=;
        b=IjparVcpH3I27xFCkV6ezJOvuzcTUvhfdYHJp+lkNLQsHtV1nPImIRkiW85gW4lCkK
         +KxRuXUDCdxqgwvbFsNUuaP+B1OAXz2h6X7JvyN01QkGdXvreeFtp2nbhxp60k+CRceK
         qwCb2+XgRc5DdKjjFwlh0dWkPaWw/5zGQ/KAipRvHWJ71tDbX3RniigErjpwG3VZoj0x
         3B4xbntabyL8nCML0e0K4UPqYOElzkTkqDRIEHXygXiJASoTdFNu3MxJ7v/S4nKCYO0I
         kTuR83x+76b9jRVWJaUHvHdJbCxoWl6pTpibZrFsHfYVQqlcgFw2bBpcbc+6C/WEghVv
         mTIw==
X-Forwarded-Encrypted: i=1; AJvYcCVd5nQIQVlMkdTIU/Y2S6Xs9bZq20VU7VFbEH3ujfnAeu1z5Ta/FCK2r88vFinQqQ03E4anDLF0qD+82VQfKVgXWkJj1lQoHcXyE9/go66o
X-Gm-Message-State: AOJu0Yyrm4g7vDNummHxw7uwjLDfdtq0aUIzIBKO4250sre/H+s/oUUZ
	tWgdG97HfFD8l7g3pa9A2mcH0JiPWAnBM1pyM6B9PRtFHvuV706zD4J9GL2HhJSsKkA5uzGo4in
	vbMuwwOcLVDkNgcJyB3JrutYXyr0=
X-Google-Smtp-Source: AGHT+IGdw1R5rJC4pZeyLtaquozmyyYFWlB0fEy+eGf175BBa5M1tKyVDX4YV/pAnGtKDEywU6f1ZMxAAXweNheWd18=
X-Received: by 2002:a05:6512:36d0:b0:512:e220:d3ab with SMTP id
 e16-20020a05651236d000b00512e220d3abmr275796lfs.65.1709605857043; Mon, 04 Mar
 2024 18:30:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com>
In-Reply-To: <cover.1706603678.git.haibo1.xu@intel.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 5 Mar 2024 10:30:45 +0800
Message-ID: <CAJve8o=H+VVyQH6crAvnTUSjRV2pFDmEpy4ykpFBYSB3pOeiZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add ACPI NUMA support for RISC-V
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_183101_623763_758540AB 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <greentime.hu@sifive.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Yang Li <yang.lee@linux.alibaba.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Dan Williams <dan.j.williams@intel.com>, Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, James Morse <james.morse@arm.com>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgU3VuaWwsCgpDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhpcyBwYXRjaCBzZXQ/CgpUaGFua3Ms
CkhhaWJvCgpPbiBXZWQsIEphbiAzMSwgMjAyNCBhdCAxMDoxOOKAr0FNIEhhaWJvIFh1IDxoYWli
bzEueHVAaW50ZWwuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGVuYWJsZSBSSVND
LVYgQUNQSSBOVU1BIHN1cHBvcnQgd2hpY2ggd2FzIGJhc2VkIG9uCj4gdGhlIHJlY2VudGx5IGFw
cHJvdmVkIEFDUEkgRUNSWzFdLgo+Cj4gUGF0Y2ggMS80IGlzIGdlbmVyYXRlZCBmcm9tIHRoZSBh
Y3BpY2EgUFJbMl0gYW5kIHNob3VsZCBiZSBtZXJnZWQgdGhyb3VnaAo+IHRoZSBhY3BpY2EgcHJv
amVjdC4gRHVlIHRvIHRoaXMgZGVwZW5kZW5jeSwgb3RoZXIgMyBwYXRjaGVzIGNhbiBvbmx5IGJl
Cj4gbWVyZ2VkIGFmdGVyIHRoZSBjb3JyZXNwb25kaW5nIEFDUElDQSBwYXRjaCB3YXMgcHVsbGVk
IGludG8gbGludXguCj4KPiBQYXRjaCAyLzQgYWRkIHRoZSBjb21tb24gU1JBVCBSSU5UQyBhZmZp
bml0eSBzdHJ1Y3R1cmUgaGFuZGxlci4KPiBQYXRjaCAzLzQgYWRkIFJJU0MtViBzcGVjaWZpYyBh
Y3BpX251bWEuYyBmaWxlIHRvIHBhcnNlIE5VTUEgaW5mb3JtYXRpb24KPiBmcm9tIFNSQVQgYW5k
IFNMSVQgQUNQSSB0YWJsZXMuCj4gUGF0Y2ggNC80IGFkZCBjb3JyZXNwb25kaW5nIEFDUElfTlVN
QSBjb25maWcgZm9yIFJJU0MtViBLY29uZmlnLgo+Cj4gQmFzZWQtb246IGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi90cmVlL2Zvci1uZXh0Cj4KPiBbMV0gaHR0cHM6
Ly9tYW50aXMudWVmaS5vcmcvbWFudGlzL3ZpZXcucGhwP2lkPTI0MzMKPiBbMl0gaHR0cHM6Ly9n
aXRodWIuY29tL2FjcGljYS9hY3BpY2EvcHVsbC85MjYKPgo+IFRlc3Rpbmc6Cj4gU2luY2UgdGhl
IEFDUEkgQUlBL1BMSUMgc3VwcG9ydCBwYXRjaCBzZXQgaXMgc3RpbGwgdW5kZXIgdXBzdHJlYW0g
cmV2aWV3LAo+IGhlbmNlIGl0IGlzIHRlc3RlZCB1c2luZyB0aGUgcG9sbCBiYXNlZCBIVkMgU0JJ
IGNvbnNvbGUgYW5kIFJBTSBkaXNrLgo+IDEpIEJ1aWxkIGxhdGVzdCBRZW11IHdpdGggdGhlIGZv
bGxvd2luZyBwYXRjaCBiYWNrcG9ydGVkCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjQwMTI5MDk0MjAwLjM1ODEwMzctMS1oYWlibzEueHVAaW50ZWwuY29tLwo+ICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS92bHN1bmlsL3FlbXUvY29tbWl0LzQyYmQ0ZWVlZmQ1ZDQ0MTBhNjhmMDJk
NTRmZWU0MDZkOGExMjY5YjAKPgo+IDIpIEJ1aWxkIGxhdGVzdCBFREstSUkKPiAgICBodHRwczov
L2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxvYi9tYXN0ZXIvT3ZtZlBrZy9SaXNjVlZpcnQv
UkVBRE1FLm1kCj4KPiAzKSBCdWlsZCBMaW51eCB3aXRoIHRoZSBmb2xsb3dpbmcgY29uZmlncyBl
bmFibGVkCj4gICAgQ09ORklHX1JJU0NWX1NCSV9WMDE9eQo+ICAgIENPTkZJR19TRVJJQUxfRUFS
TFlDT05fUklTQ1ZfU0JJPXkKPiAgICBDT05GSUdfSFZDX1JJU0NWX1NCST15Cj4KPiA0KSBCdWls
ZCBidWlsZHJvb3Qgcm9vdGZzLmNwaW8KPgo+IDUpIExhdW5jaCB0aGUgUWVtdSBtYWNoaW5lCj4g
ICAgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtbm9ncmFwaGljIFwKPiAgICAtbWFjaGluZSB2aXJ0LHBm
bGFzaDA9cGZsYXNoMCxwZmxhc2gxPXBmbGFzaDEgLXNtcCA0IC1tIDhHIFwKPiAgICAtYmxvY2tk
ZXYgbm9kZS1uYW1lPXBmbGFzaDAsZHJpdmVyPWZpbGUscmVhZC1vbmx5PW9uLGZpbGVuYW1lPVJJ
U0NWX1ZJUlRfQ09ERS5mZCBcCj4gICAgLWJsb2NrZGV2IG5vZGUtbmFtZT1wZmxhc2gxLGRyaXZl
cj1maWxlLGZpbGVuYW1lPVJJU0NWX1ZJUlRfVkFSUy5mZCBcCj4gICAgLW9iamVjdCBtZW1vcnkt
YmFja2VuZC1yYW0sc2l6ZT00RyxpZD1tMCBcCj4gICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1y
YW0sc2l6ZT00RyxpZD1tMSBcCj4gICAgLW51bWEgbm9kZSxtZW1kZXY9bTAsY3B1cz0wLTEsbm9k
ZWlkPTAgXAo+ICAgIC1udW1hIG5vZGUsbWVtZGV2PW0xLGNwdXM9Mi0zLG5vZGVpZD0xIFwKPiAg
ICAtbnVtYSBkaXN0LHNyYz0wLGRzdD0xLHZhbD0zMCBcCj4gICAgLWtlcm5lbCBsaW51eC9hcmNo
L3Jpc2N2L2Jvb3QvSW1hZ2UgXAo+ICAgIC1pbml0cmQgYnVpbGRyb290L291dHB1dC9pbWFnZXMv
cm9vdGZzLmNwaW8gXAo+ICAgIC1hcHBlbmQgInJvb3Q9L2Rldi9yYW0gcm8gY29uc29sZT1odmMw
IGVhcmx5Y29uPXNiaSIKPgo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IFNSQVQ6IE5vZGUgMCBQWE0g
MCBbbWVtIDB4ODAwMDAwMDAtMHgxN2ZmZmZmZmZdCj4gWyAgICAwLjAwMDAwMF0gQUNQSTogU1JB
VDogTm9kZSAxIFBYTSAxIFttZW0gMHgxODAwMDAwMDAtMHgyN2ZmZmZmZmZdCj4gWyAgICAwLjAw
MDAwMF0gTlVNQTogTk9ERV9EQVRBIFttZW0gMHgxN2ZlM2JjNDAtMHgxN2ZlM2NmZmZdCj4gWyAg
ICAwLjAwMDAwMF0gTlVNQTogTk9ERV9EQVRBIFttZW0gMHgyN2ZmZjRjNDAtMHgyN2ZmZjVmZmZd
Cj4gLi4uCj4gWyAgICAwLjAwMDAwMF0gQUNQSTogTlVNQTogU1JBVDogUFhNIDAgLT4gSEFSVElE
IDB4MCAtPiBOb2RlIDAKPiBbICAgIDAuMDAwMDAwXSBBQ1BJOiBOVU1BOiBTUkFUOiBQWE0gMCAt
PiBIQVJUSUQgMHgxIC0+IE5vZGUgMAo+IFsgICAgMC4wMDAwMDBdIEFDUEk6IE5VTUE6IFNSQVQ6
IFBYTSAxIC0+IEhBUlRJRCAweDIgLT4gTm9kZSAxCj4gWyAgICAwLjAwMDAwMF0gQUNQSTogTlVN
QTogU1JBVDogUFhNIDEgLT4gSEFSVElEIDB4MyAtPiBOb2RlIDEKPgo+IEhhaWJvIFh1ICg0KToK
PiAgIEFDUElDQTogU1JBVDogQWRkIFJJU0MtViBSSU5UQyBhZmZpbml0eSBzdHJ1Y3R1cmUKPiAg
IEFDUEk6IE5VTUE6IEFkZCBoYW5kbGVyIGZvciBTUkFUIFJJTlRDIGFmZmluaXR5IHN0cnVjdHVy
ZQo+ICAgQUNQSTogUklTQ1Y6IEFkZCBOVU1BIHN1cHBvcnQgYmFzZWQgb24gU1JBVCBhbmQgU0xJ
VAo+ICAgQUNQSTogUklTQ1Y6IEVuYWJsZSBBQ1BJIGJhc2VkIE5VTUEKPgo+ICBhcmNoL3Jpc2N2
L0tjb25maWcgICAgICAgICAgICB8ICAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNw
aS5oIHwgIDE1ICsrKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgfCAgIDEgKwo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMgICAgICB8ICAgNSAtLQo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9hY3BpX251bWEuYyB8IDEzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgIHwgICA0ICstCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3NtcGJvb3QuYyAgIHwgICAyIC0KPiAgZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZyAg
ICAgfCAgIDIgKy0KPiAgZHJpdmVycy9hY3BpL251bWEvc3JhdC5jICAgICAgfCAgMzUgKysrKysr
KystCj4gIGluY2x1ZGUvYWNwaS9hY3RibDMuaCAgICAgICAgIHwgIDE4ICsrKystCj4gIGluY2x1
ZGUvbGludXgvYWNwaS5oICAgICAgICAgIHwgICA3ICsrCj4gIDExIGZpbGVzIGNoYW5nZWQsIDIw
OSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3Yva2VybmVsL2FjcGlfbnVtYS5jCj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
