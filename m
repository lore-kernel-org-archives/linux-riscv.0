Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4133C28B28
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 23:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnb0Y5DrBTu0p9J8AWMBq8WcV4HLGbyRRXDe3x9PLC8=; b=SlsP6a5scRQ+20
	O3fRQogki/DSBr5TdhqGFJ2wddFP/lPmVPzl9g2O8WGfau6Z697ahZ3ylReoax24iH8R9BcCQQ8Ce
	kEZgPo6xSvGqemFJkEB3q4WDRtv9qncOdAY95yI5T8bdsMgRmh/3kV0q60vOvt9Zcs63Gq3+8UGGw
	eWPnbBu5XJzbdpLB1SZv9WUJJfuzoZXYI70bgFIgxtZlEx/BVAXc97CWTDqdDrXfOPm+A/5h1WEQl
	5jGNQVfSWin6XfdUG5Z+w59fDSgO+gEYpY+nIWrmXOfs9t02lRU6eU/Ohn2KcMy6LN+5B72ZH2gwt
	E70kQgkko2Eh2xhQ2XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKIs-00000004DVp-2DXL;
	Mon, 17 Mar 2025 23:55:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKIS-00000004DNX-3R9l
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 23:55:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2243803b776so53802975ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 16:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742255704; x=1742860504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BaEesGZQPxAj4sEFCUyAgXUqotSKFJXiU7Y/LCyccU=;
        b=LeHUmn3JuMhEPYfv0/EAFSjgkZtYjtFzmpCCSNvKUPu054aZuaTsCfIUm2TkiV8aHo
         /29+0N2xICKqRQn7dGl8sCI152045XJFCEmmU1wEy9KLrBbq85X5zD7fmDCwchaj1e8P
         4PNoWFgPUKW0EEw8nw5OW4GVwR+vu1u6bNjjdWspCFDRal7zh+zsfRWEgz+KafUTIuYR
         eHECYA8sP5poSRUvpxleUpJOk/DyxJQDWnNLIAaWY8IpZOLSdlA4H82TaXaLZA1zTttJ
         hueWXgDeFIInV0cU76QLQOQjSRHtFkiBrZKFxcK7szGm51dgHYtnJoFgCvgZFdOLaRhZ
         blWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742255704; x=1742860504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2BaEesGZQPxAj4sEFCUyAgXUqotSKFJXiU7Y/LCyccU=;
        b=QTd2E7frY74ke21qExk/OijeCtz3Us4RkOg9n4vZHsOgSMs/0VFZiTgNKOpspMGvVk
         tOjA3DZB2vsHlbqzEkFp+dSSsjJLNVfn0ztUZcuiHM0R0IXhweP4gnVsLItP6XFK+OtM
         9ejNHUU9QQFJ3jTYy8hXtqNSlwKeOxnpsBwTisAxPp7xPy6VdoiQgkHmwMrHk70bPAKO
         KIrw/WzGTnWPmwMC37H9MtBcj5OWs5YxZiH3IXevZLzGpMvZYEOFPT8Q4CyxZ6zaJSbI
         BhvpChUPt7ol1pelj8YASwQ7kTawqUPw5BITBabZkdgXCLfBSmmN6hZ2qrb/R3o4bF4+
         kXog==
X-Gm-Message-State: AOJu0YwgmubEt2gd+vUPlj9I4+xP5TaNLP3HyFP2AunMEZlXesp2oHb1
	RsEFFEDDsEVWFsDx629NzFv35EseCOAXQwa6am65sfMA1tezf/FZdTm5v7pbrg==
X-Gm-Gg: ASbGncvXUIcyJVwsUUE3YdWpMHko6tlDljsHQRDzHSiKo5p7rAghTUrh45PMCWRryc2
	I2QFfiASAKQ6MGS6kNBCiplWlK5AaQIt79LYs+Ct0S4PjaDRYn+D4AggqmYtTBbTmqmyOyV2Xwx
	HYvnWlEJe8mGiq1xTTyqBp3qHrhRq2R4hghHULf4DgWg5HYgSIKPQQuhsPQ0dmBTsocEcfMfC5A
	//d8RewTv59k+Z4Am95HFm29sqw9hxfDUT+Or9kfTdLeaVD08T+xiaRxwzddBK/tzFpmmRKQIOM
	eaj9UAd0S64ftw6hkZXAEWK2C2n6YlGMTbHR8/LSVRX5+e1KjStz5xBkW3cv+p+E1w==
