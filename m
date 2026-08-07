Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83064C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1ZG4TW+pbl/f51YScYsC0allblitcAP7Ip5+ECbzmE=; b=uaCCs0p1CvEbc0
	z9zye0/KvyW8MHh14BGJRWa4esN1qc+lGYCviBbiGaPJeWCK3+GuZkdplmtt24gLieIj3T/xOIHl7
	KXQiKxB2koNgnF+0OJjYA3rdi36eFL00Ujjuhmg7YIiCCrPWJk8ckZVcC6MM+xQQ1xSWNy7z4QYZH
	7HBhEN7b4i2scU/GwdM0pBUxqzUjFgHh03uxOWmcFtpOIl9b/N5wepZJNawj4pSrtsUIoBeH3yKP9
	shF/AbJIJecVeWFujl0RVm130gW8X6LdjOOzkVlvk72M02kemmLyfPjPzcEQCSINb0S6KNMPC/6n9
	44JhCE7kc/AdlQBCdpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFED-00000007HDp-0rzK;
	Fri, 07 Aug 2026 07:42:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEB-00000007HCh-17ZM
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=; b=o5gA8rAbGrbm+2lm2X0aTxgyoP
	Vfj1LIZUJo+ablaDT4lk2OpIIZ+SzuOJZCkssJLY0Woneqmn7eg0F7nKQ9ZcKrwh+alMhXgjFfK13
	Ur8Gn5i4ESl2OfjMn/L9vjGMhGJU/A/h/tsSymfAp4YvXiUHSRHKzCrdWNf2fxfTJawA+hyDehAfr
	hiNuK+7u5MVGy0NYYuzc8fYJs8UoT26xYe56G+w5wLIsli+/smn38whB31liJnLtWIlChR60/jC2K
	m/Hk4D5fld6I8qJ7uLdy2DNrkCXJJXjz3a80cuyRHmqkCB8EzjS/bRBVNpmFiZZKvFnbdlid8Tsce
	24GG+vFw==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFE7-0000000C9MB-3pRc
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:42:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2540599f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088566; x=1786693366; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=vf8viTkXcc9rR67PlrH21hBNLl9oGug/+toqFmoKLfXF8zVrT9tNMopfNCHE4txBRi
         sTGDzPDuGufyUW87KaqDh0YmRrsfnN70SNKcp4AsXNIT3hGSt5V3S0N1S+2z9KqWD8fC
         ipek6cCBYBMx1IDvcki2subojpHvI5riPD9e6giSP59ILEtoNpo+vd0/dfLLlDidRluN
         AJpulUv9EWT+9DZ48FtNH3gsiV0p0oFnVo7LJx1zxIAUB9C6XQT1RRuHswvvJTQkfwT3
         mk2JGS4L8ZD0IkknBGfSIczLPRVLVBnbw66JCCc8WfSdOBX3HiF0wtuJRQ14xLuvSI/Y
         5e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088566; x=1786693366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sryGv+S1OFsRnB1y6bXfWiD/UiD8x5RMl0nBJ4p29PM=;
        b=eKuZfZMLfo41xOhkCTpzsoXrTKUH8KcCzb3XwEqevh2NOZ/xd65KLEOTljQwlUAPOp
         D/nGrbeJYfKpyNBAsrs2AeEFhE9+nlkNTClsxbzFv/DxokmcNvNv4hi89pr0SO+v8TXm
         PbcJxnHWyDIEheg5jOQlsxrtk8loRtfNXCHsXkeA/1X7bNsjUnRzwqGUXMT/LBDeTwnf
         E4RiXAtLAwor9QY+AS7FWc1bXIM9X690YpMJnk7B+n4bOy09ALDJMxZOtYdjdX/Livdm
         5fPCsVDDAguTqODQRj1fDVR/BILdFGzKVE/F7AE/HuLmVsjFlBzoGiwZv3E9tcJ6ic/b
         SGnA==
X-Forwarded-Encrypted: i=1; AHgh+RppW/aTQRqb/gCH1doUbU5HaRSP5a/5plQGbc2usrU2lHcXE9IqXHVLmNLd0vadeH5cG2iLIe7L0layOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEKF1c7Z0uWsVQVCPp86L5E0LjQ5jynix58xj4dK3oXFUtLTVu
	77BdhUW7J3lWDjzBuG7f7vYFap8+7NVvicgifjEdvSXnig9bddoPZHRH9Wo1zBtda3cU
X-Gm-Gg: AR+sD11CagYKgVDH1Yy5Mthh5+yUeTiK8zpS51E69lOHbR9Fm/DVz4gtvUdS8LlRXTe
	RyvSDFn2xHs5t26FEheBajlj21d5YofF3py93RA1dkM72xgkOa1SyKOUCNmXNEJvUDrqswaS4cL
	eaLNXrpmXwPZa+b2+AO1p46Trsw2gv/o1VzltKqrdNNDxhzRysRI4RsUfmR5Ijy4wAg6Fyk2RTN
	C59hpRORmkV/N9NlbDx3IQj+tg3Mmo+PAg7LO6r0eOq1Zrd/mB9OO0eTY6jpWieDVuRnJhV5r39
	6HXV7XiRGvfv+ooyv8RbKB1t3BvQ0odZQ0s9hXvK5XmZ1kcofBjLDv6Zy9AajPP+7rR0qWIY8gF
	fF57ikgea8qmm+OzO7l3flxdVw/+zXiNwuQ25IaSOdwF1vvnlkJk4LO+0QCwxHPbmZ7qRcPEV48
	R9rFFrqUvxFXCVdMLRKP3HNrhGMAZBaC4DWC/b7EZICY2ddfxxkEr0UFEGU8Fc713MEl/GCxRP8
	Cs83gkNwb9wUTTH7K5+yk0yZI+VT9HvGA==
