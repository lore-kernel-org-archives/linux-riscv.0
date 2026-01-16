Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBB3C98302
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+JyKZen9D7A3e1cxheVx4IaUjfKVDn6o3X33Ouw6ec=; b=hXnvaK92bePYOl
	Rlr6/rgiB2gOoQt20YU1ix36rO9NePcamE9OE6mAiLocGL0xAH22Ajl/X1rdSw5eqMVuKie0WpH9v
	7Nv/VFdfmIEnopX/rg0EOezMltrMdQMoFO/xu53uyr//jsqFsvPBiBC0iH0eQqLliEKksBxQDY4M0
	W9cNd70dpLfbNKlGCKREo/XbAklxLgGW8l6j98NbhIQpIVtoZGS4ZGsF9u9SmOE7J3cWmGjIlsyvD
	ILpQjK/Ui9M5LRZFHlk+2aVjQMhZUvbqir+/dsVrNJaMcDOw6w7kcyj2ClaSlc+erAeuN4G+P6z/5
	MrCV41BaYYHXYfuZa7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrIX-0000000Eri6-46lD;
	Fri, 16 Jan 2026 21:24:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrIV-0000000Erhj-2aQ2
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:24:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKUrAH2484703
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2kQjyukwQsEZz7eJesbt8Fp0
	WfAJ9PDqixd1HJ4Dke0=; b=FsSj0Bn6PrEUY1q8oHpE0X4Yt4Yo+PiNn+MFljkj
	rGQ6yZXxp7x3MuOZqZGOwMEvrTQAmQkev4S8NoNwPmPcHPqwx0Ef4WI7e7XQBO4E
	iCofQfvatjltAI0wzGpQ+U+U6QV75ctYstEisG0PPzXp3ojZvgqvwvkcRiQArL8w
	4FiidZbiynIa4ZuVbiir+dp/eGbWwI88G6oSOLcnWnaciRlOT/W9iOE/bmgF/cc8
	SQC3bBGSACmoAAKnU2GL+LWOYxY2RrLEp9NJ/UDYYKkp8KNbD0APYCI7FuZTeZAt
	+ZdkpqTgvRlaIr+2F9PYAtlrCSZW7rsGUyqz7aYQLZt5Lw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvecr4q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:23:58 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45c99708c1dso2385134b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768598638; x=1769203438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kQjyukwQsEZz7eJesbt8Fp0WfAJ9PDqixd1HJ4Dke0=;
        b=g74Fio0G5x/AQqLR5gY/Ytqs8NJ9OuUSLQTFcbUAUSYuh5BtdN62SfNRIMU61o1WK3
         lYXB3bjby8k9N/reJs/HW9r1zQotp68O/ygp2spBQSXB4iRzZcFvYFNUtV26eU+Nb7R1
         j8VWBBpqOhKoh3b7TBJDmyH75n3LDQSDULjXyuSLJy7DmfDoYJrOnauRCMsXKtT28mD2
         DDvqDIeYS5czOvwGhhNIizKvtzXsbYgCi3MwF2diBHINJE/gJZ2WdrYvhVmXiCxd4uFD
         TzOHNkOeME1EVBm2EfonFEei6vMud58z7nq3de1IzwvuIFQWakQmN/LiZ9HLQpdDry6p
         CyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768598638; x=1769203438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kQjyukwQsEZz7eJesbt8Fp0WfAJ9PDqixd1HJ4Dke0=;
        b=b3KcKEjVHKvF2qZj7OlPxmvTo+4BJT3IU4wzxDVePr/VOdFPx/riXUuwkCcqyYpxY8
         WEoa8UhLNEAHf09bZTGa4Nkhhwl2D+yGliAq7niR5lODs2iL8OUvLjBRlbfsfpmzWp5/
         1x1zHAfCbbZ3fuYFi+VkOf2aRE9n6Axq3hBlk/STgTjMmha/GkR5wA/3rPVFizVLOAvU
         zjV7gZNXfooyRt58rkpE1/+5IAcdpgk87fkjZmINT0IiAvdpk3yDlXyFV93IoR2TGaOP
         CReI1sFpKzyJvDg/ggNF/87A2H4RGaKVcOYE56/aJqlYx9JLihawaGVEsNR1Kj9EUCrc
         UgJA==
X-Forwarded-Encrypted: i=1; AJvYcCXs1gMO7EWlp7/0Ww0ohCgzmj/X6Qp2P/R/uAMcLdI6FBJ3THWcruP2F/2EuvEw1fu9MtWq6UVAbNFmiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjrmAbDK50En8m/jLu230eICc0zQM/A3HXqh91y7LMaXkz2gS8
	3mGJ86+Tcqf9q212cSVF1dibIEF0cB8Y0+pVWKwTBk2pAo/XkOy1Ee9mig+lt+Qsys+Om8vte28
	FFnkeUDDdsMbMGFuRYB8PL6sqAcs5cSx9L9a+xaTqA2J3ajyvksgBocPhuAUXbKisPiYEpgg=
