Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CADEFCE4D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 23:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqpX0tJeg4YOZ46mh9rW6mIKahD8B8whGb6E1KnXUxM=; b=moVyoCr4WPxmHn
	bLpYfLuqwdG/ZfszvBswfca6JkcPU87m6407vRrCsvjlApBg8HLb43K4IXJ0P6wwc19RqlPR23S30
	jX+YbVJnBGFm5cTZ0oHTyv56p47PdHLaOHopV8C28QOIwR3/JD+qeuut2rtjrgIIoj/zDaDT0p8dN
	PwzIUk5bPa4J5X3ilY1UgZTrd4eQfEmHNiJTdlB7KbMJLuYVl23+XTJlTCiil5k8CqrarXSRPu+Qq
	rS3KDwYWjhwhM9mjhHT1/q60Lxp5S3WHxkFPow6HZG74qr69FGrDWXuKiLOlXpr/5Ohy+q3sWN9JO
	rYkqwBsZlgebd5mzjwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw5P-00000000fJC-0HEn;
	Wed, 04 Mar 2026 23:57:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw5M-00000000fG3-0vU7
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 23:57:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624I5kLs1213639
	for <linux-riscv@lists.infradead.org>; Wed, 4 Mar 2026 23:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=La/zyW1kZlkdjuba28Y6cKUE
	jgLjT1PdHqsncSoONxI=; b=M3gyhoDKsD95tRqPBt6AVRtUJ8xAewA9091Llh/v
	3N7WGAoRQBPzVIJQ+qMMIDlNc/bfennDxIAH2TEssBH789bj2CFI/9WHiWumbLtX
	Ql5cWWDkmHK/HrduZFYdFIBCxQbuZCUwt9VpsjOneOKdaQDvPYtLjUV+u71lyXmG
	dmxjU+qXynuSopTYtoQMCaamDnBl8AhwF8OiwiX39d0m+NMjaFXCFWCfbfdsFV2h
	o+l1R38GMJrzXlm7o2GPUvHPn1156OUgdepeJ2YZzwgJPRbOnHzpNxoiQgsN2xDS
	DJcDnZ8howbsvkbWgknRmV8ZQ+d0VG8z+7CPjjKVm1P8FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5tdnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 23:56:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so4436844385a.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668618; x=1773273418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=YDyzOGi0ddnzwY4FMICq2iyuqGv2h01cTEblYeeeRMEB7sopP/WdZQxbXmb6D0Kgdd
         s5gHb6NZPWGJmIYeS5XWBi6ORXFyrg1a9sxgUqLC9HH3QyKs9NEirddwCpknLPDccb4N
         xhh4lyr1cib4f2j2z56IoXJEWBcBFR4AV9LMaTBENl4f8y/LkUWHBSnwW80nMt3hQs9f
         Klnap+hztbB4d0rxnGLxvTRiZcSf31odNkB6hKZx9BSiO725dnG2hdFziRFAtlXpWSmf
         Qx3YabHAuozIErvjH7cI559C5TmdW9ZTR+oR0DtG5OwGIWZADZjnWQ+3REgX6xBhHVmF
         HkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668618; x=1773273418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=La/zyW1kZlkdjuba28Y6cKUEjgLjT1PdHqsncSoONxI=;
        b=n4zKaUx/o8ygWz3BC6Vby+8xrTgzi3SmgRLJWc3RGFy39joVLvCuGvhJ38LxFum6fm
         kT5w5xsM2mlZMjmC1Nx+NKqPqm0cigTVpl3XPzMVRzW/xvtTCCx5xY5ZLw5/gNx6Ju8d
         OEdqIuhjGXrXFPZhLY+4BKBGK8X4ITg07BHickHSH0HUHtgpQfakgtQCEM90eWIsNNr+
         gvk57vezj+adzPRoFCYr0AwHNAWYgPj3tOpw0DsFoITFhxwyFAxlLu6AR4xX1c8dNFRo
         UB4mKeQFA9FxsV92NbNT7WdBQ5dqmWZ8o+r2YK2e/B1+vdAhRm3yCkTOV7zRja95s6Yy
         aKEw==
