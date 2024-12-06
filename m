Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4DE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzQFnwP2U/IpS2U8KC+WmYX/LioaJ5qOfvem97SlNC4=; b=4WLhAN6kpJqzbj
	hIzpY83sKyuQVzXlfIetbQb3ldB43hAxMJAP/Bmf44oXFDlKzVn2Vv/zb5GwcBGUC4AA3rM44XnFf
	vr5xbhecw4yTDPYQMprRATBDp6LsUNW7KKJ/Djmt7zy1LmLrEPA9EEx39RaeGfUtnLp9sLb7z6OWj
	7xuopz/c98vS1bRo92YtKVScCl5x1QbGeB3vSMWdwD9tRfbR2lSYF+G2FcAu6ImEO9oyBciZKKXl7
	qqIaC2laDvH5v2YshH50J76GDxV8Oj82t3menojBfuEyT00eSRaKY5DTeqXwiqv92kTDAPezINLZV
	T6ghnUclAVp/kr/FlNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUQs-0000000131b-1EoY;
	Fri, 06 Dec 2024 09:15:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUQj-000000012yO-1P6i
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 09:15:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa5500f7a75so245753566b.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 01:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733476519; x=1734081319; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Au0c93U93rO97NhYFvNIJEuWkXGIUe8cMu7IX3WeSgo=;
        b=UvWUGSYYiY8B5qiTLfrEM9VCpACQuKejbvokKn9pHm16A8D/FBOoIV3bFOIOqWS7Y1
         fe76T6GOcqn1SBtnjdBODfNwAASyIDOPMRPJ6dmaBRoWQ26HV3xWDgMXnZVhcFirgMrz
         l16f6VcLy26bnGCj7zMWr0yn++cYhrU4tfMDaWyFkodW6ASWt6KRBHKw6pxXa76NgATJ
         tt+zx3GRLr9hlYBYHQK3KYnrI6VyHZ/7W1+1sRYPxLUMw9Ou8MOZ6uF7+tVU/SNkxd3R
         kQ7kZaO+6kNgDS+RrKuxmCNCLpPCQjAXxU4mesm6wB7ZkRgW1ql23EXaeYF4Ohhr3jXD
         5u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476519; x=1734081319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Au0c93U93rO97NhYFvNIJEuWkXGIUe8cMu7IX3WeSgo=;
        b=LdI/FyCN21nrYsnG1+i841vM0Oc5PE5fihoJeNDeNpk0MNDTcY1+4mfIdoIofH30En
         S9cvSiYG5R/Rh7eM/uWJK2L6Y7l5XvzQnLUaO0BMrGy6VL3Jwck1IAu1pQnlKeAk/Tmk
         9Lp3s43QKTz5CbwCE9xyTLh40h0DZIm3lE5xbkbJwhbNdARjUzbqniLJgAqpaXbPRNX1
         D34Oh+1/RCVpPfQrKjktmC74f+0OM0IWO2hkIxmoMvIvoQKjhCi2pgKufVVHYq1EH2Zp
         W89Tcv6yLK6qiQgbOGuCUWKzYIdWIGuxZMhr6nB9OLXlIt5sFL6wTAfEm2DfuTroindL
         A/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWLrJR4fCrf9MGnaN0pqeee8tV60AhcbGiGoHGCVBVcHLIEukfpjR1gfb4gDC0+Jjrj5bLWY+LCD2/t6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1G6xaEHK8rQUHQ/scjVpXSSxYF86NhIdlrPWE1RcIcRq0t5w3
	eiQva+HXOIHZkHgvn6Q16PZOjN75uJ+QvvxHOmThAGwESB7lxPY/pPkOVTFe51U=
X-Gm-Gg: ASbGncszMoeUcOEjLsJAP6G/cUJ3NDFYhn1C8+aLPUXLk1v5kXPi08KI5zwiC/WNYFG
	Evf4MTHvGBPr+Sd9r1MLIbnXqplb9XdIy9pUaVS9NsGeQc9NtYI0ZWa/thD3IAw8aSbIgtd5kq4
	LEuDCpzo3qbjv5F36YG6ZpcMvIRdGQPYa70wzfv3UxilStWZLqNE6dPDZE/4iL+t81K3avjwc9D
	PZe95pW0XjyglDoJEIs4mGJKTRwqDOrwZ50hVGMAxWXwh1uqO0g4CJpMA66frv77wiXwHTno4HL
	TI7je+VTJkzzqxFHi/r0jMUvpa/ihJ1ZzcM=
