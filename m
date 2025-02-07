Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63276C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 14:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDYJZTjZ4KNTFq0pLFxG02JvmbKTSGfTZ543D+dv2W0=; b=EmzIyCOzoqUMcF
	xCf1Vb2g7Nkoi2b9lcq8hsUs29+KMswAtgVh9AiPtLPTttHyYMzb/fmDOVTObuNx5/V5omuWTMhKM
	EPPFo3XMzD0xINOBg2VTqckuQyI+3uh8zVFDvI9nxx45/nO7yCOE4sVQJWQ/yrZImOGbkZ8/abn6Q
	qhc2moiX+6qDoMW6G9KqGiN446GGZieMfyW4kKVosUSUSz7DZoVn5Nrwkzo9qGAJZhWYWGoph3g+b
	Zu+WWmuryI1jfM9DAa/SX8ljIjnf7a1ouRrHa/c9GmvF4euPsbQzlhRLBWGfHmPRGhONCd3IQp5Jp
	+BVpNPUnXqkueSEsO56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPBb-00000009p6h-1m7Q;
	Fri, 07 Feb 2025 14:18:27 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPBY-00000009p5j-2Uwj
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 14:18:25 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-467a17055e6so25849301cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738937903; x=1739542703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fevgwhgyV9gfS8zQNSGcQtEepk5of5A5Wo+7b+adVSo=;
        b=RK4ToKQcPJBCSdo6BYArLQkxXEwIbA81oJcdWfR/D9gDbyWWYqs20hI/RZnvwBVG0Q
         Bm5Rogweyb64WXdz6Ox9UH0lEmrHTWjC2JTIQjjT7Cd0z4Hj8Yf9W8oukJuBb9GOZ//I
         8ixpBwEVhhI8Wj2wqr5mM4qCGWJBO2IPuiTVXG5c1OF3rMiPi3lWygUQYwWV0pgxLyde
         6fmA56QFv5Vt165Z6Mhv3uc5u2uE/gjDsbQfp+5aWb8SS2v1wdTXsQEo9CdMDIumpAFT
         VqPUEmoYY7+tWnsaQQCnvUlBV/7LKeGXZVyX4BuPDSuJf8AUuK8vBZSo2cZrr1YNzyi7
         QMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937903; x=1739542703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fevgwhgyV9gfS8zQNSGcQtEepk5of5A5Wo+7b+adVSo=;
        b=UkZBsB8R8yczfyKwfTrdEPgCvf9s+lYVDpdfuxtl91x58M/fZ7qUVXvE04S5cZA5Gq
         qTlwbn2D1BP4/z3RBgFiSg55DLWfU7ukrHRUEXB3qK3/li0ffuTNxvIrmxV5+sdxJJ8F
         STYQfZGtSeODcRFrn+lN/hZz0pJ6iPayCE5aqeV66jmepP0+44ivt09+LtdY+VJ5HlpB
         CZYGW5AwzEBkl6JsWJ6l4gsMDUgyOaYkX6GX6H7Qo0qhjDyHLGok7XV6QekYCmFNHClp
         3dlmzuan51WSMK4ZgAOEl4H8sF16kNeX+p/MSzd6BjYMz/1fRNhCJk/G4ND7Zp/z94bE
         X+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxAfrW5tDyGPPHCuGXyAIm0ND3PP7R67f0Cf1nwNJckvtlyhakjhVZUBr04aXpTG3y1qPuDJybtIvK+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLhKPhlpxBbaqQ/Rdu3SUmKzgoCD/U2AhBvs/rXlzOlr8UDJSs
	+nrJ/bfmHXeKcC9UMGjJl21br3sjKxRXneIPoBnYXRTOhU2ewGvPjgkrB5lAyyRm/3tMm0l5A1J
	Rz/vPyHT5Bv5yww+9enUMqDJv+tAIil5QiSAJFw==
X-Gm-Gg: ASbGncspZBVtSbkRcGBYxH0VtTb5bmmDmFqVhHiiCXzKi3ge0lejYVpuBgkMbJvuCZ8
	HXl9s03+f3FxXjZ3bz/gEfuvp3iRDIhbYuEnESUCDH01L9YjHrKmG1pT82rGcUt2PVbJVL6a6JM
	O1voR9jH7oV7iZfcKtTyLZ55ZTVbJPXQ==
