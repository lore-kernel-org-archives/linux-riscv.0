Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E88EF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbyM0+nU5qB/+a6euyAdPz9SCBTvNl9DRiJwg8H0YGQ=; b=xR/cgNLXw6+EyU
	QgKs8bRZ+YcUpYrRLp8Nzi8Y2H+Bf2fhO8cmGB8h4OuP1dGE7XeNugrHtPjlX6j2ASgj8dhDlaiUN
	Dk8THWe1rX/Y1rDwMbjHXnldBBH/AnskhkWaSUj5mvMTrDr1zXN6Yf+K9Q2alaVoc6e+9Ohw/05l0
	pjKZ3yWLxMHyfuBqcLkEYTUqzU6BSwjVwlwhFSkwYcha01skkK1uq8SZO5lCOh2a1DG+z5lW6LbZZ
	mzH4Uy6ET/XKuV8r+lMla2bmjCYOSZ6jHoum8RIQHjbpgopBJ2k5O316Uk0Q7ztiWVSTtmALuJupu
	DISSEeAc00G3FdvhmP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7RV-0000000DRkE-2rkd;
	Sun, 08 Feb 2026 16:15:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp7RS-0000000DRhh-1QPm
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 16:15:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618DsXVx857159
	for <linux-riscv@lists.infradead.org>; Sun, 8 Feb 2026 16:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tEZvuD7PszcvIhjHPQ44DwrS
	7K/2mzb6NKM1cf9Fq+s=; b=Ek3q8dh3vTid99CagXWhxx91gyx/B54lCKqbKPh3
	xPreGTT76MiZnsBoKZVZX4zRHc8YpfRdWU1avt4sSDczYE9vhBsh0/KAvPnjWw1f
	M9jT7hr0ZlgaHVVh8k+P6giW6BEPxAXlpePn3TZ0kvS5XS4Epat5hNo5BUSGTyLY
	z6l72TrSU5jYf+csB3OZyc9M0e7yIqWGEp1fOgvncv88W2it0wZ18JglFRNEIalP
	+bUty3sunPxPpv5uLXfSGc9uqy7XJJF9MqNB6sFZQxhnxeun7EerI1bS1rxrl8c1
	5bb+zdTYnS1TAnl1kiA9YGF/1/9u9n5U6yGHPkRUzoQzpA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamtmn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 16:15:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso2779504eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770567318; x=1771172118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEZvuD7PszcvIhjHPQ44DwrS7K/2mzb6NKM1cf9Fq+s=;
        b=I9UMuBJJzdgD1azwb6AExaI9QmK8qJ2usA/PswQygCiUS43urerZHRDZs1GVO4Idri
         MHfwr4CcOir89J+kLiEnfhwHLR2katnX4fKzC/k5FCO1GnLqRCzVUbNJ2R9pkOX/MMao
         hoK7EpeNLscw0VQozBU9146v9vtodkfro69X/4L8xTOo720NRqaYhP4nGn3rKbNRUglD
         8fIUF6+Yyo2Kvc6hUKT8M3iPyxbZasPWlQwvILciYXC93zEk8kXigr9iBLPsKp+tVUtu
         J8hB8NJQyo9aPWhI96UxOMQ0Ljg8I3oo8blWOZiqPBPp0F6yzQFa+2tMhJRun/PxNE3a
         Kzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770567318; x=1771172118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEZvuD7PszcvIhjHPQ44DwrS7K/2mzb6NKM1cf9Fq+s=;
        b=O2wjgGWCFoH3mcHBF97rJNI1SfoY5yFhfVfrXY5UeOYKtETkBTNTzXkJaI15+tUULP
         AtRYopFMX23MvDgV/tFnHFXH1aUicygNJOUCo4dMdpP6fC0S2pBzWqiB5kfwiKMcj4i/
         16Fq4a71wYIvFKU89SkXYwjky2gjI3DMQXP53Rttyp8pWVggZ1PaGaZ4imkQnSOAQich
         hLn3ov1SYQb4zOZd1zCM/GfPw7AIiu26XeawbNXuZxq9LJFrJMUgUJuq/vkH0IR5henN
         0hxq9WmowB2JY90CJ4oOcQBu8Zchsw8qFZJwWKT/Cfbvqc6k3w/GF8csJMDM/RCFErGC
         xpIA==
X-Forwarded-Encrypted: i=1; AJvYcCUB0G/OuFWHR01pV6XUEG0eQXbswScrUBaBKmedoCqovwg4vDXtybqu7TQDv92I/HX7CcS0lSW4tKiXZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YySuOnRDo4a6RZhRh//vg9IWJL1oDHrg3ck8UEPO1bBLUwn4mOJ
	eKj82+nhCr0eBIZEalD3c/0j+mYvlF8Ysmxd8REGliOeNuHZ9LhnHlFbctXl8mzWu6Kdo5mCsV8
	52o8Gw3e4V/FdxDftyOwcuPlp71Nm1Mdv4/k+OHpyn62TT1JrfeS9KJlBYatbguyPtua7DmE=
