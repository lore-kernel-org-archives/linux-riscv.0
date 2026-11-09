Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B0606A33C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R0/OXdFR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T16fdjRa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqlOCQp+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iHP8VbWrnnW8P4/U9Rom1lln56waTb89Xz1h6ard2SA=; b=R0/OXdFRoshkJIwkHbDNrGfcO0
	HKeOJyh8QU8eXhnSPMmGAeLzCT3frvyN9xnN2uksU9pm9Rt0YSVVFbRtOUbW3JUdrxM9SYJfReC5F
	RPmwLA99cWP0O3F0L3X46GYgdASvGKUSgWA/RtSekIavpHZ8D+a/2el3tdRTe8kXvb2S9iLNeityL
	/nA0gZy1BPmsHjLE2S9KTFLXo0tKtUx/B5Bd6lAEoxfdS9qbQo9OL1C6xdHldmyJIfLSB4JHxrxu2
	H3bP7pSzxnhZ5VkYy54pGewdT33JFxfjVVhcTGGq967uS7tMj16GOuLH/jyaNfsAZHRDXTRmX/cqF
	rXIAFI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOnG-00000000jcy-2YdU;
	Mon, 09 Nov 2026 12:48:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOnD-00000000jbG-1COx
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 12:48:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5A8561979
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 12:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=; b=T16fdjRasCQOR5b9
	ouA78MlzVIhS0F6MubY67EZPWYYT5AorsbHCQQL2yunaL7371J8c4otojw2xKCel
	3+zsCq/kId+BGvzZmkcmqLi2aCDW5zxRUosBMr6ZC25SYc37WyVV44tmdaXK/WKw
	Y4WGuaM99a6uPeHUj5HXQ/sJD8WAqkaNNZyYDrLfCxpVQGJuBe6ypcXN+/U5YQAy
	whAnQxBZFMw85MtPNBqOeQsc0VaFwrcZaUPGiEo12kT0XOazln/bZn2aLAZOOBnb
	KiaJPWB5aYiSBiZWLIOAbF6d8qD0/PGy2o7aoKdmg3B/oBZQFMshJN8qp9aneAIY
	SIieoQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxedm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 12:48:10 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0d978e4faso11190147b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228490; x=1794833290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=RqlOCQp+am4BVLeAg2Hs0UQDzh6Y1IHLMqzFVCAKe2QaME50YggskJCXtQwyo3MxYr
         HVAieqT6KBoruaZ4PM2OIrGbbsj+UBPQCzf5YDgCMx4F20DOXz7pw0RTRtyLYCZPEA8Y
         mlq3xZONS8m6asmOMGPl78jJ7XX38vhOcUWoNqGsHFZ4wPpI6J6P2H2RGi4NN3hhMEwg
         cUYGwvInco/FJ+qcuU2QyI49bawWJ3u9er+LtKv2FzASIpZ/NjeNOxEeyLQccFxo/57W
         e0O9mvEI8SKx+zenlWxaMm10YJQqlfJ0cMYiFRZiuWXqjsq/bbX6h3JwXgcIKs2VHBbJ
         hmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228490; x=1794833290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=Uvz28hn/MIrRir8lDtrG68Q5Ke1N1DFk1k4UnJ4VSTFWm8oKjKQ/n/+zuSNcnMuQns
         CWdhtQxxL84mWPUX3tX9Bb0bD4FqX1sfz4h2rgFaA/P3lNtbci8CZWs8EGo/1MzBB3nl
         OvCYbLjd/GjMXoJF38XzgmTUBK/fLsB005dq1uEAgdVQDNvWWvbaCw2kftctc19Z1TeJ
         94tqD3hFdFojjfGDdjV2U3ulqnHnGpQ3vD0x0ypC5u6pOYP5hDZfX+/poDKWSfW3vVwP
         kSHqbnt8RdrB3/87sb4XfQGnqj5mBCP7O1xJPV6CmXY/rQ/hVrjXG2LqiqOuhR4i0hV0
         nw5w==
X-Forwarded-Encrypted: i=1; AL+hErEOC2N0a+xRdRHwyOMI+bglTQ8QZmx1ZVDW1LVKJcjtR7Rr9kK42xqWFRUj1PBoxGrurk1ct5Xao1tmkQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z94gnJ8hHZyN5qbQbVCqEVKUGmctmK5lmr6v+pRWNCs5N6Emx30
	iQ++KKxwu1nFWee6CCzKuiFT4BcidgebL1yWJZiVy3V7UxEj2Uniin/EutvkK8hClrH7CJVW7KR
	EW8SrNmoqVeNsPmaoxq8a40Tn6ySSap3wyM8QIefKMtjIokDp3jPce4QpkYbCT8hHYU3c1jUzbm
	TyJZuHaA==
