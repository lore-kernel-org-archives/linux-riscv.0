Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A51C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xgnzc03nujy8haubGUsY1ne5f0sGFurRN17ybc29kLQ=; b=Qff+f2w/mdiTkc
	8aLJRSfUH8w9AlmC8W8BoHESk3T1XWZE5liahq+53CENHbdLtz0Jx64zDj3vs1nuA+C8JV22hXRhv
	oQ9WTX2ZERsUe8oDGpwgtG3iEQDqvGavshAWYJJKzrY793CQQpnSrC3JdxUvmeVcrWb360ksEvc94
	KCDwe9LaD/2VzYpPNqSvpWa4LAhTBehiqlo+qqfU8ZJ5ip1hRmThk8or2lnIxDbC0dqsxrsMIREUH
	f/camPodXLqMyJXBtW0SEelLTYlFv6kJurhHHmKFM57/DXrHuPoa0+l/gukuk6IimRgaCP6Zw9j/V
	rUK5/Qln3z6lPuJJu/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88nr-0000000Fmap-1pVR;
	Fri, 25 Apr 2025 02:28:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88no-0000000FmaQ-3q2z
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 02:28:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-30332dfc820so2054527a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 19:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548112; x=1746152912; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWs7czVv33WD5QwKCbEc0JN2+JAvd6m2fpFPVxVDwgA=;
        b=ZN7jrwN0atXced+98zcKZVkw2mH52Z8bViedGq77nlvITT8OBj/Xx7ETNkBxg+PASL
         REFPpgM2RdniJwZgnoYfaI8gq16dzrewU1Wc7N20byplfjq478yKWVTgp1sGC2PnZr0W
         Wgw99ZZclWV34sfTRaj8SAdc5Gy6mvSebsLYMUp9c4EoGfMvq51cFL3bdA08MZWvkVRJ
         BmZlENxPzIf3wrNt63XOVOUxv6SIA8zwMhPHwX/vKrv+VcQV1v6L07TZC7rlJCHbqGGl
         wLbYCnu9CV+a9zMmKRJL4nCCzRm5JJ2GoGKhthYTvMJ6V7ilA01OpTsRJpGYcJUuRhvt
         U5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548112; x=1746152912;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWs7czVv33WD5QwKCbEc0JN2+JAvd6m2fpFPVxVDwgA=;
        b=HakyHvC8JrcSlGC+Gs1xOMS9G0sX5DrVOfdRjGV6TukkntaxgehbpO9IhEjbCxxese
         ZuMAj4iiZuClguijg7saxNFcrNSyJYQeUa/7Pi83T5sbEvipWZ3vrSyWow+oADu8E1U2
         Epc68zAo/8Scx/uoyluVNR+auU9KWN90OZWObg8BLYUSjGMFbMSp7DBIUP97Bq0cou6s
         D8v350ZPpn01IgrrAm/oNLbjNK/4Ar9BhFL45JiTJ89ETNftDWHHJJJoXyt2Q3nhRBf2
         sYrHwRdMoyc9ctardEUA7OUW2HufTLpeYuvEnXOYE7MBkB5h6RNwUP8hiXFe7DoQYaKc
         1+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUIn9ZIRIehSle1lio3iGi8bnW58qJQYxTe3FDGNPykgT8lCeZYI3w+vXQ2h+IN6v1yxjGyjIoKBd9T6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhAKh4lr+fVU2wh58z8cLNHY7i2n6qAt7wqFVPljH9eehPI1M/
	1KAfdzmat8VtLJVqK0pb4PuDfiD2riCfxWSWPfDbj1l4O/i4uEkxgEhTmS4URUZQDg==
