Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF17F013DA
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsFGbH0Q0KPLuePEQnsrwV9kLaca1+nP4aFFmmolExY=; b=OH6RN0MVy2K4HW
	/uXfvBq/m2wGg8VKcS8tWniiBrXfh6ujtwnMPEJAnHoxgq+oELc32AdyolMNBouWQE/RRrfrzZkJj
	vesXwP3ZM2OAMDcf9oaUXAOJsVRUGqDt4et3zGgIpQehSQeUXd+9Ew3OVW9VYDctyTve+f4YTTe0c
	r6bGT6j9bBm1CObweL3aJ6AmNS/aQzycT3gUp7qTInIeJfBv63eAwftqpMKbFzpjCj9KTSX4lNY4o
	8MatmId29wqQf9PcMb9ZQz4vkOYDUS24qUr1UbPL1K8LlBpu/m/ARfz8HAlaZaO1yRSKN3OIeDVTk
	pGr6SGjsHXZWbaZUgKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23sa-00000003b8C-11fT;
	Mon, 16 Mar 2026 09:04:52 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23sX-00000003b7f-4Aaz
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 09:04:51 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-64ca6595c8aso3999475d50.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 02:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773651888; cv=none;
        d=google.com; s=arc-20240605;
        b=Ki6qwOpJcM5/cza8L9L05Si7E6uXzsU6pcxhwgRc3G7eUNWCRQuHUcBjMKymsj5cGv
         RGmf7i+XSXTC8qabTo8AAYYmpXyPDHAKvOglmuwzUPKSrHHGNBdAtU48k6qFdx+c1d9s
         S6YRB4anIIWJ9Ny0H7Ec1njxGFa1WAHnYqnZebVjL6xoGBr9uHh0TSRIZHpYc6eNPKL6
         C/2/rkpeNi2MwG3B+kqB2YM+xty8MoSS+aBaYpNZG9qPmKRj7UTz4bWpApu1W+vHpbzJ
         LwZAl3FPM6/pyX6mIcO8A2nZguNSJ237eKpQOIM5l8kGjf4jw5fquNcN925Pu97XthQ0
         BygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        fh=eDdoJwv6WIwWaHFcP6PRXfeFbZC2ehiY2HGmBYDgSy0=;
        b=J9ArtqWrq/OGqhgut1w/BPqAsp80XRusLAIDe9aVJX3lBoakTfFp8bWKHIy77e9Abv
         OHPKmLZ/nVR2Mcg/uzJSUTWD9/5IE0p0QrHUQA2VyhEYbDp3KEumkxLQpGWlCgF9g7fH
         G+HLeSpw6QdVVuo+33TEFMquuiN696eBXYWFpw6z6PPDTJhUmzppccLcWoXGMwsFMC7x
         2fgFQVMB/PHJL7aGzpgNORQaASrUuF5PI0WlJluqcqevHXrYH76i5kM075w9s+v4k5nx
         XwRN3gqUYfkZi5EEvWHNxbI6sSUeH6YCgU0nXkqfoocGsSD9r1AWRou8I8b8/7PUeWta
         2SGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773651888; x=1774256688; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        b=jUNEJm2sxX6w6Frh2vc1FYVayRBMe3IIqi/MWzrbQx93WdwvyCtev8hrUx+FLi3KSm
         +27utAe4K7eCr6SJC7dhnJrQBj4DE/g80RO9vSXgIhE1uRK7MNC+vYr74SGXdG4LDeio
         mf3bAYQjJ1luyTXhBIYZ5NOGAagz5X1SQt4uUSBsm54+DniujNw1jWyk72GIOlHrTLYq
         r31cQ0PY3qANiK7NtZNEMLy5h+vBLMZd/7s3+DXiDiSXpYX2QRXZP3xoXeGAHR8/PRjD
         J1rrgMZvuxZOVOwmEnknLDnzlKTRD5ZS6ZyiC8HJxTpRAdYtJPElLCzFMDoRv+fQT3r3
         p2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651888; x=1774256688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eAjnnl6SnN5G12YdBWuTcivnsr1WNsEqrmyCn5/LX4=;
        b=jvasppuf/KFgLUEx8vSd6avrJB/omSypTRiz8pwOvaAVd8D60taly2rgGxG/Veb1mw
         lJfBl2gMErqIHrZ85lkUp6lyK3ExKb3zKn692W74sIuW8sjMZn5q3G+QLX5OzFtzv8lR
         8hTd9/7wchHWynXH+Q18MSJ7QdW2F722FHFk3p0NYiUEPvVXUNex0xeuQB5SEkiLoQzO
         SjaqoVVrLieBljMBbdPJePpIvPKER1pw0jz1dXj27L4HE/zpSFVekHgS8MUCWTnY+5Yo
         TkmY80a6dEHqcHMewoKmC6vLdBYR+y+KkIjK+dCylhDE9pcSHI6kDp6AxGDmQ5DoJin0
         X18A==
