Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15FCECD9B7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mx4SadPGezsHHBR8ty/jmaLPvISh0Ne2yVkENWvxJfs=; b=G1aHIB4rjq6IzA
	P80aKroZzMMgst4CKxTmUN0HicIBBMUejsnhSx3ug1mstPgRXxYfO/IpepajPOjviun10YUPZzMlb
	lsxmDOU16ayqwLwrSwe6A31lFzZi/EPZkHQa3mHuwXEEt9+yiuhX3Wp76TvT4WMywdGdJZ1m8PT//
	quTOKKCCNMu7B7I7AaUDKBB4S+Nrw9FgDCClm4hGwoBNBiOTrW+7TTkPO+9mgUxVnLGGSFT538P5G
	ZGK4q0uMAkQjs7Hqkcb4dTXAa3yOGBS/BuxinYCTt2qytvf2XpnYT3NrMRvgKL3HlEut15ic3xbCC
	mcyg0kJTLNbCGPki0BgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9db-0000000Adr8-3GMv;
	Fri, 06 Feb 2026 00:23:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dZ-0000000Adpz-12uj
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:23:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615JAriZ4126723
	for <linux-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xegBm8Ht1K+rohwyqkHn7WCR11J2WbTKWil
	8+XhbjdU=; b=BFjRJW3FJaQ/nbEJPseoZgFmP7+Xe7HlyQCDz1vhGNfr6eT9VR1
	jpJy21+UNK/2+7EOCNfyF+Grf6XC04WtjUouceaYNQBas+FI1BSnuZJeaheixoJ9
	AH7FGDrxSHxq20z60PE3QtSAlrxjgSCp+Wb3yvcCUuBFD+yStmRNmpe8Xa4ilLrO
	X/Ti8mPn391In3mKT+gqfjQtDW0yZLGgaSKQloJOutJaOQ3sYsMzvVrCgUamkEV5
	ZK6GrMee+BQexCG7MJH963jnfHcKm9MBbFr8YDm4IGPA4iQohj9BgDCrz+MOVc1N
	MN8NILXXwYIsM0lAas7d+7U7QNztJ7ATzDQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8tc23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:23:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12339eea50bso751136c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337432; x=1770942232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xegBm8Ht1K+rohwyqkHn7WCR11J2WbTKWil8+XhbjdU=;
        b=DvrmN37Zrpe3g3GDczFUZbKNijE+tMWL2MXzfQfukIHmdU6mlXN7SIN/p1gpOtLJvV
         jmYYxsrze4XN7HPDfUbBm9JHuoet6QvVdGczCWJQaddUH9Yv6ULiAgaT1SN+55h7MXBR
         /i0lvD67N6dKlYaEE06GQTJWZ8Ncpn8JHSPiFRNByDGR6P2Dxa3jdgeWgN1haqFsETYJ
         6k1VjvsOxEBSlY7RpfU5/7kyDreRzZm+GdGRYJ3fkW62h4hBEQOBPBJ1BGdYfk9DvLN8
         1ZwVL/3wUUQ7LOykSurIViLqQ8SltAbX493tn9I/DqeAp+1dpwRkJnx29mxmpFo4zaxQ
         sIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337432; x=1770942232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xegBm8Ht1K+rohwyqkHn7WCR11J2WbTKWil8+XhbjdU=;
        b=ULtGS5clXaG+ITw9JhZgAnKWlHbe3zQH4p3pwrmqorH4hd+wGTqohJi1OwS0DdkLXE
         E+2EzebHd32SAHyFdkfDfZ0E84aaSIPH/5Cm4QTU+IQr6zzggkdEbLR3LglwOKSxMWLt
         Fgv9R5LQUzr3apLkom0JFGZCQils96ABCLLOiAI0GCu1BLEP2vetCQjqnIdSicH1ZRE/
         LTHGvY3jPyxThjALrUwAxPh8rfbexWRiNzqKqsTJQImMuUHPCdp5C1SEZa4lDg5PkZrX
         WebWQkYd5I2vLpkfzEY8lo6cZMOwN+hC5PXpoRcDeCJ4mq9tzQQVFyOl2YhaOCwiYbbu
         R7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVASa7fhD9wqrnheaVVQNbXhtHqzM7Rh7aHD0SvoQvRdealoeqrLBMzmACAKotDDdnnJwUSsExmm0Phfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZC8hfUzvhn6NY3avMTvWfr86OH9vHe9Hjqv8UKKu+q9VqeYLr
	IKS0L9Qxf8SxigbYdeRkrVMlrGUeMzTquOvRn/5fyFdC/h2bAartlIwjkIwnNZbz7ZXHlmZ57x5
	8+ODRZlzfrcyhWwOxCJlptdZT3qoCoToU5GTiPiqNn1w4NCoN3O8/2Shai0zBjjGmBXQ4X/0=
X-Gm-Gg: AZuq6aKit2kHTwwQpLuLvQAuJ1cZk1vNtbHnfDC5schM+Ef4n4uKz+JtlDqSFNpMRUg
	fGcQ74jZeUiWU81jTjyB3ppcisP9c8LZYan2Dp5UidwVwB6w0z+7ZCO42syVrk6sGMBDgtwZq+C
	ceWRPCVxiExUr63proSzP/T/5PtOcBS+ReZHWfF15FTNBu/miRNJct067Phlsj52xDsMfj/J7jc
	892u+Nf2erjMMfXcr+3A8ggBv4l5NbnJR1KxaGXlrMSvMi45r3bOnt0iZP7T42GyYxMl5joACQv
	TvaQZt++Lz4A6cPdD1KMKd+OVWpXcvkr1TgZPMOIz21Xu11osj+f6MsxuWQpRSbvKIllzyDtbIo
	RIuDYRFDnTXSLjJkqcLw=
