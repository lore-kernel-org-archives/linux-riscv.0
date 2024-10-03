Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645CECF8547
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 00:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1L+zHlY0nq+rMLc7i52MS/UDDufhTSxmSmdSeS1Ii8=; b=iRTL6Z4IDt9FAT
	e8PF99pxKIeuJapDId5BaZiKlhMi+OJPjEjoXDqAL3p4Zm2hoM5x28ZEd8g8HnbPcLG2f2X1Xb9hB
	Zc8n5pzL8SdZtpI1A1U9SELIUZNY1XjR6oEB+WFDwqYxOYhxXfuPJtjcGhDZpPgDyC/J6TiRtK05/
	dZ7oaO+N5oots5F/W4/o3T9ID9g3eEPCOti8YOgf54CyeJyxWMUG2IJc4w+jOmWMpKxt6uQh0J7T+
	g6QQj+JFvlQjRXrnthAorPsnPxi/kie4EWN3Cu2YKHJtk2PBDeh3/t6V+dc2DMfZ6pxJwmk0qQqyJ
	p8y6NAdd+5Mzk4eywcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw9Iv-00000007pUz-2INU;
	Thu, 03 Oct 2024 00:02:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw9Is-00000007pTi-0FnN
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 00:02:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b58f2e1f4so1957645ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 17:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727913765; x=1728518565; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gUM6/c8POo3ZmmnwIz3ZYq2oPmzsWDU4VKk2RR1uleQ=;
        b=ITBMSMEq/mgDdxxjmoV9WPJRUWFOHwBR+p01fxPp/46h5TH3L1MB2bf4i6rs5zWmsZ
         2UEGlo28tMaS6S3qp3BzyvblYEq960lYMc+WTPvFPYdlKouaXs0I/3OQIUHEbaqDOdjf
         mgywq7e0y2EFP6YZX0eULPJeEFCyT/KQEJVbjsvO794mKKfRPpWPYHjRNdn/dfivFcxk
         pLkVllVntVyr0x8HYlP8JVd3pB8MtD6SrTPkgm23/4CcDR3TeRYhM+6lSN4ljQhM2fVb
         jvrycKctK06qntkH1jYTzKddYj/QPtudCp36n0w/x5VD/Amg4kWNLVHzWsDaYNHyADhG
         X0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727913765; x=1728518565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUM6/c8POo3ZmmnwIz3ZYq2oPmzsWDU4VKk2RR1uleQ=;
        b=oHDdKy7vo8Urc8L97kRyod/UFB430d6xQhWYy9prDTqZQ/yQERaASEPjc4pzepZdyA
         DqbubIZXmYJ+UiqG0PZI0JY9sGKmxNtoFghLHSFvtaWOW9u+bbIEVTfKZu7a6ZUe+4Po
         sWyndFDytE2kAmjrXVCEfx6nVa3cehydAvYEwE9QIYBYL519Oq09+02yGJkRsC9D940+
         +HPbLbl6925GUnLXDTSIVPmKnVaIJxMvAskrHvI46hNy9sQbBR77uO0oUKQ9Q/4ZGkVv
         m17K+YQsHiC2yTF1MZnG2GfM5IZqVFZxou09Z8Yhr+5c1rjbYQoOFEkkksuibP0c0fFW
         x2ng==
X-Forwarded-Encrypted: i=1; AJvYcCX5fedp0EMmeN5iLhjSqO1AG1uee1lZ/079leHujBF4AOtwtDai1z7tF4b3RxRuEuV5VnTGpesayxTRIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YycY/svd3634uCnWm26IBDykfyNiQ4cGRhFY0PPTyn94HBC6Wnh
	rkyzwucYTZeO2aH8xXEOc2lfeogiMzp32bOk9rhdQHFDJ0jw2A9zF4Dlhl+Ff0k=
X-Google-Smtp-Source: AGHT+IHmCdNn6jRxhW0IWH2DWwz1m/iZxhIonrOaAjcX0AB8vRdu8ZUUUlS4NfAWFjw2P+QvaTjpcQ==
X-Received: by 2002:a17:902:f685:b0:208:d856:dbb7 with SMTP id d9443c01a7336-20bc5a5d0damr71931745ad.39.1727913764912;
        Wed, 02 Oct 2024 17:02:44 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f77d235sm2268445a91.22.2024.10.02.17.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 17:02:44 -0700 (PDT)
Date: Wed, 2 Oct 2024 17:02:42 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Message-ID: <Zv3fIuMUhukmOWQJ@x1>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
 <CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com>
 <Zv2SUVv2PUYqwOzh@x1>
 <CACRpkdZRg+k=N42EA3+3c4Er=DHf2Q1aVzzCM0OQuEx7xWMAvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZRg+k=N42EA3+3c4Er=DHf2Q1aVzzCM0OQuEx7xWMAvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_170246_120875_7C168463 
X-CRM114-Status: GOOD (  22.29  )
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

