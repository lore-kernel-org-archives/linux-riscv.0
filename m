Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6131EC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 01:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AcpDDYO4Mp+oK4D0UxIXAy7WQCQJG5Etq5eUA6Gx64E=; b=asdcWlcKYJ5ozv
	OVn/mpxa85bTXsIRX7+TNkx6aXUHLlF/jPkPffBwXYo8OMbpZWxWxeGakmBe772EfeSOlWTmnhVo/
	MCzj1x2UaKrVHKXSzNU5vcF1CP+Mvw5R7oJAt9wjbqTeQrydLEbrCuC2mjnxFBd2prwcobVeLcoqL
	Uz7fNyMveG92HZhws4SNiiA8kD/O85p6mWDi/Dm8N82l5B6rMaWS1R0Jnj9qYSyqcaJV86FL1lHIU
	tl8E0oEyKsLjLqNGNB9a7ZSTgMz3xcaBxZFia3yXIGoqj/Foe5HYdRaC82zOsPoBgsWj64wydkLcK
	Coq6T4EZMacpGmRtHZLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWY-0000000DA6L-4A7j;
	Thu, 23 Jul 2026 01:46:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiWX-0000000DA5E-0ggk
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 01:46:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WqUg3534961
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PAtArUaUjCVwjhnUvEpSOR
	EWwbFp3QpDYdJcjV8SPts=; b=hsHj/hdNFqoliwwuKr2uE7YRIWsym5fb8HDzHt
	PgJ5BT6E7ecdfBn5CwDE0BulSxwB5OFqztmKzT9wnzRsej1kn2NLRnOox8rw+X8g
	tglTR2Y9PdiCzW+XGa9oMpJOQHk1WedpslDwrIoa001bPZAu3ew/1WEcbQiDZ7Dz
	xS0wznE5TWRgQi2D1TmeEbO2S+AG2PCQcAbynF+MyxWfWij4/drEyHU2vo4o0Sy5
	F6DuqmjuzUKZUlFCCWoBGtqkA8YE0VCV/77Zgo709GSCxum48Yk6borHLM2s0OD1
	DdFVmcoXsP2AtqFCjzEu8eZbKWgO2um6PikLN9bkQElKchyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsmgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2026 01:46:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso2725755ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771215; x=1785376015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=FYb1QYtnwhhiNM8t2McJmRdiFvnz7nDlhHSuNpQd8ixmIUe4O+14w9HxzRfd6w0+vX
         5BHxJiJllleqKzy+XxdhLHpHxZS5bJWC7EN45WMw1Fdy0m8ws+ZT7pfBBK1PhVX0/1am
         cQccjHG8+zH27ruWOQ86LV5pn5Kl+/TrBJv31TLf/jo0madziv/XSXa48MkY2uRTNH/Z
         J+1jI6x4znLeFOCIR+qJnpEZMewbBclal76/jJ2VKATpxR8GCHLKrrDwka0uY7acDSyl
         g78RXcFVM7Oe1iOhX5oq8ZxjRRucnSjGjrshJ2xIP9wGSAyMcZIgKuiA3mYRGaPLyGqf
         slWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771215; x=1785376015;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAtArUaUjCVwjhnUvEpSOREWwbFp3QpDYdJcjV8SPts=;
        b=XHsiprvliv2xf6/6Fnh1fpjpoh2HBc/Nt0U1+G0lqx8RNZpObc//Ocip98+jFe32Rn
         ezY4v8zg0jM8aomY7els6qSR2ou6aqpkeuQ2KqirNyKUf6KZk/qfcEEGRl3zSiXvmzuG
         4UwzSFlEb2zxKa9lJgy1Aezq1Cq/hFAZi2e5m5Cl1HXhC8AVtoK2zt8WPijFyGbLO5V9
         7OYzw58yFZQj04huz4dLrqj/O9VuzOGnLkjBXgLIaOZV5Z/MMpPjl7hJ9Ly+TLPXeutn
         80//6Q4nmdHKir8aGeo583XwRL+7jdNZIeHbbfcJ4tBTeM32Ew/rStITjntp3O5cA8vy
         Gdyg==
X-Forwarded-Encrypted: i=1; AHgh+RrwUK8snYcBATBeFD/PTEelebOoPKKzzzLkNJYpikM5nlhA1b8pTH56rYtM8KNprq4kDocEZjsW8M9VbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/syCCfU/ZOwkmAVgxZn7JipWpQPt+Lswm9hrjnH/VPWjwjIxp
	bGKRkME+z/Zc27xYT42PD1ZIqZQ2nCxmq7d9e+JGOIvAeeGwglfvboOsXVqgpWOxwhCLpu8eaak
	Fl7fNEqSDNi+pfrTdbPDW/ciTVbI4HxREoL93sQJNdKHgVHN0jy4pE6D4KBEwNLZ75uFJDm6pqQ
	UxWTJ0hw==
