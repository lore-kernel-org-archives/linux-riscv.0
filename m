Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21714606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RCxhWx2i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUdel8PV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJMxEYy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fRj0igEB+Idh4LUHWZr7kbMusUurGlwDwCUelr01gO4=; b=RCxhWx2idmWw1POYWZDW1it2zc
	gsfgLdsqtbr7QQCsnLg3a0jJut4nO+iNRGjz6g8VZuA0X1nb9xHye1RJPZi/Aky4OBrV8yedwIXDa
	wQDrrIbbFYsFy/LtRhVHAGdR+cNBKWRDm2LvxXud6UvpUh0gS53axhscWkS8z0OBHuelDAbbnitX2
	/MRAde/GKZdP9wxCCBWDMxM1joH2G9M1aKDM+wqbgj75qwCcGRo/UaUwVqNaLc9NVczm/MLkmagib
	IzALgvK1O/WVVG87wZ4qBpTCFx/WsnGMyjtgAlz3Kagoa8rN5iDEXhUoXPPmChRfIg4WJq9DJz9sP
	y/Ozvskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8En-00000006nnj-03EI;
	Wed, 11 Nov 2026 13:19:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8Ek-00000006nn9-43CW
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 13:19:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYrjd2286480
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=; b=nUdel8PVYqIl3Gsq
	/j/RTqd7yVEa0MjHJ6v5rYud3wkSYnllQnO9MltQoIaGStS6kHn3GW4u3GRfqNPC
	y4+MElDtsFvBfG3J6M5orv7LPDvrtEWQNyGtigNjlTHMf+U/IUliVGmQrSjTA+ge
	y7e6escSzYO7500HAse/Ob9fd1WOAx6YQ74qqnKvGbi5PFIP6xElHzqjUFXWYkT1
	X18lTfyYFJf6CSUe2AhJgcLpWPn/AhdoY+abaJMZwF3S3r4QUamMlXGCeM9FzM8u
	W0MikvrfB+D9WajReR77NXIL6FBWBer2f1A4S+OKLMXGJYC27SyCY4/GxdVuZwbe
	z/1wfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9anp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 13:19:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so370319685a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 05:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403177; x=1795007977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=;
        b=VJMxEYy5PkJGHq91EoZWk6Bn/oBUBgddyGDcVuy1MTEWiYLl/O1QLRwRsJ84Tx8Kiy
         3hiAnxS4ASEjZiSnYZ6JHREa6rfEvs8v3V8LegWmyjehIzi1LLBuhvm0JayqxH5xKBOA
         QCxHbZfDT/5IeGUgI5QIq7uikrjSVb9lwaFDxfPh2DgT9xQ54U2ntAOIK2dTzNTyKhTS
         lN8sahVmuIX+EobIE7XyzNfzfQ6NaEPNaTnffz1acreDsmIFQrHd3+x5tNxZ/sDmC4le
         Sk/Q1HHZjQE91tMxiAYaGyTMEqk64SnR3K6nO6w26jFPmCjzczTSnz5IAFDaOGuCZ8JT
         Xi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403177; x=1795007977;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSLwx4JWXrb44TFN9YjVKJs/9lxbg9iaLEGL8zMJBvw=;
        b=dRNRiuXiNUDrHLNit48IWK+bIgTyanlV9yTtJglAzEhdqwWprZaRoNw1YPKWMHZM/K
         oAS0ZAUBk1L5F02q92j2TP42xqvH+wlSrO67ayZ2sjrTXTwscSaxVk+dnmHogw2mZFwA
         n//vNxr5LT+C/1K0pu01Aa39/pBPdrOMKfB187bTc/g00jq8owJ3WVmf1EJwcRxdVlkV
         /wbejHF8FkstHxEjsD/CG7YWSm/t/hfaxkwm4EB6KP91ugAjJgTPMDWYyfF7gg1vvj1l
         XBUpYJbUTwUFw1+BDbEJtlU2rognbCuIjahuUls51kncrL7jd3ozMsXmibjgAYdSIYw2
         TK2w==
X-Forwarded-Encrypted: i=1; AL+hErHCGxXlYeecM/A2veUAhD2emtqTamgAYIoBzzU8xlDKPkJolhb2zfmnwcTwwUalX5JZKIhK7NgaQnjePA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Rki6QjR0iIGZsFmEoThSq3crV4Jqa8CP/FA8ELoXHRi1kVPP8
	AkyIbpAe4VvpN/QD9wghlToCsqgTX3au/0UkhjCoz4FS2+CyKvY+Tcjuluj3oPWRwNLMxQ1YwUV
	Qak5R50+LPCM3KYgcZuagpwDmfFNOj4Ss9NISOP5+mjmP06rNvABNkns8Q5V2yCnw4gN27yE=
