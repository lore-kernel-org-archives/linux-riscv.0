Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F307EC9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 18:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itpI4NVmkgCDSmty1FHpihYewpbKrltapiL1XOTOcKA=; b=JJ65r1vz8iQIYA
	csnlgqJViZC5F1yMGWJKq9RmfTV6EWJ0LoVOl/LFsZ/cuAYb3Cka2feiX85rb4ydHWOycnjYUsHHG
	G3UtCiYhH+a9gjriktUcGmW5HXp4S7LXg34v3Vzvp4c+Hew3CpLtSgNT0hO3WS4awqenlX609415s
	ayobnYGOldOViBCe5uLa/a+L0TcPcNVF+np2jgEcwBvriiTsQEr4dmy6KXccIo0We+kewW+uBBqm4
	oLxKxAdoQ4lGV+HA72Kjf0JU6YOWcFSBXnVmoyUHl2ElVHGRrDJvsckSUaFcPZFTeqb3iZbbRDplf
	HZuZs5tgnpSEyO8H1YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAna-0000000EAK6-2MEn;
	Fri, 25 Sep 2026 18:37:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAnZ-0000000EAJF-0iZp
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Sep 2026 18:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qU9jfIhz1O12zDKLeEbU8SmuONKTAC52riWnQ1m5YyY=; b=Q+Zdn9gRe7lXIg3qLepxNmZuee
	rSnLfuSVRkj3JNUeILc2+3pKw5o1l5pb4F8g8pCc9ZYb1VqwR10NuToDuk5RMVoDeQtxz+u2AlzVg
	JV4MhKKClF4P3hoL2nL/1u6E2EMaHWwLFrC2egt3TVhGfPB/C6FYdlNepT36JRFDASMOT6kakfUGv
	vAhiE3XTE47H+DKb2v/oVxQnEBX48LJT3ojtJv46SP3pWaYFjMAkYqWh+DqsWB2+y+NClFVEFLHeH
	bG6GwZHATTBnx7wIaynRCTZYGmEKh2L4xfDU32tl7pAm/HNKxKNBrCXeyXbRPxI4oMvCEFFecuGsQ
	0cdorwow==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAAnU-0000000HEP2-2ikl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 18:37:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0N8C1363195
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 18:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qU9jfIhz1O12zDKLeEbU8SmuONKTAC52riWnQ1m5YyY=; b=LDJZtO9NqW208Kqd
	3VP1kfzgKaoXRi4TUkLtkZP//Cc0v+0CjPyv+Wd93Z2/Z3rdo/t/yhX63zxsUEvT
	qt6/16w/9/Kt8YdMzJsJdJNzG6QOzrgoBuTbaeRRpQJMXqGnDVHTlM31/yfCSUdR
	ecbNvirWlqSUL3gNn0pjC+BUnml42AR6fUykbAbpjdAEIV7lNTjlgcW39dhoziCn
	WwWHu4dtMr/H0QWiDSybuZoD+Lni+KjTZXnQj+heQ8BJLhF1YnuUELyYgqIKhnYF
	hfDwDQZ25P0pfoBHdtfZgWvboFW6c+n6PArKrWbfpqRc63PjfO31OC/I3sv5RkhB
	SUCSWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnsuqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 18:37:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342138eeff2so2139056eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790361441; x=1790966241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qU9jfIhz1O12zDKLeEbU8SmuONKTAC52riWnQ1m5YyY=;
        b=BO6Ur6Jiev7BenFenzhgOOcMRseGL9GVFl2lZFmjoa9Pi30QkKtgKuxWErPrJxbwSN
         aSg/h5wOOlAk9NIbogBJ5ovEPu/zYhqXjsQ0IbGDGsyArEYGTwCplJQEsEbJlBX2DWoS
         Z65B9slIZM86kX0d6pdEGwZZbAhyR8uyo1OW+nsBLzxqmDKqeYhQEVV/QogcyW9rdF/B
         QYGLodaP+ggbNB+kNFIg/NbIRuB3UMITopC0NX4YUx5wIflt9MvU/M7KO4Dydj6Gmovk
         fo01tYeIQShpGdE0kAifV0h/QxYvafe5JQWmOG214BRWPfTsoAhqCZdNOWzkyo28WCpd
         vTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361441; x=1790966241;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU9jfIhz1O12zDKLeEbU8SmuONKTAC52riWnQ1m5YyY=;
        b=vJGO3/6tlilEOK9y3+sJ4FrRAYn3txxgDviucqzJnJPjwLe7N8s5RUZn93nqGQgCSx
         ox01lJzIOrxu1VvRUTBjW9UgC4W6fwAJ+jjCbWbDkS1BR5l3cG7S1zgAMGQC3y8Q18h5
         JgZpcbp5EtKqUe6yoSVmogAwQas8COZb/Krv+k9VpgN3jsehkMrzZZByVYjKvzIR2XuI
         urD/egSs2t5fdb2Gk7oSsfrQLvdrbkHFGMvf63EYfyrhoL+1nrfUYquFGPVf2NuESldE
         hAgvieYeyKtC+wdPLnvflRUuBCY1VIXkL7L5wSTkifow6NXLZ+IVIgiGlIv9JpUNash+
         fxww==
