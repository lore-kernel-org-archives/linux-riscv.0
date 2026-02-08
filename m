Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED3AEF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 16:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxesVCVtcTaKmaHGDyhaGY/vsJZYh2JQ8f5j9w056jQ=; b=bKq05t94DGN0ZO
	tNuGK9sDpveyF4GWWOQvoqa33zH/Q/NTVbbkFnQIiXaLHRGWXmbKAapdZAZAJC32yR8pglvqNhY4f
	OZIVQ18Xd/Wav54snGme6bg6udpKchBhabBFMXTT9ZWKcgyxbonA/xVoMPgeauMv31qCInE+1/FQK
	/pkC9geHZcH+4oj5563IWs+AMRgNdO6/ybIxq0Wzxtd+YCmQE0WOoK5EleIyhDvj6ZKRofzt2gSya
	aPe2B4qaSfwPm6qTpyO00MpNf22eCwQEk8Qkgkn2LWGc6ToWrvMesWDbF+BhAOBd9eK/vm2FgWzrg
	DCs9OayTh056CKN7rUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7wj-0000000DUgo-0ghB;
	Sun, 08 Feb 2026 16:47:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7wg-0000000DUgS-0OjI
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 16:47:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6187sVH11476683
	for <linux-riscv@lists.infradead.org>; Sun, 8 Feb 2026 16:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDesesvDITBTW+QHoO6lhx2X
	LpGHZwASNOTWWBigTb4=; b=lrOX0Yz1cG3aS0sWHSH63sRkj28qPlzqPUY2+pOu
	2fzzqzO/4/CumcVN5/P7OJLT8a0+Q7oeQkPE6zkEVajFqE0xVlXexf+2s/6aSR1U
	b4S8Vp6vOAJ4NXlEtRoQ3Tbkjs7pzfh6+RxnfDNjFclV7by9KDNILjFNU45RpSTy
	5bUNlCaEZ0Z4E/sCD7n6DtcJQBHKzaggxmyL5E3gXySr6N2Zhl8Dxg93Q+2Z16Ys
	OU2TZPY6CXBoIx6TZE9O4xAOvy7+oLFkvPT3K27sVy/1MAuKAehQV2XU93xZ0cHZ
	wQgpJtXy9JubWOXnBwSODPENvrIoLncGrGQcJWFyQP8M8w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c64hnj374-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 16:47:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b866e72c00so710451eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770569256; x=1771174056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDesesvDITBTW+QHoO6lhx2XLpGHZwASNOTWWBigTb4=;
        b=JUHAQnnnW3OwTukM/adVRwVw5yhl4Qs3f1a360YyX1XkdC1f1OrRbrX8PqsoRZcLYX
         pPZ9/XpAWpgKOT2ukU5o+jGL75AwrorRqwGS/omNUIRTu8suMn+zD6Il/2706hoeQjKv
         xnm1DeJJFY5kh29AFMPRukv4NwF2RXTqW/s6hCNg8lavyOpPPz7IPxirnq/Q9co4tV9V
         tAudN/fIsMxIpubb/l//LNswf4BLYjXih9vTeY9Ho75sB/MBx312NbWren9+5bAnd4Jq
         jL22umZ2Ncj/93/Y4wWJyorD8gOXfG3qBPO39igKlyHTGv+WYOKOotKbmhqA1aoqMw/d
         uIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770569256; x=1771174056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDesesvDITBTW+QHoO6lhx2XLpGHZwASNOTWWBigTb4=;
        b=Cdh9FmrI2m45ux1ue6wEYEpxVF85bHljS7szTGFgnJftauuMELDFaPctMFezZNKKp1
         P6424xYIL0+5PK99YIhmfFBQEXAxAbHJDTe1DrD85a0ld9BW3jwzHXHMi6FdmFxaDIZS
         /5IrVvUKnBlljybQWNfX0y/tCXJzOAvgRWdMYaAF4yn/ygiDgZtqliAHwhIelfLnV/Z0
         Cf6SoiGnhwzDU2djbG89bqrNZN2gP5mqdb/RfhIgWLRDq1ZXvs+76g+gnLQBRr0sCYOk
         BwowwVX/7q09Prz1/uvmLKABLqQ9QKTGwd7Kc7whvfaOOp0gHahs5bb6uXGVg3qu/7RO
         GKMw==
X-Forwarded-Encrypted: i=1; AJvYcCVUYZdxnWf/ApKlRjsOHHcGRZcfL1c7ZCTSKK/qC0YISeAH0PqRlHKKq5Y9Xoj94i7m2hXuxdX44/+7Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbdIBRXVeIUryh+vnepcckK5hOMKp/9Or5WO+40ueWZ7rBImRb
	0Cz1aeFjVN4m/VFtY/4D/6ROrFaY+82E7sAsDpA2E1M+vfLAokvPCu5PDbw/lNwQiO9DjJeXwgL
	6OCHY4oOa/mok9HEn1Sv7oSezdzhtwggbMhjFv9+/cjjDcdSVgxITyYFGOPSVubeupZWKIdk=
