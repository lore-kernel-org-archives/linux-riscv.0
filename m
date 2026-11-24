Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2E606A326
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LUASDiWB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fhiEINlL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mw1QJSMP;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6WUQxe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7RSYEME6cnsmiWZNrZ3RpoVJ8WYEE60nj4GHUzZxuKI=; b=LUASDiWBlWsMeUk0qU6Xqx6tCi
	10HD+xNjv+YWdA+DJixlFU/2lc7R25tkWs3kCOyjxDob9y8C8tRTeHQZwE/TNuQc1jSh4AavOr4t+
	mSGUW0B7ROXlhRfDqiQo/iNVGDR5uS5RQ3FtKkHemSGAvQrTIUvuTApWIFhaupoMLaS6zrNwmLcqH
	JvE8VhWlO6G5sQq3Bp5kfbA8KyLkL56OKXr8oLGOXV/b+qQCP8XIVT9kfC7IIdbCFk4GSqWeYMJFZ
	RG2p0qP9puqQ9SRsFXK+l8+wBSD8VQSMYWkYWOLKP6zgXo9YpkL7UwbNwOUTp8l0I68cQ5PXdsEsm
	T+8DzjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt1u-000000073SM-0ceF;
	Tue, 24 Nov 2026 16:06:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt1t-000000073Rw-0Uqi
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=; b=fhiEINlL5DJqN8mOdg9QyIai9Z
	Io3IlO+1WBw5cwnasL5SyICMJompJ/wTib/a6u0P9LURswONtzrDrvkevX5ogMWHNNu3zwYXkORae
	kO/H7Q8gYvpUGNFZc/94LZ73sIjx43+KLqOZCO7EGVghImjnlaXvY1uqK9tai457DiLVkqK6Fgm61
	DSE5cCXuRHfYGY3nRud/Z25zx3ObikzMV89qAe1yFhgzo2zq9eU1ZP6dZ9D2XgfPrxuXt3U91Wl33
	uv4iwsyROVU+OS9J1UPO0mO25IS4n+FxPQ8U+lOWIXPsCAGHNdKWC4RgP+zX+mxt7AmIesILH25tG
	S8QKC7yA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt1l-00000004Jng-2x6Y
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 16:05:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2Y31183784
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 16:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=; b=mw1QJSMPkzhPdgAC
	WXDML3CeNT+ar8JzKKkJz0EtokbT34gjv1QpDPAmWC0z/LP28nDQu8/S/B6f/jlC
	K2mxkL+tJiiSwcTyE11oqRhZLBjzB9n3v4j1CPCjjQ9QE8n7hrqZ7FvAzzGeFEAi
	uZWq3dk3dOAO0k8LxWq5vV6DsxA2CjAtzff9lKiz3db5NFlwEw/7Yf94JcSFaOO3
	GJUY9bCCL3Hb7GYmrmLFiIH7xD2VEePYOI9rpgcvardFC+OU/TLvQtdmwu0ZlFN9
	cx9lbDw8+YmZd3Vj23E/tsuFR0MMQQXbld4j8cp+rMzJR6qcdwS7vVrss8ZMIhOb
	z18Jmg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky3jc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 16:05:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so6936954a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 08:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536345; x=1796141145; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=f6WUQxe5m4WF/Z9G889kKNWXaOwmgQY2liX8KVqGx6rH2rs3rLowJE6OaIhsXTn5bx
         OVZD9s/vKUllXGrmGzhWPxzTRWuDS1oS/N5OF5V+0QxFGx1v+RifC3Rw3aqqYr/u6DsW
         GFhFQYps33ovZp9acX1YQwJo4UhYtTF3ZQdSLUIaLydXpwZPTI/q4JPr5WCqGBJwE3ys
         yow+2Z0n6JHRkeqDI0HLVFuqQ3/daI+eo7pEh+LyXSrx5eqiVLx+quCuYa9c0f3FxOgW
         YWLMdBQGxdu+vudvi0aKxmY0qSbT/TaipZWFRfJuz12K6cO2j/T9ZRdB2vDescL0uM9T
         e9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536345; x=1796141145;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=fyFGg1CQ1TjbVXWCtT+saWWCPKXwdMr1e5PFAJjwhV4j3nQI8Tovgh18IOKdL5xD2k
         TDkMevew1Rh+PSMb8UQY9tgT4i/Kv4HBJATH4fDAxXyEUMVx2MgILDuUu1bUt9rOxWOc
         883iqD6fwEo/quZ+MWp8uTkxIn0O/dJypRm4wUEL8TJ1FaU4uIpj1Uewh5jNQiIgDkF0
         Boh+/KfkWfV9S1Nqr3N7D2uZgTNIajix9nRmbIQxVaiVasNYjcdbivK53WF8HVJYmWVn
         7wZEON1r5MefJBZdYABNYu35/tgjfJDz0s5b5/+zSi1fglMcCs1HGSSnJvjn2P2hSKX6
         u9Bw==