X-Gm-Gg: AR+sD13DmRrOTqBCIM+cVmzjFOuoY3WR5MfkBOzpPrfs0NY+xFv46DgVOH2XlNlF8NT
	YiOHxNaTYmz4l4CnBjtmqq0ZvaKKdyNlbdNRI51Un70rfASQGaq2lZ775fE6GccmiDy8Tbjredm
	DwM/ccU6xbLM39DUnROQpgi2JdPmFg9CdqGzB5jArJbFfLS4luQMidYDAqD7vUZXKe/MZaYlsBa
	HA3ghp5IU7tZz/VY9ql9Tnj15MyBI14HfgtT8E+taWCw1Gritg0/j1vbSNjRzkZYR29dwRf1CUt
	k5lCFOgqWphiGLbxc0JIK9sOZbX4B4xdfiPn3o3LRrx83hinir9c5uwVt2CXQu4v9rXcE0tb++K
	w+JFjicEOp9Y/LervA5B3SrJLhM1VyVEEtX4P8XDX3EdIrgAOH53+q2PYa0HTh90=
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371405ad.10.1784771215021;
        Wed, 22 Jul 2026 18:46:55 -0700 (PDT)
X-Received: by 2002:a17:903:384f:b0:2cf:9c35:82d9 with SMTP id d9443c01a7336-2cfa6b7cf03mr13371095ad.10.1784771214591;
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39e9sm23389995ad.10.2026.07.22.18.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add CoreSight nodes for Qualcomm Shikra SoC
Date: Thu, 23 Jul 2026 09:46:29 +0800
Message-Id: <20260723-add-coresight-nodes-for-shikra-v1-0-992615f9ea15@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHZyYWoC/x3NwQqDMAyA4VeRnA3UqpvsVWSHalIbhHYkYwzEd
 7d4/C7/f4CxChu8mgOUf2JSckXXNrCmkDdGoWrwzj/c03sMRLgWZZMtfTEXYsNYFC3JrgHHuEx
 hWEbXUwc18lGO8r8H8/s8L/4DGhhwAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784771207; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bGlwfuxl7Ko0KTHUMFRKzd7hgfPMUkhhLFboxtPnpwY=;
 b=lNXsfr6unas8t0WGnGVH6FFRT2E2JrcFsxQ1zu/r4zI8lMZL1jtYqEJZtZ8Cic8zE9L822GMR
 thmFZsMNnodDNh2eN+6j1gPSQbHLC79KlUPQuzhK3MHc9uXMXVY2pvc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: p2W7wlIkeXcPLa2B-v6cPPrDMKJ3bYv_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX7VnQq6Tl9u22
 a0QprB7RkE/lbwchvtgHoGmyMC5Oi9hlsd1AqT2HcdUvvE5eosQ76DpEOhKIrI8yeReOB7/MLjy
 LVvTFTRGG9HDi4stSlMkmUxDB8erPO8=
X-Proofpoint-GUID: p2W7wlIkeXcPLa2B-v6cPPrDMKJ3bYv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNSBTYWx0ZWRfX7A37SUel0E8e
 iJnTNnb0Pesle5jEx1qrlI+LthBMy68BakSHFH2zVGshQ6MLXp5GBHcpX7lJE76CVaUlDanTK2I
 pNjElkp5R+Zx1nNO7SKbokchvVPIiVVaz2ScgTj+2pzbZHwJBUM4lsT+b7GzfkH94QwNrXGyQ7q
 t+820d8c31NoeBhpdbmvHOPN8U6SAqX4fPqS4NMnwIfwmCQ1S9hMZlNQ10av4oNWxvGqaiWxUHc
 2SXku2shbG2L7/MLJidoSJs+aA716FXUttqAsCY7Zzj3OClhNJrJVuFyzba3OAjKxKdI27X+Pr9
 xd5PeW3+VnY6SUJGjsQkDu+qhQk2rw9xB34tpwyz2tlGwt4s3O4hTwilCoQ/KaIx3eSNKW7fyK2
 9kEbNKrNFIb32NLHOk7CedL8jJXFnROCDLKwL5Ru2B76KdklfjHSGyVj4eSOleDFbCijmQz7uUf
 fP/TR9K0SbdJr17mcBg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61728f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_184657_201749_3BC1154A 
X-CRM114-Status: GOOD (  15.09  )
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

This series adds the CoreSight debug and trace subsystem for the
Qualcomm Shikra SoC.

The first patch adds a fallback compatible for the Shikra CTCU (CoreSight
Trace Control Unit). The CTCU on Shikra shares the same configuration as
the one on SA8775p, so "qcom,shikra-ctcu" falls back to the existing
"qcom,sa8775p-ctcu" compatible.

The second patch adds the DT nodes describing the CoreSight topology on
Shikra, including the funnels, replicators, TMC sinks (ETR/ETF), STM,
per-core ETMs, CTIs, and the TPDM/TPDA trace collection blocks, along
with the CTCU and the dummy source/sink endpoints that model external
trace sources and the EUD sink.

---
Changes in V4:
- fix the wrong subject for the dt-binding patch
- Link to v3: https://lore.kernel.org/all/20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com/

Changes in v3:
- add correct subsystem prefix in dt-binding subject.
- Link to v2: https://lore.kernel.org/r/20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com

Changes in v2:
- remove MMIO for the ETM devices.
- Link to v1: https://lore.kernel.org/r/20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (2):
      dt-bindings: arm: qcom,coresight-ctcu: Add Shikra
      arm64: dts: qcom: shikra: Add coresight nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml          |    1 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1295 ++++++++++++++++++++
 2 files changed, 1296 insertions(+)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-add-coresight-nodes-for-shikra-5fb8a4b503d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
