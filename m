Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302DBC982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DJd3Wk5joM0hiNDkXneLmwpzJxhJUin9bJzIGCBYz0c=; b=VvffiTTOas9CY+
	UVn0N0gBJmPBnOInacgL+RsFJUalBWqaCxWpVBTZLO46jyWkF8HB/3cQZLh6FvjWyb6cHYYeWMkJT
	K1Zq2ZfTAydiWADsLa8mdZu61YX1v0AKKrjlO0dasYKfGAZ09AuwucONjhDMCD5wFrN2n3POVxNiE
	EkmXuacZAfv2UoBBLe8Q9kBmByWVKRHJDn0r7QRJAHGpKKxbh1Tjy1Jet4kETPNQ9CuCGClAgjhx1
	C4CJWAOinuaJaXKSGAJKvrrfgjfiPGsfUMyniv+y3WE/MD1D/Ts7RDMinB9xTR5/zR4DXcrMhVHI8
	TSFJqQrjMQA70i6QTiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8feF-00000002YdY-0utK;
	Mon, 21 Sep 2026 15:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8feB-00000002Yc2-1og5
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=; b=b/s4stpFMjUrkvoV6iaP+B0Jkl
	0TJjBYKUdccf3HNYqTNc5sb9hTsYNaB7qIjBir+dSk+1BmEe4GgCjQvH9qBFDTjc1u+CKFOR02YvU
	lqLkXt9eT/6gSvzQ5Ogm4EB4vGt1kdMvpxt2fQ5Yx6zybqq8trfoa/1MVQ38I2xiiGenHz/EjhRYL
	SYfP7AH8zAF83xeqHdiB/HPLqMCr7n47rNJ4cF6FLmPakuaTA0+szyguMrxudKSjBpCfuJheMi30c
	hYSCTrAMNYdbMxzNO7ZLbeNVM2AfD+jZXPk54p9nvB21P3+Ikqm2yHD1/nSb6481xfgRO4rYgYHy2
	xye/iVsA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fdx-0000000CS9l-40vX
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 15:09:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso22831495e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=YLWG7kMlxVr/rKjJ4dQT04sy3R5PAA3o3EapZy3roj1Jf8aAPZQgNtNAAX/nyPdM2/
         7TkQfQ/FGKJy/d5gxzFZYEl1DBh1BmEr1u9QT7/AfS3z5pAM/KsuzVof9Qao6oemw1l9
         rBx0dd70zcSK4dXHHwj2VfTX5PHor9qdww4bcThD7gELX/8cbVbpyWRpOjqPQYslePin
         ePMOCGfDnTWr0V0zUZJkAVxIA69nSyY9WUrhRSGtIEgSll95fKOM7FfxoLDebKAd3n2S
         YPL4DIfh8as0uVEyJByBAzCaQTqstR1ryY2zFqCdRZxVpQbF5lMjIiqJAn6jCOOUUFu3
         MAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=qLv0g0Ue62ih0T0bkJ4URF/BnwmRsqZFm3ablgCfF/qtXu4VCqYQL1lwHKrKb3PDlk
         k4UiNmNEGQsaUUmNYe1WrFsFX3W4Fx/EGpv6hq9+JyMW09AkvLYopt72K+Y0s/olhMjK
         Yi2jEvOtoLqcaavQiBdb7N2x/J0LSYuqfu3ydr/5dhk8R2PxJglS3ItnDMN5BujPLup3
         gXCm2e73YROp8x5fxjI+cWKNvmmsnLRyHmVMBS74wynivfVLl0aMAsnmxsdbga8xqpxa
         O2YmdIWtwXbz+4DHLjoxi0EV3KKAJ2trsPO6Zze7DnrQIHfKRYtUBJpd2GcgI3aSVTqi
         ItQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTVgyKkzo4ixVguH5KXZsrqb0nMjPKfsW0HxYgeLWbUMZFTs6whwFTwBO8Lbfwe9AMHZfE8PC3KSghkg==@lists.infradead.org
X-Gm-Message-State: AFuF++mlrpURjqOTYaoaV4HmG2o06x7vvWujWag9sgauYGCGZ7LMjCSh
	HG3Ji9ObiTw0Ckw08/eOyRLDuDv9TsEC+NgOZ8c+6vVscffFOAuMayJC
