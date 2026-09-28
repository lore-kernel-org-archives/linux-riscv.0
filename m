Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F51C9833F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWdzrGw5Rj4/GbtYve3gWnO303tB9gBDw4OP3XhAThs=; b=YiM1by67W/f7qp
	Vpq7JKQStX2gqR2cLuUhXXoYwt04/p/S8e6YtE9bRmqWQbHKXAvWnF73JU02fOkoWcqUJdLClW+Mc
	1vr4CSbbbKPbJlCWkXQi6JTVcUd3dxbKAS8YtW1FNXf2Al7jbxpgrLMsTEn4ojZLUXdK1XcL9ximC
	4SRVlxP2uHJVT2hsGOSI0kCNVzTdptoZ+wP4rCRTnYpcnJo6sXEyFJXlKVgYyiuvWd/Q4y5i2VFBb
	9tmOSYrIpr4ztg3q1U8VEu43+lv0woHCKFbj+nm6UNHcICnbQlwo6DfGUVSDqLFqNmViCti7ZnzDq
	0ta86cogCBigP6VvDu9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Tk-00000000Kme-1QLV;
	Mon, 28 Sep 2026 10:21:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Th-00000000KmA-2t0C
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 10:20:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MIBj546996
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNvreq1RRV6+/G/WXMIv7HZy
	uYx4WiTqcHV8qcpeqIo=; b=hKFVFnf5bWxCxr/6oIfHPODASy6vBNTHh6i07HZS
	UTbq/qoAv6JZVNBYZwH+1aBstmm+aN7BWrn4Ebh2ZakOLP/kdDenS7Tq24jfFvtt
	L/r6BXWlloTHkc+Bv/V1TF+8Trl/SqsEw1jfJ0PukKSmHDEmppsBFeKBJP5mjupG
	1JPsZOzkj/DQN4B+vT7OMHUKLzgJBG9RAyMBhIekq8OoO9Ngc9eNoFYshJkVg2G0
	TFuOrqHa6anHINX+9K6bspSc1R6lEU2TPlRO2gbzJ2b8e/pcSKIsAdSbWTyszEC7
	cF+3irStk4OYHwitYEGO1W4Kfap2y7BwESqGCiMxtZ+3Pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4a0th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 10:20:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5c205127so287595885a.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790590856; x=1791195656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LNvreq1RRV6+/G/WXMIv7HZyuYx4WiTqcHV8qcpeqIo=;
        b=bPG3K44xX9KXXVhcaumMICGvC6NoesWLadQFCiP3TW0bu/TPp5X1gvqkHhiL54X2vN
         VkajTCJcHX5qoIcvYSxSNDcCl/8Z8X3r1l3SR7w/YQ9inAoPdChya/N/onEotO7Rwpcw
         b+iwS0CLAEzcROaZAwH/6TUtvYtLoDjurejWZMvBKJqf7mP7aZpdyRbVJUXbMH9sjVf0
         wWEzLpKpluYPPQtWjT99ZZMWH4mS+15Vmzc+PTuLNbK7zDVg5KuTN1kvoovqo3j1ig5p
         wiqd7cqFDE45hqwiqb/8YcgNFmO2iR56YO2BciOm86yccyqevqBY3mqqJGI2zU8+RCk8
         EV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590856; x=1791195656;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNvreq1RRV6+/G/WXMIv7HZyuYx4WiTqcHV8qcpeqIo=;
        b=D7+Us3DQjnccxJSqJmkAa33Yi0dgGiZA1R0MCoZNtiXNYXeKApo5VSMZWN/hlK5y5n
         J4pmENSXUy2AQO0giQUR3Ug9/LNESX9xDY8WM07qkhx+DsU5A3Cmi7BkhlqaVVfk0k4B
         BYod4CIYdJMR5Y5a6jk9Vdg9qieWcCFDOUWx4juC5/nWPnQoXApmVVCa82+6fEvUEgCH
         f8Dq1Z/ceiXM+fUNnyA0NQOxW2hq3ppA0m98dfVQBarxeq10QSMlMKdmCYHZQmKZwnq6
         o3qGBB0HJbo4pwq9XIdUCuFIlKHsjkfhOCAOOOBrC6BIdGZ/QiPraFTG48XX45GXhA9w
         OByw==
X-Gm-Message-State: AFuF++mrUlWl7cLCqKfu0pXJ+NKZtjgTe+0EuSenwbqDZs44y3ZP/f2o
	pABJWolJ4U2N8VIZU8mmBuADAhDRWxc0XRLHK47Efy78A69rNgcTt2oYrt90g+aHHpOx+pq+38W
	rrCvHMu1VhiI4f8mgUAFY18ErYvvU1ACTAM6vugubLho6pR+ml2smHkEaz+ePBoR4xKv3zKFShz
	DXni0=
