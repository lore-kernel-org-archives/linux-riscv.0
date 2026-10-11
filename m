Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2DCCA9ECC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6HzM6C0rxQCvhUEFphuQacAreM4MZmE6mSP+UiqrX00=; b=pwED0o0xEBAjQe
	Aod1ZAK7RJtoIGfN/2enoedJLfHfTCMnX0ykcxjukA/piFuAhJMOJQaqYXOePU6K7BDRCCFTJpe+B
	xOK2poLMHYqoSp3tCmR5G29c+90PerIgEs6m21HiLQ1OMVucgmcKusBXt4RGVw3GGrunzIloOiXi6
	rr9gjZT3kMpjStYfVBhUeyjR4F8bu1KSdESemI+Eb/iO2JO/sCCSjVaFH8HePrknagKRbXCKENRlc
	iqd+/eZXVh2XQiai8UhMNNwf4WJzPkmTbi8Wz6nsR32UxyEv/48r0sF3r5aEashe6Y20jbgBJq8WN
	AmZLuqs8peZW7SiXQLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyA-0000000917c-3ukJ;
	Sun, 11 Oct 2026 12:48:02 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsy6-0000000915M-3vky
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 12:48:00 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so369124a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Oct 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791722878; x=1792327678; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=qLyZSNL2gN8xbMQHwQkmauStnh8g8WvbmWiNsZCnlFRpbcRCJBtsobjxJxMjh3AGJC
         sJRBy5Xm6Sp0YYzARQ9rZcEMLzeNi2c7i8Mk/F6Md4B1nfgNoUwVX7rJ2RtlvFRN5tC3
         Ete1+brSlEqjORcxcc8ZvZKelyz8yO62A2coNhJl3KP4yd+2x4Jorzv+nhEtNBECgmMX
         N3bhr+RNxd0qasc7KVSx/m3ofi+7g3o8TeVby5hNkk11JFLWNcKhUBzGXem81IvtFt/o
         3myKztGkpwFC8GN0neozMa2EpPabqKq65rAMOC/tT/MYRm0GI3rEKWiMWF0G3XU9xO9S
         pkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722878; x=1792327678;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=27hLQ6vFukYZFBzTzY44zZRxlWg2GdIq5OIlMgG6KRD0j0gLRJvVryXLnPzogYPT48
         /4MaN56XXtZag0H2XoXKm99Wu/tF72v8SY1+uRz2II6s2hwQYX3+GNiXo6QwSpklIns9
         cC7gFCn2zaq1u+mooKCwxeJ/ounnbG/g4THqE8oXTnADFaWTRZQ+Qy4m1oyo+wRp+Q7s
         12KoGKS0SQ8YRF10R01xJJn9A6h+GU8fJNbJpWRP04WRwCbfCUCVbgG6DztEXbsX+NAF
         E5npATu4kslhA7u9KBsakvJO+TKLYx0JSNeo8SUlNjDlVTjad6KkbiaLUf89C5idKYg/
         GxTg==
X-Forwarded-Encrypted: i=1; AKwUvBzfI7BGzDKc3FsrkOaj9MA8uxiNH2QM0G7LrGJlN23a340PfQB0dczNSiNLoJ2jCy6jhoBoue1Q7LUCzA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJvs21ftDSvTpHzednipLh8ERo8jqSmt2yxrOXcr4hMCJ4sOwaA
	eB+clvXG1NKe6f6jd+Rf7TMLgKjMk0sw9oXnyeN3FEf1+KPm2cQ56WCH
X-Gm-Gg: AYBFou3mIQefJMhhYZmTPf7EdMwrWMGJlZHDUpyhpSkQNYiay5oLesKrOuJT5ejmHfx
	2JGctsWqeq8BTMwFgE5jcK/ozm5oRqErXK1m68d+AdzhN0WWddO7rASD4nJgUmCvGdx1F4H+25V
	rVSdTFfvnVoId/V7VdUPwuoQ0AGxGGd8sBXEA7pLf4GKGOPkxnhyV+7WH8Gca8NhluDz9QEvnyp
	GnhKpatF/Ckr3BhYU6u4GOiJbVmLZIbXJ965LKlUUapaYsbZzuqv/axQpXO4z6r2fnA1uibrlii
	9AGPCsDksJi3QCgKu5kOxX93HcUAK9Cs+5weV/oA4fKtehVQCiRP/xSOdT1rb/AptY/O+Ad3/++
	9YuBI/9GGzihUhovgo2jj5dI6pGdyRR8pZTca59+4oma5qrJOWfe4PgnZTSy+VAwlhK/3IfzfUD
	Dv+n8Pl/6dyRqRDt2+TmuLzOgAu+r9ja0CrCVrCReCpyz5FtKQLCT0XjOe1XG877Z3HFm4Wr/Vu
	U/owtUFTnEtXZ32MZaLQoxRDUHbHzpGxS99rPM+n2s9Jp4KmqGaolDS9dAnTTYutsqUQ8O89g==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr3830705a91.61.1791722877717;
        Sun, 11 Oct 2026 05:47:57 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm11623603a91.4.2026.10.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:47:56 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: allwinner: Keep MQ Pro Wi-Fi powered during suspend
Date: Sun, 11 Oct 2026 21:47:02 +0900
Message-ID: <179172282222.4040500.483739720170904755.mq-pro-sdio-suspend@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054758_986211_4F258787 
X-CRM114-Status: UNSURE (   6.68  )
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

The RTL8723DS driver requests MMC_PM_KEEP_POWER during suspend.
The MQ Pro SDIO host lacks this capability.
The request returns -EINVAL and aborts suspend.

Add keep-power-in-suspend to the board's SDIO controller.

Tested on MangoPi MQ Pro.
RTC-triggered s2idle wake and Wi-Fi reconnection pass.

Signed-off-by: khaliforce <kforce@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index e2bb6bc16c13..b2c65560d6a8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -87,6 +87,7 @@ &mmc0 {
 
 &mmc1 {
 	bus-width = <4>;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
 	vmmc-supply = <&reg_vcc_3v3>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
