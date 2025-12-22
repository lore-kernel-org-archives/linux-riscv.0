Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518DE674AD
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV3lIZntz5kvEk0ICjhTL97kXT9aQTRy5w9Uecw6NPQ=; b=SI6FKh/mKz/IUm
	mqn/ER8g13Yw/etdx3qmCEn6lfOpZ32Q/pBNg9R+AwqVVf01oU8VRBLyHzW07bKWIxJhyLnWHyTQC
	+rjuzOp2LjRjxaV8wiu/SC6n3FDzVRnJ7NLjH5HfBnhdwWI71Oyo/BNiEeRbWZjDrwTpplu6tnN8y
	N2Uxg1sURdsRyfKz4J7cxaf+djYNWvUYtOaLr/6SSqmGsFAuGG03IXqKfThD6nyeKqkGQpJHZOVQY
	CETusE9tdTdNkbJm3YJTV30gOUUmZBpHQtN3A4l6Sni+5qvYzaXwxWaaS7RmP9+77tmKul0GGDDR1
	/8OyUxqWCr6h4qv6dFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcT-0000000Dm7e-3NL9;
	Mon, 22 Dec 2025 13:06:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfcR-0000000Dm79-13Oq
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 13:06:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso2619672a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 05:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408794; x=1767013594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgdTFHMTCMlAmy2Oru9A0Zg9E+ZEm3hyo7Svl62/2oA=;
        b=Qs6/nvacJs0mcYee3JTv/URXzeQ78nCn6QzTJVM8XJVzJnKs7tbHIdl2vzws/C2sd0
         UJs5Kibrh5OVmw7OxN2oV88bN+wBLoqXE2tMs+oInVbns/MdtSijkW+q29BREHzbB9Mo
         2nzD9fNcMXrdzwjGZA+HAB8+GpVY9V8EzpOH7zcT3h3A+BiKwim7er9NE9gJA1jmAQt8
         AAzW7iqvP4SQtwo8AX4yw6fzc6Ey73K2aL2czwN9n0OwZwjcfXWSwprTvAW5QBauPLv3
         dgBHaFJFpaKPZUpiFlqsOIjJ3EG3AXvZw5ID8CkalKf1V9XO1/wBj0jzvuY6ccpsOLdJ
         +i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408794; x=1767013594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgdTFHMTCMlAmy2Oru9A0Zg9E+ZEm3hyo7Svl62/2oA=;
        b=wzuRl4RHK2T1eaOsSOJSMFeJEikb0olP3rVCLtMlKPPpAoDd39Qrxk+pf7v2SNDe2x
         0CRyP+b8OPmdm9tGmvMVChq+b5y9qUk7f/1Hq3OLKbzzOOY8eDR2mtk1EkgmCvLsQ3EI
         x8TNgbcQ/JbzWVKGickP2idiEI40QktmViNB9HUmjQTBrmHPIYXF9SquBRlZP4kzbfNV
         EYVo3ndQrfmvu6Ry2a5Fygu649BKRLTeEjfQY5T4rOEuyRpU9/AxdrWru8QbXyldoNOC
         LVIxrmY0tty3sYvQDtSdCIaxQ/caiVG58TITiFF0f9GTkSlirCEyZhJkPH1vdaB+fBG1
         cg/A==
X-Forwarded-Encrypted: i=1; AJvYcCXA5CsVuNdY1SekfAlbfvwdjq7LMfzpJqLK1eUme9IpL6EJt53unQZdMJgpuGeZVCXQbBAQyDJyxgBRIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHR5Y6areNyksAYim6JKoZhYEauFiF6eQUrM4slSq9l9y36RiN
	84/01RwqZ3M8zZN4a19yAequ6/PeQ7D1t9+Kdl4DafShM4kXx/naCulELY/g6JUDEa8TXWv8vAT
	owxG0vmo=
X-Gm-Gg: AY/fxX7J+wFeRpyTjq0T7kXcwSG1R3C1on87GGRLheJ7/1LwoeJX3WGREEawMscxlDN
	YHLowq1fPbDJ1olqRJJTpp3r0JBpEgQvheI2BkpYIJ5HV5673LoliqkB62LWXHKdO4jQh2tMSDW
	IU0ZuhZikpCdh657qMtUJPtR7pjhNITRgfbD+A3cBwb2lyxmPOpX12nPibZZGW4U4frDUe60h9B
	BeCq90ZRnTLf2MTC8xeQnZl2dDr2xW/HrLZW8G1kBe7uB2tUPiHaUHR+e92GI/O86JWkdFLGorJ
	qJxtvWyHbxJ44gLG1xekUoUdAv9el/ohJD2D+ePCp+hk7SGay37RVuYMWUY36VAaeCw1lsQ4jW6
	0FssdmuATGTE5juoPQT4ae0+xyKcoHSHl4eV4i3+7XHXyhlOj2qubeBoLfRLYOZdpRNm1aXLPss
	38N905wKLKcKcNEEGPpvJvz5i6GfOYHWOuhmvRBZtuiA==
X-Google-Smtp-Source: AGHT+IHxNgi+B0C4X0RL24+gScZYcxvnEH5vGDKHG//0EVTSEFa006bU6P/YkBj5P6dINmSvw+3QjA==
X-Received: by 2002:a17:90b:1dc6:b0:33b:b020:5968 with SMTP id 98e67ed59e1d1-34e921be2a1mr9160833a91.21.1766408794105;
        Mon, 22 Dec 2025 05:06:34 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:06:33 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:12 +0800
Subject: [PATCH v2 02/13] dt-bindings: timer: add SpacemiT K3 CLINT
MIME-Version: 1.0
Message-Id: <20251222-k3-basic-dt-v2-2-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050635_526536_36AD5DEC 
X-CRM114-Status: UNSURE (   7.76  )
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

Add compatible string for SpacemiT K3 CLINT.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add Conor's Acked-by.
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 0d3b8dc362ba7e8d0ca6d0cea692ceddc5e1f89e..3bab40500df9bc2ba4f7d6f1bf340c8cbc06f9de 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -33,6 +33,7 @@ properties:
               - eswin,eic7700-clint     # ESWIN EIC7700
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
+              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
