Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EA6C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm3+Jga0im6IY1hXrgnj1FQbq01I/ZCTLHQfUzSIfs0=; b=vNShqnZolqByjT
	+6MjqmM8nZe1Iawcp13+VQ6EIMjyWAfxlhgvkq1Beytz3ejGCzR2qhh6CokOCNv+mSP1OyeE2b0Nu
	oEIEabFpuQLjOd3eyqLVsQzL5hxLTnTi7nnwM89W0OETJhyLxxV7Fh8wwPMArw5MbT/e+EaV6BH/E
	nVRjkSBDKoE0x9DMj4Z/apVf5+K38TXc/8f3MNKmjOqkaS6oenEuxZSjpnY3ZAMUe15P+zCNaDvmS
	5ezTS+9JIG3S0Un+mzayAW+WRqoFiEgRRpoWaAPs9TeY+fYHgv7/4SjKLU2mTTS3iPC3lLuuDg3ET
	M9Wm+eAwPQ9BZGTe4DZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmoF-000000028n5-1h34;
	Thu, 09 Jul 2026 11:20:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmoD-000000028lO-0R4y
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax95S1483629
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=; b=iOWfjmK8f8Y+DVJW
	EcnBVbRqoFetWpR+MvbIm0rNsCYEYiCVdv/jb+r7ZZuAst5pdACVTyVPX1hk4M4R
	UloW32yrnx0br0O0OZPBTsUXsGcPSz6fo0b7Z9SsSAlawkneGV3knPcGuKS4ecbQ
	qUgL7kJ1kZwezKuA1OHch6fG0wR/9IjoD0gaRXopgi656DtKQN7lmNG5nDcMpELo
	+2tydKrnvkk1mYPsPWN5nD/hRUDpTxejd9pRgo55t5XyFzKGEVSWfHJeObs1qXCX
	o+wuU7kKSC/wnWW5kZ8U0x7Pvu4fl9GPrm5rLmSBf6RmcKnNqHf8RgkEBJ09ZjsD
	t7y3cw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtb6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:20:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so20513981cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596048; x=1784200848; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=h7QJriVZuTgvOrv07H1eaxDeYk/QN3U8KHvfIPc3JdCOyxq95QEbKkHDoZpkgz2dr4
         Mh7Whc7viyChmYq+uUSCxtff4YSSFByb9VlrF2k+zC+TsO3GohB2FVkrdWuvtBjm4mEY
         kjuZwX3MbRvHBvxU3yM2G5kI+KsXxgmPpKQJTCYSqUTe4qlzuoZMlGTcr/LnnXbc4IzO
         idi8k3QE30mMA8+8NG5tUJY4/V7NKpwdLgS6p4OsJXiWQ34yucq49lXE7/U2Uy53G3DT
         8Gb2cbzdDegvp9hy/zXpKWWYCNj6YORet4O+saDIyUC1O+VjTpcof89Q+lAocVyPCIY4
         aSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596048; x=1784200848;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2VXUkO/1Nfb5542An87XlKwD9GRDm4PLC6Ooi7YQSk=;
        b=rHdmTUccSiTAlTMod8IbP1B/KAOpj6tsy5g8Z4uxcpToLEeZUyATfBFsEYdWsIOk3W
         9Y1sOUa3Uo7WMEMSFh4mxcfoTz2MP1z4n2fQk7NLUaduOy7kFRr0IlCybRIIbRbw4uTn
         lBwS1HQUM4tsxGH4LretOC1z7AEwuiEEuIwXqH2w9JiXtX0N9rUf+wstzVgi3R6XNsdn
         WJFkldwVLkejEftzBRqv0JFmklGndZ0HAd7mE3ABFRtQDicyDVRGWRaPQ75FgrsIve4X
         sb33/UByMywJ/NhdwmC6/s/kJ96T7lkG0bRnESLUWXJVpv/r36LdSGNRMoZ9Dd2aUZN4
         v+iQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKD0L8kBoOua/qH8idskVwC+LD6u2/E/4kFujQfJ9NYpPa90mj6J5+J4F4tBJzBHXgogpadKUJsFNSEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn2zke6evww1nlqDZKgrjlLJ2JBY+wQWR2+YGxe3C4Bby29Dt9
	yaPmuXJHnh7/8egUKMf1bGdXOJQOOmAn6mfG8MuiAiQPR8s6Et6G/hnKcWUiiuFmeCzYjuz7vQk
	A2U0pbB6F40PjK7YXGaefmgPYduNUQhY5gMtkE2UG36r5yWlGLHBu49JiL6xbyMGpEC1GQjk=
