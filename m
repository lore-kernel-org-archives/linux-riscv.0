Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B3C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ISD7p+xVlsHAmeGjsUVPvlnUyxysXLa7vk2/4IzrGI=; b=aiVaGdceO5OuWV
	3u6BtJSeGPUkI8uE64up1Dextx4m0Ng0ydAf/RVpbRkD7xjL7NA8MI9YllIzhYhNkkyK/OdSuVxX3
	czDOKdUhoY3uzY9Vhz/M3PsO1WIyvET68DvNV8WICKk1FJD2gUJc3On7T1qeQpk+G7xaR6Meed9gd
	dL3G5JU8Vh+LoTiSw9tQa4I3ugVWFQ6ziATEGfWeWLjKVxoqoYm/LGiw4njf4Idjs/Ms+TFC5pSxe
	xgFju7CXCKRKSVadR5ta81/OodZcgNUa5NSPqo5IvgEEP0LgA50QcnoJjhhLXDGlHQuWqd1trwEEa
	K6qeE+kr1+6OzAE8wL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1Sh-00000005nG6-1kaF;
	Tue, 12 Mar 2024 12:42:31 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1Se-00000005nEo-2HIQ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:42:30 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d358acc8cbso16312581fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710247344; x=1710852144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jW3q55GFl3Z/GS7sRu4xexojc9afK4hCW+lQcVEcFe8=;
        b=rL1vVy2J82aQT4nVV408IUOdFlFf/qawLaNOiQ5FoUAqWCbchT4KU2K6/SKR5I4WXy
         4PFf4IqpP0TtZoLYxai4rGcj8+lhPOLx/HDXTZ8QQmi1bgae3ruhcvDdBZRxafYnPKQM
         lIVpBFo1gZE4vJ8X2Pj/nYEVZEkLjhTT/gqP1y6aTHN/CkOF9vivm8U7Hac3w7uvZIk+
         0sNjY5sjyRPf1r5eyvc3RDfBQn7OA0uiSsU9hDIEyFrhj6n6NOzbWmglqQ6q01hXKFIr
         +QHMCobSPJkRGxyG2FbR2dg/HWKFXLyOPBmMLE3i7odJ1WHtyPtYLRY2o3ExL2Cdm8sV
         O8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247344; x=1710852144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jW3q55GFl3Z/GS7sRu4xexojc9afK4hCW+lQcVEcFe8=;
        b=JKT4R6WqltQRg3KERMgjsSjfRQEFe0PmpYmjaynHdc2A+9ISmU+H+6nFKgTwzxH784
         M4U09ZWTyyXutD1PJYvrOaeSuW2uqTxs8jL287HvBnsN1E1G9sLgQv7NQkSCVpMhpgOE
         vtZFhA9myS3K+Bc2d/HnMggKt/SoAzlt5el9vlYafOWckGLneVW6OkrDeL2bESqAKTTo
         LD8Y4VESzkjMPcq2QKZ4sSQQAvgB0cKExzdCQrEVp4I3Q1jfj/HzCdNgkD1xK0UDPQAW
         AKGMkSIQNl0K58/Bx7JfRlikzMNoWTxRO/8gvVkC3FVYKyLmZIKDsU4MJexmu/pTwGvg
         TsMg==
X-Forwarded-Encrypted: i=1; AJvYcCUADpeR+tEBvJyZnobA30zWhePYvQWdVvuBZgD8dAV6aBhCUzfnMcdn5YXQqLTb5UFDYUdOZEvJUZ5bX8BHCdgkcYaCiVDCYHSnUjkDmVt6
X-Gm-Message-State: AOJu0YwLpuveoWE5Raqnzc+7p5U/TUDK49JYcVUFVI7dU16emchziGKi
	MTTxRybW9QabFIZScQz58BEOB5OG8JRotgng4i6AwOWbp1zSucW6nh10A09kt3E=
X-Google-Smtp-Source: AGHT+IFf7rWxjOtZJIC6R9Oqy3Xb4mTAmp4KgA+IdlEy1tbWPQqAwlx/un7E42ZRI7sXczT2CFVh6A==
X-Received: by 2002:a19:8c01:0:b0:513:c1b0:dcb2 with SMTP id o1-20020a198c01000000b00513c1b0dcb2mr653986lfd.3.1710247343839;
        Tue, 12 Mar 2024 05:42:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720? ([2a01:e0a:999:a3a0:e160:2f4e:a2e4:b720])
        by smtp.gmail.com with ESMTPSA id dw23-20020a0565122c9700b00513c0b0b512sm220021lfb.272.2024.03.12.05.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:42:23 -0700 (PDT)
Message-ID: <1049078b-74f8-4461-a530-af1c4992dd9b@rivosinc.com>
Date: Tue, 12 Mar 2024 13:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1, 5/6] riscv: hwprobe: add zve Vector subextesnions into
 hwprobe interface
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Andrew Jones <ajones@ventanamicro.com>,
 Costa Shulyupin <costa.shul@redhat.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-6-andy.chiu@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240312123627.9285-6-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_054228_805824_FF884A96 
X-CRM114-Status: GOOD (  18.99  )
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

