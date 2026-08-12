Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC7EC5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 23:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+Xn/qbA7oaKxbrusFIqVnrYLf1/0K1zxltbP9zDWVc=; b=lyj1s2z1PUJyBZ
	1kxXm4aSamO5mzExku5RhUErfZjdTGMRNtCjPc6px98GtzG/ulr3fY6A1Mg7A9D6Lr96i5wNgqu5P
	FfaqWDwJi47sMeO/ltjav12A10xVbtR5R/cbMq8AUQWaL7tAJPGQIT+/WDn87rOq062EvW8Ae3H17
	lHagJc15CnCiiyN248qYJH6s2aJ3UWhTYFxazyTN8xxOOegqWX03+M6vypJs1zxH38D+wiu8UVtYK
	6jEc1HUpR5+TVSH+spTwIFJbxsFp3Wmn+TTrSYkfEO0GHPjX3BvbiJMLZts4u8YhzLLYE9l9rJ7ON
	dHJGVhqRAoJGiGxxpQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUp-0000000HAFo-0aeU;
	Wed, 12 Aug 2026 23:36:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIUo-0000000HAEk-0xAe
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Aug 2026 23:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=; b=Lf4uJ/dwuGQIRma8gspZCQ0sUR
	1am1hqvtlPXv7eE/JrlXjeiHLVT8bjABms5eF3Ei9KqQfsagiBvYCjEo/vfzE/h/mbr5po8YU5VoK
	xOvGHL1V9RHuiooH6/Xn3MUU0voAyVrdI1itH/2GN0sPK13PsstUhnh7D2vZIUobxi/OwYPkilhSQ
	jq+wRkumpyMM45Yt378pp/8bLJ4WW5Hyra1OfkHkLKClPQYV/QKjRw2tEt2T9hK9s5o+jdwU3VHOv
	IB5yX5S84ieADvvhmf9835Z0W3l9jSd08ANw3Lwi4/+HpQjBPx2WfhWFBex9Qibu/tBvLJyaZyhHd
	k7U1GYsg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuIUj-0000000FoER-2cmO
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 23:36:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMhAe1060458
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=; b=FY6MSVFUEMiPzpg2
	OKRL7GB/xap1n4MlUb7m/HmTY4QneQSgQ9aZzpmIEnjOhePICgOQxfTZCYMNb7E5
	IfRRns8mwvp/yNrvCsEczXLTeeu9KI+fgDBAJ3+mgfAjc1UW1zR8fdXPqzuiN9VW
	0rpvQpDd+uTIWso7GidRmSH4PqSlQAlRb9u8RHbgknk8elLYDApRf855F95R4ObX
	qOx78VaMUnets4fiZ1/SS1LINYUuOOs4FdX1NcWxHp2gjEV9c6aYffMR75DUOiGk
	bZsSHpl8i8gsrxTGfWiHM8IrKp9SaoH7wshIWBx4WjNDOZWrFHn0oQZP8hjjDlns
	nVwpvw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asg8kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 23:36:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc6dd43737so30133195ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577780; x=1787182580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=ZJJ+2Ke7dfb7ENW+hIMRJ5DtWeFlJfld9e6EYOJwn5Kx41osR8PO2lnssJm3flYOx+
         BBbhYZsdWybZiKQguenv/+Y8tDLCyyF9JcYmjV61WBHZ7XmL2gO2LDZoB7czwsIgzEIY
         w5VtIJUWQSzJXaOAQE5hIsh8d2lD++SokWY98cbn2rhV1Ce4k1MU7LHjf+nTedhPdZvH
         +Fvu5GkJkiMBLiLvEtA1FnvRmM6AVOwBuq6RY8bOgRdDAyPmlL7ZdPRA0u1ubB7A4+vT
         tihe3EbJEktvEiaMOW3+1jyLFeJ87mPx9zGgACD3xgR9GaKlSVblp5zMNOY0RpEoXkp2
         31bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577780; x=1787182580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chxsFMJd/v7CYPQftCpnnBz6h3uko0w0S390Jkq42v0=;
        b=cENwWeyBRM7kzm7yVCMTQRLWV+0qYSz1fYKI2RlwqfVaIUDjUU9sWHdjf7TzoISoGV
         J6iHWr6JhWYX2qU+wYkIdxR5zYKlXevlHLiNDumw7NaGoaYMQIR31MCa1VXbfSLtoopj
         pZ0RaSYTr84Wx7rCwi414Wj9RkqClmLnVRrzgIO0MKG7L1B4oZtS6YUS13rcqQJsCbIN
         xOa/IWUKjGBKxarqViPXw1iBnuKeMUY38dl2Ig5MNE19zr2PJWTgwJ8df/WBdL/FV5Ff
         L/5q5cE45+6zyfLeM+OU2GLoPIvF7Mb2ztmd3iw8/0ltnYjYoRjbBFr2Csk0o1esFlLz
         7zAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMJSCuFTZlv6FZUb/CQK3INhCyx0KJTYxgqbF/Qdd4NiWbT37dZdGo1gH5Ix7t3S3mTBiyN0ZcNEfRow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEX+PAU2qkByj0wsO2zNPD8rOvTt0K7chtwh+sDo6O08mSAuSL
	1KLSrIGpGEuk0n2U80nBHJKOkOJv+48LQNmCxoIaUQyLhk/AqopaGoACHNbBR0yvHTpj79cyEGE
	vZb6eLnLrlCq3Mwv2TBtUDA1SKkkrm6rL+zz5P2O1m/9PDJiZ7V5mtyp8tj/9QAtvvokbbMU=
