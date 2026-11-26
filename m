Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52417606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G3o3wc8r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHLx2Vr5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fjB6+Q5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fhqdxNdSbPKL3sQp7gych1pphJpe4BxaFBHVmBgIBec=; b=G3o3wc8r4TWRk2Mm3fDwwOuHXu
	a5zG7bZ8NWhjwpKsOKkvLGpj+inGkDrQuGH4OPvRC29h0hlthaU1rmqcfSHM1dBwMdRd/HZ2do5UX
	fYW8ZLmbpPZ46Il9DRhGS4UiwT05pjTlwPLk8nEK984rfxp0qFvzKYPn0hhjX+/jI5GttgaCiERPb
	oiUfomoOFd2BJRZBrYfkXOGjBdpnikalcVniMfQDcKAP+UUkAtC4PFm8PZ7U9+cyC3zZ/A5/yEUjg
	ykVXbiZ9BXtSYOv0CXZ3HS+08dwHMp9IVGonNZOWacOQmzjmv9mgy7X38o/Qr8eU3tPc3imJ5cJlh
	iG+APlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5P-0000000EYkq-3LV9;
	Thu, 26 Nov 2026 21:32:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWh5M-0000000EYkU-1Vvw
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:32:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw89J2354100
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eLWydtdj4u/YSPsA6syueG
	uvzx4k7mkbZDaPefa/+TI=; b=JHLx2Vr5hyiBZsuJzQUDrQJ1RemrlN5PjwxreF
	ZUi9WaKWwFBGV03+KuFRyoeR56YAwuZyq3wIEAPSla7vczGG+ZdqPMg1QwjpGJ7g
	ClmtVgHHjpLNwLyEPGixVsElqiMw8h99DAFdpOXx8NWZONRprFrKEP05fgGjN/3V
	gDfTnAUzhe7NU8MRp5CfU5vX0mLgKnlPW41GSI36b6ETxPRPKiWIZXHsa6HnjRoB
	gFoVWJSsCsjGxDW2N2SKAW6yJUOsRX87ySqrxb7ec00NZ1fQDTSw/KvCOkAg+an9
	rqq2E+EQBfPsmogMKvcrEWYCTSU0AK6vFO2jo9eYyAMLezqQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7ttqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 21:32:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe8f2bdc0so57910575ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728774; x=1796333574; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eLWydtdj4u/YSPsA6syueGuvzx4k7mkbZDaPefa/+TI=;
        b=fjB6+Q5HETK64naZfthd9m78KI+CAVi/yCYoHqxYY+rwtlSLlas+p1xnFCTXYn3TP2
         td0q02taBtL51xbr7SxIixMlJW+huiX5dK0IrLq6IE0Ip191VbIbE3Ou1iLxs+isnjlx
         O4EAJUQJKAyNZfvq6wlku98xqs4XSxhb0gV5+ure8l9O+E04ceuPNWrThcUbSczvw923
         4VV+kes+KwG/k9GrDbY7onXbz4H7eMu0rjVNjetG2ETY4+yVTQ0RAi4+GZtigPF+hdjK
         bAU0+AlqNgzBGaTWLxVdCcv+hCHNoqzvheudLn+ecMKEy9K73bV4aWSNctIM54ffoS++
         E0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728774; x=1796333574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eLWydtdj4u/YSPsA6syueGuvzx4k7mkbZDaPefa/+TI=;
        b=ffbBltnbk8TB5FOnNvCMhamBqarNGhNiNdMpQZQ8X82Iziaih2XwbWYgHNMSguNyzl
         CtVSqcIiv4ATMdUWvCqKKteyPecNLSyZLZBScrx1G9FSC1+vaNw5tLCTBW0/05ZjII/o
         xzwo2FZRIVLvcKb+UjwpiCQf+Fp6NuI0pUTDJgR5aY/FEiT0rwx3IT4yrNOxk9eqs820
         n+O41rgW/pHPlH2fX4bQza07u2x0lQyA9iIxM8bMQsLOcLvLJNhlZgrdKkiWwFaOb69j
         aU2nKLsAjCnkvJAu3X2puqRH4WtZTsYp1jWEC+G+amFcOhQZYeZGwyRSUiLEAfG/y7+N
         wVlg==
