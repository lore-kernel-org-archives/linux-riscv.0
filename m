Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F164AC624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAseqRg0XL81eH997gJo81Ok/IQ3E6ZxQyZivm8YCcg=; b=Xhp7FQw0WcDsYB
	B+Lx1CsadVzOIPQEYjcATscW4yKQL4IMAIB53ZBWue8z27oyO6iVS9f+uFX8sjwwqmKdMq671+Qf8
	6rLOwULLDdq7Mlpeqh0Kc2MDMY/FTDuFgot7zG/0pngIaXphvBy916+b0kwGeKFj6F4bbRBRrbxqp
	awd2lZ+mLySK8/cUgf7RyGX9i6yEqFe6f8wWt9w6R+24hrspmnl6Xd3RxcvsV4xUngvejOTlzLaSx
	TLx8j8U6QB2L9tFsbqCp3cPXjRbI7O/CyHyLYscTQDXZDDeKC1uFa1uGVz1l8yOmJk3J75yZsg2Di
	tH0+ixWDB/cVd6OyJFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Us-00000009lDR-1wuc;
	Mon, 31 Aug 2026 15:00:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ub-00000009kl2-3Go4
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETWjm3807963
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TkV4Y148NbG
	wrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=G8PfWLu5yz+mM83PnY4ZUwB/ETo
	+sdstrb9OxLlo5Ml8P78PUXPNqbBTBjnBN6zYyFVeyYfNuOc5ie+sXgzC4nZ6iDV
	ICMxCGwR4l/IKaHo4NTR46+b0mt20V1mEvtKf/4kzdd2J2MkGRaoZh1eJjVdOPIN
	G/jsFq7vb8UjmbxhAjBbBdGpm37xfO6aM+zlvAfS5ILhIM7wrQXfmU2qnMls437o
	zEZwaZuU04XVprmvLh/S7frIJTEvC0aoL7k1B4XPpdDRetkeldXq4QjIajnF5fqU
	u+BI+GBjxMO1s6qQeL5OwHpMb0doivLXWhnmbtFiLnh5ziwi8I3DqEhKVkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbamg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so325306485a.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188412; x=1788793212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=bopTnwse6PrfGiboZGPaTilwHNQ4b6l5cRPHZ8ZRPkhqd1on/bidKoRpzADdfT9Q1N
         ZAijJ5DOuEGedBLplphK7gNxzz0FN1noRiz7Np+3MinlCWMYLLViZ2siBVGaqghNBpFa
         HlMn71XPaG6GRe3gEd7PEcEQG5MgTbdNW4/EWuuggG+g2lpDnO+G8vDMl5iQ/3w16T4t
         ss8YhdnUux+pI0/F2zStGyy0XwfvskG9Wz8TEDMwlxIZ8a/QcskR7OuYvINLfgS6oHaB
         gpcsNhVx67/vC/Catu0zxjM3xzuW9C1iukbFap1c/5Up4OodAtuqaaKbdxOS7ZBcSdly
         qWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188412; x=1788793212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=C+T4jd8YjtVJWebsc7O/NdkkmpW6PA3JNGDE5IStQbkjqSuDnGaITM1zekcJmZmcPp
         2f3LyOUDx+j+erfBol//TNOgaoUydS0VY28JuWfK7jlFJyWDnUc9HaR7Qdqqzo0Huxyi
         cwXYqJxzuzHHL9gNUc9YsKQb52fCML8BUDGliRZQu0GdO/PMZ+rIivHWnMvyoAOUsm+3
         zz0Yw0WN9gDkNauSro0nH3PLU3o/fkXew5OTof5B3Edlf/jFa75D/4Cgi5OYNUXatJj7
         6wDuWyVz/LVRL/Gdq46FKL0KM2Z/kLPwneKw0kuupNlmYgJfdSL0L83wKoYGrBPLAXQw
         +qgw==