X-Google-Smtp-Source: AGHT+IEal8kGqBORazjLpmbhAyMjWbAph9OrXPa4QlNZhh/T7g7iTF+vSLL4w1ItmIz6KJ2LE1skXg==
X-Received: by 2002:a05:6a00:a01:b0:736:3c2b:c38e with SMTP id d2e1a72fcca58-73757246dfbmr1533920b3a.13.1742255703849;
        Mon, 17 Mar 2025 16:55:03 -0700 (PDT)
Received: from [192.168.50.200] ([202.172.96.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af594eb973dsm4686757a12.19.2025.03.17.16.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 16:55:03 -0700 (PDT)
Message-ID: <e0075d0c-45ae-437a-b873-e892e4e51dc3@tenstorrent.com>
Date: Tue, 18 Mar 2025 10:54:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v3 1/4] riscv: implement user_access_begin() and
 families
To: Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, charlie@rivosinc.com,
 jrtc27@jrtc27.com, ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <20250221000924.734006-2-cyrilbur@tenstorrent.com>
 <9a94c74f-4826-479f-aaa0-e87b3bfd30ff@ghiti.fr>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <9a94c74f-4826-479f-aaa0-e87b3bfd30ff@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_165504_859743_95B8D159 
X-CRM114-Status: GOOD (  24.67  )
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

CgpPbiAxNS8zLzIwMjUgMTI6MjggYW0sIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBDeXJp
bCwKPiAKPiBPbiAyMS8wMi8yMDI1IDAxOjA5LCBDeXJpbCBCdXIgd3JvdGU6Cj4+IEZyb206IEpp
c2hlbmcgWmhhbmc8anN6aGFuZ0BrZXJuZWwub3JnPgo+Pgo+PiBDdXJyZW50bHksIHdoZW4gYSBm
dW5jdGlvbiBsaWtlIHN0cm5jcHlfZnJvbV91c2VyKCkgaXMgY2FsbGVkLAo+PiB0aGUgdXNlcnNw
YWNlIGFjY2VzcyBwcm90ZWN0aW9uIGlzIGRpc2FibGVkIGFuZCBlbmFibGVkCj4+IGZvciBldmVy
eSB3b3JkIHJlYWQuCj4+Cj4+IEJ5IGltcGxlbWVudGluZyB1c2VyX2FjY2Vzc19iZWdpbigpIGFu
ZCBmYW1pbGllcywgdGhlIHByb3RlY3Rpb24KPj4gaXMgZGlzYWJsZWQgYXQgdGhlIGJlZ2lubmlu
ZyBvZiB0aGUgY29weSBhbmQgZW5hYmxlZCBhdCB0aGUgZW5kLgo+Pgo+PiBUaGUgX19pbnR0eXBl
IG1hY3JvIGlzIGJvcnJvd2VkIGZyb20geDg2IGltcGxlbWVudGF0aW9uLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKaXNoZW5nIFpoYW5nPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1i
eTogQ3lyaWwgQnVyPGN5cmlsYnVyQHRlbnN0b3JyZW50LmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlLyAKPj4gYXNtL3VhY2Nlc3MuaAo+PiBpbmRleCBmZWU1NmIwYzgwNTguLjQzZGIxZDlj
MmY5OSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPj4gQEAgLTYxLDYgKzYxLDE5
IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAKPj4gX191bnRhZ2dlZF9hZGRyX3JlbW90
ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZQo+PiDCoCAjZGVmaW5lIF9fZGlzYWJsZV91
c2VyX2FjY2VzcygpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoCBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoImNzcmMgc3N0
YXR1cywgJTAiIDogOiAiciIgKFNSX1NVTSkgOiAKPj4gIm1lbW9yeSIpCj4+ICsvKgo+PiArICog
VGhpcyBpcyB0aGUgc21hbGxlc3QgdW5zaWduZWQgaW50ZWdlciB0eXBlIHRoYXQgY2FuIGZpdCBh
IHZhbHVlCj4+ICsgKiAodXAgdG8gJ2xvbmcgbG9uZycpCj4+ICsgKi8KPj4gKyNkZWZpbmUgX19p
bnR0eXBlKHgpIF9fdHlwZW9mX18owqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIF9fdHlwZWZp
dHMoeCxjaGFyLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoCBfX3R5cGVm
aXRzKHgsc2hvcnQswqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoMKgwqDCoCBf
X3R5cGVmaXRzKHgsaW50LMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIF9fdHlwZWZpdHMoeCxsb25nLDBVTEwpKSkpKQo+PiArCj4+ICsjZGVmaW5lIF9fdHlw
ZWZpdHMoeCx0eXBlLG5vdCkgXAo+PiArwqDCoMKgIF9fYnVpbHRpbl9jaG9vc2VfZXhwcihzaXpl
b2YoeCk8PXNpemVvZih0eXBlKSwodW5zaWduZWQgdHlwZSkwLG5vdCkKPj4gKwo+PiDCoCAvKgo+
PiDCoMKgICogVGhlIGV4Y2VwdGlvbiB0YWJsZSBjb25zaXN0cyBvZiBwYWlycyBvZiBhZGRyZXNz
ZXM6IHRoZSBmaXJzdCBpcyB0aGUKPj4gwqDCoCAqIGFkZHJlc3Mgb2YgYW4gaW5zdHJ1Y3Rpb24g
dGhhdCBpcyBhbGxvd2VkIHRvIGZhdWx0LCBhbmQgdGhlIAo+PiBzZWNvbmQgaXMKPj4gQEAgLTM2
OCw2ICszODEsNTYgQEAgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBlcnJfbGFiZWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcCj4+IMKgIH0gd2hpbGUgKDApCj4+ICtzdGF0aWMgX19tdXN0X2NoZWNrIF9fYWx3YXlz
X2lubGluZSBib29sIHVzZXJfYWNjZXNzX2JlZ2luKGNvbnN0IHZvaWQgCj4+IF9fdXNlciAqcHRy
LCBzaXplX3QgbGVuKQo+PiArewo+PiArwqDCoMKgIGlmICh1bmxpa2VseSghYWNjZXNzX29rKHB0
cixsZW4pKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArwqDCoMKgIF9fZW5hYmxl
X3VzZXJfYWNjZXNzKCk7Cj4+ICvCoMKgwqAgcmV0dXJuIDE7Cj4+ICt9Cj4+ICsjZGVmaW5lIHVz
ZXJfYWNjZXNzX2JlZ2luKGEsYinCoMKgwqAgdXNlcl9hY2Nlc3NfYmVnaW4oYSxiKQo+IAo+IAo+
IE5pdDogbm8gbmVlZCBmb3IgKGEsYikgaGVyZQo+IAo+IAo+PiArI2RlZmluZSB1c2VyX2FjY2Vz
c19lbmQoKcKgwqDCoCBfX2Rpc2FibGVfdXNlcl9hY2Nlc3MoKQo+PiArCj4+ICtzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgdXNlcl9hY2Nlc3Nfc2F2ZSh2b2lkKSB7IHJldHVybiAwVUw7IH0K
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB1c2VyX2FjY2Vzc19yZXN0b3JlKHVuc2lnbmVkIGxvbmcg
ZW5hYmxlZCkgeyB9Cj4+ICsKPj4gKy8qCj4+ICsgKiBXZSB3YW50IHRoZSB1bnNhZmUgYWNjZXNz
b3JzIHRvIGFsd2F5cyBiZSBpbmxpbmVkIGFuZCB1c2UKPj4gKyAqIHRoZSBlcnJvciBsYWJlbHMg
LSB0aHVzIHRoZSBtYWNybyBnYW1lcy4KPj4gKyAqLwo+PiArI2RlZmluZSB1bnNhZmVfcHV0X3Vz
ZXIoeCwgcHRyLCBsYWJlbCnCoMKgwqAgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4+ICvCoMKgwqAgbG9uZyBfX2VyciA9IDA7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCBfX3B1dF91c2VyX25vY2hl
Y2soeCwgKHB0ciksIF9fZXJyKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAr
wqDCoMKgIGlmIChfX2VycikgZ290byBsYWJlbDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK30gd2hpbGUgKDApCj4+ICsKPj4gKyNkZWZpbmUgdW5z
YWZlX2dldF91c2VyKHgsIHB0ciwgbGFiZWwpwqDCoMKgIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIGxvbmcgX19lcnIgPSAwO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgX19pbnR0
eXBlKCoocHRyKSkgX19ndV92YWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+PiArwqDCoMKgIF9fZ2V0X3VzZXJfbm9jaGVjayhfX2d1X3ZhbCwgKHB0ciksIF9fZXJy
KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCAoeCkgPSAoX19mb3JjZSBfX3R5
cGVvZl9fKCoocHRyKSkpX19ndV92YWw7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKg
wqAgaWYgKF9fZXJyKSBnb3RvIGxhYmVsO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+PiArfSB3aGlsZSAoMCkKPj4gKwo+PiArI2RlZmluZSB1bnNhZmVf
Y29weV9sb29wKGRzdCwgc3JjLCBsZW4sIHR5cGUsIGxhYmVsKcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgd2hpbGUgKGxlbiA+PSBzaXplb2YodHlwZSkpIHvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKg
wqDCoMKgIHVuc2FmZV9wdXRfdXNlcigqKHR5cGUgKikoc3JjKSwodHlwZSBfX3VzZXIgKikoZHN0
KSxsYWJlbCk7wqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgIGRzdCArPSBzaXplb2YodHlwZSk7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKg
wqDCoMKgwqDCoCBzcmMgKz0gc2l6ZW9mKHR5cGUpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgbGVuIC09IHNpemVvZih0
eXBlKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4g
K8KgwqDCoCB9Cj4+ICsKPj4gKyNkZWZpbmUgdW5zYWZlX2NvcHlfdG9fdXNlcihfZHN0LF9zcmMs
X2xlbixsYWJlbCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK2RvIHvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gK8KgwqDCoCBjaGFyIF9fdXNlciAqX191Y3VfZHN0ID0gKF9kc3QpO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgY29uc3QgY2hhciAqX191Y3Vfc3JjID0g
KF9zcmMpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDC
oCBzaXplX3QgX191Y3VfbGVuID0gKF9sZW4pO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPj4gK8KgwqDCoCB1bnNhZmVfY29weV9sb29wKF9fdWN1X2RzdCwgX191Y3Vf
c3JjLCBfX3VjdV9sZW4sIHU2NCwgbGFiZWwpO8KgwqDCoCBcCj4+ICvCoMKgwqAgdW5zYWZlX2Nv
cHlfbG9vcChfX3VjdV9kc3QsIF9fdWN1X3NyYywgX191Y3VfbGVuLCB1MzIsIGxhYmVsKTvCoMKg
wqAgXAo+PiArwqDCoMKgIHVuc2FmZV9jb3B5X2xvb3AoX191Y3VfZHN0LCBfX3VjdV9zcmMsIF9f
dWN1X2xlbiwgdTE2LCBsYWJlbCk7wqDCoMKgIFwKPj4gK8KgwqDCoCB1bnNhZmVfY29weV9sb29w
KF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9sZW4sIHU4LCBsYWJlbCk7wqDCoMKgIFwKPj4g
K30gd2hpbGUgKDApCj4+ICsKPj4gwqAgI2Vsc2UgLyogQ09ORklHX01NVSAqLwo+PiDCoCAjaW5j
bHVkZSA8YXNtLWdlbmVyaWMvdWFjY2Vzcy5oPgo+PiDCoCAjZW5kaWYgLyogQ09ORklHX01NVSAq
Lwo+IAo+IFRoZXJlIGlzIGEgYnVuY2ggb2YgY2hlY2twYXRjaCBlcnJvcnMgdG8gZml4LCBzZWUg
aHR0cHM6Ly8gCj4gZ2lzdC5naXRodWIuY29tL2xpbnV4LXJpc2N2LWJvdC85OGYyM2ZkMWIwNGQ2
ZGE3YzIzYzZjYjE4MjQ1YTE1OAo+IAoKT29wcywgeWVhaCB3aWxsIGZpeC4KCj4gV2h5IGlzbid0
IHRoZXJlIGFuIGltcGxlbWVudGF0aW9uIGZvciB1bnNhZmVfY29weV9mcm9tX3VzZXIoKT8gTGV0
J3MgCj4gdGFrZSB0aGUgZm9sbG93aW5nIGV4YW1wbGU6Cj4gCj4gdXNlcl9hY2Nlc3NfYmVnaW4o
KQo+IHVuc2FmZV9jb3B5X2Zyb21fdXNlcigpCj4gdW5zYWZlX2dldF91c2VyKCkgPD09PT0gVGhp
cyBvbmUgd2lsbCBmYWlsIHNpbmNlIHVuc2FmZV9jb3B5X2Zyb21fdXNlcigpIAo+IC0+IHJhd19j
b3B5X2Zyb21fdXNlcigpIC0+IF9fYXNtX3ZlY3Rvcl91c2VyY29weSgpIHdoaWNoIGVuYWJsZXMg
YW5kIAo+IGRpc2FibGVzIHRoZSBTVU0gYml0Lgo+IHVzZXJfYWNjZXNzX2VuZCgpCgpJJ2xsIGhh
dmUgdG8gbG9vayBpbnRvIHRoYXQgLSB0aGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCj4gCj4gQW5v
dGhlciB0aGluZyBpcyB0aGF0IHdpdGggdGhpcyBwYXRjaCwgd2UgbG9zZSB0aGUgdmVjdG9yaXpl
ZCB1c2VyIAo+IGFjY2VzcyBmdW5jdGlvbnMsIGNhbiB5b3UgZml4IHRoYXQgdG9vPwoKSSdsbCBo
YXZlIGEgbG9vayBhdCB0aGlzIGFsc28uCgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4Cj4gCj4gCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
