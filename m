Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006C2C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93TdIt9wugNdVNdft5kgd91er1XcPpyjDY0QiaoCNRs=; b=RR16v80H5sVMYV
	zvtDMCbRqzv10UfPjAPvt/DmnzVs0l/wigBgIlrLT+EwLjKq8ZVauiFT9Gmg4Pk5fJZ76dXWk9GZZ
	MDrycG+uFGaNAtaGNOsQut2W8JhqutmV86iInnI2Zx4jIYzl1uHbwQTjUm8VblPcTcyxwS2qjibyI
	CGV6jd7AmXkOtomBRAvGUOkJDSHidI49Du7a4Hd4nxK1NZVb3GoozptUJPuUFgyWi3GXBZmaMBVmw
	PA95ji+u09R7gSUhZS8uk0tSnTLbZed0F2TnTkV373K2QuqlHc6bphVMLvP9NE/fnK6fUFDVYxEXt
	IThfVtPFrezIEJfSC95Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhacz-0000000F2Ll-3705;
	Tue, 05 Mar 2024 19:39:05 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhacw-0000000F2Jl-1JF9
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667539; bh=s7QEg+O5WzM5yI1q1lQPoUf0e90dpB5qxk5MpOdViLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a0eN4Z1F464NNYlpVZQYA0erX67EO3U0O7emmZkcjAOs804STDkEYbhmOjAubMx4c
	 yE6QXTm0oD5bwX7NYgpvnZ7XwZZNe4XWEFdb8wDhh9lU5TQf+rpHqVJ2kssl0S+jnv
	 otFj2WLHtqg/SzDIpuNsXLjg7d9C6AWLRP2+r/RU=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 9B6B9246; Wed, 06 Mar 2024 03:38:54 +0800
X-QQ-mid: xmsmtpt1709667534tisam2ey1
Message-ID: <tencent_26733B06E132C458857C36DEF36D084A6A0A@qq.com>
X-QQ-XMAILINFO: MzYTHVlhOHw46e2TkC7qVkPzMgL4jX430nJ1+2Gjuib8LMue9tVIUqSONU3BEf
	 0D3sDJimpcCwy8rewM8t4KRqyQFZnVsJk8SIrkrkxBI0+l57D4WYCi/Rjuq6QQ4b7LRG+bwEUBwv
	 OTtjwFqG+zyghjtrmSrZRf24/CxN0bwLnXN6GlgccpPZKKkZkUpSaiONdmkbOZ3Df+tLBfXswJHG
	 d9Nyk78jX2Lql+XZMGYmlxNMf7qJarLoNZev4bgyYxCvoBpt7UR6JQp8H2jJKeLT58rCho/Qmv0H
	 Lap48crf7yQUXtCx+VxWeZNs+eXDG75bclMZbYMhMCqtn3k9jj2E4zxSEkEixs3opFt9E6hYoFrY
	 e23606Uuuv3CV1JVmB7hH/iO8ZoJZLQHXICZntGVVkn9cVCpYTGa5o6N+fFfC0Mtmg9wrqhgHHnq
	 iRzG3fX5rBbDDdACZyJQyNMwo/hSQmwv9S4v/KMudB7WykXxmsc77xNYg6w+If091QDuAjGIatXe
	 3crJ789f1w3zNiHeGmjeFsTQ/Y8Bn/HldmgQJX75zyn7Yg4S43RGvekzZyptxv0v1Dkta7Gt2bg4
	 0ZwsW1cltGpaoxyhdjXRyjQs+tkkaxHSBW+pDGhWBC3lObRFEAIHMzbQfNE1mC1XS9L+12pDdJim
	 gt5j4DpbHVuFYHqgGtLcECDwkxsOuFpdNaY4FKgVefPA5yacBGY+wFgMkGz6HuhkYywlYuJ6ao84
	 aR8dvBvFlK/tje1jDLvAIIC3/K0GI+WZ6+tGbJL+RHkCV89vNTtyTmup/dCIo2nIQrVUlGTsnFNP
	 Ww5Oht6EgoNavnGmZb6AQgwPHiktsQyAM6drdFbAlPePL1hf++P7i3pl3xDearFm+5IlPnpJ7YRU
	 /xsYlouoEnUUsSYqKdOakLOFo/F0NeJPaDfIeF6k611ww8w9YLEjaYcSoTtyKsbP1mgC20PEymCp
	 IWOa6Xp1+hS4VmbpHzmQkh8HcMXF/xpG1gXndotTXb0b+UnhuddPPRYiNkdcVSIM/MiKVGSJ1oNa
	 ehVGYY8VuRFy9FRoyk
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
Date: Wed,  6 Mar 2024 03:38:25 +0800
X-OQ-MSGID: <20240305193831.1084556-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113902_705833_79123831 
X-CRM114-Status: UNSURE (   7.02  )
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

The thead,c908 is a RISC-V CPU core from T-HEAD Semiconductor which used
in Canaan Kendryte K230 SoC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 9d8670c00e3b..e853a7fcee8a 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -47,6 +47,7 @@ properties:
               - sifive,u74
               - sifive,u74-mc
               - thead,c906
+              - thead,c908
               - thead,c910
               - thead,c920
           - const: riscv
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