X-Gm-Gg: AfdE7cms+Pxg2Eu1/zhj6bueyA6OfrqFjMhmtszqUPOrkGgy6/W2HHrSdfVuUzDMRG0
	mhFGqu1ELuLniyHdcNqHcvWHilp52RpmHZy1dZFLTlXtvfjLLe0KrZYswbyjM/g4lKODpM85Exc
	XINy8jP+KeM+cxBJRWjz8NI3SPwHbqVq4nPBJQe/8HwWDJLJZeY79vK+GryFB4i2X41NSQP7heV
	T0ScojN9b4JNKNMmyHQMJnq5K4IqqrQHE9PmPj2xKe0EoHFUj68krjaTWPUm7RT3rFWXcDCM0a9
	zqXdOEHl8IiDkFFgW/GiY1bzeapCrErU6QPTir9GskCuuxA0lsx8NYDvKtYUuxp3OsjRlo6iwrn
	fftUjulvlxrgo1uo3bv5c6dznAMtw1OjSJke3zADiAMpsDtFA7p8OVbq8fEmO7A==
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754781cf.27.1783596047568;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
X-Received: by 2002:a05:622a:251:b0:50b:4491:a2cf with SMTP id d75a77b69052e-51c8b30365emr71754181cf.27.1783596047072;
        Thu, 09 Jul 2026 04:20:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm1861799a12.31.2026.07.09.04.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:20:46 -0700 (PDT)
Message-ID: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.181086755@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.181086755@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX02x+p3nfgx+s
 AXZtuLNLDT+qpZwOktGqW/CYT6GoWBN8G7TwPhywauDIsPKhHN2wcfGHKYp/BiJ+bsbNVF4oa2a
 lvmAg5m0EjsMoPiKQslit0638JceWpo=
X-Proofpoint-ORIG-GUID: pNadCcSVhSRB753kd7yNQ1Gx45JzVxFq
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f8410 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=uucGcSui7XbmpEV0VHgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pNadCcSVhSRB753kd7yNQ1Gx45JzVxFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXzcjn0ZVcD9MC
 VlldhQCSvdeoK/+BAEf0gJQjYSsmBzMrGCh8s2KV5f05S2uXjqfDdAA+4OmoFxizVmmuYIWa2o3
 Bm7AbDBqnGX0P1zILywsqRM0Mx1L7OzYNzyDW3EBC+YPBlE1v5qW388TkagyfuvEQhgpjz0mFIr
 gRhROOan8k6Wmrw+R+D1sVAucdTo6DE5RQcLEGoeBD8BTUasRLJFwwVV83O1KLNkdDL0Lgya3cf
 cevv+i/tc1PdteMlPlHXmEcNoVkjZHAwQy24ZRdagGJ/uHjLWNJkwh89c7IS2uGPcCOCTq8X4T4
 JyGOxfJbk58clgXrmItVtlec1C5J3R882kCOCqS+F8P3FmbIXO0KJVbiim2pspQGSYoLVlYfppt
 XnpjsmNgtOd7qgad3snzLw2YRH3acky48LTB2XqwtVi9A6Sc8Dkdk9dNHys2KYbW4kghngyywZB
 mJDocofzOnaMrAa7D7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042049_151122_AF396BED 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/7/26 21:06, Thomas Gleixner wrote:
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>   include/linux/entry-common.h |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
