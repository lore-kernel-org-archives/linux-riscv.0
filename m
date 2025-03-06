Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A6EC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MI5/bdp9liS4KAZalRyS4a1SwQ+DQeXUNcOa3p1ea0U=; b=wwfedqxujNruzXSil7qRsoaddD
	YvJ9A4KVDSoOfuP5c+nh/OPis02fp3k+TqdSRj9GGqP9mkgvYawzQyVUSzvqMggFhfhCy1lgiwE9v
	4O3UKVNhxGDqo21bnC99CTPUEoaJhG2FUpu2VGM+95A/pg+9DB9QmozXU6DCAs2QiIuHEes2P5le0
	YhUr9umDWNZ6wy9+4UbcsuLARRFPZ/THWG+nBc7aV7ubQ9AwSiXScOdzl8qaWnEjglT4D8j/hl4vx
	cr+PaeHsZ59Gv11Tnb4XjycL8NMUXp6MNBKnicAU2Vrc/pIbtfy89etz3PEz2AuqTVR2AICYzLdnS
	EfIeBxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFYV-0000000BmkP-2F8D;
	Thu, 06 Mar 2025 18:02:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFXK-0000000BmVj-0Cwo
	for linux-riscv@bombadil.infradead.org;
	Thu, 06 Mar 2025 18:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=PZqJTh0YCvVr8icSs09kza3W0ABw7bZnL85iQtnzYZ4=; b=Gs4sZecd5xkerXEHvHxv+Uz1Gl
	G3J2xbr8n9XMI4cfJWl5V8nv96jGmi7wCNJrcoLG5GBfxRlYNiKIvZ2XXA84bxyb4xZL8lEvwBB1d
	gynVImKHHP0r1sILLrh2MZx0pzfPx8Sxqz9078nk2uKvJaUTZeAojYW5SdSWfbSucqignnTUjtA1r
	CjWBu3+aBGOJZred4AIfGhLrC8mMGEhXo+0Fi3cI1uYcYK+ryf3KULn7uQONwqq/F1RAeQXnFVc0k
	eKPi1DukH1LXeDzKMX7grI4D1AAoEjNtL5HTKRJN5rVXUySzN4U6UfPPJoPZfGx9ewg2g0QQ6fz63
	i01TxfkA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFXG-00000001Bq2-49rg
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 18:01:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2feb9076cdcso2197149a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Mar 2025 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1741284088; x=1741888888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZqJTh0YCvVr8icSs09kza3W0ABw7bZnL85iQtnzYZ4=;
        b=NjUTiVNhDWBiNEflJSVk5mwZbjtHqGorV3W23ImxoXkHwNgR7MZd9ZDnKBJZN0MZiT
         cXaD1pmDU7K8CgF186vD8RIj+gEqJRPcGwHjrp9t6iToQCcCjnl7Mx1mqTfetQRAaYHq
         99Rtior2+SIf+LLA3UXZCP+3qU5lmJX8Fma6a3zy4SQQY8TSK3F+rh+EoFGl0gNOHsYv
         y8ayOGlAybUKOhdLroUpWLQvAuFmAZeO+GrFnoCENOuDcK6dinCbo++lOFMQYQRni0kI
         cVqxk3IIUoAKfEIWDU8Uwy2ZoAAIif0G8KTAbpkaS6Z6y7unBLPW4NhU4ZeuLnN3D9dy
         DG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741284088; x=1741888888;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZqJTh0YCvVr8icSs09kza3W0ABw7bZnL85iQtnzYZ4=;
        b=fBCIvDWV8RudoJckvMP3+0q7WHD8WzTMlUXxLqXX7gnzC3ZxtLzLod7311hcJ8ZrfF
         hGZL7VqU+K0OJthB8HWEUNYsLmBeuoNLserT0BAHl2Qin33b+L/ZtOgPrbSkrdATZZLD
         pf+mf7OLBIMoXM2nLF4X/FssiHezmNUV/+y0oHg9mZH3H1OLrwCn7NRjIO9ceRywAOAY
         l72Fu0mXNxrXMJr64UyKX777aPvNsMy+4RnT2EoIFSsCU95ApRf0Gy38bRI1wKMgH9sa
         RJV1HcXqtZZDqvTMRu6H++7X6K5Qqn6EA6t9VKL0/+YPdRY2Pk7u409xMJYLkiyaN8la
         NG2A==
