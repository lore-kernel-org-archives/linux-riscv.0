Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1448CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 04:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4v/My+L+Sb9fXYqyIlTOjTm16RugX7zOjeyG4t6t9eo=; b=GISvnDqs3nQp/b
	Jh37eumfj4Im1vLsIYaHVHSEHyFeMtDTMeAo1+IkRBv8AoJNi0yrByDUi178onNFdibJ/+uBhAiP8
	g66d2DZvPHyQyZ2NeXybyMqEoxDzrRC+fywO+JrANfH3sVLuRegBsTnRMFO4TEWrCs5JJ1zQq/MqK
	6T1DtklHhnxI6+6j47pvmyC9X6MTiRxYg2FfQIr+gdInQYtfdRxjG84/DDV2lUMG93MXKMOTydAei
	EYAdwvXO7LIHEJQpDlyYIWZJ1VNw5kSRIA1aRovcbD+FzN+HJJq/SNHobqHQrqmTU2AHxcyN6bXyL
	rEjXYMmVM054cpRABLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZB-00000001xxd-0tH0;
	Fri, 16 Oct 2026 04:29:13 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHZZ9-00000001xwx-08BZ
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 04:29:12 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30b6dad2382so14393212eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 21:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124950; x=1792729750; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e953H2FvbuXgi6BcmoJysvQL7FaH+/bf9NBOMwRhcTo=;
        b=mWWpUJ/d+pN8PF4DbEQzrhAv0wHH+x4D5b4x2JajcbJ+tsKWnNHRnyHyfiNN1RTUYl
         ZDlAOi3tzTriDA6OhyhKWM5ups8OrkQbPDChe8nEjkBNYgr6xg4tI3+RahvKKiEFwm5y
         9roE/CuKaJMUtXpjcOgAo0rVOPOUn4bjkD/I0eGu42jDDs2mit6njv0GyEf6Fywjw5fx
         R0zzY54v2zVBmqKFYAvWr+UZabfg1eTQj1iWFKb456DQTEqri45XdkBv4HONpXpBZfTo
         HGGDXNQOHTSGcFEvZIM/BbJVZq4cXyNWVT2eH7aQRqhmx0rYXvcjXy0LgEy3F0/41KkM
         kbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124950; x=1792729750;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e953H2FvbuXgi6BcmoJysvQL7FaH+/bf9NBOMwRhcTo=;
        b=Px5QiztsZt46sA2i+N7v/KUzX2Q6DAfpVYw3egH1OcRKMrD4ryrPvpT59o8Lu9PtlV
         phFV5kGxcdn+tEzD880AoNw9HZ6ykO8dy3G5HcVP6f7yjjjm/kYgEtbUu+U12ni0pGqo
         7k1ANl7RCmRcn0/6ydq6pNqqLhVHJsx15wR2BvLBVFQ9ZiASXXCRuuG5P33IWK0qyMIJ
         8GEP9sYa11gGhkNin4R6BWEnIeTYnEfGL7DJq10vd7ybBTRv0E0I5jiBaHgU81yPZwk6
         gkpgytGJqmliXyZpgtYaRErC9StJeRfewd3mQ/3PzCc8zcBiL0GFlqlgQr0IsIaKtWl7
         H74Q==
X-Gm-Message-State: AFq9FYLvGhxNv2zxiLKoLBbAmEozDs0mWJ/jdMEKcZ0UXHrsuue1vyWI
	cidUA7mSC0xGEKFAu4CBH7rnAYMxlyKfMVLgigpLJxxB2efnI3lnH3vw
X-Gm-Gg: AYBFou2+Tff0NRG/OC459FmzS7IP0K43PlBPtacz9FKdsUGWKeVBBt9AZWROa/AlQj/
	K1zbrySJ0ns+EvQTmER0GTdLlIUrY4g6NM0kSBLw7RMFoeCKlAjy4tF0gY9kHXeIYYykzQkpXlb
	zBhVLChuRCNAQBnxQBKVDgL9xyxfw7xwfU3J9dvOG2eUnGp9dDhgOLt8eDWWEVtuFYjPx/FDVZ1
	XSrc0ifXmRqk8IGMs+flllJs3Ow4MSYAyzkOVx9aaa6kQYNuFRffj9zIg0uq7f1A9p3aNJbmGI9
	0B8h/avKaKIj0ZGh71uzaeOogyMn+7vW7ceBlYUjUKLcCob6lbiHpmRMxfJU0mRKdbrYfexeOOO
	NIJ/wuJPAHn//vkL6/afV4KlkTp7zHCwAJYY3g6pLfqogzfvsmlEhsEusITCgtVZucPMg2seJI2
	FIXPHmhvKhXnabdUIX1uYzLBDh5dZzoaCl4i3at0Uwt96ODwA5IEorD1bc3awq/PwSFfQlOHwc6
	vMdrOdkKy6fiBWu1a9kf/hqztmCmiysTHvxGqugGnQsMJY=
X-Received: by 2002:a05:7301:1a0c:b0:359:c212:a4b6 with SMTP id 5a478bee46e88-359c212a4fdmr20065723eec.7.1792124949538;
        Thu, 15 Oct 2026 21:29:09 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:08 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492176.1746949.5300479338170135134.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=530;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1+XW+Ome/LvXPMV4QzxLiHxj/KEOsQpJVfFab8A9Dw0=;
 b=H6hLrJ+dPH564+n6v/3LWaPDZgSy6BD/vGWMwExGgc6G1cdhhrQteApykfi4KDHO1iJRuGgVY
 4WlujeDlRk3Dmia8YCu7PudIx3vCbm7N/PKuveT+H0bZh2ngEpuQNGx
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_212911_078437_1240F3F2 
X-CRM114-Status: UNSURE (   7.46  )
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

T24gVHVlLCAwNiBPY3QgMjAyNiAwOTo1Mjo1OSArMDIwMCwgUmFkaW0gS3LEjW3DocWZIDxyYWRp
bS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gVXNlci1tb2RlIHVzZSBvZiBaaWNi
b20gYW5kIFppY2JveiByZXF1aXJlcyBzZW52Y2ZnLkNCQ0ZFIGFuZAo+IHNlbnZjZmcuQ0JaRSwg
cmVzcGVjdGl2ZWx5LCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGFsbCBoYXJ0cyBoYXZlIHRoZQo+
IGV4dGVuc2lvbi4gIGh3cHJvYmUgcmVwb3J0cyB0aGUgZXh0ZW5zaW9ucyBmcm9tIHRoZSBwZXIt
aGFydCBJU0EgYml0bWFwcwo+IGFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGV4dGVuc2lvbnMg
dGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluCj4gdXNlci1tb2RlLgo+IAo+IFJlcG9ydCBjb3Jy
ZWN0IGVudmlyb25tZW50IHRvIHVzZXItbW9kZS4KPiAKPiBbLi4uXQoKUmV2aWV3ZWQtYnk6IENo
YXJsaWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgoKLS0gCi0gQ2hhcmxp
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
