Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BB3FC6160
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Od2zZUrBh5iOcyFU1G/BIwITlw2m8o5O7K9ntAK8iA=; b=SHGpLgj+SVWJUI
	OeONXHqTUNVA5CjXFetjUlvSN1H9a6riP+N9uTQQWRppAW1eKpMlXgFK4RPT6RhB+zNidS+Xck84k
	Pm4K8vy5XDsYbwBjFcBv0HDmx/XGVEUmgy89wvRbUnuT4puEx8cxYC1Rx6wPwtWINxIlU3al7zQ3v
	3VvZV9dL4EsoPzygTPRinm7YeG2soDqvXirFebi0/T8wQZwXxZoPKH6R1f5XSr/jzv7vdCRnr+oqi
	4iWgZzmj6ImFBP97/X6CHoIFNsocHP0U5yrnNpzTHQe8yROzmPoSKJPXjVzQtSZUB505wcqKxmHR0
	zLDDz2muU9FYOYVemdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2u8-00000009Pmq-1g9E;
	Sat, 03 Jan 2026 14:46:56 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc2u3-00000009PlX-1yco
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 14:46:54 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59445ee9738so10225312e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767451609; x=1768056409; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPR1JFy6rJLSFK6ErDT15A7JIu/4ipRwd7vjBAorP1A=;
        b=nyXjTX5zS5mRzrzklJO2vVri+dV78Odli8BmgH9lSERP48O+86BgeiA9a5DKQbbW35
         UhoSJEiET0e5Z4q2GaBDz2c4PGzPyakmKneK7902DNj08giD/NElFddiE/+NHE/z6Kd6
         ZxH08Ci1fS8N7SZya8vORgdxXu0HGlhFdorzJAWIE13rHVQLNw0AjN4v7foa9qeDJ13U
         pwyMuuqdOhVnxcSvXI9LqGh2WkeP8AIAKf6F/gDgcoa09++oUuKYi8Hq1/WlcuUALaRf
         H009Ha5SCvJTYMRuPsKc3DRridaS7ATIV7lALjg26K4VKhF3neCQ9FcmrBtuoNSE8vgS
         XDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767451609; x=1768056409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPR1JFy6rJLSFK6ErDT15A7JIu/4ipRwd7vjBAorP1A=;
        b=shhZU/pQ573FN1y4Tq8y1QlG9MF03ECbafpK4BDGl/bhtgRVxLeKCTSzEklWVopHoO
         Qehcc4qzopCx0/Gfi/yGnMLuSqiCyxWENC2jbZfNCloxSfSkBfVObIgBfi3FGBmq5mN3
         8uCz6X6ZkocMcvNEaskxyfYb33FpPEyLCWflrYlh41OZ3TD34W/wMrA3vP+rZSX72lqF
         CNRIqqT0+5u3JWbftZfOTs8EjTZmU3a+KXHtTXzeMSAnQwBC+Uvr+B2FN2fNefLDs2IX
         VZ+bWtXVZA3eERGcnsWmBh2/PVlKssb6OmOGJw+ycwdW/klVweF1WSeZMj04rAoFKiA6
         WN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVMyPjXve4TeHlP7XBJE2EBILI6mOqYLhge20g80Pxb6Tvy/F2If5kTrxmhexO5MhscI1WV68bTpCHjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHOO0GXGXni7VlVaRHjdLUZdaRdB48twHIAQl44URSq4j7WAOf
	JZx6hK3Coxtpi9kYwKZxH1+iLnX1IiHzU9C71kmgAIaTgIkbXiRAROgRJJQPs5y47KPwm3uCpG+
	hwdUzhsmCwuKuEq1FJXa/VS1eNCUC0cQvCFIg680UXA==
X-Gm-Gg: AY/fxX6hEro990aBiY8AM1Jo073CWkCV2+eNMeTVgJg45SxGgSQ9qxRVnJYTNI2UKHG
	FuJWvcLcspNeQtWWvbXZ2+lR3/6fke8K9G4DX3x745jtxtNQ6BUMFbWAkFN8LDpx9RviIrsXdty
	uHu6wc9QtgY/8PrdgB5vKmAJia5/zGUKnPImhyMjIBorAsABxCB8BZlO+Cl5rk+/ZvomIyU/hUs
	Q326rGaq1jiljkKQpAddx8JdldsyaucYomtMWRjLtUtTxhDRPE1in4nz8c9JlrpoEo56okvixya
	rHdEdUp2vTzcWRMnIht5PZ2Vd88Z