X-Forwarded-Encrypted: i=1; AKwUvBxHmbAoMStNadA4OFZ+hGTXoKnVxnwD98lZWLkSbgJpAt6PLtZhhji1/DR6CzqOcAXwDts+FEpV9GiejA==@lists.infradead.org
X-Gm-Message-State: AFuF++n8zT7JFEN2PGB3CwY8pk4AwvKFfm/pIntgQnz/CqcJIApitg6/
	14+suNotzEKa1jp5I2OI4w37PueOcdy4xBBVdBUxwAeC2DUxlGXd62YBgj4/V8o1rk2MoVEeVq/
	c8kdKiLgZ6Qs5/MlIU1p8P7EIvDHOsMwR6f3Vm2Z6XHCC+cS2vL5j6ZZ95RZJ+8XxnQQEqiE=
X-Gm-Gg: AYBFou0Ap9N0K34ZhMYjN0T5AJJuUNh6UomxTiBLTQShcpxOAfj0kwgya4TtHS4zpGS
	Zqknq2OXL5NLJlD7E52oXV/u2+BQxFp1BkFSS9Ly9ASrpcxcOoU21fzK408qgbDqKRAlOjV+dcR
	ZuvyAd+uuxJStES9JAgKswkkqe3mlvyTLl3XRlsnjUd551dqISm1ctcgofECKot9j0p0JfdXicb
	2w8S9P1ugqSzxNjfjo/m3IBNfaBgG0slBd0VT2JJkp9E8/LEkCi/V0+IWfcWQUAfiWg/n1tf8V8
	N2Ixxb/gbBvu08gj09mY9nmhlL3fWw2OH24qJwJl+/+IrsXgzQajSRqO+gZ1AaqVqc9jcPEuXIn
	u2u45haEywII9oeoqz5ArGkhws+VFtLOZLB1Jh6fTnlPMNCMP5+kkFA==
X-Received: by 2002:a05:7301:4d0b:b0:331:89d6:80e7 with SMTP id 5a478bee46e88-342703c0860mr981567eec.13.1790361440800;
        Fri, 25 Sep 2026 11:37:20 -0700 (PDT)
X-Received: by 2002:a05:7301:4d0b:b0:331:89d6:80e7 with SMTP id 5a478bee46e88-342703c0860mr981521eec.13.1790361439446;
        Fri, 25 Sep 2026 11:37:19 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm7322093eec.8.2026.09.25.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:37:18 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:37:09 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH 16/16] efi/arm64: Implement ARM64 DRTM in the stub
