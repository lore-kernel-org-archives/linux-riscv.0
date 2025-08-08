Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A66C87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTtwYpA0AgK7vDLSNYBHS/pnRWAOFIZnqFSUfEbfRWM=; b=2Q1S9o4VuwFY44
	+2nGfQEY7J6mbQvXc2W8s9LZ1ODfUD8zNqjwYG1vixZ8JLCelkER6jWOrG72WrTpasAAymvAmdmwf
	j67p6WLj7wSryJULDMEyY0SFVLdgnrOif3syNfeZuIkZl22hIADKFeKZ9OS+6Vrik0RBsrc3ULfY8
	590BhMNiGEKTep68b8VATJOqMTwEvYQQWLNxl0I1tEwQxPruTW/hxVcKOZQ6TwICKNPTKvN/3Dbkv
	15SQ3B8qJIFpjjQXZKiVhcJ/QhLaOgBwOu+7HUA0hcWzfbWBa6WvE97Fy0q6J/THhRiRJ3Q3hQN7y
	lzLE18ELTwL6Q5AUX++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLx0-00000002lTQ-1Mnx;
	Fri, 08 Aug 2025 12:11:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLNS-00000002gng-3v4u
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 11:35:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-459ea4f40afso3809305e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754652913; x=1755257713; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVe0BYxb2hdDOzuqM0QPgQUk4JUNXE4YiObhQZZKcW0=;
        b=AOJqmYxy0gXDwto1tzyOJ+CZVg2sNOo1coxFkhKzanb1w41HprNV4fel0xL7upnepS
         8S+p773Qmadxdsx62jY4gYc1/3yYw/8ooR7wpWqN49NJcGOhTORMiDO86e/5qw4Bd1Kz
         tdRMkQ5GbDAUHASUBqVpTPKpgiTxjt+N6I5Btn+YQhecR7rn1b8uNiGQJZwFSYA3LmvP
         lGvZ5ao9/gJImjjnb4Uyi6Q+/1MR2MDN17ltsTyQ4B/fJLi5zajAdaIR4/9Fi0wtyV3v
         WNwgbdarjt3p2fCTikAn6ne4aH+70Jj/UQs6B1+6Uzlq3F//7xGJneIIfHwwEFaffFvj
         4V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652913; x=1755257713;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bVe0BYxb2hdDOzuqM0QPgQUk4JUNXE4YiObhQZZKcW0=;
        b=mcGYCWnw8E8Z/KlIYcFUcQtjDeRWtlmPYEIgYQwGylzQjo3+zmB+dvr0R69UdXaNL8
         lABs3gImgDqT/luQwzGCnR7tPkp+XkVtX5WjOOpvAvwzHcHKBxdL7TsD4IzX4Hk9rfaa
         UfFyJzYuEZO2RvAUu561AqHjyibBxJ+qG28CvTHWHc8Zl08xxhlBoV+1orDyoocO5OaF
         d5QFuZ5InWCMdQ37xFMwCV6JHWuALZpalf6dFk8aMfI1iu9iBCRH4XJgDwfyQpStA+YJ
         Fn9/oQ5B2F4C/4a5OlrmAb0jaHzYNNtW39vFHzfKLjCmCnVIJrOTzWIsY10ObEt3S+10
         x1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXUQOtOIg5XUa22NivjPEViIAN2vrvcCidQrSGk1G8AoEFu/afUfJt4/1dAqQimUrc3Frn740hZO1rXaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqnVzpuidZLkr3ZQdYLEU2kEKXN/eqtYd/qnlYNvJTwJXgGjh
	l1YdlA8VI0+NTsezh6nUk16srfANX/m+eg+2nAP5abOnhpFziHzazPzpKyGGJf4fj8hGiF9Se4j
	hoj+c
X-Gm-Gg: ASbGnctO9TqMASIjMkkXyP40n14X9SftsB+BHc8nN9vLLE9nKDsloP3TBmQ1pVHMzXh
	LSJv2tFyHT50GwP4HxKCpMMtMkJNE+NYo3VEwo3moB4GZJQxuFFd8mOoYvy6aVHCqwyHAqBaNzk
	948LdM7/cBSEsODOVc3+7lNxApxi3TfTVdHle7irxpqAFyXGieWNXqBCZaAtsv8USAoPBnRZZZi
	FGtKkQhCgc3b5Wp4mBfYPJRoIGpe9eU/KvV2hiZ8bqfTRFxu8dbQh3Lty7KH3pYcT5nwMliNoJT
	asxxEc1/d6hvNz0gk2HTVAyr5ucL+Nvie0u0ldf53KnQOJpxBTdcUUPALjYHK/NdtA+1EAy1SSm
	pMztOQZXMkyLCy6qpFh+9XaYRx/q7