X-Forwarded-Encrypted: i=1; AJvYcCUX/FgrZ3KX7KFJQy7s7KbO2mbT7KnR3QBS9QQQhwxCxrpXCvHgSA56Td+sH0Axb3AcL40aLaNMJry3Uw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0H6PLuWVQqxQotd3VE5/oZ0tgbTDjPgI1I10Y1WzikR+hvw+9
	BxIytX7QuOBgLcR3kH2oroK17iM0uirliEWU6Io1EICmc60TkFlXv2P+F9hp1Ms=
X-Gm-Gg: ASbGncvDayjh6Vp/dbyp+EnH6avZt6IZ0+QLa9LqaXdtZjTrvAcMfNLhZRpw7FdVyfU
	4sSzAVCKZYqXHP5KXmBBbSkiOIVI6vVh+ScJqr8fg73uF3DfQyg+9iTCAChR6mOWZvxyfR9L8BS
	tPT5T/A4HMOdcIo4NmOO5PWlK+T/t8mkyvSaFYbC/pq7KycZYFfKCl7ceWCbIHuZG8RS/g0afjy
	18c2fqJuZvgVMRinvTFDK5NICv65I7+NQuSWp1LoTbX1+c3Yp52Yy20AIU+bupfdCLu/QecXs5O
	xiMf7dylT3btHCojoNuNrteOn0hrPNYQBLese7mEBA==
X-Google-Smtp-Source: AGHT+IHbtFJc0sZMysZ3vYXJuVTW6NBS2O3AVJRjOnc6c6T0oJ1FFGCKVknIrhqtI5fTinhi9uFXQQ==
X-Received: by 2002:a17:90b:164f:b0:2fe:8fc4:6f4b with SMTP id 98e67ed59e1d1-2ff7ce904f9mr294169a91.8.1741284087517;
        Thu, 06 Mar 2025 10:01:27 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8345sm15463375ad.57.2025.03.06.10.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 10:01:26 -0800 (PST)
Date: Thu, 06 Mar 2025 10:01:26 -0800 (PST)
X-Google-Original-Date: Thu, 06 Mar 2025 10:01:19 PST (-0800)
Subject: Re: [resend PATCH] riscv: fix memory leakage in process_accumulated_relocations
In-Reply-To: <a9058ac757636e4f5160a0bd11abeb3c111fc9a5.camel@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangkai@iscas.ac.cn
Message-ID: <mhng-a1315877-d100-437d-923e-ebbae4745074@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_180131_202012_FD4E996D 
X-CRM114-Status: GOOD (  17.12  )
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

