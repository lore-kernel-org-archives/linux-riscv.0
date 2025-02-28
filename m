Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E260C282C6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LDZEU9MaXKxwD5fKr3ZnNzmJK7Qex11FKrj10wCrfU0=; b=llmdRBoAI/3TS3
	EXA6S+bJo4riwyD7IALI/vWXKC1PMf1aij07oUTY8HjSIw59niMeobx94PCjb4aFzHDsk/P+fs999
	Ebk1EBEMkF/MKdVcnqoDszuhjel8VhYW2jC0SqLB1nM0WLdaP/c/wNdE0mtuDsaV336EtxcEPZJPk
	d6RSrrwy+bdLB7ueDHHv83yGLqWWd8AIOLZIg/eZreMEifYNNn0FJwf00ZCusA7F1DKCctNdBEGAj
	M+mRhOCkKg0z+qIogNUSKw9s2z46+9NH+UV/xrUqgyl64c0JhlhVJ3JXr4AKSkyu3Pjt788c/fUpG
	qywUQ6HgEAt2kGSc3v2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4hL-0000000C3rZ-2EDe;
	Fri, 28 Feb 2025 18:02:55 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to4hJ-0000000C3qZ-1dTE
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 18:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740765768; x=1741370568; i=markus.elfring@web.de;
	bh=eK4M2CFdXyu5HI4LNXAJHZUld6l0gBUVOZFtbpGEcuM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=w4EP1Dr4nX7i1ypthZxZaqC6R8RKbvjT1tbSR5Sd9XcTggZJ3CoAP0PdZGtijFog
	 qKBQ93iiZHBzuSendP6hW5q76+n9GTq82pY8GYjCZOq2BXSVAEZlcRDok++N0Xsw1
	 jHboR3FEhgJqt+OmZJMs/cHOb6X4eiPCsssSi5NlgRWFkkDMZgPKVSQqkr1TEm5DV
	 VBR4j56vbl3P/0W/MrbjntSs3oNTaTf76kNW821GJOkC9yG+ZWngWnIwaKeT8PRoe
	 B+YKtAJ05q9X4UWRUzX51IQ5GXUIdqMuQ9ZMa3LO7obSvyrj51R+2S0KjskuBSCCw
	 Didtat45J3kGDz+ltA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.27]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mv3UY-1sx4XI2bgG-00rzh6; Fri, 28
 Feb 2025 19:02:48 +0100
Message-ID: <d1a384c9-f154-4537-94d6-c3613f4167bc@web.de>
Date: Fri, 28 Feb 2025 19:02:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Qasim Ijaz <qasdev00@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] iommu/riscv: Simplify maximum determination in
 riscv_iommu_init_check()
X-Provags-ID: V03:K1:JhTdCVQrTH3pRqWkfDnqBWlut2oSUyDj0pt7WEcCMTNueMxWxYg
 JvvkBvFN/0ZMbF4W2dISPA1soxLiP4NNwwKMA/XAAj0qbmlpcKLANJy0EcVwmA+40xn5CP2
 Ad4v/QnlvWdYFNJAieE/IZxdvGE/obOvtYYLKbkwdsVUwewbDqnvqVsoES1Zo4mxIgSgk1Y
 xm0ZqezCcfCzQcgo0/teA==
UI-OutboundReport: notjunk:1;M01:P0:eSSW5lU399U=;I50OgSrD9TkwusxDqXip34QlRPb
 VRJrx5LDHhRSjIqkw/dYopfM+HANiY0G+c3eLx3BBLrU4nQf1wK6Ptv7B/wPsWy5zdPVSEaX9
 vUYVYZ4+zKZ2Z1gfTMeC7rFSSCxoyFou0DDz9SNV58CgbpSfEz+CKe4KzKAbgiQ6gWn9lfx72
 cJz4a14T07W/ywdQuJzzg16lvIMdEXUqDD20UFkxjbeB4/xNR5++coD0wxX1U57pKGwNdGDRt
 W3ktG+3W1r/HGf0S4eEtGLAxtUdlCveX59LZ71UNmXihu+lQ//h7iJdxykLIrbDYzZtMM4MJs
 tPFOqhSKNGKtA+/1RfOilWLER/eXI/QIlbyajgEc+Zd6vlhNMsl6fHwHFeAZJNTlISnqNRoo3
 alKI1FaOjkJplEb1U0TRzVPRJFYjQvN/SKZdOLfKD+fTDFTNHR64TMvNgy9WUOIH3S9Lh2xsk
 um961lNiFYHwMckYF3IlZIXVeHfDF8q6ilw73XHxgJclefs+Q6FWQZklPg+6TCc2csBCGt/Xm
 +wOFBdzcbWxIeKumkd3Z5StntIryfQFSOgEWtSivspwH9WMOxpobSHU6gEC7nMMbOlJVj205N
 a7xjRMSxNl7GX6YxMv36bt0Pf9LEiYzyhIyk6FxBb2CQglnNhYZd+Zue4WJIpsJ0mhFoxw8DX
 kADH+IRlGlQzGC77mh1IcyXV6PDhiuvnukjb/6oadLVP5tLMFPogFYiZK9T/wB/9pQpoCa5+k
 uOO4LUjDC4i01UB4LLO1Lfp5Gge6TxKg/XorK3U8+VvfDpg0vMHYDa/0wiRu8ykBvVQD4JI9p
 fKCamJC/+mc0rG/pAjcjd+zj+pUQby6FHHfif+p0YVKa2fuSAPk5aZC6u9o/aVeBTUalTL/8G
 usJDKebWf+t7CCa78fWXpnFYMmO9CQMjUL7mZvnC0D2LZArag8gKINplrxUrrkU3P3Bw3XJmp
 G4+qlRUcmolGOx1rcvbdw06ac1J2kFZmb3dhe/ygt4nv4WvKNnPp4TOrElPZuWKOXPzhygvDi
 vDICyLwD6btuw0Bok8dMsjBiCbSSaVVFz8TyVkInur1ZOHsOJC3Huh2OWdYFBNTXvS618/Bnf
 SdoUi5c6NfseHwMEX2RJS3YaLVvj0fFEjXOeElxU3rfLP2Db8ho3epAZOQfZ1g7NAdE0MMfc7
 G7ohwNc9erqsRiugD275jtlTJXJjKCIzcu6UjDsNs7/LaJMOpopJDX8Rc2PIjO/iphLlE2ZgV
 8uP57d8MaQfkB92jb9sEv2OV41ZHukzpyA4f/2o+0VtxPvvhjwQdppRQ8f64zTZKnCAm+pjGr
 XLYiWWlCOWzrBAW3PXqokkrcktaepxR39XsZJcc+ctjmrwSb8iWYzx18ucRR+Zg2MLdYQ35j/
 p6ZWo825qxiSkH3qyufQVpd35UuSWAzxDbzhp4FFf0dxZQ90Uj2yYmtJikARBYOg8RfiRHVr2
 Mz8SVkw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_100253_725299_35765E83 
X-CRM114-Status: UNSURE (   6.55  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Feb 2025 18:56:00 +0100

Reduce nested max() calls by a single max3() call in this
function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iommu/riscv/iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8f049d4a0e2c..31d20016a0df 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1588,10 +1588,10 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
 	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
 	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
-	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
-		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
-		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
-		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
+	if (max3(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
+		 FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec),
+		 max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
+		     FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
 		return -EINVAL;

 	return 0;
--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
