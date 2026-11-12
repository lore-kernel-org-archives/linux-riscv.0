Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4D606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wv5JTmHD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mpz5ENUg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/EHAGQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iPHngFzN/x1Nh4LSIw87Wo+9hsn5IAoXvQtCiGjnKBg=; b=wv5JTmHD1U8xPj6Sp58kz0j4MT
	Av+y3nThhzAnxgJ+Mubh/SRn5hWA25glBfiT1jmhKtui5oGBCR2f8SJgL+6V7dtQ1NVy0dMAz8vNs
	uXJZ5EnC6HRVEqhFu9XsFwNN7bXDnPTUsI1yAdTar9p4E7zlf/Q3csLLouLAbzezcP5BO3SfkvqxY
	4vse+uhBS6j0apWUaE1uyPojWscx9l59m2RMaOHq51KhKlpuFQy4R8p7nOXvcFR16GxtpWrrronzb
	icwggsFubNx7EhSmUmZNPPxXPYnuKWWJ3ly98dsyi4U2UxhCc1/xuYI6V8/sgbUkXOxPRxOtzK6bC
	B/Ebd1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUKa-00000009wIC-0lZi;
	Thu, 12 Nov 2026 12:55:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUKX-00000009wHb-3GaG
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 12:55:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9AKom4092474
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=; b=Mpz5ENUgcqRabHUP
	PD3J3yeBOVQuO3lto59EUpQ+arQ2gq2AwvPOsTfYA95ODC3Rd2VWtXnNMSumVmxn
	IX7m2D4pTpCsNVLNR6W+VCpIfjV5z02Ym5UXkWfYDRbj0W3lmSde+LMcM/Y03e3J
	pT3c5m/VovkQTPynUrjPx12qtGwROyoAbSXISgQC62QVKXPDyK95qTCf2JLdji07
	G6XQGZWPa+cs0PVEDzxhTuHVELhXyASTkjc036K/YUv4UBbKkRAsWHD02P9D1rCY
	7OgLvVZe12vQOHcS6cQaLqmZ/VomqPit472dY/vnqmfJ4jE9DbqRmpCw+0V28/XS
	XdG5Eg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jvw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 12:55:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so2566785a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794488104; x=1795092904; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=K/EHAGQhAsjxRbOtF32Ze3G1Mof8zw/DpsgARw4tH9GeXo1bsHc2SoFeXXwYZQGQmx
         5Jy4FAiQSWOpD24ZsE7uDXRF7d/rSLe5wVgoy9ZSxD3LsSOouxCKfect+IPX/kS/6ubz
         vccZSC1rFYqD0DPrjxjHBE3+/O8mvX9YoyLltTEOHweDB3TEF6Ch6J8NlR352XL1sBrg
         Op4sZ7/NHATKSHPzxwvArsjz4ELHmjltNkIMwVaYvzqzqcQigl9d9xN6Ht9VJFdbELNl
         Rv1ceItFCFYL2Ug0CpWDCJ4wQfea31QZ24RvGmDfkxepqvMP4ErVZCPsWxD8tEasB7vz
         5gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488104; x=1795092904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=MagnQZ0PlMfrMaM9JXsqHf5Nx/oUE9U6640gm3TWtegVhsmQB5ht8JRqhlnijt10rV
         YDO8B1WVBZeKOOfbQvYP+q8238k9l5RXGsidjXQheFmmjdT2zdy5d15WOBzInyowEoxO
         Rib5y0nk1clwfI+BsxlUzns1dV4Lr1SXfzEkXIgeBYsDIOT5lSM3GQlawEGSyp44/FFH
         SQsOj+mp9dG1lNtYJ35lDJ43gAQfCO5M1PB7iclslE3NmQAl7b2NxWTWalMYBHzWd+IM
         4U7TtblsYHyJjhAhzhcZvEsiEb+IivaVgiIr20ytl/a5cOj1AB+v/YEXcYkid4TQVsnF
         A4WQ==
X-Forwarded-Encrypted: i=1; AL+hErHBrZUBIpKUgwB6O4F2NcS01Yu+duARzHRR295Ja1IYIhB7hrj/GHkvwI6fD+9Zu9DLqxid7vFzYYJ7lw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8YV3+jEBE7bSYSWZYyz9Arl00FLPLeJFnLDtCDjZeVRqrfwzFp
	pqYQA6E4Kqha+2TUO4bSbMdfccwcw9QRTFCSxoOwdKs+1Ci7fpB5CUCPPMPgpQIhG4rXc3UMVPe
	5u3H4j+Ndu3k53fw124zBAtmfBGxc6D1TGG9ISEH+Mxhcld3Rae3qJFzDJ5OvWyYG72vrXxw=