X-Google-Smtp-Source: AGHT+IGFa1Atr4OTSCsAzRpYaF67QB8hLiL347alXT2Z9V7fGxdy2SCFDKjMEc++Bsu1YVhVj4AyXw==
X-Received: by 2002:a17:907:760c:b0:aa6:4114:8d89 with SMTP id a640c23a62f3a-aa641149194mr63819466b.53.1733476518826;
        Fri, 06 Dec 2024 01:15:18 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e5c764sm211634566b.20.2024.12.06.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:15:18 -0800 (PST)
Date: Fri, 6 Dec 2024 10:15:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4] riscv: selftests: Fix warnings pointer masking test
Message-ID: <20241206-6f0aafe057dc10df9a9e02a5@orel>
References: <20241205-fix_warnings_pointer_masking_tests-v4-1-0c77eb725486@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241205-fix_warnings_pointer_masking_tests-v4-1-0c77eb725486@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_011521_377737_871723AF 
X-CRM114-Status: GOOD (  24.34  )
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

T24gVGh1LCBEZWMgMDUsIDIwMjQgYXQgMDE6NDk6MzFQTSAtMDgwMCwgQ2hhcmxpZSBKZW5raW5z
IHdyb3RlOgo+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2ludGVyIG1hc2tpbmcgdGVzdHMgd2l0aCAt
V2FsbCB0aGlzIHdhcm5pbmcKPiBpcyBwcmVzZW50Ogo+IAo+IHBvaW50ZXJfbWFza2luZy5jOiBJ
biBmdW5jdGlvbiDigJh0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGzigJk6Cj4gcG9pbnRlcl9t
YXNraW5nLmM6MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3Jp
dGXigJkKPiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkg
Wy1XdW51c2VkLXJlc3VsdF0KPiAgIDIwMyB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEs
IDApOyB8Cj4gICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5j
OjIwODo5OiB3YXJuaW5nOgo+IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkg
ZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUKPiDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51
c2VkLXJlc3VsdF0KPiAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+
IAo+IEkgY2FtZSBhY3Jvc3MgdGhpcyBvbiByaXNjdjY0LWxpbnV4LWdudS1nY2MgKFVidW50dQo+
IDExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCj4gCj4gRml4IHRoaXMgYnkgY2hlY2tpbmcgdGhhdCB0
aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gZXF1YWwgdGhlIGV4cGVjdGVkCj4gbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4uCj4gCj4gRml4ZXM6IDc0NzBiNWFmZDE1MCAoInJpc2N2OiBzZWxmdGVz
dHM6IEFkZCBhIHBvaW50ZXIgbWFza2luZyB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4g
LSBTa2lwIHN5c2N0bF9lbmFibGVkIHRlc3QgaWYgZmlyc3QgcHdyaXRlIGZhaWxlZAo+IC0gTGlu
ayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1maXhfd2FybmluZ3Nf
cG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYzLTEtNWMyOGIwZjk2NDBkQHJpdm9zaW5jLmNvbQo+IAo+
IENoYW5nZXMgaW4gdjM6Cj4gLSBGaXggc3lzY3RsIGVuYWJsZWQgdGVzdCBjYXNlIChEcmV3L0Fs
ZXgpCj4gLSBNb3ZlIHB3cml0ZSBlcnIgY29uZGl0aW9uIGludG8gZ290byAoRHJldykKPiAtIExp
bmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdz
X3BvaW50ZXJfbWFza2luZ190ZXN0cy12Mi0xLTFiZjBjNTA5NWY1OEByaXZvc2luYy5jb20KPiAK
PiBDaGFuZ2VzIGluIHYyOgo+IC0gSSBoYWQgcmV0ICE9IDIgZm9yIHRlc3RpbmcsIEkgY2hhbmdl
ZCBpdCB0byBiZSByZXQgIT0gMS4KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVh
MWU5NjY1Y2U3YUByaXZvc2luYy5jb20KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
cmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tp
bmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcu
Ywo+IGluZGV4IGRlZTQxYjdlZTNlMy4uNzU5NDQ1ZDVmMjY1IDEwMDY0NAo+IC0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwo+ICsrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwo+IEBAIC0x
ODksNiArMTg5LDggQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZv
aWQpCj4gIHsKPiAgCWNoYXIgdmFsdWU7Cj4gIAlpbnQgZmQ7Cj4gKwlpbnQgcmV0Owo+ICsJY2hh
ciAqZXJyX3B3cml0ZV9tc2cgPSAiZmFpbGVkIHRvIHdyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFn
Z2VkX2FkZHJfZGlzYWJsZWRcbiI7Cj4gIAo+ICAJa3NmdF9wcmludF9tc2coIlRlc3RpbmcgdGFn
Z2VkIGFkZHJlc3MgQUJJIHN5c2N0bFxuIik7Cj4gIAo+IEBAIC0yMDAsMTggKzIwMiwzMiBAQCBz
dGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKPiAgCX0KPiAgCj4g
IAl2YWx1ZSA9ICcxJzsKPiAtCXB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiArCXJldCA9IHB3
cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiArCWlmIChyZXQgIT0gMSkgewo+ICsJCWtzZnRfdGVz
dF9yZXN1bHRfc2tpcChlcnJfcHdyaXRlX21zZyk7CgpJdCBzZWVtcyBsaWtlIHdlIHNob3VsZCBo
YXZlIGEgYmV0dGVyIHdheSB0byBrZWVwIHRoZSBjb3VudCBiYWxhbmNlZCB0aGFuCnRvIHJlcXVp
cmUgYSBrc2Z0X3Rlc3RfcmVzdWx0X3NraXAoKSBjYWxsIGZvciBlYWNoIHRlc3Qgb24gZWFjaCBl
cnJvcgpwYXRoLiBFdmVyeSB0aW1lIHdlIGFkZCBhIHRlc3Qgd2UnbGwgaGF2ZSB0byBnbyBhZGQg
c2tpcHMgZXZlcnl3aGVyZSBlbHNlLgoKPiArCQlnb3RvIGVycl9wd3JpdGU7Cj4gKwl9Cj4gKwo+
ICAJa3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUp
ID09IC1FSU5WQUwsCj4gIAkJCSAic3lzY3RsIGRpc2FibGVkXG4iKTsKPiAgCj4gIAl2YWx1ZSA9
ICcwJzsKPiAtCXB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiArCXJldCA9IHB3cml0ZShmZCwg
JnZhbHVlLCAxLCAwKTsKPiArCWlmIChyZXQgIT0gMSkKPiArCQlnb3RvIGVycl9wd3JpdGU7Cj4g
Kwo+ICAJa3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRy
dWUpID09IDAsCj4gIAkJCSAic3lzY3RsIGVuYWJsZWRcbiIpOwo+ICAKPiAgCXNldF90YWdnZWRf
YWRkcl9jdHJsKDAsIGZhbHNlKTsKPiAgCj4gIAljbG9zZShmZCk7Cj4gKwo+ICsJcmV0dXJuOwo+
ICsKPiArZXJyX3B3cml0ZToKPiArCWNsb3NlKGZkKTsKPiArCWtzZnRfdGVzdF9yZXN1bHRfZmFp
bChlcnJfcHdyaXRlX21zZyk7Cj4gIH0KCkkgZG9uJ3QgdGhpbmsgdGhlIGdvdG8gcmVkdWNlcyBt
dWNoIGNvZGUgb3IgaW1wcm92ZXMgcmVhZGFiaWxpdHkgbXVjaC4gQQp3cmFwcGVyIGZ1bmN0aW9u
IHNob3VsZCBkbyBiZXR0ZXIuIEkgd2FzIHRoaW5raW5nIHNvbWV0aGluZyBsaWtlCgogc3RhdGlj
IGJvb2wgcHdyaXRlX3dyYXBwZXIoaW50IGZkLCB2b2lkICpidWYsIHNpemVfdCBjb3VudCwgY29u
c3QgY2hhciAqbXNnKQogewogICBpbnQgcmV0ID0gcHdyaXRlKGZkLCBidWYsIGNvdW50LCAwKTsK
ICAgaWYgKHJldCAhPSBjb3VudCkgewogICAgICBrc2Z0X3BlcnJvcihtc2cpOwogICAgICByZXR1
cm4gZmFsc2U7CiAgIH0KICAgcmV0dXJuIHRydWU7CiB9CgoKIHZhbHVlID0gJzEnOwogaWYgKCFw
d3JpdGVfd3JhcHBlcihmZCwgJnZhbHVlLCAxLCAid3JpdGUgJzEnIikpCiAgICBrc2Z0X3Rlc3Rf
cmVzdWx0X2ZhaWwoLi4uKTsKCiB2YWx1ZSA9ICcwJzsKIGlmICghcHdyaXRlX3dyYXBwZXIoZmQs
ICZ2YWx1ZSwgMSwgIndyaXRlICcwJyIpKQogICAga3NmdF90ZXN0X3Jlc3VsdF9mYWlsKC4uLik7
CgoKPiAgCj4gIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3BtbGVuKGludCBwbWxl
bikKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVk
MDg4ZWNmMGIzNwo+IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFz
a2luZ190ZXN0cy0zODYwZTRmMzU0MjkKPiAtLSAKPiAtIENoYXJsaWUKPiAKClRoYW5rcywKZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