Message-ID: <20260925113709.00005cd1@oss.qualcomm.com>
In-Reply-To: <16-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<16-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: UplQAeCsC6pizzqLCMJHDqx4RtC3Txaj
X-Proofpoint-GUID: UplQAeCsC6pizzqLCMJHDqx4RtC3Txaj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX6+n+bUB1G9hv
 muRB/yLB7PHn7aPHWlOnzGMAtST32yPVl/2qrMm6077NQERdhVrvv0AdoUB9t7TNc49hcq/brb7
 KHL9jyihOdhe/iVM164IB/JPMaG1RUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA3NCBTYWx0ZWRfX5aTlF8ukFAN6
 ZZSr/btvyGhUmQ0f0dw+1iM7P6eUi96KnFwEvXK775S+W8N4VedyDkO0TLBdKZ9Np6BqCqCVLl4
 C8j5imMMo8jVkZov6Gvd/kZLrHwfd2Q7q+7w9h8LyJL040d+zYc5Qk0iPYt2QpdsVlS29g20iOb
 pNYR1G3yk2gbbD5JUwWO4nM8nWoZbXDmamGfW5NzssDdhZfGOmsQ3wQNkrGoTLpmunzSUOGxiHM
 39naLwhGKszxoLVrl6sPMtxjEJ5IoVphTq1cXuo+Z4faHVNb8kphss0+xjpsNKRPK1sryGbKSlT
 sxr1jgIcpTrB5eCe9wR8w8FpNxeOIYeFYt/NCrX8f7veFc2KFlEmOg/a5ee82oQU2dofXrhbXdf
 QoYbldZPjPTI5wBMCWkgftSO8Oce432vXay5ZFQyhAevKHDGgtOfsR0ta6Ir2Wm35H3CveERJ0m
 J9OKEIaw+g5rfpOkdkQ==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6bf62 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ikd4Dj_1AAAA:8 a=jWgNheo0oZ5oaBA2q4oA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_193724_996540_0E72DB4C 
X-CRM114-Status: GOOD (  38.28  )
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

On Thu, 24 Sep 2026 10:53:19 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Provide an implementation of the CONFIG_EFI_STUB_DRTM protocol for ARM64
> DEN0113 >= v1.1.
> 
> First, it queries the FW for support and collects all the
> information. This is needed to compute the extra_size, which comes
> from FW reporting how much memory it needs during the launch for the
> DLME Data and DCE-owned data. The generic stub ensures there is
> trailing memory after Image for this.
> 
> Then the DRTM_PARAMETERS launch structure is computed using the
> offsets in the efi_info.
> 
> Finally, the stub does ExitBootServices and calls the actual launch.
ARM_DRTM_FEATURE_DMA_PROTECTION> 
> The feature discovery process is deliberately fairly verbose to help
> debug any FW weirdness in the field. Enable it with efi=debug
> 
> It looks something like:
> 
>  EFI stub: DRTM: interface version 1.4
>  EFI stub: DEBUG: DRTM: TPM algorithm 0xc, TPM hashing unavailable, PCR schemas 0x1
>  EFI stub: DEBUG: DRTM: minimum DLME data 73728 bytes, Normal-world DCE 0 bytes
>  EFI stub: Decompressing Linux Kernel...
>  EFI stub: Generating empty DTB
>  EFI stub: Exiting boot services...
>  EFI stub: DEBUG: DRTM: will launch, selected launch features 0x0
>  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> 
> Eventually the launch'd kernel is going to require built in crypto
> libraries that match what the FW is using so it can validate some of the
> information left behind during early boot. Refuse to launch if these are
> not built in and build in the most common ones from the ARM64_DRTM
> kconfig.
> 
> One nit, if the platform does not support SMC then using drtm=auto may
> crash on the SMC op. As far as I can tell there is no way to discover SMC
> support through EFI. Learning it from the ACPI FADT is doable and costs
> about 250 lines of code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
First read though only found some superficial stuff.

Generally looks fine to me.

Jonathan