X-Gm-Gg: AYBFou3Dnxs27ySMHCjo4cZ7Vizd5UCFPanUuvFdav8N+Qu6g77GNv0xX1X12C5LUL7
	C1qFiix8L4QvDW8LdshycALlSwDA2HudCh1DZy9my9XMyfzIm7g9mAiO63RqCzK4P+KKihPbgXE
	md8B2YIf7VGCgkgOmVzF2EG5ezLmtRazpnw3kbh4optKyFcZaFI3863LlmJ7mrnqxVOenobsNy5
	IfXy8ZCrHnNhj908TxS8NFm4yFaHqcJzg2MRFaht/TRv5gYBi8QYmoVcDYJ8i/H/0AWQaUC/1HN
	T9xzq0smeRaU+Vc8fcL63xiNjKf1A59BhI6pqgFox0qgJsq7MElok1AWobjfUHae89l2pTWZF/N
	wj36UGVcvxRaFF3sc2dS6Sf0rTAahIE2LIIxoXXOtuvGfb7gyxYxqsBJBQPu4yOF7H7u2H/Ypd1
	V9ojfxdjwJf/ZKbpv+ZnwUb6Kn+pcKERQ0YvcbwAf8010x
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970700637.61.1794488104061;
        Thu, 12 Nov 2026 04:55:04 -0800 (PST)
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970682637.61.1794488103530;
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa9631absm3493088b3a.28.2026.11.12.04.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Message-ID: <755d7440-28f1-4c9d-bcef-33beb25c71bf@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 20:54:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
To: Natanael Copa <ncopa@alpinelinux.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Milan_P_=2E_Stani=C4=87?= <mps@arvanta.net>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,
        Shuwei Wu <shuwei.wu@mailbox.org>,
        Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
        linux-riscv@lists.infradead.org, stable@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX1nAh86FY4wFW
 5d/kVRQxhy8SFVA27n3JQCzuoR3C8PlNFviH4WVLqb4D/JjmMDJw/hUwgczzzxHgMXJKH0l470Q
 m6B+lG8O8kc27BHq3FYiplOwD75vjK8=
X-Proofpoint-GUID: C007CpwQ6VrS_ccKjume0suaQRVlN0mi
X-Proofpoint-ORIG-GUID: C007CpwQ6VrS_ccKjume0suaQRVlN0mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfX4DAbzDp89Tew
 u2Sa8reNwePFUtWpX2AA66sP909rzXYlAGUilzVaYikdtX5pg79BbR2EULW60JDn2VURlnnwsI9
 /qP+HKeeMNjPMuOpKuXfr55i88OHaHJXRHJNk78lW/CLkgF3uft9SP6odVBROuKyBaD1oFUabz0
 J0rWnmUjOqpHZuvX2ATO8sivG09mxnIlQoGtu8sAR/NXOGVrV3wl5T9HXkQe4b/3HHev3aNhEdC
 ddtvHPvkzgBOAgpBNjzGD7X8lo6Uw97X1nz8jAVOqPf78NlXGkKLaJqrFqpGw5yRKySo3Bp8wrf
 UDp85BU1QGbBcysob4Ve/CR6IjC8uWK1gUb9JcSfTc3HwiTKNVhLeVfdxsQmtGUd5Ee3DvbsaDR
 /EAEi396UCz9XybtzoBc99SOCmFriY8KC/kqbAeRZIm4chrsdfwVnsuiAGOHvETBdm7mFxkGmcG
 tA2Mrv1hqXnDR840G9Q==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5b728 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=kmYkUENqAAAA:8 a=VwQbUJbxAAAA:8 a=OUwkjY6KL-vEgWlMa8UA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=p9kz6gysRiz6SGr9lVkz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_045505_831914_1EB68B0A 
X-CRM114-Status: GOOD (  32.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Natanael,
Thanks for the patch.

On 11/11/2026 9:04 PM, Natanael Copa wrote:
> The cpufreq core skips requests for the current frequency, so a policy
> has no voltage constraint on its supply until its first frequency
> change. Another policy sharing the supply can then lower the voltage
> too far.
> 
> On the SpacemiT K1, both clusters share one supply and boot at 1.6 GHz.
> When policy0 scales down, the supply drops to 0.95 V while policy4
> still runs at 1.6 GHz, causing random crashes during boot.
> 
> Set the OPP for the current clock rate of all CPUs before registering
> the driver.
> 
> Fixes: 3b9c34556fc1 ("riscv: dts: spacemit: Add cpu scaling for K1 SoC")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ---
> Reproducer, booted with cpufreq.default_governor=performance:
> 
>    # echo 614400 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
> 
> buck1 drops to 950000 uV while policy4 is still at 1600000 kHz, which
> crashed my board within seconds.
> 
> Tested on a Banana Pi BPI-F3 with v7.3.3 and v7.4-rc2. Without the
> patch, v7.3.3 crashed on every boot with schedutil (three). With the
> patch, the reproducer keeps buck1 at 1050000 uV, and five boots with
> schedutil were clean on each kernel. Not tested on other SoCs.
> 
> Other OPP users that never set their current OPP have the same gap. If
> you would rather fix this in the OPP core, I can rework it.

Which other users do you have in mind? Apart from K1 I couldn't find
another in-tree cpufreq-dt platform where several policies share one
cpu-supply. MediaTek CPU/CCI has the similar issue, and
mtk_cpufreq_set_target() handles it by not going below the boot
voltage until the CCI driver is ready, so I'd keep this in cpufreq-dt.
But I'll defer to Viresh on this.

> 
> Found and fixed with the help of an AI assistant (Claude). I reviewed
> and tested the result.
> 
>   drivers/cpufreq/cpufreq-dt.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>   	.suspend = cpufreq_generic_suspend,
>   };
>   
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */
> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);
> +	if (ret)
> +		dev_warn(cpu_dev, "failed to set initial OPP: %d\n", ret);
> +}
> +
>   static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   {
>   	struct private_data *priv;
> @@ -251,6 +275,8 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   		goto out;
>   	}
>   
> +	dt_cpufreq_set_initial_opp(cpu_dev);

Does this need to apply to all cpufreq-dt platforms? Could we detect
this dynamically by checking whether the policies share the same cpu
supply, and only do it then?


> +
>   	list_add(&priv->node, &priv_list);
>   	return 0;
>   
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620


Besides, Sashiko reported some issues, would you please have a look?

https://sashiko.dev/#/patchset/20261111130430.10359-1-ncopa%40alpinelinux.org


-- 
Thx and BRs,
Zhongqiu Han

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
