Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D645C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyse3WfHa50JnLL7AnLHARhCoqTyGXxhdI5QCzoqruI=; b=mtkPKLNXGc9Ixt
	OMY5kjngYc1OxWbpv+TRu1E+KhO+nX8VlD6S5mO2a1VAIPGN3NXCxibZoUr86bLz/ZLDOG/0Xeu9u
	zqEk0Y+LXGBrwgTCR3p9J+0wQde03UHUOQcl/nOvh2ajepM8UFF12q+/GSXWMJ7ZryUL296OfJat/
	twqT3IuhqIVB5flkljtwsOER5PhdX5pYctlX4fAobq+ni1UgjcVmItdOoYLKH4f6t7B+zIMMP1BVr
	kv2vcsCONCUFdqfYCF4yRevjloTkQlbkA/QlAOiAykBiq4ila3GpGRu2zFYan3gGmHzcXEESXO+bF
	S8UqQo+z5/nrB/5k4/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkn0f-0000000EqGf-1JH0;
	Thu, 14 Mar 2024 15:28:45 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkn0c-0000000EqGF-2SqQ
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 15:28:44 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33e808c70a6so261836f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710430120; x=1711034920; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogqUjcgdsbbqx+uWzoBm8wXuL9S08fyRbZDDtDiYV3Y=;
        b=aw8maWb646/vU/iVUs10MNNdZjYfukjujaWrzGweiaf48HRECcY+81+DZlw56+Rh3G
         JshVv00AGKDislb16YQJvsYvBk8bjY+ELquWI2a92WZoH/TNx7AEgW9zK2CCgC+9wSdY
         9BuH+f8FSEpAb7N1rfh/HX37Xj/TifqtXUFg9ySONZP49Rh97/l8QqDQGhMlaAbCuU2h
         AhW5XrF62XmtVwiY6agwEB30UWiZaQi+vR55LIjtDoc4vTzXuKIv0qL1QwKutmfNI9UD
         bwxAEWAnvUvRr2rKrXvdxvtzViFLTKpu5pyxJ5EWUXCF7Ne1fnb0d1HggAPYyN+EfvzK
         f9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430120; x=1711034920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogqUjcgdsbbqx+uWzoBm8wXuL9S08fyRbZDDtDiYV3Y=;
        b=pMHnA0+DFix5g31CloKq519nKOLLaOfDVsRoIop7wlZBqNDlmdo+PAERTZtF8gOD6+
         qu9g61FbrCUQTK5E7t03ea3slQ8w8Y1cRe7yEJ4S/2QiKCgCJoLmuWjrLWOqYc3Ydbn+
         kKLRt1toP1L6ogFXPDOYHmMcRg31gZUmK1q2Er6JSaYDpPjvU7MBqAHDO2U147fDhVZg
         s0aAz6eP3j+iHYTO4xsSjC2WhpyA6mLFhuIS5nk1Y0zxBS/0pwUvqGtSpd/8mhjtiXRu
         WQNZJ/x4w7hcUOqS/b9djlg67IJXYlDybqrawTpTffXNGijEHLQL2UfaunfLcg3YhYK+
         SUDA==
X-Forwarded-Encrypted: i=1; AJvYcCXLpbqrhAXZR3OY5DLkKHnhKx8FJwNWcat7e1+TEYnMZKdDTPqhoLeYmRNvx251q5kgKUp8zo11EtTq+nwYlJYrvXA+2qw0ah8RXA5xPj3S
X-Gm-Message-State: AOJu0YymVyTQf6eUmgKlRfyv7871LtAWxYWtwiUQnpZ8IMSFSSzYoUZD
	YPDkviN88b3AIS0syt4dX2yTBGpfYrFmkOZE4eAViKgIPKdVedjMYc3pQbDxNWg=
X-Google-Smtp-Source: AGHT+IF73Z2XgNrZrREtentfiM6WCV/+DEyiJa2X2CtN4ecXU+GHgfsY2N0vrtTNB9T+YPaTM7qljQ==
X-Received: by 2002:a05:600c:520d:b0:413:f035:315e with SMTP id fb13-20020a05600c520d00b00413f035315emr1750852wmb.1.1710430119475;
        Thu, 14 Mar 2024 08:28:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06? ([2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06])
        by smtp.gmail.com with ESMTPSA id d4-20020a05600c3ac400b00413ee4bcde8sm2689537wms.13.2024.03.14.08.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:28:39 -0700 (PDT)
Message-ID: <b30700ec-8cf5-400d-b877-5f0f15dd38ad@rivosinc.com>
Date: Thu, 14 Mar 2024 16:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2, 6/7] riscv: hwprobe: add zve Vector subextensions into
 hwprobe interface
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, conor.dooley@microchip.com,
 guoren@linux.alibaba.com, bjorn@kernel.org, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Jones <ajones@ventanamicro.com>,
 Costa Shulyupin <costa.shul@redhat.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
 <20240314142542.19957-7-andy.chiu@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240314142542.19957-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_082842_651171_2E252C58 
X-CRM114-Status: GOOD (  17.71  )
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

