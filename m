Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FB4C5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKCy66dEdHIYLW0wAfHpDni94V7JerGnYTfOUybuZ7A=; b=K39jn0ZuQo6qgR
	oYAbIovIrsmxwy6cNYa6+ExEujRsBLW/zy3Gd0Xx+wljIfaNlIPbgLzx7QtNbuLuGdokzTy2H03VR
	wjotctWXgdcgjiLqhQZjAGEh/+4zGXkjorqH+vVLym0PZvyNjceCmvIG4xtoEhQNvG8QEMuvDRNds
	HfQKRBSx/Rfq5786xRNFAMsrSvO0B7KjjW6ongqny0nGV0+r1ycUOvKzoscyabeE4CqN+tqvbXOnU
	78wxvFQIrKK7HbEmmDVHxOEthT4xnEtURjMXBHbPf0AaXaufbOz1MdIpvY0HaNs5toe0QImQINrCT
	OnlOeEujiE1lYjWtVbbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKxP-0000000BEUR-1XIj;
	Mon, 10 Aug 2026 08:02:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKxM-0000000BETg-37A1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:02:02 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pH68402784
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nOFIe8m9HxDwbnLgc+9Tz62O
	8nS/XQ7EyB4Mr2xiWqo=; b=NKTg3x9pAEHBESHpi0KrwjRNYQK+7hNFFvqr+WL3
	BDA+/M2Es5frNy3AsciW4GyDXBHj+K274QEZfxhTC27bBFIYqFgK/AZqQjJkl7oq
	FzqAPiNbL+55zygFEBAs90ui+dcCLr4TbHhF3hmaw3c3NKzMTKOc76a7gyb2fXRF
	y9cA4xOn0e+1gu2OfTkZfJ99em4i6F+aj49WYD3Esk7xEV7SpXxDXj9uyS2wtdvi
	ahQ8M6z20+At9l+eVWgYrBCxAVZdx2fVn2roJzbjPvP9KvHuDfJnOeXAPlsa7c7g
	2qMICpLGkmWZlsvXk0qRvKcY3vTPiY7wXFgXcdXHxlkq1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v48csm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:01:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso17670051cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786348916; x=1786953716; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOFIe8m9HxDwbnLgc+9Tz62O8nS/XQ7EyB4Mr2xiWqo=;
        b=hM7IS7aTbVs4J+IyEjxKgUhsCUovxiNHavexmSRpEov+IY0ol38sHhc6262HtE/8P7
         efuoOnH+JfvpYs+dsG8SisCJBJSvALO0UaCH82Ey9YY5ZhRYIKT4bmG62tUasmT9JGaY
         BKC87lHB+zMFo1McyXsyVhz+NjPx+OzzC3tAu0ijuXWp2dTiCVLytlxRvPNMAI/iBZ6H
         RFZ/iBD0qaQHh36ffh33t6FwUIhRCmVFU5y8V5/uUTL4cs8fbdCforfZyeHXQ3ib5C8W
         uePe/zMGaRCUVqUMryJ/HgFfHwdddyloX6nxae6p+4DbmjACxd6bkzUyU1ztBnUGrjEQ
         B6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786348916; x=1786953716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOFIe8m9HxDwbnLgc+9Tz62O8nS/XQ7EyB4Mr2xiWqo=;
        b=SKsP7gf75PVhHEX+qUl93ew92IgEzpyrb2iiOsQ8qoNI7hp4FFfQx1rQ5UzBqEtwgt
         KWzkkry62kcY4b//k36/2nCjjdm5Rb7d8LP2hWoAVOntVKO578uoX8+WtaE/8a+FmyhQ
         H7e7TEAAROsNi8KQJ4Mcrfv25pPlJNDG9uQE4lWpO3aYCsvIw20bZ2WwAYt2aMmPiWLh
         VeUKicAWggEmzDGN8Kfb6rrvgIxcNTQegKKIfPZcbuOJ2KA/QvRR79XiusAFUEr8jR9M
         6VxR/BGW05I3EUY89mzqPSjq/LK6enjuI9Aov6vywnaW4okbX+1lGOmRO71QcYTYVaVM
         w6cA==
X-Gm-Message-State: AOJu0YzD7sTCX4A6VsDwQmdHzmyqMlnKBvO0eW6WhfHMF4a+mnu8Clhc
	inKZK0uNKlxHkWLApnfv7xufCEJE6uPwqkQJlQztq5sK+3Fam76vEw3kHtVoEStBMSJVcZCyJ9/
	ct72CjJXyId81zNk9QfUHx6r4tNaQf2Msoi5Z9U1V6csqWd9YS8yfPNp5hkG8NtlQ1qw0t2E=
