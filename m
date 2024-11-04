Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA90D132A3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 09:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUeshLjcAJVnWaG3ohWDC8abJFiyqKwlZJVpJykFox8=; b=g0deB1uXgSNySr
	Ey6QozZL5z2JfKGPQuzBkvvr5AtXWczN4cp4RQ9MB3Zo7YiLkElHsadVe0n8w0y9jGC7NA+ljijDn
	039dveJVwAn0S1AeDeskQTkV6WEoHXy005rZZBQROsCwhnAVQLsyJN5wA7CVsyZlLSLgVQKVNOHPT
	aw4swBb3bI9IqPSSUJDczj+dOLOZKJCttLJayD6cKlWGTcXd9ipvp810FdjidRTCoZdS0ZRyb9Gvt
	4KN9YSLpOYT57PCffyXFUs5AnsncWq6v6HtczG2x+omfN4PgN739qtEEcG/xXZAP125WNjm6jkuWr
	u9ZNexQdvaBPRz98+mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tJP-0000000D8wm-0O2M;
	Mon, 04 Nov 2024 09:23:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tBr-0000000D7sf-31Hn
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 09:16:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so34300635e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 01:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730711761; x=1731316561; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHNHWIYjHvkIzmcPqQT0+mDEdOP8FoTFnfjxUafDk0o=;
        b=b/aKWtPCiUHniJd+ngmZ6ra+0Nx5E8QBwP008PCq9X3774qZKVQsJ1zyCcv+0iTLYd
         93TtPiuQYTRblX0ayyjbE7qfXBJE3kDXJo9atVlifgJ+LeaVdPJDjx2+/ZPksY0ZKOeN
         nnUgF6Vq8/Tnm9St804jY55pytVhCpDS6d3YznzVYuTORjsPUieCNT8aXwzj5k2YQP7G
         du21z+MehVcw4sq1zwvSHCVFAaqhakChOm7aAOsWi6+0ywRe+hFSSurgAcajbhwDO3Om
         hMcl9s4O14GHuB83zZ9AvZhISc95aT45Jxs+1as+FYV4QacwMkrxTeVmM2tZ5uunxfGv
         0ojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730711761; x=1731316561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHNHWIYjHvkIzmcPqQT0+mDEdOP8FoTFnfjxUafDk0o=;
        b=WLWF9/Bm5q31HY7B7XsqudLnQDjrGntVFiJPaIPnYqPTZGH4PLWewsqLMh6GXmzEHZ
         1qUsYJAHZJEIlEdRxICDWYycus8DMGAYLnZYQliRAnTtANrJo25hwFoEdME/knBgNmlS
         RoaVTvcJymFKP9fqbYUs2ZlS5hvd8WN8X8N0oHWLxUVu19wU3je2wb89GVRlCmKb2OLV
         DWg6AKhvtM/UpyIcKh9Wit5Lh3/RpfpIxqT7cc9RGd/Tf0HqtTo6XREwV3eqnrlun6GD
         6owRvLMbeDmwrX7afMF3DFKl56kbHPXJrtP9vwimrSAUvxkTCq5xaiSzMA6WzMYYOLTa
         yLcg==
X-Forwarded-Encrypted: i=1; AJvYcCVb3Wq1Fo5defqT9wXkc0sUeHhdus2xN+mXh1MmNPsTV8AWN3OS4sVPpRN/yHRHjVKSvtHviYD0dzBDBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdJrxP1rPl2mfIpzYHQnPXD1PvxYFt3C78sbq8Q7xHw6eijHk4
	HlhqbSueRkb+PihRDXsEOGbetbC2CY0qPME+FeLCckf6DksytUO7oQzcZx8w2yM=
