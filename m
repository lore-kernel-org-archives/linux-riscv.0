Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCEE8537A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 15:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdgmAQ9+4iDHY0CWLxEase3k8ZbNZ5OUsO+gxa9bOwU=; b=FBPY4ManY3+f1f
	DvZcIvsHFUOPy4kV6vPA9uhYP5H53Sp3ALHYqv9IzVmbXydJ13/r3mW1d8fXDZWn9XNb6G3d8EVLg
	sCYJwS6CIGMmSRa5hN8vJWEyWWoU2cpBWszEn7iFckyJKJ5UvqWhEt1n6mTju8OFbCT2Xslh832Fk
	69W3nHiaxyxzqRkdJYDnbdhRa/gaevoZNt3vYdGBGuwA4d9kilYW7sDWtUNCSt7mjp9cJDt1ucgXu
	neVQqkGwiwcIGuHyAmZHMeS9reSc2N9mkOt877vy073i9dgN8x1l+b2mPwoybIiaO3TE4raLUonJ4
	k9JKKjp7FQHZmmMrzBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gbu-00000002E83-0Amz;
	Fri, 03 Apr 2026 15:39:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gbs-00000002E7L-0PFD
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 15:39:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633COsjR823333
	for <linux-riscv@lists.infradead.org>; Fri, 3 Apr 2026 15:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dlQHizxSHnf89XQwG90apDFP
	E1boyp7qYsxMDR+MAKc=; b=f9YsfV+ajdvocMSfQLYKAK2lumyoUM73YP0zzUm6
	PfpAOWsaVN9ZI2RgMVhw7p/CXwKale7DGZW/s2moMVwBv5WAf65AxPuSb2yh6RyK
	jY9aim51m6nzrDTUGtVryEr9IBS1kGgsvb4HjrGJ8+ZGWZ39vwi+pdOB+gZRxOvC
	EbXnY5B4UKbcdMgqf360mbtrvwULkl2pL4mSB8RL98zKT7CyvgxhS4gP+KDWBr+n
	eWIh7pQSgHHLalv+BDyPXdUCvQ+JcE+mE9UXFrI4FzAm4KbW6HibHJZg8fx3ShLH
	UPU/jmIamyqu/R0jhIx+oCOYjIM2H50FrUEnQFqJMp7niQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6739vr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 15:38:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12776bebeb3so3293474c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775230738; x=1775835538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlQHizxSHnf89XQwG90apDFPE1boyp7qYsxMDR+MAKc=;
        b=RuX3h5kftYThj0ImGBKALXxlm4awlXtZtzczFQgthNRHIzlp5WCerqorkiz53SZCde
         m6r85l2XZar3F5E0ltsb5IzGk3BXjPXZyO2NB9YJxRCstgSV061pyaQRf+tiAeJr+w2N
         ipU1kURTO8cZ6lgU0RH3f/bhVU00lH0PjLTwBqYWxCGejlY303D9ILmScxkWzyRrIGmB
         mH+GsEVCiVDI6OJ4IBW4yJFTNhWAgSldnS8vZI7ccz+m0UjetRXOBqTxeYkspi1QyoqX
         OB6m8xNEEyi5ympCxpKNhV6Ahk+6t0q42ZFudI8xX8d5Ivr9tbgUWQ2xquYvji2FL9lU
         aVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775230738; x=1775835538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlQHizxSHnf89XQwG90apDFPE1boyp7qYsxMDR+MAKc=;
        b=ZpQZtkSWcSCkviU5jLLoY25JKuwYPITWqsyddRq1mQI10pVYVyDdfxiK+IVEjJ/DWj
         sEc+gbgB5JuyWYvehnrqhhG9H2O4ZXNAgkTmVAHG8pOhel0h/uGoUWPBEuikWKtDTTli
         20EPmkrdeeYJ3N2zW2NzF5napfG+0WPOgj7bXNKi4iYDP0Isu09bqYf0md426SoBEn0T
         fxWKrqHfk/U2NiK1txyNOilNkX/v20ZU3FZfMMFZXd7yhR0WArjk+HeEKS0nTySzz6hl
         8jPAwYe0u/0Ikn8B8J3k5x8S99SAxVxQ2xhznBnpXQXUeXLG5i/FTDsmu8qoIqhiRAE2
         wnLA==
X-Forwarded-Encrypted: i=1; AJvYcCWtlPIjcQSPVNyVwmgpO/86K0MxewkWcuzwm0sawb91qd1b7gn5I4WhxH3KSZLEyelDTmzC0WyN9oJ57Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfDUJkxDyFjjLVVhqehei2qa0f5Uzfxi96cKKpIDakHcxS+y8
	bJJtPx56nGSebsCPUx/R9y9nAIyAmdpdNRjsyKYy2pPtMaZNzdSQc8k3MGPTVZe3/8FwHstctUB
	AmwiZ6vwM+bbSKnb6pLK1jii2+zCHrTdvky3VpVDqoxmfxP2NVM6/wlgXb16A/OvWs0dsMT8=
X-Gm-Gg: ATEYQzz2JUDGC2QBE6GuQ6UhqmYkTeJQ9iUyoar+v32RXJESedQalKFfldx59NzIlyH
	YQR+R7gJYBF6W1Bu9TE3JKck0pvpNMLtj7Zp1x+QDOoxb+O+EswTHHuw5pnFFsGOUACc5bIM/sD
	Eq9scioSojBJ6FfBQUzgyFOCKGGwfWaFjUou6yOZWsklDtqbBF63AMCY29rtja6we1djxzR9wbF
	uWOTqz4n4APLxn+gi/n3mXAwx/a3SfgdssOx2soWkdXo9Z0uRFSn2eiNUmNngvlI2r8n61u41b2
	LZlSZq9aSBaeARWoR+I1yvjIOtQib7u/kzeQQmipperhZN80sKTUzinf4Pt+pKTlxDXcuQeKnSk
	w5OeSuxCVrvBrsi52fRjGV/0qZkiMasQ=
