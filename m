Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE9FC77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MG5qo8bR5i7BzkON8WMeqv3NAGVpuZ9Q9vpIZetR0U8=; b=KmRqhLkcVaZIll
	fu3NY2ZnOGMbGNC3sWI6Z370sNHmAzQYKdz5eRIWi8gwyL9ojUlSJMpY6fBq1tpDK3b20morGOZx8
	ThweYpQJ8Em/iwLp7swHGpogG1lWU/c49ei/7LmrqrypLTMcLNVZdl7JcQP3vuqBrBjjsJB4Ljrnl
	n3saR9a9LhkiXHTyoI57lsAlPaYqlCJQ16evUHeTx3k2VfjOtoAzzIjtFtjkUWKehJaWHaPBHOCwm
	reFx/VaBK77/8lHs0VIw8j/erffFlv3FnWDuznJiaeIfDR5PPOTgtLZxxvzrugP16RGrbXLqo+8CW
	ZLw3W06lB6C61WooI1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prHM8-0011PV-3A;
	Tue, 25 Apr 2023 12:01:12 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prHM3-0011NK-1r
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682424054; bh=OeX6bTfHS7YjQJvgjacvyKTm+MYbGdePsyXS8b55GiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W/uMToHjoWTq+S8KWLpcDVmXxpUx8OZPGjoa2bM74Pr+wC2wluvOQYxt8jEJNHhrL
	 N3oNgYvQjEK3iUlshYeApl1+tLJQsRITGNGDLI3Mo4+mpPYBRu3cQfNcRER+UcSfId
	 f8PfHXwkvp7SAKgnQLWOHffHLGV36RMBTC0ZV4gc=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1235043; Tue, 25 Apr 2023 20:00:18 +0800
X-QQ-mid: xmsmtpt1682424051t5lzrfxv1
Message-ID: <tencent_221A82C2DAF38E66B85B313221958DDD7C08@qq.com>
X-QQ-XMAILINFO: N26DAMVpW7UEZnYL96Eax0p2AeaZ3/jEZXdfEMMeE5rXdCWf6VQn3cYPuSB6ss
	 X0lh3+ZWgYoAaOmfq6z35ehtSg1AcI06qR/UdFtYoM2yM3fupgPW2DuFVF56tsVCdaBIN8g3oSb9
	 bY7FfIiht2N4/eTzf3ekprzp4iz87Va9l/jcKOsTpJAvbNK8gcw0n+3wVZLYxbLoYHOBpoCwQUc3
	 MT8j3BWTCSYINrjcbgSxQjEfD1rb8mhS8986pRzfCAOCakgKtYxJSxaSIwYGjrxNS7MpV5jbvEID
	 bUWU1EIcwEQPApOH2eUmFdMIl7ywAcrUuQqfcTT9XdRx3DgEzhtM9sDLSjhAHIRw2sJkloSJlh8U
	 d/5V0nz5DsUnuAhpmC6aiKTD1xitYR6sqJD3Y/dABeIhO3t2BNgc+wBN0huOcbp7zZEG0m/Lwc/4
	 oXriEDT583dCdUuo9pGjlr/5XB8aQSRAbhs1KR632H2ncLrYniMU1LTierxSPERUsS6FkUepru1V
	 vczAoJTpPzJma+jpR24SVrX1vkdOyyBZ4ugkEKRO3o2XSg6ex3/hQW37bs3brFf17YaVA/5SnauL
	 wWYJZdLkRTfi5olnHFN/RoAM17od7FjiXSwdmp8sFASBls2zEXCWBUkYkPVx3MgwJGSW20wQU2+y
	 lVWKuG7PcaYF+3S+zl2G7mKZ4+9kjuungsTHx3y3MohtYI+WmzOY0ZcCuoNZgf2E0To+Jnhzjn6Y
	 3mWhcI8nqy2+YwoJeKr7Yz1OyNhhHjMOr6vLXXbEoDPSC+ojhfiYXqe/j6k8yqt991ZuqAqhzVPQ
	 fI63xH5+yDJ/MGGNa/sce4LmPxxrcRaAe3G4HBIF72qR1sXlSDsRczFvDYe7F6zj7GtjnkEsuFIb
	 vkpxEytNWn8MwTrxAh1eGbcATcZHBK+E/idnXb43USYKszCgfZEhRD/PztDvoIRIJ8zWM2ynlpCS
	 TznHsw40zXoDs76u2W4nlRMUG12C2xEZCsobqKtaIXnyRisWa2ou0/uQsgh6LWMw800RjBRKrjda
	 V89zuGy3Wer0h+/jY2JEJv+zKv+vJVheO+/NnSf3sjNThlW4iUJI28JYjKtRqKg7g9ZrIcmg==
From: Yangyu Chen <cyy@cyyself.name>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 2/2] docs: dt: allow case-insensitive RISC-V ISA string
Date: Tue, 25 Apr 2023 20:00:16 +0800
X-OQ-MSGID: <20230425120016.187010-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425120016.187010-1-cyy@cyyself.name>
References: <20230425120016.187010-1-cyy@cyyself.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_050108_105454_432ECC85 
X-CRM114-Status: UNSURE (   8.48  )
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

After allowing case-insensitive ISA string parsing in the kernel code,
the docs should be updated.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 001931d526ec..70afd1e8638b 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -79,11 +79,10 @@ properties:
       User-Level ISA document, available from
       https://riscv.org/specifications/
 
-      While the isa strings in ISA specification are case
-      insensitive, letters in the riscv,isa string must be all
-      lowercase to simplify parsing.
+      According to RISC-V ISA specification, the isa strings are
+      case insensitive.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
+    pattern: (?i)^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
