Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB11606A327
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMppejwI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bDMNli9R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=St3A6Kv4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3HpJBB+m+5J14fxP2y8mPdmVYuo7h7Y7qwh7YbHXHnc=; b=cMppejwIJBbISqELxl2rbL7KMc
	f0pi+yM4WoPsy8vNLEVAhhKj95NgTpu9Rb6aXHTFLf7TL40dgQkVCvXY6tdMwWY/RK9TQsR96uFrQ
	/4qRWX7GdctFNJiTzlDBDfw3W/roTORt1n3kJjGySA30nPHRNXREjVcnVXP+1avoom2kpHludV1kC
	/gkf9FP0m8dawTpqE0t38d80bJju6Y1tgGyxoCTfI3Vywca6n9yJlngcMLBS1BbjqKur2dVR6nQWN
	1rWNwM8hE7dQ6HPxhFXLI9q0Im4ViB3v4ns7ZRp50ZDVHnJ+/6ZV/pgHQJC0Nb7MC/uPTFy/yRsxv
	ozj5H2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEF-0000000CfGJ-2EsO;
	Thu, 26 Nov 2026 09:57:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWED-0000000CfDj-2NF7
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:57:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BLJS920141
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=obgiFy1H0lI
	5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=; b=bDMNli9RA8rApI9q5re75anXk5a
	A8vVmy5/Ry1dOvVyWwbltvqRODvnqBZKTcWEZDM0WSAWl7xb+x22KyBpuQRYEGKY
	NnoFpJWWznUEtYd/5daXt8S5ZINtuz0cbbEXU+/uEaSJqZvG3FPEFB8QWRPDyrZd
	Ktu7IfFN4nguumWel4scsmk5VFkuSKpJhNRlWJKNQBG3Nu2Bk8S4HOh19Gy/fyZx
	gUm4A0htHAXGpe9klBd3AKCARiZljm7Fo4Nlhmz/OCucfaeLW4OJtwfN8t+3ySfd
	5ijlP2wDjA1mg3F5Wvym6mgdVu3amfIEkKq/5EL9+05DxTlUvIOIcmJ+gKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2hne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fc6a0083so5887942a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687040; x=1796291840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=St3A6Kv4oADC07WLZ9ZX5duWn8e98ofS9zXZ/dzrGn1lUGX/ndsaaCAlY4TsSSYHJ7
         pFSOwQnif0cZj3tLUtlYZ2enfLNJVZ/Qj3G47GKmg20c3CQOLum+Z2yuOja1ITs/CDeW
         4aHflvZekKcuuMXIRtEMXo2YAPnOvLdyLx5mZxqvJ+WaX27CeqkWRJdDXQGXjpOI8YLw
         3SmVIAj3OzIRzRYy2Yu306pZeyCeS7HunrhZwY+7YjaosUY7/NYorSgRwAiBAyi2atnb
         WYj2FwUEUxhFNcztMPR2BGopaAKfR651s8hvvyIvZfnm5XlqTQd6nyBDfjhpZk9mJ+8I
         diag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687040; x=1796291840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obgiFy1H0lI5H7NGxtwendTt7NW8zlTVxZLQefWj/Zg=;
        b=lVwPntS+vpmiVgsqObKVdRaypKLPIgJXbu96Y+JF4li98tev6F18ViInKW+L6sIQcf
         T9c6B9535wEiUcHfhPhIbxr6OsbwgVvxqNdCF+7RqGuHnSrRneKwXLpaKxApU1YbW56A
         KhC9crWxlaQREzRKPA/SORtvoh2SCOrVDL+2mA59suORvfQN+db4yd06iYHc3ABFW4Hf
         UHZ8Y5XU29cw1VH7NJ2MqkKziq3PzLUoVkuM+yNiTyu/AJdYEy5M3Lc1WcbI2HtqQl9Q
         4HaAxcn1Lga8Rd+vASXpDMHb3qCjzZgCVjPO+ZnIcHkYDsktdOGAV7jSd5hiv4F2LqfN
         n/IA==