X-Received: by 2002:a05:7022:6997:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12bfb7455dcmr1659266c88.24.1775230737733;
        Fri, 03 Apr 2026 08:38:57 -0700 (PDT)
X-Received: by 2002:a05:7022:6997:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12bfb7455dcmr1659243c88.24.1775230737154;
        Fri, 03 Apr 2026 08:38:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedea9807sm4669086c88.15.2026.04.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:38:56 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:38:55 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
Message-ID: <wneyyisnu6rtkzwpdantjfb6e3fzakkc4gbyfuanavunjoxaev@5niyyh64rdrb>
References: <20260403061302.2203179-1-xujiakai2025@iscas.ac.cn>
 <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hkbpiuquqvsseu7tkv5gtlfxlj7qvsjoj6rndntty2btpcmdpx@4dfgpwffld2k>
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cfdf12 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=MZhlcbl5PfivOvk-ML8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 9LrmahAuyA-QvQ4fJR5Wj9Dy4NVOfN-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzOCBTYWx0ZWRfX88ExAjhHApZw
 vXkzpZPkvxKdkO3wyHH+BbZAnFYEHaHTcmgOrQ9s7oWRplPCz2z1Rqlt2qqgxp1Qs8AfJE5VPrU
 MINiGkytCuARAPP1VZRcjAB7Tk8zYRSMg6MCYmJHU0+enBxeLKFPH4DU5YDtpFswvsKT9RoT/Z5
 6w0svqglM2ld+wOC7M3y51Pi4uJHiFcosRe5QKNDrwDPqW0HQST3NwlbjbNnOs2Um4g3cMFMn6R
 7/bpyKZPj5d6oo9+5KsqdMwyylkfNOBOUG8fKas3vypoCra6JZIYsOuu4VONhFQ2fI5aa4DXYr0
 0IH6G66AklZyzDhaZHIG4gSLcWfE3G2D7ISoTjxfP50EaR/XUEyyeXaBP3hjp5Mf68h2DNxlXWf
 XG9X7CTFrk5ZDvd/YTZqwDLmtWxm1eWsP6VBg4vGP8bPsTxkyzECcUBtPJv0dEhI5VXI3uZR0Cj
 ER7vcK+TqV7mINqlNLQ==
X-Proofpoint-GUID: 9LrmahAuyA-QvQ4fJR5Wj9Dy4NVOfN-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_083900_145597_97408B9B 
X-CRM114-Status: GOOD (  29.99  )
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

On Fri, Apr 03, 2026 at 10:30:35AM -0500, Andrew Jones wrote:
> On Fri, Apr 03, 2026 at 06:13:02AM +0000, Jiakai Xu wrote:
> > The make_xfence_request() function uses a shift operation to check if a
> > vCPU is in the hart mask:
> > 
> >   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> > 
> > However, when the difference between vcpu_id and hbase
> > is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> > 
> > This was detected by UBSAN:
> >   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
> >   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> > 
> > Fix this by adding a bounds check before the shift operation.
> > 
> > This bug was found by fuzzing the KVM RISC-V interface.
> > 
> > Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > ---
> >  arch/riscv/kvm/tlb.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> > index ff1aeac4eb8eb..500e001513a11 100644
> > --- a/arch/riscv/kvm/tlb.c
> > +++ b/arch/riscv/kvm/tlb.c
> > @@ -333,14 +333,17 @@ static void make_xfence_request(struct kvm *kvm,
> >  	unsigned long i;
> >  	struct kvm_vcpu *vcpu;
> >  	unsigned int actual_req = req;
> > +	unsigned int idx;
> >  	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
> >  
> >  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
> >  	kvm_for_each_vcpu(i, vcpu, kvm) {
> >  		if (hbase != -1UL) {
> > -			if (vcpu->vcpu_id < hbase)
> > +			idx = vcpu->vcpu_id - hbase;
> > +
> > +			if (idx < 0 || idx >= BITS_PER_LONG)
> 
> idx is unsigned, so I would expect this 'idx < 0' to produce a warning
> that it's always false.
> 
> I wouldn't introduce idx and just change the current condition instead
> 
>   if (vcpu->vcpu_id < hbase || vcpu->vcpu_id >= hbase + BITS_PER_LONG)
>      continue;
> 
> >  				continue;
> > -			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> > +			if (!(hmask & (1UL << idx)))
> >  				continue;
> >  		}
> >  
> > -- 
> > 2.34.1
> > 
> 
> unsigned arithmetic makes my head hurt. It would hurt less if we
> guaranteed the ranges of all the components. vcpu_ids are
> guaranteed to be [ 0, min(KVM_MAX_VCPU_IDS, INT_MAX) ), see
> kvm_vm_ioctl_create_vcpu(). We should also test and reject hbase
> and hmask in all the SBI calls to ensure that hbase is in the
> same range as vcpu_ids and hmask is in the [0, BITS_PER_LONG)
> range.

eh, scratch this last phrase. Of course hmask can be [0, ULONG_MAX], not
just [0, BITS_PER_LONG) - so it doesn't need a range check. I guess my
head hurt too much when I wrote that...

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