X-Forwarded-Encrypted: i=1; AJvYcCVqugJuIa1ZbUJNX441BO2vTi+EYlGvkHq06pW9OGTaAhgOSDuac1pFXNfT61Bmfem8bPQitrz3/BFjsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9H0qrTXk07eMeeYsLLufFXa0TRwiVwZ7s3ksBa5g4fRdDIoQA
	lhCKvbN/w22TzkS4Pv7zW6D/PllOCuCfqY4Cqg1e+FQVP9xM6ux5bgEuaEMZjT/hG6d0rCOWXy1
	kjk6KOj3C/bx6h6GXMT52wZlUSNnPl2gbNhFvyp3M5yzAVKFxRiGg5JKsDvtyZLaE5+yYbsI=
X-Gm-Gg: ATEYQzwF75/nKpEh7wx+vpIokXXQCm4v4zxNoltyIdRlJrojNWn7F/90EBMKX5VyFSa
	ado+fDkBu1mehCCJRkohgJCLfjiJFNT02P1Ppgm1KRCR0P+pWgpUoMKNxOBaBkqXkNuWJMS0vJd
	x1PxgGSyFJwwpoV7SZ7PvDmu/Ib/RzTavL+UzX0UFfBtT885oQg3zyyj9eYaV+Psco95c5ngR1S
	5oeZRgM46nbiDmPKZRJUIs7/MwFOZj46INoJdYoT2iy/dgC0+yQc9z/qwFJRYWyabRec4kpJ9VJ
	HMj3LefJYIsKtmlJwMRGb1bA6GY+CyNon9l1fYOwsxh7m5Swc7olFZVBC92hOyq0ZuynAZfKcMU
	4f8+PQXYumzJsiYQ3ohBa48pmpLYnqpFHqfZADm8SNnVify49HIE9h+1RH1eDWmho3somrLRc9d
	PQ6eRf82lcNwz+VkJOkw+YqK+UdILovJ3dWDo=
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481317785a.40.1772668618467;
        Wed, 04 Mar 2026 15:56:58 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c6:770c:40d8 with SMTP id af79cd13be357-8cd5af775e5mr481314985a.40.1772668617932;
        Wed, 04 Mar 2026 15:56:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573df2sm1571493e87.65.2026.03.04.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:56 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 21/22] phy: remove temporary provider
 compatibility from consumer header
Message-ID: <o3yvtltydr5hvve2htwgqbp4bfopgu74ft4gnyelmges3hmiaa@wy3brdd5dnek>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-22-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-22-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: t1BI6TJT3olprkyZZ4ZzBz0yV5_3z9QU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX39JDaQKv7nlG
 ot1pZg3L8ZRSRqqRFaef9Rc0suKlRBKKix1cgvnUapFizrN4DM38NFbrH4ikXKu4e95IphlfSVP
 LbV6XzLOK2wjWuyAAqkXertQB6BzAoMeJusGsJ7vcMClrSzMMSCfs8grfkPLjrHK9eGoOy60NwZ
 54W9VkrDlNQtgRFXXhUmqumYu6mqmqvgD3d4biI5k6dSdrv/JfdLip76PyzY91efn1N45Wyiu90
 D4W9buT+kk3zhY+wYdh6PBPlfRKAViuDX4YQp8E+7zYYjx2/F40V1eNYIpej8BLY15pdL2x/BFY
 UHE4FldvCn6rdVMK2tdtsIVchpPNs7e6P4eeRGRl6r8ChKKyeyRQ12FL5mZkXbWPU3Y1NVKf92i
 aw/j6O8Xz7aZNmyO2/ozFQKq4Bu3w3IdmnaPER9hVAbKbfLczRxmes+BwqN/mFknFZhN0zRNpmu
 YmI77gFhaoolLyj+KTA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c6cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=Ji6k5uvf-STsHdHMmocA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: t1BI6TJT3olprkyZZ4ZzBz0yV5_3z9QU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155700_388614_2AC797D7 
X-CRM114-Status: GOOD (  11.73  )
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

On Wed, Mar 04, 2026 at 07:57:34PM +0200, Vladimir Oltean wrote:
> Now that all consumers have been updated to no longer dereference fields
> inside struct phy, we can hide its definition altogether from public view.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  include/linux/phy/phy.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
