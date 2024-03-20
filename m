Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A01C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mv08Ur0ooJvA7OOB4W5kw6Qhch+pWR0qewfPwrPw6o=; b=dIIyRIX00ns5BC
	PASjPGhSWiX6zRcmatc21T/mkUMA2VrNdWaWLE/u9o2+6zE55RRuzsbZ0m5u7kwbaKaeIKr6K6fyr
	zsXg5U7TvjFpvykEPySzJNhjotljzGl7z9VrMzEyBkywpEl8QPMTnDFmKFe6+KNoQOPihV1+rUKiD
	fNAsSH+XJsLe98A8ozzz0IRTJtNL1Sp+8AiAj+dUFxxkoIjFqJdoc6C/F3wj6IaOZtmUZ7d7Iv28v
	9ZJJhLmU/DgKPe7duoGDuPqTesUbQCgfeKKmhA9yZ0ocV9ydknEnrYrCPrXBHWe4myGhY99cZRgQy
	SgaqITurb/tETrOBFQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsDS-0000000GTZD-3UNt;
	Wed, 20 Mar 2024 09:26:34 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsDQ-0000000GTWT-0dQG
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 09:26:34 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-221ce6cac3aso3523752fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710926790; x=1711531590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqg1Bd1Azr4G+6Sz9Ni1RmpJSEG5+j5GzmKPVhSgSGE=;
        b=hX41Xpt0gmK0xDwFzm9aauvXBcW8CyaIebD/4g8XSIiJt9PCdMgt2EAxdN7JKeNMEb
         w5RSc9p/SozvA0etlR1UGIj9ag3tJhGdqS2GbbmxdIwEdRisH5w4sFCAlsIGAXDIvLyO
         EHaTCBx5cbjL4YQ3WuaRXMZAGqok/cz+TEWzgKOsT6iOT7IfHjSLbjamEfkJvymlkBEL
         /FbZ0Kml1nir1EZpYWf7nSX5qM1+Ez5DsrWUFxsy9jYqhnqVELsRHZybLYKteRZ93y/1
         WyJBqYsZ1g56mkrBkDmSz1HyCKx2erWGuDYs69ZH6y6+5ly/oU2+nqaHpHkscYloOnqE
         xWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710926790; x=1711531590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqg1Bd1Azr4G+6Sz9Ni1RmpJSEG5+j5GzmKPVhSgSGE=;
        b=JOh38Nh9xSqmNzE3NFLssMxDZLUDGyxbyTune3g26o3NavVON2Xzr39yYIxfnxYcqf
         se5wFbAdP/A0CmWls5gI9TzCCeANr+AaK6frR+76YeH0gOFKaW/H91RCJ8fRz1qGfvXU
         z2ZwYjst6QYDalX0shjW4yB+EBillIZPjLJXTfQcWQ9rvEVpssUvcL16HGSAd65zrG6I
         CV6fgV3vVdOyyjo9bYcHg+4mqutiADcfS1jxGmHx/1J2oxea0+zvBSBR8JcD7SI6o0dW
         cN1mOCCnErzhtaZm45YvX+e0n27Yz1Zs4tuuIG2vgnaWsV9TUVUEc+t5kOwgmdogG9ly
         3SNw==
X-Forwarded-Encrypted: i=1; AJvYcCXcHk7qFABP4n5AfQ4bh/WnKSsWzUMGLtPr1Bd6zm4wB8HZvN4/BoVDplmNQ7/c2sp3lbUneCeiIEVYBnAR0/WGJYy9WRrEsVnw8ffddXIm
X-Gm-Message-State: AOJu0Ywffk/vP1i1GgNM78xvGcv9Rgim+JjjCvjyw8lx3H3ObUKwY9St
	BCpyTvf1PP6QvNm+9Ro9cMon39OJ3q/uj761unTtvTUhL0oXPpjXnLzfTdBKWBRWk3vDK4CAJPx
	qKDz7WjN784JfV3bnqGvgr4cJJubL/sUW67osDw==