X-Gm-Gg: AY/fxX5jrzMKP1WxLWKJr4dJfZAvrBOD4p9+9pf9CbfVOQwzJiAXWpEbN/5g1O0bGI+
	2auet87wstWXQBtHsqDG6tj9Hu5XsRDROoO4xn5NOMWpndqfDMkplVkxIiTjEVaujpnLFWRPbvP
	igSPs8c04zxBpY/XOjiOFZaZDKhSyydQ6vAKS1OKJkWRtYRxZE0cwP/egEcU3P/KuHJyNkbUBnw
	EBKAhdumiioBA4e3iBJrAl0PVVn41gXkHIxcQ1qv2YYYlZDgvm5Mhx28g/sIaY2/qJ30WpvBaEK
	O52RkVzrvpVDKfR1Gv8OKLYQq6tUs7MZcdrulaPU7iquzBL/eCDuah/9ZT5AErGfrx14St7SKoR
	A3DZzoymMWY7m84NYBrk=
X-Received: by 2002:a05:6808:5381:b0:450:c098:ad52 with SMTP id 5614622812f47-45c9d6f9b71mr1643547b6e.8.1768598637943;
        Fri, 16 Jan 2026 13:23:57 -0800 (PST)
X-Received: by 2002:a05:6808:5381:b0:450:c098:ad52 with SMTP id 5614622812f47-45c9d6f9b71mr1643542b6e.8.1768598637623;
        Fri, 16 Jan 2026 13:23:57 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9defa8a8sm1887962b6e.6.2026.01.16.13.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:23:57 -0800 (PST)
Date: Fri, 16 Jan 2026 15:23:56 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, iommu@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
Message-ID: <q2jjixx6imiwdwlxiu4cnh6nghnueivjge5d4jscor5q6yx2el@lxujpebn3nsx>
References: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
 <c5sk7h5r5fozjdyguamekenlzd7pzbtvdh2boq3arynxifba22@ii4ikea2tuyq>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5sk7h5r5fozjdyguamekenlzd7pzbtvdh2boq3arynxifba22@ii4ikea2tuyq>
X-Proofpoint-GUID: nn8FniQ2MKKnd7gYjg31Zjj2tF6m9fSg
X-Proofpoint-ORIG-GUID: nn8FniQ2MKKnd7gYjg31Zjj2tF6m9fSg
X-Authority-Analysis: v=2.4 cv=L4YQguT8 c=1 sm=1 tr=0 ts=696aac6e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PgKVwnkvcHvZA5b4cyIA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE2MSBTYWx0ZWRfXxjp8VQFgH4c7
 Crz5J+bZSnmJ0joqjl1EyPDgcRf7KqP/DOnrb1iETXb0xVschR1TrCMNJS3/TpFtLVqDl19H0X6
 1dTwho/XvIQPCwUd/eLcdm6KLXlXjuUKuGx4nUyThPQbFU57a5KSxZjD3pW8boh8hYNirccpyzV
 y4+vLXhmaWmpipxxLeFdbETEFin85XB7RSnnO27KApwiXRILn1duMoxAvcmPGrMCnht6bV1H+9W
 bnME74+4E2+3m+l2ZWYrq6uWPpBU1KifmmG3UqE5F3VtKoOYx0NEVfQVxi+vaZmpc2F07EUzXGm
 qhBwCzy0nQ15rxH712uu5eRHIuyPw3BRDhXFOhmLBNYmsstp3ORGHoiN5hCLmX06qTByRHbH9bk
 CFwVyqlZKQc7tSUvk4zLJbvI/61ON8PcNPc3ddkVNSTEl26ke9ysR+WkolWHOa84dj5czwcGk9Y
 6CGUqyQ5F5vrlFo4swQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_132359_675190_D2AE7515 
X-CRM114-Status: GOOD (  14.38  )
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

On Fri, Jan 16, 2026 at 02:12:06PM -0600, Andrew Jones wrote:
...
> > @@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
> >  		/* Invalidate device context after update */
> >  		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
> >  		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
> > +		/*
> > +		 * For now, the SVA and PASID features have not yet been merged, the
> > +		 * default configuration is inval_pdt=false and pc=NULL.
> > +		 */
> > +		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);

Shouldn't this iotinval come after the cmd-send below?

> >  		riscv_iommu_cmd_send(iommu, &cmd);
> >  	}
> >  
> > -- 
> > 2.50.1
> >

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
