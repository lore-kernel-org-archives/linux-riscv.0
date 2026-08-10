Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C618C5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3gWRgdZ8Ojp5UI+0y7NEsT/IzpNUFMNDunfX9qOIpw=; b=cMh+QHsRZdQ4+K
	/mfwjqmADkdAdqgLQq57Su0C+ZLaBzXLjrNpKd6H0ZHn6Zak0n19G1fDC1WFnoQ4LFH/RhbWCUcvH
	dKGZiGvYFeYPBwkg46+qTpVLR5+K9hRWRaMv7j3QyueGbwMgEiaaeqk9u+FmZhtB3aoKn663+xBW9
	nemgXxReBjM1vNFGOYvvYu4gtd3UYr2qmEMLfmCiMUoqYGuZH2CrVi3qjSKfURBC1jUUeziyP358h
	zsCF0vW4l2dPo+Fslo3oTVPiGNwlxh+37dyQ3SkqpXaya+MpujGmGxvv158ZP6uHtq+RPs8z4FkV2
	NPrf79X+QlSp/QNJXgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRsR-0000000CFdV-190x;
	Mon, 10 Aug 2026 15:25:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRsP-0000000CFbT-2Apq
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Aug 2026 15:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZIMIvoLDAmzGs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=; b=Yzp+8lhRONwooBCD5cpRBgUj6B
	oGXRruefdbCQ9lUxf90LhCjrSgVV5NlgvkBP3dXSuzlgJcfRs78A88YGUJo2MObQOKwnml5a+rgbb
	pmZCcBbxDV5d/4ntEbslxYISuWu+Z3l7zG1On63NAtT+XWifAPDTmV+sOMhAX3FV/NAgRgOceso2h
	DnWGWShzkB/vJmS8I/0jLbYOuVMKcH3oEHR+bj+oRW7/qRNUugomXycVdxU8fJeHMh6i3rIR9uJib
	omMvfjFgFm1D6xLAWtzuO6YVdtSeopmD9OzPF4ugIcN+GuFc+LaTrF0M+CsCg7les+mmRdQ3xJ+fi
	FbJ4qpNQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtRsM-0000000DwFi-0Lyp
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:25:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj1E51671325
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZIMIvoLDAmz
	Gs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=; b=hsXWBSZPzmOfvUbNZ2knXrbQghi
	KaYk4x3ME3vAAzwxvjQiGEBt8q3lPzTjE7p1Wq4f+hI2Jn6DxT/94lc00j5U8/Ni
	iwoW9s4SPjn0A2c1wjtE9lOCB+idkdSfUY+rOfxU5jUhHT6etj3d7bJpjFI3fL8f
	o3QuYWi8Ys5E+Otn+5AHUCO9vhAvU4xyg514dvT4vIyKXC338Ov+Qy5gHxi97ckT
	VbiBtD7GR76bNzDlXj/ga3/aWnEWE+cXKoQJ+B+imm09ksbUnL52T+1qZd/YGfY/
	Jyy/vDGZVBrUjIdhn5a+nqmaYZP74Xl3/zCiAuz8xUhFFfFe3/T5w2WLbqw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v2aaa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:25:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6dd278512so1507171a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375515; x=1786980315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIMIvoLDAmzGs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=;
        b=iKVVyZjLs5O6v+lhLmUcHKq2YP1wJLD8Z9qanyW8Is2PoUGPOksY6PiM0oETttVVZd
         jhCRlfCEf4Q8DIt1voqpvLOtZC9WyHu/d40ACtv5TlpTPz4KsymtKBwJ3KEGfeDhG+1e
         dTchoG9fZG55KhvVm2gQSVj8QhYY+EiPmeAFCoBKlygLtnBMOM27ESnZSo0Ld5xb9b/a
         V/0uBZo7z/Y/ECC/dAh17BbJfr6c4Y8OmFYgpeLcDxD+3Eb5D/N1T1lC8H++0A6i7np5
         Z98zFElmcxHQ8zfNYXY1pvpUGJmOxUs8sG3Y9F7sbxH3E3RyFd9LjopNzV0hn13IBzUl
         s9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375515; x=1786980315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIMIvoLDAmzGs9DS9cbp63zT/hFrfy2iRoEFdcbPmoY=;
        b=rdr+FZ3lFBfmvfWXbcN0gIwwXecBBR8flobleNvaY34iQz4y7gd5lVc/gLD5zKyQdK
         pYKT3OBCzwQyWKlYQaPUHzffa3z6zLB+XZgSKwVzl+J/quJlY0I16UE49ScG+UtFP0kh
         C832ZoY7T017LAwROZMWJOHwOrcgBR7HOtEdGDjQIaVPMvVYpoBsRlS/lcrdSf/GHf6s
         DbYJmSuWYsT1wMuxD+VbjBH/DKNnl1FhMx7BCzBWeEA7NWn/xgx4wgWW2simVBcDwbGD
         LMw7L4NUU+c98uChhCiLH7LFf7JsboOX4/1IdGiTv5O/UpMAZhjGhXm0ezOau7/Lk/2g
         K1Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq13shcmst+TsGYai9gT4T81vfOnVDVvvysdQ4/NA6eUAKcsqddu7DNT6pKUTG3yvoe6/zpCrICXS+XMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVkCuecPz6bTxlCXdr9Rk6DCe/SBW+dBpLBx3mJ+kNW+Sj0YUj
	wGfA6kEIs4a8nhz2Nlg9vtQiJtni4CR8Tv8C5UAtN6tKrHeN+iTq5WM0rvJ0GisSbieCV/e1pfU
	kTXAJf+IpBUPBY9jTXCP2yDv6RWg+odGRO5rxuT4IvWpYqk1tbJc3+eHEprAfmBY+UJavnKo=