X-Gm-Gg: ASbGncvCLiEKIjvjqHW4OL1vqW4wZUepMjjsEZuuMpE12tRRng9y9yEjxqcGv7BAPXd
	E6IqwlIpLGJXTOF4QHzzpBE/SihSG8V2YOQDH4sduskWru4Cso58XmFraw2k91p2brUQOrMwyhJ
	OL6hFYAuB6GifCaYwlG/EWz/GYm/QG7buFWm3cb+/jAtuXfELGCFf8WD+xcmH7yTCNfL2Y4Ky+1
	50eBOxRl5GbA2A0tNw89WVTKTfF1W2e0mZROkHhjLorI1NMowOejrh8/mYCws3qZJnd9Gq6Kozz
	WlPUM2L7KgEdyJXAE0f6qwoSOck9YrPNUpTUH944BU84lku8f+UNbp0P
X-Google-Smtp-Source: AGHT+IGXRHecCFcL64rpDvSNx0T+kbwJIyVpg8y/+sbcGf/XoI8mdp3d7daOKwWfUyt8OoeRaQFhdg==
X-Received: by 2002:a17:90b:4e87:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-309f7e7027fmr1187414a91.28.1745548110992;
        Thu, 24 Apr 2025 19:28:30 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:30 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH v6 0/3] Add basic SPI support for SOPHGO SG2042 SoC
Date: Fri, 25 Apr 2025 10:28:11 +0800
Message-Id: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADzzCmgC/3XOQW7DIBCF4atErEsFM2BDVrlHlcWABwepiSMTW
 Y0i370kGyJXXb4R3y8eovCcuYj97iFmXnLJ06WO7mMn4okuI8s81C1AgVUATpY0ynLNkjEBcST
 lKYj6+jpzyj+v0tex7lMut2m+v8KLfl7/NhYttQzeeeLBG6/1YTxT/v6M01k8Gwv846A6F0ICD
 M4OircOm0ONzaFUkjvXGehRmwBbZ5ozqm/OVIeKYv0kaUa7dfbNATRnq4t96qw15A2pd7eu6y8
 oCkCYfgEAAA==
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=2302;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=8wmermrE5M1bwblIgtOTe7sR30SfNY0obp+bchFCYvQ=;
 b=7QwgjA4uNKIVGLxb1ctjXPQAAYavFTWZ6Y6YdPmSoLAuI9YIU1Ytgaum4LNiHoUPTHn47KJ97
 rmaiwgO+wpHANGbzaIIIZcQtR+VK1L9NU75DipCTetUZKEuV4xbdVo8
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_192832_976560_A45E421F 
X-CRM114-Status: GOOD (  10.14  )
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

Implemented basic SPI support for SG2042 SoC[1] using
the upstreamed Synopsys DW-SPI IP.

The way of testing can be found here [2].

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Changes in v6:
- patch 1: Apply Krzysztof's tag.
- patch 2: Adjust enum to alphabetical order.
- Link to v5: https://lore.kernel.org/r/20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com

Changes in v5:
- patch 1: New patch merges all vendors fall back to snps,dw-apb-ssi into one entry
- Link to v4: https://lore.kernel.org/r/20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com

Changes in v4:
- Adjust the order of spi nodes.
- Place the binding after Renesas.
- Fix the description issues of patches.
- Link to v3: https://lore.kernel.org/r/20250313-sfg-spi-v3-0-e686427314b2@gmail.com

Changes in v3:
- Remove the spi status on sg2042-milkv-pioneer board.
- Remove clock GATE_CLK_SYSDMA_AXI from spi. [3]
- Create dt-binding of compatible property.
- Replace the general compatible property with SoC-specific in dts.
- Link to v2: https://lore.kernel.org/r/20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com

Changes in v2:
- Rebase v1 to sophgo/master(github.com/sophgo/linux.git).
- Order properties in device node.
- Remove unevaluated properties `clock-frequency`.
- Set default status to disable.
- Link to v1: https://lore.kernel.org/r/20250228-sfg-spi-v1-1-b989aed94911@gmail.com

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]
Link:
https://lore.kernel.org/all/CAKyUbwXqg13Ho7QHw8vV2W6OcObphwhQ8HUrZMDNBxrVxLmdug@mail.gmail.com/
[2]
Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst#clock-tree [3]

---
Zixian Zeng (3):
      spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 SoC
      riscv: sophgo: dts: Add spi controller for SG2042

 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml   | 19 ++++++----------
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 26 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
