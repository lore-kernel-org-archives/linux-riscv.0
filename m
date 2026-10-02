Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98DCCA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOykFVVCu6GixaxsUN13zZSBpSrgI8PdvLv1DYYYlqs=; b=mWipvXpy6XDX/u
	Xa5RaL1GXLDR5+QqNeq/eXtQOCBdtF+KSJRtaGNBwhdbmxC52LfHJ3cK6Ni1ofyckrQMnWDY8J8im
	mGiYw7nVF07VSKJB6xjeZPio8lLmdC213s3BOzk8lorpMi4J0xceoNMnl6ZuM33NoeeYxjuv+WFLL
	XNwvQwG0eizX05Zo1VUJ8y8Juv6FBagIqneBKqyXEtRoPC0Zd+hShkADv+VyavfZjqtntT1tmLe2R
	t5yobGRSCSUPYBzCHq31+ixP9izima0pQi/AyhkxMM0BBFR5fNpYw38AKmGFIxxknWji4vSDMvfdq
	cxtxUhWPScXQFKvin7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTj-0000000B7yu-2lHK;
	Fri, 02 Oct 2026 09:22:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTg-0000000B7xU-42a1
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 09:22:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jEkg1068100
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 09:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=; b=WZchkmoIHU+qjvdF
	/Z4KPTEmCXryerWgvQ5fMse1US/iYI3wSkEpZRyO9WGoPqieh/8rC8ZVWMQR53lr
	vVUFk2iL9fQeVLXDEmpuSo2Js7cVYiLeHQqNpb43C20c5ZUmXn2YarQfNNEkG68t
	+7SQlclilqHXNy9DFUlBTX1FjK5EJXg4SQcaCzFuK26QOVxPZ0AbXZP7oWjPQD0T
	01n7maRnfDajUkzt6JUfyhrzIJ+C0DdXjqnhRFMAOXFoHjGtujKRYPlcgJxlaRpz
	HFuP6osAGmZzvF542wWwco6DJXMEycU3I/dZwr3M6huYJgtvbMSyVIwZTtx1OfDV
	dEaXfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukc6cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:22:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so7814542a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932967; x=1791537767; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=Wamf6kay60+Bki34mBU42dPxNLzdDX1OXYwEcLqU6HgKhddXO/eJkCVYROJHVmGiFx
         LTAEXqwW7YSc1mIj858OCh8GCjiQFKMifcmDuVHErpbkPGS5gqwEdC46kxz4f59ZQBHo
         c2mTMvCSBcllCuqWO0a0KefUaoZ2lCznhXNMMla4Nlub8hgMo0xlRzwIkXVW34Y7tUoX
         01eIOXeV9j6Dt1ESWuS5gMGXdneqHiDWcs9VohX0Sx79G1QZFpVGoj6f6mvoZjyWzFtN
         IzSbAYLHYhn1CY0VH5WDJNo6oBpTut6iPosWASBs6d1GCpxIT1mU9Szt9cWz+MXg/idh
         nnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932967; x=1791537767;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iqJLw5FjSYIhQ1eY3WdJE1c1w6PX4NxQm6ZY7VQdn4=;
        b=vDTkw1q1EgCahWvgS8oYDTQwxc2N244SW9wJu0rgn4+FFCK2I2coHfbuPKuKuOmvah
         uh83dOm/ceAiVBrmcdvk/iqBhv/py2htKYEU7R9cIdbrEu4v+VA0AmKF1HJ7k8tI5uSQ
         lBOZ2Pm7PMuwSfTxP3/18Q44j44WFxra7It/pFcqkE5/NL2QfL1qDK9xFVD0RW6wNQpn
         HREncM+dEkp8Kk+Z0De2reIbA00CYU4r1UV2l44DfOJUF+0Fl2Xu+gLa0X2bh58Q5iOe
         ukh3XUNzI+rS9wTspC2DOzmiCLQDtn6uDfVLSrrwOsdAjNqpICymM2897cofbObI7Prs
         ZIHA==
X-Forwarded-Encrypted: i=1; AKwUvBzrczYHuwROtQnqjMR98UYeCQixLn+JKMuiUgRPkod9wa4zOQEOXRn1QcbDkFiZM0hwbd0CPs8PyTsV3A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLjOsJrG92oirNgTTsQ0UHbud1G9ujQqx8L2ANgOTU9NUGDGVsI
	/5SfY9zF7SWnwQD645O/ZBG8dozZ3kEkyMjfWIFnuS1I3/G+/vkQbPVStotiaxLmM12LINMD709
	GeCFD/M210uP0QWTpzBZzzFO8sf5RqSLn7+MuyqHTtsCiHdot9z/v5KQq+e6AZRkmnozN+dc=