X-Gm-Gg: AR+sD10O54oF3btAHGvK2f2ZLeJK3fQnK4Hv02HkeHKIkU8xMyuoKYKnX3NgaFyPpqY
	69a7cd6QhGFwOSnLBbTCsg6ewbUxqJ2wPci8BfCPHF0RjkKtEQFbD3Tz3R9E0py6Pnb55lSP4Nn
	eeZAYW8C/rDX2RTJbkmoafyF4A7qspLLb1ounKlsrANtsiR5E5X3hvB+vgUWbQj79mzm2JlJPax
	prsoLTkxxQMrefxUJouy8hbDXdCutgm393QjQ20tvJOBWQ/XQZBSloYvFZmvg+LmxwcS6mSLuMf
	uwW24N8tpVpbgI0M98pRXN/JbR+8VbV69Sm6iPF8GZXVWkfrJXgoHyqJotSKfpdbRheprm/Ou3/
	/5MslkxZDYkVcBUHYbnSy5MyaYWg2xqAmwq7kXc8=
X-Received: by 2002:ac8:5808:0:b0:51c:b98a:2448 with SMTP id d75a77b69052e-52ce5f447b9mr410804741cf.9.1786348916222;
        Mon, 10 Aug 2026 01:01:56 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:51c:b98a:2448 with SMTP id d75a77b69052e-52ce5f447b9mr410804121cf.9.1786348915849;
        Mon, 10 Aug 2026 01:01:55 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150952sm28681112f8f.15.2026.08.10.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:01:55 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:01:54 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v3 06/19] irqchip/riscv-imsic: Compose MSI updates
 through the hierarchy
Message-ID: <zpkso64qseb3g7pgorfzselza2f3rngtoqpqu2kuktf4jf6bhz@v3tzfyt7yp3o>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
 <20260807181713.228535-7-andrew.jones@oss.qualcomm.com>
 <878q6hekyy.ffs@fw13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878q6hekyy.ffs@fw13>
X-Proofpoint-ORIG-GUID: dP5rLiwHiZwqaMvVBZr_rXC5ORR25qRP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfX3niu2tvQXlBM
 UTR1OhKFNMsI51PF819Kcd/YIhAGSVEcdgxa9HQGmdwcDYv7wN1LhOX+fmoWYg5OwSkgijdTQvL
 mD9GMXutyGVdDsERMtmUTQdP9z45eCc=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a798574 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=xUzaz2BWaaIfm95efY8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA2OCBTYWx0ZWRfX5ltJx9NnBiRA
 s/7ABOdOo4+CDiAu6RDO/TIrTK1+9vHZolUahm7NtA4gAMzURnGIbEBOuLntOi4gdTvT7v4D1i1
 TcGM9RJQbjynqaPtqZhz7E731mFWtcUzvJCNZQB3aK4Yg8hC3twnhFOys4CB4+eY0nq7pIC0Gjw
 h7btMZ7zcoGIoEnyR2V0tR0RU3oaBIhNcqObSkUtT4NiPCORPKo3y6dEp7eiFZEqSfUUncHdrUZ
 XsSgC7WOzezaVfgQmrXhp6HvB8FUBW7XAqP6P0mwrXtuCLYUDSSXj/hQz/Vm25a9NyYMhlU+v1d
 G6mi7za4xSnBZt02OA4UnWDEIt5yXkQekJYcObLUwzjeTeykgMmu6jVXTyfiVWC/FocAforD5Ge
 mhPNt8LckC5J3pg27T3QEsjeH5qzKXtijWea72w+9Z0CLVPhBnxqfP68uULhkZH5BlwNo5UdNcp
 sQxo9uBK/nI9sPlYgtw==
X-Proofpoint-GUID: dP5rLiwHiZwqaMvVBZr_rXC5ORR25qRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_010200_951088_69A06DBD 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, Aug 07, 2026 at 10:25:57PM +0200, Thomas Gleixner wrote:
> On Fri, Aug 07 2026 at 20:17, Andrew Jones wrote:
> > imsic_irq_set_affinity() wrote the new IMSIC target straight to the
> 
> Wrote? When was that?
> 
> You are describing the current state/context, so this wants to be
> 'write' no?

Yup. I'll fix it.

Thanks,
drew

> 
> > device via imsic_msi_update_msg(), bypassing the irqdomain hierarchy.
> > That skips any intermediate IOMMU irqdomain sitting between IMSIC and
> 
> Otherwise 'skips' makes no sense either.
> 
> > the device, so a remapped device would keep the pre-remap physical
> > address after every affinity change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