> diff --git a/drivers/firmware/efi/libstub/arm64-drtm.c b/drivers/firmware/efi/libstub/arm64-drtm.c
> new file mode 100644
> index 00000000000000..12ddf7c2dd056a
> --- /dev/null
> +++ b/drivers/firmware/efi/libstub/arm64-drtm.c



> +
> +static bool efi_drtm_probe_memory(void)
> +{
> +	u64 value;
> +
> +	if (!efi_drtm_query_feature(ARM_DRTM_FEATURE_MIN_MEMORY, &value))
> +		return false;
> +
> +	drtm_cfg.dlme_data_size =
> +		FIELD_GET(ARM_DRTM_DLME_DATA_PAGES_MASK, value) *

> +		ARM_DRTM_PAGE_SIZE;
> +	drtm_cfg.nw_dce_size = FIELD_GET(ARM_DRTM_NW_DCE_PAGES_MASK, value) *
> +			       ARM_DRTM_PAGE_SIZE;
> +
> +	efi_debug(
> +		"DRTM: minimum DLME data %lu bytes, Normal-world DCE %lu bytes\n",

That code formatter loves the silly.  This is definitely not more readable
than a slightly longer line!
I'm reading upwards and got bored now - will assume you'll take a look and tidy
up other such silliness.


> +		drtm_cfg.dlme_data_size, drtm_cfg.nw_dce_size);
> +	return true;
> +}

> +
> +static void efi_drtm_report_previous_error(void)
> +{
> +	s64 error_code;
> +	s64 status;
> +
> +	status = arm_drtm_features(ARM_DRTM_SMC_GET_ERROR, NULL);
> +	if (status != ARM_DRTM_SUCCESS) {
> +		efi_debug("DRTM: GET_ERROR is unavailable (x0=%lld)\n", status);
> +		return;
> +	}
> +
> +	status = arm_drtm_get_error(&error_code);
> +	if (status != ARM_DRTM_SUCCESS) {
> +		efi_warn("DRTM: failed to read previous error (x0=%lld)\n",
> +			 status);
> +		return;
> +	}
> +
> +	if (error_code) {
> +		efi_warn(
> +			"DRTM: firmware reports previous launch error 0x%llx\n",

That code formatter is being silly again.

> +			error_code);
> +		if (efi_drtm_policy != EFI_DRTM_ENFORCE)
> +			efi_drtm_policy = EFI_DRTM_OFF;
> +	}
> +}