CgpPbiAxNC8wMy8yMDI0IDE1OjI1LCBBbmR5IENoaXUgd3JvdGU6Cj4gVGhlIGZvbGxvd2luZyBW
ZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVtYmVkZGVkIiBwbGF0Zm9ybXMgYXJlIGFkZGVkCj4g
aW50byBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzA6Cj4gIC0gWlZFMzJYCj4gIC0gWlZFMzJG
Cj4gIC0gWlZFNjRYCj4gIC0gWlZFNjRGCj4gIC0gWlZFNjRECj4gCj4gRXh0ZW5zaW9ucyBlbmQg
d2l0aCBYIG1lYW4gdGhlIHBsYXRmb3JtIGRvbid0IGhhdmUgYSBWZWN0b3IgRlBVLgoKTWF5YmUg
cmVwaHJhc2UgaXQgbGlrZSB0aGF0OgoKIkV4dGVuc2lvbnMgZW5kaW5nIHdpdGggYW4gWCBpbmRp
Y2F0ZXMgdGhhdCB0aGUgcGxhdGZvcm0gZG9lc24ndCBoYXZlIGEKdmVjdG9yIEZQVSIKCj4gRXh0
ZW5zaW9ucyBlbmQgd2l0aCBGL0QgbWVhbiB3aGV0aGVyIHNpbmdsZSAoRikgb3IgZG91YmxlIChE
KSBwcmVjaXNpb24KCiJFeHRlbnNpb25zIGVuZGluZyB3aXRoIEYvRCBtZWFuIHRoYXQgd2hldGhl
ciBzaW5nbGUgKEYpIG9yIGRvdWJsZSAoRCkKcHJlY2lzaW9uIHZlY3RvciBvcGVyYXRpb24gaXMg
c3VwcG9ydGVkIgoKPiBWZWN0b3Igb3BlcmF0aW9uIGlzIHN1cHBvcnRlZC4KPiAKPiBUaGUgbnVt
YmVyIDMyIG9yIDY0IGZvbGxvd3MgZnJvbSBaVkUgdGVsbHMgdGhlIG1heGltdW0gZWxlbWVudCBs
ZW5ndGguCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNv
bT4KPiAtLS0KPiBDaGFuZ2Vsb2cgdjI6Cj4gIC0genZlKiBleHRlbnNpb25zIGluIGh3cHJvYmUg
ZGVwZW5kcyBvbiB3aGV0aGVyIGtlcm5lbCBzdXBwb3J0cyB2LCBzbwo+ICAgIGluY2x1ZGUgdGhl
bSBhZnRlciBoYXNfdmVjdG9yKCkuIEZpeCBhIHR5cG8uIChDbMOpbWVudCkKPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDE1ICsrKysrKysrKysrKysrKwo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDUgKysrKysKPiAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICA1ICsrKysrCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKPiBpbmRleCBiMmJjYzllZWQ5YWEuLmQwYjAyZTAxMmU1ZCAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtMTg4LDYgKzE4OCwyMSBAQCBUaGUgZm9sbG93
aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4gICAgICAgICBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21t
aXQgOTVjZjFmOSAoIkFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBWZWQKPiAgICAgICAgIGR1cmlu
ZyBzaWdub2ZmIikKPiAgCj4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJY
YDogVGhlIFZlY3RvciBzdWItZXh0ZW5zaW9uIFp2ZTMyeCBpcwo+ICsgICAgc3VwcG9ydGVkLCBh
cyBkZWZpbmVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBt
YW51YWwuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyRmA6IFRo
ZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmUzMmYgaXMKPiArICAgIHN1cHBvcnRlZCwgYXMgZGVm
aW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFs
Lgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NFhgOiBUaGUgVmVj
dG9yIHN1Yi1leHRlbnNpb24gWnZlNjR4IGlzCj4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQg
YnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPiAr
Cj4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRGYDogVGhlIFZlY3RvciBz
dWItZXh0ZW5zaW9uIFp2ZTY0ZiBpcwo+ICsgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZl
cnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCj4gKwo+ICsg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RGA6IFRoZSBWZWN0b3Igc3ViLWV4
dGVuc2lvbiBadmU2NGQgaXMKPiArICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9u
IDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+ICsKPiAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFp
bnMgcGVyZm9ybWFuY2UKPiAgICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9m
IHByb2Nlc3NvcnMuCj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IGlu
ZGV4IDlmMmE4ZTNmZjIwNC4uYjlhMDg3NmU5NjlmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oCj4gQEAgLTU5LDYgKzU5LDExIEBAIHN0cnVjdCByaXNjdl9od3Byb2Jl
IHsKPiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwgMzMpCj4gICNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pBQ0FTCQkoMVVMTCA8PCAzNCkKPiAgI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM1KQo+ICsjZGVmaW5lCQlSSVNDVl9I
V1BST0JFX0VYVF9aVkUzMlgJKDFVTEwgPDwgMzYpCj4gKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pWRTMyRgkoMVVMTCA8PCAzNykKPiArI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZF
NjRYCSgxVUxMIDw8IDM4KQo+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEYJKDFV
TEwgPDwgMzkpCj4gKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RAkoMVVMTCA8PCA0
MCkKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQo+ICAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQo+ICAjZGVmaW5lCQlSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMKPiBpbmRleCBhN2M1NmI0MWVmZDIuLmRiNzQ5NTAwMWYyNyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYwo+IEBAIC0xMTMsNiArMTEzLDExIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gIAkJRVhUX0tFWShaSUNPTkQp
Owo+ICAKPiAgCQlpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gKwkJCUVYVF9LRVkoWlZFMzJYKTsKPiAr
CQkJRVhUX0tFWShaVkUzMkYpOwo+ICsJCQlFWFRfS0VZKFpWRTY0WCk7Cj4gKwkJCUVYVF9LRVko
WlZFNjRGKTsKPiArCQkJRVhUX0tFWShaVkU2NEQpOwo+ICAJCQlFWFRfS0VZKFpWQkIpOwo+ICAJ
CQlFWFRfS0VZKFpWQkMpOwo+ICAJCQlFWFRfS0VZKFpWS0IpOwoKV2l0aCBjb21taXQgdHlwbyBm
aXhlZCwKClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
CgpUaGFua3MsCgpDbMOpbWVudAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
