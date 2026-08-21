Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562DAC5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 11:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xbOwo8sj1lertoW2jKW3B2i/XReJew8MlPeMryfNXA=; b=caaiO2P/GRvQpB
	ywecZ2o9b/ILf/KKh7+sCxZQhJ8NuDpQMflIopj9E1Tn6N5SlXN/hYXtGMluBDwzYdrvrIdirrbHL
	e2ba3rcsqIok5p5V0VpHwqeo+vxU0fT6dFCTRxY5fvFFY8HwJkojmgVMpTvwdxBpltjMPY40afFXP
	y3xm+ayJcvWrc/YlLDO9kgqIfKC3buzIuX7AxjVSc0A7zVwHadu9z85cpqFyz5YkamHZZdaoA4CWr
	MV1yxbwpE7zdALmjuCSJ782klAnN95gdwreJaBxSbd8qhPBJ8yK/qItEflMXTUqQa3Gx/swg5kMdh
	+lax7PA3KAzQQxfdPCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNCv-0000000DA4g-0Qku;
	Fri, 21 Aug 2026 11:14:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNCt-0000000DA4L-0v4c
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 11:14:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LiAh1983083
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FvY/dx2tZJnq48L1ZcLITNUT
	qVoeCwSMCgjTMY/C3po=; b=UCo7WSoKr9K51ZPyMNNxv2BXQIcqJwaHbYv3mP10
	TT/2O0OhMWAvBOGyqHIypLUzujK5Beh+rIyk8PX/vSmrDR98IX2rwaNs1YwL92RH
	bpwuHt4VQ9OoPPYATMT5DXAgmamCj1Ay41m/GrZ+v2eTxFD5KE0QsLxwF4vQHlAo
	ttcLnjhqvO0mXF+DxYX5DGxPOC4YtTdyROdAknWvTSfx1KiWHNvb/PxdIxXEIAWN
	qRGNO0n+EOTspqP08WPr3eve0L+FoeNucjrJtdKft+rpUWyzPN+1gXgaU20WJ+AM
	m3D5IRuCMGFhgceIoeAJ9OiqnLxEI87UktZtJCG5wC2f1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsj0mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:14:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dd69b00cfso9455201cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787310882; x=1787915682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvY/dx2tZJnq48L1ZcLITNUTqVoeCwSMCgjTMY/C3po=;
        b=Y8MfK3hTLhFD99ab4muN169JuB5WRzYw2rj57PzCSrnC7wehYZ/uGMd9wAqsGdPwYD
         uH/fzcCRUcvA10xB7miIziMPG+nSQeAba4HymRAkth99+t6yK1oZjgiM8QgbEVXiunY0
         CpVj35Kw3Vk5o8b7QJMgt8kJnYduMrsFGuPI7Yrejy3dUiQQFlImifE3vF+/mCsmVdiC
         iKCnrf6V+LU7UYanKh8c6VuzSOy9gWnLS0Jfr0jey1fS6qjLeZWg5r9d28/841yoomjT
         ZDveEoL7SkIZsAicnr4VM/8v2r4LAefmjuTeRpQKNFHheiLj+J+cpZV8wvKCDGR7uFYR
         1EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310882; x=1787915682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvY/dx2tZJnq48L1ZcLITNUTqVoeCwSMCgjTMY/C3po=;
        b=kKzQGYwWV8VJV+pZvOF24giPFCHnds/QLXqXf+gZMUWVdSHkJ14CWuaLnYAgcgDFiw
         v+ZBJMtamhx+WEYsC5lHA9JVzx1AN/gdEWlzemqPcA7pvtpFIx2CbNa3tf5DYjgjPeFF
         XxzSTSE/Xc8bLBig7j5086x175RarTERdAj8pkVGM9SLKHFp9IbymRpW65FXRUPGieNQ
         Jn5bQ49kvMbm5LjoVDPO12sXmPiRdOp3pMbj2/JnZ1RDFyy4Jn4sVYFRphxyllI93EDy
         Sg8Neuy3AhdwRA75erO+RcDltVUlU05jY955GJh408m/eyL8cMDKBADKcLEOdqR6aja7
         KgNw==
X-Gm-Message-State: AOJu0YxjZ/HwobsfX53q3Lvnhr3BZbE2jRK9b5I8UMsudBCYj4jhWYKX
	5JeKcENhMvZ28NCDmN6zHG0Undew/b2VIiIqIam7BTusKbNGiGHs4UgG19S/d5qhoprsiTiwAiV
	adIHEGi+y6HTqu5NRqvVnaRt50yRIvz0AJguyN6n/C+60Bvvznc0bmOECcWj1uOil88z0UOA=
