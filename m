Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410E9CD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqfQQVm5qpdHLl6jNVnx6Rks2tXX6YoXKyV8I14osG4=; b=3bH81Pnsoo2GgL
	f07iJTqzLs4OfXYHpgmIEPbGOsXV8md2eEqvagJZBf5OXcWwcF5jO46vNfb+nDsTMt7woH32AlxUH
	c/FG0felyI05tfkPc66PTtjbYlI+ANa51NLYqNhAXHP3RSJ0uGatlSG/5qdaCmpRwyx2yOXj10fNG
	PJJDlV+uTbsWp7/p2gnRc/K6TYuvcYgBQzZfC/VUdb2Pe8F3skgm9+5U6BWrDTpiV6yNnkTaq7AXE
	jIyQ0z3g4RGsAyhE3mTTjB48CFGMzCzpyAPOgMNmSpLJaYdquWXRtX+pVcmD5pP5DUak0+ozuPvDX
	/yngQcx8ge9IIErPHzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmLw-0000000A4CG-0kgv;
	Thu, 11 Jun 2026 20:50:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmLs-0000000A4BY-39PV
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:50:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3LWi1478989
	for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 20:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U12GqzKZ3dJsiu7QWLZpQE1
	HJAiLvJ1NIcLGrlb2b8=; b=b33fGFdmUmHrcWlfymGF3o/dulCmz3LRdm9ooGYr
	A74OgzAgDg/YYlewa5wd14Nlzi8BIlGZdEwQLu8DshZF2rFrVdHDjT79f50f+TrP
	6CbQOBykIMAXFDZTspCj7K/q8nPzO5C6xm2zOkOOttY8Ocny8Nv5Ng1PcefMWFHC
	Gb/Mk2sY4arsQ2Ky7NAQcahmI9qHgIhxy1jq4sCwmo58UWIXkNtFkeUwbd94VwL/
	nbuQRkMk+0/Wx/2RWCDCRUuYaa7NoIqiBSN4XSvQckfGYI1dhYmxEhusqZFO3tat
	ryxAxSA5vJsmH18JS/KiFRlhXVzh8vv1ZUqwq9/8xFcEzg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgvk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 20:50:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304dd917645so599980eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781211010; x=1781815810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=bsz9bfyJ3u5NMlTf1csIBzjc31zPs4NN0fqC/WO3ujM/TlRv8kksGGQ5NwgiVV1bXW
         tijzcr5bIaFyPaEIOnNxi2nNMZJKaAKzM+pl0+EH3emeWR3DEMtgvOPoCrAipoMC498H
         kEvptadvP98fZ3YmOwp0nIfjtA7GJdbqwIArQvLuau8WQ+3r5L8zmaGwNWyqq/DSWlis
         k/BNi7oaMYUtBKFPwH4WS8TMYo2j4tdFVMkqVjkFPDHLS6b58ej7DTn0vjOXW0UDsmYB
         vGilaLvn4Ro5yTeEOR10rUsqHVScWiaeKCbsdEgh0Pj9FZeyT0C8w3uyUhgINLyffBlT
         2zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781211010; x=1781815810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=nkCP+Y3Mw92Ad9TWnxdhbWLQh84H+J6GswBv4SZU+DAMnjO01LY0a60jo3FAEZnMlp
         1h8Oka8XkyMm5FfOrxC836BqFfSpsrNF34+x/+cf9VycK4z65JRagjRiXJPpjrpeNK/y
         VrIx5van/aCaPR5gJgLpqrdFmMAKSucQ/YQ5XiCsaAlyyDw50qpUXYgUKN8OUa+8bkvN
         R8I0PSa9D3qNinCXPty3oNaPJz8D10GWsT+YBlPpS/b+OwpNgyNU5XMO3JgXv5/PI8wG
         y1p1gxzI5wBHeucJEU3xuOttGqeSKlmSk5XqGfNJgXgf9zVG7NoOiqGQXmOGUSnUj7kY
         SvRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+AIuqpmwXGVBR+4WGVHKHmkoguGa9SqFj3eIcQReHuquWS6lV5VAx2vAnb0cu19N/Gu/HUc5XVDZAig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz42lKnRy32PGJOK3RPyJUX0H2Z0V6ug+HYJZYJ6mzs0A7VRYXh
	JzfnRKItRiTCeG3/aSkkVCvbcP8aGTEj+hNf5RvZs2lndC+/IW+oNIIFfRGJ6mJ4gcIcfOlcet0
	9/wY8YYX7B6KFAoBVeocRwUUhhsPg6Wn9/DVNp4TqunKKQoQW+DosyoR+OjLqRG1+4wJfV0o=