X-Gm-Gg: AZuq6aJSVUkhSmyaoU0LPN4/wAPe/6a7KdT7XPZwIeg1b0R4y3yxVdvx0X9drGRhGCK
	cVW8+LoIMODdRpuSqwQ8da+jgv04wyUtDE2mofoDsZCzjVYioUaj4/pbu6cR2j9cxWHURBEL4Oh
	kF12Agp4nWwqUddB40SFLDBW++G8v34FV6QtEDRP+5Jc4MS335TL0EYG5pehGQjWJCGE/Ocw7c3
	wjVML+CijC0SugbV4TnP3kyzcDn52GGUGml619fufLwwfjTcK8+4iPDxVFiIa8qcyg2/l6EWQRu
	k5tOnu7TcnLQrzdWXNgZ9bg5i3IjqU+6gDIIDyz3Ecjlx3L/CvgzLRYQ2FIpnY5D7fS6LKmQ7YV
	EFNe1DWInTsdS/xExUAw=
X-Received: by 2002:a05:7300:80cd:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b85647b8e0mr3090497eec.12.1770569255661;
        Sun, 08 Feb 2026 08:47:35 -0800 (PST)
X-Received: by 2002:a05:7300:80cd:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b85647b8e0mr3090491eec.12.1770569255110;
        Sun, 08 Feb 2026 08:47:35 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7da4esm5749797eec.28.2026.02.08.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:47:34 -0800 (PST)
Date: Sun, 8 Feb 2026 10:47:33 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/8] riscv: hwprobe: Add support for probing B
Message-ID: <k3riksgjci3jw7tgqf27tu6vrfxfs6e7jo5jinwwadyruyqgb6@apqyim4zdcqc>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260207-isa-ext-parse-export-v1-2-a64d3a8bc20a@riscstar.com>
X-Proofpoint-GUID: loVBGthS4pMgFk9wGZFf9Rolurgp2ZFU
X-Proofpoint-ORIG-GUID: loVBGthS4pMgFk9wGZFf9Rolurgp2ZFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0NCBTYWx0ZWRfX7cnA7u5C9eNu
 RVzboL5Qxw/sdVIKMME14sIWXMecLCGHuYHRZBRCaKVsMHsu4NN4p1cAxgHC3IqU7h8x9fjPc6W
 Zo9qSYKzGGc6n02wxYBJYwu4GDZlRQrxYyYYLjvlsMFIrOGSPxVayW+Oly+6smzLhmodg7IdkGz
 lq61JuBuSjyt5BjcxcM+vm2GfNp4SYP+VPcrngzK67ebNxKyRAwaoeGkQMV2Ylj2onsxS0pPA4G
 AVVXuesoE/H+EcrbUORYFl3LUOVelJGcT93Ij9dW5B/JdX18b+Kj5F7CFOi1NfI+1+dm+X8zgLv
 Ehh03KMtwRJ8NbGChTQoVECjNjoSHSX/sZIKat7+TsgunEhyG7gdRpe2o/+BmPKBk4mINeb2O04
 Uq61S+ajoPI7EpXQfBFhBALykSJ54LQf4CBJntFa5OuDGBc6IBEteLaBxEaTLBOOB6/0HQNQzYk
 Q0bmEXPeIRnr0g5lOcA==
X-Authority-Analysis: v=2.4 cv=SNlPlevH c=1 sm=1 tr=0 ts=6988be28 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=dSXBePox3ueF-X1Up24A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_084738_148585_259D6E28 
X-CRM114-Status: GOOD (  14.86  )
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

On Sat, Feb 07, 2026 at 06:27:56PM +0800, Guodong Xu wrote:
> The B extension is a shorthand for the Zba, Zbb, and Zbs extensions
> combined, as defined by version 20240411 of the RISC-V Instruction Set
> Manual Volume I Unprivileged Architecture.
> 
> The B bit is added as a system-wide check in RISCV_HWPROBE_KEY_IMA_EXT_1
> using the global ISA bitmap.
> 
> It should be noted that the kernel already exports Zba, Zbb, and Zbs
> individually in RISCV_HWPROBE_KEY_IMA_EXT_0 with per-CPU granularity.

For the rva23u64 base behavior rfc I opted to not add a B hwprobe
extension bit because Zba, Zbb, and Zbs were already in hwprobe and
because I added B to hwcap. I realize we have 'FD', C, and V in hwprobe as
well as the 'IMA' base, so I'm open to adding 'B' as well if that's what
users expect, I'm just not sure if we need it, especially with adding the
rva23u64 base as a quick way to determine B is present along with all
other rva23 extensions.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
