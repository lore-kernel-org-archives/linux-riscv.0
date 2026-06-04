Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F244CD6E6D
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2FAYsZ+0HqaDXDSU1m43lvAlBLUAEXtABVCAhVOGd2E=; b=1RCw6oNB7eAIYV
	fCtB3o9wgohaNh4XWlZP4uVXattvN2MABZbnhfVEKmzYi/cKyaJq9eXory4vH4Jgdr5KcOaiGic51
	HC4OTLqqM1thO6WQsrQM8eFDq8nBQTRDT1w+xxQy6RGgAg1O9sltpUKIldCvI7oSjWyKR2xRsWy4o
	d4+rvj+znNYW83UYJcJ3krzK4sADSeAxt+cSRr5FVzoArlqM6xxn64+kjdDAedwc5w9D5xoceS5BT
	Gr3ip5NduvHdYMg1lkXPyTMwD10koawcfuDTzDmV+BYj5m5jOUkxPg0qj8b6Ayc1JT9xDn+tJ8Loe
	YMU7Unyudu687tYHuB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAXk-0000000H24q-45dM;
	Thu, 04 Jun 2026 16:03:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAXj-0000000H24U-2giO
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 16:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=; b=oP4GYmiiT+2jJLSczN8H2W1KLu
	D4LITmg3A4gR/BvU0i4llSMORu7RU6cfYB2XUUT4VtfLLRh2bzbr7y/TiFsCoD2a/5PxNPIDgW39k
	Q3Xzy/tqKivuHqYwGD/at/VPpulstAKWvLUbcYWgGHfKYhZaBCi4W49fmkWghm9jMWkeMDGBQpxaQ
	jLkBV+Sd9gWJIpXe1ERxCzCmFVzY4pKepfpgoh+w+DQ4oCcQYGbvogMGd+39at7iFEK1y77rxMd91
	AbmGcU/YPB6BAhxlHAAoAfYzkxaNjxTXIiiem/sRMSzi5TZjkVpMrFfNofEu8RSqc3Uu3x+YqfWhf
	USWajkjg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVAXg-0000000EY6c-2Wgk
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:03:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654Ejhc51132208
	for <linux-riscv@lists.infradead.org>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshv69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 16:03:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59f18de8482so1346493e0c.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jun 2026 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589013; x=1781193813; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=VLpF3acOoeP5poULMFe21nW7tazs5OtSFbFLDy479EKQ21UVoaW8RkvVWTl/DgaVlg
         RvElgPLb7O+qVCFG8bzVnjyh3Pjb+IMxfPWk1yADIBOc9iYKvo1gCck+Xp6oY47wiel4
         v16LAWRtKt3IKW8cHjhFQE/cgREf+fP3QIymuqbZpL40LJrFslQ0H2WivU/VmQKBYh1V
         4LK1ipzDewdS8awqG5HJ82S0JsPCbBtilFZ2gm5ywOrIZa/ZbSPrvgXwIFKhLZMsRW95
         djX+S4LKaOy8PioFYdTfCEIzdfe9PWoUHaS7hWfiqEbRI2P+O7ySIHltyP97bJ6rFg2E
         sejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589013; x=1781193813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=NCyVqUKirOhCGmIPmGiEnl2Q0EaUg523GwHcXdr6CVL53oyZw0Q6gLatyPTQb5/zMN
         J44T8CPWT3FZ3x3uYRgP/oxAwuwkJEdy2dO23W2OFq6bt8vGxMiuIlrmcuHdKNl5Nnly
         +j9GmEP1bFPDQjgG1rXdGQpChhN7R1HgXMOG1uWCfy4wyyEPMkLnHEIKlcK5iVLDqB5N
         zuT/t6lcJ+lCTbJYJ71hvAIlpLMehXCeKyNAcC9jZC+W8+fpoDwxzmxWVzWStSCYHPfy
         m9QG3lCYSIm8nrwXFWReLke/jRY7p3TlfC+VzodGSKJ8lBASKZaagzhdIF4VWN0A+99/
         qEtA==
X-Forwarded-Encrypted: i=1; AFNElJ9EXR1MvpzwMseEvnRAEW9e6CHoiQDyxDNurZITAN2YPnNPTM19QICAUOwkcXj+iKBVFWUFiYti3jq2ew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv5mdNv/A9nIFEIxrnsYZl/KsD02feXoZ0YFbTOVIx70oPHJGV
	ZQUt2F5pZjfG2inCJvQke7CDCsHbVHoBt55MMTVJ4y6xtyQc3tZrnj/8MpPAesYE1/14jGGS88G
	Qhx0XFIfEHabJ/9l0Ryr1bmUN4x78wwm86R/n89TLuEvD0JH7Zyxhmr/jMowl0q9qg6zEQqOv1G
	CqJ74=
X-Gm-Gg: Acq92OG2jaN65n8wvUjbimnw/oQZpZfS0hXs78bNmcL1P0CD/NPgXzpy/ls+5wAselc
	TQVzG0tZcP/e4UnVRR2uEgw9umCaQiPTwYsV/EgZBJ8R3sXKkpa/QIeTo1RA7gDJwzLYU/y7f4h
	b5oE5kUszVTG0nTTDZFW24W1sschsTOunh8iV70+SqEgw4rR/pyp/FZcqypX8bff1tyvqRLmua0
	LkLmPHy+LjwQTbcbAwqrwyVenGUhTBuLE4s56KSbdfl8SLN8Ry290T2s+OjrufYQt2vTOFB0D6q
	PukL48Zofweau4KOFQKbINnq+UU8PdY/EFZ5vPGCjuLF+QAhf2FAichOTbvKjnCBJJ9j+FNBOh1
	cucxUZzuQyg5Lc5a/l6aAhtKHJvOsJAIks/aEvqvaPQ==
X-Received: by 2002:a05:6122:7d1:b0:5a4:7e8b:3171 with SMTP id 71dfb90a1353d-5a6e7e5756cmr6081777e0c.11.1780589012905;
        Thu, 04 Jun 2026 09:03:32 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-GUID: u4XiSUMRXQhNtCkaYAO05bRiXssNys00
X-Proofpoint-ORIG-GUID: u4XiSUMRXQhNtCkaYAO05bRiXssNys00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX2Y5NNViywFmB
 nNd72iGPYOn8uPusM5G3aLTKXtTxkP16eP7K6rYzOzZ4/ZCkUNPkKX5qsVlXTKRAE/WafSvFweB
 OtkSv2AMC5itASKEQqA/O5NVAHkSPCkYOHcLrjirgXMINP0P7v1TsCBbiiTe5fp9AaM+y8fksc4
 GGfoWbDh2vpqCrPzCZ+2NyNTlYNYrA6StQcmUYx4oauqUmhv+iYSpviwyUsPhnYfL9Jogfgyhc4
 72AhfGLW66b6ZTIOMJ3CvuwAuacdXmMt7Nn4qrNNuKlgPPYnfELH4ySGDqYvwZYrLZn5/5vMgss
 MP26OPAjd2PwO4W8eQzqb1bUXcu4l19T2ZcR3uxRDpjVg/OUt4RbnZ9sgp6i2FnW6Bkr5aV2oON
 +vYsFArUx/r6XvN+JL/T9jFrEXmKvCj1LJgrQHq2A0hnc9So6KfgFNJi6wNIG4GcFlDMcU5JtDp
 EO7H1yuagKiU+mwE+rw==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21a1d6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_170336_917875_E120742A 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
