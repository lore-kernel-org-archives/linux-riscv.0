Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FBDCD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojkc8O8Vsf3hlpzVLK46TBsRl3r/pdY3zeyPhjZZaDM=; b=x2+onOVm/guA+a
	n/ULEZQsvJBqlyPCGo0tIFzAKpW2+eCNtkasrKVW1dXCyRx+m1e5XtTe9ReGa/n5EdfbQCCn+gVlk
	o5QTwt7H87KISvDlN7JVN/G42OeiKF+ohbnB9DAWgeNXt/suEGAo0AXRKzHF64vLy7fy8GCQXVfnQ
	q+t3W0Ne/JoYyPmfGiDwSJVzYa031CFdiPSu3b+09BnZncw0vkef/4AChVA1FapdkhOdtpiUisILO
	vuF4UsX8NzfUkakFUUFtCNv/RpUyCpBC22Ofge/hbCHfrZyrp43rrYR/Hvmbbty1f7nNMFy8BNY1P
	L+E4ZI17qCHT7S6ArO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqQ4-0000000BFkH-0Vac;
	Thu, 11 Apr 2024 09:08:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqQ0-0000000BFhV-1Dw2
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:08:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-343c8d7064aso1432911f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712826506; x=1713431306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOkU8Fav8POJ1zZSx8brCh9PpnPTKPCkgjyKz/gc6Gs=;
        b=qrZkPzcWOHn8dRwfq2neU0lU9796OyoWIv6z/TRgi5RtR2azj2+bLnXrvWwc1EYm4X
         4+69mxCMsMQbwomgW0DCywWMFI1vuMfEDCMu56GpIC7n4gPZC/fxZUi3Uux+si+pNgvn
         IFdQi6Pyd4jo1Wx/nxHvT5PZjYRNGFCJb1vOFSdpNrUIpc3xo7jSr1cYeJEXQMBEPQQ7
         4gGhfnogY3SXf8DrlM4v32xweugW3pHZsSmt7YJWzyh02r+SScQQMPH3uKJRKUuW7F4J
         cCaET9JjvzHrOICe+4FuzgfZaXbB2ESy8jXoDE+8qANClolDkOTwnBZ2hAUNS8K2H3ML
         BcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826506; x=1713431306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOkU8Fav8POJ1zZSx8brCh9PpnPTKPCkgjyKz/gc6Gs=;
        b=lBsWubC+x8suZcPp9+qbOIlIifdObhRNLWDd3QaJfkRa6S5xJPHAr3TtlV0IqjeSYa
         VEI4YW8KcJuGL6L2KvmPr4bkI8DkMvQj3hbu8mFeyLF7T5FJIWKXo0Qi1Qyar6CW8CCN
         s5HnAV6NpAOeGg0P06GCjwPgR0TTyfg6pEJddq16Dc+NmaB3sPBruHQJALHPD/yavH5v
         Fn6Qe53CfsH9d2ZlIZNOY/R0YHEc96wqkCmz7XEWazOHilnpx4l5jAuLxVEiSxd6xev1
         Bf5d21UMzZbwBiNpOJqTlLgajBNskEELTIzxHuKl1YRY3PnkeukRm4R1Qu5lDzS4P0yg
         JTuA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBRL/hgvFYoPDRdb5a7GxktG4mFxtciK0yQyOpb6aTngJ1c9FTS7w/9A5K1lJ/VlOdrcnMURf+7y8QLJsE9LbraNNpXM9/nkKAMhVWf1a
X-Gm-Message-State: AOJu0YwhaokzXVWHOc7JVIbr+9z1DpGwRYdzJN1lIviUFw0rfcIpErDs
	N9SMUsPsYFH/TWgALtiXEQp8EslpfD1HCRcoZ7Ay/QN+IMeh37y9T21pRNUQvTc=
X-Google-Smtp-Source: AGHT+IHXtbYSxVoeF1iBnVllermG43pnzwZlaqvMoeMWvagnUB6+O9nYBZ7rJSRJ0T7NS/Gwu/LqZg==
X-Received: by 2002:a05:600c:1c01:b0:416:5339:d114 with SMTP id j1-20020a05600c1c0100b004165339d114mr3502727wms.1.1712826506067;
        Thu, 11 Apr 2024 02:08:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3624:d9b3:4998:d76b? ([2a01:e0a:999:a3a0:3624:d9b3:4998:d76b])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b00414688af147sm4896372wmq.20.2024.04.11.02.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:08:22 -0700 (PDT)
