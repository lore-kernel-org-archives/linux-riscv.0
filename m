Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28583606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QnNQtOzc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EmPkO92U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFRZ1CFV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=5xPbR7bhcAXlO6OQkURQ9jUVYiUxZ81nqSpFWgTVjRY=; b=QnNQtOzciX8RnR5qmYNf5/ZF1/
	8x7pPfpjUOu1/H2fGogMw0Ji2mA/Nub4dPoTfyFHbgnMi1Uhf93/+bcz5bzOumtVNm+K0B3PHpg6W
	m9tz1wwoGZ1NHIjvIrw0qrfko7+Gg0h9YnjrXJ0y4fj1Iefs/PgU/2EgbKcufRkWtbRFP2xzZi0MP
	rOouDb6S02mOE+AOK8Tt+FyGdQxlk64onu3HY7Izag6kkSnykPGlnNGiY3s35bTtFJhjzY5T/Jhz+
	L7dnWz3l8R0wD4PAh9+fG3nEjFmw16ApAcX3UJK3XKLzCUhKk08m4B77V8ux70DPVFqtXfPlX4/Yo
	RXlb2mKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH5e-0000000BuoM-349y;
	Fri, 06 Nov 2026 10:22:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH5b-0000000Bun6-3x5m
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 10:22:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7Qq3243885
	for <linux-riscv@lists.infradead.org>; Fri, 6 Nov 2026 10:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=Em
	PkO92UEQrkCb8F3JeONxGzwdDiLf0JX+FIF2hkyEK5VwpT0MyzfKrIrMvV2NhO1B
	GBZUtkuxjOOBiH0+uh/uvrg4jZ8Xm5H5AhcHWheFutnuQajZkgMskFDy0Jk/iGAt
	Eu0/b6u+P/Dcq+eEheE0qJW+k8Kw9hHS+6FiiMTNm22SQ5F8W9gDLy2KxeOCXNoh
	5/nD/+BaCbAB3gULgye7gpIt0GbXsMNWUyOnNHOtWQpCdV1ejcwnuMjpL4l7ozw+
	gD6W+DLKkxrWvNpyUiImrGQY9LzUYymkcT4XZfWbL5raJ1bg2YAlvMjhpDi8hdt2
	qYUcgThmujRWt0+r19+g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2a59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 10:22:30 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso302448b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 02:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793960550; cv=none;
        d=google.com; s=arc-20260327;
        b=fr4iGi8Q7La0jb+bzed8Dy2dZqqMF+Xzqplb5VUH9bDo55h1WpDu7KvuHa2u0WznKk
         DrBznDze3MU47pLagPB7aeJnKJ8ZFqYhB5L2/kulGn4wOvpaYDQOep3wuOuumFBr/hkR
         ichXfPmaJIN2wDyTd5JBW7atCmDLNs9CLJjI4rFeu+aRBWTGHM5PIpiAvCgvuojy15fe
         cmoDUCCizdg1f9sHMK3HbFDzVZSndYN2gLinlwNre2OVerP8OtmjbBu60eNWVbI+R1Y1
         sVA6Wa7WRtsWbIrr8SKQvoUH6X9xQtZ6I5cZd74tQz7KIq/KD9mv5vyR/4vI06xK2G3k
         5dlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        fh=74Mq1Xx4STYqpqU1Ef/51O6BfKYnRl9S7UnEub4nl/w=;
        b=XJnz1Pbgx6KRFf4Z6Atx0Gjx8sCi2+GY1LNc/T3jPHqBzhgVeWO6xV5x4HzHo7w9ek
         UeVWi6713WfHgMLR4gaf9rwKO4WI5BwtPYYFZMBD+6YUDEYIQGtr6mrByr01hWlXNrhJ
         mbi6XT+gsxq/g1miU7y2wttAvfCtzrB9rTJVlqGgawPt8GdfOvWa+ZmbtV1jBGzqqShF
         uKtBCT8zaNsotfl1Fss6lU2mTmDXBPpRJ/i4NQKJQzh1XbBP7H06ODCswY7ySVakyqxV
         qxJXBUYkNlExjSW8e0oDCGa0icXk6oleJZ6aDFNqJ2OivPX1IutmUQVaBXMXudl9gUmD
         dXHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793960550; x=1794565350; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=BFRZ1CFV9N739izdVk4I69PGi6/eo90aZGrihP52p4ikmLOKTFTeJS/wUGnSLhs1zc
         oA+YQdHkwmEsCEyr0x6M1I82idgAJ1zU9wYLu60o1zEd+4Rs1GFwf89t4DzBo/j85lic
         D9KdMvklvxEsY3FeGtroRR2U2xUK0K27lLkIEP0JTV7zAhF/VWtBqUI0zt7SshRtLgQ4
         kEysqlZCQX4hH1hTl0B/s1WuMxELzYH0Jmg9Cf8W/Tgmw6gxGmoMEG/an4Uxm4bA6KAk
         wRjKKLiOtUiUHUZft90vzUkoY8FUdWwFcJJVJSv/s0J09ox8ljva4mrVfBR2nEcfncLM
         IYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960550; x=1794565350;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=KF3NYE1tKip4V7PuXq4UPChDTvmFeEj68zvqISTCevI9gSWXak2ga0NXbvvIVIaKNC
         OoveKA0aWRTBwA6nLA9tICJTAwC4mE13Cn+/9E6mjCRj143ohUilblT5sw19WCu/r6Vv
         fmMITBipsXYrmtjGyIplozx5p7MnjVByhABkcZMgk1qwL/BMG8jpclQ0tpz3hBWUSsxa
         Cdd/55faLok5zIoQP+cQDAiUeq3OqjH9Mgl901ySpT7E4DSjxyWR4k4bN142Dbcprd0k
         FqfijuXF2/l6r3gCYW2hPYXDvUZhcm6oskMD9dSSYXatiDm7HZlg7sC+d7q2zMcCZX7X
         Y7kw==
