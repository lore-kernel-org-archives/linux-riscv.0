Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F478C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 05:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLQcB1pFjgB5slqXMyo7RdWWHuIdK1ZJKNv4i8HMJ8U=; b=up5qCF1nvVDlT8
	UULRQlVNSw+gvL+we+C0PXvi4ZKEmDZR3CaKxibtLtZ2ruvr+pcW9e8lW+dG4ionZik1trHQaE9A3
	8C+KSieVNO3aEhoKVBfCIb2HutaAOg1sXk14EJQmIperkIg6A1qRWxdoNEro6KsiyGnAUhYwVReeF
	+8qByoZADnUvRqQGnxJEWucio9knTG5SVyK1b8iBYdnuk8rnwOg132DAAUwYWOepN9pemhVnSZFXS
	iBcRd5sQFh7a0trCUq/sxexDB+9e/nLUgBPw3441kZNqXNqNZRxbikN3BxrCw/YyEl999efiKuQpW
	3WIARyO74z7z5AVbBVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPkR-00000004kSm-47k7;
	Tue, 18 Mar 2025 05:44:19 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuPkP-00000004kRN-018V
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 05:44:18 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2260c91576aso32036095ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276656; x=1742881456; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PjJyZg36ViwqvSldxrB9EBP1m7xv7NYMkTSh+jaEjw=;
        b=X7uzupJUD+x4JNybYPi/vHtrUZps36AxUZVx6UCjnKyPFuRiqaALznhl/VIRXZkCvl
         O4IZ2l0Ck4DauDTay8mqcR2UPVx2B2WI5dhi44xTUawrhtageaZTP0e3HVMqAgU0AUiH
         YRSQTjQ0AUCE6HV1hQvthzBPjPtUmlmkJXXUcKOzLkcYMZx3axy1sFdqfsTQ3kz/FrvG
         M9v8fOk03lpjindjk2iz2hC5BBpNCnxlspR6gbGrcjx/O4EjmqfF8eOv82WM7p7dzgYG
         fiHR/bWF805tjUtI38sUvTDVr8aaJct0lanjHOteykvUN2L3yv9krgbjTgOEkBmug2nd
         pEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276656; x=1742881456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PjJyZg36ViwqvSldxrB9EBP1m7xv7NYMkTSh+jaEjw=;
        b=ZL9G+e/RJ9oIr16ZoK5A+SEE+eqnIXHDYwBzkdtlgqMA+nxsIVvclwwMJYPF6SLSar
         X9gdfCsIb/4mD85r5JIkn9jJ/IaMeipRPUHbfbTvhyBMDh+lKT0iWY+57oQHjFB4f+Ls
         3RUX88+IjoeT/eUUso9CjmZ75lVyHOcrXr52dDjyft4fj3LiTLs73aThS+AY2xoOSr1f
         TJWa4kItWyGyBMBB+Z/zCzH4S8NXzXrGj6fYIBAswHW8QcAfLZDogC5NVixkEU57+aH6
         BmgZyVrvhjE+ZSJEyCKS/S6/rINd8FlmYZd5cGrnsfh3VXLFGihWVsJkvbqF1R41F5WD
         gmSg==
X-Forwarded-Encrypted: i=1; AJvYcCXkeCQ9CM2bEDXvq+RAtSaMjtc6HmcNM34xEyB2KhxoC6t4D6kbaCJkYdfWFgA9MkHRWtdbE2ve3WbP3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwZIITrB2NduUZc71+Ai0CJHe/oVwa/25RPE2H7oWGY58Tms2O
	nTR0vwwG+ZXMP7iI3s1sXtClrLSkJ6dXbv7xC63dxmsTWE01ey7JXsm9gBhCAGnsrQ==
X-Gm-Gg: ASbGnctm37DP0nircVh+SjYcmeNvIYObceTmis1iZVKVLt0NvzTxBW3cgKsJMv+XKI6
	zByDHyznUWef1UCweV71TSMegQhvRnZ2sTqAnF1F+/6kEG7U7qk07vmp5AXnXrGOOPEl0I419Vn
	FXuygUGjnR6OL/m09m3NiiSnJ/1qNhnDwys+DeDx+VEVpnI0apP8iS9P/IjLnCc3N5l3M2+VCnk
	SegAXDXRP25RPibHxruldOSq0kmQNY3MSo4nPd54CYf2U1efikbyz6kTj7lInCFxsVrkLpDeZSn
	sd21ZBC6UPPW1gsFgGQZkJCsm0Ul4+sLcQ==