X-Forwarded-Encrypted: i=1; AL+hErGkZk3NFAzeB30deGAtBtlLBLrf6rmoRpCHg8ugIfQLHaC2OdZbCKDRBLREm28g9eJ2CcQFdcpXB9yxEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Fqq19QOy6CEHau0ImyCjQCHosc277mplvBuP3ge3fy4GD5qPX
	5BkyfQ7PcFaN2JdobKSKBbzFw1HBkwh31WkZ3Ro9D0D64WQNofZYrMLMbqIvgbGp2v0jCsrDO4e
	KDDmXu1nT7nRofU1mSxY8Wiaeqr66k0EsjRoyO2p0SIk3bYFI1Llw96czKGGYEB3dJk5l0o8=
X-Gm-Gg: AZFdTZem92QVyC3ybwIbq67KmvQVgMkUfNJLDD/UnzdAB3iE5go9iumMLDuVpI+D7nb
	alq2000Ve4A6r1Dp3PR0FTfgfWbo3zxWKSeTW1XIMAGYi3ukZ9AxtapQcD8T6dV+AIHlAeMr3pY
	WRnVRIO/9EyuDQaU4NJ4Hfh7pYN5JoUDCJpKJL4GjUTQiRGBgFK+TghrySCpp6eza1btPXVEkAM
	Dmly8E0YD+nxua4AQLmbfvAufWZLlGySR+bLWFivaksVUfYp1fC8fvglDYn/FG+vYO8HfYADQV+
	o/txeCMJP25cMEnoRPSEaca9QUmeuqKcL1msqmCLu1y4f13CWrJ9cbDSqF/m7Kt+Un0Wpozmeox
	t7FXcvRB34VXMFtXL7W8Nj3kmFg5yneNW0OOGIqSKDPpu7wH+adrYAyCFNQixy0tjX3KothiHwd
	vZUiXLCI4KVQ==
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr230207335ad.18.1795728773744;
        Thu, 26 Nov 2026 13:32:53 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr230206925ad.18.1795728772952;
        Thu, 26 Nov 2026 13:32:52 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm109304205ad.51.2026.11.26.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:32:52 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v10 0/4] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Thu, 26 Nov 2026 16:32:28 -0500
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGylCGsC/3XQzW4CIRAH8FdpOHcNDN89+R5NDwPLKo26FnTbx
 vjuBdt0jWETLkOG33+GC8khxZDJy9OFpDDFHMdDKRh9fiJ+i4dN6GJfLghQUFRS06UJgZ+V6La
 fxzS60E3QsR6o5tY7ZwIpL48pDPHrxr6+/db57N6DP1WqdmxjPo3p+5Y7Qe37S2CsmVAO7YB5i
 VKIgfV+nWL2+YRp5cc9qSETnxlFeZvhhZESLGoHhhux3uwx7mZD3BlLo4hi8IEyBCGsMObRkLO
 h6YIh6zpescEKVFbio6FmwzBoG6oY3hqJAwepnFmPOa8+zrgryn6m9ExZJtuULhQil8H1FoNVC
 5S5o4C2KVN/eGDCeemB93yBsv8UY9S2KVunCkaoQmmmWwter9cfyppO18QCAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10372;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=yndesCy2mpR+9QdqsccLyAAxMkDEN5MRk1Vq7DXHtcY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpcWvpVtNt0jqXM7lfP2ls+jjdkdenaxvm+Z0NhXGL
 5g34fzXjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjInJkM/wvuOAuLdnOxKfcV
 TDF8feeOYK6m2lWH3A0lvY0rj+35tpyR4UJnurh/stZTmUVGk6cfrVyumH4wauHKl3/kGu0S3sx
 h5gEA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX0HbET1qNYZkd
 5SZoCw8R5bojMIUpNi9wUpoU4TKNTOqQEkhoZHzfmh9qJWcgLkyMFPxCyE6Vb2OhXlyv+dQXxPZ
 2PQNzlCnhVX62XfRGO+mwmjb/V63DVE=