X-Forwarded-Encrypted: i=1; AJvYcCXjl+f8EQgGAL0i2NTbvP0ZL70C5TlL3per7yZvBF/h9F4x75XB82FsjEJ0gborzo863dJbfFH42nsG/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kwgfejFb/ecyzEP1c3JGmBH5ddfsInzJW09aEu/B1ljFHfdm
	60EV9YuZnGM2DBICjpNgtPfwFUzLh5OdqYdqCsYyHEZtc83PhVMZ+UfyV4qGU9zCJvsOtAQleh2
	U3e+WR57RqyCEaFl4DxGpHbCvGkL+918=
X-Gm-Gg: ATEYQzwQ5/z41GV9fyKQNkYn2xhpyAb7X2HBZXMTJt0HEofwlzGkYSy1zCiCydcodTV
	NFkrCpFlIIW/nw8+uWBO4GnZ1PzXm1nBOKlpwuXyOBPwRUHc/Jbny9afhnaq1Gmz1km392hYhKB
	Tp+l/MNiPwzQBW8wpol61yAIvdFxcqLfg0DJ/8/+XADgoeLR8c2851C0W2DOC6gh07BwarY1JYn
	uUb7KdN6iADKgclL5U7IzQQk4xkYfy/1RNBea6FAMdqFDKlBj4wqenCcsk19gyND07dZy2xvW6B
	MYIctjY=
X-Received: by 2002:a05:690c:6d0f:b0:79a:3655:9dfa with SMTP id
 00721157ae682-79a3655a11amr66434377b3.16.1773651888381; Mon, 16 Mar 2026
 02:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-1-5bb2b574df5d@gmail.com> <a416dc43-58fd-4462-9ec5-b3dadbbacf8b@intel.com>
In-Reply-To: <a416dc43-58fd-4462-9ec5-b3dadbbacf8b@intel.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 10:04:37 +0100
X-Gm-Features: AaiRm50b9bQG2sxK_4vk8EljAgLA7HxFRVGyEcc1jQLOb023E3q4ta5OL-EXqAs
Message-ID: <CABdCQ=PeB5hhkk3eO3Mu89bb7m=4ccZrwouuZScGOTHwN5owQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] mmc: sdhci-of-k1: enable essential clock
 infrastructure for SD operation
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_020450_043221_C285F30B 
X-CRM114-Status: GOOD (  16.08  )
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