X-Google-Smtp-Source: AGHT+IEG4+hnkrP/C2d3aMrojCXyVkPU61K+TAm8adcwhXu+66VTKGntSE5/7EnwZH0/VFjuGJm+Xg==
X-Received: by 2002:a17:903:228d:b0:21f:61a9:be7d with SMTP id d9443c01a7336-225e0b195fbmr207827245ad.49.1742276655724;
        Mon, 17 Mar 2025 22:44:15 -0700 (PDT)
Received: from [192.168.5.101] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4df4sm85134265ad.240.2025.03.17.22.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 22:44:15 -0700 (PDT)
Message-ID: <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
Date: Tue, 18 Mar 2025 13:44:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Alex Elder <elder@ieee.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_224417_043384_6DBF8A43 
X-CRM114-Status: GOOD (  31.75  )
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

Ck9uIDIwMjUvMy8xOCAwNTo0MiwgQWxleCBFbGRlciB3cm90ZToKPiBPbiAzLzE2LzI1IDI6NDMg
QU0sIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBiYXNpYyBJ
MkMgc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWlUIEsxIFNvQywKPj4gdXRpbGl6aW5nIGludGVycnVw
dHMgZm9yIHRyYW5zZmVycy4KPj4KPj4gVGhlIGRyaXZlciBoYXMgYmVlbiB0ZXN0ZWQgdXNpbmcg
aTJjLXRvb2xzIG9uIGEgQmFuYW5hcGktRjMgYm9hcmQsCj4+IGFuZCBiYXNpYyBJMkMgcmVhZC93
cml0ZSBvcGVyYXRpb25zIGhhdmUgYmVlbiBjb25maXJtZWQgdG8gd29yay4KPj4KPj4gUmV2aWV3
ZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4KPj4gTGluazoKPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTI4LWsxLW1haW50YWluZXItMS12MS0xLWU1ZGVj
NGYzNzllYkBnZW50b28ub3JnIFsxXQo+PiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0
cm95bWl0Y2hlbGw5ODhAZ21haWwuY29tPgo+IAo+IEkga25vdyBJIHNhaWQgaXQgd2FzIGZpbmUs
IGJ1dCBJJ20gZ29pbmcgdG8gcmVpdGVyYXRlIHR3byBjb21tZW50cyBpbgo+IHRoZSBwcm9iZSBm
dW5jdGlvbi4KSGksIEFsZXguClRoYW5rcyBmb3IgeW91ciByZXZpZXchCj4gCj4+IC0tLQo+PiDC
oCBkcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZ8KgIHzCoCAxNyArKwo+PiDCoCBkcml2ZXJzL2ky
Yy9idXNzZXMvTWFrZWZpbGUgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
azEuYyB8IDYwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDYyMyBpbnNlcnRpb25zKCspCj4+Cj4gCj4gLiAuIC4KPiAK
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtazEuYwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleAo+PiAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5hZTQzZGNkMzFlOGFhNDgwNzY2
YjQ0YmU5MTY1NjY1N2M3YWFhZjRhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1rMS5jCj4+IEBAIC0wLDAgKzEsNjA1IEBACj4gCj4gLiAuIC4KPiAKPj4g
K3N0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGNsayAqY2xrOwo+PiArwqDCoMKgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpv
Zl9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7Cj4+ICvCoMKgwqAgc3RydWN0IHNwYWNlbWl0X2ky
Y19kZXYgKmkyYzsKPj4gK8KgwqDCoCBpbnQgcmV0Owo+PiArCj4+ICvCoMKgwqAgaTJjID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCppMmMpLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoCBpZiAo
IWkyYykKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiArCj4+ICvCoMKgwqAg
cmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIob2Zfbm9kZSwgImNsb2NrLWZyZXF1ZW5jeSIsICZp
MmMtPmNsb2NrX2ZyZXEpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCBk
ZXZfd2FybihkZXYsICJmYWlsZWQgdG8gcmVhZCBjbG9jay1mcmVxdWVuY3kgcHJvcGVydHlcbiIp
Owo+IAo+IElmIHRoZSBwcm9wZXJ0eSBkb2Vzbid0IGV4aXN0LCBJIGRvbid0IHRoaW5rIHRoaXMg
d2FycmFudHMgYSB3YXJuaW5nLAo+IGJlY2F1c2UgaXQncyBvcHRpb25hbC7CoCBQZXJoYXBzIGlm
IGEgZGlmZmVyZW50IGVycm9yIChzb21ldGhpbmcgb3RoZXIKPiB0aGFuIC1FSU5WQUwpIGlzIHJl
dHVybmVkIGl0IHdvdWxkIHdhcnJhbnQgYSB3YXJuaW5nLgo+IAo+PiArCj4+ICvCoMKgwqAgLyog
Rm9yIG5vdywgdGhpcyBkcml2ZXIgZG9lc24ndCBzdXBwb3J0IGhpZ2gtc3BlZWQuICovCj4+ICvC
oMKgwqAgaWYgKCFpMmMtPmNsb2NrX2ZyZXEgfHwgaTJjLT5jbG9ja19mcmVxIDwgMSB8fAo+IAo+
IEZvciBhbiB1bnNpZ25lZCB2YWx1ZSwgIWkyYy0+Y2xvY2tfZnJlcSBpcyAqdGhlIHNhbWUgYXMq
Cj4gaTJjLT5jbG9ja19mcmVxIDwgMS7CoCBHZXQgcmlkIG9mIHRoZSBsYXR0ZXIuCj4gCj4gSSds
bCBsZWF2ZSBpdCB1cCB0byB0aGUgbWFpbnRhaW5lciB0byBkZWNpZGUgd2hldGhlciB0aGVzZQo+
IGNvbW1lbnRzIGNhbiBqdXN0IGJlIGlnbm9yZWQtLW15IFJldmlld2VkLWJ5IGlzIGZpbmUsIGV2
ZW4KPiBpZiB5b3UgZG9uJ3QgY2hhbmdlIHRoZXNlLgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC1BbGV4Ckkga25vdyBpdCdzIHJpZ2h0IHdoYXQgeW91IHNhaWQu
CkJ1dCBJIGRvbid0IGtub3cgaWYgaXQncyB3b3J0aCB0byBzZW5kIHY4PwpNYXliZSBJIGNhbiBm
aXggaXQgd2hlbiBJIGFkZCBGSUZPIGZ1bmN0aW9uPwpJZiBJJ20gd3JvbmcsIGxldCBtZSBrbm93
Lgo+IAo+PiArwqDCoMKgwqDCoMKgwqAgaTJjLT5jbG9ja19mcmVxID4gU1BBQ0VNSVRfSTJDX01B
WF9GQVNUX01PREVfRlJFUSkgewo+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZGV2LCAidW5z
dXBwb3J0ZWQgY2xvY2sgZnJlcXVlbmN5ICV1OyB1c2luZyAldVxuIiwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpMmMtPmNsb2NrX2ZyZXEsIFNQQUNFTUlUX0kyQ19NQVhfRkFTVF9NT0RF
X0ZSRVEpOwo+PiArwqDCoMKgwqDCoMKgwqAgaTJjLT5jbG9ja19mcmVxID0gU1BBQ0VNSVRfSTJD
X01BWF9GQVNUX01PREVfRlJFUTsKPj4gK8KgwqDCoCB9IGVsc2UgaWYgKGkyYy0+Y2xvY2tfZnJl
cSA8IFNQQUNFTUlUX0kyQ19NQVhfU1RBTkRBUkRfTU9ERV9GUkVRKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBkZXZfd2FybihkZXYsICJ1bnN1cHBvcnRlZCBjbG9jayBmcmVxdWVuY3kgJXU7IHVzaW5n
ICV1XG4iLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkyYy0+Y2xvY2tfZnJlcSzCoCBT
UEFDRU1JVF9JMkNfTUFYX1NUQU5EQVJEX01PREVfRlJFUSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
MmMtPmNsb2NrX2ZyZXEgPSBTUEFDRU1JVF9JMkNfTUFYX1NUQU5EQVJEX01PREVfRlJFUTsKPj4g
K8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBpMmMtPmRldiA9ICZwZGV2LT5kZXY7Cj4+ICsKPj4g
K8KgwqDCoCBpMmMtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihpMmMtPmJhc2UpKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGkyYy0+YmFzZSksICJmYWlsZWQgdG8g
ZG8gaW9yZW1hcCIpOwo+PiArCj4+ICvCoMKgwqAgaTJjLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJx
KHBkZXYsIDApOwo+PiArwqDCoMKgIGlmIChpMmMtPmlycSA8IDApCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGkyYy0+aXJxLCAiZmFpbGVkIHRvIGdldCBpcnEg
cmVzb3VyY2UiKTsKPj4gKwo+PiArwqDCoMKgIHJldCA9IGRldm1fcmVxdWVzdF9pcnEoaTJjLT5k
ZXYsIGkyYy0+aXJxLCBzcGFjZW1pdF9pMmNfaXJxX2hhbmRsZXIsCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSVJRRl9OT19TVVNQRU5EIHwgSVJRRl9PTkVTSE9ULCBk
ZXZfbmFtZShpMmMtPmRldiksIGkyYyk7Cj4+ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlcXVlc3Qg
aXJxIik7Cj4+ICsKPj4gK8KgwqDCoCBjbGsgPSBkZXZtX2Nsa19nZXRfZW5hYmxlZChkZXYsICJm
dW5jIik7Cj4+ICvCoMKgwqAgaWYgKElTX0VSUihjbGspKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGNsayksICJmYWlsZWQgdG8gZW5hYmxlIGZ1
bmMgY2xvY2siKTsKPj4gKwo+PiArwqDCoMKgIGNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRl
diwgImJ1cyIpOwo+PiArwqDCoMKgIGlmIChJU19FUlIoY2xrKSkKPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihjbGspLCAiZmFpbGVkIHRvIGVuYWJs
ZSBidXMgY2xvY2siKTsKPj4gKwo+PiArwqDCoMKgIHNwYWNlbWl0X2kyY19yZXNldChpMmMpOwo+
PiArCj4+ICvCoMKgwqAgaTJjX3NldF9hZGFwZGF0YSgmaTJjLT5hZGFwdCwgaTJjKTsKPj4gK8Kg
wqDCoCBpMmMtPmFkYXB0Lm93bmVyID0gVEhJU19NT0RVTEU7Cj4+ICvCoMKgwqAgaTJjLT5hZGFw
dC5hbGdvID0gJnNwYWNlbWl0X2kyY19hbGdvOwo+PiArwqDCoMKgIGkyYy0+YWRhcHQuZGV2LnBh
cmVudCA9IGkyYy0+ZGV2Owo+PiArwqDCoMKgIGkyYy0+YWRhcHQubnIgPSBwZGV2LT5pZDsKPj4g
Kwo+PiArwqDCoMKgIGkyYy0+YWRhcHQuZGV2Lm9mX25vZGUgPSBvZl9ub2RlOwo+PiArCj4+ICvC
oMKgwqAgc3Ryc2NweShpMmMtPmFkYXB0Lm5hbWUsICJzcGFjZW1pdC1pMmMtYWRhcHRlciIsIHNp
emVvZihpMmMtPmFkYXB0Lm5hbWUpKTsKPj4gKwo+PiArwqDCoMKgIGluaXRfY29tcGxldGlvbigm
aTJjLT5jb21wbGV0ZSk7Cj4+ICsKPj4gK8KgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCBpMmMpOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gaTJjX2FkZF9udW1iZXJlZF9hZGFwdGVyKCZp
MmMtPmFkYXB0KTsKPj4gK8KgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiZmFpbGVkIHRvIGFkZCBpMmMgYWRhcHRl
ciIpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lk
IHNwYWNlbWl0X2kyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gK3sK
Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7Cj4+ICsKPj4gK8KgwqDCoCBpMmNfZGVsX2FkYXB0ZXIoJmkyYy0+YWRhcHQp
Owo+PiArfQo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzcGFjZW1p
dF9pMmNfb2ZfbWF0Y2hbXSA9IHsKPj4gK8KgwqDCoCB7IC5jb21wYXRpYmxlID0gInNwYWNlbWl0
LGsxLWkyYyIsIH0sCj4+ICvCoMKgwqAgeyAvKiBzZW50aW5lbCAqLyB9Cj4+ICt9Owo+PiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgc3BhY2VtaXRfaTJjX29mX21hdGNoKTsKPj4gKwo+PiArc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3BhY2VtaXRfaTJjX2RyaXZlciA9IHsKPj4gK8Kg
wqDCoCAucHJvYmUgPSBzcGFjZW1pdF9pMmNfcHJvYmUsCj4+ICvCoMKgwqAgLnJlbW92ZSA9IHNw
YWNlbWl0X2kyY19yZW1vdmUsCj4+ICvCoMKgwqAgLmRyaXZlciA9IHsKPj4gK8KgwqDCoMKgwqDC
oMKgIC5uYW1lID0gImkyYy1rMSIsCj4+ICvCoMKgwqDCoMKgwqDCoCAub2ZfbWF0Y2hfdGFibGUg
PSBzcGFjZW1pdF9pMmNfb2ZfbWF0Y2gsCj4+ICvCoMKgwqAgfSwKPj4gK307Cj4+ICttb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHNwYWNlbWl0X2kyY19kcml2ZXIpOwo+PiArCj4+ICtNT0RVTEVfTElD
RU5TRSgiR1BMIik7Cj4+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkkyQyBidXMgZHJpdmVyIGZvciBT
cGFjZW1pVCBLMSBTb0MiKTsKPj4KPiAKCi0tIApUcm95IE1pdGNoZWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
