Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3ABFD8741
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNSCS/bMZAILlaXbnbGVDBtgeXOg69s6qDxU+eT76zQ=; b=gTRnDLaI28xbrC
	mxTTiRYvGDAjPrjMOqY4OGxH2AyYBI8yXt2+ojTRNoAiY0o/2JtAFyvh234/WdtbM5epjWsNLy79P
	8YY6e11ATFgJJO/ePzFp+pN3witAZYj9Ez9GJvYvE+eyUPNatnamwQH/+XgpP2/bqdSUpxuPFl+Mf
	9/YnN5dUaKfMoPyMZt5HX6TqTD4caXHk9Wr7huf13nsZXiJwakDP4DlB5tdFqK2b8D0W7Um4GxlpA
	wUU29c5fmGwGPU5aWEHmARkiSG3DJyBecMd2c2ELHHdqxqVqT5OOaJdN/6llf7jH79vCdtCo7w16z
	qeCi4Xkpc9jDpmK/94PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Szg-00000006Efe-3vaY;
	Tue, 17 Mar 2026 11:53:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Szf-00000006EfK-17yL
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E30A600AD;
	Tue, 17 Mar 2026 11:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C13C2BC9E;
	Tue, 17 Mar 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748430;
	bh=eajFiVFv50+LOps2gjjeyEeXlTo1aiI0qEvcA3iKjUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KanwjaL5xMhmXFPRwo0GkruZRDMuVHePLSR2ZpCvXHD1lqIYJDbgD5XE8cHj1dQH2
	 WnfH41AvH2bBk9OuJT8BQ4thDL9r8JBWGXbl0PkGsfuhDm4/CKUIBaMK5UM6EYuQeA
	 714NLOgeq68wSPKz83Io9TqGt4aKAlwG/GQxDzxMZwuW+zKU8t5m4gHSvGUbpAYR48
	 cO1Rh6pW71NiChny36VQ5ovsZByw228UEH3AF7POJC44wKAnu76FRAy9t8/11d0Xys
	 rBa52SE+yogk96rPuKHBYIj6liklfv6RjzW+NNMKeOY0wN5JENkR4iYWEZveWQ0RDH
	 J/t2WLSnN2ebA==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 11:53:03 +0000
Subject: [PATCH 2/3] usb: dwc3: dwc3-generic-plat: spacemit: add support
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260317-02-k3-usb20-support-v1-2-d89f59062ad4@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=dlan@kernel.org;
 h=from:subject:message-id; bh=eajFiVFv50+LOps2gjjeyEeXlTo1aiI0qEvcA3iKjUc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUC3YyQZPRm3geoV/q77bpN97zXHpDS1fZmSL
 l2nbeEV+WuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAtxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0OOg//dvI9+ayRj6P1kXP3qHNzFp1kE+4EBjVGndwqw+3PjTbmH2Yk9BrMa
 60WnqFoPy8GUC0C3BZ0k5+2LwboQFB0uZrDsvsWvEZ0eWQ8ZnDydSbfH1ieHhehDXn3K6J2s3PG
 k5RNLikHI1/O9HLtWxvAsPeHLOKOTUw9amlKMZ95pExLpEmpzJvuUSRu1zlUnzAagC5Xc6CKE+K
 cBIsaW0wYhu7UNt35QxixAL/9II1/6I32Wqst7UsP6uJnGNGQ+9Yq4CeW8AqX8l22bPm4wuUL5J
 wAr9I7KNqMGjc1I7KdibJzub+VR0N7E0ca3CZcV4lnFoDI33WVvcTTuTOYTSxsiF0x/pc40lCEq
 Wst9zE5qrCxFzCNPs4NIattyNy214QUl8ZrPQ1NGN5LwzM3goEzLlNCl9UoPQifzz7fbbidLys2
 zowl3pITiPv3lrBERuj8deTWQDQTcKtN6QjvuDaxiO4AT6noejHUoVRURR7fhAtFa4q7jnrFqJg
 h2YzyVajoZXoiWuZxLI7FMVd9pIR1uYH2ia6oKVG5jgYqHR/04YqokIWxsN6VsQRfeziuL/n+Sn
 JRbKG34q+rlrcOT2Ag23LIqACS25zLAQD3lyOhJkjAom8lkdGfqeTjwC+cROPUP179kbiS7ClvP
 s2b0nZswzCxAIJ0gmxHeSKOxPrePmA=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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
