Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD494606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6aRDjS1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mQpqHWPm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dk4ndTb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D1xtUrPBDc2Lus+gDP+ysgoD7kubvs+jJBxs7VXANZo=; b=T6aRDjS1hKtfCxJ2/7flSc4JFl
	de6n67fyuJmBQrScH38VFtdf6YhUlbzqDtLqNo89pzvJqy1ujadqV2pvPo5OWTIkkEJNxOooU0wXT
	AgQqJkoRMQsgclWznbOOngeGI14oJ/FsT7rysM60yGsL9FzRaPZ1Tlr7gNiFDeF5+MUMpZ3ov0u6O
	l3Rhss8ZtFpSdYelfguNd0emtEr3/CfS9b3jHhWzE5oZJh3Lh4xbQl2kbopiqmSNNZqe2/whpDZ4G
	ZY04KFFGSU4O9LHKgui19gq6VPyijrqLdF6tG2fY8c81oc+Gd92YEvMIy1fWPqsE39fGccj6TywP3
	uIjuflXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8EK-00000006nka-3nAc;
	Wed, 11 Nov 2026 13:19:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8EJ-00000006nk5-147O
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 13:19:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ2393292079
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=; b=mQpqHWPmMGcnsiWf
	hpO1cKg+Jtxp/uwmr3icseUD75KSQGBoZgTj+xRXcYgJjR9yrckym1UxN1U767Rz
	Y0cjFwgFiJj7RnFB/zhSiI0OsZZn6rsMxWcUFDLYrMlmmSX3sq+nvZhrHf5G9Sq2
	ivV+L+8RA5D5qCptz8SAyO+Jm04QZwE9HE2Gh2myiEWRxTPy/hTOc09Hry7LqCLf
	Go/4nhCBvtSSe0LfKZ83Y+eRuKaWYad5aiaKOTx3yFtDIv0AAZ/DoWt5Da+qb3Zn
	Aq7xTfxQEC1qT0LtzsoCnaiNCiIY7Pjt7yz9tQ51dHfpp/tjCRLG8Ug0uAkQgptf
	OK/bTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2mq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:19:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so666809385a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 05:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403150; x=1795007950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=;
        b=Dk4ndTb4J5IGoS3QUUn2Yf5RrxDliJvCMCXJx/hy5tOi07N6dGp41ziUoKJwCRRUtW
         JCJndz7nTeafu/5uSahjZ3IWOkFNArlCHbsUPaj05KNRkzRyobybIhNh0CdA/3cSGr2z
         KZg69NmQL3uW3mLtHdpw4ZiVjp9Pgzxo5z804MYlxdiQMqShJlf/i1G1hP/ZTbnVzEry
         /8Yng/DuHvSzSvTdLRQkP7G8P19yBtn3s1CBBfnZ+XCln/pvU7urYxOXdmGJPIG3ofPf
         2AsRw5n2NlwSFR9YiquWMtiSTKV+bO/gkOrjgWmwRyzDQqpRIm9QY9uHR/GCCwLKTvOK
         8+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403150; x=1795007950;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq0x5a4mY8xB9yKVASur7KflnAB98WTg4FjBdau/vd4=;
        b=gSoeLrfgl2CKOQXMSQZnonNbnInCITe1QijXiLpuXaAjvk6hnYqkeL03uMamRL1K63
         hXlvXQ8ZUAdggkXlQAZz1uylx/xDvP5+9tsHGDXtI+0WT2xKVoPOpFVjHSoC/ZMK/Vcs
         IvPQyhffpe0S2IScsbqwcplnG9G3rqr4+O7eoCRmWljIDFZcgHp+75zMtwtcW7u7ciS2
         Ib0TRWe9nd9nmXt9nmtN4BWraP2vO3gpFNgvjhiCJm2gtz+08KFbEGjqYFGimYfs6sw3
         uxa8ptY1fTv8WRMOEb1ZP6ZGar9XN/zgfwHYGamrXC/1k10vgr7OEDaP2LLA/wL6Zbh8
         RN0w==
X-Forwarded-Encrypted: i=1; AL+hErGrva5azaZa0XS4AeVpKBRae8G/kz2+VkFN2cMAy5pK1Z6B3L1YOeca5x7Oz/Cz/S6tqk9nYUSoP7vS5Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/PlAWh4PuuATC3CIr+7y05/WaB5ZEeFgLGWk8n3psfodUXd2U+
	ZWK/goQT+WeO9TUcPXv8REezI6DfqOYS53lJkkiemM1OjlQh3bMxZDOcAEolvyyHSo56XB1w5h9
	X27SWg1tws4263/diuZ6wqUDBQGPpkKaZAkSLPJsrvClKPLxtw1KORGI6fSzG8cn77lBK++B/0K
	WxkDI=
