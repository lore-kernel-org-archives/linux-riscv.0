Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3617BCD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 05:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKTuSVzQQ+H/WpPSBqPtC6yz+kAgdACWzb7WOZFckYw=; b=nVU8aa65sSmRvT
	f4XwY9JADSUl6HspkjcYsZSrEXgE5e7WHUAD79FRfl2mb9JtiGq5iFSKyBtilbpT2W+6yfcnVBDqn
	1WQiuGpts/MdBpQVzw6Ke4eg9LicIE1t7pEKqPOytPMhlaG9uHmspDJ4M3pLFIfAxcVxvZSvvr52N
	+99FhJy2a6IrRlEvP1pvqAPL2mMujlEVddMCEWkdOtWY8XXTbdbWzc4lqXanzFeQKUcIprRcN2Lgh
	qHEM0YGaZBvNGBaUGwQwQ7Ryn91mtHEMx/ulpN//Cw/h1xYC54VykKSEbdiA7DcpEuigGGMMkjotl
	svuKYsglDzHV89Br9SjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lR-00000008KsV-3UjF;
	Sat, 02 May 2026 05:19:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lP-00000008Krh-3CgG
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 05:19:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so1773083b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 22:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699179; x=1778303979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=su2kpM1P0XVFxMxKXGLxD6zcfN+uXddsOQE5EoygP0agpBLbwosfd3x24BCLsYOPhB
         ZuDQx4YY7Fz/Z3uBVLro2ZAbB6saBiQZkjl29YWKwhtVHQ7cifsvkwHGeeCNS19mZXvi
         H5u5+G8oUvBPmE9fv9NE2rzhIUYyWllKjS77Zv+vCo47McrPi7NrnHd1O3dNzo1mNEtQ
         onG9XqmcCwqbMyDnCJ3Vd5ISXU9/6iUTIE1gRQ3+lb0DDXHtWS4z+Xhy5hWxaXcQ32bs
         PQNVPdqerx8HukoAK/MABuqYIc2VLi0/zZLJuUxyZebsaNdE0sCugv+rPsjpdVAL890a
         F8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699179; x=1778303979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=hF1JhvEs/X9YNUN0SvzhbfCIxoHXTza2ClC4rbdOrBPWdwjl1wVk4fwew+Y+YLs2Qb
         fkbOFiM+uLeihGNzpv63jrPXkD1QWBfVFKPyvxy7yGV0G1Z7hdJHwLyBu7dlXl6VA7za
         OZ8R/hXSr6shmVdoFrm03SEoxVrQ16/ejYqvLGzrGWJdoDsS+v6wZMppooazJnB5pTrW
         ZODJOXZmeKpRjy4YgNgP7a+/3tHXNndJwAsiew7nq09l5EX4PumZ7D21tsGFPOHnqXi2
         3AjgaakY/SdKB3dNrWz65zxSXpx+teFrowR6FfJxeytcB3i7+zI6T2YxZlePKhsv9Fvc
         ilag==
X-Forwarded-Encrypted: i=1; AFNElJ/92T3PezPcObkanEK/Z0lf+08RyUTVpK6ABLHon4EeuFguCRsbuKzXRxfpRI9POLDz6PxQszJsb9nCAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/jPBgUrh30PMIl0lSmmLcNOcQT1Fd7ugC/FrbZhqcJ3Uh9lz/
	h/X2coZGnMYqn1bp5l44dRwMykq6xAblAmE0qLTcpdIyMN/c/pV2BRBc
