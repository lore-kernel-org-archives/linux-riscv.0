Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5837AC982CC
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJ1RUVdvbNG+sJbYJ3VO53qqs+TK9bZXVkuaKNYsMio=; b=cloOg4qVIJCgov
	7LX3QLmWmVwOuRAS1xEd3Bis9lZ85/BYe6i2QspgVLyfPx1q7UtqutLkpkw49C8RjjNgjg2hP3Rp6
	QFcOLBYis0WJ3cPdlY7dQJDAapQArOcyNRJEiiW0EfdH8segXZukRblT8kg6NzTtnIEjt1XamSaKc
	x437C7jnVW7N/EedI9+yJL+52sJpAa5OG+ZZdqaTUTuF5aV4jn2KytcLyyBI/TKkSMv3J4Ab0sZuE
	9NpyTugPPBv6spvHMrLCHFvT2B9s0uPuWkROKi8P+BHkbP8Po1JgjdLYw/HD9sqrIk9QYrD4lkSnL
	z4Q4q1jvH7ES94PC5b1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bqg-0000000H1n8-0W8g;
	Sun, 20 Sep 2026 07:20:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Bqe-0000000H1lz-011B
	for linux-riscv@bombadil.infradead.org;
	Sun, 20 Sep 2026 07:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=; b=Epf5kPg6zk/s6AJ5si62N95eO+
	Uh8ZKKZ90DfBvWJKzmDEpKIFZOrbV/knEnZCnZPnbuwNhVlwuZ9rh/w9lesS8VAI/fXeYxHoRJb++
	e+TMNqiDyBPLB1+jV9knib4FqsjaEtZV12Pxtvspj7JBZBurUTnGsaIS0vKq8RCc7IA/8z4+3oxLh
	XAIviAG+p+wU8eKtHeypsR1KYTavZukgUE3FFZhfU/9ZMXVIq8SkY9IeJ8q8UccL+rQq6ZJXMGE47
	PG3AYeEJVaMHaJ7rCQjEW/90X/QrGYpaEiOABcO4pXDy0nO3jFsGcm2BpFieBH/IKGxvgKke8HcWK
	SL/ZZl2A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Bq9-0000000BF1M-1o0x
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 07:20:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54tuD162464
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=; b=VjXAMP09Ggey6wVW
	k6Wt82ZlJOTex+hbBMd3dQfhZo8+dT3hRgGPgLTO03P0vlWf6CSebHvPUqrqlMYz
	r0LBVqeMrUldbHdaXaL2Q9PA6vhgM1FSSaNdfkMDzSNfNwVTNGYoKMQgREVD4oEz
	2pK/8NAV2m6ldCV+aEZpLxSLmDnww3jwF0/rlCuKMNDcCKFlDmyB0jD7YaSYQ9o3
	am8PGPsE4fQL4RXLSLWI/bBpRsH3jDQxLOP3YN6sl+cMYhgxa6pOkM9KB+ryMJfA
	zDkltq4Cor+m19iGEuTEuAr0CXAOZg40ds836ZGC0f4Fjykb4RdgKlJGL3fljJam
	M96+7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2cfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 07:19:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db87f759c5so42307905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Sep 2026 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888795; x=1790493595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=Nr522DsOsrS9NivQEdjtqa+UBFaWflZp11OOMawQBnmCUa5wSqdztSC7edbmFCR88M
         KAq+zPbODS0YPmnYqQJ6cTbPEVCGR+IhkFTIyQM6kTUOnC9fGLSalBIu8+oaM8EtITMy
         yP2Y5/2piemtSeoLgEMggMl0/E7puTnAJPwhEMsr8EjTjWwLkGgW1oBmWGx3jTea8UrM
         7ZWFuaUkBWkUTx3duKcita9WBJ+WgWLJs6xnHFJUrBEFn5gdrUjmDLx1rIo2GRO3IzM7
         kyNVnwyxJaeBSd2cyLZALLzjYeMLEYaM4i7oYncpegPGajCi4rBSkIRD9U67foPkiHJy
         rLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888795; x=1790493595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRrOS3qQ0Zhz1BrEtOqvhhXHAjA7eetTPAsY7CT/3E8=;
        b=ZRo1UlqvKIP9gqc5HDpSMJ39B/b60bMnOlmVchNbFJtgpblmn62yfakt+RkqlOuN4z
         e7Lsce9fGNuSv/etqRjl+IAbpt9jUemN9lpDnLyeYYUBwyTEDCc6LBqOPP3mfYAGc/aR
         807dtuzS3U7bpdGyQFeZEuiK5YsuVXD53EoXfReUfPtS5kUF+nuSUTJvGKnu/fVw5879
         FyRnajc29s3O5wDQER3wY4RG4OkVHrsfi2noZIdfDNN3jx2MKyupM8z8tzJIBOyYl5vU
         +c1nyWIbm3S3BhJQV6xaxFJ5JyazDoqfsOHHdWQwgbKEIhm9Q/D9oVXRED/J0Dkj4rDg
         a2Rw==