X-Proofpoint-GUID: 6XoTM1IKFgX-qqnx7P5Gx9YLvBHK-H-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXwkaaUhwrirU5
 e1BZGNzYuv7nkhXB17Y7vNTUrfSTImE1DDxuiR16N0Ikf9HIETkgzwr90KoHw+z4MWrW//OlEhf
 YPY8jOhAaIVW1CsZlqNvDkmX82OIK9SvfO6Tb1hVOkA7mVYmpOisbQi6NYUf/PFybW3EIykd9qA
 zrXfMeKZWI3DFzyI+xqN61+uJNdJJCs8r9aqJ1gviwrIU6LKKNKeLrog/m9refCo1Xe4b18qEQ/
 JjEXD0XAm0RNATu5Mzf7gAyWftgx+UMgM21ajBSoPm3l9XwJsftrVBU9aMBQYWTIYq1I3Y0mOsz
 5Gtv+F7EYvr35+1tr8jw293ZRkOo0tiN+A44/L5AMiu5aF4+zQF9DEsjMmFykKHfsQ8ugg9pHdw
 75lBpQA2+Ocj53+H20c368ScFosaNF5mBTES41OMkyg/MOSIVYSw6QV32bicfZQnWaGRMVtNr0+
 pmWZiwFhXV+iBLA/lzg==
X-Proofpoint-ORIG-GUID: 6XoTM1IKFgX-qqnx7P5Gx9YLvBHK-H-E
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08a587 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=pGLkceISAAAA:8 a=ee_2aqc6AAAA:8 a=o92ZdCqwNWKphytya3sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_133256_616296_C283E68A 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: Florian Weimer <fweimer@redhat.com>, linux-doc@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>, Guodong Xu <guodong.xu@oss.qualcomm.com>, Mark Harris <mark.hsj@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Andrew Jones <andrew.jones@linux.dev>, linux-kselftest@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Peter Bergner <bergner@oss.tenstorrent.com>, Aurelien Jarno <aurelien@aurel32.net>, Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases
(currently RVA23U64) from the kernel's ISA extension bitmap at init time,
and surfaces the result, together with the IMA base, through
/proc/cpuinfo. hwprobe reports the same bases, derived from its own
extension keys, so that they follow what the kernel enables for user
mode. Later patches can add other bases, such as RVA20U64 or RVA23S64,
without changes to the surrounding code.

One change since v9.

From Radim's review of v9 3/4 [3]:
- hwprobe no longer reads the isa_bases bitmap. RVA23U64 is reported
  when PMLEN=7 is selectable and all RVA23U64 mandatory extensions are
  reported in IMA_EXT_0 and IMA_EXT_1 (I, M and A are the IMA base, and
  Zicsr is implied by F). The bit therefore follows any fix to the
  extension keys, including the host-wide rules in Radim's series [4],
  with no second copy of those conditions in hwprobe.

Part of me is a little concerned about the hardcoded masks,
RVA23U64_EXT0 and RVA23U64_EXT1: they are an exhaustive list of the
RVA23U64 mandatory extensions, and another exhaustive list, as
__set_bit() calls on RISCV_ISA_EXT_* bits, already exists in
riscv_set_isa_bases() in cpufeature.c (patch 1). Merging the two into
one source is not straightforward. But as said, RVA23 is ratified and
no further change to the list is expected, so I tend to keep them as
they are in v10.

Unless someone has a different opinion; please speak up.

