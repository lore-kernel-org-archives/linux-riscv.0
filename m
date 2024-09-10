Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2014EEDE994
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 02:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+RINfviSDR2GbVp9Qh0ofN+okRyeo831ypfxsrdhL8=; b=zfoDsdjIOQaOTN
	qdIDXA9n5wnWpdyVfejZIn07Nh21qIHQLVK/U+ke9oHpOw15y3t2Lh/iG0IBwqmsmNND9X//BsNsS
	sUKBZdfttRp4xyQjx4bASGg6W9we91+xP+3Q5B1yQNpgM81x7krykz2MsMC/3CFbjaIpEdtJucZ8j
	+DoHlybjKD0A1AtNtNgu8FXwRYqUdYB2j++lAm+IBVfrmdZf8xE1pI60gc2TuTxLnO5cx7jzdNC8x
	qAcNxDphWRrbvGtyD6+bDIo6ijPYXTlsgGy1UNuD45XMtde644ucFkLZAr9o+6IZyX9ywYeQDkAxI
	7jrIpgcpdQzefueYXE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqIH-00000003upM-3RrM;
	Tue, 10 Sep 2024 02:07:49 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snqIE-00000003uoh-3OcQ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 02:07:48 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5e174925b7bso3069958eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 19:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725934064; x=1726538864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BK//ItzSH8AcHd/oLP+1w438mQf5hwWC4xyQCHjgSbY=;
        b=UWGaeE9mmaZg/8lYzXZ7wHhx1nFxterR56ErsXhjl+aLj0dfgj0p9g1zz/kHnPujxQ
         W3q1Nwcmo/haE3x+2PYhM6YYLE7YsCyh4q/dXWd/yJVs7KBkUPArmZtwf/MF7biTQTZK
         BOG31s0yK7yIdrlFh2DPCMYLmvulzgZtWLqv3ZxnENY/WcVa15LxdDZiOfAb3joeDsE6
         iLhul8LZqumo+iPb4YcJCFf4BnzKSl3/+ks2q6IlAResuq3XGWTbNBx5BPeYch6I+2hw
         iA/DyqET4BmpUaKS2eJioGUp7OB0YFuL5V9M8a3eFa2uKWk4TmMOqY8wd8t8sFhc3lj+
         sWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725934064; x=1726538864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BK//ItzSH8AcHd/oLP+1w438mQf5hwWC4xyQCHjgSbY=;
        b=v3EIySslpwqeoEFmbwspmQ9XUdrCEFoUpkFwyb2tLECkHVOCNzbmITD1oy7K86BTvj
         qTn1i2oDYr//OW3rOwK0Bx2D/lJEYEKxBz3yEV3C4zIlfMjYpO6X8uyYTv3lZKNKbbM+
         dBaYIBnRpoqm2G8+Y5lzjUelHpgg5urPhV8wLUTtgiJ+0qbHiNL+2T5qCo/evJ/QOu25
         UkTnUMlHTmDBPWsER4bDPmd4Jb5HRaXUnP7BoyJlTCxs9v29+Ln4r/6bz1mcike06aam
         MIXQLgv5bc9xiS83uEYraUI8Fl86tMLgsZhDpw2PCqn2BBMiz+SX5rNeho4LFQHR1UPg
         3yhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+TdoF+G/cMUrGKmg4QatL3ZPnVwBFid3ZyzykraulK/GNu7oZGzw+A2SkRl4769RPvrIbjqgU4nbpQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMliMkoHwqchpdfeZSbok2oljupeBJQu7piH3PudIIHmAh37GM
	Gg8/8kTTHsVqKudDmHq3ruv0sfTt8alWmLCCSK1N+Qo2NSFEhsOT
X-Google-Smtp-Source: AGHT+IHbDe1RTbmQaRrH9IC68BLUsRm5Jpdk9RC2ILmiElVq7KrDXwbTKlr5i/tuUEVKyBym2vIzdA==
X-Received: by 2002:a05:6830:f88:b0:710:dae5:df1d with SMTP id 46e09a7af769-710dae5e366mr6575558a34.31.1725934063659;
        Mon, 09 Sep 2024 19:07:43 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-710e0e89358sm1386448a34.14.2024.09.09.19.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 19:07:43 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v2 0/2] pwm: Add pwm driver for Sophgo SG2042
Date: Tue, 10 Sep 2024 10:07:34 +0800
Message-Id: <cover.1725931796.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_190746_877240_D3ED098B 
X-CRM114-Status: GOOD (  12.23  )
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

RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpBZGQgZHJpdmVyIGZv
ciBwd20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KClRoYW5rcywKQ2hlbgoKLS0t
CgpDaGFuZ2VzIGluIHYyOgoKICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJj
Ni4KCiAgRml4ZWQgZm9sbG93aW5nIGlzc3VlcyBhcyBwZXIgY29tbWVudHMgZnJvbSBZaXh1biBM
YW4sIEtyenlzenRvZiBLb3psb3dza2kKICBhbmQgVXdlIEtsZWluZS1Lw7ZuaWcsIHRoYW5rcy4K
CiAgLSBTb21lIG1pbm9yIGlzc3VlcyBpbiBkdC1iaW5kaW5ncy4KICAtIGRyaXZlciBpc3N1ZXMs
IHVzZSBtYWNyb3Mgd2l0aCBuYW1lIHByZWZpeCBmb3IgcmVnaXN0ZXJzIGFjY2VzczsgYWRkCiAg
ICBsaW1pdGF0aW9ucyBjb21tZW50czsgZml4ZWQgcG90ZW50aWFsIGNhbGN1bGF0aW9uIG92ZXJm
bG93IHByb2JsZW07CiAgICBhZGQgLmdldF9zdGF0ZSgpIGNhbGxiYWNrIGFuZCBvdGhlciBtaXNj
ZWxsYW5lb3VzIGNvZGUgaW1wcm92ZW1lbnRzLgoKQ2hhbmdlcyBpbiB2MToKICBUaGUgcGF0Y2gg
c2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRl
c3QgdGhlCiAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMV0uCgpMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzI1NTM2ODcwLmdpdC51bmljb3JuX3dhbmdAb3V0
bG9vay5jb20vIFsxXQoKLS0tCgpDaGVuIFdhbmcgKDIpOgogIGR0LWJpbmRpbmdzOiBwd206IHNv
cGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBTRzIwNDIKICBwd206IHNvcGhnbzogYWRkIGRy
aXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00KCiAuLi4vYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIw
NDItcHdtLnlhbWwgICAgICAgfCAgNTEgKysrKysKIGRyaXZlcnMvcHdtL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL3B3bS9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIu
YyAgICAgICAgICAgICAgIHwgMTgwICsrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAyNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFtbAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKCgpiYXNlLWNvbW1pdDogNDMx
YzE2NDZlMWY4NmI5NDlmYTM2ODVlZmM1MGI2NjBhMzY0YzJiNgotLSAKMi4zNC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
