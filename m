Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F5CEACDD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bKWtjy08p2C6hAcuhLjYEBPzdOvn9F0/VWlLAEN1wk=; b=Gk8csHy+clmvQA
	JdEae+oVgkN8g8UKI/PZFUi4wEIDO+7VcXZ1IyvqfRGIcLIITgZVAItYPzEIvUrZpb0nqADhIbREc
	F1LqrK+0vIMyzt+n2vhVMt6SYEt0HfYJDvoYXn6Vt7y2xgp0u95BS3KBMbQis9SKeEoQwCP3/wnUL
	E205PRcKjsFn5E1F8N7MoauUFKDa/7n02GGpaHB/7yEYWH5wOqoQ6KxipH15eYQ1/pgcUeCGvEuq7
	hApFSQNCq2lNa9gl4FlUQGvyzVNIOeABDDzRh+hkIXC1ahNKo99PeikZzLMtqUZ09C7+qlrASe4Xb
	rdaPHdobMQ/GXvWAHa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svejy-00000003JnX-1nTI;
	Tue, 01 Oct 2024 15:24:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svejl-00000003Jm0-177Q
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 15:24:41 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9B4573F140
	for <linux-riscv@lists.infradead.org>; Tue,  1 Oct 2024 15:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727796264;
	bh=IfyD3J08rpFUiSXRGVfyNTQZMlD+U8b9QEj2MDOV6RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=wdt9lXqOJTT3WqCBVHdUXIfCN2P6GRcRZm99rSmrSL3DcAAuEE7bfkYR2lv3IC1jC
	 LMXztOlajxgslunrQ07nPkdKHGi5PyFB1IZTacyRUkcspFqlmbPy9O7DsyyyblPI4T
	 HrgM8C/wUx1kFyyVhVRY4HhmDtyCHZCxciAHLVhMWtIhvilJqqUjj/+N3u0VGkpRxd
	 hOMwCksO124Ob8W0wSr4rhR2FUlLRbPAL511XinNcfkakV8SIs0U+11fCLEb8tXVWY
	 lE99RLIGv4On99DZBlAwmVUDvvcjBMyq4Yypp9CI8Z4gn9Qwx4F7rWo7hzC6KG6HPu
	 a8m33PbKF920Q==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb08ed3a6so32842895e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 08:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727796264; x=1728401064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfyD3J08rpFUiSXRGVfyNTQZMlD+U8b9QEj2MDOV6RI=;
        b=BxHW5ROae7QVAsSqHoG0Junk1rBqQASdDow6NLU0zU2tv95irm6kkN09vNjDDGAbu5
         bPdkH+eCKlwaDw9eB3J5/PhwaRNzcn9LKlZNOl1gZtCld5dvvASJDQRkSZMVTu9fDvq8
         aGEV7IXDNhbnMnxFKJZtgqTl8XLEPOxBBJR3N8dASlzaRdPeH+/H8hVP2DFJCwW0xric
         YrgBI4RnP7NqCxsnoQEtTIWI8ErDYI+y24AmuWSU0EeW4zYtSKkd+lBvH0Pk0zuCjvUt
         CbDzrres96n+0zD4U17rvsJ5tKa1RuJ32lZhz3EgGN0bl3Ek50Dgp6jqvj/YJy+FrAgr
         xQEw==
X-Forwarded-Encrypted: i=1; AJvYcCWLszbOzWJJDJS3K9Er8+lDS+OpGQgnU0YhCbZjZB5K5CvtDFLmF2OhuJoZuPOuA0rO2Nn0JeuzV168jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YytY3gpqGlTZJ/wrq8MjgRq9ZKY00E/1C1PuFVthYxXxA2RSNVF
	fP8bQPAM4e17RFE/+dZtTZ6t/8pCCoHwdb5IkbHvbMP+7/QqrBjay9kDvNcnOknGfaBvk68p5BK
	7ZMecZX81bkySKE62V0/zGllVnkfmUpc/878aoXg2RjO2GSWzZLCh6VeY8YYK8qNbs5KeTr+MGW
	KEvAdR9w==
X-Received: by 2002:a05:600c:4686:b0:42f:6878:a68c with SMTP id 5b1f17b1804b1-42f7136168cmr23360685e9.13.1727796264174;
        Tue, 01 Oct 2024 08:24:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHrSnHUcpAuWIVTs8rbNU+pK4oUSWrI04JLpfK1vnvT+GLbyBxh3h1bUViQwuHwGkJjXDwg==
X-Received: by 2002:a05:600c:4686:b0:42f:6878:a68c with SMTP id 5b1f17b1804b1-42f7136168cmr23360415e9.13.1727796263594;
        Tue, 01 Oct 2024 08:24:23 -0700 (PDT)
Received: from [192.168.103.101] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cdddd86c7sm9461654f8f.26.2024.10.01.08.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 08:24:23 -0700 (PDT)
Message-ID: <811ea10e-3bf1-45a5-a407-c09ec5756b48@canonical.com>
Date: Tue, 1 Oct 2024 17:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
 <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_082429_817727_4C7FE4B5 
