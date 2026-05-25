Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2C9CD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2qw+RjhQRH5Il2rIWNtfO6MD6RsMe7R75XrkAXUkvSU=; b=Lngg8Wdo0MnwBO
	wD3sHCPehpht0GgL6emcAWE7sRKS0LDkM74Vpolvs+u0v5Zhki2Pr1XbCQGqMOxs5eCmAxdNhUnxj
	88Uvp+HMOZ8gfMAl2bA1RsYG7ByJo2TnpmJCKbCdgMKGTEddA3I+C6wF212q/WEtXopbXBGhbrnhy
	DtXP9v0HumuWP++c1rTzaPO+2Uo0ONk/yBVvs0GGpeKfQPNH5rV2ZM6r35FY4tKrizLuAv0I5n/sp
	bYajsc1QFQHAFLhT/DRqVVRYM5r9k5GRLNTLIoSmraJaW317/DwQdyMiMR5tB8eFZwYr3vKoroQMR
	SFgP8rJIjobwgj7NFqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRS6F-0000000GtkZ-2euv;
	Mon, 25 May 2026 09:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRS6D-0000000Gtjo-41Y0
	for linux-riscv@bombadil.infradead.org;
	Mon, 25 May 2026 09:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gwHqqZu+wY=; b=mx8AfAyzX3z5eec5oOoolOqV69
	NgU7mnmc3jOioBIAJAkWmGf+JOxCaNlxxtX/1PR1QJdhahHTjlCPntwNcZfgeUguamQvyi6octrJx
	p+DymcJIJFJoOLMznG0nGwFSwxyMlbgzBQWRK9EfzqGGQVwAsQD+RE/b7/8oUtrTDKdKejt3FwqWn
	I9mLge3m31EKSk3gQnQnwIpiWBBKZRESdkOa54TXoWp4Ixb470sPL2Oat2sb/WGyZs3LxjEtLbRbV
	+/wMonJz3WkJuHVZrXEjNgpYuu0zc+FiErXkPYoFWbwOegv4qsRt06E2wqvfQpeWsMRtEdPUrO/LK
	qQY8dwZQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRS6A-00000008xUW-1dbp
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 09:59:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6YCT01670648
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gw
	HqqZu+wY=; b=dmK7uSQGA+xzlJvOD6xix17u2lbxkjd1glYwe3lhU6B2ShhJBrG
	w9hsUI92oJ2lV10TRAEo3jzDTZw52bp67jwlSZwIxZDxUo8JCgiebPPNmMRgNYkA
	QAoSdwDp2bv0Cq6C+jQ2403A/sMdeffcX5jzrDiaYySAEFf7xgJNM8tok/p/0mR9
	cLSxvKLrnEFyqeZRtDb/BMiGYBrG9x7OLrXyPqmtGJqAbyKgRIBbpMFCdAwCX97K
	L1fLdSixnpTBM6NBPJytyqaJUbeOo1I825evf00sHOnGnjircyt3nR61AB1lTXem
	q7I/WYgk/cgAZhcieImyj6MmVkbifXac6Zw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7p4t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:59:46 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso5509449b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 02:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779703186; x=1780307986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gwHqqZu+wY=;
        b=IdvlU9NWcWbOWK6gIy066Nicnft/2X4bG2vlv1fsFtXzFbCBucppBXg79bEJ4h+bVL
         00C1IKFwJiggomKVTa+qgRAsQJw8FYxKNwqOk8hhh0FzjCIJVl0BzCLO5Qgi9KaScE3u
         DrTKmRK3b6ge/kflD31plf1LDf2JqwE8jXTNsytZVqxUntaKpzB/BzurL9dsRJGyZqiG
         bkqeGHAYYc99alPwRQ2EfG44Z4Ug3UiERHQNLEK7Ws2bD17lgmn+Lv5TM+zkRk0kewgy
         YU7SMqidusnS0Sx2wzj0ZFEH8lXx17KSQrqe3dqB0MxE7n0YYNLVqyMV0w2GS2xUvql9
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703186; x=1780307986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/gvsRa9rAHCNHfljIYQFKolUiZ0vZQ20gwHqqZu+wY=;
        b=WRHj61GTnn3txnZrF8N05Ay02klmxc9yF/z2BPK5luYdESoT+PWP7u1lYQ9giGdTyH
         KelV6QqXhGdBgZVESMGSlr9kSMSfVDQPgBY58tjJ6ksKAK9dtBxg9EJzNHa/kDhpI5sj
         OJvcczE6b5sAYyoDoC5n6Cech5j9/oXTnFNPzfmKZwAuZgwzBCNQIi9792Am4nCi0Mt1
         RYc1o6xcA76Bwf4Dsv+17UlJI5e75p7b9RDWqg2KFvRwdQ083IMf/Oc90Aw1H1Z5rY30
         McZTSBMZoSV0CcWBLIQB6sNMOW2KxjxG80ZXb0/4b1TvtldxZeoVlqv6/YJ2sklpN7bG
         T7Tg==
