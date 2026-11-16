Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288A606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zjxulIN7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FA9LcLAu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kgB9u/lgDtXdsCPnHtEqwWcZqIQNSy1mgTntkLv7RbU=; b=zjxulIN70sctZeiUXKW0sQ91Nq
	aAoKCs/Cw2FSi46LQdCFdYYMdl36qmZCeSyPSyRZLxNuMYdvuW211UqxpWr2UhKWm0vVsZjRTt7uM
	XzR8ImRGDDNfI9Jj3Q9Ne3FImZh4+bDR2Fpp41kBR9tVOUXuZ/VlK6QzdeHM730yueTvg2RvUTEYF
	UNHt2m0vVKeISt1+ky6hVx3wsKCvzTArRkHgvuGjGWYNrdmSpTSiF2YlLszxh9Dmvfojv5vgS06DY
	jXU2ln3ncA7QpImCQ6m7TtxndFvY7oyLQNNFc2evHiyU9nPMON1Cxp5LY6vGut52MRIFGbOG2RLw8
	hN4dyRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuUm-000000024LO-1evc;
	Mon, 16 Nov 2026 11:03:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuUj-000000024Ks-2ZoE
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:03:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAKrP2785071
	for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ng8Ocvz7fCDJlR+ot4zgt
	aeJUok4UFUIh130ek/3jE=; b=g8UMAqiDvzWqaJx+jr9HP3VmQrajYOcDXvunfs
	KQ+ho6F+A9hm2V8ey1jBA6nFNSld+eJGyv4NRKt/GZoZ7Ez6EYt8r3R2WVbUihZs
	xcCPv7V9KSqRu3gtCBYmI/sIBi+NbsrG4xc2Z+4kTXqhnwGT8DxwVuJgQKRiOPbI
	JPLMKef6fj3k7KIa1jerUQ6sAteybHHuJzhImIKPQ7j7EbheBGOqW5JrV3OVd71C
	lMaaOomiZk6x0E3ZyFrE0aiC66q7xRbCRQwTRpZKhgATNd0u8Qo3k7c6TADzsya8
	VT3Y+0qr/18Rydy9BF5y0eAk4vNfB+lcfaX9jLQzyBrAnZTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g04w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 11:03:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso2529400b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827008; x=1795431808; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=FA9LcLAuT1tMzgidEPXU5jlxNGlnNbR6AHYSDc2HLe/vttwr05GbRrsRA9xqmAvk9S
         EFntYdGQG6QmQAZ3qZOshJvFPJZJNsnNUrLl3ZVQz5oaYzl4wgRbeDRxCs6EvSG3tvJs
         AEa075nAH2xAEo4Rnny0AG92fYwbKWfJAMC0IA63dnckrdcbO2NGhE9yf0zf66cdblBt
         KlZ7+esHp2z+rZfJeNc9Pq6pVn0mKiKq6j6jphpTYR1C5+vS9njtKipQFY+lgAHwyiz4
         v68hxrYYGoWIJgWAMUsH7UwCsX+hlpXv7Rr3feAqlT14u1UdxeCjsPJbdhazzxJgruoK
         hKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827008; x=1795431808;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=iwqI7AykVnDBPywzrAZiXFZvgLX+5XTrljDVdTzgI7qSEi7b/vN67SYhPMxjwB0AkX
         7fsRjno0hg4epzWgtQ3JVmLysC8sIFubO6qRgsh2sIqsu4TqurfHECH1E9H0IuU7TnXe
         hkjmE0gS64Iq9pn1cmoG2+pJoI5kTPmKmalhPgKY/ryxQVbAdFd5MiZxSSqQrUPJMOUm
         k6/z+qaJQRSygdjMG0zh7UtjbTVtEWvaX2iW4z9/2UEgMomI0u1ld9YDnZqrgZUS/txq
         9LHmkAh7aC2+7U3D65aD7svMe8bC6g1ai/KfPQ6XJyh6qPdTLPXpdjmGDaZWXHc66aC2
         D7hw==
X-Forwarded-Encrypted: i=1; AL+hErEkOnfbixBYzHBIcTlzOUH8PVlrA2l4SQf+wc242tTaf4pDC6rcT/GvT48DtHeSxRUqwhksUZJlT121cA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+UGq+bYw15iNBoLc4SkUngqTHAypYHpLLK8AmpQfuBrZy+ZBqe
	pUyEacwoJYKprPQUV2tLoCrMLJYyrRMoRYWrGhdiBwuUIVqHNRiphl+AeYdmDddEd+YaGPdRQ6v
	pYXLBGnaeISfPEUvooEc70JGOo18kVCva3xr63Br0S0r7CMgTaZmB0ezNQKHmSaKVew7dxfE=