X-CRM114-Status: GOOD (  19.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDEuMTAuMjQgMTU6NTEsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBIZWlucmljaCwK
PiAKPiBPbiAyOS8wOS8yMDI0IDE2OjAyLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBU
aGUgSU1BR0VfRExMQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVCBpbmZvcm1zIHRoZSBmaXJtd2Fy
ZSB0aGF0IHRoZQo+PiBFRkkgYmluYXJ5IGRvZXMgbm90IHJlbHkgb24gcGFnZXMgdGhhdCBhcmUg
Ym90aCBleGVjdXRhYmxlIGFuZAo+PiB3cml0YWJsZS4KPj4KPj4gVGhlIGZsYWcgaXMgdXNlZCBi
eSBzb21lIGRpc3RybyB2ZXJzaW9ucyBvZiBHUlVCIHRvIGRlY2lkZSBpZiB0aGUgRUZJCj4+IGJp
bmFyeSBtYXkgYmUgZXhlY3V0ZWQuCj4+Cj4+IEFzIHRoZSBMaW51eCBrZXJuZWwgbmVpdGhlciBo
YXMgUldYIHNlY3Rpb25zIG5vciBuZWVkcyBSV1ggcGFnZXMgZm9yCj4+IHJlbG9jYXRpb24gd2Ug
c2hvdWxkIHNldCB0aGUgZmxhZy4KPj4KPj4gQ2M6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5l
bC5vcmc+Cj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTog
SGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+
PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TIHwgMiArLQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUyBiL2FyY2gvcmlzY3Yva2VybmVs
L2VmaS0gCj4+IGhlYWRlci5TCj4+IGluZGV4IDUxNWIyZGZiY2E3NS4uYzVmMTdjMjcxMGI1IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4+IEBAIC02NCw3ICs2NCw3IEBAIGV4dHJhX2hl
YWRlcl9maWVsZHM6Cj4+IMKgwqDCoMKgwqAgLmxvbmfCoMKgwqAgZWZpX2hlYWRlcl9lbmQgLSBf
c3RhcnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNpemVPZkhlYWRlcnMKPj4gwqDCoMKgwqDC
oCAubG9uZ8KgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8g
Q2hlY2tTdW0KPj4gwqDCoMKgwqDCoCAuc2hvcnTCoMKgwqAgSU1BR0VfU1VCU1lTVEVNX0VGSV9B
UFBMSUNBVElPTsKgwqDCoMKgwqDCoMKgIC8vIFN1YnN5c3RlbQo+PiAtwqDCoMKgIC5zaG9ydMKg
wqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gRGxsQ2hhcmFj
dGVyaXN0aWNzCj4+ICvCoMKgwqAgLnNob3J0wqDCoMKgIElNQUdFX0RMTF9DSEFSQUNURVJJU1RJ
Q1NfTlhfQ09NUEFUwqDCoMKgIC8vIAo+PiBEbGxDaGFyYWN0ZXJpc3RpY3MKPj4gwqDCoMKgwqDC
oCAucXVhZMKgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8g
U2l6ZU9mU3RhY2tSZXNlcnZlCj4+IMKgwqDCoMKgwqAgLnF1YWTCoMKgwqAgMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNpemVPZlN0YWNrQ29tbWl0Cj4+IMKgwqDC
oMKgwqAgLnF1YWTCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8vIFNpemVPZkhlYXBSZXNlcnZlCj4gCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIGlmIHRoaXMg
Zml4ZXMgc29tZXRoaW5nIG9yIG5vdDogd2hhdCBjb3VsZCBnbyB3cm9uZyAKPiBpZiB3ZSBkb24n
dCBkbyB0aGlzPwo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4gCgoKSGVsbG8gQWxleGFuZHJlLAoK
aHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29tL2VuLXVzL3dpbmRvd3MtaGFyZHdhcmUvZHJpdmVy
cy9icmluZ3VwL3VlZmktY2EtbWVtb3J5LW1pdGlnYXRpb24tcmVxdWlyZW1lbnRzCmRlc2NyaWJl
cyBNaWNyb3NvZnQncyBlZmZvcnQgdG8gaW1wcm92ZSBzZWN1cml0eSBieSBhdm9pZGluZyBtZW1v
cnkgCnBhZ2VzIHRoYXQgYXJlIGJvdGggZXhlY3V0YWJsZSBhbmQgd3JpdGFibGUuCgpJTUFHRV9E
TExfQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVCBpcyBhbiBhc3NlcnRpb24gYnkgdGhlIEVGSSBi
aW5hcnkgCnRoYXQgaXQgZG9lcyBub3QgdXNlIFJXWCBwYWdlcy4gSXQgbWF5IHVzZSB0aGUgCkVG
SV9NRU1PUllfQVRUUklCVVRFX1BST1RPQ09MIHRvIHNldCB3aGV0aGVyIGEgcGFnZSBpcyB3cml0
YWJsZSBvciAKZXhlY3V0YWJsZSAoYnV0IG5vdCBib3RoKS4KCldoZW4gdXNpbmcgc2VjdXJlIGJv
b3QsIGNvbXBsaWFudCBmaXJtd2FyZSB3aWxsIG5vdCBhbGxvdyBsb2FkaW5nIGEgCmJpbmFyeSBp
ZiB0aGUgZmxhZyBpcyBub3Qgc2V0LgoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