X-Gm-Gg: AYBFou3UTsamMh+vlAN7Gvns4a5Nb5PM7TmrvHhoJw32wDsnai4FrcA+V4qasHd/v6J
	BR0gjvXy7JlsoB2DqBzbYZpLzQlrbOutyRNNbrtLfc+bAIT3GeCOLJhOvVv9OMf+v3spsqiIGhn
	bxXliypGCKjAIutTEG1a8/2uW+lU91/KIzU4ZBOAEOYul4SNcQATI+SEPNCe5fXZ4Je1ZFjf1AI
	RycZUahV6KrNuF7Zyo/b+ei4M7QYX71cP98KIFoWBAu7AKtkVfYxOXDbzpggRIUezjXXfbff0wH
	H8U813j3xDADXKQgw5Ou/yxtIE6q/upMxiOQvqZnzRoMzIKpeKpiS/wfgXT1+i9UHtKjKbopNGV
	beGJ4jMWAOXF6P8AGLdlozQbzJ2tX7ggakz78tKw2eMYbcKuTe7iOQUfKR1VS17+NGJEqV5oYHd
	IJSGFvlQ0aag==
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899307b3.56.1794228489440;
        Mon, 09 Nov 2026 04:48:09 -0800 (PST)
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899117b3.56.1794228488647;
        Mon, 09 Nov 2026 04:48:08 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb42553sm34525217b3.15.2026.11.09.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:07 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:36 -0500
Subject: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6764;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ybtAp8KzOcpqJ/eft157GhybQwstQ8sSDSOgeJAecak=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB15vVWQzMI1rF2dcaLTN7+6DqtxYoTkiM/4t3mdjU
 bRYyvRURykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExkjhYjw5vFus8Nw644VXBG
 VZZnL7XPUEn8LKuqmzEhUeLzpGNfVjD8U+NtfPFP+r3xvqNzj21p11dVbNSZvOvnnjabiUpmYcX
 V7AA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: o6ZPSxQdnPTDuqcwkZB30aqoizkNn15a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9nu2pZt3HOtp
 As9iNYnTJlb3w4JVLTD4t8uHuDCfQigt6JuZI/DDg18Fj536LrAim/7cyWwN3nz6/g356uS5nEN
 4dfpPUBqYkT2CcrtZwgEP30zsxCQn+01WzWvX4QlTd8yFjpofZJVUKrotY8h2vkTJKxyyOghzJ7
 zvHDvVMHCZ83fAsa/uailcg000cN0TUYSyFFEchv0lHP9Po9zD90Ckq7VVXDm6Zie/1gwRIuVp8
 gQJYIUFGsuCLN+/kkSAr3y2A027/0GZfjt0vCWJBI71s7H23tZvjn5Wav4xNYLv7i/pUtn9H5L+
 MIEgCoeUi7gJsajASHsQDSZTNFuevhuRwpWdK2kHvgwuLZ6fqYb0PRrA9hfwht0CUVSW5lTZwyr
 LEIafKCxzPEw0F80BJotjY5N0pEuTzpwf4+u0mOP5hWtkJHD2lYfqKYEksgPDRqq8kAz/HPU3Zt
 VCL3DK268R0wwu75kyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX2OEjHp8XeVz0
 o0aSOWUfrg+g+T4mxEsrD4PeJ3zFgCJaBlxteG2GWbLKmpjmcCfCT7IbPZGZG4uoDhCqPgxDU0D
 +Q+XVMAJQx25KS+hmOVpzR5STTsyvAQ=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c10a cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=phefSacXyxpaYYCapdQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: o6ZPSxQdnPTDuqcwkZB30aqoizkNn15a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_044811_452344_846A7DBF 
X-CRM114-Status: GOOD (  25.49  )
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

Provide a hwprobe base-behavior bit, RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
so userspace can check RVA23U64 support in one call.  Without it, a
consumer has to test more than thirty extension bits across three
hwprobe keys, and still cannot confirm that PMLEN=7 is selectable
without prctl() calls that change the calling thread's state.
Userspace treats RVA23U64 as a new base, so expose it as one.

The bit is reported for a set of CPUs when each of them has the
RVA23U64 mandatory extensions.  F, D, C, V, Zicbom and Zicboz must in
addition be present on every hart, as the kernel handles these across
all harts.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9:
- Report RVA23U64 only when F/D, C, V, Zicbom and Zicboz are present on
  every hart, in line with IMA_FD, IMA_C, IMA_V and the host-wide
  Zicbom/Zicboz enables (Radim).
- Update the RVA23U64 entry in hwprobe.rst.
- Reword the commit message.
- Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
  it from I, M and A.
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
v7: Use riscv_isa_base_available().
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
 Documentation/arch/riscv/hwprobe.rst               |  8 +++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 34 ++++++++++++++++++++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..c24630c672c43 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    Each base behavior bit is reported independently of the others.
+    Hardware that implements a later profile whose mandatory set includes
+    RVA23U64 therefore reports RVA23U64 as well.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
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
index cd7cf272e6e11..5be5776b48e6e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,32 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	/*
+	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
+	 * that the kernel enables for user mode only when every hart has
+	 * them, partly because their enable bits (sstatus.FS/VS,
+	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
+	 * per hart.
+	 */
+	if (base == RISCV_ISA_BASE_RVA23U64 &&
+	    !(has_fpu() &&
+	      riscv_isa_extension_available(NULL, C) &&
+	      has_vector() && riscv_isa_extension_available(NULL, V) &&
+	      riscv_isa_extension_available(NULL, ZICBOM) &&
+	      riscv_isa_extension_available(NULL, ZICBOZ)))
+		return false;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -309,12 +335,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 	/*
 	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
+	 * extensions are supported on all harts, so just cheat a bit
+	 * here and tell that to userspace. Other bases are reported
+	 * only when detected.
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
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