X-Gm-Gg: AZuq6aL/D6sVQC3Z+ONpcVhVfeFu0S+OzqXAVIm48NEZkCuzWsvyCvF7P8k9vWZ/MLn
	5c2Mn4TkQHAkF47G1D6gILdPAn18b5fzHm/9aQN7x6cZEnuz7dEauqNNDBScQhnpwAXAi/JdOdg
	ZxaBWjf/fRTA57RzbnK8/abn0IwSsswFQuGv4fr2gARryQPGmlWSgRNQ7+6Q7Ou58bZ8rwp0bTo
	oHB+DN56micidCnjixuB14TpXU5Ux2ruhwzZr33xOnzgIymnmGF8+suVOe4p0JYQvRTd/GIt+Zw
	fRRRAtuwirR+P5B1BHq7/Khv1wBVPyGOXTNvfR5FWlAEC9Vw5QX1wCZAhg1GR2GDFpvCrz44iqR
	TFX1qcCeJ7N9jOkCtelY=
X-Received: by 2002:a05:693c:60d8:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2ba6aefa62dmr561805eec.27.1770567317615;
        Sun, 08 Feb 2026 08:15:17 -0800 (PST)
X-Received: by 2002:a05:693c:60d8:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2ba6aefa62dmr561793eec.27.1770567316986;
        Sun, 08 Feb 2026 08:15:16 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm5952312eec.10.2026.02.08.08.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 08:15:16 -0800 (PST)
Date: Sun, 8 Feb 2026 10:15:15 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <3ffm2j66avwpud3sdgjua7jrkhb7bgbaxlp3jnzve7p2xpmcnj@slek5n6t54zn>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
X-Proofpoint-GUID: WjjiMx2wzOizT1eI_kwd7Baj1N27EXxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE0MCBTYWx0ZWRfXzC4qU68VmMAc
 rM9e0YGOFI+QL0xMHkrYpGi7trnGH2GcHYdtKHi+vKecJnAAA7rzccYKY2RK/prD2PA1b7g1Cjp
 pVFfm1h4UwYVRxOdcB19vioxv8IBkj0iy1fSWYEpenyMspYzD06alQ9bJXFIwl1r6FFehxgJ8b7
 cIvX2WP8iBfGRo/Mbd8WgKnHXurYbQf1e5JDyRSnplHl/4g3Pwi2VAxZ+79R2lP6BulYj+Ko1ky
 GyxcxgEBskcFpxpEEXASX3NTpFGOi93bYx9G9nnMVahK1DM/Syw49qVz1c1TbBOco+GyxiB+SJl
 dUReIrVPWq42O2SZJ384aszHS9JjCYdPgKyiUY+qlcxE4uW38faBl7BziuSXOsfG4fnE8uqllIk
 X5km6Pg7NugxUzCVaavHElVfIGxFt/e+TipkqWDa3DhGWl+A4VYnhbOb/qSz5I3KVsDMuYW7xPg
 gD7KafGALK7pCJxsa/w==
X-Proofpoint-ORIG-GUID: WjjiMx2wzOizT1eI_kwd7Baj1N27EXxh
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=6988b696 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ZTsgeh6Hs3hiWlqVS5QA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602080140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_081522_637225_9F786199 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, Feb 05, 2026 at 06:23:46PM -0600, Andrew Jones wrote:
...
> +static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
> +{
> +	struct riscv_hwprobe pair;
> +
> +	if (!IS_ENABLED(CONFIG_64BIT))
> +		return false;
> +
> +	/* Additional mandates for Zic64b and Supm */
> +	if (riscv_cbom_block_size != 64 ||
> +	    riscv_cbop_block_size != 64 ||
> +	    riscv_cboz_block_size != 64 ||
> +	    !riscv_have_user_pmlen_7)
> +		return false;
> +

Thanks to kernel test robot's report I'll fix the compilation of this for
configs without RISCV_ISA_SUPM with the following change and something
similar for patch10.

Thanks,
drew

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 4b9981b15ebe..3fd63ac7dd60 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -278,7 +278,7 @@ static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
        if (riscv_cbom_block_size != 64 ||
            riscv_cbop_block_size != 64 ||
            riscv_cboz_block_size != 64 ||
-           !riscv_have_user_pmlen_7)
+           !IS_ENABLED(CONFIG_RISCV_ISA_SUPM) || !riscv_have_user_pmlen_7)
                return false;

        hwprobe_isa_ext0(&pair, cpus);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
