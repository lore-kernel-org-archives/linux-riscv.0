Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B3C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kcO26c/MJyOf9xz1H4ZRFhVxivWTGX3cMN4pPoupcyk=; b=JnOaMsQPu4aMy2
	voewtRgIiU/fh/5Orm/DuVlLDhbRmpkhOy9XmTom42rBIFAK855b4LHqhqptYmSDJJkFyPcSwFyHC
	BlBrQnBe64KDmFbdX5TI5UnlZ3AYRXxWGBOvvq0UWEovINeFhtQIEl6pFKwliW3r1kOHxXfy/6Mkc
	504AXJ0Atix/ZqgDAB6mGi390rLxDFmTR98bl9Tfu9OmftmzpBY0QJaHlyUa4YoAPVnnncK7cTYvN
	AXzpOMGpi4XWpGFXZD25gCW1UaSv8MZZI1vamqhs/tZMKOlLR9uhuOZYgeUklrvRHp5sc8emjGWI3
	uMlPMSjOdWJHv9GZ0rbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATa6-0000000Fm1k-25Ko;
	Thu, 01 May 2025 13:04:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATa4-0000000Fm0q-0rmd
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 13:04:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39ac56756f6so828445f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746104638; x=1746709438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLp6G69AjGMZh/i0hYBrG+us2tPn51T4tZ/hDIBrtE4=;
        b=brWvYOTAaMkzeg/9olzo0TehPSeAp0Vx+B31WA6PhlF5CDPhIv1JCRXmTCv3sq/iXP
         A0xdd4NyN+y/RUBSjBi8UKVXaOJIABUkM7mDq0HnqYpRd/rKIELwiiElWZn+0bhxlAjF
         7QsvVzLCQ7nC3Z+v+u4MU29ISJDN/5dAosoxN1et3hENm90TWImpwOj7ApAuOO6j1Lh5
         kQf95zLcOf1/06smUJvjr7nsGe+mosO7Qp7XBd7yWx0LXziiVNDzOUqR/v89Ke5h1CEn
         klajWerzOmpxty6pWmNKobVd2Hro3wHx5LKYbf+6lsYDK64v4EQsbOOY3ciFIhP9JAM0
         uTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746104638; x=1746709438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLp6G69AjGMZh/i0hYBrG+us2tPn51T4tZ/hDIBrtE4=;
        b=EWzBwjyl/nu0EjjeC44uOMbPeV+Up7Lsbo3IoeHLYMLM5TKzo2Vpoi0P8De5JCzdMT
         IqWQO45P31nUf1lorj9FwBImWg54t3hLg5Lnxq8C738OkM/4EoYgzKSsX5lc97SN+887
         UCZvFU5jph7052/p2GomLzjdua6mQnGLg2lC9qVoidJYR57sCuAjwog+cMuVxp5phjGS
         h4EZIUmwJYBMObRd4DmdIU1G2dV/xQvaq2/ksJAywaPHLV+60PP4Fkrlx6kyb/x/RDIm
         nTbRf2aLK9h62ujTV0kSER4o2rysCcsorlclBR/V2NX6+b9usi5zlC+y9+Ckz4R01GU7
         zgaw==
X-Forwarded-Encrypted: i=1; AJvYcCXcKRcdo8WdNgw7gwMOlGkkBEdqJ8CANSqhoyA2r2OSRn2dMyAHpG3hnmfo2uveGfPmK1Rfi48oVXm5ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeQ33+1MU30qR+9S2JAuu/bLk8LnwQfkIgUqpDS9k3U9pZ6msA
	48xBR7JP85z1xHDfmnTwdVkCKQU+s3XqWnTtIJFSklQikeJdQjmM
X-Gm-Gg: ASbGnctMq/3lD1TL/43srWY2hQXtB1w03OSqOwJL8GGG4XAp+d3YjrVq1WY3LwMZXoj
	ZeVvuwRlu5UB6wsa+l6POqNB+D4acXP5+cIvX+1s5s0aUZkCsITSlLgIpKM07SUEIiAuZV+7Ob3
	UasV93/WP0wFCEhi9Y/yA7UAD+0/ck0ttTl8OEWXbjHF5DiKgVgxZxCf8w+lGgvDV+BVxj8+gjy
	mnqr7s3kc3ulRuaFkCq9nGHqIqfZB10pjO/nNEXO4NvZq64uCuPKLn6AimL/BB0/vNOfVrpEMgM
	l4ah73N90tXmpkjk8PgZohRpK5Ik6DVMkUjamRq80kJcfd51j3xYK7pYjZ9I