X-Gm-Gg: AYBFou0ap6OQjS2N4/liTPFgV/pJLUh7rLk899Wuy1LTbURrmTJklv8+XIFcCAJ6i2I
	9pGv8ZlZEAPw9mCRpgSesC12RZVS5LIm5kvWcfrUYBGRZ5rpmOCk3ed3Wi/uF+f/62S4cNLCTEB
	KbaHgI3nnwSZhQP+ixOnR2pJNKHOgu+GbAXcXnTFz3i0LcSI763xOyzdJ0MvZkk7JyLwp42r4QR
	afmERdg0gp0/Xv5G9OgGBELBa+EMfbK6HD87Qm2ZzGTrgSmZknLeuf9+474VAZCUAfGc674H2Q6
	uMHFrmWUVIBDp0ReKXkJPgdZnKgz3aiKsPl8tgm0qjvUz0WzeEvWR3ndnCNyWMjQeObpGv2vPa4
	LIrox5jiPuOsb
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834280a91.61.1790932966353;
        Fri, 02 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1e42:b0:39e:6c69:f47e with SMTP id 98e67ed59e1d1-3a6cec7cd2fmr1834240a91.61.1790932965653;
        Fri, 02 Oct 2026 02:22:45 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm616096a91.3.2026.10.02.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:22:44 -0700 (PDT)
Date: Fri, 02 Oct 2026 05:22:41 -0400
Message-ID: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX//xO6XuWRvT7
 2h3yvAL3Nok2Un3/pEM6YKoKNaOkphqDYyRhQT4hKjhp3ZgxhoenWmIoyesyYHPuPjkltOoUzTi
 /kDAr81nUg2tGK8ghvLYf8lSAmMgf2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXzm+jE84oi5Xj
 ciQIkkYmO1AsvTkyLdKNGS2pBnJOOAYil/H4YjyIo8CBDAbxmYJ3Y7NiRssIJ8lxdj369cf7rOL
 LaMwZcU7BEgjXeagUxvuDdVjZnr9Fu+uyrZwqVwyEGj/LF3NO1Tm9yIaUliWq71DPSVUgvh2G9C
 +W6Grs06ZjOeWUge0DdmUVA0/uo67QHQ3c6Vn3ksB/chZPQ2XsA8iJiakFEWppU1LfjSOxNHZET
 drcOvkxOcrmvmOUIZaWHQ+XAHl3SI5YuiybFktDjfYxZYEjSUo3MQzvPlWq2WXauXGuay4M2aYH
 QwONF/BpGybcDnJbnbaYPPwUBr5mBR3p1u6vfjuNJqk8Nhzk5AIoh83rx9W7CarKrEZGOtoZPX9
 h/+cIqNewkvmymBNzWpmZqCyytNiX7M35K8uIzKEXlpxwZpJUZPwkuKRlh9+bY06HEzJqPx0d5G
 jKk3J87cqtOB83B0+KQ==
X-Proofpoint-GUID: hf5fqXpMBwWGPYIRlEoj2WUHcIWu6L-r
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf77eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=xvfqbYfxAAAA:20
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=iwpyHwDBbu1AC0YlxIwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: hf5fqXpMBwWGPYIRlEoj2WUHcIWu6L-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022253_629909_E4C89E9F 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Radim,

On Tue, 29 Sep 2026 15:12:36 +0000, Radim Krcmar wrote:
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?

For DT, yes. The binding requires b whenever zba, zbb and zbs are
listed, since commit 0cdb7fc1879b ("dt-bindings: riscv: Add B ISA
extension description").

For ACPI there is no such check. But B is a ratified RVI extension
and RVA23U64 lists it as mandatory [1], so any serious hardware vendor
should respect it. Right?

If the firmware does not advertise B, why should the kernel correct that
for them? This came up in v2 [2], and maybe here I should quote what Conor
said in [3], which I agree with:

" Part of me wants to know why we should be going to a bunch of effort
  to cover up for inaccurate devicetrees etc. Garbage in -> garbage out
  and let them keep the pieces."

[1] https://github.com/riscv/riscv-profiles/releases/tag/rva23-rvb23-ratified
[2] https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com/
[3] https://lore.kernel.org/all/20260604-decency-salaried-4cb69e1c9fa9@spud/

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
