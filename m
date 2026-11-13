Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB6606A330
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VEsURvVi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH3lOc2/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA8h3OMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YvbaezNtbk0pDAURhpWYXXaJzuu3+lv0un85KYnmCE0=; b=VEsURvVivwJYbbiTsT7Iu2G5Vf
	oN1Jb3Ulg7nO0UyOvwbw8FW3XTpd4lZ2lE/CTE5KxgpttukoK9FrfjxUxpbtjVZNJEqwAQDzvbrSr
	Q1yTN5+r9HTWM5bWh6s/IwrqfNY32wnwA73UaMpnE86aXuY3dJwo02CzeJQO4219tcI7n0xj23uLY
	eoL4oRQ6nVk56xwP3cigpT5wZGiX5qDCyETBisZrQ7+R0rueXjol3lZ1c06yYlco5JOQOouxymMdf
	tK6jSty1ZjiUQVTDro/9nDZMvGagh2KdbQg2yES51ZhXD3hlzkcAHxYl5VcvyRRLLqXo//ulkVWV1
	hs3N+bjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwO1-0000000E0aB-31lR;
	Fri, 13 Nov 2026 18:52:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwNx-0000000E0Z4-0z2I
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 18:52:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRpDq552832
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 18:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkPg5/GgZz/
	9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=; b=kH3lOc2/yjDZLOgjOBq1LJrx/uc
	BfQYSDeU2aQnW4rMH1CNs0uAvLb2uAHJxTgwHFXviP3xSLTuHedKmRex5+sJEUwk
	KWWRbBnsPOD8lHRrty8uXSYX4ByM8ho6zL4byOafDMPqAm4hzToTVFRFTdb30By9
	8ovLMRlCqkoFWMhFTOAG7zx6RmIUa2I5sSIcWEyZ62F3Exa13GrqLYp0WQXdI7sg
	BYRr0+ofVPhKE1vK+gzFVKO9bQFWloVxuqtNjRBaziwcatt5AcVkdPuBBuTO4Wpg
	hNWwHZuJ4fxTXZmVgZcZkKXiZBDZgkk7IUVRsBfrNkomupeQnU4bcVjvrbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcbvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 18:52:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so282171785a.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595948; x=1795200748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=TA8h3OMPE+JMXnu4KZII/n1XdgZK8GzfmLxdxGn1zd7Rp+BmPZ2HEk5j5LCXYuqLeK
         ArC5hz4rjJvyvx/h5Cqee0sflHNncseUxTlnxo/ucJeZyG/ww83ltJgQr6PK8KvJdJKF
         owE1gJgjHCljq+5wJOihIOfDaWGAwjV8bn0cq4BlRsdkfLfwMpHcFoSSOlMdZjXH7cJ7
         sAuMyHC/h6SiBh3V20wpi/Q9DDF61+K4zuaR29M6wLuDa6e3XiUB6k0tKxcdVdPrnzQ+
         TQO7jXFLlYT0ItwNOL5Lbh3oPzNyxZkrbdsF5wTPTKO7oLCu424/pQFf59sXGtCUCXDH
         CnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595948; x=1795200748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=WtcEpfo3iS/npHCNY2uy4d6bzpqMgiS8ALiMIMB0NnzbP+tCm5UGzX504cHwq+LKsm
         DVj3lBKg4Bm2LGMnOisWb1F9LDE2+Aifb6vbbNqkDaviFd/3j9EKnakZjUmg950NAsWj
         YeTSmaUC3RjckUnafpd+7MvMsoGI+ED6BJbl4XsD2slqcy4octsvZgimcqRn6GDtRj/Y
         a2XRn+lgQZOeDsx+a9WFlzr18gjE6XMyhzWlKPn171BBdzwT0x7eD5euI8nioscw53IE
         p2yirm45rKb/2b+cNflbysa6TDJ1g+Nw5IXzScKWboh/PLkLSfCDsw3X86CWTvy7eydo
         Z0fg==
X-Forwarded-Encrypted: i=1; AL+hErGlsqx+FqL91NbmyWI7jrMmbh1Opklfl2cksNoP/JZEK0t1CeH+g1cvu5jfJV0FzGW6hUyG+s2BwPOeFA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/fvbwBooj1SUCn4JzrOv02uhpCl/YpHBkg4zr7oRS5+jDEzal
	fbjYPLmSyKNmb5Ly6Y/+nWNoCHHP95RM18572XiYuyyeNWQ5Q6S37My63DiJPfJ+3DKJ4X/v4YI
	A0Z1cmrP8MF5BLn5EcsURfyURRbhz0kJchL2dFYqGSOBFKzqvwNk5CTqx3POjnJqwkTI2saA=
