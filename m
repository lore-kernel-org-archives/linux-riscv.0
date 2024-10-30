Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBA1D5CC81
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2VBvfq41d93i6EViGZBPPR5rDHxNWdj9OeS9zoE684=; b=OkDFCYPpYmzBxO
	9hvnW62ntCdSvnZLSAHE8xe4Oob4LENmJ0Lf2Vx92ldP9MUzWI6/6PaWjKkp0tO2tKTZtYN3Bh9GZ
	HsQ/RJrTh9FwjJLLRo+areeNPr1PerPedeRrikatfsk/pr96JrDRqLUXMRA7obPHaT6fNsblFY/bT
	g8O4YJ84Cq6VWmQEdSq8Xq+0tlCkk5msbbtH0rD7hfoXcHmoqLQMwnIwp453gC6hFFPeFaIJg4ULd
	QSZ8Xh+frsH5nPuomm3Afd0d2GRiXxHAoNowJeMBqlRDUTVItXLZyKS97/RNCHNKmx81O7kCw1o/k
	kPAbmrznQJH22MQjRzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65KB-0000000HRUQ-1Eqc;
	Wed, 30 Oct 2024 09:49:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65K8-0000000HRTc-0qiO
	for linux-riscv@lists.infradead.org;
	Wed, 30 Oct 2024 09:49:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c9978a221so69866515ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730281747; x=1730886547; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSwaSXBIpjqVkyV12CEixJTdRNCxUGANMEGYJ3Ap4Vg=;
        b=NsZqpZDftd2t960l5wYa1IFeR6JPKsq//1O+xhKo1+z6g5yE5UV3uQxGfqwX+3C5hi
         TpnJy8L7j+0a167gucCzqSrwhyAbsK+rqGd/cw1LYOdKN8dQ+6I+h87s9SX4YfJH3Nij
         Fh7XiBztAim63FdjcYxujWwqUAlvMoeUhuGnfkWcCX8mc9ElwNsLNfyckP++cIG4LiBW
         5H0PaZh+mhHqSkymX0+k8Na+JLWZITVOZDPXjfkwzQjYSP4OKWHIeZHc2S8GhY1pc8i8
         GTIO1+0CanMx5ItBw3LlotwCjJlSkB85NMTIrJoQsW42bzOX2i2wO6ZlKcWM44gd4ISF
         nDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281747; x=1730886547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSwaSXBIpjqVkyV12CEixJTdRNCxUGANMEGYJ3Ap4Vg=;
        b=ainqAdefKOF0XQQz1w8A8snq9txjRJ96ZxbcBBxJ1Zpu6S4FJ/Gmd1Sb+xrSkyqQLK
         aR05jCvjEG5P6MJIz0wcFDSiNN5g7WkFWYSdGKBnBI/DMH9vVLDOE7MyDYyVF5dPf/76
         gL7e8KHN62tf88lKrUqmWNMgJcRJxZGnp1VY+v/GfWAbHRa8ckQKVRWgmxFuGgKADqWP
         iFWcIfheBLBGFZ94V8w0LCNDtmHXuekkLzG+/2Drkcg1d9QLBDmVZDiW6LAhRu623BCa
         jJcKK+13WyrmN3tGRYWNhaxb4Y58ot79PGvHmV9ok3MwIiqaVwvNjsT6apZCYtBuGasS
         wysg==
X-Forwarded-Encrypted: i=1; AJvYcCWRTgeIQqVIXb3WpOPMpur20OgUsc7vKOqn7cqmJZdFwDf0CIgkihBoR09iSPr6EJ7YLxr38Ck26I+yzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyu7DWBGVB+V1P9yflTk7RLj6yYP3ssvcAgaud8gtS+b++VlkR
	PVV1WRvbi/RTxlVXjMlMkRtScPR0brsBiebl1jlZANSr3M7Oj+zKPqW0jGaVSZg=
X-Google-Smtp-Source: AGHT+IF5owZ613IN08gSTF1W4NumSlPE9N+GNRcutDlRWZGvuBkpKbCkuSRP83keNi1c5BU43LWC/Q==
X-Received: by 2002:a17:903:124d:b0:20c:5cb1:ddf0 with SMTP id d9443c01a7336-210c68a9c2bmr199322865ad.10.1730281746621;
        Wed, 30 Oct 2024 02:49:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0864d7sm78342745ad.303.2024.10.30.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 02:49:06 -0700 (PDT)
