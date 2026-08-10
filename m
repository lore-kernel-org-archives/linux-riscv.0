Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092B1C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUgn52ZWuYrAUAROlcokSK4gnCkWNm3uIja54y24V2E=; b=SjbjjUu0WKm1Mg
	xtgAooRPUZIhvKLGdc4861BClFui4OvMER3Oa30uwGzsROZeMNXoiilDqpIEAQopsl9gJ0ep/kX+a
	0neU9ItSevm1BQ+zb5ysJYKGPNtZitWhz94MsLman11dyBwueJfOeBLnyEaXWV0NWFwVTU1gNLmVY
	4igmstPvp9yGpfzpNVCqdsOHMcBFSmy8AtKxUZRZf7n5edCRHhTou/myh6TqqZOkhhfCbH52znLxO
	SHJMtzcP/+Qk/VKxLgqD6zOds3W+UmuhMvdvtdLoZMr0j2iZsoY9fO4iVwfCUTlyluLvY4+n/syAL
	kfG0pKc3gY/GMQe7ewsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrs-0000000CFBp-2KsM;
	Mon, 10 Aug 2026 15:24:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrq-0000000CF9v-37AJ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiwQ71650218
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LOklvPZbSkI
	l6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=; b=C4J3hB6foIx/BjC/I+MQqSuhTZM
	4nvCndqWcbK12lqXwwXM3fsCn8BfLoJwAclEnn6ts4mXIYWhwn/l/TzAAIStGyh4
	4uofn3M479rKO25HL7FKtnDHoYnh2ef9T4Bz7wconPfUkZWJ2klyNkDWOngzwJMl
	Zyh/idKjzc/TAGsWBINOjUX4Tt5MvnleHK4CanNYwcNVGwSPLSueKK17KIIvOUtT
	1UvwAn5OF8RfEPKLamJzc4yCVLY8GILc9PEFp9eUlLcbMapxdduAGHUy9b4ZXXzX
	HjDDKm0MuOBfxJwphy7YKNq5534hMcg0TKlDmbk4X9IHCEn3BM2/w2c7ayw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhj8d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so3797590b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375484; x=1786980284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOklvPZbSkIl6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=;
        b=TzAW6cpH3qnINjd40rbV5LOjFUQMWeTL/n+LJ7DvsECUiuempLaJfsYehOEV//oplX
         HZ3FZUQTgiMONJew9r5d7ojuRKZRmIlFqie6Jq/tpIBoUV2WRU7/vOGUqEY0ivGcmM5d
         GzfH3ntvAAixaUDiosJolP7otCkihqejvyv0PL2nFmg843he2ndblUKKbTtDmvmzH3Oj
         d0BB7lGDLepoxC9IaXbTdTnm/2g1EWELDT2KKkcrqJxewa7SHPSxgqtjS9RyU9yP0nlb
         e5ISYFe4RqztYpUE+wmNZ8Jh4+MC4P5OXxNATvf2LSnhfKr3jQ0TP6f9vXJeTZvcOKWz
         SWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375484; x=1786980284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOklvPZbSkIl6v6AIVmRwrfMBoY1hOJLM+FnLZPE6WY=;
        b=Bs8OVgseZpDJdP06jjAB9YkLUFeWqS5si/8m/fXDnWJYoi78ETpBojKWvxavtOVsAx
         2yyk8ZizcntiOIbicz2LtMKdsp1u4M7WWDE5NJkAhIjtolIJIV4Koy88GOTRMDtW12lI
         rtyaRlfNR4seLbuJukhxuSaYenQif6P2M9YVtw8ehML9CFPyUZvxKz87S9eRUqfN90Mu
         XxBiP3GW+N0b8b40ucYANFwehlVKCIo5N5/GjSSfibO1lauhH96WMhcLViN3eTG+kRch
         TZFO5UUWIK599cE11ot8WzoVOXvh+Oajap89FfbgX9TjBIkQJLr2LplseJmTRSFmk8CT
         uJqg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4II4lWsR0Prd5qiV+rIM2OVRGvYBsWvXaIXqrC9GmQfQCiWpPNXwmqvfQL0YhU1CDIMxgUrs+5Nx6Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm8lTSMnI2sEHz3cmuMW9P46sbISZuzDA9AR4qpDQ/+q+KBNfP
	J3t3uG5tt4H7YE+h20gQ11v3QWplrsyPvwVzJsTq/b0xe7THvHWeXzubLFn1ZR89ARUBAJlQ9u5
	oXCtn2MVrCDEKcrSpjBKndAz++hGLzGQFA/5N3Pq8urvmVbwZvc/4B/KNFw6qSd/gRVgy3TA=