X-Forwarded-Encrypted: i=1; AL+hErFjmOGfvPbjy2xPDzQq5hD+WBrn2mg+vBZnu6YwPC8s2EXyuBfCSXbml+Ge0ffP0BMFIbJegX0U/v4p9A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/QgmqGN2x2aJOexm08zleYBJ9b1lo+9dooEGNzc8U0u2bv69pb
	QQC11cPXd/rXfjYb65kyX2eABYzrM0U1rgu3nNX/0y+9Way5cCixigN2LnHnNy/NJJTXOkru0j3
	mYcu83YogF0/zSXLVMAZ7sveR70TC9a0Lp4LVg0SwCbcthZ3Y/YbIG4SRfYFZi87aOwpAh4o=
X-Gm-Gg: AZFdTZchwqz9Uo1tp1QYGO0OVEIAn7aFdjuQ6kLmBvxChwp6oL9BFu9k8nQ0YGoow3z
	gYYqOoZTWzmxl90Y6BjfxeX8lmyLkLMKvr8nIhf1p1b2pmf+heg2gYcTjeE7UkWWVekd/ELVUf2
	YFkaKc8ejxOMy7Brfzi4HcGqiVhUfEQmFI+iITFdHpEJYPomuI6NVFNFIXEcsgwJagIVKGBNn0B
	EbjF38QvqDXL2etitz6bMFY5/WLSvWsRq8ZX4jZT2r+gsqYgaiHMHJPI5AlsbO0W/pvGTYWeBTN
	5Urhll6kA2Jrg9LaPZsZPR1uaTeWRpwWPd81sdXEoQ4C75p+Kq4T0KQlUO5hWOc2a2pMOWtVMNn
	iikpcixLi9axoZ4Z3LGOehGiLd6k4nQAaK++HHUX40S0S65rVmHgL9w==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552660a91.61.1795536344446;
        Tue, 24 Nov 2026 08:05:44 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552613a91.61.1795536343930;
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm23275610a91.11.2026.11.24.08.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 25 Nov 2026 00:05:28 +0800
Message-Id: <DN3KIA4URDQ5.2MNEHHDE6WLAJ@oss.qualcomm.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <majiuyue@bosc.ac.cn>, <anzoso@outlook.com>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host
 CPU
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>,
        "guoyaxing"
 <guoyaxing@bosc.ac.cn>,
        "Anup Patel" <anup@brainfault.org>
X-Mailer: aerc 0.22.0.r49.g9313f0f0
References: <20260817102447.40259-1-guoyaxing@bosc.ac.cn>
 <CAAhSdy2qwdHE7SB2gRK3_PQ6m_bMSfWpvcuSG-31W2yd3-UTKg@mail.gmail.com>
 <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn>
 <CAAhSdy1Q7a+54qn0xNBQBd1eV2ve+Nzqz9uRsWrGSmTn35z8=A@mail.gmail.com>
 <c050c85c-482a-4351-b627-ac074f7f7952@bosc.ac.cn>
 <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