X-Gm-Gg: Acq92OFSt4K2t9eTmOVI6EVq1WaE64j6x8AtUqYSLMDz+Lje/IATEq98sUmtGOXpc6h
	veXRlXb2CoaW0Hd0Ocsb2RAhfMvAotCw6QzjeqL8Z4drp9onGUuVP/gA7N/StQjJJVJFU2A2twt
	m/KT/SCMTCsrNlC1xITVAwyh6okm8+1VVF3T5BjpBLaEPgy6sxd/PMxCxhGsPUkdMeNhXzmt2SC
	xuz0J2uDR3EiR0CLrDYxIk4E394ZWGaHG0EFzArGLQ/uMvgEEgQquiGj+ZHNC2wL7k5VBrzy253
	A25JD50CtCIXd1fX6Zxp2MHcSlJSrCc1lqBAL6QxgevuGOesqTZ2TLVL3lz5K7SYRkUNc0TpKo3
	KoMHaMnGTAeOnGq2uQnKoUt8GJJu0+Q==
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430147eec.11.1781211009840;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430111eec.11.1781211009350;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4fe55sm303031eec.25.2026.06.11.13.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:50:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:50:07 -0500
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
        Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <uttb7qknse5hk6suato3nelqatkrkoyo7r342pqay4wh6vyr4x@xestyyhoygtn>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
X-Proofpoint-GUID: -uB9dRDK3RW6e7m7phtCbusTAgjlAKuX
X-Proofpoint-ORIG-GUID: -uB9dRDK3RW6e7m7phtCbusTAgjlAKuX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX6Ek2LBgWiRC4
 QbjqkhtoMz3KDYhMbiSgW0ITYMPU6NleitTvadWCYMkSPAr1OJMQyjcA/FXMXDymnB4qQPUqeDb
 nwNom3dx02HCMWT5gCxDh0zea+b28q8=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b1f82 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HwFc7jivAAAA:8 a=968KyxNXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=acXkj6VtvC73PAOtBy8A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX5v1ipZ10zE67
 2iwl+TJ6Ik8GcB81D5Cnpc5k8l2hUGZPOEat6I8rKBOXh+CfCkBH98DZV8dQ8qE5gz4eJUiK3D4
 MWQ/Bh9FGx605yOP4n7lcy9NM5K3l88yor7wuillPO7NbiQgpWLGDPy2qZJvvrimXg/VDsvg/Pf
 fhxmKRnrBubRelHtCHu9xOdd9ObWEVqR06LbrBppagzBH+vnMQo0p9uRnOnncx0wETl+aht3+ag
 jdyl1BTm6HsmjtP1BIj2WoZ6UdxUuHg5merhjUKm+S3L7m5qQvfR+4cZUK7EWaHK7c/R3kCEsb/
 O6QroaQ9HbvW3iAv/PPpOaNq8HTemDasfrLO564CITEVs6cuu8OfWJl7wNo/8t6UFZuFh/BXzeF
 fq43/eFnFi2ZCe5hotdZStwzrcNZoOkwunKK2GfaO0QiH+joFo7rEnOuGtWnZpjDGU9sTKrYFrw
 ft+eI+IWlt+u7URbnjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_135012_915115_33DF7FD4 
X-CRM114-Status: GOOD (  19.44  )
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

On Thu, Jun 11, 2026 at 04:12:46PM -0400, Guodong Xu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
> 
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires each cbom/cbop/cboz cache block size to
> be 64 bytes when it is present, and export it through hwprobe.
> 
> Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> Co-developed-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v4:
> - Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
>   author, with Co-developed-by (Guodong Xu).
> - Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
>   does not imply the CMO extensions (Conor, Qingwei, Greg).
> - Add a Link: to Greg's confirmation on the tech-unprivileged list.
> - Add the missing blank line before the ZIC64B hwprobe.rst entry
>   (Andrew).
> - Did not carry Andrew Jones's v3 Reviewed-by: the validation was
>   rewritten (present block sizes only) and the patch is now authored by
>   Qingwei, so it warrants a fresh review.
> v3: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst  |  4 ++++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  1 +
>  arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  1 +
>  5 files changed, 26 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