X-Google-Smtp-Source: AGHT+IHN0m78X3MUvAMXKykuMAkM3TbruwNqjk1r7kAdw4UWFKm3it44VrZLXWxJYGsg9ZIawYZjxA==
X-Received: by 2002:a05:6000:310f:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-3a08ff4fca9mr5109558f8f.49.1746104637846;
        Thu, 01 May 2025 06:03:57 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3e04asm830880f8f.18.2025.05.01.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:03:57 -0700 (PDT)
From: mikisabate@gmail.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
Date: Thu,  1 May 2025 15:03:09 +0200
Message-ID: <20250501130309.14803-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_060400_246853_589866AE 
X-CRM114-Status: GOOD (  10.64  )
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

RnJvbTogTWlxdWVsIFNhYmF0w6kgU29sw6AgPG1pa2lzYWJhdGVAZ21haWwuY29tPgoKRml4IGEg
Y291cGxlIG9mIHNwZWxsaW5nIGlzc3VlcyBwbHVzIHNvbWUgbWlub3IgZGV0YWlscyBvbiB0aGUg
Z3JhbW1hci4KClNpZ25lZC1vZmYtYnk6IE1pcXVlbCBTYWJhdMOpIFNvbMOgIDxtaWtpc2FiYXRl
QGdtYWlsLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgfCA4ICsrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCAxZmQxOTdhZmQyZjcu
LjNmNDBlMzNiYzExNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwpAQCAtNjY0LDEyICs2NjQsMTIgQEAgY29uZmlnIFJJU0NWX0lTQV9WX1BS
RUVNUFRJVkUKIAlkZWZhdWx0IHkKIAloZWxwCiAJICBVc3VhbGx5LCBpbi1rZXJuZWwgU0lNRCBy
b3V0aW5lcyBhcmUgcnVuIHdpdGggcHJlZW1wdGlvbiBkaXNhYmxlZC4KLQkgIEZ1bmN0aW9ucyB3
aGljaCBlbnZva2UgbG9uZyBydW5uaW5nIFNJTUQgdGh1cyBtdXN0IHlpZWxkIGNvcmUncworCSAg
RnVuY3Rpb25zIHdoaWNoIGludm9rZSBsb25nIHJ1bm5pbmcgU0lNRCB0aHVzIG11c3QgeWllbGQg
dGhlIGNvcmUncwogCSAgdmVjdG9yIHVuaXQgdG8gcHJldmVudCBibG9ja2luZyBvdGhlciB0YXNr
cyBmb3IgdG9vIGxvbmcuCiAKLQkgIFRoaXMgY29uZmlnIGFsbG93cyBrZXJuZWwgdG8gcnVuIFNJ
TUQgd2l0aG91dCBleHBsaWNpdGx5IGRpc2FibGUKLQkgIHByZWVtcHRpb24uIEVuYWJsaW5nIHRo
aXMgY29uZmlnIHdpbGwgcmVzdWx0IGluIGhpZ2hlciBtZW1vcnkKLQkgIGNvbnN1bXB0aW9uIGR1
ZSB0byB0aGUgYWxsb2NhdGlvbiBvZiBwZXItdGFzaydzIGtlcm5lbCBWZWN0b3IgY29udGV4dC4K
KwkgIFRoaXMgY29uZmlnIGFsbG93cyB0aGUga2VybmVsIHRvIHJ1biBTSU1EIHdpdGhvdXQgZXhw
bGljaXRseSBkaXNhYmxpbmcKKwkgIHByZWVtcHRpb24uIEVuYWJsaW5nIHRoaXMgY29uZmlnIHdp
bGwgcmVzdWx0IGluIGhpZ2hlciBtZW1vcnkgY29uc3VtcHRpb24KKwkgIGR1ZSB0byB0aGUgYWxs
b2NhdGlvbiBvZiBwZXItdGFzaydzIGtlcm5lbCBWZWN0b3IgY29udGV4dC4KIAogY29uZmlnIFJJ
U0NWX0lTQV9aQVdSUwogCWJvb2wgIlphd3JzIGV4dGVuc2lvbiBzdXBwb3J0IGZvciBtb3JlIGVm
ZmljaWVudCBidXN5IHdhaXRpbmciCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