In-Reply-To: <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05b5d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=4BKX8IsyAAAA:8 a=EUspDBNiAAAA:8
 a=M4cLWJfQvEUUaw9dnqQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-GUID: 2G4xCCZoUVfFpZMtO41aU1DAnrZDuo4q
X-Proofpoint-ORIG-GUID: 2G4xCCZoUVfFpZMtO41aU1DAnrZDuo4q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX0FCkwlLecTKc
 3IaTglfJ5+0cTRouiyAio3txx1Lstzs0wr9o4+QXpW6mnMdpku1wDi3zIbZExPSC2eejJ+KeOzI
 BrghfPSFWkWWDfJ0uaJN9IGWNUmmJLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXxDsX5lcn4Msv
 MGdSzLsV5uBNqEb+3sYtOkAExAkKh03SsF2A7uGSlonHFCJIiWHaJtkU8TiVLa1nJ/t0RvesLGk
 VhLUiLnffV2cNPsShgDHnCRxIcjufemwhuHVL9lIj8hIb40JMGa5KmzmYlSsc67y2GHNCs0KbOJ
 OepllDSaSP6uBnWk69tyvKnfkUsU19KxZJysV6ZUJR5B5vPlkmhbMehZ3sk2MhP/yd/uee6U5nF
 gSdq0r5yjbPlzxBgfFz4/xy2QE0D28xnvDCGQcyOdVY5SDwT6s4FgKChq5MT4yKyxOVHH0F9G8m
 ONyWdPdp3K218R4lmLm3Cqrn6X94aziO3cl0UfzTqxr9SZKzguNt9Wr/3JgoYa97WFO/HNmx3jl
 HtZ60C28bDLeyKCPXifPhqxG1XUlw0AssR7ItmwYWohBSrrNMnR+5camfSGov7yFBVBFkGVum4q
 //IfcNFxdX1rLyOkDrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160555_095462_B1BB5452 
X-CRM114-Status: GOOD (  19.54  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Oct 21, 2026 at 5:32 PM CST, BillXiang wrote:
> On 10/10/2026 5:06 PM, guoyaxing wrote:
>> 

[ ... ]

>> In other words, I am not sure this case is covered by a full guest TLB 
>> flush to all VCPUs on the mapping update. Guest shootdown looks 
>> mm_cpumask-based, and host pCPU migration of a vCPU does not by itself 
>> add other vCPUs that never ran the mm into that mask.
>> 
>> The earlier RFC note has a bit more detail on the flow we observed:
>> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33- 
>> e8c49c2331e1@bosc.ac.cn/
>> 
>> Please let me know if I misunderstood the intended invalidation path here.
>> 
>> Thanks,
>> Yaxing
>> 
>
> Hi Yaxing,
>
> Thanks for your work. To help review and validate this patch, I am 
> sharing the two programs below, which were generated with the help of an 
> AI assistant. I reviewed the code and ran it on my test system: without 
> this patch the reproducer triggers the stale VS-stage TLB entry, and 
> with the patch applied it no longer does.
>

[ ... ]

> --- 8< --- end --- 8< ---
>
> Tested-by: BillXiang <xiangwencheng@lanxincomputing.com>
>

Thanks Bill.

I reproduced the same failure on SpacemiT K3 and V100, adapted from your
reproducer: the guest side drives the same four phases over the console
instead of TCP, so it also runs from an initramfs on a bare board.

  Platform      | Host kernel                | Iters | Hits
  --------------+----------------------------+-------+----------
  SpacemiT K3   | v7.4-rc1, unpatched        |  19   | 15
  SpacemiT K3   | v7.4-rc1 + fix             |  20   |  0
  SpacemiT v100 | Ubuntu 7.0.0-30, untouched |  42   | 36 (86%)

Code and notes:
https://github.com/Sutter099/llscripts/tree/main/work/vstlb-repro

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