T24gV2VkLCBPY3QgMDIsIDIwMjQgYXQgMTA6NDY6NDFQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIE9jdCAyLCAyMDI0IGF0IDg6MzXigK9QTSBEcmV3IEZ1c3RpbmkgPGRm
dXN0aW5pQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4gCj4gPiA+IFRoZW4gSSBtZXJnZWQgdGhh
dCBpbnRvIG15ICJkZXZlbCIgYnJhbmNoIGZvciB2Ni4xMy4KPiA+Cj4gPiBUaGFua3MgZm9yIHRh
a2luZyB0aGlzLiBXaWxsIHRoYXQgYWxzbyBlbmQgdXAgaW4gbGludXgtbmV4dCBldmVudHVhbGx5
Pwo+IAo+IFllcyBuZXh0IC1uZXh0Lgo+IAo+ID4gSSdtIHdvcmtpbmcgb24gYSBUSDE1MjAgRXRo
ZXJuZXQgZHJpdmVyIHdoaWNoIGRlcGVuZHMgb24gdGhlIHBpbmN0cmwKPiA+IGRyaXZlci4gQW5k
cmV3IEx1bm4gcmVwbGllZCB0byBtZSB0aGF0IGFsbCB0aGUgZGVwZW5kZW5jaWVzIG5lZWQgdG8g
YmUKPiA+IGluIGxpbnV4LW5leHQgWzFdLgo+IAo+IFdlbGwgY29tcGlsZS10aW1lIGRlcGVuZGVu
Y2llcyBmb3Igc3VyZSwgcnVuLXRpbWUgZGVwZW5kZW5jaWVzCj4gd2UgYXJlIHVzdWFsbHkgYSBi
aXQgbGF4IHdpdGggYXMgbG9uZyBhcyB3ZSBrbm93IHRoZXkgd2lsbAo+IGdldCB0aGVyZSBldmVu
dHVhbGx5Lgo+IAo+ID4gPiBJIHRoaW5rIEknbGwgbWFrZSBhIHN0YWIgYXQgdXNpbmcgZ3VhcmRl
ZCBtdXRleGVzIGV0YyBhbmQgc2VlIHdoYXQKPiA+ID4geW91IHRoaW5rIGFib3V0IGl0IQo+ID4K
PiA+IERvIHlvdSBtZWFuIHVzaW5nIHNjb3BlZF9ndWFyZCgpIGZvciB0aHAtPm11dGV4IGluCj4g
PiB0aDE1MjBfcGluY3RybF9kdF9ub2RlX3RvX21hcCgpPwo+IAo+IEZvciBhbGwgbXV0ZXggYW5k
IHNwaW5sb2NrcyBpbiB0aGUgZHJpdmVyLgoKVGhlIHRocC0+bG9jayBzcGlubG9jayBpcyBhbHJl
YWR5IHVzaW5nIHNjb3BlZF9ndWFyZCgpIGV2ZXJ5d2hlcmUuCgpJIHdpbGwgcG9zdCBhIHBhdGNo
IHRoYXQgYWRkcyBndWFyZCgpIGZvciB0aGUgdGhwLT5tdXRleCBsaWtlIHRoaXM6CgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMgYi9kcml2ZXJzL3BpbmN0cmwv
cGluY3RybC10aDE1MjAuYwppbmRleCAxYmI3OGIyMTJmZDUuLmI3YzJkOTk4ZTllNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKKysrIGIvZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtdGgxNTIwLmMKQEAgLTQ0NCw4ICs0NDQsOCBAQCBzdGF0aWMgaW50IHRoMTUy
MF9waW5jdHJsX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKICAgICAgICBubWFwcyA9IDA7Ci0gICAgICAg
bXV0ZXhfbG9jaygmdGhwLT5tdXRleCk7Ci0gICAgICAgZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxk
X29mX25vZGUobnAsIGNoaWxkKSB7CisgICAgICAgZ3VhcmQobXV0ZXgpKCZ0aHAtPm11dGV4KTsK
KyAgICAgICBmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIGNoaWxk
KSB7CiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcm9sbGJhY2sgPSBubWFwczsKICAgICAg
ICAgICAgICAgIGVudW0gdGgxNTIwX211eHR5cGUgbXV4dHlwZTsKICAgICAgICAgICAgICAgIHN0
cnVjdCBwcm9wZXJ0eSAqcHJvcDsKQEAgLTUzMCw3ICs1MzAsNiBAQCBzdGF0aWMgaW50IHRoMTUy
MF9waW5jdHJsX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKCiAg
ICAgICAgKm1hcHMgPSBtYXA7CiAgICAgICAgKm51bV9tYXBzID0gbm1hcHM7Ci0gICAgICAgbXV0
ZXhfdW5sb2NrKCZ0aHAtPm11dGV4KTsKICAgICAgICByZXR1cm4gMDsKCiBmcmVlX2NvbmZpZ3M6
CkBAIC01MzgsNyArNTM3LDYgQEAgc3RhdGljIGludCB0aDE1MjBfcGluY3RybF9kdF9ub2RlX3Rv
X21hcChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCiBwdXRfY2hpbGQ6CiAgICAgICAgb2Zf
bm9kZV9wdXQoY2hpbGQpOwogICAgICAgIHRoMTUyMF9waW5jdHJsX2R0X2ZyZWVfbWFwKHBjdGxk
ZXYsIG1hcCwgbm1hcHMpOwotICAgICAgIG11dGV4X3VubG9jaygmdGhwLT5tdXRleCk7CiAgICAg
ICAgcmV0dXJuIHJldDsKIH0KCi0tClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
