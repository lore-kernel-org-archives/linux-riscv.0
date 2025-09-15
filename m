Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04458CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tQqpRFybG191J/M3Rp1SQcCxcj/mcm4jr5g83abhtm4=; b=e1i9lXHVGjrJjT
	4D0DyDB2BBPbC1z4N3UjTNCmjLSVkGdo3UYp680LAg9S6LfZN5EBN3KW6h1QCOT09u8ImHgn0B4DR
	FP7nIniu6vrHIX7+9QkUmtvD1Je2M4ungJhgOtayJlk6yehhCojzU6PV+1NC/c4fmhlg/HJ7hhdAx
	NATAuIUeRWMfFljGcPRYSMUjeooWS7/1uX2wFdKiVOxakfhnuaaz8ZBY4fptE4D40LGEHEQz+ie6G
	qzH1xYhHx+j6z2vWXkBYo+rONw93CyqKkwHAIAoYMEPGvru5rpZEAdGmS5+yhtXp5OSMPRUuCLvlY
	eJIVTLPSTvHBcUEjeToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAGl-00000004iW8-1sjx;
	Mon, 15 Sep 2025 14:33:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAGi-00000004iUX-3fkP
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 14:33:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45dec026c78so44447055e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757946803; x=1758551603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHPRcShdCxFpSO6mT7vMAVpPVug6VS2Oq2S7HGINRxQ=;
        b=CAjyO4Vyc6gX8HSIDyT8fYU9pyMCZ0LxnDt9FjBE5YAlZfivklkxAURCBWWV/FeNXS
         5e8AzRutCuLT9MSf0w+3CyaPVvdSyuzFy3/IcL68L59GUl6LSGuBvVS9pZHuL55kOyCr
         rgk+IXi5Yx6CvNNl2mluiX+T+GZB631om3JC603unR4Q2KClHpz0dj4YLEF6nPY/sKQU
         eH1L4cs3LsGfN79IGeFp/C1vMPQiBiCTc9GFTw9SC0fy/YDFurFafgp8SAbQw4Xp3Tzc
         xJXO7YYFDQLpMY0uTvV4qfzI8hA6njBxgpqVt82zLLscgeojcLCoJ13malbQPP78W3bt
         Nzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946803; x=1758551603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHPRcShdCxFpSO6mT7vMAVpPVug6VS2Oq2S7HGINRxQ=;
        b=NrN7moUWAwly3L622gE8UNZUnFIzyFmR0PCCCljNr0ccUeSJVjdeQNMdWecwG5fo+i
         xvob3OK+AjirP5O4CaS3OZ/8hxcxDJQ6fdFu/YARIL4Okh0bnZnvekg8K14QbCJLiNIM
         PGLo+X8CC44CS37HErKWJ/tYjfRUHUQn2u1P8IYJlTxJwaQGzzTzGYW/rm0tbKMjjKdx
         5a+XTUKUdcTr7TuvMgNehyZ5UD5XTaJvwt814LaiP/L0eHIzGFicIFTRvYCoxTjs+bi2
         MeN19h44ROyFA2nrcREDoR+JBv9+XnyWZTvBufCGQFJSRm8MOgx9TgqYfYpMXV7UDQE3
         ir/Q==
X-Gm-Message-State: AOJu0Yxa77mek1Y0oiKpAAFon3Dse+0qm8yFBrLr3FEc2CH11Iyq/WRM
	HEJfHNxgF6OizhkkG5WhoR7KAZJ9cZl0QKAiikKUvl2q+/XZsMT7c8vN0SoSLq3E
X-Gm-Gg: ASbGncsapDT5yCNtC51UJi2aXCZf7jq6CwcH3aS53VIKOSASO2O/o2VYseQQ6ZQSvaO
	Rl+dRkVoN0/jyHGXQyJe+UtW2rLvfaLbx9SYf0blts/ipFH/Xy61oAWEpYoGY8g/WXw2C1Ecwwy
	Sxc04NG/+5JmcSVXID/MJx3DEbqbNb9Xfdd2jxCyISFY2ps6LdWppWIxyVhM6Bs3i0SwLG8WLvv
	XAbH9r321GPGggXnuhsyIl6k9PuCkSsmRWGsEg8UcPop9Ude+7x/NPwqRTiGOtd7T+53RVvl0QP
	ZPyHcZ2RYzVYvtN8PFQYLKC/zu45CNH0ARRyz8FiVnzLPFkrmVGm8xUyJvuvVhwXiCqQkLyUB6/
	35HXK9tJceg2/6P1NlwyS8eL1OIfMH6gElebqhKtT7Hs=
X-Google-Smtp-Source: AGHT+IEn5Sa4Xov8t4lAKQk2pYBCXtbAYBUAtDz70s4kq9Ua1d/xAlyfDPwz+0nOS9FKdWS0cCrzdg==
X-Received: by 2002:a05:600c:8b4b:b0:45f:27fb:8017 with SMTP id 5b1f17b1804b1-45f284e67cdmr74363105e9.5.1757946802462;
        Mon, 15 Sep 2025 07:33:22 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037c3cbdsm195493545e9.17.2025.09.15.07.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:33:22 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	wangyuli@uniontech.com,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH] riscv: kgdb: Ensure that BUFMAX > NUMREGBYTES
