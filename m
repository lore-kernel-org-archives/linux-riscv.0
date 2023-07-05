Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FA7EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnWTQhkMLtd0G7R6REVeL2EoaPJx7Da3d8LJAGUgCpI=; b=RIpSi+LAf1mOXZ
	kdVwfSL9UWlMGWCc5YbVGLMhBtIVv3RhMqUVZI/M7IIZR1fG03kTHvI0CvbnzdwLeZxf1bNCZWJ1B
	WccDXjdoYLwZ5tIVqOye+e4jjXSSobIlZsTnl28G+HrF64f7jlQwCQMfCILGGYLzemykt4kcK6cnP
	szFPv29k/w3zYTXG+LwtHQDlju/oF6ktFvbnQEopvS/h9OAj/VRmjj3uRu++Ig0KO9XcyPkhk8fSk
	YlFPJVKrDIyVLJcxDs84/G7R1DjsRd2Bp0dP3CSbUWvzFk1w0J8xpAMUn/+4dOBfB8G8FFfkhPyns
	MOpaxReZzfJZEwOZvyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1hT-00FtXV-1y;
	Wed, 05 Jul 2023 12:33:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1hP-00FtVm-1s
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 12:33:37 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6b74b37fbe0so5546445a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688560411; x=1691152411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LR5nJlzSRPDG5ofy0aeeBS76bGKl8nBInZ83Recr1mE=;
        b=EGqN4BJ35V/PWrnpXYXSsjhXZJ6SpCydbRmzvka9w5W5BkC/4L2MtkTY+lGRb08nQ+
         0FdNUqrwQvqVkXLlvDmQFBz2hvdfcB1qusNTmg6l80lWoXBMq41RFcPsV/72+edkZwMT
         nlJmkHdkznCTwewlL6W5/ZYgHGZ0UzXQSdA9/F0f2p94O5qi7lHJ4E48O4CtCDrmSIcr
         ugY1AxJYMQ//CnjzRfxNP0FgqaLKAz3+vWW+pMmQoFDhR7c/6Vq/WMKLyQokMCOcpU6K
         XCXTOGEtkNplwiJIbtPriRjShp+X//JYaxz3x3EoKtD3wIiw42+fdDS7cVDcd3JMHbhJ
         H8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688560411; x=1691152411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LR5nJlzSRPDG5ofy0aeeBS76bGKl8nBInZ83Recr1mE=;
        b=lvPNc6/0tzCtwm7lrh0BSOVXPh6eATT83MVU/LKVG+Lrfu83+EwucWuKByLuetbX03
         /JrWUiYW5mK5PVGGFKCiL0heQc7DSWyPRT82hLLszW5WrFTT1PP+7mciqXpNBNGQVui/
         uyeh1SrCCG01wovOu4YMM45rSD7q0eiblJC0sqW0LKwZkJMm/Qi5Ml+32klqFsz6SvXa
         p8UbbnjSp+xg0wLPGvWowy6kWRVAp+BguqvKlDZFboTjVXgXm7u5SxgniIiz0WW5VlTU
         j8EY3tOtEfyPl61Xh5jRo34F/Yw9O4PRQ8V2Ogr0H8CJS3hcvzfhWUjO+LQxRMLAmPvc
         Y5aw==
X-Gm-Message-State: ABy/qLYiMoy1MojW6h9xAd3v11mFDSXPure0jgL+twZbS54EaR5ga5R1
	qMLiP1QxCTCC9csZswIceD14y6QWGGyMzOsUess=
X-Google-Smtp-Source: APBJJlEe5QmRWbFe5VvIhyfS9BgapEugI1LCUwQgs5avsaFH2pSWRL/is1SOBUd5xM6pBjobABfIwQ==
X-Received: by 2002:a05:6870:40cc:b0:1a2:cfd7:bfd0 with SMTP id l12-20020a05687040cc00b001a2cfd7bfd0mr21543911oal.9.1688560411568;
        Wed, 05 Jul 2023 05:33:31 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id bc30-20020a056820169e00b00565ebacf9cfsm4511309oob.33.2023.07.05.05.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:33:31 -0700 (PDT)
