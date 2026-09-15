Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F65C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 07:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFrR5m6GZsh1ut1EtiJAtQUd7iJ4WSJGhXMj1pX9BFc=; b=eA3DfB+E1FD12V
	zHuy1yF4czqoEvXsZpc147G/VAbY/T+kvTgTRVBkkl9wMG9vIWts9M4xAD+KfDuL/a4xCZAJw2GDy
	Tt8pzpGjShTnpWYggzNEulbAPzFjD1cwAoVAY+qy7AQNQOOQUBj5CNe8fD6FfJhbvorIl2ayAqUef
	JUR2wNXUSf9BToJ4SRQbwi9XwfwT1dLX1vZxUrlop9zNzVaALwbTKFB6xj1SA5P+X/D2P3E3JQ6Y7
	9D/C6MmMTPLPSbpylvUlpDpOCVbARKmmHPo2m6xCltVgX/VXZkxYfCQS/ODadU69O29LhEHjePOgr
	yXzEBNr/h6X6SOqrHdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPX-00000005RWm-1hwx;
	Tue, 15 Sep 2026 07:16:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NPW-00000005RWA-3A6v
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=; b=VGhp11hQX9p75e7f1tGYxv+waj
	XD8KW4oi3TrCHsYWkcDBNUhCMKc2wejFdDCWGnsi1Q8nI66VzRX4q1mxpUf1q8LU8D8tjiaeObvaM
	VGOnwSDN+2U0KTS+NcCMl9+cyLxUH3GG3NooCZG8Xu/mpRcHAoZkzUKJXVrdk7vQdDdEY54BvJwcv
	y2yHKcDHn3FmoXebddxIzJ/uHNFhCXAXsOdyPsd1W7EQn4YiK8jFalyjHCmpJn+1nTjcIChJ3a8oH
	vWDBDom1slQIFCEKIfM13yVlMBYNk8396q7eFDJCvuZD4h3hUzZS+IJ43k1rnfxJ+NiARis31sAX1
	yqbBZL+A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NPR-00000006MHS-49M1
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 07:16:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zf213126464
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=; b=kz5axk0oPAa6ORBv
	oa/GHEOdKUBTGNm4AFvyqqsVFVqOR7BhGAQpklkGwr/AwrcnaiBAAtpGrClwXBBZ
	h68G400IJZnKemtYIZGPUUSyzxc0u9Q8qcsuI3lMPo/UAMxApjA1EDvzW03j+/5Y
	AFTMGQqp+9Iym2SoSZEYr97fjsgEDzw6WDe5+ihHi8/wDDp+Bz2UyqIyYj1zaSeq
	VNZi2Z2BlLiINAM6rDSHJwA2dpYj3eLdwn8KeNhjqKBB6nx1OJbo8l+J0iFhtKIm
	ahBs4bk6WbQq3YOP37EOTJyCnKTxvkC6l2C/2YqTZ7AhRT9WROX4Md1MNpAMJpBr
	W1vQFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u1vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 07:16:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3047127a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456611; x=1790061411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=GT6WbMnuDYsG4fyKHtGvOCXBn+OXIcuaqJnPa+mI7lMdIR4iGqzCeLuW93kQ5WRzsu
         wp01ui8F3fVRV0H1uLjuSH4Wq/Hg4XSu9qd6jPo8nTAr4PGBmKrP9TP7p1OO/Bc2fG5+
         gcSuTeOS0VrwhZPyC3HD8qzTTn5xB8odZV52Lj0rY9E8l0a1xZ0gNFy2TlUWf2k6FeDg
         RWpB57Y0z+H4lO2iyS2FvupNeCDwnELZACVi/yI3M1yTQd7nlCjM69wgH8uRsVoCa786
         5+jSopAelXasYpvAYVoFzbNEK9+z+7Fv/2Vf9owWkVEFFWXaibdLnjzXLNEugjuV80ek
         D0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456611; x=1790061411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bib1p+BD2+/9MYZY81r3Zrm+xMekme9OPjDE3KXqXYE=;
        b=aNsdd1GTt6jnYVWJRqCTIhCTIvTUxSW8bN/Uh/Ysx9en51MBu1Q6T02jfshJVZ/WvS
         mDiqQAQxjctQUHako8njA/hAcxmqq10DdfY5lGOwTwOWKi9lEMsyJlRXcDiNSLMWuKs6
         LBHlf8pdzv7oEMadmNDlGLprl853zL3B64WEUG4wpfCktNv8ke0a3aAL9tAUYlxP+eJ2
         3O7suZuAHIFpg/lJ/LudvdyR5F2cSPNBG6vaon3VUCb33T1/FPE1WfL4lhroDy4got63
         z9HvPY3oWfdLDR1xEPtRB02jfrTPQoC6UQgT6xv+alHRNSvo7DrLDU8lEc1w588aIoKN
         +/LA==