Date: Mon, 15 Sep 2025 16:32:52 +0200
Message-ID: <20250915143252.154955-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073324_946010_F1B0683A 
X-CRM114-Status: GOOD (  10.89  )
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

VGhlIGN1cnJlbnQgdmFsdWUgb2YgQlVGTUFYIGlzIHNpbWlsYXIgYXMgaW4gb3RoZXIgYXJjaGl0
ZWN0dXJlcywgYnV0IGFzCnBlciBkb2N1bWVudGF0aW9uIG9uIEtHREIgKHNlZQonRG9jdW1lbnRh
dGlvbi9wcm9jZXNzL2RlYnVnZ2luZy9rZ2RiLnJzdCcpLCBCVUZNQVggaGFzIHRvIGJlIGxhcmdl
cgp0aGFuIE5VTVJFR0JZVEVTLgoKU29tZSBOVU1SRUdCWVRFUyBhcmNoaXRlY3R1cmVzIChlLmcu
IHBvd2VycGMgb3IgaGV4YWdvbikgYWN0dWFsbHkgZGVmaW5lCkJVRk1BWCBpbiByZWxhdGlvbiB0
byBOVU1SRUdCWVRFUywgYW5kIHRodXMgdGhpcyBjb25kaXRpb24gaXMgYWx3YXlzCmd1YXJhbnRl
ZWQuIFNpbmNlIDIwNDggaXMgYSB2YWx1ZSB0aGF0IGlzIGdlbmVyYWxseSBhY2NlcHRlZCBvbiBh
bGwKYXJjaGl0ZWN0dXJlcywgYW5kIHRoYXQgaXMgbGFyZ2VyIHRoYW4gdGhlIGN1cnJlbnQgdmFs
dWUgb2YgTlVNUkVHQllURVMsCndlIGNhbiBrZWVwIHRoaXMgdmFsdWUgaW4gYXJjaC9yaXNjdiwg
YnV0IHdlIGNhbiBhdCBsZWFzdCBhZGQgYW4KJ3N0YXRpY19hc3NlcnQnIGFzIGFuIGV4dHJhIG1l
YXN1cmUganVzdCBpbiBjYXNlIE5VTVJFR0JZVEVTIGNoYW5nZXMgaW4KdGhlIGZ1dHVyZSBmb3Ig
c29tZSB1bmZvcnNlZW4gcmVhc29uLgoKU2lnbmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kgU29s
w6AgPG1pa2lzYWJhdGVAZ21haWwuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va2dk
Yi5oIHwgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZ2RiLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tnZGIuaAppbmRleCBjYzExYzQ1NDRjZmYuLjY2ZmY0NmU0
MzRmYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZ2RiLmgKKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rZ2RiLmgKQEAgLTMsMTQgKzMsMTggQEAKICNpZm5kZWYgX19B
U01fS0dEQl9IXwogI2RlZmluZSBfX0FTTV9LR0RCX0hfCiAKKyNpbmNsdWRlIDxsaW51eC9idWls
ZF9idWcuaD4KKwogI2lmZGVmIF9fS0VSTkVMX18KIAogI2RlZmluZSBHREJfU0laRU9GX1JFRyBz
aXplb2YodW5zaWduZWQgbG9uZykKIAotI2RlZmluZSBEQkdfTUFYX1JFR19OVU0gKDM2KQotI2Rl
ZmluZSBOVU1SRUdCWVRFUyAoKERCR19NQVhfUkVHX05VTSkgKiBHREJfU0laRU9GX1JFRykKKyNk
ZWZpbmUgREJHX01BWF9SRUdfTlVNIDM2CisjZGVmaW5lIE5VTVJFR0JZVEVTIChEQkdfTUFYX1JF
R19OVU0gKiBHREJfU0laRU9GX1JFRykKICNkZWZpbmUgQ0FDSEVfRkxVU0hfSVNfU0FGRSAgICAg
MQogI2RlZmluZSBCVUZNQVggICAgICAgICAgICAgICAgICAyMDQ4CitzdGF0aWNfYXNzZXJ0KEJV
Rk1BWCA+IE5VTVJFR0JZVEVTLAorCSAgICAgICJBcyBwZXIgS0dEQiBkb2N1bWVudGF0aW9uLCBC
VUZNQVggbXVzdCBiZSBsYXJnZXIgdGhhbiBOVU1SRUdCWVRFUyIpOwogI2lmZGVmIENPTkZJR19S
SVNDVl9JU0FfQwogI2RlZmluZSBCUkVBS19JTlNUUl9TSVpFCTIKICNlbHNlCkBAIC05Nyw2ICsx
MDEsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBrZ2RiX2NvbXBpbGVkX2JyZWFrOwogI2RlZmlu
ZSBEQkdfUkVHX1NUQVRVU19PRkYgMzMKICNkZWZpbmUgREJHX1JFR19CQURBRERSX09GRiAzNAog
I2RlZmluZSBEQkdfUkVHX0NBVVNFX09GRiAzNQorLyogTk9URTogaW5jcmVhc2UgREJHX01BWF9S
RUdfTlVNIGlmIHlvdSBhZGQgbW9yZSB2YWx1ZXMgaGVyZS4gKi8KIAogZXh0ZXJuIGNvbnN0IGNo
YXIgcmlzY3ZfZ2RiX3N0dWJfZmVhdHVyZVs2NF07CiAKLS0gCjIuNTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
