Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E98C5DF70
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2wDrv3Pzppm6UFHw80rAF/5loKo/1iyNYsElCw09To=; b=D8F1Wc1whpANUT
	k5+yKyLVS6TWlkd8GNzKzgV9RyUhwvDGMJkRNmPYQjiBWVNSznub+HfdtrnCR7H/FuqrcjLxL7nwN
	1X9UhSVFWVrTU5zfzZKTuVnmRiZRGE+NOAgos0rPcPsITdv8QunWVkUMuLdDoPdjlrUkhCzjBQiMG
	86/uTPRvku2J36JLUQruW+Nud8MSNUebBdWlhOOwRqh6saR6/rTw2zOeQWQjFfNUst5nYfVRU+5Ix
	ZEgx/mDfRrK/Kik89IQjr0A7liIXCZ5YuY/ArxuiabWWzuetvxpihIb6BImJs8SfA4cHUeJaDA5ri
	usVOKN3sIEAqt+bOwnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG9J-00000007d3f-2jij;
	Tue, 18 Aug 2026 09:30:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwG9H-00000007d35-1yuf
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 09:30:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BLR0310052
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LXlibvlGY1oX1qWEiKzlvaaM
	w4T84Ny5R2TwrL3n5og=; b=kEKyJXPV3vXHQfI0ndkDEhzsaBksjjyfmzKyk3wL
	E8vb35VTADnpVtdXr8Vo3IZer8gSLJkSmAVhLXbraQg+HR5San5dk73bGJTnGvsK
	PPx1LaAteWqeAT0oawvIOP/ILSJz5x2I1ymMx3XuYvSzCBG1umUc+glh6jB34P0e
	W+O5AV0Hk0aiW4InxYLzEXR8nE2qAWH/xHwfY1yp39R/pRJ80S0mbWA7iznXXjEq
	a7zOpkKuSo6UeLLt34Bpeme7dEhsBeLMAkQ+6doQao6FhzhZn0NLjJy1Vd/PhUlB
	S04PbAFmmRsf27AjOkA14kaRoNSiYZ7YATJrHwuBH1VFSA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9g8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 09:30:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8efad04d884so79644106d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045422; x=1787650222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LXlibvlGY1oX1qWEiKzlvaaMw4T84Ny5R2TwrL3n5og=;
        b=eY6jAhhZPhbzj0CVEOvJThtBiGj2kFmZaBvxoDUbqYOUdaOxWVO4B42n/Nv9Qchoo8
         fGlKqxTaIwr+lB76K31YpuQs3UUjQ1BejrX1ebgusWozRoNbggfzcouzQbosFWWgllUk
         B7Otr7xl4h0ynByQsGi774fkrq2KkyQL6bNGiJ2q6yZ6MbL8YTyZfhB5xD/h+8bb8Mcx
         5Jdc54M416dUonGSSWzjl9f7wpUumGfq/ShN36zbsh5eJuTTG3v01NxBzTGLNFqkVaxD
         CIGpLcK+3c3tHcp0p4CcmFB28izzwFWjafFHGJHvpHeolh/Ku/fZPsMdBUd9eDIkesJv
         Dq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045422; x=1787650222;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXlibvlGY1oX1qWEiKzlvaaMw4T84Ny5R2TwrL3n5og=;
        b=hmRPSNJtDyfkytq11tf/S2+rEvlPTHc/UowVAvvKt521pmQL/Z0Bm5XeNtjt82MoIn
         cvEDkE6DEbqyCyLScUFRb+6wJ66YGedcoaFj7c6Vjoqc8k9vyh9nXRSaP+yg28aAwqGI
         38uclsKZMdSrPFnmV4d+/cIdVpIfNQqm2zb5bjweTtLvV7KW/enkEyVPw9r/KJUSBzoO
         KnIoNyz7ETFH2mXCScShAfvtjQ6jG5F6VjJtqLBslZUKX0faNzjAacv9zJqmXvuEIc/R
         08yosUaQ8HR0SD+2CEeZ1a7REAYi4+RF9h2uL8lK1qqBrCUaz+4w2/SfUJJqD/7yy1CC
         UHQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv4ga5aXhYbDRaS/cBMl9LoIEUS4tDowXVwMC46QCE3Qmn6G7c1xSuC5cRm7pkqDNXQP4qykPrUDy1Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr4ifs0mLQ8L0KlTAl8mNP4Zkvbx6Gjtp0c+NhJjH8xf3coXqu
	TSjeNaYzB7yozF/ny3mr/8Xv0UZ3p6BKGwyV72dzZQG3eFXak+0ObHziZuC19nki5oPGtb3GBHJ
	zjhbI1HpnjzOnsetHEZHZtrKCmRtym35hqoqeIhD5ZSxYVVfcCkWG4HpcLuPyDN9HucaSqw4=