X-Gm-Gg: AR+sD13wCFCr5G2TyByWxLvIl9rODpcp74CgEBzEr+h8oX1Pn0nUaY4UH+Di/FxTDXG
	NpQC2Ceg+S8F5uuQ/NKgrI5/ho7ld9SLyE8HtfShoty1km0Wy42p9ih7J09yELzlUB+mOZQdaI+
	Ddx3FJkbC4MqzRryYxCpfrtzgi8eoNjjPTxM46q9HsBPPb1+86h01AK/dUF27+OPKmy9YaJM6Ec
	prdC73xeZfl6pm/kkfUaZGNA7eaqPRX0ppEICVKZvXxm5SvCGpsUGd7SvpQFX0gmFZ/GrLwTkZV
	t0SZmUGZBXbCOMPoowuFziBHlNpRebahtPwzpL7Z66Cc4zQCKF18+jrVZ2ZnVLZ+zs7IAT/QCpO
	5bHYslaqyqoHZfox923NcOXhoKjxE83zbP4emeUBv7UDqhvdEOp+e1w3KmVvzIdtaKheSjI7ITA
	kXWglnK+FhzA/Mw2aKzwwK/mPwZA==
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cbadb35cfbmr28824069637.14.1786375514611;
        Mon, 10 Aug 2026 08:25:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cbadb35cfbmr28823990637.14.1786375514030;
        Mon, 10 Aug 2026 08:25:14 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:25:13 -0700 (PDT)
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
Subject: [PATCH v5 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Mon, 10 Aug 2026 20:52:16 +0530
Message-ID: <20260810152223.3946743-15-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=S9PpBosP c=1 sm=1 tr=0 ts=6a79ed5b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=bFCP_H2QrGi7Okbo017w:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-ORIG-GUID: FdMy_Rhk1CZpakTgaIYYDCMW3Z0okwox
X-Proofpoint-GUID: FdMy_Rhk1CZpakTgaIYYDCMW3Z0okwox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX6viS4ZKLXIOg
 9Dx9iwvaYAycCcoW/9Xd6qp8RYjiy8ZJedrmdx/4ogCyMCo0mb98H06aeZxJ6hb+Qv13HH38v6e
 O03+HipvjhPX4r6YKVOnOC92U505NYQn3R0Iypx5ySUt9Rhy8UPhUfCELUb/ce8ojTPFCtt6FAv
 NC9eomiaKezEY2ht2/UtlH2cHbD2+/2k+v4OdZawcZTm94GWlKjuaV2C7vTZh0WvHWMphuRJ30l
 lMd+L+OxF+EvZSbaa+dYAo9yHjKg1rZxrduzHmodk/aCF3QoIklhie0Cptm8xKImd57m3HOUJi7
 A5nr9vGhIwGklj31xGAwcds0L1wFShI/BEbYnKlsrnKkFDzub/q6FKhbfqpUgxDWYwSt6zOEchx
 NtGtFiWNIunHaYwHVNNAcZaYs3cSmRf6HU32zhNOLjXMl3nzjmKOGE4rikvT17D3kCF345xdA0U
 bSI0Wxnx7h0wCFS84kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX4QJdn+DnAte5
 QH3byO5Dcswk0OpuVQZ2U2gyhKgK8LiK9G8Bmaa8NTvHre8e+BSjcIPOl83WVD6GCorCdo/tNcp
 ofophThoo2DCkFgrJ5BQxdNaY770CXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_162518_442033_B0DFA5BC 
X-CRM114-Status: GOOD (  11.32  )
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

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b592cf49746..904392530963 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23359,6 +23359,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+GTRACE FRAMEWORK AND RISC-V TRACE DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/gtrace/*
+F:	include/linux/gtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/gtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