X-Gm-Gg: AYBFou3kzhxiQ+8o1DLWzOAdddHN3J5bWn7A/auzKKl54gCHhtKgRyLCmstTgfPZ8vi
	4RVkUv45QSwmMMaKxmDQ6n0XtyZevHI3lcGtAXvG1JlKdrVOlk8+7spnNKaquMk3ozoDEaSLaru
	Xtuuc2E/fjcfdwSQZi7vrtoC4+anFCyKHSXeYnCIqfFfJv/A7hvNB6e1NS/9TrYtNRo4igymtl2
	n3YpVk5ZsTRF58tD+4ioc6R04E2MDkgGhKS0LdsMeV+7PabMG3Wf/D5SdBgX5jeruYTD1iIrrfD
	J/i7gmfGj4TUKkj0EZwC/ZzQwaBAR0w2c40Hwj9MqlbjY8KPKD3KiyfZ7qTkMGOl21h6cU8R4uH
	jvG80Kgvfq3aLisQPREMncmTdTKHG7+EzbRwD8FvX1k9LZFoHkhn+Dp8133WlpmWT6pmK29Q6Cp
	jo5MYtozBM64sMl+/QyYMMnWVY280iLU2Rw0M=
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10042027b3a.18.1794827008521;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10041988b3a.18.1794827008017;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8121sm3499779b3a.20.2026.11.16.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:27 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:03:01 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXi+moC/x3MQQqDMBAF0KvIrBtoRK3tVYqEMRn1Y9EyI1IQ7
 97g8m3eQSYKMXoVB6nsMKxLhr8VFCdeRnFI2VTey8Z737gE4/4jQWFxD3FDGFYNNmFWdvWj4ti
 2zzoJUy6+KgN+V//uzvMPM4fa9m4AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794827003; l=997;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=odo/rV5qNFliIRkRRmj1dui5NiNAsjMnmpo8SoR/RjQ=;
 b=jknWsnBgy2n9uBICUy4HdpeRPU1LJHz5YpX8UZFlu17CDjHJA2PIRahJc+OKyVYSSiUj8Auce
 386loIbS9/fAuK6x48tCWT21m5rC5Wn4c8VOUfzCuS7dw/jkvAbjkMV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX+2JHZtmGkcTa
 4moDHZcf+Z2lQMn/H0bJ/3TkMa8Nj+o8rvEAiv/83PCPmAQe9GpzoZBIu8dDQSydRiKUc+6mBTA
 es//+rscgHSyuoPFTNzXA4rI+NYvJlhyHIu7C+KjSX7gHHBMcaH4mWIQf1S3YRrv8vv79g30mHP
 Kt8R5Ao8TmfUnZHD2FxvsqYgV02w/i5vg/nCb0l4IZLIDoTK0O/Iq/xcEy/1yuVKeOenDyQS061
 Jygs2cwEJ046fYyI4kgLndOrJIOE9nNgbBOlVS4Z1AVAsIqsZ7xh4CNzYMECOZLI86Gd98xSNuy
 j5zkt+6uWTPVAlCxQ0XTTjSFXuEw+uk2JsvUbHU/yrZdZFfWCB42t9u2iiBYo0TINNgBejCSCmg
 ayv8wPEb5R3P5BIJ5sMOTl3mv8UwC5seDk9TxKO4tEHg72PH0zxBhLcbzUk9vivVRb0ixnZy0jA
 1WxiogoNw6vTJZLru2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX72uJhxF7H7a9
 YEqOG/zh7YgXWSVJZs/T8ZPNEjxPe9e+KQM7amc8l7zcJAeWgx/GLvqhjYbaxe4krvOZ25LsAGs
 YrIyaaAGf+10CFAklB2VB7jJ2+jitj4=
X-Proofpoint-GUID: neyGC_iSkrg2akrT4-2Tybom9svFSeGJ
X-Proofpoint-ORIG-GUID: neyGC_iSkrg2akrT4-2Tybom9svFSeGJ
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afae301 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r7GndIfPiZ8jbtywizEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030329_661066_393258B0 
X-CRM114-Status: GOOD (  10.35  )
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

The cti_riscv device is suspected to have a clock vote issue on the
KVM enabled path, which causes the device to crash during bootup. Mark
the node with status = "fail" for now to avoid the crash.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..5f5a786fbd2c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3996,6 +3996,7 @@ cti@982b000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			label = "cti_riscv";
+			status = "fail";
 		};
 
 		tpdm@9860000 {

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