With that, series outline (v10):

   1:  cpufeature: per-hart and host-wide isa_bases bitmaps; RVA23U64
       detection for /proc/cpuinfo lives here.
   2:  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       "rv64ima rva23u64".
   3:  hwprobe: expose RVA23U64 as RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
       derived from the IMA_EXT_0/IMA_EXT_1 bits and PMLEN.
   4:  hwprobe.rst: note on what "supported" means for a hwprobe bit.

Note: patch 4 states the rule for all hwprobe keys, but some keys only
follow it with Radim's series [4], such as the Zicbom/Zicboz keys.

Follow-ups I plan to post separately:

- A series exposing these extensions to KVM guests (extending the KVM
  ISA extension ONE_REG interface), on top of this one.
- A series adding further bases: RVA20U64 first, then RVA22U64 and
  RVA23S64. RVA20U64 also needs Za128rs support in the kernel, which
  will be part of that series.

Tested on QEMU (virt machine, 4 harts):
1) With '-cpu rva23s64,sv39=on', /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines, and hwprobe
   RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall. The riscv/hwprobe
   kselftests pass.
2) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and hwprobe returns BASE_BEHAVIOR_IMA only.
3) With device trees in which one hart lacks an extension: when that
   extension is D, C or V, RVA23U64 is not reported for any CPU.

A branch is available for all patches in the series: [2].

v10 is based on v7.4-rc1.

Thanks,
Guodong Xu

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v10/ [2]
Link: https://lore.kernel.org/linux-riscv/DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com/ [3]
Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [4]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [5]

Changes in v10:
- Patch 3: report RVA23U64 as a function of the IMA_EXT_0 and IMA_EXT_1
  bits plus PMLEN=7; drop the isa_bases lookup and the host-wide gate
  from hwprobe (Radim). hwprobe_ext0_has() takes a mask; add
  hwprobe_ext1_has().
- Patch 1: reword the commit message and comments; isa_bases now feeds
  /proc/cpuinfo only.
- Patches 2 and 4: no change.
- Link to v9: https://patch.msgid.link/20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com

Changes in v9:
- Dropped patches 1-8 of v8, which have been applied by Paul. Rebased
  the remaining three onto v7.4-rc1; patch 2 (10 in v8) has no other
  change.
- Patch 1 (9 in v8): set the IMA base unconditionally; do not derive it
  from I, M and A.
- Patch 3 (11 in v8):
  - Report RVA23U64 only when F, D, C, V, Zicbom and Zicboz are present
    on every hart (Radim).
  - Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
    it from I, M and A.
  - Reword the commit message.
  - Update the hwprobe.rst.
- New patch 4: add a note to hwprobe.rst that clarifies what
  "supported" means for a hwprobe bit (Radim).
- Link to v8: https://patch.msgid.link/20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com

Changes in v8:
- Patch 10: Andrew Jones is the author; most of the code is still his
  from the RFC. Added my Co-developed-by (Conor).
- Patches 09 and 11: added Co-developed-by for Andrew Jones ahead of
  his Signed-off-by; the RVA23U64 bit, the hwprobe.rst text and the
  mandate list came from his RFC (Conor).
- Rebased onto riscv/for-next at e11160948333. Patch 11 drops its own
  pair->value = 0 in the BASE_BEHAVIOR case, since commit d0fc6fab2046
  ("riscv: hwprobe: initialize pair->value in hwprobe_one_pair()") now
  zeroes it for every key. No other code change since v7.
- Link to v7: https://patch.msgid.link/20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [5].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (1):
      riscv: cpu: Output isa bases lines in cpuinfo

Guodong Xu (3):
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: hwprobe: Introduce rva23u64 base behavior
      riscv: hwprobe: Document that keys describe the user-mode environment

 Documentation/arch/riscv/hwprobe.rst               |  29 ++++++
 arch/riscv/include/asm/cpufeature.h                |  13 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/kernel/cpu.c                            |  26 +++++
 arch/riscv/kernel/cpufeature.c                     | 106 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c                    |  54 ++++++++++-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 7 files changed, 226 insertions(+), 7 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
