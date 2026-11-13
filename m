Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16865606A331
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2tvN8wH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nNi9CPyh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmotDSsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qHtAGEzkduu8BUzzrKEXdgcqyVdlEPGaIAq8wc03/yM=; b=f2tvN8wHCh4y4L0HuEpARgaJgp
	kLgX0FE0o5oAmfS04jCOUiEE9ETntaZhz0478kLYyjDFLZ59+9pAChQ9gFUtxI5one38c6kGnFAwO
	Mmm8Z0iJynmMUuQ+wbkkowHmF+7EPADOMwBLcVzTSdaeWO+g4++5vpSbOY5jLyFkS1J+oOKRHBypF
	SYWYM0lpNiwqCE6y2KxEo7//Mwr34DHljZq0ugM6Z4dtiHUSQMAEnALHjSQ3hqe1HOwIlzx1BtD08
	RITK8pzI8rFxYa6LS2uhb00k+TRnu8KzNHv6yBNyJ6FRXxmNoqrY2mauRYGtGlkMxkBTtsTtFifG5
	pnimBndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwO1-0000000E0a5-2elr;
	Fri, 13 Nov 2026 18:52:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwNv-0000000E0YT-05CE
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 18:52:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRCr738055
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 18:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z
	5RXqz2B8=; b=nNi9CPyhsHyyazKxfw6F45z9vlk6Y4jA7tuFgEKyxQyxsMVXfzo
	fp7+wMC8OSZFsT7SEkPpDFD9r+Fj1VXMsBM2zxeXOv2VepfzMAjL1f273Vj5Ns5w
	L2VTAmYvroUdfE50aqs80CWgW1oAnWjQuTOapeUDW42jO8+FS5pUOgMLgdJObRnu
	Ydr/nI/7boqTAYHJmCLHek53WNUNNuusvUPmsY50FJdY2CwWwZKOx3K6mjkSctOd
	dpYYRxqWcaT+XNISqD6AcWdknfc5h5YLq6LeC/AKM+VrYrDBHps2AsZ8jnH2UqOM
	pfgUgBGa1jcYlVNIsf2D3GjiEgyjLsY41pQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37jv75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 18:52:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so308424385a.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 10:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595945; x=1795200745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=VmotDSsELP/qDpcdq+nKlThpjpTVo0sdEwPpQ5QL62Pe1HnaS/FipZnEDGQ1OxAoIE
         jMkjBFuDtLPelcLrblq/8VLQlb1satmfTHfG77+SuBkz7YbQ+/jKbFaV6WRMeFw5THQZ
         rhl2U9xEB1HfxScxqABIusdgD4t9P+3DnrTB+mjp/1uPfTVt/2P8EvYrY8qVgGNdsqKa
         Vozr1DdHgjvFnx33UG/+d7BiBtv2oTBL1RWooJxGaAJTch9k1vsP3KvhwwBykMy5KM3s
         dTGK8KtEibSoWag2x+URfHyKIaEzTRgzWYetn+I8M8nVo0RrnuhvpQofJ2w+Oja+d9KG
         +Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595945; x=1795200745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Po55cXrE16BxqMC3zVUb3WIMlK8AUcbgD7z5RXqz2B8=;
        b=n17c36ezqr9bBOJIsigxi/QBzmyqO/sZlLezgHv+HQUCDodPdYJ22hpI2IHi+Nufw2
         kNF+iBN0g2Sb6FxihX9U6zqV7vOF8s0UeO9c9lMbFeDfzK9+6GDn6UIZkRmrCx6HS+jx
         NiDtP7OBRyM+IEN6G4wjiOnLHMuj+B3YOANcq2bjfbcUhK+1Lgapkvzaejbtkke6pVp5
         SjcKR6aiyLTHqgiP0CR+NtPwEuMgonoGj/DFsgnGIZ3omZUQPKMBaDGh/WhjCTEYb678
         orPtkAWrG15Rszcv8ZXs2fpV5Ckt6LgttaYG+FXSI54A494KhAZXgwdVPt07EgUbIchn
         hP1A==
X-Forwarded-Encrypted: i=1; AL+hErGZ419uYqvBhw0X3MV2YSBt8Q4shnelYXFnUCi2UnwKACYqWxOl8IrS7SPyGEFeKEL2sCXCp+x+wC6lug==@lists.infradead.org
X-Gm-Message-State: APuU4Z9cDzvKjlBdbu62jMRHakCEk4G/3YB2XVPfzkDGuTg78U5flYE5
	SA/Pn2nBs8A9AQxrk6hdDcGPBcmcNlledQVher4YX2UCrcW8BUeLW376Epm+WmbWLUnIuq7jdfN
	qaj81u/i1Gl75XMVlQlkLm43KQ5XIoCxoGUvEzYmD8tnUHCP3paRpp6BjsyWPjNIJX1hITU8=
X-Gm-Gg: AYBFou2b3HB75cLnJMZlawvxWeIcOhSvATZHgVIjQexIUxWdN8StBDLWQrGTNcJf+1I
	d9dhY1wvCLiC3nNhdMKqqjosvY0Kai83q4b8CReyMJ2COvJWbfBdH+gwoxLqDLh5Dhq6aRTfQYz
	R9Z+dlIEnM8tEqu0xbwWNEQxMUxltjqYx3A0EMTmT6RgC1dX992YpmO56duFw4VrHKOcxm3zCGZ
	Jzcf/sd/DNbvWPeULLDHUDizDDFCb/vdqluoUON7uheLrjloG9jiivqJwE0/VSl+FphD1VlZyw7
	IfbxNIyonjfhwzdiUQxJFRF834YURQYW8VqYME992e4o/3F+ZLLNkmQO2vpmBwL7jn1cmnucyEI
	ZRp7+B/Mm1zQb62mLNUWfxBIfoPN8RwoskNTqrxiJSztpMSFD/MACDDKmKGNhSQ==
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568069285a.9.1794595945255;
        Fri, 13 Nov 2026 10:52:25 -0800 (PST)
