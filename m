Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E62BC2BA15
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrtZyaaiZQdDgDPQ/1KAtJ8BULoSrVtVZAlUtuLG2qY=; b=mEYNOMiSl243co
	Js11GNqniWzBHCU0GIBmLqyC9XXXM/B17sxJirrP0rRfZlEMD6ftb9Ov07tHjQpcc7WszElauIy4e
	GJLo2v11hc73cbNztiTJUoSK6+1yDapFcXLO6bJHdfVQ1n/cBu1yacSMjKGcTPp3htoQjDP9SYgfi
	+8rXKNKAw0oCPwVg9xKA/DquJUm+OUxHGZdW3Oa9GFS2E08988isWEBAp7eHwBQg+Rb+f/0iPSOBt
	79Bbj4EPyIEQVgeUfTdAgY9DjG5157TaZ2J+AqYNWyTQNcm1E0QxKLZDcyz6aGB0oAbfXKJJIs4iu
	spctxqLRauACNJRXeHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZH-00000007y2P-3OP1;
	Sun, 16 Jun 2024 17:21:27 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZA-00000007xtr-0cZc
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558468; bh=rHBnmN7B3Rsy6U0sdX6GONr0sHeg0xxsndGVLxSaSz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=reYC1Q4TxC+bMuVQwT2iJpnKQLRX15ozurPWqHGMXnXoZ5Jer6yf4fPe6wunhunhe
	 8fDvSlAxkJH/HxaM5AK/6IBilPC7YAn6tTTShBiJTBftfFbA/wtEPap/Fct+VVS3+3
	 12rcKDm67wUCLsbtVHAPvfa+QKv8v4hlGZqw7f1I=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558465thebog8nn
Message-ID: <tencent_24CA6BAF3BB2E3A6C490854834FAF2E1080A@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTkApgb/ZmacDt+n2nnKZ5gONX++ZB/fMyIH4nOmO36lm9btTCFA
	 +AP1KeGstFEFJptBLGJCqOWDHeHuRKMVyK2PfACMfb4o5X0hY6w0JENfj0SBjf8+loGngpmsRTIz
	 X5lN3l/pxo4QsWsTW008mcyGhV4fNhRcCVRzNi22sKpceajR73nAEpR0kJJldJke+EtzVRvmbzAU
	 0a+S8yqeIruRemjB5ahJFyfkGqSHTmLq/5ZAVJ2drS9WDRJDoxAaWUPBxwjcA8++MbLPg6yOU4F9
	 oycOPMzsa0W0Yd/h47UlIw0NsdsNgi0t9ECZeH7NgVv/s1/VZadyZTbZbCaU4U96X6Js13AOgp0y
	 mfuuV+fY9SGDP30Fae+SQSBdYhJLTAWlhglPgGRV2wLaPXLjULgNo/KLbCThT3Z1mDRNglnGljsa
	 GcFkb9t7psh/4d/wjoeoRclrrlx4oqFpAsAs2XLB4tDdZM86BryxrkVEja/zWkMrS0bItg8kJEXg
	 r7Ip3Mwjz1dcNeVH7jAl0zb1OhUCPWoxpl6uryn3x/NtZKRFqc/0LkHpADJOEmE50xHONxvd8ypT
	 Z5+FvUuihJQCk5fLqt9HU4UmIVrKuGhDMEyq3oriKqaPk5g0jShbyPQ7JlnUgTu6U0GEurxCMzmf
	 fl1ePeiTtiAYsCEyb/rdbz6baPvU8Y7+h4C3XQUlQ5WJI6fvH1SGzV97vYEWNkOj8x/3PXDxyabi
	 bSfZQvwC9cNMl7rO5pZhvGDHHU9PzEXbX5dY99hXtXpANwY5I/i7srJv4GQDFRwdXEYTYpEwj0NL
	 SAlfYIj2kTt9xKMZh1mThW5CntyNzHJPEbiPgQGnDLMnCkp3DEGl/BMaejt3y1DmeLFQk5JyexaH
	 bXai4hocnVon6iwSgA7fq93ZBIJj+/DoWvn36W90PlEwnrV+T6knezK0Pnrl3JI+pZMHLaAfkphR
	 ZHT2RwKNKIBax3q+ARP+jOOUY3BicMw8MiV/2S6HKTDsedzrlE0QK3GVG1+2BzWoLbSM8UYRVk9z
	 rcBAO58Vp1HHE0Pci65CsqeEGtH6g=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 1/9] dt-bindings: vendor-prefixes: add spacemit
Date: Mon, 17 Jun 2024 01:20:46 +0800
X-OQ-MSGID: <20240616172054.3074948-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102121_263457_5F32D5D6 
X-CRM114-Status: UNSURE (   6.71  )
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

Add new vendor strings to dt bindings for SpacemiT K1 SoC.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..7ee6e4a89376 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1362,6 +1362,8 @@ patternProperties:
     description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
+  "^spacemit,.*":
+    description: SpacemiT (Hangzhou) Technology Co. Ltd
   "^spansion,.*":
     description: Spansion Inc.
   "^sparkfun,.*":
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