RWwgdmllLCAxMyBtYXIgMjAyNiBhIGxhcyAxNDowNCwgQWRyaWFuIEh1bnRlcgooPGFkcmlhbi5o
dW50ZXJAaW50ZWwuY29tPikgZXNjcmliacOzOgo+Cj4gT24gMDkvMDMvMjAyNiAxMzo0MCwgSWtl
ciBQZWRyb3NhIHdyb3RlOgo+ID4gRW5zdXJlIFNEIGNhcmQgcGlucyByZWNlaXZlIGNsb2NrIHNp
Z25hbHMgYnkgZW5hYmxpbmcgcGFkIGNsb2NrCj4gPiBnZW5lcmF0aW9uIGFuZCBvdmVycmlkaW5n
IGF1dG9tYXRpYyBjbG9jayBnYXRpbmcuIFJlcXVpcmVkIGZvciBhbGwgU0QKPiA+IG9wZXJhdGlv
biBtb2Rlcy4KPgo+IE5lZWQgdG8gc2F5IHdoeSB1cGRhdGUgdG8gIlNQQUNFTUlUX1NESENfTEVH
QUNZX0NUUkxfUkVHIiBpcyBPayBmb3IKPiBub24tU0QKCkFmdGVyIGFuYWx5emluZyB0aGUgcmVm
ZXJlbmNlIGRyaXZlciBpbXBsZW1lbnRhdGlvblsxXSwgdGhlClNESENfTEVHQUNZX0NUUkxfUkVH
IHNldHRpbmcgaXMgYXBwbGllZCB0byBib3RoIGVNTUMgYW5kIFNECmNvbnRyb2xsZXJzLgoKVGhl
IHJlZmVyZW5jZSBkcml2ZXIgc2V0cyBHRU5fUEFEX0NMS19PTiBmb3IgYW55IGNvbnRyb2xsZXIg
d2l0aApNTUNfQ0FQMl9OT19TRElPIHNldCAoU0RJTyBkaXNhYmxlZCkuIFNpbmNlIGJvdGggb3Vy
IGVNTUMgYW5kIFNECmNvbnRyb2xsZXJzIGhhdmUgbm8tc2RpbzsgaW4gdGhlaXIgZGV2aWNlIHRy
ZWUgY29uZmlndXJhdGlvbnMsIGJvdGgKc2hvdWxkIHJlY2VpdmUgdGhpcyBzZXR0aW5nLgoKWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFuZ2VwaS14dW5sb25nL2xpbnV4LW9yYW5nZXBpL2Jsb2Iv
b3JhbmdlLXBpLTYuNi1reS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLXgxLmMjTDQ4MgoKPgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyB8IDEzICsrKysr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMgYi9kcml2ZXJzL21tYy9o
b3N0L3NkaGNpLW9mLWsxLmMKPiA+IGluZGV4IDBjYzk3ZTIzYTJmOWM3YjJmOTM3NjMxOGE4YTdl
YmI4NjA1NzE1MDQuLjU4NWM3ZWNhNmViZjI1M2FhYzQ2NmRkMzdjZWYwMjlkZWI2M2Y2OTIgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwo+ID4gQEAgLTIwLDYgKzIwLDEzIEBACj4gPiAg
I2luY2x1ZGUgInNkaGNpLmgiCj4gPiAgI2luY2x1ZGUgInNkaGNpLXBsdGZtLmgiCj4gPgo+ID4g
KyNkZWZpbmUgU1BBQ0VNSVRfU0RIQ19PUF9FWFRfUkVHICAgICAweDEwOAo+ID4gKyNkZWZpbmUg
IFNESENfT1ZSUkRfQ0xLX09FTiAgICAgICAgICBCSVQoMTEpCj4gPiArI2RlZmluZSAgU0RIQ19G
T1JDRV9DTEtfT04gICAgICAgICAgIEJJVCgxMikKPiA+ICsKPiA+ICsjZGVmaW5lIFNQQUNFTUlU
X1NESENfTEVHQUNZX0NUUkxfUkVHICAgICAgICAweDEwQwo+ID4gKyNkZWZpbmUgIFNESENfR0VO
X1BBRF9DTEtfT04gICAgICAgICBCSVQoNikKPiA+ICsKPiA+ICAjZGVmaW5lIFNQQUNFTUlUX1NE
SENfTU1DX0NUUkxfUkVHICAgMHgxMTQKPiA+ICAjZGVmaW5lICBTREhDX01JU0NfSU5UX0VOICAg
ICAgICAgICAgQklUKDEpCj4gPiAgI2RlZmluZSAgU0RIQ19NSVNDX0lOVCAgICAgICAgICAgICAg
ICAgICAgICAgQklUKDIpCj4gPiBAQCAtMTAwLDYgKzEwNywxMiBAQCBzdGF0aWMgdm9pZCBzcGFj
ZW1pdF9zZGhjaV9yZXNldChzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCwgdTggbWFzaykKPiA+Cj4g
PiAgICAgICBpZiAoIShob3N0LT5tbWMtPmNhcHMyICYgTU1DX0NBUDJfTk9fTU1DKSkKPiA+ICAg
ICAgICAgICAgICAgc3BhY2VtaXRfc2RoY2lfc2V0Yml0cyhob3N0LCBTREhDX01NQ19DQVJEX01P
REUsIFNQQUNFTUlUX1NESENfTU1DX0NUUkxfUkVHKTsKPiA+ICsKPiA+ICsgICAgIHNwYWNlbWl0
X3NkaGNpX3NldGJpdHMoaG9zdCwgU0RIQ19HRU5fUEFEX0NMS19PTiwgU1BBQ0VNSVRfU0RIQ19M
RUdBQ1lfQ1RSTF9SRUcpOwo+ID4gKwo+ID4gKyAgICAgaWYgKGhvc3QtPm1tYy0+Y2FwczIgJiBN
TUNfQ0FQMl9OT19NTUMpCj4gPiArICAgICAgICAgICAgIHNwYWNlbWl0X3NkaGNpX3NldGJpdHMo
aG9zdCwgU0RIQ19PVlJSRF9DTEtfT0VOIHwgU0RIQ19GT1JDRV9DTEtfT04sCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1BBQ0VNSVRfU0RIQ19PUF9FWFRfUkVHKTsK
PiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIHNwYWNlbWl0X3NkaGNpX3NldF91aHNfc2lnbmFs
aW5nKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1bnNpZ25lZCBpbnQgdGltaW5nKQo+ID4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