X-Gm-Gg: AYBFou3Apc9hoXqk04bbocUrs7quUIioFBJkItSprIMvc4fJEbxFTXgD1yZOUJGcAr1
	EDzmVPA43Ghf+as4KM9p14VATzPUjbjf5+faW7eb8w8V/fbsO5LCFinX65fogG3oWO7nyZh7xSU
	paJXeMaYFbEUigz956J3BafbQ4tcgng4B9Jj1MXebE5B3SdDUiOCJTjmSyZ6m936FQSCJoFt9UE
	mJlWqUDyB1gj/R+hcOVdstj1Qdufco64hgUK0S6bm25vUyw7KHdd6bLDERO1Jsun+1/Au8qZsJ2
	JPIF0ZrKtVbfPw/PdJjRs4JST4nO4AHNaEte04wVnU1xqL7pQwXFixUmNrKctabdE96oXmJ/kLJ
	cZBJzQGWD4hl3QPer2qhYtlK5nq7tznv1c6hzVw==
X-Received: by 2002:a05:620a:40d2:b0:93b:fafd:3adf with SMTP id af79cd13be357-93c43d0ddf0mr1872145385a.48.1790590855785;
        Mon, 28 Sep 2026 03:20:55 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93b:fafd:3adf with SMTP id af79cd13be357-93c43d0ddf0mr1872141985a.48.1790590855273;
        Mon, 28 Sep 2026 03:20:55 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm26815729f8f.30.2026.09.28.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:20:54 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:20:52 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v6 10/16] irqchip/riscv-imsic: Add MSI address list
Message-ID: <ocjk3jylktlomol75tprkquallwhajlrcrjcjfiycfnhlsxcep@nk73eccs2gqc>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
 <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260925151659.419512-11-andrew.jones@oss.qualcomm.com>
X-Proofpoint-GUID: IwsairUlL51GCzG2I-M8friG_dYTUtR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX+dplPmJY23xT
 kRzm2RJlvcDiY4pFdQFbL2KbZb53yExdWkpaWYpPPt+VCx9qD9QVgGJHhJ2huGnaZooudMdk9/c
 7ZjkozHEZXw8FY0OlqqzJcQDEVcn7zC1VH3J/ErL9qTEqyxecG6bQg3V9HQylKohifbek5WkjtO
 Nsa6O0EKqtrfllWWCpm0aMNE9GyWx7VRqRs4foSVrDfhlPdGVY8fXbzVDPiE1gl5XGORopEVWYJ
 1eB8sBQA4L/AQJlk/L7hTXLlrDJppt6O6e+BPHcS7Ky2+iTUGaQOGIyEgeGTC/lcocmSeQEpvaa
 lWLVnlB6MXtamCrOqfhPGdDNj08F3ULMQ7bKJr0oa3KcDk8Jhmmo5uW6YCv41IPbNNhLoEWZ6aF
 8S6LQFo5bNBTSxKZdSuVAEl3XJErJwc90hD2IxpOc5QqclB77vAmKGfaQK3/QagEj0WX0rAFsce
 x6WLnfuCrvm1dpOrVZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX+xEijVBvIpoW
 KvWNIzpjKEbKDqiL9g9VBhUxi+IQGyhKIcmuBy1cm046fGfnePARgDw9X6pgyMMhL6aEqUEx414
 ZldcWknGhbFxTEFr7tO/VI8HtS7DcdA=
X-Proofpoint-ORIG-GUID: IwsairUlL51GCzG2I-M8friG_dYTUtR2
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba3f88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=azrel2x1CCEZ_N9yfE4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_032057_734031_88EB8533 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Sep 25, 2026 at 05:16:53PM +0200, Andrew Jones wrote:
> Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
> host IMSIC target into one contiguous MSI IOVA range. MSI message
> composition then uses the target CPU's position within that range.
> 
> Build an IMSIC physical address array indexed by logical CPU.
> Require every possible CPU to have an initialized IMSIC page before
> publishing the array. This preserves physical address zero as a valid
> target and guarantees the array has num_possible_cpus() entries.
> 
> The array size and each target's index can therefore be derived
> directly, without storing duplicate count or per-CPU index metadata.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
>  drivers/irqchip/irq-riscv-imsic-state.h |  3 +++
>  2 files changed, 35 insertions(+)
>

Regarding the Sashiko findings for this patch. The first I already
responded to on v5[1] and the second, which is new, is complaining
about the error handing in imsic_setup_state() for the new call to
imsic_init_msi_pa_list(), but the error handling follows the pattern
of all other error handling for that function. So there is nothing
to do for Sashiko here.

[1] https://lore.kernel.org/all/20260901133835.345001-1-andrew.jones@oss.qualcomm.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