X-Google-Smtp-Source: AGHT+IEMuvtJCaVWONG8YOiZdpcu/58psXHaP5dFOxnt/g7885Ktc6/fh5sL0G1K7fzdefg2eKdTQn9NCttx7uuGqik=
X-Received: by 2002:a05:622a:20d:b0:467:6cce:44ba with SMTP id
 d75a77b69052e-47167c10654mr48359551cf.43.1738937903454; Fri, 07 Feb 2025
 06:18:23 -0800 (PST)
MIME-Version: 1.0
References: <20250206131926.91289-1-qirui.001@bytedance.com>
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Fri, 7 Feb 2025 19:48:12 +0530
X-Gm-Features: AWEUYZmc9eQPJGwXZsBpVC-3iGr2zbfZs0_g04Yayqq7sIoEU3apQ_8van-Z1HQ
Message-ID: <CAPd4WexHLCv0rHKJxHn=PkzG87HYR7492x2pK1swuA-8aeUmmw@mail.gmail.com>
Subject: Re: [RFC 0/5] riscv: initial support for Generic Hardware Error
 Source (GHES)
To: Rui Qi <qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_061824_642582_A20EAE0D 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: parri.andrea@gmail.com, Anup Patel <apatel@ventanamicro.com>, aou@eecs.berkeley.edu, haibo1.xu@intel.com, ericchancf@google.com, linux-efi@vger.kernel.org, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, palmer@dabbelt.com, guohanjun@huawei.com, linux-riscv@lists.infradead.org, ardb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29ycnkgZm9yIHRoZSBwcmV2aW91cyBlbWFpbCBjb21wb3NlZCBpbiBIVE1MLgoKT24gVGh1LCBG
ZWIgNiwgMjAyNSBhdCA2OjUy4oCvUE0gUnVpIFFpIDxxaXJ1aS4wMDFAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4KPiBGcm9tOiBSdWkgUWkgPHFpcnVpLjAwMUBieXRlZGFuY2UuY29tPgo+Cj4gTk9U
RTogQmVmb3JlIGNvbXBpbGluZyB0aGUga2VybmVsLCBlbmFibGUgQUNQSSwgQVBFSSBhbmQgR0hF
UyBpbiBtZW51Y29uZmlnCj4gVGhlIGZvbGxvd2luZyBvcHRpb25zIG11c3QgYmUgZW5hYmxlZCBp
biAuY29uZmlnIGZpbGUuCj4gICAgQ09ORklHX0hBVkVfQUNQSV9BUEVJPXkKPiAgICBDT05GSUdf
QUNQSV9BUEVJPXkKPiAgICBDT05GSUdfQUNQSV9BUEVJX0dIRVM9eQoKSGkgUnVpIFFpLAoKVGhl
IFJFUkkvUkFTIGlzIGFscmVhZHkgdW5kZXIgYWN0aXZlIGRldmVsb3BtZW50LiBJIGhhdmUgcHJl
c2VudGVkClJJU0MtViBSQVMgc29mdHdhcmUgYXJjaGl0ZWN0dXJlIGluIHZhcmlvdXMgUklTQy1W
IGFuZCBSSVNFIG1lZXRpbmdzLgpZb3UgY2FuIGxpc3RlbiB0byB0aGUgUklTRSBSZWNvcmRpbmcg
KGxpbmsgYmVsb3cpIG9mIHRoZSBzb2Z0d2FyZQphcmNoaXRlY3R1cmUgKHByZXNlbnRlZCBvbiBK
dW5lIDI2LCAyMDIzKS4KCmh0dHBzOi8vem9vbS51cy9yZWMvc2hhcmUvSFZDWTFRbUtWaFZhMzJx
UWlTSU9jMk9NM3ZnTDlWZzV3bE9GS1pIR091Y2k4ekJIVmtpZ0dOSnVhaVdFQmxzTC52TFlHbEd5
aFFxMjZUQ2ZVCgpJIGFsc28gcG9zdGVkIGFuIGluaXRpYWwgUG9DIGZvciBSRVJJIGVtdWxhdGlv
biBpbiBRZW11IGFuZCBSQVMKaGFuZGxpbmcgaW4gTGludXgga2VybmVsICBpbiAyMDIzLgpUaGUg
ZGV0YWlscyBvbiBpbml0aWFsIFBvQyBmb3IgUkVSSS9SQVMgY2FuIGJlIGZvdW5kIGluIHRoZSBs
aW5rcyBiZWxvdzoKCkluaXRpYWwgUkVSSS9SQVMgUG9DOgpodHRwczovL2xpc3RzLnJpc2N2Lm9y
Zy9nL3RlY2gtcmFzLWVyaS90b3BpYy9yZXJpX3Jhc19wb2NfZm9yX3Jpc2Nfdi8xMDIyMjQxMDEK
UkVSSS9SQVMgUG9DIHVwZGF0ZToKaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLXBycy90
b3BpYy91cGRhdGVfb25fcmVyaV9yYXNfcG9jX2Zvci8xMDY3MzcxMzUKCkl0IGlzIGEgY29tcHJl
aGVuc2l2ZSBkZXNpZ24gd2hpY2ggaW5jbHVkZXMgdGhlIHByb3Bvc2l0aW9uIG9mIGhpZ2hlc3QK
cHJpb3JpdHkgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMoU1NFKS4KVGhlIGNoYXB0ZXIgMTcg
b2YgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIGlzIGFib3V0IHRoZSBkZXNpZ24gb2YgU1NFLgpCZWxv
dyBpcyB0aGUgbGluayBmb3IgdGhlIHNhbWUuCk9wZW5TQkk6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvZG93bmxvYWQvdjMuMC1yYzMvcmlz
Y3Ytc2JpLnBkZgoKTXkgcGF0Y2ggc2V0IGlzIHdhaXRpbmcgZm9yIHJlbGVhc2Ugb2YgU0JJIHNw
ZWNpZmljYXRpb24gdjMuMCB3aGljaCBpcwppbiByYzMgcmlnaHQgbm93IGFuZCBwZW5kaW5nIEVD
UiBjaGFuZ2VzCmZvciBwcm9jZXNzb3IgdHlwZSBhbmQgSVNBIHN0cmluZ3MgYW1vbmcgb3RoZXIg
UklTQy1WIHNwZWNpZmljIGNoYW5nZXMgaW4gQUNQSS4KCkkgd2lsbCBzZW5kIG15IHBhdGNoZXMg
YXMgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIHYzLjAgaXMgcmVsZWFzZWQuCk1lYW53aGlsZSwgSSB3
aWxsIHNlbmQgdGhlIFJGQwpwYXRjaGVzIGZvciBldmVyeW9uZS4KCk1lYW53aGlsZSBwbGVhc2Ug
Z28gdGhyb3VnaCB0aGUgcHJvcG9zZWQgZGVzaWduLgoKVGhhbmtzClJlZ2FyZHMKSGltYW5zaHUK
Cj4KPiBUaHJvdWdoIGZhdWx0IGluamVjdGlvbiwgd2UgY2FuIHNlZSB0aGUgZm9sbG93aW5nIGV4
YW1wbGUgb3V0cHV0Cj4KPiBbSGFyZHdhcmUgRXJyb3JdOiBIYXJkd2FyZSBlcnJvciBmcm9tIEFQ
RUkgR2VuZXJpYyBIYXJkd2FyZSBFcnJvciBTb3VyY2U6IDAKPiBbSGFyZHdhcmUgRXJyb3JdOiBl
dmVudCBzZXZlcml0eSBpbmZvCj4gW0hhcmR3YXJlIEVycm9yXTogRXJyb3IgMCwgdHlwZTogY29y
cmVjdGVkCj4gW0hhcmR3YXJlIEVycm9yXTogIHNlY3Rpb25fdHlwZTogbWVtb3J5IGVycm9yCj4g
W0hhcmR3YXJlIEVycm9yXTogICBlcnJvcl9zdGF0dXM6IFN0b3JhZ2UgZXJyb3IgaW4gRFJBTSBt
ZW1vcnkgKDB4MDE4ZDg0ODAwMTkzMDRmMCkKPiBbSGFyZHdhcmUgRXJyb3JdOiAgbm9kZTowIGNh
cmQ6MCBtb2R1bGU6MCByYW5rOjAgYmFuazowIGRldmljZTowIHJvdzowIGNvbHVtbjowCj4gW0hh
cmR3YXJlIEVycm9yXTogIGVycm9yX3R5cGU6IDIsIHNpbmdsZS1iaXQgRUNDCj4gW0hhcmR3YXJl
IEVycm9yXTogRXJyb3IgMSwgdHlwZTogY29ycmVjdGVkCj4gW0hhcmR3YXJlIEVycm9yXTogIHNl
Y3Rpb25fdHlwZTogRmxsZSBlcnJvcgo+IFtIYXJkd2FyZSBFcnJvcl06ICBwb3J0X3R5cGU6IDQs
IHJvb3QgcG9ydAo+IFtIYXJkd2FyZSBFcnJvcl06ICB2ZXJzaW9uOiAzLjAKPiBbSGFyZHdhcmUg
RXJyb3JdOiAgY29tbWFuZDogMHgwMTQ2LCBzdGF0dXM6IDB4MDAxMQo+IFtIYXJkd2FyZSBFcnJv
cl06ICBkZXZpY2VfaWQ6IDAwMDA6MDA6MDAsMAo+IFtIYXJkd2FyZSBFcnJvcl06ICBzbG90OiAw
Cj4gW0hhcmR3YXJlIEVycm9yXTogIHNlY29uZGFyeV9idXM6IDB4MDEKPiBbSGFyZHdhcmUgRXJy
b3JdOiAgdmVuZG9yX2lkOiAweDFlOTMsIGRldmljZV9pZDogMHgxMDEwCj4gW0hhcmR3YXJlIEVy
cm9yXTogIGNsYXNzX2NvZGU6IDA2MDQwMAo+IFtIYXJkd2FyZSBFcnJvcl06ICBicmlkZ2U6IHNl
Y29uZGFyeV9zdGF0dXM6IDB4MDAwMCwgY29udHJvbDogMHgwMDAzCj4gW0hhcmR3YXJlIEVycm9y
XTogIGFlcl9jb3Jfc3RhdHVzOiAweDAwMDAxMDAwLCBhZXJfY29yX21hc2s6IDB4MDAwMDAwMAo+
IFtIYXJkd2FyZSBFcnJvcl06ICBhZXJfdW5jb3Jfc3RhdHVzOiAweDAwMDAwMDAwLCBhZXJfdW5j
b3JfbWFzazogMHgwNDAwMDAwMAo+IFtIYXJkd2FyZSBFcnJvcl06ICBhZXJfdW5jb3Jfc2V2ZXJp
dHk6IDB4MDA0ZTMwMzAKPiBbSGFyZHdhcmUgRXJyb3JdOiAgVExQIEhlYWRlcjogMDAwMDAwMDAw
IDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwCj4KPgo+IFJ1aSBRaSAoNSk6Cj4gICByaXNjdjog
c2VsZWN0IEhBVkVfQUNQSV9BUEVJCj4gICBlZmk6IGFkZCByaXNjdiBBUEVJIGdlbmVyaWMgcHJv
Y2Vzc29yIGVycm9yIHByaW50aW5nIHN1cHBvcnQKPiAgIHJpc2N2OiBhZGQgZml4IG1hcCBpbmRl
eCBmb3IgR0hFUyBJUlEKPiAgIFJJU0MtVjogQUNQSTogZGVmaW5lIGFyY2hfYXBlaV9nZXRfbWVt
X2F0dHJpYnV0ZQo+ICAgUklTQy1WOiBkZWZpbmUgaW9yZW1hcF9jYWNoZQo+Cj4gIGFyY2gvcmlz
Y3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
YWNwaS5oICAgfCAxOCArKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9maXhtYXAuaCB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmggICAgIHwg
IDUgKysrKysKPiAgZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jICAgICB8ICA0ICsrKysKPiAg
NSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4KPiAtLQo+IDIuMjAuMQo+Cj4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
