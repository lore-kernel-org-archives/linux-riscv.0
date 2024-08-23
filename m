Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F315C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjCMR5v4N2rcZA37diqNqxj8hBAawBuexrll/WuTpkM=; b=oEGBTeTMbCa6Ws
	0J7zvAb6RLpC1R9RTdaIcRGxwbQGwTjnPbE6kO9FfIOUy3hXF/OV+pdawK/frdNXBLKF04ma+j6+L
	KwFv/4Zu700fZVF+hOfDEMnjXKx1jygQjEEwYhgX/TYeCAdIbPdDGkR9X8shKbHc4suo83yLuCrZB
	n4R8BDcPqzmVvniDcAp/fKS/8qXq1Adz9DNVlP+4g3qSS8EtzkJ7E1Npy1wG7wnUIFIbbjq2ZNCOY
	X5nI+GhkZXUQ8ZBLoDDcH6u3Esr1y8DFRic6kwUZvvPKW2Abr4AZsDl9pm8oxg1/fq9XsSLlj2Pis
	NqZuFBbppqFDkqjhyf1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOVh-0000000Fbu3-1Np4;
	Fri, 23 Aug 2024 07:15:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOQf-0000000FagS-0z2h
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 07:09:50 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-39d2ceca81cso5955155ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 00:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724396988; x=1725001788; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYiyuSQAwfiQQ39+HAQvaBlmRARXpxRgdyCqu4zVO9c=;
        b=MbguWYYiYX2yGVqpx342gRIMJQqe1wT5hKY9xtqWmEfglXMddidya+GFZyXdhG+15j
         9AEAgshyH1h3sWVbJEyMYeBAE671hD8vtSYpaTvRmdjoPkG3PT+r4zDj02ZPQt0JejK7
         lwYP0G1rcRjyMGJRvlS4e7zMev/4nQ1QB5XM7TdFkTFuGWggZiG6VSBt97Ex073InVdP
         7mSLkP7ympMDgMbEUj8c9QoMb2gRqsF5QjC0/z0zDro/ZPSQlfrvZQ4Yzn/gtR4JvErK
         ZkO0v10FB4RN6zR6C7O4pwJd+sAdvXgil+B+E2UmVLQwVPd5LaI5ysUWyZIBmqHTxY4r
         3VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396988; x=1725001788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYiyuSQAwfiQQ39+HAQvaBlmRARXpxRgdyCqu4zVO9c=;
        b=n5tOusUYaqjHL1+ufcU66xbO+6xMkm1U1pVCvKMpQ0K40aQigYm8/Kc8cSwP1IqesP
         IqkOyW0zN+ACE9QaDXcwJhvxB8CbtiEMyAR7f2r7YcJf8Ncm4xrCReoXR6DhydUv0X3V
         x4MyDm1pjt2enQp+OVbFVMz00822duo/i1K2CWnZrW89hYPEUugLPX2naf3GsHP2b+n4
         7/csW7kDZcJq1O80S0qo4Fd7cK7KcjCvE5UlOTCjbqitnB6AZZ8+HtpQzcuPZSrOFX3u
         beJ/Qn3N0V4onas2BpoTaTvVIKq5ZR7JU9oqvCrrhyOr8mShdODgZd118pauuUQHUOIt
         gvuA==
X-Forwarded-Encrypted: i=1; AJvYcCUhVa0pUJoEOVlnn2twmQH6pKM7wH0jSkt/4PKcujca+zYYPgpuqAW1SsfwhvhmBmCiJZYIhTLBRM8VFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCdiybLm0xxkHj/e0NMNvz3EjmOjujEeBlJHCFJnapIj+jojSv
	X4vLrZ+Tj0R6lE/h0T1HgtByMJqRgaJSqQ+dm41Bm0gqFL318UNoQR1nqkWs9e8MMpy0IHbd6M0
	fbZJbHjC8EYMYwioh6URJhfb1xExyRmdkH67+Ag==
X-Google-Smtp-Source: AGHT+IFheFAcpjMzzb2iqY4HfoVxZvmcsr/sK9zcF/qfuUz+TYRMD4/KAnFW1EAGR+jGgOYeNhlDxxZStd4REvhqF1Y=
X-Received: by 2002:a05:6e02:1a65:b0:39b:3e01:cbd4 with SMTP id
 e9e14a558f8ab-39e3c98c3ecmr14412585ab.14.1724396988109; Fri, 23 Aug 2024
 00:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240814054434.3563453-1-nick.hu@sifive.com> <20240814054434.3563453-3-nick.hu@sifive.com>
