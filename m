Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6897E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c/mlcUqJuuTIP3YVymFxlgW+SQAsc+6el9nKKN1420=; b=ZWUcsetRrNcgWw
	8WXscZJjmBaif5ELcT4b9T7DsOQmUX+4FY/Q9IIKKYTEtxcIpAWLJ9SIso4GM8p1JQTtaT2InQoNB
	h8zbApfALEM5qQgQMfsgfNC2TZ/tybkYsFDciwJL5j/DRPM4ruhu2b8I7+cmWFD9JJlSNpp84A3x9
	seLocGOtGYrVbpeR63N00CnTmwH/hnck6fvJ0Ht+ouTYWCkkkYt4M72MNozfDfc4d10+pvSYX+vZs
	fsN5I7oY4oLaqhNeFjFZawaVGr/Ykj1scuVaQJp2gPCfBtHDLJ+t4QKqSwMVs8jvGsR84YPhRt8ex
	Rrgswyc4F6j1seL6Xrpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppz4-00AlGG-1D;
	Mon, 09 Oct 2023 13:07:42 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppz1-00AlFQ-1H
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:07:40 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c18b0569b6so12833671fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696856855; x=1697461655; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TClY2bjuzp0oQfiTg2EZYUityMo+ODVekcdIVsrbGs=;
        b=ykIymz7o9Jo4J0IJaxHXuc8x1F3PPb8SooUx0bq2IOLwCHpbLk9eJWWS8eeH5Xunj0
         yiScMKO1IsOZJ0BafxILVZTt33ipWdrsrz3ZuYnCIhu8QMAW9AJngiuk0Upt4Vowa+So
         uP/z+1/INAgR9Id0gb3t5AJnLTs2/+N61DVAs/waRuN59JpqLnirjkjFacD3dSCnLjGj
         cobJqOPIjCiABhPvpJDoBZ4M5DjB1ItHCnFDJtB3z6i+6QJs39xt+4AZ6EzR2JZCjxfu
         cg3vwF/zCC/oXUCVm+8AaOMZeiMTroPlra11pl4ytZGnDaxj4qYHipPyeHXizCPLRv2D
         U68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856855; x=1697461655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TClY2bjuzp0oQfiTg2EZYUityMo+ODVekcdIVsrbGs=;
        b=BfX+EfRjCFjtSAmwBlMRfnj1qaBQ4igUxaJpDN3GmLS9nhGCSF7yUpzS4W0U+jPh/y
         Njk3B64qqH3ZnAB3yYJdlE/BUGP5KLxwsy5o9cDluOAyhqhlQp4nTQ+oMaMaazuwmuz4
         FZ+BoLmSy1lWPjw0UojWQWUb8XtqNN6jUPO3a4m7qBBZLjZS+kqhqN3RJs9kPp1zmKli
         P/zp80dsIbBbi3o1NETcL0kp1CUTuYu/oxmwmABywCl0AOM2S6hW5bn7YRxkBkyPm+IT
         n9IeEJ4On6RZMil68ukNESMCoYNEDQJpBvlq4jeGppp+6wKCuLYoej72L9ckK7k7irjO
         UpRA==
X-Gm-Message-State: AOJu0YzkYxZTrINyZetH4ZdwXUCJCpd3jPrx8VwFwWd3UUUWIgccNDVz
	JNvKe53RsYYdapvJjPUELBuKIj2LC5yJmDhqcmCl4Q==