Message-ID: <ca1cb4b8-e206-4bc3-adf3-3801fd05f8e8@rivosinc.com>
Date: Wed, 30 Oct 2024 10:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: hwprobe: export bfloat16 ISA extension
To: Inochi Amaoto <inochiama@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andybnac@gmail.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241028071746.869740-1-inochiama@gmail.com>
 <20241028071746.869740-4-inochiama@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241028071746.869740-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_024908_262885_2F6A6F59 
X-CRM114-Status: GOOD (  15.17  )
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

CgpPbiAyOC8xMC8yMDI0IDA4OjE3LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IEV4cG9ydCBaZmJt
aW4sIFp2ZmJmbWluLCBadmZiZndtYSBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9iZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0t
LQo+ICBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMTIgKysrKysrKysr
KysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgMyArKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdAo+IGluZGV4IDg1YjcwOTI1NzkxOC4uOGMzMGRkMDZmM2MwIDEwMDY0NAo+
IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+IEBAIC0yMzksNiArMjM5LDE4IEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAgICAgIHJhdGlmaWVkIGluIGNvbW1p
dCA5ODkxOGM4NDQyODEgKCJNZXJnZSBwdWxsIHJlcXVlc3QgIzEyMTcgZnJvbQo+ICAgICAgICAg
cmlzY3YvemF3cnMiKSBvZiByaXNjdi1pc2EtbWFudWFsLgo+ICAKPiArICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0VYVF9aRkJGTUlOYDogVGhlIFpmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBv
cnRlZCBhcwo+ICsgICAgICAgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRp
bmcgZnJvbSBjb21taXQgNGRjMjNkNjIyOWRlCj4gKyAgICAgICAoIkFkZGVkIENoYXB0ZXIgdGl0
bGUgdG8gQkYxNiIpLgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkZC
Rk1JTmA6IFRoZSBadmZiZm1pbiBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCj4gKyAgICAgICBk
ZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA0ZGMy
M2Q2MjI5ZGUKPiArICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBCRjE2IikuCj4gKwo+
ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRkJGV01BYDogVGhlIFp2ZmJmd21h
IGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKPiArICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0Mt
ViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDRkYzIzZDYyMjlkZQo+ICsgICAgICAg
KCJBZGRlZCBDaGFwdGVyIHRpdGxlIHRvIEJGMTYiKS4KPiArCj4gICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IERlcHJlY2F0ZWQuICBSZXR1cm5zIHNpbWlsYXIgdmFs
dWVzIHRvCj4gICAgICAgOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX01JU0FMSUdORURfU0NB
TEFSX1BFUkZgLCBidXQgdGhlIGtleSB3YXMKPiAgICAgICBtaXN0YWtlbmx5IGNsYXNzaWZpZWQg
YXMgYSBiaXRtYXNrIHJhdGhlciB0aGFuIGEgdmFsdWUuCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCj4gaW5kZXggMWUxNTNjZGE1N2RiLi45NWQwMGEwNjViNGUgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiBAQCAtNzIsNiArNzIsOSBAQCBzdHJ1
Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRgkJKDFV
TEwgPDwgNDYpCj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDTU9QCQkoMVVMTCA8PCA0
NykKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFXUlMJCSgxVUxMIDw8IDQ4KQo+ICsj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkJGTUlOCSgxVUxMIDw8IDQ5KQo+ICsjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVkZCRk1JTgkoMVVMTCA8PCA1MCkKPiArI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWlZGQkZXTUEJKDFVTEwgPDwgNTEpCgpIaSBJbm9jaGksCgpUaGVzZSBz
aG91bGQgYmUgYWRkZWQgYXMgd2VsbCBpbiBzeXNfaHdwcm9iZS5jIChzZWUgaHdwcm9iZV9pc2Ff
ZXh0MCgpKS4KClRoYW5rcywKCkNsw6ltZW50Cgo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZ
X0NQVVBFUkZfMAk1Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dO
CSgwIDw8IDApCj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAko
MSA8PCAwKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
