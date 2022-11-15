Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D32BC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KWn4ZFhYjz9VZaHy+U8zplvrkJLBHaXRtYXWX21YZE0=; b=N9tfgQi5DaKeRg
	0PnkhzR/dbmOhLwSk4pYdeTcKEM+b6g0hDW5oMPglST9wwzfTopee6rUa2on64iX1jG59ItmhgYnh
	3+Ae7x88NXG5NLM1E008gmXvwgL279uvj1GFbAqEz2iDQFMZEq6i7NK36YpEDnosOc1+e7cIpNuL9
	UVoHWKM8ZJ/HdabHvYa6esE4trO1QHd9Znl1VzzIRo3ZpMRRgScrsdBEsDjhLuuhDzLbNWZjHBeXS
	aYteeHQHhZi72pr3mvU+APiJc149DbHZJv0Ax3xC+Y+Bf9hwE+wIol7W6gXsP5ZRXO2K2nA6meGRV
	QDNaRVe/bwlgSJK+7YFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ef-00EUPW-Ae; Tue, 15 Nov 2022 20:08:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov2Ec-00EUOT-CK
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 20:08:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 6-20020a1c0206000000b003cfdd569507so605556wmc.4
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CixpthWMJdcBg/cX3D5hJU1NNj2lyrg1MgghHQNLhjs=;
        b=ltFl72AZQQBm96BuEX3h/3PRtfD1yygSfOwIEZgvT406vVZ40HX2eKjElnlRHPTxt9
         HNavmWzTvIAyOstSAQEcFEnfltw4brvxEm0JzYoR0onmPqhekpNeJVkI6fTh/neDeq3x
         gVcxM0fwNJgZwnbPJ9zJ5t2xBgHo+0JvHpn2Tx40plGhWdT35LlyROHidQ60pLbI7T1N
         ZjP1c0IT9EX6oj6BNK4cEhP23MxBzpQ/nuqfqRdKIzhOD1V3/PMlHZoS19TylbqleUf7
         lRvuXNCNgLr3DYufiWNNKbRKjZ7h3OA/0jVNE19P3UBc6ofvpd6A7E1twRYOdPHzmkM7
         hZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CixpthWMJdcBg/cX3D5hJU1NNj2lyrg1MgghHQNLhjs=;
        b=sKavUEEQwNWaKooOiul8ZlZOC9hl0OVsiGwiIegnOBTvzUfxB+gbATH28urGuUy94l
         s7ukDS7ualbfKX99G1+fVif1XGVzgUAE3WPGl1CKlL0R9LiflhYNR+7EHN2nKlUsfIvF
         /KYImnV1I3Z09QMlWCrDvS+4TyQiHR3mFrR5zFs4Iqzk0nouplU/fpxpxsO9PoWLGBZy
         P81tTpGiN+0fL9JnY5gmS8ooAcXD1KopxGkElF/fZRE0yd5eM4e5bFoiq9D+YYjjOFgD
         jIAtZLGnDdd4TptBfEvLFj6fnqsKbEDHPVxrKi6xE3vEbJ9SXIe33pLpNB9N5hdn8KyS
         INoQ==
X-Gm-Message-State: ANoB5pkAy+PiGZxBnPDpADK8gch0rdAy0ZePlE7wa+AF/mPsdh2olGBw
	6RR22A/QAQBx1iEaynJqpHOEFxS5jkCelQ==
X-Google-Smtp-Source: AA0mqf7IObXbkSY1I/1dV4ynEHojPBVZV1Fpo6fp3FNhT2zgIR4IpjAELZPmnS5ttMtFRQIopIjwGA==
X-Received: by 2002:a05:600c:2d44:b0:3cf:550e:d7a2 with SMTP id a4-20020a05600c2d4400b003cf550ed7a2mr3663wmg.97.1668542917525;
        Tue, 15 Nov 2022 12:08:37 -0800 (PST)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id co19-20020a0560000a1300b0022e66749437sm13321282wrb.93.2022.11.15.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:08:35 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH v2 0/4] RISC-V: Dynamic ftrace support for RV32I
Date: Tue, 15 Nov 2022 20:08:28 +0000
Message-Id: <20221115200832.706370-1-jamie@jamieiles.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_120842_701655_3BB75458 
X-CRM114-Status: UNSURE (   8.00  )
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

This series enables dynamic ftrace support for RV32I bringing it to 
parity with RV64I.  Most of the work is already there, this is largely 
just assembly fixes to handle register sizes, correct handling of the 
psABI calling convention and Kconfig change.

Validated with all ftrace boot time self test with qemu for RV32I and 
RV64I in addition to real tracing on an RV32I FPGA design.

Changes since v1 
(http://lists.infradead.org/pipermail/linux-riscv/2022-October/021103.html)

  - Fixed the use of SZREG in patch 2

Jamie Iles (4):
  RISC-V: use REG_S/REG_L for mcount
  RISC-V: reduce mcount save space on RV32
  RISC-V: preserve a1 in mcount
  RISC-V: enable dynamic ftrace for RV32I

 arch/riscv/Kconfig         | 10 ++++-----
 arch/riscv/kernel/mcount.S | 44 ++++++++++++++++++++------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