CgpPbiAxMi8wMy8yMDI0IDEzOjM2LCBBbmR5IENoaXUgd3JvdGU6Cj4gVGhlIGZvbGxvd2luZyBW
ZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVtYmVkZGVkIiBwbGF0Zm9ybXMgYXJlIGFkZGVkCj4g
aW50byBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzA6Cj4gIC0gWlZFMzJYCj4gIC0gWlZFMzJG
Cj4gIC0gWlZFNjRYCj4gIC0gWlZFNjRGCj4gIC0gWlZFNjRECj4gCj4gRXh0ZW5zaW9ucyBlbmQg
d2l0aCBYIG1lYW4gdGhlIHBsYXRmb3JtIGRvbid0IGhhdmUgYSBWZWN0b3IgRlBVLgo+IEV4dGVu
c2lvbnMgZW5kIHdpdGggRi9EIG1lYW4gd2hldGhlciBzaW5nbGUgKEYpIG9yIGRvdWJsZSAoRCkg
cHJlY2lzaW9uCj4gVmVjdG9yIG9wZXJhdGlvbiBpcyBzdXBwb3J0ZWQuCj4gCj4gVGhlIG51bWJl
ciAzMiBvciA2NCBmb2xsb3dzIGZyb20gWlZFIHRlbGxzIHRoZSBtYXhpbXVtIGVsZW1lbnQgbGVu
Z3RoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+
Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAxNSArKysr
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8ICA1
ICsrKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCAgNSArKysr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXggYjJiY2M5ZWVkOWFhLi5kMGIwMmUwMTJlNWQgMTAw
NjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gQEAgLTE4OCw2ICsxODgsMjEg
QEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ICAgICAgICAgbWFudWFsIHN0YXJ0
aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdlcyByZXF1ZXN0ZWQgYnkgVmVkCj4g
ICAgICAgICBkdXJpbmcgc2lnbm9mZiIpCj4gIAo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfRVhUX1pWRTMyWGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmUzMnggaXMKPiArICAg
IHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3Rv
ciBleHRlbnNpb24gbWFudWFsLgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aVkUzMkZgOiBUaGUgVmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlMzJmIGlzCj4gKyAgICBzdXBw
b3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0
ZW5zaW9uIG1hbnVhbC4KPiArCj4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZF
NjRYYDogVGhlIFZlY3RvciBzdWItZXh0ZW5zaW9uIFp2ZTY0eCBpcwo+ICsgICAgc3VwcG9ydGVk
LCBhcyBkZWZpbmVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lv
biBtYW51YWwuCj4gKwo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0RmA6
IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmU2NGYgaXMKPiArICAgIHN1cHBvcnRlZCwgYXMg
ZGVmaW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFu
dWFsLgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NERgOiBUaGUg
VmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlNjRkIGlzCj4gKyAgICBzdXBwb3J0ZWQsIGFzIGRlZmlu
ZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4K
PiArCj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFz
ayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCj4gICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNl
bGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmgKPiBpbmRleCA5ZjJhOGUzZmYyMDQuLmI5YTA4NzZlOTY5ZiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC01OSw2ICs1OSwxMSBAQCBzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSB7Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pUU08JCSgxVUxM
IDw8IDMzKQo+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQp
Cj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pJQ09ORAkoMVVMTCA8PCAzNSkKPiArI2Rl
ZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJYCSgxVUxMIDw8IDM2KQo+ICsjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aVkUzMkYJKDFVTEwgPDwgMzcpCj4gKyNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWRTY0WAkoMVVMTCA8PCAzOCkKPiArI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlZFNjRGCSgxVUxMIDw8IDM5KQo+ICsjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkU2
NEQJKDFVTEwgPDwgNDApCj4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUK
PiAgI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKPiAg
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zeXNfaHdwcm9iZS5jCj4gaW5kZXggYTdjNTZiNDFlZmQyLi4yNTAwZDE3NWVkNjYgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiBAQCAtMTExLDYgKzExMSwxMSBAQCBzdGF0aWMg
dm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAJCUVY
VF9LRVkoWlRTTyk7Cj4gIAkJRVhUX0tFWShaQUNBUyk7Cj4gIAkJRVhUX0tFWShaSUNPTkQpOwo+
ICsJCUVYVF9LRVkoWlZFMzJYKTsKPiArCQlFWFRfS0VZKFpWRTMyRik7Cj4gKwkJRVhUX0tFWSha
VkU2NFgpOwo+ICsJCUVYVF9LRVkoWlZFNjRGKTsKPiArCQlFWFRfS0VZKFpWRTY0RCk7CgpIaSBB
bmR5LAoKSSdtIG5vdCBzdXJlIGJ1dCBzaW5jZSB0aGVzZSBleHRlbnNpb25zIGFyZSBjb25kaXRp
b25lZCBieSB0aGUgZmFjdAp2ZWN0b3Igc2hvdWxkIGJlIHN1cHBvcnRlZCBieSB0aGUga2VybmVs
LCB0aGV5IHByb2JhYmx5IG5lZWRzIHRvIGJlIHB1dAp1bmRlciB0aGUgaWYgYmVsb3c6Cgo+ICAK
PiAgCQlpZiAoaGFzX3ZlY3RvcigpKSB7CgoJCQk8LS0tIEhlcmUgLS0tPgo+ICAJCQlFWFRfS0VZ
KFpWQkIpOwoKVGhhbmtzICEKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