T24gU2F0LCAxNiBOb3YgMjAyNCAwNDowNzoxOCBQU1QgKC0wODAwKSwgemhhbmdrYWlAaXNjYXMu
YWMuY24gd3JvdGU6Cj4gU29ycnkgZm9yIGxhc3Qgd2VpcmQgZW1haWwuCj4gLS0tCj4KPiBXaGVu
IG1vZHVsZSByZWxvY2F0aW9uIGlzIGRvbmUsIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlv
bnMoKQo+IGZyZWVzIGFsbCBkeW5hbWljIGFsbG9jYXRlZCBtZW1vcnkuIHJlbF9oZWFkX2l0ZXIt
PnJlbF9lbnRyeSBpcwo+IG1pc3NlZCB0byBmcmVlIHRoYXQga21lbWxlYWsgbWlnaHQgcmVwb3J0
Ogo+Cj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmZmZmQ4ODBjNWZjNDAgKHNpemUgMTYpOgo+
IMKgIGNvbW0gImluc21vZCIsIHBpZCAxMTAxLCBqaWZmaWVzIDQyOTUwNDUxMzgKPiDCoCBoZXgg
ZHVtcCAoZmlyc3QgMTYgYnl0ZXMpOgo+IMKgwqDCoCBlMCBjMCBmNSA4NyBkOCBmZiBmZiBmZiA2
MCBjNSBmNSA4NyBkOCBmZiBmZiBmZsKgIC4uLi4uLi4uYC4uLi4uLi4KPiDCoCBiYWNrdHJhY2Ug
KGNyYyBkMmVjYjIwYyk6Cj4gwqDCoMKgIFs8MDAwMDAwMDBiMDE2NTVmNj5dIGttYWxsb2NfdHJh
Y2Vfbm9wcm9mKzB4MjY4LzB4MmY2Cj4gwqDCoMKgIFs8MDAwMDAwMDA2ZGMwMDY3YT5dCj4gYWRk
X3JlbG9jYXRpb25fdG9fYWNjdW11bGF0ZS5jb25zdHByb3AuMCsweGYyLzB4MWFhCj4gwqDCoMKg
IFs8MDAwMDAwMDBlMWIyOWEzNj5dIGFwcGx5X3JlbG9jYXRlX2FkZCsweDEzYy8weDM2ZQo+IMKg
wqDCoCBbPDAwMDAwMDAwNzU0M2YxZmI+XSBsb2FkX21vZHVsZSsweDVjNi8weDgzZQo+IMKgwqDC
oCBbPDAwMDAwMDAwYWJjZTEyZTg+XSBpbml0X21vZHVsZV9mcm9tX2ZpbGUrMHg3NC8weGFhCj4g
wqDCoMKgIFs8MDAwMDAwMDA0OTQxM2UzZD5dIGlkZW1wb3RlbnRfaW5pdF9tb2R1bGUrMHgxMTYv
MHgyMmUKPiDCoMKgwqAgWzwwMDAwMDAwMGY5Yjk4Yjg1Pl0gX19yaXNjdl9zeXNfZmluaXRfbW9k
dWxlKzB4NjIvMHhhZQo+Cj4gU2lnbmVkLW9mZi1ieTogS2FpIFpoYW5nIDx6aGFuZ2thaUBpc2Nh
cy5hYy5jbj4KPiAtLS0KPiDCoGFyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIHwgMSArCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gaW5kZXggMWNk
NDYxZjNkODcuLmY4YzNjNGI0N2RjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL21v
ZHVsZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKPiBAQCAtNjQzLDYgKzY0
Myw3IEBAIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoc3RydWN0IG1vZHVsZSAqbWUs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWxvY19oYW5kbGVy
c1tjdXJyX3R5cGVdLmFjY3VtdWxhdGVfaGFuZGxlcigKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZSwgbG9jYXRpb24sIGJ1
ZmZlcik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtm
cmVlKHJlbF9oZWFkX2l0ZXItPnJlbF9lbnRyeSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShyZWxfaGVhZF9pdGVyKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBr
ZnJlZShidWNrZXRfaXRlcik7CgpJIGp1c3QgZm91bmQgdGhpcyBvbmUuICBUaGUgcGF0Y2ggaXMg
YWxzbyBhIGJpdCBtYW5nbGVkLCBzbyBpdCBkb2Vzbid0IAphcHBseSAoYW5kIHByb2JhYmx5IGdv
dCBtaXNzZWQgYnkgc29tZSB0b29scykuCgpJIGhhZCB0aGlzIGJ1ZmZlciB1cCB0byBzYXkgc29t
ZXRoaW5nIGVsc2UsIGJ1dCBJIGRvbid0IHJlbWVtYmVyIHdoYXQgaXQgCndhcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