X-Forwarded-Encrypted: i=1; AL+hErEPaCRklkDxwOX57NIX9tN8HeWBsPVt7S6RxB0QwYKExJYxW3Wc+Z2SVB9gELeWNwmsnxWwpRuAC1ntgQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ciDuW46lWyUru8Uaggspy4pIyHGVi0T7VtyA2Ra0Uowx8Qky9
	0Oj/CASGyaXbYPsbOoW+J31ikSjKZrLZXcu75isndHPOAxcbKWohzv1z6Jp9YHXYbE7CpbolO7H
	L3IDMJvsNnoGNQ4yjKlq/z8X2Z4KNQpX3b6K4si987wA2MtFcxX2yzjenvtTzbF7z5k1d3bk=
X-Gm-Gg: AZFdTZekkupSYH8gVemysaGo/TWtjqtHWXCWHthyKdHVXbFS/T0UDje6Dh+XCLQhaP9
	koE67Ngwkd2YxJR92I+iR2ApfWWYseYAuKkNTzdG+1Kk/H0YUPylNn7VFzyfbboFyiO7EL+wp1X
	ULP1I83WtaIsGFNjUOmT5S0ANx7bqS2x0C1byIV/AjDbkoKIQqgiL90i1KodTNtBKFkKYLPHZYK
	jMRzy0pfBBBdEbkqJQ9HBupiIba1sYuaOs+AB5U+/CaYaPlTcXXcohUXEk7YELFRqGlSy4gWY74
	3b6LZZaeWe+j+Kgq8yGEYRyzKaaz5JjZ0sGOC0Wv76/QDo1u8IsbwbU84tb1DYy5hG2hPFFvRO7
	sAJzZnx5ZWOEmp2qTmyEDFjswkBnZQmMh4tTBi2+i0zq9tgG0wIlaiyjAzsm5/Q4EVv4t8gISWs
	bv66zbJpKPOobZa+XIYsgMBx0f5QhNcVm3XaJr2fkFLE5OeLEAanQVzmKoK4Ggs19CwEEN6MIxZ
	Q==
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167405a91.60.1795687040427;
        Thu, 26 Nov 2026 01:57:20 -0800 (PST)
X-Received: by 2002:a17:90b:3bc5:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b41cb3e213mr18167372a91.60.1795687039952;
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:19 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 10/14] riscv: Enable DMA_RESTRICTED_POOL in defconfig
Date: Thu, 26 Nov 2026 15:25:31 +0530
Message-ID: <25bc9b86281e3bee6ed8140e56779d38ca36b1d0.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+BUj2g9jmw2Z
 ml2qRn+0w0DU/iL6UZaxDHcA57b1DNzBGh7oW2iWHAYoOyjefs+UeojIq+4trdUxkfYMfG7jxEH
 UU8qi7ehT94fKGVnmoSAzgmiovXFQ/A8CdfGiGOPRJiCotw2AvIJ6o6PI9DjLz2q3iy1Ez980KR
 +l24ygNtlVbz/0Z9Mn4wd7qbd0IsfMUnsrci/gZnWeT6ndpq2jrYa/olN6pDJ7jXOOM95ql5nVw
 bbp/Z4S4nU+SX6xVNr3kH2PrNtyfA6ANT84uzYbvB8+1Q1TyknCK4CG3M5+g+d9Zga8gjEVeyzp
 ZtjAgwW2R54c0oVtpsk/6AvQEEyN5Gs4Bt9VddVXfqxPzjIqxdUZfmTomu9PViv2iydyuq7DfHg
 ArHwzV46Q4B0mwpQQ2uyIbwM4pJhzwkvLJ1W3DXTDA4yTQpIftprx6NV5BtbiowmpJ1oUZPiifm
 hEdYgZw/omLrC3PRoRw==
X-Proofpoint-GUID: LvgNzLDEbPICazR-Suh9Osd7DreTW-12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5rZBZPaMfJw/
 GDTEeotRoBtMLj6zd7cWXw8s7hfALhYXyUR6g6xhmkG+RgriQxpYea5r1Ov2EkI+ZU3CKUm7f7g
 jVOnrZbRHLi2OwFM5OZn2FwOoF54hhg=
X-Proofpoint-ORIG-GUID: LvgNzLDEbPICazR-Suh9Osd7DreTW-12
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b080281 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=GbvFXuxacV0FzgsEJgAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015721_618518_C8D4618D 
X-CRM114-Status: GOOD (  12.43  )
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
index 383fdd07a99f..af2852687dcc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -308,6 +308,7 @@ CONFIG_SECURITY_APPARMOR=y
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
