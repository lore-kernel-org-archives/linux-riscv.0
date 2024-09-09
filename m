Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C4ECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3x9gtojKla0asNjVqucyrMjLs+Yxh9t8hYx6sFGjiI=; b=2JJIax/Gi/PAHr
	mB4RzGkH1pQao1npdcd0vkr25oUYbpa3jABHn6QXOFa8sBC5GbIsGi0lHTEbXLc5kGQFgxUJy6I51
	Lvu64dWZzkIE2mNKEXoDcpGpcnZc7VCsXl/effpfe+CDBt2GM2kZLzrb/ujosOF/ARc6gNYtAqwVd
	Cw0kvpySDBvjDNSMGeKrBw16jlfW5UFKoczdlcXwNYVpbW0RAm75lK25PsYUC3xD/ocKFRwcTqt76
	X+N23eDxLZkMUySoGqx2WufwaaUEHRcu+qAB4FPch6NKApb5w/W38lwoDZmbWm7HGPeg4voh5tIfH
	wtNLqs7DPleq25HWIACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndli-00000001sZA-3IbH;
	Mon, 09 Sep 2024 12:45:22 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snc3i-00000001ZTe-1Ewi
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 10:55:51 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-82cec47242eso20444239f.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1725879349; x=1726484149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRenQZpsyYsPRZFrE6Z8exC8VyrPgR2I0N0/8AA/xzs=;
        b=wCAdBgus0AcVKEEd/edIOXUXAEBaMEN2yeHWM4EDuEteNzxLWWoce7UV/1EawNbYeZ
         udkWwb3LfwDosxIUGVq3SfQholQCWFBEW3oGAPOMEtSqZBYT1EThjXyVfJSdorOmwrmZ
         6PeQsUUEWt8hJM8R+10m3fgZVPayJhK1tKYI0d+YhzyRrp+yPPKlgh62vwuFFsrfAvaV
         FGOmaSOeSS0V0vVygac8m+MUJGJkgYca45prN54HSQi/2xtYO3774+ExPK65IyU/buUc
         0NGkMqbs6KUI7/rfhQCSWCbaalbhQlkzf1pcLLT0hJJdcqVwjsTxxuSw0Lb22I/vKgDV
         TMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879349; x=1726484149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRenQZpsyYsPRZFrE6Z8exC8VyrPgR2I0N0/8AA/xzs=;
        b=KH1drIeN7YbbLvKmgsYYG4hVx1R45e8E1YCiYPRL+oi4PEZYlW9jSFR//oJGU8l/pt
         2vte9UBCT3+ab1/HLAs5YQX0PKKKWoFRdtp+my8Lda+wPEiWDX3+nZ6Tysr1JwNzeuUb
         vzSihhSb/+JkoLfLvDSYvqVugT611C8sdikUYYdOf89wdir8TKRDZc7AFw5zicxW1o3L
         DMu5ilSkBIIup7lNb1VUoOrNCzSJyGATra+9/UO3FNH/rueHlp4NHr1YjOTAEoyWxbMi
         HRKlx0qBZxlEtCx7y4wgV6H0oA8g2jFNgJd2IAQwEMdDY15lpFp7kqPR7NoBGYcp8tus
         mHZQ==
X-Gm-Message-State: AOJu0Yzk00AHRmwSz4+ORK/81MimgbEEM8znxK6CkmwFSPwtaS/kPCgt
	wdjqUzqcClYzdtybd4zcCzkPl7snvQHY751R11Aok3ix5tBog46hUsuRU4zhWfpfH/T8sbq6DnP
	lilCk7lUFRwnEAIG2ngd0YHlg2amCvuhW07SfEQ==
X-Google-Smtp-Source: AGHT+IEUDJyXv2vNFFv9EShn4mJ8cnVFxPmnwZrvxExgRhOCxti541uhxlyRmn9HiGjbpDSnGCkrSVIPWa00MTMLvv0=
X-Received: by 2002:a05:6e02:b49:b0:398:a9b3:d6b1 with SMTP id
 e9e14a558f8ab-3a04ede83d8mr89419445ab.12.1725879348819; Mon, 09 Sep 2024
 03:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240909085610.46625-2-ajones@ventanamicro.com>
In-Reply-To: <20240909085610.46625-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Sep 2024 16:25:36 +0530
Message-ID: <CAAhSdy2dS=97YVLBvKsA-GjPKXZTpoGUhahj0_ocTpuB=UBNKQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix output text of base address
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_035550_526772_87B30EED 
X-CRM114-Status: GOOD (  14.44  )
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

T24gTW9uLCBTZXAgOSwgMjAyNCBhdCAyOjI24oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgInBlci1DUFUgSURzIC4uLiBhdCBiYXNlIC4u
LiIgaW5mbyBsb2cgaXMgb3V0cHV0dGluZyBhIHBoeXNpY2FsCj4gYWRkcmVzcywgbm90IGEgUFBO
Lgo+Cj4gRml4ZXM6IDAyN2UxMjVhY2RiYSAoImlycWNoaXAvcmlzY3YtaW1zaWM6IEFkZCBkZXZp
Y2UgTVNJIGRvbWFpbiBzdXBwb3J0IGZvciBwbGF0Zm9ybSBkZXZpY2VzIikKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
PiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIHwgMiAr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBpbmRleCAxMTcyM2E3
NjNjMTAuLmM1ZWM2NmUwYmZkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWltc2ljLXBsYXRmb3JtLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXBsYXRmb3JtLmMKPiBAQCAtMzQwLDcgKzM0MCw3IEBAIGludCBpbXNpY19pcnFkb21haW5f
aW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICBpbXNpYy0+Zndub2RlLCBnbG9iYWwtPmhhcnRf
aW5kZXhfYml0cywgZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzKTsKPiAgICAgICAgIHByX2luZm8o
IiVwZndQOiBncm91cC1pbmRleC1iaXRzOiAlZCwgZ3JvdXAtaW5kZXgtc2hpZnQ6ICVkXG4iLAo+
ICAgICAgICAgICAgICAgICBpbXNpYy0+Zndub2RlLCBnbG9iYWwtPmdyb3VwX2luZGV4X2JpdHMs
IGdsb2JhbC0+Z3JvdXBfaW5kZXhfc2hpZnQpOwo+IC0gICAgICAgcHJfaW5mbygiJXBmd1A6IHBl
ci1DUFUgSURzICVkIGF0IGJhc2UgUFBOICVwYVxuIiwKPiArICAgICAgIHByX2luZm8oIiVwZndQ
OiBwZXItQ1BVIElEcyAlZCBhdCBiYXNlIGFkZHJlc3MgJXBhXG4iLAo+ICAgICAgICAgICAgICAg
ICBpbXNpYy0+Zndub2RlLCBnbG9iYWwtPm5yX2lkcywgJmdsb2JhbC0+YmFzZV9hZGRyKTsKPiAg
ICAgICAgIHByX2luZm8oIiVwZndQOiB0b3RhbCAlZCBpbnRlcnJ1cHRzIGF2YWlsYWJsZVxuIiwK
PiAgICAgICAgICAgICAgICAgaW1zaWMtPmZ3bm9kZSwgbnVtX3Bvc3NpYmxlX2NwdXMoKSAqIChn
bG9iYWwtPm5yX2lkcyAtIDEpKTsKPiAtLQo+IDIuNDYuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