X-Gm-Gg: AYBFou3iaAryOV0b3+a1Ut9rULNLCniAKDgbcUZPXJmpblEdzMOpp37qL4ORu73uaSB
	ZUDFIHMk1I/ehIc+TJ8WZ+yqxqE7z5M2OT4c2zodnbO9bGLHDPx+yTvHDKxwOjfQofgtQtR3hhR
	IgF+gJKR6LA3ghVpPGDAhNqvKX35IarXGRE+z0zlIz0dEdYigflMzY8uhbd6kN/5Wg1kfZx+LGn
	PiyakCW/ISlY7o5jRYw7PVQytcnE65zQDnvtYxkiew9BLMXqGJFujIeH4+eJIa/qsa317hdSUkR
	s6EsgNv86rBTKJBk9l7t5L4GTg4UiEkrM+Wh4U+wMVao7wNrF5/HCuFDdUmxlODDmYNJF65eleE
	MscPBeH1GFwVBIxbTtGkL4MFXrj0KoeHO5NEiWThXQjyShjM/htpu4KF2YQS8y4lE9tmr0Gj1BK
	0pazmjfSVbCKYJANh21VClEfwS1T/6XqJJi5tekBjAVVLgss0sqbQTllioeu6E4Nd7LZOxw7Yx2
	GQbG8IEGWx9Us4mu0Z5BbGvCx7hG8dTq0MiHExw6ub+KvxVwFhi9vYzfIRcdZMzc8V+6Zw86y3P
	8PQ3GCIqVCghJ+Srbg==
X-Received: by 2002:a05:600c:4691:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fc572f297mr139363745e9.22.1790003356583;
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Mon, 21 Sep 2026 17:08:58 +0200
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBG4auQWTsJNEDEqxgX0P5CTew0M0pIC
 He36vLbvLeTQSOMLtVOijValFTQnCryy5hmcAzF5GrX14Nr2CQvs7DiKSvYS1bxMBPlJAHcovf
 dME7dOTgqkay4x+03uN7+tvf0gH99q3QcHwa5uTWCAAAA
X-Change-ID: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=1759;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=hf5kjbI81u8GhWKWua09PR9zzZ8Qo0DwQU4NZxqtTl0=;
 b=GWyRcQp1oB8Sh4EZuyzCScn2OIWBgOKi080vPgH/ZvEmbEh78yfsQHts+sQRZUH9qqncxyCcU
 SRwo1HzBuu3AZg9vJqEr7ZCrzi3yECFcHcvQk3vfnM+Il1FVWF7qKSA
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_160931_023807_E23A82F0 
X-CRM114-Status: UNSURE (   7.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
the end of RAM. It is not correct because:
  - FSBL can be configured to load FW into a different region
  - if no firmware is loaded, the reserved memory is wasted

As explained in [1, 2], FSBL should reserve the region at runtime.

The latest FSBL can boot the system without coprocessor FW:
  FSBL Jb2829:g6f8962c394dd-dirty:2026-09-20T13:04:17+00:00
  st_on_reason=d0000
  st_off_reason=0
  P2S/0x1000/0xc00fa00.
  SD/0xaa00/0x1000/0x1000/0.P2E.
  cv181x DDR init.
  ddr_param[0]=0x0.
  pkg_type=5
  D1_3_2
  DDR3-2G-QFN
  Data rate=1866.
  DDR BIST PASS
  PLLS.
  PLLE.
  C2S/0x0/0x0/0x0.
  No C906L image.
  MS/0xba00/0x80000000/0x43e00.
  SD/0xba00/0x43e00/0x43e00/0.ME.
  L2/0x4f800.
  SD/0x4f800/0x200/0x200/0.L2/0x33334c42/0xcafe4b49/0x80200000/0x8c200/0x8c200
  SD/0x4f800/0x8c200/0x8c200/0.sys_switch_all_to_pll...
  Loader_2nd loaded.
  Use internal 32k

So it is safe to remove `coprocessor_rtos` nodes.

[1]: https://lore.kernel.org/sophgo/6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com/
[2]: https://lore.kernel.org/sophgo/aqrhRic7Ww6fPhxg@pie/

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
Andrei Lalaev (2):
      riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts    | 11 -----------
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 2 files changed, 22 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
