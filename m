Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D028E83F1F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 15:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NAsLtZG1wYwlQRYeq4obKE9QHzl3UptNn5bAFk9olQ=; b=v8b030xzQe7TPm
	LhCMKHj0kpxN12CRTotVFzHMie1i690Np1PPp9WQJz4/RdAZC0Zol81jHkQb7QIDQFDviuES3Rn7h
	gV1R7wHhNn9jsNOqNDXcLdYe7/R1Y2pyWQZVY6GzLo9j1W45UpkoRQM1ZnhaDIqnX/qiFUr7ZUCWo
	q9DjwbPLdlpD9ZIJuhbDaaFbWSkvG52M5f3rixCFAqetg4Lyd46N8JT+Op7Vsd38qZXhXfRKfUjol
	6L8yKeExW2/cWUiNr5kqRNDW50s0NPMkCmJPaZQvaQVER0QjpM+qCKrvVau42UBjAbsMsfF0VWgBM
	H+Bsew/O2tqcuZ090f4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0uG-0000000A4Gk-2Tmb;
	Thu, 05 Feb 2026 15:04:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0uD-0000000A4GM-3Gry
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 15:04:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615D6160890171
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 15:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KfBltjWFs/4bjLl10PANJ+We
	wubPhQqXLGvIdvHvBRo=; b=OvdZEEh9XkPxnIwQcO8fsStOxA7WybJudPm1SCz+
	XQ+z1brLbXcUFfSgLIZCWzoy2jRfANeM6wwnOxYVNoSDwyBs/y/7x84JC2lwgiU5
	05x9skkTvIdMC6LHpFImXlJMqa0DMau4loxb9fKpXzryA2EovY+LCtU0LJn1iaBp
	Sk2d0uqf2x5NVk5pAB7MCjMzBap09SrJA2KKXacL5/dkW/IaKgDVnAYUQ54h4zuD
	AHX4PVEDKrBviVzdf00Du6PHrYlQvmgwiZcYLcgtVu9GL+0ahE0QPqbCdLPc13Z2
	FFBty+5mqMDEkZzACzI495/LgKdmO/2yd/8QduqH3p9FrQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prx9dg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 15:04:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b831ff242eso656377eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303868; x=1770908668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfBltjWFs/4bjLl10PANJ+WewubPhQqXLGvIdvHvBRo=;
        b=DTRgM//LntI4iOjRtRI+F4w5DczpVaHIfbtJ37Ds9jofCLD60oYopmzUICp43IRw7V
         jHnXK8469ziZ9e3GFRFIoe+IH8VXVu9zWP0nV6/SspgTHJnK8tugvc8oYH97tT2/daTl
         S5aKqFX/51k6jBGRltddd9rA7OcdOF5IVYq/B61XatAxBYDZXqOppG9uvgG8E2MPqlxn
         XqNK/NFiRIQNn0PVyNzWWwdqiaStq/cuzDB4MhkY9SQYOWN39yc1bMMo1ozHBkFZKVGi
         A3HWpPG0U0eQIcCAbYYD4SGFwPMeCAQskuBe7dHM5IUVHr9IfmMnnQhYdHmt8/05qDrJ
         4jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303868; x=1770908668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfBltjWFs/4bjLl10PANJ+WewubPhQqXLGvIdvHvBRo=;
        b=N1PfKKc/udW7fqYLU2v3O9AmWV10pK5dz1CyYxVYx1qEBo7jItD97+PRwGun14Ojop
         pSTOEjmJE+/OM1Cn6F8LNZNEv9lYYH7tfOjDwho3FY7EnRzilphbG1xTnKEFLkpbgh+U
         t2qh/MgUDHHGcQpi1EsORMeXxSZTTOsSp+kn8A5ctMtcBWxMhpM7CzV8zUa80hwTXiBR
         tDWN6PWEpt61HxTezU6S6PDwe8bWHBsxswcO5KXoMfymIV3+4GE7m262Ei2ArrXzwsCK
         3voeoH0zmeGSc+jpAlznMrgZ5AT1j2xWFKhTHVQnaJIFgElR74Sa/UuBTQh4spaWfHU+
         B67Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcgqBa7h/5r7V/+10tPXnt0fDUMMk1CIfn2yahZCZjPs4IilQ/wu+fLD1eu2E2/fjIi0K90T2AlsAkrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSO4dKkmM87MCgwN1cREwgLR5AGuVnjr5H+Siad++q/RuoEe1
	YPeXAgxD6wPT4CPY9fEYHlXnCzJoj4/QzSd6TImJzIafu+hx/A38WCOfAEBnCFas7AOhPggDkmF
	oldHaUaQAViJEOLajFDTVuayUCCRJy1Rxc0pqE2zfV2NVMsPQYLaL0BYVJ3A/2/umvQhWM7PHXf
	cI/Ck=
