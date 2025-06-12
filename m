Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A962C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIhQBrugRV6vAGQyvVruTbkoEL7T/rTQjtb62FLuHyo=; b=YJqkI+jUAt40Vy
	+tVcyJO0HI3ya9KWrALFXDsyTp7r5cHcREgQiD3Q1BqkvXBfAO5ST8kNNmhINr2ztjYiJ9c0WrtWy
	ve4GdhjDc48TIH8cIm+85ayNe1umIZRKRilCzFZBf6R3z92HFpVc5rY5Yy+K2BHgBoorErpP3llwY
	eVMOsBhWTu3c/zhruqn2pN62u1NXNpm/4NLhHG4cz20VE+Plf6ADRaAFPSqFU+6QCp23X/W54BTzq
	NQBKVuS916B04ylQFEE58ibfG22m0C6sq3fRu0NqK7giU/garTJmN2I3ykpxhLZLnuKNzcr8Cej4C
	2HNhMAecOU372+wUsF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpz-0000000EICK-2B7L;
	Thu, 12 Jun 2025 19:43:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjPY-0000000DiOx-3tbn
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 15:00:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so139900f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749740410; x=1750345210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxvHpJ/jLR2SLY4sVqp7FxybSyqWdedSjHtBGZuRV/U=;
        b=aPFKBcxBLFi6N5C6SdZDIYzb/CZIafBwn7jYTEljE0bC9evHnNNXTHtmXeEyB7NERH
         i2XT3DNaCVN3a8eCQoVV7VglXGrElfr2q2aBa5TD4+aept9TUaZapSw0VMYUigYiaVrq
         9XHye7HQIPyL4PoE93C2ZUkUwyLAW5JSJjbEMYRJ3vyOd+QJ4HgV0Zo+gpkrE4jLorzk
         JVTUmcxbpnIsacOjqQFTvhrSbPt0zfKlFNx9xoWOnKVz5ELCxfY2xGw/U4OXCQmQi+Nn
         9hlb0HiSOnGKfEx5zoJEkcm2MfbFLnINUBnmLBwFUzxmQ1RY37WfPWbI5WKm3vSD0EKz
         wxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740410; x=1750345210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxvHpJ/jLR2SLY4sVqp7FxybSyqWdedSjHtBGZuRV/U=;
        b=VC+l0cbfEr3ODsjj34GNiYZ9a2i2PhWQbRvdedd9jqeug7GeRyvNYibk475ASDIqk/
         emARGVR+ZwwMqnXZZElNTdyk4r+mpe0Z4WbCJyMJTiD5m0cqZy2GPPh4M6NLNqos9g5N
         DpDhywRxQhPLINh40Kn/jR5yuPs1NMHdqz8LyK2EFY7O+quH+KavqSFI3cgPfStkC5xV
         sPEF3gzp2vvMM/8moX9njCo6xsF5nz2vwmaDWb4up2r+n1PvTCM/C8HJE83g3k92FcTy
         hw9407xnE9tnukLqg40O9NN9q9hyqlAV2t/2I2CAw70v6IgyBTU3bq5eFvEpE76TzftF
         DzhQ==
X-Gm-Message-State: AOJu0YwHCBnV6QZGA7/iTfFMaWzEhy4cT5dJ5wqWXIHa6XQYjLIa7tqz
	rb1UHndSQG+v32pRi0TagthP04MWPvUjLrtbzEVmGEunfYa2lvDNFrHlZSEyEkmvt68HfSJ9yaJ
	Pf07g
X-Gm-Gg: ASbGncuVe7t3k4jCY4z/8BJbYOlMnLdiiHULzZXiEPRSztYv46MexpNjqJxhzg6Xvvt
	wNxHsoLQfRlnv5LsWtQ4iBZgt1VkmQzCvrNB4ymLAURQA/rgP3WQTWQrBBRu21Cf1cvAX5uyLkk
	4rjNIDrXmJoBG4iBE4H+N02Pbt6QubGZJHST/MSmVYHI62mCVIjnOjzY4o+Ij4+QGNb4AGG64Fm
	9oZhK0DOc1wd457FRkZafJqvGRf69cxnBWN5IzFkAk7+Uecd+m2ZzX82rud2Urv3KVv+Hfcvfx6
	qDWkL+4isvNg4V8PLU2Dqbnt56QVyPyDNtrC+jf96JxR1FloHgPt5ABR86JQ+9dfAWAEXw==