X-Gm-Message-State: APuU4Z/ZpjVFCY4aNfaFnRlEm6pwoT2Jp+TB1cqP8TZyA0W2+9qnTHiv
	EKedVpLu1zCK8Q8Zt8idZ+YuG2Z9nIgHCdL423E0egPxYl6wsBoH/ZfVnM6r/aADnqWwNnX/Kir
	KloGXSnqqVNKzdK7D/xdL3NFbvnuxXCGYtb6xVeeEWUSl6n3FtmC2tg78MnegzV4fIZZpAij5AO
	9Nhbp16Dy5gwTMCgbhRXPBgamWPFyGHR4WMigywjG8KHnMA1hGP0Nlnw==
X-Gm-Gg: AYBFou3tLw1sRcqSlPuj9wPT6OOak0c3svQIIuvoZyQ08d1MdCfsCy05JVKwdgUZOUu
	u/dcgfZEOszd2XsjpDqfBDkwLrObxnSv3xdjuvCodMrGBLEDiV0AupJNsnQe7QQW4wcdIOcQ+NA
	dbSfYWjIpY7HkkrPRl9lT/p3keL6lV/zCFsdfmHkq9UDNvpBfUln5rCIW1oC4=
X-Received: by 2002:a05:6808:509f:b0:504:5fe1:c8d4 with SMTP id 5614622812f47-567e1848b93mr1423733b6e.59.1793960549879;
        Fri, 06 Nov 2026 02:22:29 -0800 (PST)
X-Received: by 2002:a05:6808:509f:b0:504:5fe1:c8d4 with SMTP id
 5614622812f47-567e1848b93mr1423720b6e.59.1793960549471; Fri, 06 Nov 2026
 02:22:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 15:52:18 +0530
X-Gm-Features: AclHuK9SyRxYo6gEdaXX-xEWMkjah0VyBnGX7WIdIObw0KiXgbUZVy8hCh47MnY
Message-ID: <CAAFPZetYPG1LZZdNFDwLPGRzfVd8C41sD18xr3L6BPzq0Yn_Nw@mail.gmail.com>
Subject: 
To: linux-riscv@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aedaa66 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=xo5jKAKm-U-Zyk2_beg_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX+xOsZjBRoaJr
 KmuJw2Ef0LOuauG3NzacSRH+y+CirvOOXE985KlLGwPCsboy7l4OhQGBoHf8C0xWLFfGSPeGDaN
 2UJLHoTdgcxCy+lDD70VC4TTxuMLKUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MSBTYWx0ZWRfX6imPeYCEj6sv
 A9/i6P8Nhta2as7Tnd1YSmEgVihW1jH/mJXHdftEVXNp61JkGXMQFpTabQPVmTNnuByY+YFMcUK
 CJzp/TTY8zkuzA3XHvxuxgN8UHU2K6uDxYwsiLciH2czi4344sYFGE7IXQjajr3S8WyTwTyIJXQ
 TCAKcr468tByXoXIXZMQyUVMS7Q7kNHySMbjuIggD1E0TZTg7iTk5EyeUH/Y1d5NV1AzBkMdnVL
 ag+aHuGbc9AJJRVJkYN2EtO6l+17X9XyqYReAuzvHmnagGHaub+KOWB7mHNuYfhJ8HHOxjq5K0i
 k5VqUmKnh741ADE135zWvuSb6ZMSA1yWcPmpKu1dEBHjFmt2/qBMh6iOdIf21eLRAkyTIrcUpJY
 nfYXOmM0iveR3LAKHqBPNgnfc3wDxMXXsS5EPfm0UTHBSCXBrqsNBdWRK32jKxfeRkuItypv7gD
 QO5TWT2Vc2pF1RhxkRA==
X-Proofpoint-GUID: 3aCWQVkXQddepqQaYlRgut1uHsU5GaWR
X-Proofpoint-ORIG-GUID: 3aCWQVkXQddepqQaYlRgut1uHsU5GaWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_022232_046313_82E06E89 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