X-Forwarded-Encrypted: i=1; AFNElJ8AKv93xxaMf7mm0Hv88kS170U3V6wLvUbRtGNuzNZUFRlQexlAVV4x76L8WxBtdHdXiwPrmR8rG1PFnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIQeGSzFd9cPzGC1syUn+5SdKzuyGlAFf9LneHqN9mMMVMXrH0
	9Mv3Z7ZzOJHHsAzK6SbUZdS2qtQA3RF5zVyM9WE4fp2QT94lYHMtG2M3EBbky/CYAvGijqYhfu4
	iDEGT+FOLKMVjXBHgKNk2FqMMHEV9H/Qc1D93h/kHyLpLLofbv+VhyFTRASXMpffIKNJoQ5M=
X-Gm-Gg: Acq92OFGGB28nQTwf4q4dI9rCBXrv7dtrWjH8DWQgdYNj0XysIyQZ/S9MxI+Y7/rC5v
	sl2kROTwKixHyzeFLTaOU69sSpuphjeSBbrY4M3ovI62j5sL4Tk/kJjTCEPd1n2PSXsmQUPpuFb
	bOEw4UkVZ9tE2G6oKfjh6mkrqBzLHM+DuQ48XhopKT8WEZuUMVovFlMZtSEwZIGJUE/vuS3KXea
	Cd16oj3/S7qCnTxZeYZ8so0aCbIxxO6DmcXdR9EmoZvFf/3AIef592kIJ7/owGlplWJY0cbzaAj
	3Ambdz5H03kii5yE4Ark0xqb6lkAyFOdnGg1Gd3RcLfnY65qu2dqB2TTtvZDVdNkfRqjBQ9hDVU
	M+QZb2zJ99rJAlPgp9qo4RE+BkKw+Lqb1j/UM5OeshiC23iZSC5566lSTFY0UA2SCroeOMEYLwP
	6Sb7uByi7kWtPkdxarkxgm5pXjYOXY8ptvEpVxnyOCerbw0mI=
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr13624179b3a.27.1779703185544;
        Mon, 25 May 2026 02:59:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c12:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8415f32e8c8mr13624123b3a.27.1779703184887;
        Mon, 25 May 2026 02:59:44 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84164e9e635sm10019260b3a.38.2026.05.25.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:59:44 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Fix ebreak self test failure
Date: Mon, 25 May 2026 15:29:28 +0530
Message-ID: <20260525095930.3924905-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: KpIxFfTGZVZXAuoCbYUM3QCL1QAwFZF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMSBTYWx0ZWRfX0sqApgx+gNT/
 d23esAfT8BoS1922PWr88agO2EWf/NJHmGsVyU/nCF4BgoSs6uh4cFDWIuK9wUUmV5r30wBNWoT
 mwOJgbYrJ28jg3TOXobQlJdfefPO/8SpgydfKZ2b/aHisneznTq6U0N4//OrpohCLDZuYVxJdlI
 91zYru7ScgrNDOlt6WmQ8Yw887DvXejuNbFbcGNZOY3ZisDvnufHZ4/lRt0rnd0YFCILvSdUAV2
 JRHcAA+bK6mFaJH2J3lNDgCPylQ8nZW43zFPYHRbyFOSxzL5OoiBPIQ95TUYB1/7IWrmq50gpee
 wF04dHjoAC8opMWc5VShLWIbKnOVgjgiqgoWIQhTStOw8CetGWFOHgDpadYUO5PY04ED4ZhWub6
 3OtEsgcgucnd83VY4RlMSzHy3TQ6zwQ5L2Bv4/SXwtLDWLx9sPlKB1J2EXZFwn5Z8zZY60Q7nT0
 xgoZM0bESu8CISkaV3A==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a141d92 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=H_xIGRXdBt4bEJCxPLsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: KpIxFfTGZVZXAuoCbYUM3QCL1QAwFZF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_105951_032203_C7849A58 
X-CRM114-Status: GOOD (  10.55  )
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

The ebreak self test enables/disables guest debugging as a part of the
test. However the KVM_SET_GUEST_DEBUG ioctl doesn't actually do it.
Fixing it by calling kvm_riscv_vcpu_config_guest_debug.

Fixes: 6ed523e2b612 ("RISC-V: KVM: Factor-out VCPU config into separate sources")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b..cf6e231e76e2 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -538,6 +538,7 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	else
 		vcpu->guest_debug = 0;
 
+	kvm_riscv_vcpu_config_guest_debug(vcpu);
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