X-Forwarded-Encrypted: i=1; AKwUvBxF8cmeLkOyin8M73U8y6S1TvV6074L6xO+CtniPkzx1/T1yL5a0mBDrBvgnNff3fwOVvzDod2bJQTzMA==@lists.infradead.org
X-Gm-Message-State: AFuF++kWNlA4xjFmz2wE1iI9SvEAh2lXMgyY9BwXDg9F58H4WaCOfMxb
	A/WCMqGVcSu8wBkj3PWIzb7dH11uFygUjNUGKXf4r6jn64WoeHXFE1D6E/xbzleB5f7wPXScnPi
	RcAZa3eTUK0lRevEu3/NBaBBlQuEPTzdxBI1s7vYP2X1tl6PbSIMH8lIrR1zp9pYR+mF3Xkg=
X-Gm-Gg: AYBFou0GChb79JmI+2e8k3sgEqcZHB4qQswmBhn5bxqzxjwjwxjVsqE1Oi053/ZGskV
	jb/Wy7a7geTdN+gxciOekU+7uVjhQaUNdznTC2tHlz/rxhaV/3y+9QwNftn4rnC2MQK8d2P3MST
	ZUozxJQ2CVqKRNe9lFU+V4Mkp/ZCYHZKqOt+EPj/A41t0pSp92ZsViCuF7vD52FN8pJtC4uwQzj
	K4FkFMtYpkS60ewlglotFBJHxutb2hu7R4opmW75i+V91jXFPVPM0mhaSHZevKM0j0Wu9O/woJn
	EqwSlzIxwKbFgJkfhNNbM/bPo8ZWySskAJH2g2XVUnHYpRg6j7FRXt17Pl3a
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151424a91.20.1789456610960;
        Tue, 15 Sep 2026 00:16:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39dec0f7135mr11151274a91.20.1789456609849;
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:49 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:30 -0400
Subject: [PATCH v7 04/11] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-4-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5858;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=O11yGb/wRFqA37mTtx66TEu8+w8Pb+GTV3KD9OD/Jlo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7aI/LjL7XXKLGVebOoDpa7nnYWFTOvm78vsaklNi
 0rNUd/XUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABMpdGJkeOJ3mPXx/fdPmE9u
 vV/mtObOk2+PZn1cKhi63GOBfHjAXFmG/2Hv9D/a7BS5EyoiftAjcue1I3PjnD5oLz+g9JJFzee
 IBi8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f0e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX+W1j/hiOuc3f
 eUXclJgoF3BI7pEynJWQUn0k3ya5isCKiCpQXC2cj1KTVkGMxExDqlf1iDehMmUkz2TXQqsteja
 ShDjocR2XJKECNBQnx65VlR9ePKx42T+blMYRxF0R+RkIy44m9rCekUF+L2IXdzfDrc1ZFkHJAu
 uC1HOlr2LfOPyJef6Oc0vEJmvn+sumBkhVhzTRJnmvMG1XJB4jXrhZIziOP44ArHd8fy1fO9u4N
 X5ZHlFRGN+CET2xc1t1q/A/6QZm63j/v/rVYXZso7TaygI2axdg375lQOZbuvXvKQx3jxpJlQCK
 nfdpd6wdYCtD3U0gzNJbD0Ad8SWR4nnCMpRgmATguzNDuXg7aJo2Us1MScJW0JaukrqKdByGFb4
 NHbL2sCJq+ATyxSsnWHKoAEZ4n1U5Giz/3GhW4z3aCBA+gOXN/vIiG9VuH4FHCsgLyNsNZSdHZC
 vTR22LrMn/htjtEDHhA==
X-Proofpoint-GUID: Vk5cHZWvSurUUdc-ouXekPwEioa9zU5y
X-Proofpoint-ORIG-GUID: Vk5cHZWvSurUUdc-ouXekPwEioa9zU5y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX2oi9Nf1dJn3w
 xboxol+SbPihdg0hF7tkKMq9zAU87lr4Hv9UHab/Mo1WKYhP3clBIZ2s8OkZLx0f01lCUCx8pJE
 tkYkjn8wj42kRZcYcPbJZE3lS3E1N8U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_081655_341103_2A3D6EB2 
X-CRM114-Status: GOOD (  21.50  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b2519..b103aaeafa47d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c81..9a121ee3b4369 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b9..de7cff5f48c34 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a8381..656cb100ac489 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