X-Gm-Gg: AYBFou1biWll7/NZEnvxzfriZ4iZJZwKxfROYAsDG6vGgL4//HH3w3f1euPd7SjCmWJ
	mVk3g5/EoDarrG01aKYr54BfCA69fb518bTQB/rAr9CPTmG3Xtyl0T3XlTRfCjGb7ohE9xK0I8M
	WqNVLZOjX5hjmHpdQo2PWNVazdmOXFb3ncaQ5uvFhXFOxmUbIXUqyBeIEHDvvfdXVVnm6n1rE3j
	e3iMFpQ++y2qCI+8ADXI67F44C7nfEU75n89wPkEL5Tqt1PCWYE7t+NofvlaoUoIBI+MuZOzkJx
	nMV5XLJ+QOIImf21xljjR6ROKDFMyCyz0EJNtUJanVlOSQlyhgbFhsdQwa6jEpSHemdhWwfJhPi
	saqdxVa8Z51UuOkND/K1cEWpjKQJlt0Y0huvCsiMjCALTj7jqSDlT2p2buWMiNQ==
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549345585a.17.1794595947642;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549343185a.17.1794595947195;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:26 -0800 (PST)
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
Subject: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Date: Fri, 13 Nov 2026 19:52:16 +0100
Message-ID: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ydlWfHv8KMdXhcil2lvko+LTGW6saAZRv+JES4jy7+c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xf5vzRttUphxuP6s8niqvoRGePP05uJmg+y
 NWC57ZpAcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXwAKCRDBN2bmhouD
 1wFuD/9Xs/3OZFXRUKqYiOXZBAwBmVbvbBExEfwlLHe6jS6qAFeHhQhGL93Ylpvv0Td7tCZDuUX
 WDn78xTjPkwg9CrrdNAjva2vQbdhcof5jz/fKvdgVSfBVsTHp10jzmaM6LdWVJJIOOliC/Z+PYN
 YGxIYLaDhMTfHVGqnrFFeCcexaPbUdcgyc9Mkwwpg2aCzzZQmXnyD2S3dLS7tuzcg3XzzQB7HFP
 RSDduEsrSiEydijcnyi4DYc6bM2e1wnkHgATFGNu5bdwsbiceQifIa+3I9Ouoy7V1tNL4/zd3s3
 DM+H5aTQlvR2Ak68bKMHkGIStfFwm6EHTvMvUzHkP3+x/V/SYlptDg11lii/WF+D8Kji7Svt0B+
 JZEB2ki616RlV0IsXSM+Ot3bDpXr1tWObZC6RVSn+YmUx+VYAkzI+p2NhDr/JtwhUq3gWfJlmHz
 273J6ggcHKGw1epcLbx/agjKjxjb6DWAnNqxkps4A4r91f8nd3y8KKKbUNrN0/nB/gOUj3OvNS6
 94r7g0EOWYWYE39vbF8mMkRkzKYFAnLhz1/wDT2ja7rilDldE8bzRt14CcWBjwXSFBf+2JtdnS6
 iJmiRJOrRF27jLm2zwfqc5pCnLb6Ss9KTp9ncmYQrbEEVn87GS/1mUuHUqHPQYFb2YeOiGoSWlF riL0FHR4e2KJsQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75c6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=85fTqwSHmoAmm6HRS_YA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: R1ZAw0hHKLoaWoCl5VEvCPnE4oEkrvxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXxD7lQOzJFkoq
 bbzNQEK23VtfmzUc7fKDnVsausIVQ38TcQlbV7bG8suF98i3f3ZU9O/GXw8k2Vrnm8qO1xgMCeF
 OM9HaBfDK0WnMHh7PBeGqPmdxw9mRh1bAX03dQY9lRP81X2shbV4eTqBrd/8svZgzqRIBZg/6tW
 ycukVw1r6z+Hi8cH4RjOvg1grF1ogh+Fd1eVDHsxVi3vh3Myfz+FMLUu376V471AvVSnQqu6+fI
 w0BEM1/nrai4yrqHe11S7Zon8XNKIjjlLeJ7e9AFYs0pqTZR2zPikJd1KJu7EQ4K9/oRNJQ1RWf
 F7TQZ8ZI4BEwZornVSvPNe8k0avwTivjTgFP8PMUJtHv4eIfYa3Uf9SOeTTUjYdAclZ547i4xmm
 RrfOzLEshOqIuHGFPrfD6tg1MPOyhR5gRyA2tJ5SVldFWGN6e9mMuCPeB61ZB6NDcpZmMQ32G5b
 GBO1ICi7tVHmSZZ3Obg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzeLBVwobnI5y
 4WEgNGSJdPCyb9VgcmRXHSzP4bdGaxjWMkNKCV+OK2Wge6/FnjQfRPL+kmlwZuw8IW+JGPFgAxi
 KzF1vHrdoJrkgXv0DCKTizPxT+QnSMs=
X-Proofpoint-GUID: R1ZAw0hHKLoaWoCl5VEvCPnE4oEkrvxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105230_045694_704691E1 
X-CRM114-Status: GOOD (  12.26  )
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
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..5d5f7f8a393d 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
 				resets = <&syscon_apmu RESET_DMA>;
 				interrupts = <72>;
 				dma-channels = <16>;
-				#dma-cells= <1>;
+				#dma-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