X-Google-Smtp-Source: AGHT+IE4s+sASLiF+pi+exNOnX7ReBg009W7YiTR8d4XFS+TSr8/rXuH9ghRVqL/4nhzY++NrQ3GdQ==
X-Received: by 2002:a05:600c:428b:b0:432:7c08:d113 with SMTP id 5b1f17b1804b1-4327c08d232mr119169755e9.6.1730711759998;
        Mon, 04 Nov 2024 01:15:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm173335235e9.17.2024.11.04.01.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 01:15:59 -0800 (PST)
Message-ID: <2e775421-0c3e-48ef-8a8c-6734f7fcf298@rivosinc.com>
Date: Mon, 4 Nov 2024 10:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: add ISA extension parsing for bfloat16 ISA
 extension
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andybnac@gmail.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20241103074959.1135240-1-inochiama@gmail.com>
 <20241103074959.1135240-3-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241103074959.1135240-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_011603_808098_91159D33 
X-CRM114-Status: GOOD (  13.40  )
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

CgpPbiAwMy8xMS8yMDI0IDA4OjQ5LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IEFkZCBwYXJzaW5n
IGZvciBaZmJtaW4sIFp2ZmJmbWluLCBadmZiZndtYSBJU0EgZXh0ZW5zaW9uIHdoaWNoCj4gd2Vy
ZSByYXRpZmllZCBpbiA0ZGMyM2Q2MiAoIkFkZGVkIENoYXB0ZXIgdGl0bGUgdG8gQkYxNiIpIG9m
Cj4gdGhlIHJpc2N2LWlzYS1tYW51YWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90
byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oIHwgMyArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMyArKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oCj4gaW5kZXggNDZkOWRlNTQxNzllLi45NzY1N2ZiNjNhZjYgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gQEAgLTkzLDYgKzkzLDkgQEAKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pD
TU9QCQk4NAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFXUlMJCTg1Cj4gICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9TVlZQVEMJCTg2Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkJGTUlOCQk4
Nwo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGQkZNSU4JCTg4Cj4gKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkZCRldNQQkJODkKPiAgCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhF
TlZDRkcJMTI3Cj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCAzYThlZWFhOTMxMGMu
LjFiMjg2ZjViYzU5MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtMzI1LDYgKzMy
NSw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0g
ewo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9FWFRfWkFDQVMpLAo+
ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemF3cnMsIFJJU0NWX0lTQV9FWFRfWkFXUlMpLAo+ICAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCj4gKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6ZmJmbWluLCBSSVNDVl9JU0FfRVhUX1pGQkZNSU4pLAo+ICAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemZoLCBSSVNDVl9JU0FfRVhUX1pGSCksCj4gIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWkZITUlOKSwKPiAgCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHpjYSwgUklTQ1ZfSVNBX0VYVF9aQ0EpLAo+IEBAIC0zNTcsNiArMzU4LDggQEAgY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gIAlfX1JJ
U0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjRkLCBSSVNDVl9JU0FfRVhUX1pWRTY0RCwgcmlzY3Zf
enZlNjRkX2V4dHMpLAo+ICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTY0ZiwgUklTQ1Zf
SVNBX0VYVF9aVkU2NEYsIHJpc2N2X3p2ZTY0Zl9leHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9T
VVBFUlNFVCh6dmU2NHgsIFJJU0NWX0lTQV9FWFRfWlZFNjRYLCByaXNjdl96dmU2NHhfZXh0cyks
Cj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZiZm1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZCRk1J
TiksCj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZiZndtYSwgUklTQ1ZfSVNBX0VYVF9aVkZC
RldNQSksCgpAQ29ub3IsCgpTaG91bGQgd2Ugd2FpdCBmb3IgeW91ciBWL0YgdmFsaWRhdGlvbiBz
dXBwb3J0IHRvIGJlIG1lcmdlZCBiZWZvcmUgdGhpcwpvbmUgPwoKVGhhbmtzLAoKQ2zDqW1lbnQK
Cgo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKPiAg
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZmhtaW4sIFJJU0NWX0lTQV9FWFRfWlZGSE1JTiksCj4g
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