X-Gm-Gg: AZuq6aL0Yc0pGI0olFmCB1sJTC85ALOCVaqs/EU5gC9qQFORIYAleYJk2PpFWTvs5Z6
	GBAhrQlle8CvGUuFVBRPcx105TEE4gRslerR4/cW9T7ggr+tVV//xdPHi2bFM+eJM7SzZIG7zKW
	pDuhjuGkaK/k73iOk3EP6rN+peov/xQVOztyRYlYtuJ8cA4FXYAp6Nox2SrIjbkc2QJ9QkStNBg
	4tSGtY6/6ewERYaQn5VX0XIQD7rpy55GAZ0DQ/suRuUwIfZ7FwMvXLx+x47E3YREP2y5tLyd4C8
	n5dkxyORSAlmZNkObYdwznRSb2ZecAUtT78YZQQJG2tCXAY1inD2mHJFWABUKaYkUTB1PIXcC8d
	7sVCRC0LMiDXo5s93pIk=
X-Received: by 2002:a05:693c:2c0a:b0:2b8:3224:90fc with SMTP id 5a478bee46e88-2b845e48ae3mr1234320eec.5.1770303866781;
        Thu, 05 Feb 2026 07:04:26 -0800 (PST)
X-Received: by 2002:a05:693c:2c0a:b0:2b8:3224:90fc with SMTP id 5a478bee46e88-2b845e48ae3mr1234303eec.5.1770303866168;
        Thu, 05 Feb 2026 07:04:26 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e12845sm3491862eec.5.2026.02.05.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:04:25 -0800 (PST)
Date: Thu, 5 Feb 2026 09:04:24 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
Message-ID: <qlnntgtoaatvdpyvusjhe2y3hickopigwf3sobtnsfwpfhwjiu@zi4auf65eepa>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
 <2ueryrki7uzpjn6rbqz7scy46sjhw76jjilddz2naslz3eyfdp@ycwf42eaw5yy>
 <927D288E956D61AD+d1488c72-afff-49d2-bb6b-5ef5ea08b627@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <927D288E956D61AD+d1488c72-afff-49d2-bb6b-5ef5ea08b627@linux.spacemit.com>
X-Proofpoint-GUID: vbG1ixYsjRtz5jWce8rc6AABcuYndB-6
X-Proofpoint-ORIG-GUID: vbG1ixYsjRtz5jWce8rc6AABcuYndB-6
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=6984b17d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2SqC6Y7SbBa8MZsB_aYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfXxQPSEnowLmL+
 NLCM5J4HBgvHr/WZrY3dKjCqpH4HBPp9PNlvBfr+CNBOJS6v1477SZwtsHaMeph0KzShkAbTOw+
 4WUFSfQTC5p3TAf/RMT/e1z4BLV17ewqkzdOX7BiHDKw8aqxRH4r2agcdraXgm7WkaNAo8kwi1y
 M5h1RLmGAlpxZvfpt4WgCGe75vD7XXvdZeUEbdpU7Y8tiuaiPriYarx3W9p9uMV+zCmEQCkEl3y
 movj8MkC7SsIlR66WK309HpAa7BUycw1Ip84WFjzBwoXmojLVKYYE7kAS7Qelul/ELxw2/X23ev
 ZZGHv1VASlBzsmpFO8GQVpFdaaN6cPgEa4refe+r1s1bOZOCYu/HqVrmKf6Lhp7/4FDBlbQ8TCZ
 MgsgIWTikVJMS0VsYM3whoe8SLEW+ckmrO99tFuktu+SzJS3wCCj0Y7V0jV00eFivtL5r/cnqdA
 7UfDunsz6ruc58HA2aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_070429_826889_D37685AB 
X-CRM114-Status: GOOD (  28.41  )
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

On Thu, Feb 05, 2026 at 11:52:57AM +0800, Lv Zheng wrote:
> On 2/5/2026 1:20 AM, Andrew Jones wrote:
> > On Wed, Feb 04, 2026 at 05:08:52PM +0800, Lv Zheng wrote:
...
> > > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > > index d9429097a2b5..26630979473b 100644
> > > --- a/drivers/iommu/riscv/iommu.c
> > > +++ b/drivers/iommu/riscv/iommu.c
> > > @@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
> > >   		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
> > >   	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
> > >   	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
> > > -	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> > > -		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> > > -		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> > > -		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
> > > +	 * Check if FCTL.WSI is set to determine interrupt mode.
> > > +	 */
> > > +	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
> > 
> > The behavior of ICVEC does not depend on FCTL.WSI
> > 
> > > +		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
> > > +			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
> > > +			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
> > > +			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
> > > +			return -EINVAL;
> > > +	} else {
> > > +		/*
> > > +		 * WSI mode: ICVEC is not used. Set to identity mapping for
> > > +		 * riscv_iommu_queue_vec() to work correctly.
> > > +		 */
> > > +		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
> > > +			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);
> > 
> > It's certainly not correct to set iommu->icvec to anything that can't be
> > written to the IOMMU's WARL ICVEC fields and read back again.
> 
> Indeed.
> It looks I can keep icvec returned for WSI and keeps the write-and-read
> check logic only for MSI.
>

You shouldn't need to touch this code at all. I don't see anything to fix
wrt the spec. As I said, if iommu->irqs_count is known to be greater than
one but you're getting zero back from ICVEC even after writing 0xffff to
it first, then ICVEC on your IOMMU is broken. Once you've confirmed that,
then the best you can do is add some workaround for your specific IOMMU
here.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