Message-ID: <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
Date: Wed, 5 Jul 2023 09:33:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Content-Language: en-US
To: Alexandre Ghiti <alex@ghiti.fr>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, ajones@ventanamicro.com
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_053335_627789_B1C8EEF6 
X-CRM114-Status: GOOD (  22.44  )
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

CgpPbiA3LzUvMjMgMDk6MTgsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiAKPiBPbiAwNS8wNy8y
MDIzIDExOjE1LCBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSB3cm90ZToKPj4gS1ZNIHVzZXJzcGFj
ZXMgbmVlZCB0byBiZSBhd2FyZSBvZiB0aGUgaG9zdCBTQVRQIHRvIGFsbG93IHRoZW0gdG8KPj4g
YWR2ZXJ0aXNlIGl0IGJhY2sgdG8gdGhlIGd1ZXN0IE9TLgo+Pgo+PiBTaW5jZSB0aGlzIGluZm9y
bWF0aW9uIGlzIHVzZWQgdG8gYnVpbGQgdGhlIGd1ZXN0IEZEVCB3ZSBjYW4ndCB3YWl0IGZvcgo+
IAo+IAo+IFRoZSB0aGluZyBpcyB0aGUgIm1tdS10eXBlIiBwcm9wZXJ0eSBpbiB0aGUgRkRUIGlz
IG5ldmVyIHVzZWQ6IHRoZSBrZXJuZWwgd2lsbCBwcm9iZSB0aGUgaGFyZHdhcmUgYW5kIGNob29z
ZSB0aGUgbGFyZ2VzdCBhdmFpbGFibGUgbW9kZSwgb3IgdXNlICJubzRsdmwiLyJubzVsdmwiIGZy
b20gdGhlIGNvbW1hbmQgbGluZSB0byByZXN0cmljdCB0aGlzIG1vZGUuIEFuZCBGWUkgdGhlIGN1
cnJlbnQgbW9kZSBpcyBleHBvc2VkIHRocm91Z2ggY3B1aW5mby4gQENvbm9yIENhbiB3ZSBkZXBy
ZWNhdGUgdGhpcyBub2RlIG9yIHNvbWV0aGluZyBzaW1pbGFyPwo+IAo+IEp1c3QgYSByZW1hcmss
IG5vdCBzdXJlIHRoYXQgaGVscHMgOikKCkl0IGRvZXMsIHRoYW5rcy4gSSBhbSBhd2FyZSB0aGF0
IHRoZSBjdXJyZW50IG1vZGUgaXMgZXhwb3NlZCB0aHJvdWdoIGNwdWluZm8uCm12ZW5kb3JpZC9t
YXJjaGlkL21pbXBpZCBpcyBhbHNvIGV4cG9zZWQgdGhlcmUuIEFzIGZhciBhcyBJIHVuZGVyc3Rh
bmQgd2Ugc2hvdWxkCnJlbHkgb24gS1ZNIHRvIHByb3ZpZGUgYWxsIENQVSByZWxhdGVkIGluZm8g
dG8gY29uZmlndXJlIGEgdmNwdSB0aG91Z2guCgpBIGxpdHRsZSBiYWNrZ3JvdW5kIG9mIHdoZXJl
IEknbSBjb21pbmcgZnJvbS4gT25lIG9mIHRoZSBRRU1VIEtWTSBjcHUgdHlwZXMgKGhvc3QpCmRv
ZXNuJ3QgaGF2ZSBhbiBhc3NpZ25lZCBzYXRwX21vZGUuIFRoZSBGRFQgY3JlYXRpb24gb2YgdGhl
ICd2aXJ0JyBib2FyZCByZWxpZXMgb24KdGhhdCBpbmZvIGJlaW5nIHByZXNlbnQsIGFuZCB0aGUg
cmVzdWx0IGlzIHRoYXQgdGhlIGJvYXJkIHdpbGwgc2VnZmF1bHQuIEkgc2VudCBhCmZpeCBmb3Ig
aXQgdGhhdCBJIGhvcGUgd2lsbCBiZSBxdWV1ZWQgc2hvcnRseToKCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA2MzAxMDA4MTEuMjg3MzE1LTMtZGJhcmJvemFAdmVudGFu
YW1pY3JvLmNvbS8KClRodXMsIGlmIGl0J3MgZGVjaWRlZCB0aGF0IHRoZSBzYXRwX21vZGUgRkRU
IGlzIGRlcHJlY2F0ZWQsIHdlIGNhbiBpZ25vcmUgdGhpcwpwYXRjaCBhbHRvZ2V0aGVyLiBUaGFu
a3MsCgoKRGFuaWVsCgoKPiAKPiAKPj4gdGhlIFNBVFAgcmVnIHRvIGJlIHJlYWRhYmxlLiBXZSBq
dXN0IG5lZWQgdG8gcmVhZCB0aGUgU0FUUCBtb2RlLCB0aHVzCj4+IHdlIGNhbiB1c2UgdGhlIGV4
aXN0aW5nICdzYXRwX21vZGUnIGdsb2JhbCB0aGF0IHJlcHJlc2VudHMgdGhlIFNBVFAgcmVnCj4+
IHdpdGggTU9ERSBzZXQgYW5kIGJvdGggQVNJRCBhbmQgUFBOIGNsZWFyZWQuIEUuZy4gZm9yIGEg
MzIgYml0IGhvc3QKPj4gcnVubmluZyB3aXRoIHN2MzIgc2F0cF9tb2RlIGlzIDB4ODAwMDAwMDAs
IGZvciBhIDY0IGJpdCBob3N0IHJ1bm5pbmcKPj4gc3Y1NyBzYXRwX21vZGUgaXMgMHhhMDAwMDAw
MDAwMDAwMDAwLCBhbmQgc28gb24uCj4+Cj4+IEFkZCBhIG5ldyB1c2Vyc3BhY2UgdmlydHVhbCBj
b25maWcgcmVnaXN0ZXIgJ3NhdHBfbW9kZScgdG8gYWxsb3cKPj4gdXNlcnNwYWNlIHRvIHJlYWQg
dGhlIGN1cnJlbnQgU0FUUCBtb2RlIHRoZSBob3N0IGlzIHVzaW5nIHdpdGgKPj4gR0VUX09ORV9S
RUcgQVBJIGJlZm9yZSBzcGlubmluZyB0aGUgdmNwdS4KPj4KPj4gJ3NhdHBfbW9kZScgY2FuJ3Qg
YmUgY2hhbmdlZCB2aWEgS1ZNLCBzbyBTRVRfT05FX1JFRyBpcyBhbGxvd2VkIGFzIGxvbmcKPj4g
YXMgdXNlcnNwYWNlIHdyaXRlcyB0aGUgZXhpc3RpbmcgJ3NhdHBfbW9kZScuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBIZW5yaXF1ZSBCYXJib3phIDxkYmFyYm96YUB2ZW50YW5hbWljcm8u
Y29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaMKgwqDCoMKgwqAg
fCAyICsrCj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwo+PiDC
oCBhcmNoL3Jpc2N2L2t2bS92Y3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3ICsrKysr
KysKPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaAo+PiBpbmRleCBiNmFjYjdlZDExNWYuLmJlNmU1YzMwNWU1YiAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oCj4+IEBAIC00Niw2ICs0Niw3IEBACj4+IMKgICNpZm5kZWYgQ09ORklHXzY0
QklUCj4+IMKgICNkZWZpbmUgU0FUUF9QUE7CoMKgwqAgX0FDKDB4MDAzRkZGRkYsIFVMKQo+PiDC
oCAjZGVmaW5lIFNBVFBfTU9ERV8zMsKgwqDCoCBfQUMoMHg4MDAwMDAwMCwgVUwpCj4+ICsjZGVm
aW5lIFNBVFBfTU9ERV9TSElGVMKgwqDCoCAzMQo+PiDCoCAjZGVmaW5lIFNBVFBfQVNJRF9CSVRT
wqDCoMKgIDkKPj4gwqAgI2RlZmluZSBTQVRQX0FTSURfU0hJRlTCoMKgwqAgMjIKPj4gwqAgI2Rl
ZmluZSBTQVRQX0FTSURfTUFTS8KgwqDCoCBfQUMoMHgxRkYsIFVMKQo+PiBAQCAtNTQsNiArNTUs
NyBAQAo+PiDCoCAjZGVmaW5lIFNBVFBfTU9ERV8zOcKgwqDCoCBfQUMoMHg4MDAwMDAwMDAwMDAw
MDAwLCBVTCkKPj4gwqAgI2RlZmluZSBTQVRQX01PREVfNDjCoMKgwqAgX0FDKDB4OTAwMDAwMDAw
MDAwMDAwMCwgVUwpCj4+IMKgICNkZWZpbmUgU0FUUF9NT0RFXzU3wqDCoMKgIF9BQygweGEwMDAw
MDAwMDAwMDAwMDAsIFVMKQo+PiArI2RlZmluZSBTQVRQX01PREVfU0hJRlTCoMKgwqAgNjAKPj4g
wqAgI2RlZmluZSBTQVRQX0FTSURfQklUU8KgwqDCoCAxNgo+PiDCoCAjZGVmaW5lIFNBVFBfQVNJ
RF9TSElGVMKgwqDCoCA0NAo+PiDCoCAjZGVmaW5lIFNBVFBfQVNJRF9NQVNLwqDCoMKgIF9BQygw
eEZGRkYsIFVMKQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4+IGluZGV4IGY5Mjc5MGM5
NDgxYS4uMDQ5M2MwNzhlNjRlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4+
IEBAIC01NCw2ICs1NCw3IEBAIHN0cnVjdCBrdm1fcmlzY3ZfY29uZmlnIHsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIG1hcmNoaWQ7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBtaW1w
aWQ7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB6aWNib3pfYmxvY2tfc2l6ZTsKPj4gK8Kg
wqDCoCB1bnNpZ25lZCBsb25nIHNhdHBfbW9kZTsKPj4gwqAgfTsKPj4gwqAgLyogQ09SRSByZWdp
c3RlcnMgZm9yIEtWTV9HRVRfT05FX1JFRyBhbmQgS1ZNX1NFVF9PTkVfUkVHICovCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4g
aW5kZXggOGJkOWYyYThhMGI5Li5iMzFhY2Y5MjM4MDIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gQEAgLTMxMyw2
ICszMTMsOSBAQCBzdGF0aWMgaW50IGt2bV9yaXNjdl92Y3B1X2dldF9yZWdfY29uZmlnKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwKPj4gwqDCoMKgwqDCoCBjYXNlIEtWTV9SRUdfUklTQ1ZfQ09ORklH
X1JFRyhtaW1waWQpOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnX3ZhbCA9IHZjcHUtPmFyY2gu
bWltcGlkOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgY2FzZSBLVk1f
UkVHX1JJU0NWX0NPTkZJR19SRUcoc2F0cF9tb2RlKToKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ192
YWwgPSBzYXRwX21vZGUgPj4gU0FUUF9NT0RFX1NISUZUOwo+PiArwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+IMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+PiDCoMKgwqDCoMKgIH0KPj4gQEAgLTM5NSw2ICszOTgsMTAgQEAgc3RhdGljIGlu
dCBrdm1fcmlzY3ZfdmNwdV9zZXRfcmVnX2NvbmZpZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUJVU1k7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNl
IEtWTV9SRUdfUklTQ1ZfQ09ORklHX1JFRyhzYXRwX21vZGUpOgo+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKHJlZ192YWwgIT0gKHNhdHBfbW9kZSA+PiBTQVRQX01PREVfU0hJRlQpKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+PiDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4gwqDCoMKgwqDCoCB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
