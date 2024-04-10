Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95642CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qNaKMQupcoGFl5a+PmZkUPFDPqcr2HU+Pr9V3ANXXo=; b=Mv8tujHLlEwMPh
	z1XHLsEt43B6S5iEIOOcv3ajq2j2sdFtNKzK7sfr/rJ7SCPR1OW3SN6ZCqEr4k2fnKVf5w1FwH386
	/bIOm7rw9KebdnCqzQh423M0z7KFfPYj/A3yZJLNdhmusEKWRyYSgoUhD2TDoKZhP/nlbjTPRzxDz
	5C6pgH3T+hooqeZybie39iWTPOHoTg9du462oRZocTjmDEYCVOnV7AX/Cr8zmd2ZQgCDmQ+N8aa9+
	EvCPFO+Xv13kj8cvgFhHfyjE2t3wU8NVlv8nKAu9LtOJTu1FKJOW+hziroUHQa+louTmqPVhwiD40
	JK+nbpj6BOxwTefKNiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugKC-00000009CpV-2NHW;
	Wed, 10 Apr 2024 22:21:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugK9-00000009Cm4-0hOX
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 22:21:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e455b630acso18892885ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712787702; x=1713392502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=i89BB3j3ffhYIutnoZr8xqZyrRUK3ZFGwjY9gvg5+75kFnkg+eKkW5H0pJ0tB6Wf0u
         ArEStpjezKHkt/cjeI362vIRiw90lpoCjCU2Qe67U71b9PWhE+qiK5VT3beYqnjsJKlF
         6fNPQYmX5ix+r2Vm5WIJlyaTFQsjbK/t4DOSUhjJlyt6IqtBqWlXPrF9VlZfXOq225cq
         +mM7wy//Waw6PEeTiYnBKHIEtRsrYRx61cDJtI5z+YE+uoKV3l/z7jN0FUIuSmoOteWn
         Hb53vm+TtSwCW9Yp5fbhzcmj7hYoeORlYqeOKKxvm9dkKg7Fzdbu01cZ5x5K9DQfj9NN
         GQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787702; x=1713392502;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQ9C1Cr3AvASEU86K/hlf2OO0iCRrNUVuyjVHdlWHE4=;
        b=sxzsClrhunS2WtHea+WTfM7zYZTVywQ1MiVOJMKbM+/N64F49+FMrvr/NM0x7dDhS9
         sMYzOTsCP4xtkBoUM4rcAf2DxnXfAkse8/wFYpacnL2ikayq5Zcprvh0uC1cQglzjc1f
         +kDfl8k9CNyu2pQktWFi7OITLWyBhj7p4SESvAK0QOWhTgP8ElsEvYu3BExhtwWQCWli
         D0cpm9xE8Y3QuzUTocy7ov37wEpa+bNNUM3h4KzXFzHT8dBRCQi6sO+aWBzUZgWXTYi4
         oU4OjWmikqTuJ1F/xn4N/8d+ALFQOMmBCf1Yn5FSZzIJFE311b2/WPMhP5YSdDyRQRKg
         jmUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU9rDOx5rpRLos4Zdb94A0JgHX/GAD2nQbLORyuuNlpDer24gNhA5smaaX9PG7rkEkC4Y1G7qfpZWAsAcrRLQqYXuH+2pCYCJpTxX9Ikqd
X-Gm-Message-State: AOJu0YxFHbRbAzMJUbhHXXcr/tOaJ7TrmV5HnBdjwq/lgp+BsWcOQHUh
	VuQ8+6nE7dPx6f0geINNWxhb2zJQn1iFOArduxlCnsgM2PWWf0LVTWAgk15kf9Y=
