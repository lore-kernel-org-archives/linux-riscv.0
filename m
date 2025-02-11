Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1314C021A0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 04:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWEytxL0zp7SOI6ZncyLxHN0gtD1LiFBz6cbP09NGx8=; b=plhOxwN4pM9LUk
	C8uW/xfi9Y0VvMMjrYuKoNAd8sPDdA9/aFdYJ9hiZH2xAh8/CCAOJ4G6bYJVyippA6eRqAWl/R0+a
	ZFY4IOGyatpUfEZn5fJ9Y0VvSGd/P7BYNoAq5fHlddXghdlExSyEaVy6RDGAVY65sgrE+9kL/GCOK
	wBf3sYvOBNIS9A5FqgamUgYX8TNmn+SE+oAFDqqAhtowBjNYr6ZpUo0LF8868LwFWymMygkj7z3HG
	QJoN3mw8EJy6wwvNMGzOYK5Sa/b2xFQmoijMAKrFWdalgW+K3MXpr5ICmazLaR/9OGrccm5ZaEa9A
	MGF78WzKNseF07TAo+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhvy-00000002Uvn-1I0V;
	Tue, 11 Feb 2025 04:31:42 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhvv-00000002Uuf-1PlE
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 04:31:40 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-855370e0de6so34923639f.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739248298; x=1739853098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uk7QCT1ibthTmG31kgz2RQ3fd9RFf43i5AcvZcwTxN4=;
        b=CqesEPaMjarZRr31bYPsiQSlV8S1j803BP7MAfdc0+x9sPCuRZAOnRbgGOpao1v2NP
         UDW4gv9Acb7DVgzevCq1oetBUEF1mebspygjTLtZT/NkoLJpMoXdHGw/M60u5xOmUYrY
         6LhE5C+7phQbc/PLvtgPURv0nXcRa9VRoZjYOFCC+0mjQ5aTAEbZ4s3UVL7zg3eS3bjz
         w7jjp06PsaTdrKcxdX2bYsHPqaBcXU2ftUtVStcUBS0n3yjO/90rqMXcru3gx9efRW85
         1L8z/CiRCv12+fEclcSCZtZ64ZycvdS1jm9clpIacLRLwZIpypezbRSJNuagH0L4YBAf
         N8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248298; x=1739853098;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uk7QCT1ibthTmG31kgz2RQ3fd9RFf43i5AcvZcwTxN4=;
        b=d+0Fi85uAuyXxWQab3iSZUf21rZb8VcyO5ZBf9H7ERXvDtbT0w3SurHAjcd0Gvr6eo
         1vskHsYWl97NPlZF5AQNaEawudUVSayh/Rhnz3glmk4krnRdk+E1uLBqQgVK5JcfLnGz
         azFQ9slai6hGcBZA2Q9L5SPuAHmPuTzGQ/0gQUCHAI7xfM1iyL3i57Mt36UiQMG6sfrd
         /48suDNeN/ZCvdIm1uftDYnS21xkj15izwa18wVOi8Lv9Qwursnp3edBYUfJ+D3OM2eU
         Stb+Vs+u5Tha76LHeZNrjaR/R/NrlMqjmjtYmxFHy472uFyrPDBvlW2OSACZJ/SF5sLL
         rvXA==
X-Forwarded-Encrypted: i=1; AJvYcCUaB0eGHClm2sif1ELl4fROSFM6i2lPnrU0FFOSpb/BzHp5jO2SWqIdkqDHx4O1eRDz5LVcxk5mV4Nk8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgZ5hfp4zwWBR0LOt2MvxZT6wMgTuOWHKguYJvqesS2iCNu1p7
	5mYIMtzE6gFivG0FLF95B4ngi3bk2RQwZOVlwe6sylbjgqvUohQhBpCIUBtTXzc=
X-Gm-Gg: ASbGncu7V6a5gH/IsWWkov5ES4kKiqH6xEqcdBK+fqwx7a6FAVtbMQgQkw8MM18Skdu
	+CcaR0zKR8mXjty4Yd8GNQc1rFqQ8aPBElvHc/ewPalW2kiS6UqA6b+CZGPyS+9YPBLDAfHsU1V
	vTS1V51n2gKBYaKHWo8uH0YiaJw2aKF9ChnyaC+uV+rQ1N/t0bGKs9vY5BsMGE+sDIoBy/W6Rho
	Po0fGbQ+aHljPS7M2ikl8E5BYyUcpOtzT/VmPXvBmbMQ2qTWgZyGJMp875Q5M9KjKrvf63L2I6C
	weyov+QA+lpDaW0tTaDaeFRHZZ4rsDxhN0S/bIA=
