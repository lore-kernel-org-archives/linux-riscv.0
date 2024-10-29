Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B5D5B858
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFLrEhlTl9KA6xieh0OdMozld/psdw+nettdQvel6NM=; b=G9ZhDf37vuXjea
	SHBks+jzmmuqYKIUjYZ0EtNpYhgMsalwZN9hqxk9l65/R/Eek/fG7REgA8kq+Nc2s0OIRlPuJqQbt
	adQuLCz6N4IxgzS1DAFGDpQLyVmWKF9TfH29zmex4XoqgL43IbdQLpWkgXOlxFIPzjimxoHeKAjMK
	cOYqVu94P3rCxpJFYK187ChoqKFU8kOZQTjYkWKaqJ7WrWAYfP4AzsQ+JC7ZVGl6JQgObVXs6vQN/
	jl3kdApw2Fkbibe2JgkoHOzz2YcPootj2JBHIKOs7thdD8iXxjjuZ5qNZgoc85FnfOTVYtNhJ8/am
	Sp48qWhLtwBOVlKOnI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5a8Y-0000000CksH-3ajT;
	Tue, 29 Oct 2024 00:31:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5a8V-0000000CkrT-0aHu
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 00:31:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c7edf2872so43446045ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 17:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730161862; x=1730766662; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rwP95ZMKY4OhC0gDOi3064T240SYV5VJPiywQTjinP8=;
        b=XBlutnvhBRL26qgi7ccuZFx2R8OVUq3vUcthK6EFLc+8hidI03Hp4OF4uLGHXHJ8YR
         WAHtkt8P9lUumiUsKXn/L5SfP4qA9XJqt8M9GUx5SNwWLfgp2j+Djpt+lqkP0MvYW1lF
         MiobRhWs6FmupvCan/Rz/k4hu8AmOvoHDgX+1XceGJKvoG1wScV+bdso2kGsSkL87J1m
         6SC3JogY8Zq8wxGuzJbedrJWiS+2hLRcjlteodx93i9GHRkcHFBy026Zva+RiRlFFwL8
         hyWjNgM9pxhW2DAPbfbbwnl9fcvyiK6+3N1c6ldua6gZh54uPnVR3HgjTwYddnOGliw7
         03Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730161862; x=1730766662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwP95ZMKY4OhC0gDOi3064T240SYV5VJPiywQTjinP8=;
        b=qJeUMQzzP408U/Xj+RA6QFAIVgsvCP357QgSxQO/FUm+L4wvzicyKeWvEqZKyzSLr+
         J0E4PDacuTcshrU6eN9TmVSSYgeIR2fu2aB6cQZoVeEtHPUJn9mbpypebMstjXiPZvlt
         UJQPcZLDKq0IHV5K53AijduMRS4ovK49UR59sEvAwvC9v9Y4z/HNRK0AJFIqcG5wahD4
         9pArVGgBcBCTNzsta0eo2o/1cF8eE2p9W0fHx7mBJBsbDvnp+widnTU3JKgwW3mXFY76
         7tzhelodOFDQl1FBBRL+2TxBUcFZI6IZO11fgPstCVjA8UFDTNQK9pd1IX+l7tlhA43G
         abLw==
X-Forwarded-Encrypted: i=1; AJvYcCWR9nezhz6q6TsqlByri5OpwGPnwBrqHVzo0hfUvSvwyzGHbz2GNcbLXtCmLeuJBJot+MpU9tjIIwVrJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KOBeDdxtNDo6CHmCQOu0SFaonxriliJc/LGS3cEy9xCWnd9J
	RIac/u8qcx3CVSq/SClNkQIHQg/JU2C8Wvwn5gDit29cNjMVWYlt
X-Google-Smtp-Source: AGHT+IESpTU6eaOAPHzlKBFpkMOmcfSYW1lo5N6fMf7AqDlKt2Zr1wW2Vpq20ZcUGF0jGeRyRBXr6g==
X-Received: by 2002:a17:903:2289:b0:20c:b3ea:9006 with SMTP id d9443c01a7336-210eccfcd8emr5541975ad.6.1730161861970;
        Mon, 28 Oct 2024 17:31:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eddc19e368sm3941319a12.14.2024.10.28.17.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:31:01 -0700 (PDT)
Date: Tue, 29 Oct 2024 08:30:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
Message-ID: <rbb7nlqjvek3tvjtfrqnamp6bbhmdq6fe57ey3pfk4gvks4yd3@rlc3ri4fmxiy>
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-3-inochiama@gmail.com>
 <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_173103_201282_A5D4DBF0 
X-CRM114-Status: GOOD (  16.38  )
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMDI6MDI6NDlQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwgMjAyNCBhdCA4OjQ04oCvQU0gSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiBBZGQgYmFzZSBkcml2ZXIgZm9yIFNH
MjA0MiBTb0MgYW5kIHBpbiBkZWZpbml0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IElub2No
aSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gCj4gVGhpcyBkcml2ZXIgaXMgY2xlYXJs
eSBkdXBsaWNhdGluZyBhIHRvbiBvZiBjb2RlIGZyb20gcGluY3RybC1jdjE4eHguYy4KPiAKPiBX
ZSBoYXZlIG5vIGludGVyZXN0IGluIGhhdmluZyB0byBmaXggYnVncyBpbiB0d28gcGxhY2VzLgo+
IAo+IFBsZWFzZSBmYWN0b3Igb3V0IHRoZSBjb21tb24gY29kZSBhbmQgdXNlIHRoZSBzYW1lIGNv
ZGUKPiBpbiB0aGUgbmV3IGRyaXZlciBpZiB5b3UgY2FuJ3QgbWFrZSB0aGUgbmV3IGRyaXZlciBh
IHNpbXBsZQo+IHN1YmRyaXZlciBvY2ggcGluY3RybC1jdjE4eHguYy4KPiAKPiBZb3VycywKPiBM
aW51cyBXYWxsZWlqCgpJIHdpbGwgaGF2ZSBhIHRyeSB0byBhYnN0YWN0IHRoZSBkaWZmZXJlbnQg
Y29kZSBhbmQgcmVkdWNlIHRoZSBkdXBsaWNhdGUuCgpSZWdhcmRzLApJbm9jaGkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