In-Reply-To: <20240814054434.3563453-3-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Aug 2024 12:39:37 +0530
Message-ID: <CAAhSdy0aPwod6_5xf6rw++jFFZNnOSSWJzQ9CJM0g55483rVSA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpuidle: riscv-sbi: Add cpuidle_disabled() check
To: Nick Hu <nick.hu@sifive.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_000949_301456_A6AE4514 
X-CRM114-Status: GOOD (  19.33  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMTE6MTTigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvbnN1bWVyIGRldmljZXMgdGhhdCBpbnNpZGUgdGhlIGNw
dS9jbHVzdGVyIHBvd2VyIGRvbWFpbiBtYXkgcmVnaXN0ZXIKPiB0aGUgZ2VucGQgbm90aWZpZXIg
d2hlcmUgdGhlaXIgcG93ZXIgZG9tYWlucyBwb2ludCB0byB0aGUgcGQgbm9kZXMgdW5kZXIKPiAn
L2NwdXMvcG93ZXItZG9tYWlucycuIElmIHRoZSBjcHVpZGxlLm9mZj09MSwgdGhlIGdlbnBkIG5v
dGlmaWVyIHdpbGwgZmFpbAo+IGR1ZSB0byBzYmlfY3B1aWRsZV9wZF9hbGxvd19kb21haW5fc3Rh
dGUgaXMgbm90IHNldC4gV2UgYWxzbyBuZWVkIHRoZQo+IHNiaV9jcHVpZGxlX2NwdWhwX3VwL2Rv
d24gdG8gaW52b2tlIHRoZSBjYWxsYmFja3MuIFRoZXJlZm9yZSBhZGRpbmcgYQo+IGNwdWlkbGVf
ZGlzYWJsZWQoKSBjaGVjayBiZWZvcmUgY3B1aWRsZV9yZWdpc3RlcigpIHRvIGFkZHJlc3MgdGhl
IGlzc3VlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgoK
TEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVn
YXJkcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMg
fCA5ICsrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2Jp
LmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IGluZGV4IDk4ZTc3NTFk
YmZlOC4uM2M4YTUwOTI4OGYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxl
LXJpc2N2LXNiaS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMK
PiBAQCAtMjUsNiArMjUsNyBAQAo+ICAjaW5jbHVkZSA8YXNtL3NtcC5oPgo+ICAjaW5jbHVkZSA8
YXNtL3N1c3BlbmQuaD4KPgo+ICsjaW5jbHVkZSAiY3B1aWRsZS5oIgo+ICAjaW5jbHVkZSAiZHRf
aWRsZV9zdGF0ZXMuaCIKPiAgI2luY2x1ZGUgImR0X2lkbGVfZ2VucGQuaCIKPgo+IEBAIC0zMzYs
NiArMzM3LDkgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9pbml0X2NwdShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGludCBjcHUpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9
Cj4KPiArICAgICAgIGlmIChjcHVpZGxlX2Rpc2FibGVkKCkpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICsKPiAgICAgICAgIHJldCA9IGNwdWlkbGVfcmVnaXN0ZXIoZHJ2LCBOVUxMKTsK
PiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGdvdG8gZGVpbml0Owo+IEBAIC01
NDgsNyArNTUyLDEwIEBAIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIC8qIFNldHVwIENQVSBob3RwbHV0IG5vdGlmaWVy
cyAqLwo+ICAgICAgICAgc2JpX2lkbGVfaW5pdF9jcHVocCgpOwo+Cj4gLSAgICAgICBwcl9pbmZv
KCJpZGxlIGRyaXZlciByZWdpc3RlcmVkIGZvciBhbGwgQ1BVc1xuIik7Cj4gKyAgICAgICBpZiAo
Y3B1aWRsZV9kaXNhYmxlZCgpKQo+ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJjcHVpZGxlIGlz
IGRpc2FibGVkXG4iKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgcHJfaW5mbygi
aWRsZSBkcml2ZXIgcmVnaXN0ZXJlZCBmb3IgYWxsIENQVXNcbiIpOwo+Cj4gICAgICAgICByZXR1
cm4gMDsKPgo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