X-Google-Smtp-Source: AGHT+IGMVOVy3fb16NF/t3Rx4QrgWh5PG3Ed2r+o5dL2tjLnynT35YOg3OR5Ql/tytxu2rM4aj6GLMysIWnr5/ve5DQ=
X-Received: by 2002:a05:6512:3d07:b0:598:8f92:c33e with SMTP id
 2adb3069b0e04-59a17d77049mr15771880e87.50.1767451609186; Sat, 03 Jan 2026
 06:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com> <20260103094501.5625-3-naohiko.shimizu@gmail.com>
In-Reply-To: <20260103094501.5625-3-naohiko.shimizu@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 3 Jan 2026 20:16:38 +0530
X-Gm-Features: AQt7F2rx82roS9PAEhnFjR0SBvLaBemu4TZnUnoLSnWvhVuSqA0SpQ_ILKXY2g8
Message-ID: <CAK9=C2VbMmwTULpybAz+kSLCzBOQgFrUB74o8d6onp6enaUBCg@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_064652_406836_02CEEF96 
X-CRM114-Status: GOOD (  11.66  )
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

T24gU2F0LCBKYW4gMywgMjAyNiBhdCAzOjE24oCvUE0gTmFvaGlrbyBTaGltaXp1CjxuYW9oaWtv
LnNoaW1penVAZ21haWwuY29tPiB3cm90ZToKClNhbWUgY29tbWVudCBhcyBQQVRDSDEuCgo+Cj4g
U2lnbmVkLW9mZi1ieTogTmFvaGlrbyBTaGltaXp1IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgfCA2ICsrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGlt
ZXIuYwo+IGluZGV4IDg1YTcyNjIxMTVlMS4uZjM2MjQ3ZTRjNzgzIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGlt
ZXIuYwo+IEBAIC03Miw4ICs3Miw5IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfdGltZXJf
Y2FuY2VsKHN0cnVjdCBrdm1fdmNwdV90aW1lciAqdCkKPiAgc3RhdGljIGludCBrdm1fcmlzY3Zf
dmNwdV91cGRhdGVfdnN0aW1lY21wKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IG5jeWNsZXMp
Cj4gIHsKPiAgI2lmIGRlZmluZWQoQ09ORklHXzMyQklUKQo+IC0gICAgICAgbmNzcl93cml0ZShD
U1JfVlNUSU1FQ01QLCBuY3ljbGVzICYgMHhGRkZGRkZGRik7Cj4gKyAgICAgICBuY3NyX3dyaXRl
KENTUl9WU1RJTUVDTVAsICBVTE9OR19NQVgpOwo+ICAgICAgICAgbmNzcl93cml0ZShDU1JfVlNU
SU1FQ01QSCwgbmN5Y2xlcyA+PiAzMik7Cj4gKyAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJTUVD
TVAsICh1MzIpbmN5Y2xlcyk7Cj4gICNlbHNlCj4gICAgICAgICBuY3NyX3dyaXRlKENTUl9WU1RJ
TUVDTVAsIG5jeWNsZXMpOwo+ICAjZW5kaWYKPiBAQCAtMzA3LDggKzMwOCw5IEBAIHZvaWQga3Zt
X3Jpc2N2X3ZjcHVfdGltZXJfcmVzdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAg
ICAgICAgICAgIHJldHVybjsKPgo+ICAjaWYgZGVmaW5lZChDT05GSUdfMzJCSVQpCj4gLSAgICAg
ICBuY3NyX3dyaXRlKENTUl9WU1RJTUVDTVAsICh1MzIpdC0+bmV4dF9jeWNsZXMpOwo+ICsgICAg
ICAgbmNzcl93cml0ZShDU1JfVlNUSU1FQ01QLCBVTE9OR19NQVgpOwo+ICAgICAgICAgbmNzcl93
cml0ZShDU1JfVlNUSU1FQ01QSCwgKHUzMikodC0+bmV4dF9jeWNsZXMgPj4gMzIpKTsKPiArICAg
ICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgKHUzMikodC0+bmV4dF9jeWNsZXMpKTsKPiAg
I2Vsc2UKPiAgICAgICAgIG5jc3Jfd3JpdGUoQ1NSX1ZTVElNRUNNUCwgdC0+bmV4dF9jeWNsZXMp
Owo+ICAjZW5kaWYKPiAtLQo+IDIuMzkuNQo+Cj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