X-Gm-Gg: AYBFou06naswE4o5ofRGT/VwfgQOJo2aZIclC9PTfZ/j/zw2iwG1QM6i9vs8iHd5wRw
	fJtEjxzVi5WVe23Fix0AJxttWmJRYqVTsCCOFRPOFtdVGJo5PHfS3+avc7ebEaNSQaI4Luk5xkd
	pKgwhJcxTbKDC5blapOjjqwvAadZVJKYZzBTHQLG9LOLyKLosVzOSYA9Dl2UtNDj2z9D3IBkI8a
	ao0sRPRe0n9j3Eob2P0wYXeXieRwHXuTkZO7yjn8F5unHlsMAo+kHegfS3z/PL9sfZHygEuRXVi
	ob9rlGksaA1f9EboGxVBMFiksLPWoWIkbJBmv2YZZSKGpdjO6nSG+c70jc1ngIZ+Fyiu2zfx1DL
	1y6u8qtJhTxAnzXSr0HJjePGsw7jd2A/luDW/SwWQGnbtr7LmoxXd0W11AHL7H69ZzWrmQuM4sT
	MNfYc/EUV26rd2QiF+14AXf2SCsTexGm/iwzuOPl2L2/Zfp7cNCIeMTRanz1cF3GnWbGSZSjN3i
	0QqCzY2wzFE7+ZZHPgB2Nju3yKwVI7E9DFEbvbP8mjO
X-Received: by 2002:a05:620a:294c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-947b0051f3emr367304785a.68.1794403148748;
        Wed, 11 Nov 2026 05:19:08 -0800 (PST)
X-Received: by 2002:a05:620a:294c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-947b0051f3emr367299885a.68.1794403148297;
        Wed, 11 Nov 2026 05:19:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823caasm2343467a12.1.2026.11.11.05.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:19:06 -0800 (PST)
Message-ID: <c55d221b-4c1a-4b7c-b91e-dd89a12e0675@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:19:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled
 is set
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao
 <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX1DkFUhhebnwd
 e7WGNnB7o2NA7WQhNaAhbR6R4Csj+u6TmZjKO/hg1M/HQ6BKSEkRsE3iq4aaGR7lTTZDzj3L7kH
 +nalg43OfMqXRN4U4RnV11YJVqH8wmQySLS8cCDwJqa73Hn0n1K7a15DevbfV8nzDy/HeJdnG4G
 +XlVsFGWzR1HJMAgNr3DdB06Ulc3ER2mm/LRzIkfuFvK4ViedOCvoFMwqDQA33pLgDL/AsN1wII
 eMTOcj/42dITKuemUvHuas3yy170JiYOqMsuVztYtHk66g/Jyh0NObudqzcOxjX+lOlAHwr3qMI
 NTS8lOCUmtjK7ZZX2Xktug+TGMutzPeei1w4r6qbYpG4NI4P5my09bWVLgCM2BYKZxv1dlAOaVi
 Q0p0gPxLcE3I9MqNWgi2OWjaGqL9YGSzVlDSXePhduxjsxzs2wiyVQpPGv3NhdXjkPJSwXBqgfR
 MZzpTn2MEBd5XIqvk3Q==
X-Proofpoint-GUID: 3GehynvqWbc3zXyl5phfqkWbnGGcye6S
X-Proofpoint-ORIG-GUID: 3GehynvqWbc3zXyl5phfqkWbnGGcye6S
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46b4e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gDy9M4QhnISp6OFiptMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX8V/XRoaKJaHK
 RDYlIHsgKwMtdXBy+ReUEautYKtZqTm6ZND9Ga+GmS3d3ZRHRdksLiq1QI55JR1AQMDz45vEyb3
 oxPqHAEX9allF7J7zdH4TfoC+VNPI2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_051911_302654_46F921B6 
X-CRM114-Status: GOOD (  24.42  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11-Nov-26 14:16, Hans de Goede wrote:
> The core wmi module provides symbols which may be used by other modules.
> These other modules may still function when acpi_disabled is set, but
> the current behavior of acpi_wmi_init() returning -ENODEV when it is set
> causes loading these modules to fail because the wmi module these depend
> on fails to load with -ENODEV.
> 
> One example of this is booting a kernel with both DT and ACPI/WMI support
> on an arm64 systems with devicetree which will lead to acpi_disabled being
> set. Trying to load the amdgpu module will fail in this case because it
> uses symbols from the drivers/acpi/video module which in turn uses symbols
> from the wmi module. Note the video module itself already contains handling
> to still load when acpi_disables is set for similar reasons.
> 
> Fix this by allowing the wmi module to still load and also register
> the class and bus instances since some exported functions like
> wmi_driver_register() rely on these being valid.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Note there is an earlier submitted version of a similar patch here:


> ---
>  drivers/platform/wmi/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..412f2e23b01d 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1573,9 +1573,6 @@ static int __init acpi_wmi_init(void)
>  {
>  	int error;
>  
> -	if (acpi_disabled)
> -		return -ENODEV;
> -
>  	error = class_register(&wmi_bus_class);
>  	if (error)
>  		return error;
> @@ -1584,6 +1581,9 @@ static int __init acpi_wmi_init(void)
>  	if (error)
>  		goto err_unreg_class;
>  
> +	if (acpi_disabled)
> +		return 0;
> +
>  	error = platform_driver_register(&acpi_wmi_driver);
>  	if (error) {
>  		pr_err("Error loading mapper\n");
> @@ -1603,7 +1603,8 @@ static int __init acpi_wmi_init(void)
>  
>  static void __exit acpi_wmi_exit(void)
>  {
> -	platform_driver_unregister(&acpi_wmi_driver);
> +	if (!acpi_disabled)
> +		platform_driver_unregister(&acpi_wmi_driver);
>  	bus_unregister(&wmi_bus_type);
>  	class_unregister(&wmi_bus_class);
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