X-Received: by 2002:a05:6000:4704:b0:47f:6b9a:9d48 with SMTP id ffacd0b85a97d-47fec507a4cmr33818000f8f.13.1786088566064;
        Fri, 07 Aug 2026 00:42:46 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506desm3339493f8f.10.2026.08.07.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:28 -0700 (PDT)
Message-ID: <402b7510-d695-45e6-b39b-e0cd2d61657f@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Randy Dunlap <rdunlap@infradead.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
Content-Language: en-US
In-Reply-To: <df12062e-27ef-454d-b35b-526a88b5c7fa@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084248_171731_5480E974 
X-CRM114-Status: GOOD (  12.80  )
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

Ck9uIDEvNy8yNiAxODo1NCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IE9uIDEvNy8yNiA4OjI4IEFN
LGpvYW9wZWl4b3RvQG9zeXgudGVjaCB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmly
dC9iYW8vaXBjc2htZW0vS2NvbmZpZyBiL2RyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0vS2NvbmZp
Zwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjk2NmJiNzVh
YTQ5NQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvdmlydC9iYW8vaXBjc2htZW0v
S2NvbmZpZwo+PiBAQCAtMCwwICsxLDggQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKPj4gK2NvbmZpZyBCQU9fU0hNRU0KPj4gKwl0cmlzdGF0ZSAiQmFvIGh5cGVydmlz
b3Igc2hhcmVkIG1lbW9yeSBzdXBwb3J0Igo+PiArCWhlbHAKPj4gKwlUaGlzIGVuYWJsZXMgc3Vw
cG9ydCBmb3IgQmFvIHNoYXJlZCBtZW1vcnkgY29tbXVuaWNhdGlvbi4KPj4gKwlJdCBhbGxvd3Mg
dGhlIGtlcm5lbCB0byBpbnRlcmZhY2Ugd2l0aCBndWVzdHMgcnVubmluZyB1bmRlcgo+PiArCXRo
ZSBCYW8gaHlwZXJ2aXNvciwgcHJvdmlkaW5nIGEgY2hhcmFjdGVyIGRldmljZSBpbnRlcmZhY2UK
Pj4gKwlmb3IgZXhjaGFuZ2luZyBkYXRhIHRocm91Z2ggZGVkaWNhdGVkIHNoYXJlZC1tZW1vcnkg
cmVnaW9ucy4KPiBQbGVhc2UgZm9sbG93IERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5
bGUucnN0Ogo+Cj4gMTApIEtjb25maWcgY29uZmlndXJhdGlvbiBmaWxlcwo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+IEZvciBhbGwgb2YgdGhlIEtjb25maWcqIGNvbmZpZ3Vy
YXRpb24gZmlsZXMgdGhyb3VnaG91dCB0aGUgc291cmNlIHRyZWUsCj4gdGhlIGluZGVudGF0aW9u
IGlzIHNvbWV3aGF0IGRpZmZlcmVudC4gIExpbmVzIHVuZGVyIGEgYGBjb25maWdgYCBkZWZpbml0
aW9uCj4gYXJlIGluZGVudGVkIHdpdGggb25lIHRhYiwgd2hpbGUgaGVscCB0ZXh0IGlzIGluZGVu
dGVkIGFuIGFkZGl0aW9uYWwgdHdvCj4gc3BhY2VzLiAgRXhhbXBsZTo6Cj4KPiAgICBjb25maWcg
QVVESVQKPiAJYm9vbCAiQXVkaXRpbmcgc3VwcG9ydCIKPiAJZGVwZW5kcyBvbiBORVQKPiAJaGVs
cAo+IAkgIEVuYWJsZSBhdWRpdGluZyBpbmZyYXN0cnVjdHVyZSB0aGF0IGNhbiBiZSB1c2VkIHdp
dGggYW5vdGhlcgo+IAkgIGtlcm5lbCBzdWJzeXN0ZW0sIHN1Y2ggYXMgU0VMaW51eCAod2hpY2gg
cmVxdWlyZXMgdGhpcyBmb3IKPiAJICBsb2dnaW5nIG9mIGF2YyBtZXNzYWdlcyBvdXRwdXQpLiAg
RG9lcyBub3QgZG8gc3lzdGVtLWNhbGwKPiAJICBhdWRpdGluZyB3aXRob3V0IENPTkZJR19BVURJ
VFNZU0NBTEwuCj4KRml4ZWQgaW4gdjMsIHRoZSBoZWxwIHRleHQgaXMgbm93IGluZGVudGVkIG9u
ZSB0YWIgcGx1cyB0d28gc3BhY2VzOgoKIMKgIGNvbmZpZyBCQU9fU0hNRU0KIMKgIMKgIMKgIHRy
aXN0YXRlICJCYW8gaHlwZXJ2aXNvciBzaGFyZWQgbWVtb3J5IHN1cHBvcnQiCiDCoCDCoCDCoCBo
ZWxwCiDCoCDCoCDCoCDCoCBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQmFvIHNoYXJlZCBtZW1v
cnkgY29tbXVuaWNhdGlvbi4KIMKgIMKgIMKgIMKgIFsuLi5dCiDCoCDCoCDCoCDCoCBJZiB1bnN1
cmUsIHNheSBOLgoKVGhhbmtzIGZvciBjYXRjaGluZyBpdC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