X-Google-Smtp-Source: AGHT+IEyXjz5iWD+JzMbxman4f15iRJH7qvrzDvYbxC6J1pXkyjcclFUtxHEFXG2Dt+UzEnUxH7BCA==
X-Received: by 2002:a17:902:e810:b0:1e3:e081:e7f5 with SMTP id u16-20020a170902e81000b001e3e081e7f5mr5334384plg.66.1712787701595;
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
Received: from localhost ([2804:214:8686:5e16:705e:67c9:b3ef:a558])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm39198plr.191.2024.04.10.15.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:21:41 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
  linux-arm-kernel@lists.infradead.org,  x86@kernel.org,
  linux-kernel@vger.kernel.org,  linux-arch@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-riscv@lists.infradead.org,
  Christoph Hellwig <hch@lst.de>,  loongarch@lists.linux.dev,
  amd-gfx@lists.freedesktop.org,  Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20240329072441.591471-14-samuel.holland@sifive.com> (Samuel
	Holland's message of "Fri, 29 Mar 2024 00:18:28 -0700")
References: <20240329072441.591471-1-samuel.holland@sifive.com>
	<20240329072441.591471-14-samuel.holland@sifive.com>
User-Agent: mu4e 1.12.2; emacs 29.3
Date: Wed, 10 Apr 2024 19:21:37 -0300
Message-ID: <87wmp4oo3y.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_152145_315446_C3825EBF 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

CkhlbGxvLAoKU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRl
czoKCj4gTm93IHRoYXQgYWxsIHByZXZpb3VzbHktc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgc2Vs
ZWN0Cj4gQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JULCB0aGlzIGNvZGUgY2FuIGRlcGVuZCBv
biB0aGF0IHN5bWJvbCBpbnN0ZWFkCj4gb2YgdGhlIGV4aXN0aW5nIGxpc3Qgb2YgYXJjaGl0ZWN0
dXJlcy4gSXQgY2FuIGFsc28gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhlCj4gY29tbW9uIGtlcm5lbC1t
b2RlIEZQVSBBUEkgYW5kIG1ldGhvZCBvZiBhZGp1c3RpbmcgQ0ZMQUdTLgo+Cj4gQWNrZWQtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpVbmZvcnR1bmF0ZWx5IHRoaXMgcGF0
Y2ggY2F1c2VzIGJ1aWxkIGZhaWx1cmVzIG9uIGFybSB3aXRoIGFsbHllc2NvbmZpZwphbmQgYWxs
bW9kY29uZmlnLiBUZXN0ZWQgd2l0aCBuZXh0LTIwMjQwNDEwLgoKRXJyb3Igd2l0aCBhbGx5ZXNj
b25maWc6CgokIG1ha2UgLWogOCBcCiAgICBPPSRIT01FLy5jYWNoZS9idWlsZHMvbGludXgtY3Jv
c3MtYXJtIFwKICAgIEFSQ0g9YXJtIFwKICAgIENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVh
YmloZi0KbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9iYXVlcm1hbm4vLmNhY2hl
L2J1aWxkcy9saW51eC1jcm9zcy1hcm0nCiAgICDii64KYXJtLWxpbnV4LWdudWVhYmloZi1sZDog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMC9kY24yMF9mcHUubzogaW4g
ZnVuY3Rpb24gYGRjbjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQnOgpkY24yMF9m
cHUuYzooLnRleHQrMHgyMGY0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hZWFiaV9sMmQn
CmFybS1saW51eC1nbnVlYWJpaGYtbGQ6IGRjbjIwX2ZwdS5jOigudGV4dCsweDIxMGMpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKYXJtLWxpbnV4LWdudWVhYmloZi1sZDog
ZGNuMjBfZnB1LmM6KC50ZXh0KzB4MjEyNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVh
YmlfbDJkJwphcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkY24yMF9mcHUuYzooLnRleHQrMHgyMTNj
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hZWFiaV9sMmQnCmFybS1saW51eC1nbnVlYWJp
aGYtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvY2FsY3MvZGNuX2NhbGNz
Lm86IGluIGZ1bmN0aW9uIGBwaXBlX2N0eF90b19lMmVfcGlwZV9wYXJhbXMnOgpkY25fY2FsY3Mu
YzooLnRleHQrMHgzOTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKYXJt
LWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9j
YWxjcy9kY25fY2FsY3MubzpkY25fY2FsY3MuYzooLnRleHQrMHgzYTQpOiBtb3JlIHVuZGVmaW5l
ZCByZWZlcmVuY2VzIHRvIGBfX2FlYWJpX2wyZCcgZm9sbG93CmFybS1saW51eC1nbnVlYWJpaGYt
bGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwyL2RtbDJfd3JhcHBlci5vOiBp
biBmdW5jdGlvbiBgb3B0aW1pemVfY29uZmlndXJhdGlvbic6CmRtbDJfd3JhcHBlci5jOigudGV4
dCsweGNiYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfZDJ1bHonCmFybS1saW51
eC1nbnVlYWJpaGYtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwyL2RtbDJf
dHJhbnNsYXRpb25faGVscGVyLm86IGluIGZ1bmN0aW9uIGBwb3B1bGF0ZV9kbWxfcGxhbmVfY2Zn
X2Zyb21fcGxhbmVfc3RhdGUnOgpkbWwyX3RyYW5zbGF0aW9uX2hlbHBlci5jOigudGV4dCsweDll
NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfbDJkJwphcm0tbGludXgtZ251ZWFi
aWhmLWxkOiBkbWwyX3RyYW5zbGF0aW9uX2hlbHBlci5jOigudGV4dCsweGEyMCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfbDJkJwphcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkbWwy
X3RyYW5zbGF0aW9uX2hlbHBlci5jOigudGV4dCsweGE1OCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fYWVhYmlfbDJkJwphcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkbWwyX3RyYW5zbGF0aW9u
X2hlbHBlci5jOigudGV4dCsweGE5MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlf
bDJkJwptYWtlWzNdOiAqKiogWy9ob21lL2JhdWVybWFubi9zcmMvbGludXgvc2NyaXB0cy9NYWtl
ZmlsZS52bWxpbnV4OjM3OiB2bWxpbnV4XSBFcnJvciAxCm1ha2VbMl06ICoqKiBbL2hvbWUvYmF1
ZXJtYW5uL3NyYy9saW51eC9NYWtlZmlsZToxMTY1OiB2bWxpbnV4XSBFcnJvciAyCm1ha2VbMV06
ICoqKiBbL2hvbWUvYmF1ZXJtYW5uL3NyYy9saW51eC9NYWtlZmlsZToyNDA6IF9fc3ViLW1ha2Vd
IEVycm9yIDIKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL2JhdWVybWFubi8uY2Fj
aGUvYnVpbGRzL2xpbnV4LWNyb3NzLWFybScKbWFrZTogKioqIFtNYWtlZmlsZToyNDA6IF9fc3Vi
LW1ha2VdIEVycm9yIDIKClRoZSBlcnJvciB3aXRoIGFsbG1vZGNvbmZpZyBpcyBzbGlnaHRseSBk
aWZmZXJlbnQ6CgokIG1ha2UgLWogOCBcCiAgICBPPSRIT01FLy5jYWNoZS9idWlsZHMvbGludXgt
Y3Jvc3MtYXJtIFwKICAgIEFSQ0g9YXJtIFwKICAgIENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdu
dWVhYmloZi0KbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9iYXVlcm1hbm4vLmNh
Y2hlL2J1aWxkcy9saW51eC1jcm9zcy1hcm0nCiAgICDii64KRVJST1I6IG1vZHBvc3Q6ICJfX2Fl
YWJpX2QydWx6IiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmlu
ZWQhCkVSUk9SOiBtb2Rwb3N0OiAiX19hZWFiaV9sMmQiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHUua29dIHVuZGVmaW5lZCEKbWFrZVszXTogKioqIFsvaG9tZS9iYXVlcm1hbm4v
c3JjL2xpbnV4L3NjcmlwdHMvTWFrZWZpbGUubW9kcG9zdDoxNDU6IE1vZHVsZS5zeW12ZXJzXSBF
cnJvciAxCm1ha2VbMl06ICoqKiBbL2hvbWUvYmF1ZXJtYW5uL3NyYy9saW51eC9NYWtlZmlsZTox
ODc2OiBtb2Rwb3N0XSBFcnJvciAyCm1ha2VbMV06ICoqKiBbL2hvbWUvYmF1ZXJtYW5uL3NyYy9s
aW51eC9NYWtlZmlsZToyNDA6IF9fc3ViLW1ha2VdIEVycm9yIDIKbWFrZVsxXTogTGVhdmluZyBk
aXJlY3RvcnkgJy9ob21lL2JhdWVybWFubi8uY2FjaGUvYnVpbGRzL2xpbnV4LWNyb3NzLWFybScK
bWFrZTogKioqIFtNYWtlZmlsZToyNDA6IF9fc3ViLW1ha2VdIEVycm9yIDIKCi0tClRoaWFnbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