X-Gm-Gg: AeBDievvc3iBqUThVqwBs2r9pDdnUStBcCeEOZJ2pwyZUjAgKYqzF6qBdUpCaJISDHt
	nLq4OPkQeiPdjdSDVtVq2Yc+fWVZj9CyFuwBH3U2GTYIHNusyF+e/sEfNrjOtc82U2jPGYUeNR+
	vkA2Tx6TqOvGRlKJZ40E8Hq5SuLEG/S/2Q0+yPV4zBe4u+jLewsjACfZnAWrt6VyU3NA8drF4wX
	h0pT4/a17gEe58fohOZSAcO7ITVw7YqcHKMDHkS0IvgXLMfIDeB0TeQxFXaBS3zEe++AmCYVlwX
	2d67KuC5NVFhyX7hPDkvDSW+PJ46LfWG70EFRSVILj61U36Ybn0mmh6EQsUded08G4FzRxuN5+k
	5E4CCwuHjVAGTvzcwGwMl8qF2CXIeqtjvtuQmrmhq50sQ9D0tSeNKR3Rc81jPIvvh8F9VmnoVxd
	t/WqTXXgMVO8xEeDeRcVZQ4ot3VEAgZA==
X-Received: by 2002:a05:6a00:4188:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-8352d29a99dmr1858138b3a.48.1777699178931;
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Sat,  2 May 2026 10:48:56 +0530
Message-ID: <20260502051906.8160-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_221939_802913_93426EF2 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Chukun Pan <amadeus@jmu.edu.cn>, Ze Huang <huang.ze@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TGluayB0aGUgdXNiM19odWJfNXYgcmVndWxhdG9yIHRvIHRoZSBVU0IgY29udHJvbGxlcuKAmXMg
dmJ1cy1zdXBwbHkgdG8KZW5zdXJlIHRoZSBVU0IgMy4wIHN0YWNrIGlzIHByb3Blcmx5IHBvd2Vy
ZWQgYXMgcGVyIHRoZSBzY2hlbWF0aWNzLgpJbiBhZGRpdGlvbiwgYWxpZ24gdGhlIFVTQiBodWIg
cmVndWxhdG9yIHdpdGggdGhlIGJvYXJkIHNjaGVtYXRpY3MKYnkgcmVuYW1pbmcgaXQgdG8gVkND
NVYwX0hVQiBhbmQgbWFya2luZyBpdCBhcyByZWd1bGF0b3ItYWx3YXlzLW9uCnRvIG1haW50YWlu
IHBvd2VyIHN0YWJpbGl0eS4KCkNjOiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+CkNjOiBa
ZSBIdWFuZyA8aHVhbmcuemVAbGludXguZGV2PgpDYzogQ2h1a3VuIFBhbiA8YW1hZGV1c0BqbXUu
ZWR1LmNuPgpTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+
Ci0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgfCA0
ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0
cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCmluZGV4
IGMzNWY0NzYzYzgwMC4uM2RiZGY1M2I2ZDhlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwpAQCAtODMsOSArODMsMTAgQEAgcmVnXzV2X3Zi
dXM6IHJlZ3VsYXRvci11c2IzLXZidXMtNXYgewogCiAJdXNiM19odWJfNXY6IHJlZ3VsYXRvci11
c2IzLWh1Yi01diB7CiAJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKLQkJcmVndWxh
dG9yLW5hbWUgPSAiVVNCMzBfSFVCIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAiVkNDNVYwX0hVQiI7
CiAJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAwMDA+OwogCQlyZWd1bGF0b3ItbWF4
LW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKIAkJdmluLXN1
cHBseSA9IDwmcmVnX3ZjYzV2MF9zeXM+OwogCQlncGlvID0gPCZncGlvIEsxX0dQSU8oMTIzKSBH
UElPX0FDVElWRV9ISUdIPjsKIAkJZW5hYmxlLWFjdGl2ZS1oaWdoOwpAQCAtMzYxLDYgKzM2Miw3
IEBAICZ1c2JfZHdjMyB7CiAJZHJfbW9kZSA9ICJob3N0IjsKIAkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKIAkjc2l6ZS1jZWxscyA9IDwwPjsKKwl2YnVzLXN1cHBseSA9IDwmdXNiM19odWJfNXY+Owog
CXN0YXR1cyA9ICJva2F5IjsKIAogCWh1Yl8yXzA6IGh1YkAxIHsKLS0gCjIuNTAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
