Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F96DC02185
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lNWWazmozOqKHXvLn8+ai8CFWgLtePXf341A2GN0sI=; b=ctqc9DLTSeIAyX
	OcTAG8yAgH95E6CCliRuzgs3ye6ApZe1YvdPxg6H3evEYv1viwsARGYhaoovcKguMGyaEPnYrgFES
	cuCVpMlhTS9O5+tkht4VlA/j394k8uFRds/aqafgWuV+oucVBsTDQBABmN1D61jLrLJJ9gCtHS+yn
	x5TOqgs0J6YJICglHexlP1gsmfkd4E/hYozPGcBpkTWIlOP3UN33cHGn02VYLnpvQI8gp+KFWr5GP
	kcZ+N5a3qmxsKRMqScOBvSuttInTDmiWAnDRNajuJ9OneyTgtne5WFafcS0cyXcMmvayuIvod7jaY
	0qZiSOaoAF3etk4E30Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoqj-00000000ifs-22Vg;
	Fri, 17 Jan 2025 16:05:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoqS-00000000iYZ-053v
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 16:05:17 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862a921123so1619427f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737129914; x=1737734714; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KIKm+b7x8ZPOGG0s06oIRZ9t7O2YmNWgG+lZbVw+Ia8=;
        b=MhShNHhIXji2zNCVw1tXCCfzoGm69nxJlVM5bclE2gg+n4e9YklyqaMi4/fJ3evsPi
         NfouKCyHoCcH1Jhw7/tUdQw8TX3VU/zG3smi6smream91Ax36myg80BHs3nTYd/O2N2R
         ayscI9l3rylMKo0DKDzlAMp8jHYdWyKPUm3jhbo+nDrzblFqgKsVNIovcPexiosjJYX7
         jqqhsPe5UZBttspSUMnPEZXLqv+LwVK31WLlJCpsDX3p56r2lYKrhVFwk6Uzaqa3fl/Q
         qWWF30Li059vM4UsdEGyE/gY2bHn+tgFkc/BkMnpPo0UX9BX0Av5m8XxO4Upx4iaiiKZ
         pGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129914; x=1737734714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIKm+b7x8ZPOGG0s06oIRZ9t7O2YmNWgG+lZbVw+Ia8=;
        b=qc+HINbV5WdEtEtX8QNhnRCp/Xzo2QPpewA7f5m6jCW62GB2/3yo/a7RT43LNly0kF
         /cLeBW7L2RvnCLwZQ6132u7v6yJC63w5rSQ0cEJFjfweEFN5vBhFgzlUzQBiX62WSIKD
         7yyW7CHVL9AtnoERicGI2j4xm8/KM/sUQ0V+Glvyoba2TOXuZIjXKnM/pbGx1WR3YmjK
         V/1IBl6PcRqI7GStWGNVjZwDlPgPJXLhPpwKizVCFfWZrc0DF7XY9G5qLDXRqouHQhO4
         ZO5QbFu9p0ggXczOL9/CRrAyz0w9Uwk/xBa0gXAIG+n3ck2RrgCp4WSV+xzMntZhh6dh
         /yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnsD3GKgo1DO3bYwQQy/bodnQ1VqQ2MDJYVBvFM4GsqUmW4+qQYuh/4oEASvl9L4xA/YYEu9QGP5Kunw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKRFqpLpa+/4FPjSuVb0hxOsH2EVo5AqN7gyX00EBiJWJXSGny
	0C+B6b0iwEhwFiB4flB+xbmcdoa3bl4ao/KobnISRCEOVW3A6ZUXDiZ7dcKBOS8=
X-Gm-Gg: ASbGncuwZQ2MolsvmzIXgvph3JebmJGzHHMGyIFkgGBE8s6C9UTovHfoSTNSjP8PrWl
	m8DDiDY53VUmQ7cNSXRlaUFRDHbCNatRpIpIaGYP/k05oSNRl/21uKAqG1H1GLRRIRC4FwjpFk5
	OPPYOFDdkyDvGADN4vFanBvyUmDzcWpgaWl4XDk7n3449pHahodLIKnGobs33HKUsafHZWGCPGf
	Pe/H44LNEGxdvhcbN/vV5vAoft3Y1lDW9a1xgUQQVan87MIYcF8pFafkGU6YGVgszYh0nklpKIC
	B5ITbFlJHXBzAMv4tIoZgnbuVw==
X-Google-Smtp-Source: AGHT+IEo/qRGSopdNCymFI4uatmcJLeEtoysYWzXy3BlYUa/so7QnTZc8ShIOgGoZZx4+/0Qsn2jCA==
X-Received: by 2002:a5d:648a:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38bf57bfba2mr3199279f8f.45.1737129914326;
        Fri, 17 Jan 2025 08:05:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ac88sm2916424f8f.54.2025.01.17.08.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:05:13 -0800 (PST)