X-Gm-Gg: AR+sD13gjr2nlnt1VT2+niJPK8lojvFMbkE5u2J0nCuHkJNxJiVHTVKnHCrEqSDI+Rk
	i6n33ycd3MJRdDdEnT+MNRX3pRq/VoA+qSarP+dtuTwCm+1Le/z1zytxiIrqyuj86cWbs1/Z2/P
	L1Rzdg1rRWqH2S0lEU1OOf/jfgPmklifRlOSwdFIvuIllMZqSOTkaXLMBojDBF74j8S1DALpZ62
	azgRwU4CVz9cVkJson+/vSqMB2RsnBeSUNNB4W3qDloXxqZi4PcDzI+gQEEKpOouKQYMwIFF5Va
	AIUKqljyOjWI8RIlVPzA62tEg7Yubqq7j8QwlGmVXyQ40ZdDEly+McgQihgTTSbpkC9GnRQaJhm
	ZM49/1XptsU0Ht2NwG11iuCK0M2dMZD2SJYRliqI87BzVK62cPa4WFTf1/9ySKxkJ3l5abdR2+Q
	51PFHOY6TVcXLMrSlacRRgTiVI+g==
X-Received: by 2002:a05:6a00:2d8f:b0:848:48c6:480c with SMTP id d2e1a72fcca58-84f2e00e9ddmr45265706b3a.24.1786375484257;
        Mon, 10 Aug 2026 08:24:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8f:b0:848:48c6:480c with SMTP id d2e1a72fcca58-84f2e00e9ddmr45265660b3a.24.1786375483712;
        Mon, 10 Aug 2026 08:24:43 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:43 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Mon, 10 Aug 2026 20:52:12 +0530
Message-ID: <20260810152223.3946743-11-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79ed3d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: vJbx6dkBO7cEQN4EQVJNnZEvDlGW4A4Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX/02fottOmzO+
 zLpPJ0zsr6Drz7vPdwjo55cLm2Ixcsdsk5k2ZB8kfetM2fgYn2c13/QTVzr53L6HMqHSt5UpQia
 ipgIH/MioMdYdnfIZim2V6pgr5jxlUtkoQ3I7OoF/kPOfBTVpL8NcrgDj8rln85lPb2kGgk/hjl
 K/1rkhOGMkeM07KudWKuEutWC5uJh3nLSTuQYKVQBXuPnrhct3AyeWZCnn52D5J9Vbm1rzeRD3d
 Zmw8V48ab4qjgQELu8Pbhb1UdDIIicOjWyZ9CIt85ZeKwHDAbcr2uXce3QqOpMpcHT9dPapIvFt
 /qKCKwDmkEEckp8rVUFrBhPJI8+sTp5DQUOZils2cRr6LsGHXE5aTJm6TYO9slXW7revXq7dMdX
 TDxXDPVOriW1FztHO7M1vhZUOT3xqd/DzCewhl9VzorLvl2h1wqUzyAaS63lA4fT4NmJF3EzyOK
 V6Z9sKnyvPdTNMB/Ftw==
X-Proofpoint-GUID: vJbx6dkBO7cEQN4EQVJNnZEvDlGW4A4Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+AzG5HGVPTJG
 ObCZhGGu72JoNAVBaPjX/KU3wi/5I77RrQuj4jEJqJk9B3jMcVAPREO1XQ/8LTKhOmHLu6wCK+q
 +eo/G/kFG7FcBEjB03C83lxBsP3OI/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082446_914529_1B8697C5 
X-CRM114-Status: GOOD (  12.11  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V ramsink trace component may have implementation specific
restrictions such that the component can only write trace data in
particular parts of DRAM.

Enable DMA_RESTRICTED_POOL in the defconfig so that dma_alloc_*()
and dma_free_*() APIs work for devices with DMA address restrictions.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..57692fcdbb89 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -304,6 +304,7 @@ CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
+CONFIG_DMA_RESTRICTED_POOL=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_FS=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
