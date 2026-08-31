Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B34C61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 03:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QfL215pOiQyw3CvFona8w+r9WCSJWM+eWob9hoZdXjY=; b=mRuoqyyk1Y/Hmh
	NriMTkpXb/DIK+RXotCWOrt4HP311LWPB6mbF6wP2vsqu83414ZKtPptOqU0XUkSOM2dl/oApXs+h
	oSUfpQmOt/nxeFkrO1x6t18W96h0LOI1L8TR7kaK90qJVUXOeaMR9rRTP9CqDL7e6XMcBiEZdKX/K
	/TU4N+iuA3zCNdzHdsK4nh13vKZ3Bba9oPCPyWWN2HWe51D3uZmfg0sQRmZ7KgyYgdj6KYYd9dC7t
	IKSUNv5bRa8ggd/6sDORTvFavTSiZybVSK6FyrIkgkSSdzhdV94mOSCriWz2U2lIBRaXhsxIlo0zY
	kB1Fy5eg6HO0qYEsDBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sfw-00000008P4x-3Eq9;
	Mon, 31 Aug 2026 03:27:12 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0sfs-00000008P3S-2oC8
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 03:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788146814;
	bh=FvM3PUyvegHAq8oz4A0YkG+fZ8ENWHND2m9+xtLaGUA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=cvRjX/dLXH95CsdVjKYhTGQCgsUrAIIBNxsSmshdVrIlWprIevufCdDMvUuJP7fbO
	 KvbbgF70giZv9R3eHaCDeNfwpHfC6uok5GuBYJPYpwNwOFgfdjoP9bSQGhlOPS3z5F
	 0jIptt4LjVR5svLerDEEHbBnDy19qm1KGK6yDXzg=
X-QQ-mid: esmtpgz14t1788146807t62575c63
X-QQ-Originating-IP: mdvl2m5PSw8hny9/qhqo0Ig0a0QY6rf0hYVmTKpGJmk=
Received: from = ( [183.48.245.118])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 11:26:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13306223604564133587
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 31 Aug 2026 11:26:41 +0800
Subject: [PATCH v3] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
MIME-Version: 1.0
Message-Id: <20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07ZBpeRVX/odxMdQiVV6hQFDCv
 0sxJi5wM8lJ7pwzM6s7oy07ejPr9GisaeoVgoPHVEH1TYO5rswEihglCngE0JZl5I4ELhGr4gV
 KcplEhJSGIVtf207nZtq058uH7ZDdteqdyy0KY/ume27dkbvdNxHuJ0YOCBRQEsk4VjoQp9LUw
 +TblpSuTO+rpmKuNYofG8c/NgEciLI8jzhSkia7tmVZ3v3dTJohAQAA
X-Change-ID: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=KNTgq+/0Kuouzn61el1yz5cV3CZE6r84n255mD/gSww=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTvhQmXYxRXMqwYsvXBYvY3qyKn6B04e7Dj5IBdx71b
 zBONis82FHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjARHVaGvyJHC26u5poVyfFx
 wxnHg38Lb9ar7dx+/HPTWvO7UY2ymyYyMkz6NeHtm1aptmh2rQmePIvar5fLLXq2ckU8k/EzNi1
 /Ry4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N+U/QWJ6RP+kQ836Kwwm3AcWBTOGOGO97xDCcr9fzZ9n080CwsqN/XxU
	h6SMekBpdheDbOXL1G0UE4wD11kKyIDE1dYWTjbbehMLM8i+nw0qh2vGyVUiNJc4Q06POuT
	ueUykx24wjjVZ1jFwZKdpeQdlXbaO8SHJHn6LhjMES0wFvE6MCIQhcw2x3cLUkR4ipZ0o2w
	OT+nnaTl2MkhmUVbFLwgVODQXdyPq36T1xEanovRk64fqBKnV2nTUg9xGCQXLXiikEz2ypE
	DvbdrFKJ0vdIMzIodq+hFoMVB4LYz6EuadmDOqUd0LeF4FBIpSSI+c0o72+lg9iOH9Pr8d+
	naQ/YFlB/L0YNYpSGrnyppp5jkp+7ilOjicA+NwhCKbrIeRMRrctXn+eQzKFLCxWV3lM0s6
	nxprzwxDRm7veAYuSwoic6j15WNSMEO/3dLufjHXIcNndSwMmnp7qTSU/O+2Ok1DuNcdDyg
	XgHIlP676FpYvvOTwPyCnW44KLcMPlr+tSVoazK6XLP/dqBWtXb6O3xuV1uNS7J+gPmddyj
	dL2Cmen7/EytKqiMeeg2hYgZbkE6N8KxlDEiYEwtkDEEAePi6n2DnA6MwqypywTQ73KShT/
	rWxB/t2XVqebIGdC55hihYblsQ6+ZFHD0SzZOWfCKIeYhRNfL30n3ZPq4o9PxV8J2MUx4Bw
	LCVCmQqgTLrwsDgfm0pkXB7bXeyIhws1eQ5+195kvYz002dTvSeTzt9kwVhwG6lMPTmzRqx
	+oOgYTfXa9wO6FJWdTJqc92HZEDoFS26owdlCf/UQKcm5zT8sWY2NwQgZxg21oYuvQeCRzd
	NsPmvDwc1RCy9rFUm2A0EGcsWK0B5hnHpuvOVpypPZIDXHSGvmBYZoGkIYzaiJYgtqXvPtA
	PX4ALQpxLV8Bg/+v+ioOMKWhvAOd2ctgH1ET9AQ23907h7W7ZOYWwvX4oLKFk4iUKeecVtv
	2SJJLDspXV1xgMAow2sOwKy03U2HFxD+XezDZexnmZAaGKe8PRM+RcZghWbsbyHIoei8s49
	HBmkw1DEeFw+gVnxYc/kgwaFYcnpLXZo63+tin4ZuT+D4CpXXoRhsEtQQjXA6YMByQTv/py
	D1ytnYIWSNdKxQM/W5m097LL+aiSyzkLw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_202709_324104_6F9188FE 
X-CRM114-Status: GOOD (  11.25  )
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

K3 boot firmware configures the C2 and C3 CPU clock domains at
1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
currently contain only the 2 GHz overclocking operating point.

Add the nominal 1.8 GHz configuration as the first entry in both
tables. This lets determine_rate() and set_rate() select the firmware
operating point while retaining 2 GHz as a supported overclocking rate.

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Cc: stable@vger.kernel.org # 7.0+
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352
---
Changes in v3:
- Mark the change for stable kernels starting with v7.0.
- Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
- Rebase onto v7.3-rc1.
- Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com

Changes in v2:
- Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
  will be handled in a separate series.
- Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
  patch.
- Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
- Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index 92b930d5ff30..1796236d8dc5 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -38,6 +38,7 @@ static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -50,6 +51,7 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