X-Google-Smtp-Source: AGHT+IGqXAG+k8cnbfMkroNM8RcYmdVlpwhTIGff1+S35kvEf7V7BmcGQ3I4Rs948h8aTPP1zJihlA==
X-Received: by 2002:a5d:5592:0:b0:317:5f08:32a3 with SMTP id i18-20020a5d5592000000b003175f0832a3mr10768050wrv.6.1696856834196;
        Mon, 09 Oct 2023 06:07:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e? ([2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d6851000000b0031779a6b451sm9617794wrw.83.2023.10.09.06.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:07:13 -0700 (PDT)
Message-ID: <761f38c5-8bd2-40bf-a82c-120b5dbbd6ab@rivosinc.com>
Date: Mon, 9 Oct 2023 15:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] riscv: report misaligned accesses emulation to
 hwprobe
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski
 <cyrevolt@googlemail.com>, Conor Dooley <conor@kernel.org>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-8-cleger@rivosinc.com>
 <CALs-HstxNBag7g74XSMJ-qu_ihp4WzA+PV2mf0MDkaRF3gV33w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HstxNBag7g74XSMJ-qu_ihp4WzA+PV2mf0MDkaRF3gV33w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_060739_440158_9EF15F8C 
X-CRM114-Status: GOOD (  30.15  )
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

CgpPbiAwNC8xMC8yMDIzIDE4OjE0LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDQs
IDIwMjMgYXQgODoxNOKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4g
d3JvdGU6Cj4+Cj4+IGh3cHJvYmUgcHJvdmlkZXMgYSB3YXkgdG8gcmVwb3J0IGlmIG1pc2FsaWdu
ZWQgYWNjZXNzIGFyZSBlbXVsYXRlZC4gSW4KPj4gb3JkZXIgdG8gY29ycmVjdGx5IHBvcHVsYXRl
IHRoYXQgZmVhdHVyZSwgd2UgY2FuIGNoZWNrIGlmIGl0IGFjdHVhbGx5Cj4+IHRyYXBzIHdoZW4g
ZG9pbmcgYSBtaXNhbGlnbmVkIGFjY2Vzcy4gVGhpcyBjYW4gYmUgY2hlY2tlZCB1c2luZyBhbgo+
PiBleGNlcHRpb24gdGFibGUgZW50cnkgd2hpY2ggd2lsbCBhY3R1YWxseSBiZSB1c2VkIHdoZW4g
YSBtaXNhbGlnbmVkCj4+IGFjY2VzcyBpcyBkb25lIGZyb20ga2VybmVsIG1vZGUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0t
Cj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgfCAxOCArKysrKysrKysK
Pj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8ICA0ICsrCj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgICAgICAgfCAgMiArLQo+PiAgYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4+IGluZGV4IGQwMzQ1YmQ2NTljOS4u
ZTRhZTZhZjUxODc2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZl
YXR1cmUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+PiBA
QCAtMzIsNCArMzIsMjIgQEAgZXh0ZXJuIHN0cnVjdCByaXNjdl9pc2FpbmZvIGhhcnRfaXNhW05S
X0NQVVNdOwo+Pgo+PiAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBjcHUpOwo+Pgo+
PiArI2lmZGVmIENPTkZJR19SSVNDVl9NSVNBTElHTkVECj4+ICtib29sIHVuYWxpZ25lZF9jdGxf
YXZhaWxhYmxlKHZvaWQpOwo+PiArYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
KGludCBjcHUpOwo+PiArdm9pZCB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCh2b2lkKTsKPj4g
KyNlbHNlCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9p
ZCkKPj4gK3sKPj4gKyAgICAgICByZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGludCBjcHUpCj4+ICt7
Cj4+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHZv
aWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCkge30KPj4gKyNlbmRpZgo+PiArCj4+
ICAjZW5kaWYKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiBpbmRleCAzNTZlNTY3N2VlYjEuLmZi
YmRlODAwYmMyMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiBAQCAtNTY4LDYgKzU2
OCw5IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1KQo+PiAgICAgICAgIHZv
aWQgKnNyYzsKPj4gICAgICAgICBsb25nIHNwZWVkID0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1NMT1c7Cj4+Cj4+ICsgICAgICAgaWYgKGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQo
Y3B1KSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPj4gKwo+PiAgICAgICAgIHBhZ2UgPSBh
bGxvY19wYWdlcyhHRlBfTk9XQUlULCBnZXRfb3JkZXIoTUlTQUxJR05FRF9CVUZGRVJfU0laRSkp
Owo+PiAgICAgICAgIGlmICghcGFnZSkgewo+PiAgICAgICAgICAgICAgICAgcHJfd2FybigiQ2Fu
J3QgYWxsb2MgcGFnZXMgdG8gbWVhc3VyZSBtZW1jcHkgcGVyZm9ybWFuY2UiKTsKPj4gQEAgLTY0
OCw2ICs2NTEsNyBAQCB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoaW50IGNwdSkKPj4gIHN0
YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9vdF9jcHUodm9pZCkKPj4g
IHsKPj4gICAgICAgICBjaGVja191bmFsaWduZWRfYWNjZXNzKDApOwo+PiArICAgICAgIHVuYWxp
Z25lZF9lbXVsYXRpb25fZmluaXNoKCk7Cj4+ICAgICAgICAgcmV0dXJuIDA7Cj4+ICB9Cj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zbXBib290LmMKPj4gaW5kZXggMWI4ZGE0ZTQwYTRkLi41ZDk4NThkNmFkMjYgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zbXBib290LmMKPj4gQEAgLTI0NSw4ICsyNDUsOCBAQCBhc21saW5rYWdlIF9fdmlz
aWJsZSB2b2lkIHNtcF9jYWxsaW4odm9pZCkKPj4gICAgICAgICByaXNjdl9pcGlfZW5hYmxlKCk7
Cj4+Cj4+ICAgICAgICAgbnVtYV9hZGRfY3B1KGN1cnJfY3B1aWQpOwo+PiAtICAgICAgIHNldF9j
cHVfb25saW5lKGN1cnJfY3B1aWQsIDEpOwo+PiAgICAgICAgIGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3MoY3Vycl9jcHVpZCk7Cj4+ICsgICAgICAgc2V0X2NwdV9vbmxpbmUoY3Vycl9jcHVpZCwgMSk7
Cj4+Cj4+ICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+PiAgICAgICAgICAgICAgICAgaWYg
KHJpc2N2X3Zfc2V0dXBfdnNpemUoKSkKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
Ywo+PiBpbmRleCBiNWZiMWZmMDc4ZTMuLmQ5OWI5NTA4NGI2YyAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYwo+PiBAQCAtMTQsNiArMTQsOCBAQAo+PiAgI2luY2x1ZGUg
PGFzbS9wdHJhY2UuaD4KPj4gICNpbmNsdWRlIDxhc20vY3NyLmg+Cj4+ICAjaW5jbHVkZSA8YXNt
L2VudHJ5LWNvbW1vbi5oPgo+PiArI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+Cj4+ICsjaW5jbHVk
ZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4KPj4gICNkZWZpbmUgSU5TTl9NQVRDSF9MQiAgICAgICAg
ICAgICAgICAgIDB4Mwo+PiAgI2RlZmluZSBJTlNOX01BU0tfTEIgICAgICAgICAgICAgICAgICAg
MHg3MDdmCj4+IEBAIC0zOTYsNiArMzk4LDggQEAgdW5pb24gcmVnX2RhdGEgewo+PiAgICAgICAg
IHU2NCBkYXRhX3U2NDsKPj4gIH07Cj4+Cj4+ICtzdGF0aWMgYm9vbCB1bmFsaWduZWRfY3RsIF9f
cmVhZF9tb3N0bHk7Cj4+ICsKPj4gIC8qIHN5c2N0bCBob29rcyAqLwo+PiAgaW50IHVuYWxpZ25l
ZF9lbmFibGVkIF9fcmVhZF9tb3N0bHkgPSAxOyAgICAgICAvKiBFbmFibGVkIGJ5IGRlZmF1bHQg
Ki8KPj4KPj4gQEAgLTQwOSw2ICs0MTMsOCBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPj4KPj4gICAgICAgICBwZXJmX3N3X2V2ZW50KFBFUkZfQ09V
TlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7Cj4+Cj4+ICsgICAgICAgKnRo
aXNfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpID0gUklTQ1ZfSFdQUk9CRV9NSVNB
TElHTkVEX0VNVUxBVEVEOwo+PiArCj4+ICAgICAgICAgaWYgKCF1bmFsaWduZWRfZW5hYmxlZCkK
Pj4gICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4KPj4gQEAgLTU4NSwzICs1OTEsNTMgQEAg
aW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pgo+PiAg
ICAgICAgIHJldHVybiAwOwo+PiAgfQo+PiArCj4+ICtib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWQoaW50IGNwdSkKPj4gK3sKPj4gKyAgICAgICBsb25nICptYXNfcHRyID0gcGVy
X2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpOwo+PiArICAgICAgIHVuc2ln
bmVkIGxvbmcgdG1wX3ZhciwgdG1wX3ZhbDsKPj4gKyAgICAgICBib29sIG1pc2FsaWduZWRfZW11
X2RldGVjdGVkOwo+PiArCj4+ICsgICAgICAgKm1hc19wdHIgPSBSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfVU5LTk9XTjsKPj4gKwo+PiArICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPj4g
KyAgICAgICAgICAgICAgICIgICAgICAgIlJFR19MIiAlW3RtcF0sIDEoJVtwdHJdKVxuIgo+PiAr
ICAgICAgICAgICAgICAgOiBbdG1wXSAiPXIiICh0bXBfdmFsKSA6IFtwdHJdICJyIiAoJnRtcF92
YXIpIDogIm1lbW9yeSIpOwo+PiArCj4+ICsgICAgICAgbWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQg
PSAoKm1hc19wdHIgPT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEKTsKPj4gKyAg
ICAgICAvKgo+PiArICAgICAgICAqIElmIHVuYWxpZ25lZF9jdGwgaXMgYWxyZWFkeSBzZXQsIHRo
aXMgbWVhbnMgdGhhdCB3ZSBkZXRlY3RlZCB0aGF0IGFsbAo+PiArICAgICAgICAqIENQVVMgdXNl
cyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2VzcyBhdCBib290IHRpbWUuIElmIHRoYXQgY2hhbmdl
ZAo+PiArICAgICAgICAqIHdoZW4gaG90cGx1Z2dpbmcgdGhlIG5ldyBjcHUsIHRoaXMgaXMgc29t
ZXRoaW5nIHdlIGRvbid0IGhhbmRsZS4KPj4gKyAgICAgICAgKi8KPj4gKyAgICAgICBpZiAodW5s
aWtlbHkodW5hbGlnbmVkX2N0bCAmJiAhbWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQpKSB7Cj4+ICsg
ICAgICAgICAgICAgICBwcl9jcml0KCJDUFUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBub24gaG9tb2dl
bmVvdXMgKGV4cGVjdGVkIGFsbCBlbXVsYXRlZClcbiIpOwo+PiArICAgICAgICAgICAgICAgd2hp
bGUgKHRydWUpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNwdV9yZWxheCgpOwo+IAo+IFNv
IHRoZSBpZGVhIGlzIHRvIHNwaW4gbG9uZyBlbm91Z2ggdGhhdCB0aGUKPiB3YWl0X2Zvcl9jb21w
bGV0aW9uKCZjcHVfcnVubmluZywgMTAwMG1zKSB0aW1lcyBvdXQ/IE1heWJlIHRoZXJlCj4gc2hv
dWxkIGJlIGEgd2ZpKCkgaW4gaGVyZSBhcyB3ZWxsIHNvIHdlJ3JlIG5vdCBqdXN0IGJ1cm5pbmcg
d2hpdGUgaG90LgoKSGkgRXZhbiwKClllcyB0aGUgaWRlYSBpcyB0byBsZXQgdGhlIHRpbWVvdXQg
ZmFpbC4gV2UgY291bGQgcG90ZW50aWFsbHkgYWRkIHNvbWUKc2hhcmVkIHN0YXRlIHRvIHJlcG9y
dCBhbiBlcnJvciBkdXJpbmcgYnJpbmcgdXAgYW5kIHRodXMgbm90IHdhaXQgdXAgdG8KdGhlIHRp
bWVvdXQgZW5kLiBJJ2xsIGNoZWNrIHRoYXQuCgpSZWdhcmRpbmcgdGggd2ZpKCksIHRoZSBjcHVf
cmVsYXgoKSBjYWxsIGlzIGFjdHVhbGx5IG1lYW50IHRvIGRvIHRoYXQuCk9uIFJJU0MtViBpbXBs
ZW1lbnRhdGlvbiwgaXQgZW5kcyB1cCBvbiBhIHBhdXNlIGlmIFppaGludHBhdXNlIGlzIGF2YWls
YWJsZQoKPiBIYXZlIHlvdSB2ZXJpZmllZCB0aGF0IGlmIHdlIGdldCBoZXJlLCB0aGUgQ1BVIHdp
bGwgYWxzbyBnZXQgdGFrZW4KPiBiYWNrIGRvd24gYWZ0ZXIgdGhlIHRpbWVvdXQ/IEkgd29uZGVy
IGlmIF9fY3B1X3VwKCkgYWxzbyBuZWVkcyBhIGNhbGwKPiB0byBzdG9wIHRoZSBDUFUsIGluIHRo
ZSBjYXNlIHdoZXJlIHRoYXQgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkKPiB0aW1lcyBv
dXQuCgpJIGFjdHVhbGx5IGNoZWNrZWQgdGhhdCBpdCBpcyBub3QgYnJvdWdodCB1cCBidXQgbm90
IHRoZSBjb21wbGV0ZSBwYXRoCnRvIGNoZWNrIGlmIGl0IGlzIGNvcnJlY3RseSBicm91Z2h0IGRv
d24sIEknbGwgY2hlY2sgdGhhdC4KCj4gCj4gSXQgYWxzbyBtaWdodCBiZSBtb3JlIGludHVpdGl2
ZSB0byByZW9yZ2FuaXplIHRoaXMgc3VjaCB0aGF0IHRoZSBkZWF0aAo+IGxvb3AgaGFwcGVucyBp
biBzbXBfY2FsbGluKCksIGFzIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoKSBpcwo+
IG5vdCBhIGZ1bmN0aW9uIHlvdSdkIGV4cGVjdCBtaWdodCBzb21ldGltZXMgbmV2ZXIgcmV0dXJu
LgoKWWVzLCB0aGF0IG1ha2VzIHNlbnNlLgoKQ2zDqW1lbnQKCj4gCj4gLUV2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
