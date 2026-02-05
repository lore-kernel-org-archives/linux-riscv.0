Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F96E9129C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqJsrqrRqepOOhtIsUzLjN702l38W1id43xT+Pv0DRw=; b=gLNKBR5jN2KuW4
	9ZLxcggno6XxHeQRTS26olIuOjC7T7++QGN8zzMrVVnOqTVwIGjjtRDPDpxUSykhjK+waHnkqt5lA
	RmXe8jz1GazF6RrR327RXHCXlFN4kgf3p1MkNU0Iph6zatC6OyL36M/Q9XGa4BISFF+gh0Q/e+EFl
	FxVKBvsQRIUcXZSscIM2SihVUeVf6X22zwp4SfHDy0WCOxcuWmxFK5OxA92nGWVxRy43C6qha7phq
	OH2VOj5yjEEEDc1IjaXiVamoSdqURLd+9L6hXSqtoY/AQzJaOqntGuzNnVeI2ubooDz+Q8Cd86gZ9
	GAImdgQHxRVSQIlfFx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0me-0000000A3hV-3Z0X;
	Thu, 05 Feb 2026 14:56:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0mb-0000000A3gP-1Z1W
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:56:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Bjv6t4125909
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 14:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9g6+zH9yTy+gqiQg02/erDU6
	iT9X69ZdnysU8cGq/4k=; b=H/rALWxp2l6X54hT7X5f0Pe16GD/FTZddeL+7ndP
	GO5q0vqJu75qA6yRtJITBurImTgWxYB+/gvSu6b/9irQ8rkIsWByGEgYcvp2/wyc
	m+wuWYFG6gewptipkrCkvPZCIpWipejGYymc9JoFDaa67mKWFS7CIh1VoLGexZFM
	hDzdMogstPzZ3fUpyd9boZoux4r5NMUsgP6MIDNXDFIH8jBM5UFziM2Yc03RE8dz
	EQ/yHKTJKeNBoI8c4oDrQyUYhZbQimMZ2G/+aADOv+U7tPD57nn702DYknUI5WR+
	wAhAMTvyNdncZyusJpJJ4KX96WOTSySErcv/cY11Uvv2PA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rhs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 14:56:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a978ba9bso1632612c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303396; x=1770908196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=SdYDwLoeYg79t5XUbcrYHz81lVHq8BtqhXfJFX+Pbjz1YJKYpI48tuA28eYO0WexvB
         uQP73mjQ2OC4Thporsfmf+WNOOmuQnmX5bF+9Q3nEktXYCCaRtHxP5tu8/KaZUpzvrlk
         s1w6kf2Ycyjmxdyk1dOd13QiIIEgKbjL6292XY3WLj93M+azhWGjjijLw2TzwOOetN8J
         mj1arXGcyUNKo5+SyQ4UQFkvYH8wAMpzLKRGitVCdyuIh5+fk/8KoIgn4mCL5dAWag+3
         z9VMBUOmGQPV2rsdl6FaG2ypehDX72y4dI+AK937b44jyhlzpFGWBc4ZEBNB9dNRfRoQ
         qIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303396; x=1770908196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=s2kgp49p2rTWNmtOFq3VRKPOLtO2O7hfsbnEAOoRE2ua/XzD+6KSNLlZRyN+mZ00uO
         jj6ID4MaTdQqAAObxQ4eXXXFlZA63KLCaNGF+sLV2465CitO4t2vaIZ/om5Lm/ZhuiQ8
         egfbfUhQQt67NkA0ae06sOyM1W9KOfoOv4rbAJD3JoGm1CZdGP9A/azilluev83DL0EQ
         d+Khi1/PMIvFnDghkxhjwfIBOYC9l1aM28ozEw280DZp28YRhkQgVVpszg9ELW2VxEOO
         p9J+yBgvMy7LYe7ImOt/up6cs9Dy7Owq06Tz3xmMmaJMHFzNSrpQxMAd031CEWKRKt8d
         vTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXstPE+X4xrtI3wq07+kzM4mvX6Hg7clqUfNRQhDheg1WDogbFvujXfGRvIOxMFOvOAdcCDjR3P2wpzYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyboetsTglvsiEk2FpnR7/4UJElGzgIqA7E/xTbEtu9Vi/g7o3L
	2M42Ns+qmQn26CHdGzYAcaVwx698LO2iv6AhF88MWpHGdTt4tObEWWnTTQFyBpfXM+jWjmF7OBN
	H0rQASd9XWmQFdxlkZyXxflH5tVZvkrrq7D1OT8WOeAeYmIFBGjTFv2c8yOely+OhU8Fp6KM=