> +
> +efi_status_t efi_drtm_prepare(void)
> +{
> +	s64 feature_status;
> +	u16 major, minor;
> +	s32 status;
> +
> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return EFI_SUCCESS;
> +
> +	if (!efi_arm64_psci_smccc_compatible())
> +		return efi_drtm_failure();
> +
> +	/* VERSION must be the first DRTM call. */

Words like 'must' should be backed by a specific spec reference.
I couldn't immediately fine one other than common sense suggesting it should
be called to check we have a version we understand ho to talk to.

> +	status = arm_drtm_version(&major, &minor);
> +	if (status != ARM_DRTM_SUCCESS) {
> +		efi_err("DRTM: failed to read interface version (x0=%d)\n",
> +			status);
> +		return efi_drtm_failure();
> +	}
> +	if (major != ARM_DRTM_VERSION_MAJOR ||
> +	    minor < ARM_DRTM_VERSION_MIN_MINOR) {
> +		efi_err("DRTM: unsupported interface version %u.%u\n", major,
> +			minor);
> +		return efi_drtm_failure();
> +	}
> +	efi_info("DRTM: interface version %u.%u\n", major, minor);
> +
> +	efi_drtm_report_previous_error();
> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return EFI_SUCCESS;
> +
> +	feature_status = arm_drtm_features(ARM_DRTM_SMC_DYNAMIC_LAUNCH, NULL);
> +	if (feature_status != ARM_DRTM_SUCCESS) {
> +		efi_err("DRTM: dynamic launch is unavailable (x0=%lld)\n",
> +			feature_status);
> +		return efi_drtm_failure();
> +	}
> +
> +	if (!efi_drtm_probe_tpm() || !efi_drtm_probe_memory() ||
> +	    !efi_drtm_probe_dma() || !efi_drtm_probe_boot_pe())
> +		return efi_drtm_failure();
> +
> +	drtm_cfg.launch_features =
> +		ARM_DRTM_LAUNCH_HASH_FIRMWARE | ARM_DRTM_LAUNCH_PCR_DEFAULT |
> +		ARM_DRTM_LAUNCH_DMA_COMPLETE | ARM_DRTM_LAUNCH_NO_AUTH |
> +		ARM_DRTM_LAUNCH_KEEP_SECURE_IRQS;
> +
> +	return EFI_SUCCESS;
> +}
> +
> +unsigned long efi_drtm_get_extra_size(void)
> +{
> +	/*
> +	 * DEN0113 Table 6, feature 0x2 reports both minimum sizes in 4 KiB
> +	 * pages.  The linker places the DLME data at the 4 KiB-aligned end of
> +	 * the static Image as required by R314030.  The DLME region must
> +	 * include all of that data (R45200), and an optional Normal-world DCE
> +	 * follows it at another 4 KiB-aligned address as required by R312080.
> +	 * A final page holds the 4 KiB-aligned DRTM_PARAMETERS required by
> +	 * R312010.  Only the first area is part of the DLME region.
> +	 */
> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return 0;
> +	return drtm_cfg.dlme_data_size + drtm_cfg.nw_dce_size +
> +	       ARM_DRTM_PAGE_SIZE;
> +}
> +
> +efi_status_t efi_drtm_prepare_launch(unsigned long image_base,
> +				     unsigned long fdt_addr)
> +{
> +	const struct arm64_image_header *header = (const void *)image_base;
> +	const struct efi_image_info *info = efi_get_image_info(image_base);
> +	struct arm64_drtm_handoff *handoff =
> +		efi_get_image_symbol(image_base, arm64_drtm_handoff);
> +	struct arm_drtm_parameters *params;
> +	unsigned long measured_offset;
> +	unsigned long measured_size;
> +	unsigned long image_size;
> +	unsigned long dlme_start;
> +	unsigned long dlme_end;
> +	unsigned long dce_end;
> +	unsigned long entry;
> +
> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return EFI_SUCCESS;
> +
> +	image_size = le64_to_cpu(header->image_size);
> +	measured_offset = le64_to_cpu(info->drtm_measured_start);
> +	measured_size = le64_to_cpu(info->dlme_measured_size);
> +	entry = le64_to_cpu(info->drtm_entry);
> +	dlme_start = image_base + image_size;
> +	dlme_end = dlme_start + drtm_cfg.dlme_data_size;
> +	dce_end = dlme_end + drtm_cfg.nw_dce_size;
> +
> +	/* Quick checks something didn't go wrong during image construction */
> +	if (entry < measured_offset ||
> +	    entry - measured_offset >= measured_size ||
> +	    !IS_ALIGNED(image_base, ARM_DRTM_PAGE_SIZE) ||
> +	    !IS_ALIGNED(image_size, ARM_DRTM_PAGE_SIZE) ||
> +	    !IS_ALIGNED(measured_offset, ARM_DRTM_PAGE_SIZE) ||
> +	    !IS_ALIGNED(dlme_start, ARM_DRTM_PAGE_SIZE) ||
> +	    !IS_ALIGNED(dlme_end, ARM_DRTM_PAGE_SIZE) ||
> +	    !IS_ALIGNED(dce_end, ARM_DRTM_PAGE_SIZE)) {
> +		efi_err("DRTM: final Image layout is invalid\n");
> +		return efi_drtm_failure();
> +	}
> +
> +	/*
> +	 * See arch/arm64/kernel/vmlinux.lds.S for the DRTM Memory layout. After
> +	 * the DLME we choose to place the Normal World DCE region followed by
> +	 * the aligned DRTM_PARAMETERS structure.
> +	 */
> +	memset((void *)dlme_start, 0, efi_drtm_get_extra_size());

Is that efi_drtm_get_extra_size() adding much?  It is a little irritating to
have to go look in there to figure out that this memset actually covers
the params. If you were to just have the sum visible here that would be
more obvious and align with the comment immediately above the memset.

Maybe it is worth keeping for the big comment in there, but it does
feel like that and what we have here could be combined.

> +	params = (void *)dce_end;
> +	params->revision = cpu_to_le16(ARM_DRTM_PARAMETERS_REVISION);
> +	params->launch_features = cpu_to_le32(drtm_cfg.launch_features);
> +	params->dlme_region_address = cpu_to_le64(image_base);
> +	params->dlme_region_size = cpu_to_le64(dlme_end - image_base);
> +	params->dlme_image_start = cpu_to_le64(measured_offset);
> +	params->dlme_entry_point_offset = cpu_to_le64(entry - measured_offset);
> +	params->dlme_image_size = cpu_to_le64(measured_size);
> +	params->dlme_data_offset = cpu_to_le64(image_size);
> +	if (drtm_cfg.nw_dce_size) {
> +		params->nw_dce_region_address = cpu_to_le64(dlme_end);
> +		params->nw_dce_region_size = cpu_to_le64(drtm_cfg.nw_dce_size);
> +	}
> +
> +	/*
> +	 * The DLME Data contains its own size in a trusted header, so the
> +	 * handoff doesn't need to include extra_size. The DCE Data is only
> +	 * temporary so the kernel also does not need to know about it.
> +	*/
> +	handoff->fdt_addr = cpu_to_le64(fdt_addr);
> +	handoff->drtm_enabled = 1;
> +
> +	efi_debug("DRTM: will launch, selected launch features 0x%x\n",
> +		  drtm_cfg.launch_features);
> +
> +	drtm_cfg.params_addr = params;
> +	return EFI_SUCCESS;
> +}
> +
> +static void efi_drtm_fallback(void)
> +{
> +	struct arm_drtm_parameters *params = drtm_cfg.params_addr;
> +	unsigned long image_base = le64_to_cpu(params->dlme_region_address);
> +	struct arm64_drtm_handoff *handoff =
> +		efi_get_image_symbol(image_base, arm64_drtm_handoff);
> +
> +	handoff->drtm_enabled = 0;
> +}
> +
> +void efi_drtm_launch(void)
> +{
> +

I love trivial. Pointless blank line.

> +	if (efi_drtm_policy == EFI_DRTM_OFF)
> +		return;
> +
> +	/*
> +	 * No cache maintenance is required before the launch. DEN0113 R42130
> +	 * requires the DRTM_PARAMETERS to be accessible as Normal Write-Back
> +	 * Cacheable, Inner Shareable memory, so the DCE reads them coherently
> +	 * with the writes made above.  R45220 then has the DCE clean and
> +	 * invalidate the whole DLME region to the Point of Coherency before it
> +	 * measures the DLME image, which covers both the Image itself and the
> +	 * handoff struct placed in the DLME region. Thus once we jump into the
> +	 * kernel with MMU and caches off the CPU will see everything the stub
> +	 * wrote.
> +	 */
> +	arm_drtm_dynamic_launch(drtm_cfg.params_addr);
> +
> +	/*
> +	 * DEN0113 section 3.4 returns from DYNAMIC_LAUNCH only on error. Boot

I'd use a spec version for references + ideally title of section.
As much as folk may try, sometimes these things move around.

Also tweak the wording.  Failure sure the section doesn't return from anything :)

> +	 * services and their diagnostics are no longer available, so hang.
> +	 */
> +	if (efi_drtm_policy == EFI_DRTM_ENFORCE) {
> +		for (;;)
> +			asm volatile("wfe");
> +	}
> +
> +	efi_drtm_fallback();
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
