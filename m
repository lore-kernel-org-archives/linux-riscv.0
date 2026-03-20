Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195FD109317D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YwWWyiJuuYH/XsW6aUMgoerBlqTsbZWSVMY1fAq7J8=; b=xvkQH8fAxANxeB
	7s6A5vbgVIJZrSXt9e+OKCfjd2TcXLBX6NaHRLYeKSGvfKyUtR7N/ZKyZ98jIzLhGlIOEynXv61Hp
	LxDdRwtQ93pwGbkcmasK65/q6DAlCLUh0xgbtbxgjAAxUgw3zwkZam+i7W9nC+zy63k86lKbRZyAl
	V0B0FZl0Ikfb9/kAm1j1KwwphKSQEqoS+sp4/FB1qSzsW3vERolR1k/ZLTSVuV+Z8+Rdg0pI8yqqc
	dueKTwXSRk7qrDF8HbRwY4YswD8EvzO0US0N5jfyLHSxAuufM0B6rZwmimAgAqfCuIwkWSFgAERbQ
	P/5haD9ce0tOmrq8KYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3U5Z-0000000CDkK-4BGY;
	Fri, 20 Mar 2026 07:16:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3U5X-0000000CDjG-0DVx
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 07:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B50B443A2C;
	Fri, 20 Mar 2026 07:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED3BC4CEF7;
	Fri, 20 Mar 2026 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773990966;
	bh=uwZVnODgMG45JU6Yv5E76ubyYRFZJjdJgmzpPJ0euLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FrEpdPEPxtsF8JUFp3ia71jsEcAY+IG4zPq1h1lqRay6yZTm4wGwlloaTkaXCua3V
	 3XCMNMue8hHcM9dUblSeaw878aDsjLtEDCIuCgTZvz5tlpOSpiBQnnHDE9Yg4GhHPT
	 AY9EjwZyyQ6cE/orONktioJ9Th/t6tG5tkGvnC4wP9MZ5+FDj/26NlVr/pq6uJwVCZ
	 sZg9bvfXVshLJrQC4LqoaMigvgJY2vMfCHKCn79XH3DK2XligSOx6AyyZdvDp62dzT
	 /9PsaPlSshKZO7JjmAeZNFWattR6gaLnQ/4+sunIlZHu6f5xkwNfVXR9H6KXZRDuUE
	 S44nkhZCBAtUg==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 20 Mar 2026 07:15:38 +0000
Subject: [PATCH v2 2/2] usb: dwc3: dwc3-generic-plat: spacemit: add support
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260320-02-k3-usb20-support-v2-2-308ea0e44038@kernel.org>
References: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
In-Reply-To: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=856; i=dlan@kernel.org;
 h=from:subject:message-id; bh=uwZVnODgMG45JU6Yv5E76ubyYRFZJjdJgmzpPJ0euLY=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvPQmOFxwzZBI8PVNThFFbSRrHn3UyFMGboiFj
 AR+sHudp3SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabz0JhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1b3A//V9yooInUPnDEnA9zUVopFpPUygIVe8+FyIpuVffaXUyiG6thQzjTF
 M7SPaVRMCXvvaqHfrFWYy5Zi4nenPOKJ45eCnsW6V6S57K+cd50fZ1qddb19qmmt5CUR2rJ/TIh
 7mY+IANnbVA69jJMCGRRe8Sz006SbDtxnqCLc6kgRXIA8B2K0de8Fs4JXWC4PamqSdzOLrlEhO6
 5HrESGXvQEGQYTibjLouk6+3Ihslfg1AoJxXwKEKV7E2gr7A4mKGga1YJ7XjF5eopzwi7pm2/ip
 Iiqoy/3KVZXzQj2fPmjZclfe1x460PGnQbcgeaO5Wzsz6EPG/yeIOdH7fj1bwT+1Tc+QTD/77wy
 SQSRRMNKhO43SpI/fwm2OWqC3hFXdJLqj4HDuc8WqzEWp0jiymiymEMAUbUUFJ1+4Jv9zuiLgp0
 bno5aaJFUhU45v86mwNG/4OpJEb9uxH0LEbAtHvtPWWfGsIdmnWzv2bFmFMbWXBVlsjFh4Vtd3O
 bZjeN4AXaPOGLvhPQtXx9S/l00z4vLcXDQKgSD9vyhAScZ/TMIJ6bWx0bwmZQUyzABzV2wrhLK0
 4ycu1wrrmCfRK0pWMJsE7gwhPxcz4DN3iuE1O6Efey0e8sRVDI2J4qbtjq01baU48WEOH7M0uHS
 oyO7ZqiuE3z3oRe62apCd/BAqrpEs8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_001607_140971_D2367082 
X-CRM114-Status: UNSURE (   9.01  )
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

Add support for the DWC3 USB controller which found in SpacemiT K3 SoC.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..28219968b8b0 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -212,6 +212,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ /* sentinel */ }

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