Message-ID: <dec723d7-fc16-4edb-b684-1844b08391ba@rivosinc.com>
Date: Fri, 17 Jan 2025 17:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-7-cleger@rivosinc.com>
 <b3f54d34-bc77-46db-88da-70c0c602081f@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <b3f54d34-bc77-46db-88da-70c0c602081f@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_080516_058010_A3E5FE24 
X-CRM114-Status: GOOD (  21.94  )
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

CgpPbiAxMS8wMS8yMDI1IDAwOjU1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPiBPbiAyMDI1LTAx
LTA2IDk6NDggQU0sIENsw6ltZW50IEzDqWdlciB3cm90ZToKPj4gU0JJX0ZXRlRfTUlTQUxJR05F
RF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRvIGRlbGVnYXRlCj4+IG1pc2Fs
aWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0b3JlIGl0IGR1cmluZyBD
UFUKPj4gbG9hZC9wdXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAg
ICAgfCAgMyArKysKPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdS5jCj4+IGluZGV4IDM0MjBhNGE2MmM5NC4uYmI2Zjc4OGQ0NmY1IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCj4+IEBAIC02NDEsNiArNjQxLDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+ICB7Cj4+ICAJdm9pZCAqbnNoOwo+PiAgCXN0cnVjdCBr
dm1fdmNwdV9jc3IgKmNzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPj4gKwlzdHJ1Y3Qga3Zt
X3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+YXJjaC5jZmc7Cj4+ICAKPj4gIAl2Y3B1LT5jcHUg
PSAtMTsKPj4gIAo+PiBAQCAtNjY2LDYgKzY2Nyw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiAgCQljc3ItPnZzdHZhbCA9IG5hY2xfY3NyX3JlYWQo
bnNoLCBDU1JfVlNUVkFMKTsKPj4gIAkJY3NyLT5odmlwID0gbmFjbF9jc3JfcmVhZChuc2gsIENT
Ul9IVklQKTsKPj4gIAkJY3NyLT52c2F0cCA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfVlNBVFAp
Owo+PiArCQljZmctPmhlZGVsZWcgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hFREVMRUcpOwo+
PiAgCX0gZWxzZSB7Cj4+ICAJCWNzci0+dnNzdGF0dXMgPSBjc3JfcmVhZChDU1JfVlNTVEFUVVMp
Owo+PiAgCQljc3ItPnZzaWUgPSBjc3JfcmVhZChDU1JfVlNJRSk7Cj4+IEBAIC02NzYsNiArNjc4
LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+ICAJ
CWNzci0+dnN0dmFsID0gY3NyX3JlYWQoQ1NSX1ZTVFZBTCk7Cj4+ICAJCWNzci0+aHZpcCA9IGNz
cl9yZWFkKENTUl9IVklQKTsKPj4gIAkJY3NyLT52c2F0cCA9IGNzcl9yZWFkKENTUl9WU0FUUCk7
Cj4+ICsJCWNmZy0+aGVkZWxlZyA9IGNzcl9yZWFkKENTUl9IRURFTEVHKTsKPj4gIAl9Cj4+ICB9
Cj4+ICAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+PiBpbmRleCA1NTQzM2U4MDViYWEuLjFlODVm
ZjY2NjZhZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+PiBAQCAtMTQsNiArMTQsOCBA
QAo+PiAgI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9zYmkuaD4KPj4gICNpbmNsdWRlIDxhc20va3Zt
X3ZjcHVfc2JpX2Z3ZnQuaD4KPj4gIAo+PiArI2RlZmluZSBNSVNfREVMRUcgKDFVTCA8PCBFWENf
TE9BRF9NSVNBTElHTkVEIHwgMVVMIDw8IEVYQ19TVE9SRV9NSVNBTElHTkVEKQo+PiArCj4+ICBz
dGF0aWMgY29uc3QgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0
dXJlc1tdID0gewo+PiAgCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+PiAgCVNCSV9G
V0ZUX0xBTkRJTkdfUEFELAo+PiBAQCAtMzUsNyArMzcsNDQgQEAgc3RhdGljIGJvb2wga3ZtX2Z3
ZnRfaXNfZGVmaW5lZF9mZWF0dXJlKGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGZlYXR1cmUpCj4+
ICAJcmV0dXJuIGZhbHNlOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRf
bWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+
ICt7Cj4+ICsJaWYgKCF1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSgpKQo+IAo+IFRoaXMgc2VlbXMg
bGlrZSB0aGUgd3JvbmcgY29uZGl0aW9uLiBQYXRjaCAyIHJlcXVlc3RzIGRlbGVnYXRpb24gcmVn
YXJkbGVzcyBvZgo+IHdoYXQgcHJvYmluZyBkZXRlY3RzLiBGb3IgTUlTQUxJR05FRF9TQ0FMQVJf
RkFTVCwgdGhlIGRlbGVnYXRpb24gbGlrZWx5IGRvZXNuJ3Q+IGNoYW5nZSBhbnkgYWN0dWFsIGJl
aGF2aW9yLCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBsaWtlbHkgbmV2ZXIgcmFpc2VzIHRoZQo+IGV4
Y2VwdGlvbi4gQnV0IGl0IGRvZXMgZW5zdXJlIE0tbW9kZSBuZXZlciBlbXVsYXRlcyBhbnl0aGlu
Zywgc28gaWYgdGhlCj4gZXhjZXB0aW9uIHdlcmUgdG8gb2NjdXIsIHRoZSBrZXJuZWwgaGFzIHRo
ZSBjaG9pY2Ugd2hldGhlciB0byBoYW5kbGUgaXQuIEFuZAo+IHRoaXMgbGV0cyB1cyBwcm92aWRl
IHRoZSBzYW1lIGd1YXJhbnRlZSB0byBLVk0gZ3Vlc3RzLiBTbyBJIHRoaW5rIHRoaXMgZmVhdHVy
ZQo+IHNob3VsZCBhbHNvIGJlIHN1cHBvcnRlZCBpZiB3ZSBzdWNjZXNzZnVsbHkgZGVsZWdhdGVk
IHRoZSBleGNlcHRpb24gb24gdGhlIGhvc3QKPiBzaWRlLgoKTm90IHN1cmUgdG8gY29tcGxldGVs
eSBmb2xsb3cgeW91IGhlcmUgYnV0IHBhdGNoIDIgYWN0dWFsbHkgZG9lcyB0aGUKcmV2ZXJzZSBv
ZiB3aGF0IHlvdSBzYWlkLiBXZSByZXF1ZXN0IGRlbGVnYXRpb24gZnJvbSBTQkkgKmJlZm9yZSoK
cHJvYmluZyBzbyB0aGF0IGFsbG93cyBwcm9iaW5nIHRvIHNlZSBpZiB3ZSAoa2VybmVsKSByZWNl
aXZlcyBtaXNhbGlnbmVkCmFjY2Vzc2VzIHRyYXBzIGFuZCB0aHVzIHNldCBNSVNBTElHTkVEX1ND
QUxBUl9FTVVMQVRFRC4KCkJ1dCBpZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5LCB5b3UgbWVhbiB0
aGF0IGd1ZXN0IGRlbGVnYXRpb24gc2hvdWxkCmFsc28gYmUgYXZhaWxhYmxlIHRvIGd1ZXN0IGlu
IGNhc2UgbWlzYWxpZ25lZCBhY2Nlc3Mgd2VyZSBkZWxlZ2F0ZWQgYnkKdGhlIFNCSSB0byB0aGUg
aG9zdCB3aGljaCBJIGFncmVlLiBJIHRoaW5rIHRoaXMgY29uZGl0aW9uIHNob3VsZCBiZQpyZXdv
cmtlZCB0byByZXBvcnQgdGhlIGRlbGVnYXRpb24gc3RhdHVzIGl0c2VsZiBhbmQgbm90IHRoZSBt
aXNhbGlnbmVkCmFjY2VzcyBzcGVlZCB0aGF0IHdhcyBkZXRlY3RlZAoKVGhhbmtzLAoKQ2zDqW1l
bnQKCgo+IAo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlyZXR1cm4gdHJ1ZTsKPj4gK30K
Pj4gKwo+PiArc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlv
bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+ICsJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29u
ZmlnICpjb25mLAo+PiArCQkJCQl1bnNpZ25lZCBsb25nIHZhbHVlKQo+PiArewo+PiArCWlmICh2
YWx1ZSA9PSAxKQo+PiArCQljc3Jfc2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+PiArCWVs
c2UgaWYgKHZhbHVlID09IDApCj4+ICsJCWNzcl9jbGVhcihDU1JfSEVERUxFRywgTUlTX0RFTEVH
KTsKPj4gKwllbHNlCj4+ICsJCXJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4+ICsKPj4g
KwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQga3ZtX3NiaV9m
d2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+PiAr
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPj4gKwkJCQkJdW5zaWduZWQg
bG9uZyAqdmFsdWUpCj4+ICt7Cj4+ICsJKnZhbHVlID0gKGNzcl9yZWFkKENTUl9IRURFTEVHKSAm
IE1JU19ERUxFRykgIT0gMDsKPj4gKwo+PiArCXJldHVybiBTQklfU1VDQ0VTUzsKPj4gK30KPj4g
Kwo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1td
ID0gewo+PiArCXsKPj4gKwkJLmlkID0gU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVMRUcsCj4+
ICsJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBv
cnRlZCwKPj4gKwkJLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9u
LAo+PiArCQkuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4+
ICsJfQo+IAo+IG5pdDogUGxlYXNlIGFkZCBhIHRyYWlsaW5nIGNvbW1hIGhlcmUgYXMgZnV0dXJl
IHBhdGNoZXMgd2lsbCBleHRlbmQgdGhlIGFycmF5Lgo+IAo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4g
Cj4+ICB9Owo+PiAgCj4+ICBzdGF0aWMgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