X-Forwarded-Encrypted: i=1; AKwUvBzxOAGctHr8h9qleuitAMpZNpAFTgFr3K7oqgzH8LthnEygliP+Y7LA8VBH0uplCxjXRYxXPWjAb6GI8A==@lists.infradead.org
X-Gm-Message-State: AFuF++lMtHZdt48f9usV4oD553FyiUN/CKB4vQ6v0GHsO79apMQcE0/r
	LKpuys3OT6/A7l4YXTm8gY/uh4NdzgPjfF7zB74ihjfe9/4leEOoreGnMM/nOmN75Rf9Q7FBIMc
	tGGvxknxtJccQjDnnOdexh2xGtM9ErFJR3g8jhO/zXzdfTitzxxux9/DefGJdZ+YuI8ElOXE=
X-Gm-Gg: AYBFou0OM7OgKwL6d96NVjYIjq+xslL1C4qESAGi6maEvkJe+S4bVMyviZ/1uskDvmN
	7Hqbkq9viKtABbpqkXsNxa2eO3kjh5Hqni7Y8r5z1+0ml38+uFK/Rsf0xsUA4wPhPQYZFj4lhQx
	/DcWprCo41RqyXd0FzZnE5QwxAs+iHGXqfXQ5rubetREAeHEmkWoTT08BH/RPCJOWjWEnXMPfsK
	GKiwExQFx73yWpOHCYALWa6MYmjAofIt4TRoCIuKzWTqcdGCnjofTIlDRizOe9vqNbEgSKLRG0C
	Vk0oICmjqIU7ZFGUDNZBAJesWE1wvFBLVtucs7MMUKLEBuovudHjWeXSk/Y=
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61371095ad.40.1789888794681;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2ddc053c2d3mr61370925ad.40.1789888794067;
        Sun, 20 Sep 2026 00:19:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:53 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:29 -0400
Subject: [PATCH v8 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-9-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7913;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=LiWE+wlkueULRI6+/+fF5gGTm3Y2rs+sPskRz14DADA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HafmauqU2LZqJ+c/N9MOjGGbJlTzae0Kab799Tbq9
 U963Js7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIHNzL8L/q0t3Sb5GvWB5pc
 lid9NCp13pw9rFGgPaXNJlrjsprjNkaG/TXq919aTmKzmN8eOS0yi/uY9jk9ppLdtne6A9WslVd
 zAwA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aaf891b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2dgCOJfQ_T_1aLmlT9AA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX0m4146jw2vlZ
 qYwEPYHqq0glYEb0PMn3yDb4q/0ciCybEuKkeobRMuXViWlxbiYs2KuASWqbBw5vMfkMeuynTpp
 fFVrZkyy+67w2jl4jTX5FYjlRFDXxNnTi9LpB+p1n/jHgBxCqpKhaFui7FBVJdyBzOogKWKb+H7
 Rt/SohiC2ju4lVPHncwlStnrB8vnaN4y08S6xPgYxOqXn9pcThIuXrdrbqWGcB+eAaPH+7cCi4q
 9AdsHXDFvQUPli4yFNLGptvWVgt0p/QvJZLq2dXBSVVhEyCFFCeRx1g6JfPZ6oort2tJIYTy3zi
 PYcPvTs40AkN7HJXOprs2hN4KPJ8Fne9W4THZS16n+bCH4G0cvJjo/+UcPwcF0p7f8Q/6tJw7XD
 f0YavO0F9VXHOorAbdcBXgI2W0VW17UU7N/bCuv44CrlGPrTdUmJA17w53vCRGw0fV3VlRPCY5F
 lYKiLIIwXjMdpvDeFLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX8smYRts8GQRH
 AHy9jHp1UPnkRsauD1lPub9FZqHWk1FDbciKMu9PBRHD8oh3neLPB4/8F8L5fkXbWQ3aRkV5Fzz
 87Olqylt1vmPavhOkNVMgnrntxjjL/k=
X-Proofpoint-ORIG-GUID: YEqiR9DMJtORZHHVZemedW7bAccVBWb8
X-Proofpoint-GUID: YEqiR9DMJtORZHHVZemedW7bAccVBWb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_082004_106099_7BD0F4A1 
X-CRM114-Status: GOOD (  21.96  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: Add Co-developed-by for Andrew Jones (Conor).
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 113 ++++++++++++++++++++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..89c64d42ee745 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -130,6 +142,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ef3133a52c0ea..126d5466a6f4c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1350,3 +1373,93 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