X-Google-Smtp-Source: AGHT+IE8aYZ5bG6wSgxZaZS6rRpkFMqmPyeQj/o6j2TMk5GVEJO2WU2vuEWw9SNt63mCQzdymn2q8KqnE3GuTtt3fDM=
X-Received: by 2002:a05:6870:c34c:b0:222:b47b:36fd with SMTP id
 e12-20020a056870c34c00b00222b47b36fdmr5505043oak.45.1710926790147; Wed, 20
 Mar 2024 02:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com> <20240318-zve-detection-v3-2-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-2-e12d42107fa8@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 20 Mar 2024 17:26:19 +0800
Message-ID: <CAEEQ3wncGPZ8W5ZnGW=by4UZFwS5f_4BrfEJn8a2fe9F-0uB-w@mail.gmail.com>
Subject: Re: [External] [PATCH v3 2/7] riscv: smp: fail booting up smp if
 inconsistent vlen is detected
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_022632_509200_81BDBD85 
X-CRM114-Status: GOOD (  22.26  )
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

SGkgQW5keSwKCk9uIE1vbiwgTWFyIDE4LCAyMDI0IGF0IDY6NDDigK9QTSBBbmR5IENoaXUgPGFu
ZHkuY2hpdUBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB3ZSBvbmx5IHN1cHBvcnQg
VmVjdG9yIGZvciBTTVAgcGxhdGZvcm1zLCB0aGF0IGlzLCBhbGwgU01QCj4gY29yZXMgaGF2ZSB0
aGUgc2FtZSB2bGVuYi4gSWYgd2UgaGFwcGVuIHRvIGRldGVjdCBhIG1pc21hdGNoaW5nIHZsZW4s
IGl0Cj4gaXMgYmV0dGVyIHRvIGp1c3QgZmFpbCBib290dGluZyBpdCB1cCB0byBwcmV2ZW50IGZ1
cnRoZXIgcmFjZS9zY2hlZHVsaW5nCj4gaXNzdWVzLgo+Cj4gQWxzbywgbW92ZSAuTHNlY29uZGFy
eV9wYXJrIGZvcndhcmQgYW5kIGNoYWdlIGB0YWlsIHNtcF9jYWxsaW5gIGludG8gYQo+IHJlZ3Vs
YXIgY2FsbCBpbiB0aGUgZWFybHkgYXNzZW1ibHkuIFNvIGEgY29yZSB3b3VsZCBiZSBwYXJrZWQg
cmlnaHQKPiBhZnRlciBhIHJldHVybiBmcm9tIHNtcF9jYWxsaW4uIE5vdGUgdGhhdCBhIHN1Y2Nl
c3NmdWwgc21wX2NhbGxpbgo+IGRvZXMgbm90IHJldHVybi4KPgo+IEZpeGVzOiA3MDE3ODU4ZWIy
ZDcgKCJyaXNjdjogSW50cm9kdWNlIHJpc2N2X3ZfdnNpemUgdG8gcmVjb3JkIHNpemUgb2YgVmVj
dG9yIGNvbnRleHQiKQo+IFJlcG9ydGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyNDAyMjgtdmljaW5pdHktY29ybnN0YWxrLTRiOGViNWZlNTczMEBzcHVkLwo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gLS0tCj4gQ2hhbmdl
bG9nIHYyOgo+ICAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBleHBsYWluIGFzbSBjb2RlIGNo
YW5nZSAoQ29ub3IpCj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyAgICB8IDE0ICsr
KysrKystLS0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyB8IDE0ICsrKysrKysr
Ky0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9yaXNj
di9rZXJuZWwvaGVhZC5TCj4gaW5kZXggNDIzNmE2OWMzNWNiLi5hMTU4ZmE5ZjI2NTYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TCj4gQEAgLTE2NSw5ICsxNjUsMTUgQEAgc2Vjb25kYXJ5X3N0YXJ0X3NiaToKPiAg
I2VuZGlmCj4gICAgICAgICBjYWxsIC5Mc2V0dXBfdHJhcF92ZWN0b3IKPiAgICAgICAgIHNjc19s
b2FkX2N1cnJlbnQKPiAtICAgICAgIHRhaWwgc21wX2NhbGxpbgo+ICsgICAgICAgY2FsbCBzbXBf
Y2FsbGluCj4gICNlbmRpZiAvKiBDT05GSUdfU01QICovCj4KPiArLmFsaWduIDIKPiArLkxzZWNv
bmRhcnlfcGFyazoKPiArICAgICAgIC8qIFdlIGxhY2sgU01QIHN1cHBvcnQgb3IgaGF2ZSB0b28g
bWFueSBoYXJ0cywgc28gcGFyayB0aGlzIGhhcnQgKi8KCkl0IGlzIGJlc3QgdG8gbW9kaWZ5IHRo
ZSBjb21tZW50cyBoZXJlLCBpbnN0ZWFkIG9mICJsYWNrIFNNUCBzdXBwb3J0Li4uIgoKCj4gKyAg
ICAgICB3ZmkKPiArICAgICAgIGogLkxzZWNvbmRhcnlfcGFyawo+ICsKPiAgLmFsaWduIDIKPiAg
LkxzZXR1cF90cmFwX3ZlY3RvcjoKPiAgICAgICAgIC8qIFNldCB0cmFwIHZlY3RvciB0byBleGNl
cHRpb24gaGFuZGxlciAqLwo+IEBAIC0xODEsMTIgKzE4Nyw2IEBAIHNlY29uZGFyeV9zdGFydF9z
Ymk6Cj4gICAgICAgICBjc3J3IENTUl9TQ1JBVENILCB6ZXJvCj4gICAgICAgICByZXQKPgo+IC0u
YWxpZ24gMgo+IC0uTHNlY29uZGFyeV9wYXJrOgo+IC0gICAgICAgLyogV2UgbGFjayBTTVAgc3Vw
cG9ydCBvciBoYXZlIHRvbyBtYW55IGhhcnRzLCBzbyBwYXJrIHRoaXMgaGFydCAqLwo+IC0gICAg
ICAgd2ZpCj4gLSAgICAgICBqIC5Mc2Vjb25kYXJ5X3BhcmsKPiAtCj4gIFNZTV9DT0RFX0VORChf
c3RhcnQpCj4KPiAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5lbCkKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5j
Cj4gaW5kZXggY2ZiZTRiODQwZDQyLi4xZjg2ZWUxMDE5MmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc21wYm9vdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5j
Cj4gQEAgLTIxOCw2ICsyMTgsMTUgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBzbXBfY2Fs
bGluKHZvaWQpCj4gICAgICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSA9ICZpbml0X21tOwo+ICAg
ICAgICAgdW5zaWduZWQgaW50IGN1cnJfY3B1aWQgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4KPiAr
ICAgICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAg
ICAgICAgICAgICogUmV0dXJuIGFzIGVhcmx5IGFzIHBvc3NpYmxlIHNvIHRoZSBoYXJ0IHdpdGgg
YSBtaXNtYXRjaGluZwo+ICsgICAgICAgICAgICAgICAgKiB2bGVuIHdvbid0IGJvb3QuCj4gKyAg
ICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBpZiAocmlzY3Zfdl9zZXR1cF92c2l6
ZSgpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPiArCj4g
ICAgICAgICAvKiBBbGwga2VybmVsIHRocmVhZHMgc2hhcmUgdGhlIHNhbWUgbW0gY29udGV4dC4g
ICovCj4gICAgICAgICBtbWdyYWIobW0pOwo+ICAgICAgICAgY3VycmVudC0+YWN0aXZlX21tID0g
bW07Cj4gQEAgLTIzMCwxMSArMjM5LDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBzbXBf
Y2FsbGluKHZvaWQpCj4gICAgICAgICBudW1hX2FkZF9jcHUoY3Vycl9jcHVpZCk7Cj4gICAgICAg
ICBzZXRfY3B1X29ubGluZShjdXJyX2NwdWlkLCAxKTsKPgo+IC0gICAgICAgaWYgKGhhc192ZWN0
b3IoKSkgewo+IC0gICAgICAgICAgICAgICBpZiAocmlzY3Zfdl9zZXR1cF92c2l6ZSgpKQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGVsZl9od2NhcCAmPSB+Q09NUEFUX0hXQ0FQX0lTQV9WOwo+
IC0gICAgICAgfQo+IC0KPiAgICAgICAgIHJpc2N2X3VzZXJfaXNhX2VuYWJsZSgpOwo+Cj4gICAg
ICAgICAvKgo+Cj4gLS0KPiAyLjQ0LjAucmMyCj4KPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
