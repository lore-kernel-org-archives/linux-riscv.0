Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108DBC27C78
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 22:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZlJf4rCLlLDhF+ibUxZ5V7nnm/VvZOtiw+g/RMBxF8=; b=scujY+XCszDrcD
	gJn+pO74cwtTg121KLIzjNz3QQEq8wLhpm112sEHdPEpweqDqHGPlk7jWkk5xN88hS0L9C4+mJucm
	nA9xIzWP3Srnj67D6CKSaxmRfMs0gop/VKeuZk1XHl2LBms2f5qEm6HgAhMHUHR+OZOzdIazrw0AY
	6Qk4LZq7O22vB3WF27FIS4S9ILG0UGTtESfjBqGxb+1aabpceDQ9/1w6IdWgBTJWqlwCHCX5p3fiO
	Ea4OiDnxarZ65QnvlPYjuHHyTADcgMih3FEjxdw35IewWQqnHvNXCaWrwIwTK+z6hA2kNfvUsX+xi
	DOZWGemx4Ulm6oOfPXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKmT4-0000000AhmC-1tsZ;
	Fri, 21 Jun 2024 22:10:50 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKmT1-0000000AhlZ-1H0B
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 22:10:49 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so2592910a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 15:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719007846; x=1719612646; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W6zNTGp1aTwOtvLdnUXPrvSqBQrllJdVcW2FVVgDB5g=;
        b=Edt/hQi0bRNKwwzOy3FGJdg90xHKXQ6ePe1FhA6iIoLS/25HSvOlzJXiucIq5Fi5aY
         2MBgV1qtuAUXrdVR9TBAJQIuAODRZfQvzUzKGnPYZq14tSMepL979XE/YGeaaLDPu5kD
         op+71hVrsneg1LMoqhgRYmYxa4ofhaVxcK4rvwa6TTpGl4Hg0011ZkxAYd2wERvdPhgr
         /EE28Wv3lOL/Mu4ncHXB+IsYyQ3mG7UXpWzShbjIzP9zZ7/I4k1uo93Y51X5uNQEbmt1
         KQ9SaJRtPi9zI8rqX0XfWNSLoVmpTzK2bKUU6dlcq9iYitJyjnd/e6zyozTXNFpdVFFN
         YkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007846; x=1719612646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W6zNTGp1aTwOtvLdnUXPrvSqBQrllJdVcW2FVVgDB5g=;
        b=pmOAg+BUsbuDQPAYOLbZDdgzhmVbgI/0wuiS2wEvXVjY6uclkq3atbvwTw6iVaIfgx
         DnUS66WYvAYkROAtmyOFuAtB+UA9Gs5JPW3SpQ/KQh2+Hlaorjh9WQJtxKUvFB1cXejM
         4QXcibSL6yilZNofbI903U/wnKxGnMn/UzHUQakaNg1+Jirwn38hX0H+I2ykDbeVJ6HP
         EOfQQcEygblzcoqpxwl09Ir8m70H4LRDOe4XaUa1O0QPxuAT5XnJEiShu/QGdG7DfFUd
         rzddhI1GirlhczkXbr+3GUElfdczD5Y23WtvTjoJidCAo+wwnH+3zeA6St3AkKlClw2b
         dXpg==
X-Forwarded-Encrypted: i=1; AJvYcCXYvxol5mSvnhdCabzXOrwk2fiQlR6vFb4skaEw22h9R82eSr8oTDYeeSop5Q9sWkFvsz+iQY5uLwDlDmd0ouKgva8b6XYeMqOTzdfxIT3c
X-Gm-Message-State: AOJu0YwsoKvBunoAZtoVpDPEMhBZ9DLhNAZFtYGaHlZJRsQ/tC8fWWXK
	UWUTD/kAM2t3H06PV+HxiqIWCQZ4FIgu+5hEM+aoic4CMzfEIgtl69IOXmTxV5U=
X-Google-Smtp-Source: AGHT+IFodC/KHmQCg2O0jJBVOPuXhUN5lF51VkVlsO14ggFbC93W0YN4q838joM1PZnjh/NG3CSEVg==
X-Received: by 2002:a17:902:e84d:b0:1f9:f906:9082 with SMTP id d9443c01a7336-1fa04a42126mr12275615ad.7.1719007845678;
        Fri, 21 Jun 2024 15:10:45 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:e8dd:a296:71d5:2490])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb5e030dsm18868865ad.218.2024.06.21.15.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:10:45 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:10:42 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_ARCH_STACKLEAK