X-Gm-Gg: AYBFou0GpTjKu6HGlNxSoxFvA5B4ayqolGZI/1Y03KvxidaBVo8NjhLdmRba1Et+TAt
	EOfFqv23Am2qvLs4wBTWnkigzr0w3t55bB9B8sPJQ6B2E0ep/nL20XQR/972YcQnFJCj6Dgjqaf
	PiAaM/k0p36iVQGJYeVjBJDwoAF0apMAtYOgiFTNfDzpkr29A91FGxSbY535VxhITpznBLfncW4
	st8q+4mgbTy0tPtE0enVbkcHYHOhhxas0squp6OcJ7kHU5CyAZfWp/3ErLW15sIGftKLkv38F3d
	2EEK6IdFL0Sr1pXhb8tlnVHViQRh4J/S/MXE8gcstp6bRdThy+N4jM6UXu3Zy8cUdsowNGEv1da
	2O+y8U83+yj9PRcMYT/iWZ5q1xxgVVLYbcqCxkNhtmOHHvLt+MjC4ZZVABIQSvDM2cEwh3LypuM
	GzP4AZsqgkdC0jMIelf2Olhwx6+fIffAwMsfqetUpJmTYOLdDr2Ynvk6tkvYDMb8wzAsdT6hKhC
	VYbQoKYTOp1fK+lQoehO1aOpBRZMbybxd1101AnlqXu
X-Received: by 2002:a05:620a:4042:b0:93c:c2f4:9182 with SMTP id af79cd13be357-947aff88c6dmr383701985a.20.1794403177186;
        Wed, 11 Nov 2026 05:19:37 -0800 (PST)
X-Received: by 2002:a05:620a:4042:b0:93c:c2f4:9182 with SMTP id af79cd13be357-947aff88c6dmr383695985a.20.1794403176506;
        Wed, 11 Nov 2026 05:19:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56e064sm229943466b.30.2026.11.11.05.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:19:35 -0800 (PST)
Message-ID: <a72084cb-21b4-43a1-93b0-e3c3ed2859a6@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:19:34 +0100
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
X-Proofpoint-GUID: RRVqNwPZ01xmW9wTKbpqwvtcz721U2_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXzWYA7r0jCy6g
 1eSLpDytl+yEiV+RuQ4XLTIclW+oMJJSBNhBYe5jXokhRNdo6cKTOiL0JcgGSLdBM+qRX6HcDkb
 OOXzkiuy2z3jTZmMv4TJb1M+W2LhRF2t9MxsD/dkYOWsTM2Havj3bLei5wgx7GenX7R9TFzlz4O
 Cj+TUiE1ZBBKBjnd0l8gCg+Y/F7CA4feFvxDj1WoCYS3vvQSyDKwGm+WK2CtCAGYrX5c0OZDIrI
 Hv3DhglThJaSoNAxzA9Wn7CzbWK8kY8TyumkUj27uPKR5M3NmY2XEyQjhMo2xuVY4owHfpbYeR+
 1S3ecHkKQZ5AOXjfdUzvCSeWuhWsSlbWx7cQvGumT1FPZcMrBGsg2HchfMgkuAxOCRhtqTcesge
 7GP95qf4gzSA7YNcBcRJOZbMckpi5xUaAwuIbfsPF60ao3RwAeqjSI/VFKd4ikAkyPspbe41pC8
 ZJAmTUjis5LS3CNpVrw==
X-Proofpoint-ORIG-GUID: RRVqNwPZ01xmW9wTKbpqwvtcz721U2_h
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af46b6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gDy9M4QhnISp6OFiptMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXwgbeAJbAcCN1
 ZNYPGGXH/mLRzBS/MsP2nr+FGzbcj5b99F4cmv7fSDWTflK2v4GCW5TAgxD/mHRO2W7rjjLRABS
 P4zGpPrPJENMW1uNAXFZKvjIDGW9C1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_051939_016385_35EE7885 
X-CRM114-Status: GOOD (  24.25  )
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

https://lore.kernel.org/platform-driver-x86/20261110-wmi-no-acpi-v1-1-eebea07db551@iscas.ac.cn/

I developed this patch independently in parallel.

Regards,

Hans



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