X-Gm-Gg: AZuq6aKjFoZyf+R5nlINMCUOVw2jdMzuMQsIfz4DLDs3kZVJZ+QYAnLFesKdL0IaM+H
	KBwfVY0dFvp0u4uchj4JXsHeK4MtcXiodkgAllYK4iKKpWrBXLUr+oufPPQl1dIobJB/vU/7wEh
	hwALAxLWtfQlOjWySyZZB4z/4ip+4heL+rJyzTw7kqqXxQB8efOaZBiApOOei0ycJDRzwrGOKHW
	4u8CwrA4ektVyneUMVgITONvCrbetMu0o6MqXNO0dv5dj1Z9R+cRyDo8qyN80hMOJk2Z0ViFNW+
	8HXzlm++EFiMv3pdT5FxRGCGI+OtkH6bGG/hKKuRuyyvazy6VtkvZizycrr7IPigMwBigqt9VYF
	8nOJ2sUJvwtFEXHi8hFA=
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575061c88.8.1770303396087;
        Thu, 05 Feb 2026 06:56:36 -0800 (PST)
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575043c88.8.1770303395516;
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503e5aasm4543164c88.14.2026.02.05.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Date: Thu, 5 Feb 2026 08:56:33 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Support runtime configuration for per-VM's HGATP
 mode
Message-ID: <vgqqpqfqin34stqyd2gdqxiopw6vornjpmomuyctx7ngbtjj5t@ly4avedudyrx>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984afa4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=pZlcIiJjb0-w25zZ6xIA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX3cjXt8upI/Ma
 KZac/Sq2Vd0jgIqZWxFdE/QdO/c+yR/kd0KjlG/fRNl/signNsjNLdnlMxG7rmK81UIkhcpVnn5
 Jtwi7Ny9azjq9RW8Vd0NK81TRr/08avkFVi+oyHHWWmXk5IO1gqdlFB7W10RnlMjQFpYPefhHoQ
 raWtfN2NRnDpPHCdyVKUm4H4iN2E+FWbljz+JIqi/ymHEl6rSJDjCAgpDVBQ7Vk1v7DhMhjSwSU
 X9CoVJDTCKCXljEMhx3LvfDYK4LMREdXrWzZv3A3vTlJP0U+Q5/TiqXs0MqC8xIBJOo8YIKYYhc
 sJ8rV9Jn0JoYV4FoV+GiGYTq4S+8aRXaUH4EjrDvaFKRCRrOm29uBOFay22SIb1AVNk2+YDzKFK
 FKZe7nA2EdznKcgDSzi9/7VkhoewC1EDJqH3rhO6BAJMNsip5LaZQEkBCfWv9sLjHx+0k/WNtAP
 LDfqYGxxRuewbu29WqA==
X-Proofpoint-ORIG-GUID: 9Y-wtXF7J1kTyHikEHuvkuUuBasZ27Ca
X-Proofpoint-GUID: 9Y-wtXF7J1kTyHikEHuvkuUuBasZ27Ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_065638_212182_14B9EA45 
X-CRM114-Status: GOOD (  12.70  )
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

On Wed, Feb 04, 2026 at 09:45:04PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode)
> to the maximum mode detected at boot time (e.g., SV57x4 if supported). but
> often such a wide GPA is unnecessary, just as a host sometimes doesn't need
> sv57.
> 
> This patch introduces per-VM configurability of the G-stage mode via a new
> KVM capability: KVM_CAP_RISCV_SET_HGATP_MODE. User-space can now explicitly
> request a specific HGATP mode (SV39x4, SV48x4, SV57x4 or SV32x4) during
> VM creation.
> 

For the series,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