Message-ID: <ZnX6YtFGfXd0ixwR@ghost>
References: <20240617123029.723-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617123029.723-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_151047_370068_201A99EF 
X-CRM114-Status: GOOD (  19.46  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMDg6MzA6MjlQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3
cm90ZToKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIHN0YWNrbGVhayBmZWF0dXJlLiBXaGVuZXZlciB0
aGUga2VybmVsIHJldHVybnMgdG8gdXNlcgo+IHNwYWNlIHRoZSBrZXJuZWwgc3RhY2sgaXMgZmls
bGVkIHdpdGggYSBwb2lzb24gdmFsdWUuCj4gCj4gQXQgdGhlIHNhbWUgdGltZSwgZGlzYWJsZXMg
dGhlIHBsdWdpbiBpbiBFRkkgc3R1YiBjb2RlIGJlY2F1c2UgRUZJIHN0dWIKPiBpcyBvdXQgb2Yg
c2NvcGUgZm9yIHRoZSBwcm90ZWN0aW9uLgo+IAo+IFRlc3RlZCBvbiBxZW11IGFuZCBtaWxrdiBk
dW86Cj4gLyAjIGVjaG8gU1RBQ0tMRUFLX0VSQVNJTkcgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9wcm92
b2tlLWNyYXNoL0RJUkVDVAo+IFsgICAzOC42NzU1NzVdIGxrZHRtOiBQZXJmb3JtaW5nIGRpcmVj
dCBlbnRyeSBTVEFDS0xFQUtfRVJBU0lORwo+IFsgICAzOC42Nzg0NDhdIGxrZHRtOiBzdGFja2xl
YWsgc3RhY2sgdXNhZ2U6Cj4gWyAgIDM4LjY3ODQ0OF0gICBoaWdoIG9mZnNldDogMjg4IGJ5dGVz
Cj4gWyAgIDM4LjY3ODQ0OF0gICBjdXJyZW50OiAgICAgNDk2IGJ5dGVzCj4gWyAgIDM4LjY3ODQ0
OF0gICBsb3dlc3Q6ICAgICAgMTMyOCBieXRlcwo+IFsgICAzOC42Nzg0NDhdICAgdHJhY2tlZDog
ICAgIDEzMjggYnl0ZXMKPiBbICAgMzguNjc4NDQ4XSAgIHVudHJhY2tlZDogICA0NDggYnl0ZXMK
PiBbICAgMzguNjc4NDQ4XSAgIHBvaXNvbmVkOiAgICAxNDMxMiBieXRlcwo+IFsgICAzOC42Nzg0
NDhdICAgbG93IG9mZnNldDogIDggYnl0ZXMKPiBbICAgMzguNjg5ODg3XSBsa2R0bTogT0s6IHRo
ZSByZXN0IG9mIHRoZSB0aHJlYWQgc3RhY2sgaXMgcHJvcGVybHkgZXJhc2VkCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2VudHJ5LlMgICAgICAgICAgICAgfCA0ICsrKysKPiAgZHJpdmVycy9maXJtd2FyZS9lZmkv
bGlic3R1Yi9NYWtlZmlsZSB8IDMgKystCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDA1MjVlZTJkNjNjNy4uOWNiZmRmZmVjOTZjIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+IEBAIC0xMTgsNiArMTE4LDcgQEAgY29uZmlnIFJJU0NWCj4gIAlzZWxlY3QgSEFWRV9BUkNI
X01NQVBfUk5EX0NPTVBBVF9CSVRTIGlmIENPTVBBVAo+ICAJc2VsZWN0IEhBVkVfQVJDSF9SQU5E
T01JWkVfS1NUQUNLX09GRlNFVAo+ICAJc2VsZWN0IEhBVkVfQVJDSF9TRUNDT01QX0ZJTFRFUgo+
ICsJc2VsZWN0IEhBVkVfQVJDSF9TVEFDS0xFQUsKCldoZW4gdGhpcyBpcyBzZWxlY3RlZCwgc3Rh
Y2tsZWFrLmggaW5jbHVkZQphcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggd2l0
aG91dCBzaXplcy5oIGFuZCBJIGhpdDoKCi4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRf
aW5mby5oOjMwOjMzOiBlcnJvcjog4oCYU1pfNEvigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4g
YSBmdW5jdGlvbikKICAgMzAgfCAjZGVmaW5lIE9WRVJGTE9XX1NUQUNLX1NJWkUgICAgIFNaXzRL
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fgoKQWRkaW5nICIj
aW5jbHVkZSA8bGludXgvc2l6ZXMuaD4iIHRvIHRocmVhZF9pbmZvLmggcmVzb2x2ZXMgdGhlIGlz
c3VlLgpJIGFtIHRlc3RpbmcgdGhpcyBiYXNlZCBvbiA2LjEwLXJjNC4gRGlkIHlvdSBlbmNvdW50
ZXIgdGhpcz8KCi0gQ2hhcmxpZQoKPiAgCXNlbGVjdCBIQVZFX0FSQ0hfVEhSRUFEX1NUUlVDVF9X
SElURUxJU1QKPiAgCXNlbGVjdCBIQVZFX0FSQ0hfVFJBQ0VIT09LCj4gIAlzZWxlY3QgSEFWRV9B
UkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlmIDY0QklUICYmIE1NVQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+IGlu
ZGV4IDY4YTI0Y2Y5NDgxYS4uODBmZjU1YTI2ZDEzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gQEAgLTEz
MCw2ICsxMzAsMTAgQEAgU1lNX0NPREVfU1RBUlRfTk9BTElHTihyZXRfZnJvbV9leGNlcHRpb24p
Cj4gICNlbmRpZgo+ICAJYm5leiBzMCwgMWYKPiAgCj4gKyNpZmRlZiBDT05GSUdfR0NDX1BMVUdJ
Tl9TVEFDS0xFQUsKPiArCWNhbGwJc3RhY2tsZWFrX2VyYXNlX29uX3Rhc2tfc3RhY2sKPiArI2Vu
ZGlmCj4gKwo+ICAJLyogU2F2ZSB1bndvdW5kIGtlcm5lbCBzdGFjayBwb2ludGVyIGluIHRocmVh
ZF9pbmZvICovCj4gIAlhZGRpIHMwLCBzcCwgUFRfU0laRV9PTl9TVEFDSwo+ICAJUkVHX1MgczAs
IFRBU0tfVElfS0VSTkVMX1NQKHRwKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2Vm
aS9saWJzdHViL01ha2VmaWxlIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmls
ZQo+IGluZGV4IDA2ZjA0MjhhNzIzYy4uM2E5NTIxYzU3NjQxIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJl
L2VmaS9saWJzdHViL01ha2VmaWxlCj4gQEAgLTI4LDcgKzI4LDggQEAgY2ZsYWdzLSQoQ09ORklH
X0FSTSkJCSs9IC1ERUZJX0hBVkVfU1RSTEVOIC1ERUZJX0hBVkVfU1RSTkxFTiBcCj4gIAkJCQkg
ICAtREVGSV9IQVZFX01FTUNIUiAtREVGSV9IQVZFX1NUUlJDSFIgXAo+ICAJCQkJICAgLURFRklf
SEFWRV9TVFJDTVAgLWZuby1idWlsdGluIC1mcGljIFwKPiAgCQkJCSAgICQoY2FsbCBjYy1vcHRp
b24sLW1uby1zaW5nbGUtcGljLWJhc2UpCj4gLWNmbGFncy0kKENPTkZJR19SSVNDVikJCSs9IC1m
cGljIC1ETk9fQUxURVJOQVRJVkUgLW1uby1yZWxheAo+ICtjZmxhZ3MtJChDT05GSUdfUklTQ1Yp
CQkrPSAtZnBpYyAtRE5PX0FMVEVSTkFUSVZFIC1tbm8tcmVsYXggXAo+ICsJCQkJICAgJChESVNB
QkxFX1NUQUNLTEVBS19QTFVHSU4pCj4gIGNmbGFncy0kKENPTkZJR19MT09OR0FSQ0gpCSs9IC1m
cGllCj4gIAo+ICBjZmxhZ3MtJChDT05GSUdfRUZJX1BBUkFNU19GUk9NX0ZEVCkJKz0gLUkkKHNy
Y3RyZWUpL3NjcmlwdHMvZHRjL2xpYmZkdAo+IC0tIAo+IDIuNDMuMAo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