X-Received: by 2002:a05:620a:6845:b0:93a:11a4:223c with SMTP id af79cd13be357-9494ba5f250mr568065585a.9.1794595944804;
        Fri, 13 Nov 2026 10:52:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Correct missing space
Date: Fri, 13 Nov 2026 19:52:15 +0100
Message-ID: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JnAoEWfmUCHyEt5xBJBkALlBOEpkhVPyvMi6si/XwBc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xedNFYif3mvamZgoOwZEhiwp70kx3USlRYe
 epfxvKUHIaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXgAKCRDBN2bmhouD
 16XaD/4iNP91Vbd1U/v0zXTsKKKPppFD4Yojr2ttV/+VCgvjy56F7/doRdhxru6CqGUnox/adzc
 l4zf1GOa5rMH+SkUe6+KQOwOhgLEASSlWI5biKzt3pc/VSuxEL/RRCirBjASFiPJc8aSIYf1zb5
 CNzvhfzG7q+B578o57SkzG3UomSp1JHNA2Ndf2br9XzPYvu/raH0QWHIVNirgekaIGV2BkE+DGB
 UQd87Kxgk8ix4Ub0FZYQ655dgh09Y+IV7lwIyTc/UFW4YpdXlHAdNFL7dLJsO/UDmA/peYmEK/y
 7DN5YCfylN+xC++Vdh8HCYEAtnQvKqzLDItVg/uf8DTOQZr9NP5ZAWdI6HN/x6S6yatZNvOw+TN
 ad7+yrq5HilDyAzuOQQJVDMXKn6Lh21djfFh+kxlkTMuCm9kF+3f/EF/aAtRGeOsM2CVJx8tgQE
 gxqd5ksxYe8j2qlJKTJjqN6EaYanTXdIbSdm1C6GLuihQ19hOtSs6gfzTYRKJkFLuEtC0A1Gtim
 OTAX1iYhDhaFbZAnkRRnt3Tye8olTdmIavvHVcLcVIZoe7nqzQh21DYVQJybCWVG5obnAzJGeuS
 zlKW6nkI6QulWBfDik34wXQCV9sI7AwYPS8jKEANul/sUqykne9VXHRqTiE/lpWjxwJE39+i5fr hjD/NmwhyeXmi9Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0uFeC9YDB68M
 EKUIjEWZ4FUOaaVTXsYKM3bOeMkFZaqbO/500a9rhx9V4st3K0gBhJG5h5XS87ApJrd5kFl/10s
 LzqEwB812nS6leTAgLriEPRaQsZFDk4=
X-Proofpoint-ORIG-GUID: Bfmaq3eL0DkZSoX_yxHNTMvpGDHp6bzR
X-Proofpoint-GUID: Bfmaq3eL0DkZSoX_yxHNTMvpGDHp6bzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyjaTxyRyPFrO
 rWZ7vitmfEASWn2bal+uWzDdFLeBiep2HFJJhqIAZUU4S90gOrd94HXVJoFLtEoXeCUdwkaXp4F
 6Qc7pER1EqoGlHMCVd7ySYv6tta3rYGu5+s7R4t3PCgZ7atQx+aPP4C6ttokkR36W2FV5U9q4XU
 4cMg9RAFU5c0VElppojgLbE8lgS5aoHE5tHNO30rpHFqkGcggl51ToncvIFhwadJG2pabOETgst
 ozjLVp0mstdJPBHi0QUyVnIfeSIPu6ZGe4UZaVwGgFS/rM5uBObVGWvF/p7BrGbQhywc7I+d73t
 wcZCGwsaA1Twnbf/V/B5wmQvSnIi2Mjd4JcNrM+BSL+vTumFZLzuMuCXjVtqD97XqOsqlatWMLF
 +1VPT6IyLNpKMI4IsF1oBsWC5TFuw376BRZJ47Hu7DC9Pr42M+guqjHUrtIH6ht8FlVKhd6uZ7W
 giIJq12K6jV7hiutQsQ==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af75c69 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=d8qWwIobHd16qk65SKQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105227_175480_E794240E 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index 180fd8891903..2324d567de45 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -63,14 +63,14 @@ hss: hss-buffer@bfc00000 {
 };
 
 &gpio0 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "", "",
 		"", "", "", "", "MIPI_CAM_RESET", "MIPI_CAM_STANDBY";
 };
 
 &gpio1 {
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "LED1", "LED2", "LED3", "LED4", "LED5", "LED6",
 		"LED7", "LED8", "", "", "", "", "", "",
@@ -81,7 +81,7 @@ &gpio2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mdio1_gpio>, <&spi0_gpio>, <&can0_gpio>, <&pcie_gpio>,
 		    <&qspi_gpio>, <&uart3_gpio>, <&uart4_gpio>, <&can1_gpio>;
-	status ="okay";
+	status = "okay";
 	gpio-line-names =
 		"", "", "", "", "", "", "SWITCH2", "USR_IO12",
 		"DIP1", "DIP2", "", "DIP3", "USR_IO1", "USR_IO2", "USR_IO7", "USR_IO8",
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