Message-ID: <c86f9fa8-e273-4509-83fa-f21d3265d5c9@rivosinc.com>
Date: Thu, 11 Apr 2024 11:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
 <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
 <20240411-superglue-errant-b32e5118695f@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240411-superglue-errant-b32e5118695f@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_020828_513717_64D27993 
X-CRM114-Status: GOOD (  19.69  )
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

CgpPbiAxMS8wNC8yMDI0IDExOjAzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTEsIDIwMjQgYXQgMDk6MjU6MDZBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAxMS8wNC8yMDI0IDAwOjMyLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+PiBPbiBXZWQs
IEFwciAxMCwgMjAyNCBhdCAxMToyNzoxNlBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+
Pj4gT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMTE6MTY6MTFQTSArMDEwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAwMjozMjo0MVBNIC0wNzAwLCBE
ZWVwYWsgR3VwdGEgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAxMToxMTow
MEFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4+Pj4gQWRkIHBhcnNpbmcgZm9y
IFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdAo+Pj4+Pj4+
IGI4NTRhNzA5YzAwICgiWmNtb3AgaXMgcmF0aWZpZWQvMS4wIikgb2YgdGhlIHJpc2N2LWlzYS1t
YW51YWwuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oIHwgMSArCj4+Pj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
IHwgMSArCj4+Pj4+Pj4gMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4g
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+PiBpbmRleCBiNzU1MWJhZDM0
MWIuLmNmZjc2NjBkZTI2OCAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
Pj4+Pj4+PiBAQCAtODYsNiArODYsNyBAQAo+Pj4+Pj4+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
Q0LCoMKgwqDCoMKgwqDCoCA3Nwo+Pj4+Pj4+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0TCoMKg
wqDCoMKgwqDCoCA3OAo+Pj4+Pj4+ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0bCoMKgwqDCoMKg
wqDCoCA3OQo+Pj4+Pj4+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNNT1DCoMKgwqDCoMKgwqDC
oCA4MAo+Pj4+Pj4+Cj4+Pj4+Pj4gI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGR8Kg
wqDCoCAxMjcKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKPj4+Pj4gYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4+Pj4+
PiBpbmRleCAwOWRlZTA3MTI3NGQuLmYxNDUwY2Q3MjMxZSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKPj4+Pj4+PiBAQCAtMjY1LDYgKzI2NSw3IEBAIGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEKPj4+Pj4gcmlzY3ZfaXNhX2V4dFtdID0gewo+Pj4+Pj4+IMKg
wqDCoMKgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjYiwgUklTQ1ZfSVNBX0VYVF9aQ0IpLAo+Pj4+
Pj4+IMKgwqDCoMKgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjZCwgUklTQ1ZfSVNBX0VYVF9aQ0Qp
LAo+Pj4+Pj4+IMKgwqDCoMKgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpjZiwgUklTQ1ZfSVNBX0VY
VF9aQ0YpLAo+Pj4+Pj4+ICvCoMKgwqAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemNtb3AsIFJJU0NW
X0lTQV9FWFRfWkNNT1ApLAo+Pj4+Pj4KPj4+Pj4+IEFzIHBlciBzcGVjIHpjbW9wIGlzIGRlcGVu
ZGVudCBvbiB6Y2EuIFNvIHBlcmhhcHMgYmVsb3cgPwo+Pj4+Pj4KPj4+Pj4+IF9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVCh6aWNib3osIFJJU0NWX0lTQV9FWFRfWkNNT1AsCj4+Pj4+IFJJU0NWX0lT
QV9FWFRfWkNBKQo+Pj4+Pgo+Pj4+PiBXaGF0J3MgemljYm96IGdvdCB0byBkbyB3aXRoIGl0LCBj
b3B5LXBhc3RvIEkgZ3Vlc3M/Cj4+Pgo+Pj4gWWVzLCBjb3B5LXBhc3RhIDotKQo+Pj4KPj4+Pj4g
SWYgd2UncmUgZ29ubmEgaW1wbHkgc3R1ZmYgbGlrZSB0aGlzIHRob3VnaCBJIHRoaW5rIHdlIG5l
ZWQgc29tZQo+Pj4+PiBjb21tZW50cyBleHBsYWluaW5nIHdoeSBpdCdzIG9rYXkuCj4+Pj4KPj4+
PiBBbHNvLCBJJ20gaW5jbGluZWQgdG8gY2FsbCB0aGF0IG91dCBzcGVjaWZpY2FsbHkgaW4gdGhl
IGJpbmRpbmcsIEkndmUKPj4+PiBub3QgeWV0IGNoZWNrZWQgaWYgZGVwZW5kZW5jaWVzIGFjdHVh
bGx5IHdvcmsgZm9yIGVsZW1lbnRzIG9mIGEgc3RyaW5nCj4+Pj4gYXJyYXkgbGlrZSB0aGUgZG8g
Zm9yIGluZGl2aWR1YWwgcHJvcGVydGllcy4gSSdsbCB0b2RvIGxpc3QgdGhhdC4uCj4+Pgo+Pj4g
RWFybGllciBleGFtcGxlcyBvZiBzcGVjaWZ5aW5nIGRlcGVuZGVuY3kgb24gZW52Y2ZnIGFjdHVh
bGx5IGhhZCBmdW5jdGlvbmFsCj4+PiB1c2UgY2FzZS4KPj4+IFNvIHlvdSBhcmUgcmlnaHQsIEkg
YW0gbm90IHN1cmUgaWYgaXRzIGFjdHVhbGx5IG5lZWRlZCBpbiB0aGlzCj4+PiBwYXJ0aWN1bGFy
IGNhc2UuCj4+Cj4+IEkgYWN0dWFsbHkgc2F3IHRoYXQgYW5kIHRoaW5rIGFib3V0IGFkZHJlc3Np
bmcgaXQgYnV0IEFGQUlDVCwgdGhpcwo+PiBzaG91bGQgYmUgaGFuZGxlZCBieSB0aGUgbWFjaGlu
ZSBmaXJtd2FyZSBwYXNzaW5nIHRoZSBpc2Egc3RyaW5nIHRvIHRoZQo+PiBrZXJuZWwgKGllLCBp
dCBzaG91bGQgYmUgdmFsaWQpLiBJbiB0aGUgY2FzZSBvZiBRRU1VLCBpdCB0YWtlcyBjYXJlIG9m
Cj4+IHNldHRpbmcgdGhlIGV4dGVuc2lvbiB0aGF0IGFyZSByZXF1aXJlZCBieSB0aGlzIGV4dGVu
c2lvbiBpdHNlbGYuCj4+Cj4+IElmIHdlIGNvbnNpZGVyIHRvIGhhdmUgcG90ZW50aWFsbHkgYnJv
a2VuIGlzYSBzdHJpbmcgKGllIGV4dGVuc2lvbnMKPj4gZGVwZW5kZW5jaWVzIG5vdCBjb3JyZWN0
bHkgaGFuZGxlZCksIHRoZW4gd2UnbGwgbmVlZCBzb21lIHdheSB0bwo+PiB2YWxpZGF0ZSB0aGlz
IHdpdGhpbiB0aGUga2VybmVsLgo+IAo+IE5vLCB0aGUgRFQgcGFzc2VkIHRvIHRoZSBrZXJuZWwg
c2hvdWxkIGJlIGNvcnJlY3QgYW5kIHdlIGJ5IGFuZCBsYXJnZSB3ZQo+IHNob3VsZCBub3QgaGF2
ZSB0byBkbyB2YWxpZGF0aW9uIG9mIGl0LiBXaGF0IEkgbWVhbnQgYWJvdmUgd2FzIHdyaXRpbmcK
PiB0aGUgYmluZGluZyBzbyB0aGF0IHNvbWV0aGluZyBpbnZhbGlkIHdpbGwgbm90IHBhc3MgZHRi
c19jaGVjay4KCkFja2VkLCBJIHdhcyBtYWlubHkgYW5zd2VyaW5nIERlZXBhayBxdWVzdGlvbiBh
Ym91dCBkZXBlbmRlbmNpZXMgd3J0IHRvCnVzaW5nIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCgp
IHdoaWNoIGRvZXMgbm90IHNlZW1zIHRvIGJlIHJlbGV2YW50CnNpbmNlIHdlIGV4cGVjdCBhIGNv
cnJlY3QgaXNhIHN0cmluZyB0byBiZSBwYXNzZWQuIEJ1dCBhcyB5b3Ugc3RhdGVkLCBEVAp2YWxp
ZGF0aW9uIGNsZWFybHkgbWFrZSBzZW5zZS4gSSB0aGluayBhIGxvdCBvZiBleHRlbnNpb25zIHN0
cmluZ3Mgd291bGQKYmVuZWZpdCBzdWNoIHN1cHBvcnQgKEFsbCB0aGUgWnYqIGRlcGVuZHMgb24g
ViwgZXRjKS4KCkNsw6ltZW50CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