X-Received: by 2002:a05:7022:62aa:b0:11b:d4a8:d24d with SMTP id a92af1059eb24-12703ff2045mr430370c88.12.1770337431922;
        Thu, 05 Feb 2026 16:23:51 -0800 (PST)
X-Received: by 2002:a05:7022:62aa:b0:11b:d4a8:d24d with SMTP id a92af1059eb24-12703ff2045mr430344c88.12.1770337431386;
        Thu, 05 Feb 2026 16:23:51 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433ac00sm575694c88.9.2026.02.05.16.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:50 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 00/11] riscv: hwprobe: Introduce rva23u64 base behavior
Date: Thu,  5 Feb 2026 18:23:38 -0600
Message-ID: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=69853498 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=8arYDEdLfb4oE3fV1TAA:9
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX6OBakk/woyrV
 bb1LI6B2lU80/2Gfobnqi44/+0Lufi8B9qfkXvmvobkGPhPXMD8lar2XzrIVE6Xbu7bJF6/QsC0
 57EM+5YICn/4ZWkcIZXH/VtYshfTWTWQ1aXqpAn+sKzg2M5OhNRkUR/9r60/8j5yJzH+JhOva3r
 kBp98zv3czPYYExnc2sfUOLGJ1n3HF8Qx55qrbMNZic+R93O+bHVkLkGVD4Rnf1MLpjwmq0Sa9p
 aBQ8Z8PCZaykwbOLJLtIJRM/3Hp9uV3Ozq+xVJ5TcRuoEnnb7S48nBc+AiBlXe9kBQHNGX8JvBL
 Yfc3vWX/ieIJnC8nC08yN3QfUqGr31Uc/TIdaWc+n8kZv8Dj40Kh3MdlORKZzoYtfvF0HaZox6m
 ks/HTQUhgYDHRhl3sinIbLoSe1BkoenhCQvMoDFveUdlZQZy+k1DD6frbEgcJRPIZ+v+m8UcsCs
 mf+VryKnkDZZHVnFXPA==
X-Proofpoint-ORIG-GUID: KxX_Ohl2avEoMngd5_9belaZvp96pEp6
X-Proofpoint-GUID: KxX_Ohl2avEoMngd5_9belaZvp96pEp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162353_320606_AA4BD1FA 
X-CRM114-Status: GOOD (  13.43  )
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

Users need a way determine that their harts conform to rva23u64 that
isn't error-prone. While patches 2 and 6 make it possible to determine,
it requires a bunch of probes and checks themselves (see patch9 for the
recipe). This RFC proposes adding an RVA23U64 hwprobe base behavior
(patch8) allowing easy determination. It also proposes adding the bases
to /proc/cpuinfo (patches 10 and 11) -- but those two patches are probably
even more RFCy than the hwprobe proposal...

The first three patches have been posted previously by their respective
authors and are currently under active review (except patch2 which
appears to have gotten lost in the shuffle). I've collected these
patches into the series since they're necessary for the base and
because I wanted to repost patch2 and patch3 with some changes. patch4
and patch6 expose more extensions to userspace. patch9 adds a consistency
test for the new hwprobe base behavior bit.

Thanks,
drew


Andrew Jones (8):
  riscv: Add B to hwcap
  riscv: hwprobe.rst: Replace tabs with spaces
  riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to hwprobe
  riscv: Export have_user_pmlen* booleans
  riscv: hwprobe: Introduce rva23u64 base behavior
  riscv: selftests: hwprobe: Check rva23u64 consistency
  riscv: /proc/cpuinfo: Add rva23 bases to output
  riscv: /proc/cpuinfo: Also output rva20 and rva22 isa bases

Charlie Jenkins (1):
  riscv: Standardize extension capitilization

Jesse Taube (1):
  RISC-V: Add Zicclsm to cpufeature and hwprobe

Paul Walmsley (1):
  riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1

 Documentation/arch/riscv/hwprobe.rst          |  42 ++-
 arch/riscv/include/asm/cpufeature.h           |  14 +
 arch/riscv/include/asm/hwcap.h                |  23 +-
 arch/riscv/include/asm/hwprobe.h              |   3 +-
 arch/riscv/include/asm/switch_to.h            |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h           |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h         |   9 +-
 arch/riscv/kernel/cpu.c                       |  38 +++
 arch/riscv/kernel/cpufeature.c                | 168 ++++++++++--
 arch/riscv/kernel/process.c                   |  12 +-
 arch/riscv/kernel/sys_hwprobe.c               | 249 +++++++++++++-----
 arch/riscv/kvm/main.c                         |   2 +-
 arch/riscv/kvm/vcpu_fp.c                      |  28 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  22 +-
 arch/riscv/kvm/vcpu_vector.c                  |  14 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 112 +++++++-
 .../selftests/riscv/hwprobe/which-cpus.c      |  20 +-
 17 files changed, 610 insertions(+), 151 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