X-Gm-Gg: AR+sD11VxSGuQGSI6+d7g3jR1VVz3VQhiNduEL+NRZUTkbA4OmnMDIrFTjwBdCKRD5x
	CkFgrR8O7ISLP/2RmL0yr2iIdlNXyAM2kI4y8J0vVulv86FjMaUyl8sA1Kv2fL4ooPhkHh1CHjh
	7xcOrIYVQlE1Y+cZwV+ENtNzKOQGQ4PUweXHR2eF0NXzjiLijMQvCIp/sUa91ZnlQpDqJTa/JyN
	PISYCvZIXFK1aam6F/DYPfcKhpOaYU5G44UFfFBq2sHNNWLEwf9mQa7I4uscxNq7R5OWkMHoIn8
	o5BrMOsx8HKdfQu6jSVxQ7VzJ7OUCKjsvrBLdrCcTuJYNgZloddDOqhz82FrVQ==
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15942385ad.0.1786577779905;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
X-Received: by 2002:a17:902:c412:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d37d1c1926mr15941865ad.0.1786577779333;
        Wed, 12 Aug 2026 16:36:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:18 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:57 -0400
Subject: [PATCH v6 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5002;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=9dW4VaF+cpQj6n2di2ZHB9qHayVfEQpRJEGaM1jJjX0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrEt9omnjF9tX/pU9lBCyb+leTM4jW+UijyUf866p
 +uu367ujlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIXhLD/xqf3ffnKQev/cCa
 KZFhbhhqbvXdVeSqRd3u9qXTT7384cHIMM+gTH/NlW4Gkc/7GZ5eemTyfcbBgk0b73KGBmd2GLL
 9YgcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d0375 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jBCMAwuHs6T3S2td1yAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX2eTlwQELxlMu
 f9Y2I+z7BWbWBJ1qqpXmlCEDDpJypoHI/ZsS9XFrzsmU3mydli76tKenW7suVtSZM1nLKCmNwSj
 q97au6fJMaE1GJI6Xw89nX6N0erBBlC8IUz+kUOAC1wdkdEb7lMdJXjWvMgeXoj+wEv2b3iS/JK
 w2p+CZpNkM3fYiUGAYFmGlk2h+BvSJPeJFetnd9EOm5ohZpuHytQLn6IHVoqSQccTPkqUngT2bY
 SAflYUU2FEtG4AXf0s1Z4Qs5cwKlCpFyiggrr45e6tyHqYjHJgNsRyBUZ4Smqs6zSwV9bSuk51f
 XyntDpl65XvjdUKxN9JTDL1Qw7b/Syon1u39RWaQEd4pnWam+x94t8rfXy2uCZrSC7L0VsPHGvO
 +bjDTSE019rUJ3qr0PXgAk+O4w+X6DaOcuE2MGwpBGj2S48+zLS6Wo7DltKabrPSL4nPCXB1tPI
 kT68Uh0wsVoWzf/DoGQ==
X-Proofpoint-GUID: KpjY9o53HVM_Thr4ojqAckhAB3BHE1bo
X-Proofpoint-ORIG-GUID: KpjY9o53HVM_Thr4ojqAckhAB3BHE1bo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX2YKGHmk1F9FQ
 2P+IsH2lwdBzI4xtnS4Sa2N37RYIhRr6is41bzc3KpC6CjBoTs3oWyJXZRDKDEqCpe/LzhIm0Gx
 AapIESVHnCCYOxBUTtOatIkhnx+9JOw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_003626_151254_DA47219A 
X-CRM114-Status: GOOD (  19.18  )
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

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9d..dc70470093b1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b436..4f5d51788c41 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 656cb100ac48..a18465e734b5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -305,14 +316,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c04..f8c797b1d0fd 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