X-Gm-Message-State: AFuF++lfPmV9RMVhb2hBey/5v8xY0W+kapQODVMXkSlBYpB5qyqwec0P
	wnTsmeKCMx0a5z4F6NXRq7R12+OqsIgmFVYowtlyyh++M7ucRdvU+IOADYAsCVW38HrQXCMvIVh
	1BRRcozKWWiVC7Vb7K1n454okJsjn/SuqZJb0zxxMUtQG8uwUtCluTDgMzLGwX2/D+Y5OHM+K5i
	+tXpA=
X-Gm-Gg: AR+sD11u9HogxKBNxp60EutUWjUimacvBxKd1QO0f7t5e+4gUxFkFIIiWiyr0v5sANO
	qB7Byn6FGOvzzZzI/LoGsTNUYG2Nh1ZcBTrcELErt7YFZuw/n34hlmQgge4pPNep8Dbs2U2siMc
	Gc+mJaMp8iDBQJ7CtgCOFyzFk8NgYOGCMHrJ+P2iTHBbxknQiREjlzHRGfAqartesMRkt9c6Wfm
	moGq3LQm+n8Nt7xOQACXwH7cZgqqiEkIVKmKDZHuxR2sFR9bkf0Z0NIBcJj5hVRk3uQHLSAfZAA
	BfZRJYE7XVy2S2XfXBAmR2AawWGKhCnF1itgcK6riwDbNGkEXou/28iWdyNQZcgqIjNcBZ4s+1e
	TBh2nl4QXJsOXfGUPshUue6uRF1AYDXyPQ0E=
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr3163667685a.30.1788188411399;
        Mon, 31 Aug 2026 08:00:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr3163645185a.30.1788188410537;
        Mon, 31 Aug 2026 08:00:10 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48440e4319bsm1480512f8f.4.2026.08.31.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:09 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v5 15/17] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Mon, 31 Aug 2026 16:59:41 +0200
Message-ID: <20260831145943.313726-16-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX5bdDL5H3b9wC
 x8HpHiQ0NeUa7NtO/IgZ0okeVp9YJTyaRt9+5bMmhyNPV1xXA8k9aZNGgUYMNkAAzkwq1FCbJDb
 VhI4/XTV69Rweo239IjGXzIZsjW3f4w=
X-Proofpoint-ORIG-GUID: NdxBMmIYcvd715wz9-TEjhPcKzyHBAHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX8sm64avDrjwD
 o5nR7J4/CaToeoCv6Jk05+ocPoGP35nE8NF8nA80kzDYf/SHHuGi8wseZQa9vSpwYdJcHHRUcIx
 v/c77asj3EdzSkv66QbtKUwAiiDDH/yTZXyVTb2I4DJ8HMyOR5ZjyqLeQXeb//aLQghiDcdKZBx
 1TgrCwZ2d07GlecYGxzxNfjYN+pqJipmdx7OJ6G46Dj7Sv/3a12kXu3/i/RUjUigfjhcjpXY9+S
 OuXcEvG6grTUyqxwwJfBsyilYz1I2u4TuJUDf/6Oo2vPGhDdVqDFkFcJcANB5qpnps8MhO7mFbU
 /iUCgl1FMTCE9uHmjUiUokQb05P7NUXjzjVkNaftYTsdlv29trVljSAmLA3AnY/UwY3t1wqbc37
 PUynmTbXbMvy7JOQev8GQQf7UBBNtyLV0xhAzGebRsXVPPFbAwMjYmqVAW3ousuU2lmq9OJiv8u
 YKGN7DAg3Ju7r1K8TKQ==
X-Proofpoint-GUID: NdxBMmIYcvd715wz9-TEjhPcKzyHBAHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080014_125093_53DC31BE 
X-CRM114-Status: GOOD (  11.29  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
RISC-V KVM guest can be notified about VFIO-assigned devices.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..49179aae9504 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