X-Google-Smtp-Source: AGHT+IFliH1IeRlmtSKl6taCyhr9lWYZytazufI3Vxt3GCyH4GgGDnZo7KA2cPTXc0F1MYhLNN1WMA==
X-Received: by 2002:a5d:5d88:0:b0:3a5:8abe:a265 with SMTP id ffacd0b85a97d-3b900b4ca0bmr1072782f8f.10.1754652912918;
        Fri, 08 Aug 2025 04:35:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:764c:bb32:dd82:c77])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c338c7dsm30164171f8f.0.2025.08.08.04.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:35:12 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 08 Aug 2025 13:35:11 +0200
Message-Id: <DBX0JNR61UNM.Z42YERAKRFR8@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within
 kvm_riscv_gstage_ioremap
Cc: <guoren@linux.alibaba.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: <fangyu.yu@linux.alibaba.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250807070729.89701-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250807070729.89701-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_043514_981493_1B91CD0B 
X-CRM114-Status: GOOD (  12.66  )
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

MjAyNS0wOC0wN1QxNTowNzoyOSswODowMCwgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT46
Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4KPiBDdXJy
ZW50bHkgd2UgdXNlIGt2bV9yaXNjdl9nc3RhZ2VfaW9yZW1hcCB0byBtYXAgSU1TSUMgZ3BhIHRv
IHRoZSBzcGEgb2YKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeXl4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBocGE/Cgo+IGd1ZXN0IGludGVy
cnVwdCBmaWxlIHdpdGhpbiBJTVNJQy4KPgo+IFRoZSBQQUdFX0tFUk5FTF9JTyBwcm9wZXJ0eSBk
b2VzIG5vdCBpbmNsdWRlIHVzZXIgbW9kZSBzZXR0aW5ncywgc28gd2hlbgo+IGFjY2Vzc2luZyB0
aGUgSU1TSUMgYWRkcmVzcyBpbiB0aGUgdmlydHVhbCBtYWNoaW5lLCAgYSAgZ3Vlc3QgcGFnZSBm
YXVsdAo+IHdpbGwgb2NjdXIsIHRoaXMgaXMgbm90IGV4cGVjdGVkLgoKUEFHRV9LRVJORUxfSU8g
YWxzbyBzZXQgdGhlIHJlc2VydmVkIEcgYml0LCBzbyB5b3UncmUgZml4aW5nIHR3byBpc3N1ZXMK
d2l0aCBhIHNpbmdsZSBjaGFuZ2UuIDopCgo+IEFjY29yZGluZyB0byB0aGUgUklTQy1WIFByaXZp
bGVnZWQgQXJjaGl0ZWN0dXJlIFNwZWMsIGZvciBHLXN0YWdlIGFkZHJlc3MKPiB0cmFuc2xhdGlv
biwgYWxsIG1lbW9yeSBhY2Nlc3NlcyBhcmUgY29uc2lkZXJlZCB0byBiZSB1c2VyLWxldmVsIGFj
Y2Vzc2VzCj4gYXMgdGhvdWdoIGV4ZWN1dGVkIGluIFVtb2RlLgoKV2hhdCBpbXBsZW1lbnRhdGlv
biBhcmUgeW91IHVzaW5nPyAgSSB3b3VsZCBoYXZlIGFzc3VtZSB0aGF0IHRoZQpvcmlnaW5hbCBj
b2RlIHdhcyB0ZXN0ZWQgb24gUUVNVSwgc28gd2UgbWlnaHQgaGF2ZSBhIGJ1ZyB0aGVyZS4KCj4g
U2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4g
LS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBAQCAtMzU5LDggKzM2MCwxMSBAQCBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9pb3JlbWFw
KHN0cnVjdCBrdm0gKmt2bSwgZ3BhX3QgZ3BhLAo+ICAJZW5kID0gKGdwYSArIHNpemUgKyBQQUdF
X1NJWkUgLSAxKSAmIFBBR0VfTUFTSzsKPiAgCXBmbiA9IF9fcGh5c190b19wZm4oaHBhKTsKPiAg
Cj4gKwlwcm90ID0gcGdwcm90X25vbmNhY2hlZChQQUdFX1dSSVRFKTsKPiArCj4gIAlmb3IgKGFk
ZHIgPSBncGE7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFKSB7Cj4gLQkJcHRlID0gcGZu
X3B0ZShwZm4sIFBBR0VfS0VSTkVMX0lPKTsKPiArCQlwdGUgPSBwZm5fcHRlKHBmbiwgcHJvdCk7
Cj4gKwkJcHRlID0gcHRlX21rZGlydHkocHRlKTsKCklzIGl0IG5lY2Vzc2FyeSB0byBkaXJ0eSB0
aGUgcHRlPwoKSXQgd2FzIGRpcnRpZWQgYmVmb3JlLCBzbyBpdCBkZWZpbml0ZWx5IGRvZXNuJ3Qg
aHVydCwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3Jv
LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