X-Google-Smtp-Source: AGHT+IHsElLaIZvGcIh+StpvFXvoYZI/iG4C7lC/hP2aO+itlbKoQzyKW+xmnRb5tTorqwGYkUKDIg==
X-Received: by 2002:a5d:64ca:0:b0:3a4:d30a:7633 with SMTP id ffacd0b85a97d-3a558a219bfmr2775708f8f.15.1749740410251;
        Thu, 12 Jun 2025 08:00:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:e05f:7af3:1bf9:f101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm22980815e9.35.2025.06.12.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:00:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/2] RISC-V: sbi: turn sbi_ecall into variadic macro
Date: Thu, 12 Jun 2025 16:57:54 +0200
Message-ID: <20250612145754.2126147-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080012_966587_829F2CBA 
X-CRM114-Status: GOOD (  14.39  )
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

Q291bnRpbmcgdGhlIGFyZ3VtZW50cyB0byBzYmlfZWNhbGwoKSBhbmQgcGFkZGluZyB3aXRoIHpl
cm9zIGdldHMgb2xkCnByZXR0eSBxdWljay4gIEl0J3MgYWxzbyBoYXJkZXIgdG8gZGlzdGluZ3Vp
c2ggYSB0YWlsaW5nIDAgYXJndW1lbnQgYW5kCnRoZSBwYWRkaW5nLiAgVGhlIHBhdGNoIGNoYW5n
ZXMgc2JpX2VjYWxsKCkgdG8gYWNjZXB0IGFueXRoaW5nIGJldHdlZW4gMQphbmQgOCBpbnRlZ2Vy
IGFyZ3VtZW50cy4KClRob3NlIHdobyBjYW4gY291bnQgYXJlIGFsc28gZ2l2ZW4gc2JpX2VjYWxs
MSgpIHRvIHNiaV9lY2FsbDgoKSwgd2hpY2gKdGhlIHZhcmlhZGljIG1hZ2ljIHVzZXMgdW5kZXIg
dGhlIGhvb2QuICBUaGUgZXJyb3IgbWVzc2FnZXMgdXBvbiBhCnByb2dyYW1tZXIgZXJyb3IgYXJl
IGEgYml0IGhhaXJ5LCBhcyBleHBlY3RlZCBvZiBtYWNyb3MsIGFuZCB0aGUKc3RhdGljX2Fzc2Vy
dCBpcyB0aGVyZSB0byBpbXByb3ZlIHRoZW0gYSBiaXQuCgpUaGUgZmluYWwgZ29hbCB3b3VsZCBi
ZSBhdm9pZCBjbG9iYmVyaW5nIHJlZ2lzdGVycyB0aGF0IGFyZSBub3QgdXNlZCBpbgp0aGUgZWNh
bGwsIGJ1dCB3ZSBmaXJzdCBoYXZlIHRvIGZpeCB0aGUgY29kZSBnZW5lcmF0aW9uIGFyb3VuZAp0
cmFjZXBvaW50cyBpZiBzYmlfZWNhbGwgaXMgZXhwZWN0ZWQgdG8gYmUgdXNlZCBpbiBwYXRocyB3
aGVyZQpwZXJmb3JtYW5jZSBpcyBjcml0aWNhbC4KClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1t
w6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5o
CmluZGV4IDM0MWU3NDIzOGFhMC4uYzYyZGI2MWJkMDE4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAg
LTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4
L2NwdW1hc2suaD4KICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+CisjaW5jbHVkZSA8bGlu
dXgvYnVpbGRfYnVnLmg+CiAKICNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCiBlbnVtIHNiaV9leHRf
aWQgewpAQCAtNDY1LDkgKzQ2Niw0MCBAQCBzdHJ1Y3Qgc2JpcmV0IF9fc2JpX2VjYWxsKHVuc2ln
bmVkIGxvbmcgYXJnMCwgdW5zaWduZWQgbG9uZyBhcmcxLAogCQkJICB1bnNpZ25lZCBsb25nIGFy
ZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKIAkJCSAgdW5zaWduZWQgbG9uZyBhcmc0LCB1bnNpZ25l
ZCBsb25nIGFyZzUsCiAJCQkgIGludCBmaWQsIGludCBleHQpOwotI2RlZmluZSBzYmlfZWNhbGwo
ZSwgZiwgYTAsIGExLCBhMiwgYTMsIGE0LCBhNSkJXAorCisjZGVmaW5lIHNiaV9lY2FsbDEoZSkg
XAorCQlfX3NiaV9lY2FsbCgwLCAwLCAwLCAwLCAwLCAwLCAwLCBlKQorI2RlZmluZSBzYmlfZWNh
bGwyKGUsIGYpIFwKKwkJX19zYmlfZWNhbGwoMCwgMCwgMCwgMCwgMCwgMCwgZiwgZSkKKyNkZWZp
bmUgc2JpX2VjYWxsMyhlLCBmLCBhMCkgXAorCQlfX3NiaV9lY2FsbChhMCwgMCwgMCwgMCwgMCwg
MCwgZiwgZSkKKyNkZWZpbmUgc2JpX2VjYWxsNChlLCBmLCBhMCwgYTEpIFwKKwkJX19zYmlfZWNh
bGwoYTAsIGExLCAwLCAwLCAwLCAwLCBmLCBlKQorI2RlZmluZSBzYmlfZWNhbGw1KGUsIGYsIGEw
LCBhMSwgYTIpIFwKKwkJX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgMCwgMCwgMCwgZiwgZSkKKyNk
ZWZpbmUgc2JpX2VjYWxsNihlLCBmLCBhMCwgYTEsIGEyLCBhMykgXAorCQlfX3NiaV9lY2FsbChh
MCwgYTEsIGEyLCBhMywgMCwgMCwgZiwgZSkKKyNkZWZpbmUgc2JpX2VjYWxsNyhlLCBmLCBhMCwg
YTEsIGEyLCBhMywgYTQpIFwKKwkJX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgYTMsIGE0LCAwLCBm
LCBlKQorI2RlZmluZSBzYmlfZWNhbGw4KGUsIGYsIGEwLCBhMSwgYTIsIGEzLCBhNCwgYTUpIFwK
IAkJX19zYmlfZWNhbGwoYTAsIGExLCBhMiwgYTMsIGE0LCBhNSwgZiwgZSkKIAorI2RlZmluZSBf
X3NiaV9jb3VudF9hcmdzX21hZ2ljKF8sIGEsIGIsIGMsIGQsIGUsIGYsIGcsIGgsIE4sIC4uLikg
TgorI2RlZmluZSBfX3NiaV9jb3VudF9hcmdzKC4uLikgXAorCV9fc2JpX2NvdW50X2FyZ3NfbWFn
aWMoXywgIyMgX19WQV9BUkdTX18sIDgsIDcsIDYsIDUsIDQsIDMsIDIsIDEsIDApCisjZGVmaW5l
IF9fc2JpX2NvdW50X2FyZ3MyKC4uLikgXAorCShzaXplb2YoKHVuc2lnbmVkIGxvbmdbXSl7MCwg
IyMgX19WQV9BUkdTX199KSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSAtIDEpCisjZGVmaW5lIF9f
c2JpX2NvbmNhdF9leHBhbmRlZChhLCBiKSBhICMjIGIKKyNkZWZpbmUgX19zYmlfY29uY2F0KG4p
IF9fc2JpX2NvbmNhdF9leHBhbmRlZChzYmlfZWNhbGwsIG4pCisKKy8qIHNiaV9lY2FsbCBzZWxl
Y3RzIHRoZSBhcHByb3ByaWF0ZSBzYmlfZWNhbGwxIHRvIHNiaV9lY2FsbDggKi8KKyNkZWZpbmUg
c2JpX2VjYWxsKC4uLikgIFwKKwkoeyBcCisJCXN0YXRpY19hc3NlcnQoX19zYmlfY291bnRfYXJn
czIoX19WQV9BUkdTX18pIDw9IDgpOyBcCisJCV9fc2JpX2NvbmNhdChfX3NiaV9jb3VudF9hcmdz
KF9fVkFfQVJHU19fKSkgXAorCQkJCShfX1ZBX0FSR1NfXyk7IFwKKwl9KQorCiAjaWZkZWYgQ09O
RklHX1JJU0NWX1NCSV9WMDEKIHZvaWQgc2JpX2NvbnNvbGVfcHV0Y2hhcihpbnQgY2gpOwogaW50
IHNiaV9jb25zb2xlX2dldGNoYXIodm9pZCk7Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