X-Gm-Gg: AR+sD1393ZFISjsAL8kBh0AHfUEigAj7st2wh+h9KxK5sWVdPSus1AszKiIJPajrBxh
	7TZJySN/rE3sRZxKN9jImZqTd5VDz68S6SKm6xFZfPvI5zFnWzHgGhjRSVr/tJPTki6ESy+EGtC
	eytJG2lXmFa+SLDMi4zcDqcZCOOEKk8bYSuh9koaHPVOpVOlfeJ1PlAcuOG5VI9vvRakc37gnni
	xJEuYOore7OiVBuzS7bVRTCa+TkaTik5J7R0suGWFFDtJq1H3t+EiYVO0nnMTNlWUwdkq4bySI/
	YaI/lSeRNYuaw78FyK6pK4XadYDG1rVknq0E3baxsmXGhpsa3ySzogeOyf5npBqqhsFhdPZDvKc
	LvMQ+28UElGaraPyWRoW17hEspm1XLRxqzz0=
X-Received: by 2002:a05:622a:1b0d:b0:528:15e:d1d1 with SMTP id d75a77b69052e-52df57472c0mr47025191cf.16.1787310881679;
        Fri, 21 Aug 2026 04:14:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1b0d:b0:528:15e:d1d1 with SMTP id d75a77b69052e-52df57472c0mr47024541cf.16.1787310881183;
        Fri, 21 Aug 2026 04:14:41 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a89572sm17217655e9.0.2026.08.21.04.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:14:40 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:14:39 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 13/21] iommu/riscv: Preserve MSI IOVA state across
 domain replacement
Message-ID: <wshoqx3xyz7f2jmhgbyzpkm4ppl64olswhw5u6dye7nmomkari@j2zg5ecuvsmg>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-14-andrew.jones@oss.qualcomm.com>
 <20260820215204.GD244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820215204.GD244917@nvidia.com>
X-Proofpoint-ORIG-GUID: yDTeVB00r_q7Y4lODInZlzcvujWnxioa
X-Proofpoint-GUID: yDTeVB00r_q7Y4lODInZlzcvujWnxioa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfX6yNQf/R7ocqF
 i66/B5YnCroiDNwi/X5HaSD/x2VjpNenDsdKFcuX4ibFFqF/uVC81UKYWntdwuZx/INGs1Mm28c
 qoYaJtHv52WrqrSKzTUEAO3MM1jJfa4=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a883322 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hoD8RvqBUdAnX7eObX0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfXzlSvANRCUei2
 6/L+hrFsG9VFX0MNzpSA0yMIqHMk5pvlrfml9CglBvQmpzx3kTBG45alF+ExKrvl6aZTRt/MnvX
 inoXpUEwuradjqL/rDSFpDbSWJS/n0pfKPB4vSfG2kWAqBvrOBJytYJqdD4/ORiiycbsnva7JLQ
 fa66kV7Zy5mHu1DiAiu3zi/Uc7OU1fAyALgEpmXJW4A0aVYBQ75Yy/qhXTGGDCTyHJh6D6yywvJ
 UQvfuyOajih39qrSpxktk26/KQ1bKBu6HO4kqy7Zvvazw3fPpajEuYA2QteuncRYN+yNkw788PB
 WCcphe8VVAsHde4NucwmtDpmu0ZpH/U8d/zMY3hWPmt+3PNezmy7B0HTnsITXFqHx5k+rGULrLE
 1oC4GBQdh+kApVQIwercLA7lHry7sg0Y0jlC3pkr52Vr/kkRbgdATqzHAGgHffKKCUlZ+Q/InY/
 UzlP+UTN4GYLnfs4VyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_041443_262118_06670F65 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Aug 20, 2026 at 06:52:04PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 11:41:42PM +0200, Andrew Jones wrote:
> > MSI IOVAs belong to a paging domain, but iommufd may replace a device's
> > domain while its interrupts remain allocated. Waiting for another IRQ
> > allocation to populate the new table would leave existing interrupts
> > without valid MSI IOVAs.
> 
> ???
> 
> iommufd is supposed to handle all of this itself, that is what commit
> 40f5175d0eb7 ("iommufd: Implement sw_msi support natively")
> 
> is doing?
> 
> The whole point of that commit was so drivers don't have to deal with
> this at all.
>

This driver relies on that support. iommufd installs all required MSI
mappings in the incoming HWPT before attach. The additional driver work
is to populate the PA-to-IOVA lookup table riscv needs in MSI composition
on IRQ affinity changes.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
