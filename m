Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D46C88E65
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+w/KHnU3PB2Ztsr9M4otCZAw+xNAJb3jD4MJnj+Mm8=; b=CUP+QAeIOk0DcL
	JzpYW8eQdGcWdUkOxMCu7ZpmffgZWkHBtz1tsoSGutZ1gAPjYe9xlj9CO3yDPc8urXDrJ2vZ/Kqug
	sRngTBRKlaGTkpyvAbbYdAA1NUkVOY+XdCZqFDHg4hgbA78L0hCstrZOgesHey2N2YqVtuoli/LBW
	umZ3sKTto1HE/MwIUclvJdmCDZcSPRzc6bVRJm5R0VvFEFBxoXUTpSedYTznIWUwZS+z0jqdbyzEQ
	yE8537uDGBVGs28BXFvtY9bMb6fI5DgsGussjQyzMoNhYBCK2+ASO0rgbAwbffD48V/icZaDgxp5a
	q2V4lCBduxU7Y6jubosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64Z1-00000003D6c-1xui;
	Mon, 14 Sep 2026 11:09:31 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x64Yz-00000003D5i-0vup
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 11:09:30 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so1402018a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384167; x=1789988967; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=HfSwKUEjSzwjUL/N2auKsy+gMHQwBtCuJ3DkZGVpUvjPkumMzdJi2+CHxzvrNPfIgg
         rtFfz1aj87MpuqKOriQf8WEsDVFrKVQcpyceXfeK55MvUPIojLItQyDLV0bJVixGL2CI
         RxIBkX436wTRvBTrXPn3hShRoNDTd+GBE0EWmIHwTEmCQChNCFOrUR6gKbdB97dard/f
         Yry0xwFnWB4EGX77b12IOLTOZmPQqw0rMqh+aZaiis8SGnDMHvPExzD1LhiVtZEw8tc+
         MXiVSi1q8oZSiPrlWMoITvtDztfHwZmVU3Bd1yhmPeketjfePBpXL0javEcek4VC0Q7Q
         uxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384167; x=1789988967;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CRpE5XBx7HNGGyDVumeAL+DWruwYyiVpmYjdguinMZM=;
        b=rhJ9kQZMW79jLgrLsOakRulQwTjsJiQmrr2IuSEFEHzMAIBhN0jxaOgQZ4tX3SOLrJ
         LM6K3dH5BKkX+cWECjJiD8w7RSAXAW0HnlAnK3nJLZ+MLA7iqt+aUBSoiXsqwrdYLdrG
         p0mfEpEA7j2h4/OYfAsLW5LmttpHrlt47dK44U1z74LvRKIDB4ZugTvIem2Rb9wNtAeK
         qyZ/yA9Yu2L51hkyyxsx5uKSLWxpotzwlrTYJL1z7gOhgF5ikCAp5L2omoZQE0jWaoHQ
         pyobI0/Fi/Jxd9vWWMT/uwfasJpv/lGsDqQhtTuPsfzBRd4xPegtiaBTreMgRoqbvY+r
         pL8w==
X-Gm-Message-State: AFuF++nHVhqxdfJhP/hqGp2oWQWmenXTXcc81PW1JdS5ODq9bJ4DDNyE
	vB/ApK4klmfsb5b0uIIaht0ja4ONg6ibXA31u7I/gnv3b7n4ItZxHnyp
X-Gm-Gg: AYBFou0FFSIo1TpQgR9bXlcuuOzM6167rYPnfCdIR2Wf3cREKksqkmVWVy9vIubBu/E
	JvUZMg17otALLkqiz8+pKS5VmZffnLwAgQYEgt2XxsofUSlCGss4kw3yK0tpmuDokMn6seoWXAd
	8P+uoAOYlcdwWiMfZA5giMt4euKu6UC0gUydmc0kP7pFk0/O82r/KfeczepNJQQHgIicJPVs7/i
	NCFePzWx1Z6Y+HIwe5f0/UggNxLjRDi5MY5wjefNdEt5tQNqMPMTo+q60LgUJ9uPa9mVLbG0JJD
	2p2K+j+k/cSic0gv5P+RjqLlpQogAYdYioj+wUrtHENcVw2Hv/mIKqD49Rxqd4omTstyG/r79U+
	lO5wwhrU2bolg0cvJBYMxp1yW5UtAI7bgcaSFO9SHyf9R2w0mKJlJhWn9VrBoODcIKE0PIH0324
	Ilva7UKAzxS7AdSC+qYHxT9kE3C1KtdiCln/5McpuI/XRaUw/QrHFp12Ce4yN1pTLXDdw33iKiE
	cAHUEUy0MWCAryb0sEgZo/zmTx+DRIbiR+GPZQl7l4CJUkcFAIY0MvQ12vbeBD6+fZW
X-Received: by 2002:a17:90b:3f8d:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39dec145056mr4629476a91.25.1789384167074;
        Mon, 14 Sep 2026 04:09:27 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95752809sm20313018a91.13.2026.09.14.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:09:26 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 14 Sep 2026 19:09:13 +0800
Subject: [PATCH] usb: musb: mpfs: fix phy unregister in remove()
MIME-Version: 1.0
Message-Id: <20260914-mpfs-v1-1-0bb5b6c2e67c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3dyCtGJdAwuzJPMUI6M0i1RTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tAGq2KD1oAAAA
X-Change-ID: 20260914-mpfs-086b7d22f8e5
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, Bin Liu <b-liu@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789384158; l=1043;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=sE0zgNlM0y6pYWyLk97sioy0+Ar99YdHBGm2Onc1q7U=;
 b=dFW+7gHeBm2AIegMt/TyQI2ujV3ViEUxyFCCwY3IPPOOcqEfdTblaOh6qblg4rZa+MpI2jtNg
 XvLpyYBm+pDAINfYA4TfE0SGjMBNN0bv2nbZdzhrHIb6pQPxkzt4toK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_040929_269652_7D49371E 
X-CRM114-Status: GOOD (  10.82  )
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

mpfs_remove() passed the glue platform device instead of the
registered generic PHY to usb_phy_generic_unregister(). This
unregistered the glue device from within its own remove
callback and leaked glue->phy.

Pass glue->phy instead.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/usb/musb/mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index 587127abd30a..6cc2909b8ae3 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -357,7 +357,7 @@ static void mpfs_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
+	usb_phy_generic_unregister(glue->phy);
 }
 
 #ifdef CONFIG_OF

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260914-mpfs-086b7d22f8e5

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