X-Gm-Gg: AR+sD11L5HX/BrJu1Penn3rzkqcrDJKI3/uifU5PoNQ5ciDe8TpSgLrmB8XGcEGgkYg
	AzDI1LmP2d0d4SOjUU0fwNkfkYyXPay1djD+tJIAYU3/euRAAXRxz1gIn081rvRpjyy+F2AMeWZ
	j+aC+dTJMe94J21WqbhacyKj1y+MbmBsccCYfCHldVaht0UCxpBidW7v1x5KT1AKI045yMRFEm3
	7HtkvRWK9vFRVdMezmSgQFmHclwUMhz+Zg0sD5rXNqbYYyIQE/je8nLpgiO6W+9U0bsVaie5JrB
	aAfRBAWCVZ7CTD2Ic/gb/7NN2LqwN3xgaQroOGPVvcQespwmobY4FPINnNA1fZb6Jr3XXr1rZt5
	52wVTcOPl8Ie58QWCIUJEM+5sotIxToQdBc0=
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2678124785a.11.1787045421755;
        Tue, 18 Aug 2026 02:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2678119885a.11.1787045421397;
        Tue, 18 Aug 2026 02:30:21 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499961098cdsm260422965e9.6.2026.08.18.02.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:30:20 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:30:19 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <lpnxdqyekcczbyxo3n7zxpbj7243gixdzutvngpvr24ozmc4jt@nsoblujgprhe>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
 <20260507113706.11400-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507113706.11400-2-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX/XBiuICIWI8I
 NJwY046xusCHDLxShvPEMzEHTs5qElmxu5I8nWvonKgdOAVccbti8b2HzU8wgtbxJ3YXdeqeM9X
 nowEkKyQfxY7EHiyhQmDV77IIex59xU=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a84262e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8 a=0xFToDSQ33sWTIcn7J8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Kyjop6a8nbDq6qpQPDLN9OfpzXG-C8zb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfXyEJ7jjfJ7TAm
 IksMSWRJkhRl6N5cm01OzFSDslhakU6FTCoaZBRZn6K2BVMxPl1TGt5P1ANDg7sCybB+LabuuWr
 Ce6VMbcB2PdN7qxkAg1Q3rmU1l+R4RQukDsAEyPovpsxyg97garedKT8dyHXZbyTjuJBTb56MW8
 gN+o7YFYodoJoLFrt2AgrJSanbgPXtZgqZn3mpBQ2UF32jqAZjBYSXw/rec7dQ7WiqgknA7t+YO
 E16SbAj9Y9lOyFcFOByvcyvHQfWYbNUUuiCZv0ruqTFWNcYgiB+cCbMpCNzHg2XtMMKyvIozjTB
 VGoHPDypVndgcNMzuacIZFgJcHa9NpvKiLVtyGywueFEoVvlNpq+lxYp9Lp7ET7b9s62qluAIIb
 7EqnZQHCYwt4ygCqjUZQuuFq4MrqofG8IqkxLR/5vtCrhzXXhXVdgXV+dsVAxAxMijDaqcAXS26
 qQkJjxAAsTLsJh8Cdaw==
X-Proofpoint-GUID: Kyjop6a8nbDq6qpQPDLN9OfpzXG-C8zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_023023_537712_A7B5AF3C 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, May 07, 2026 at 07:36:57PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
> index fc5d0b5edadc..59448125159e 100644
> --- a/include/linux/generic_pt/common.h
> +++ b/include/linux/generic_pt/common.h
> @@ -188,7 +188,10 @@ enum {
>  	 * Support the 64k contiguous page size following the Svnapot extension.
>  	 */
>  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
> -
> +	/*
> +	 * Using second-stage / iohgatp address translation.
> +	 */
> +	PT_FEAT_RISCV_S2,

Hi Fangyu,

I just sent [1], but I actually discovered that issue when testing this
patch and finding PT_FEAT_RISCV_S2 was missing from PT_SUPPORTED_FEATURES.
So this patch needs the same fix as [1] as well.

Thanks,
drew

[1] https://lore.kernel.org/all/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