X-Google-Smtp-Source: AGHT+IHEmCDuHZ+8uB9f8GDunxYoBJjA1XFOTU/tpz/O0tguykq12oFATdzw1dCWB2rK39lLH2IaZg==
X-Received: by 2002:a05:6602:3946:b0:84a:5201:41ff with SMTP id ca18e2360f4ac-854fd886d54mr1422323839f.3.1739248297943;
        Mon, 10 Feb 2025 20:31:37 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ecdb903a89sm2110916173.70.2025.02.10.20.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 20:31:37 -0800 (PST)
Message-ID: <6223225b-a7cf-452d-ae69-d895b5f23d62@sifive.com>
Date: Mon, 10 Feb 2025 22:31:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
To: Deepak Gupta <debug@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-2-cleger@rivosinc.com>
 <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <Z6rMtBud/hsKYYIw@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_203139_383483_D33290AF 
X-CRM114-Status: GOOD (  13.68  )
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

SGkgRGVlcGFrLAoKT24gMjAyNS0wMi0xMCAxMDowNiBQTSwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+
IE9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDEwOjM1OjM0UE0gKzAxMDAsIENsw6ltZW50IEzDqWdl
ciB3cm90ZToKPj4gVGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFk
ZGVkIGFzIHBhcnQgb2YgdGhlIFNCSSAzLjAKPj4gc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZp
bml0aW9ucyB0byB1c2UgdGhpcyBleHRlbnNpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+PiBUZXN0ZWQtYnk6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+PiAtLS0KPj4gYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaCB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
PiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
Pj4gaW5kZXggM2QyNTA4MjQxNzhiLi5kMzczYjVjMDgwMzkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaAo+PiBAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewo+PiDCoMKgwqDCoFNC
SV9FWFRfREJDTiA9IDB4NDQ0MjQzNEUsCj4+IMKgwqDCoMKgU0JJX0VYVF9TVEEgPSAweDUzNTQ0
MSwKPj4gwqDCoMKgwqBTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRDLAo+PiArwqDCoMKgIFNCSV9F
WFRfRldGVCA9IDB4NDY1NzQ2NTQsCj4+Cj4+IMKgwqDCoMKgLyogRXhwZXJpbWVudGFscyBleHRl
bnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCj4+IMKgwqDCoMKgU0JJX0VYVF9F
WFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLAo+PiBAQCAtNDAyLDYgKzQwMywzMyBAQCBl
bnVtIHNiaV9leHRfbmFjbF9mZWF0dXJlIHsKPj4gI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVU
X1goX19pKcKgwqDCoMKgwqDCoMKgICgoX19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKPj4gI2Rl
ZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1hfTEFTVMKgwqDCoMKgwqDCoMKgIDMxCj4+Cj4+ICsv
KiBTQkkgZnVuY3Rpb24gSURzIGZvciBGVyBmZWF0dXJlIGV4dGVuc2lvbiAqLwo+PiArI2RlZmlu
ZSBTQklfRVhUX0ZXRlRfU0VUwqDCoMKgwqDCoMKgwqAgMHgwCj4+ICsjZGVmaW5lIFNCSV9FWFRf
RldGVF9HRVTCoMKgwqDCoMKgwqDCoCAweDEKPj4gKwo+PiArZW51bSBzYmlfZndmdF9mZWF0dXJl
X3Qgewo+PiArwqDCoMKgIFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHwqDCoMKgwqDCoMKg
wqAgPSAweDAsCj4+ICvCoMKgwqAgU0JJX0ZXRlRfTEFORElOR19QQUTCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgID0gMHgxLAo+PiArwqDCoMKgIFNCSV9GV0ZUX1NIQURPV19TVEFDS8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPSAweDIsCj4+ICvCoMKgwqAgU0JJX0ZXRlRfRE9VQkxFX1RSQVDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgID0gMHgzLAo+PiArwqDCoMKgIFNCSV9GV0ZUX1BURV9BRF9IV19VUERB
VElOR8KgwqDCoMKgwqDCoMKgID0gMHg0LAo+PiArwqDCoMKgIFNCSV9GV0ZUX1BPSU5URVJfTUFT
S0lOR19QTUxFTsKgwqDCoMKgwqDCoMKgID0gMHg1LAo+PiArwqDCoMKgIFNCSV9GV0ZUX0xPQ0FM
X1JFU0VSVkVEX1NUQVJUwqDCoMKgwqDCoMKgwqAgPSAweDYsCj4+ICvCoMKgwqAgU0JJX0ZXRlRf
TE9DQUxfUkVTRVJWRURfRU5EwqDCoMKgwqDCoMKgwqAgPSAweDNmZmZmZmZmLAo+PiArwqDCoMKg
IFNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJUwqDCoMKgwqDCoMKgwqAgPSAweDQwMDAwMDAw
LAo+PiArwqDCoMKgIFNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX0VORMKgwqDCoMKgwqDCoMKgID0g
MHg3ZmZmZmZmZiwKPj4gKwo+PiArwqDCoMKgIFNCSV9GV0ZUX0dMT0JBTF9SRVNFUlZFRF9TVEFS
VMKgwqDCoMKgwqDCoMKgID0gMHg4MDAwMDAwMCwKPj4gK8KgwqDCoCBTQklfRldGVF9HTE9CQUxf
UkVTRVJWRURfRU5EwqDCoMKgwqDCoMKgwqAgPSAweGJmZmZmZmZmLAo+PiArwqDCoMKgIFNCSV9G
V0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVMKgwqDCoMKgwqDCoMKgID0gMHhjMDAwMDAwMCwKPj4g
K8KgwqDCoCBTQklfRldGVF9HTE9CQUxfUExBVEZPUk1fRU5EwqDCoMKgwqDCoMKgwqAgPSAweGZm
ZmZmZmZmLAo+PiArfTsKPj4gKwo+PiArI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJF
X0JJVMKgwqDCoMKgwqDCoMKgICgxIDw8IDMwKQo+PiArI2RlZmluZSBTQklfRldGVF9HTE9CQUxf
RkVBVFVSRV9CSVTCoMKgwqDCoMKgwqDCoCAoMSA8PCAzMSkKPj4gKwo+PiArI2RlZmluZSBTQklf
RldGVF9TRVRfRkxBR19MT0NLwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCAwKQo+PiArCj4+
IC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCj4+ICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lP
Tl9ERUZBVUxUwqDCoMKgIDB4MQo+PiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJ
RlTCoMKgwqAgMjQKPj4gQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBzYmlfZXh0X25hY2xfZmVh
dHVyZSB7Cj4+ICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUQVJURUQgLTcKPj4gI2RlZmluZSBT
QklfRVJSX0FMUkVBRFlfU1RPUFBFRCAtOAo+PiAjZGVmaW5lIFNCSV9FUlJfTk9fU0hNRU3CoMKg
wqAgLTkKPj4gKyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFwqDCoMKgIC0xMAo+PiArI2Rl
ZmluZSBTQklfRVJSX0JBRF9SQU5HRcKgwqDCoCAtMTEKPj4gKyNkZWZpbmUgU0JJX0VSUl9USU1F
T1VUwqDCoMKgwqDCoMKgwqAgLTEyCj4gCj4gbml0OiBTcGFjZSBtaXMtYWxpZ25lZCheKcKgwqDC
oCBeCgpUaGUgYWxpZ25tZW50IGlzIGNvcnJlY3Qgd2hlbiB0aGUgcGF0Y2ggaXMgYXBwbGllZC4g
SXQgb25seSBsb29rcyB3cm9uZyBpbiB0aGUKcGF0Y2ggYmVjYXVzZSB0aGUgIisiIGZyb20gdGhl
IHVuaWZpZWQgZGlmZiBmb3JtYXQgY2F1c2VzIGFuIG92ZXJmbG93IHRvIHRoZQpuZXh0IHRhYiBz
dG9wLgoKUmVnYXJkcywKU2FtdWVsCgo+IG90aGVyd2lzZQo+IFJldmlld2VkLWJ5OiBEZWVwYWsg
R3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAKPj4gKyNkZWZpbmUgU0JJX0VSUl9JT8KgwqDC
oMKgwqDCoMKgIC0xMwo+PiArI2RlZmluZSBTQklfRVJSX0RFTklFRF9MT0NLRUTCoMKgwqAgLTE0
Cj4+Cj4+IGV4dGVybiB1bnNpZ25lZCBsb25nIHNiaV9zcGVjX3ZlcnNpb247Cj4+IHN0cnVjdCBz
YmlyZXQgewo+PiAtLcKgCj4+IDIuNDcuMgo+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
