Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9C6CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qtBgaJ04Ned+ntcjy0easc4uuwQw3U23E+NWSh68GaU=; b=uH7FJ/hzLebb9h
	ggH7m/2FLwNduLmQDmV7Ff//Ihh8X0oyJfkKeP+QyA5IQscZdmH87TdItMSYfeKEnAk8R++xx916r
	aXSpjgUzgLziTmb5kHjvosonSyMaKmsJnVf/lPmSDJhQNqiYRWgbweKCx3MeMcKyn+noCvG5x/LoD
	jp2d2jMAdr/81StVCT+J2n1YLFWWw7eX8KWHPk8sgLDhLQ7TTD7o0f3u62tTmhJYL/im1AUcGf005
	p+TUyGXCP4/tQUzDCtMN1fPunjDgmKxdnANp6MV06KBhLvbJP8Q2DC6AQBjBiNVhg4Xtp9vuswvGs
	GUNOFsq2yy0v8FoAC91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaW-00000005COB-3C0r;
	Mon, 15 Sep 2025 17:02:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaT-00000005CMZ-3F0N
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:01:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de185c04aso4535385e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757955716; x=1758560516; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWHHL1s0psJfb//epbwV/zjtkXGJcyLhcOl2Is0sDa4=;
        b=Osg3tlKoonHD5LMEY9pP1UMwDmdzKVnWx1EhuxrFqoHecfDSucPud/qJPVF4qUKgIn
         EeTxcgDI4fYGDhaeSooMHczZYdj7M84RUzCrQgKlKFqHAAy6kzaf9DGzJBd1ea94mER4
         wZaf9TZOLc1j1E17MLSUeTxY8UEqemqqf5zI7zSa1GSYWsS+8AXYhxqP1hDMFyMOSAqX
         RS1mQ1yye91HcWIvCZofoRgj8Y7dQ2y+jbRTv7k5fq9dtVLARgLaa+EBe7x5domuIWjH
         sQ2bvktJXbOFkbv0SuNVROn72dHt3+Vgoeq7i2YGm0nHy+TnojrSLU+HTLs06hGuUE8I
         0KgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955716; x=1758560516;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWHHL1s0psJfb//epbwV/zjtkXGJcyLhcOl2Is0sDa4=;
        b=r/iiCbklzrKV/yPVMJoEiuWuRWt7HQyn2JA2G9WbhlenSJDPfRrcUcM7VFA3s+hDNM
         aWX3pbr/NHeP62q+HiKrfV6zMX05qYLBdK7MOZEPMMfuQmB4eIjKDTAwejqhadYskuKx
         +6uaVKGBFyC7H4pmEDRhXnaxLlcQwQu3PzcfX4OO5RqKhbtnNOPKM5DjcybDoj6UpMF/
         fvpXmF1M6kbNCsAtw/bwFlOhO4crpKxZuM/h3PVFKqwVzh0Zqyiz4OeygDoMq5Tvt3Je
         hok8QZiJDi1pdIQFohPsro2meZ+wJLFqhWLWIIuZBYZSK1wmitJ07pwioeL1MJ9pbwAt
         5o2g==
X-Forwarded-Encrypted: i=1; AJvYcCWaB9/hFy1URh1mO11/i9dXDAZcCeAZPfgNSqKEsZHmR1gFdNSzhagoZtOAmJb3C5DAvozTUI+NG2gK9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjK6mMGCNP8QKmmDmqcNmw5tl+sw86Aa3J3NFTVbuhwqOghKT
	x0DpnHKfggeZCSqwvkZ3nnPAtMEZrcT2TCpDnyMaDr9myEOXLVGZUC7A6rCEZKN//+4=
X-Gm-Gg: ASbGnctXz56cmhsEPHjFl8hH86vKoBAaqYyzfQjFGToHVI2DgGvIUaJ/eTBcekACF8Z
	xPKgcuG7bZ2E0VbvGTQalmtYH8TlQXT0w8ozMkVV7vbbHwRcDS73LW+JpK5snspd+HjoDSKU806
	faPuzSaqqahjju9UNpzwvnuDr594uRC/UQuhyW4H8C/nX510n0hfHtfGhGYbW3q/yxiagzde2Q7
	L0Gs0aAJMrWgJSS9g2wtld0kunyJ89LMhPrXoyV3+WIlleeo7rgU9liBoHlqAbxfjEQc72LxT0U
	rgW2x18GcLY03RLatCmh4I4EfefgQx3rg5chSxnK/K0WtYCnA2s0hFvTiViPowaFSfEGNK1z9WP
	bo0+k/61rUkMTk/f97M75LA==
X-Google-Smtp-Source: AGHT+IFU1lq2Hn1rhnQ1PXztdy1u0/BZUM8rfqOS080uGF0cxwIiBohWrEivOXB1opFs7TzdP9qSMg==
X-Received: by 2002:a5d:64e3:0:b0:3e6:4b2:b9b2 with SMTP id ffacd0b85a97d-3e7659e936fmr5550562f8f.6.1757955715906;
        Mon, 15 Sep 2025 10:01:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm7301300f8f.50.2025.09.15.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:01:55 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 19:01:03 +0200
Message-Id: <DCTJ9US6E4PG.1MA4ICDR21DS6@ventanamicro.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Tianshun Sun" <stsmail163@163.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for
 migration
References: <20250915152731.1371067-1-tjytimi@163.com>
 <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
In-Reply-To: <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100157_816759_EDD1033C 
X-CRM114-Status: UNSURE (   5.71  )
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

MjAyNS0wOS0xNVQxODo1Mjo1NiswMjowMCwgUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ogo+IDIwMjUtMDktMTVUMjM6Mjc6MzErMDg6MDAsIEppbnl1IFRhbmcgPHRq
eXRpbWlAMTYzLmNvbT46Cj4+ICsJaWYgKHJlZ19udW0gPT0gS1ZNX1JFR19SSVNDVl9DU1JfUkVH
KGN0eGhzdGF0dXMpKQo+PiArCQljc3ItPmN0eGhzdGF0dXMgPSB2Y3B1LT5hcmNoLmd1ZXN0X2Nv
bnRleHQuaHN0YXR1czsKPgo+IE5laXRoZXIgc2hvdWxkIHVzZXJzcGFjZSBiZSBhYmxlIHRvIGRp
cmVjdGx5IHNldCBoc3RhdHVzLgo+IEtWTSBzaG91bGQgZGVyaXZlIGl0IGZyb20gb3RoZXIgdXNl
cnNwYWNlIGNvbmZpZ3VyYXRpb24uCj4KPiBXaGF0IGlzbid0IGNvcnJlY3RseSByZWZsZWN0ZWQg
aW4gaHN0YXR1cz8KCkFoLCB3ZSBkb24ndCBzZXQgaHN0YXR1cy5TUFZQIHdoZW4gc2V0dGluZyBL
Vk1fUkVHX1JJU0NWX0NPUkVfUkVHKG1vZGUpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
