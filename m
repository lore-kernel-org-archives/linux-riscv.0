Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205D606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpIVECfV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMjLozre;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HwLCgOwv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NfEDelgUge0iI32MGzZgAEen8zf+PoEl3oEeMy9rxBU=; b=GpIVECfVRGG9iNxuIBl07gVLjl
	sK6Gr8VrRWa6m3N4lcpm+t6IFTa2m7C9hOvclcNO+5Fe5xWFy9wXN4BwNCsWPViPYwdLo4bGXXG0H
	zgsWsCFJozdMtv9tSDfprVRds7dYmXKDycFv6enPivfUnhVrKBHB3dDqqSQ6F0ZsYoifSHlEZxdKV
	MHCzO64nAvd+pz8rHyovzCK8GMRDczGzRGkIUdi2/biKmOOjOezZq4VEL+pPpS3lL6wWvqChO4thl
	LxkX0gvgucHNE4AfdcLlzSqA1M9C7TIb+j2v1Jy2iiFjT/eNt8R4jnDxGDERi/PlaD2puVpH1sHVV
	1+C5wjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9yA-00000009QHV-0Hc9;
	Wed, 25 Nov 2026 10:11:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9y3-00000009QGY-0u3r
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 10:11:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTIm4034142
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=; b=XMjLozreDz8YnShd
	T2K7aVz/9tDfu+Hv4BLU1M6xdfCWHACfDZgpOydPe0kHfW3eayn9Wx/rVDKUiLv2
	B6cHEXQdIsZZ5y6ef/H2sJZ7ms5HNd3b87IqvslZYkxuw/Ybj+LxOu9iIVsocRft
	NdKnZ13Qzu8XeKw4kfoDyRlvfi4fbs9fS8U0RYLHXYp06UJlnP1R3Yuiq6ZPXdO8
	9uyb7Jbo36oxNWynGdfTi9GnHHKnHiL/01TvMW41N30jndCapiaxrtc0wZLKl3zQ
	aTKWKcb6lZzXRzOp+KoAb/5aVBhdBClQruV0Uea2wa2xIqI3w5qdBoxun7QKkTlB
	GVY85g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj7kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:11:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso4424505a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601469; x=1796206269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=HwLCgOwvl0sidCOuOmq0iGbNUIAuIlORMPZUT+LOvfjw4ZOSnVHWp/VqMAFevIisJF
         5+d+1NUdD8Tqbz7rGeflLvW0M7y4jv5MBrR4BxbEOd8XG86Vn6IYfZsq/jVbZOoZFY31
         uC5Zjb0i7TnlNJ8m3h3+nRhNkrDUn9BUXSDQ53B7BGRR9Eyp9kemX3lHRzKn0qK7xRZL
         F3I/+kSHZwIlfyOMCLlDhYoy0Kj5mmTd4Zxvxfs8LU9W9YTTlgNvySsZYcMC2+pxBju+
         BL/q5CIXTC8ZV1D20AVdfTYK136PuWkC4TBdMe2Ko3Hh1cfZJw7vlenK/Q77duSpZYPN
         M96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601469; x=1796206269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=LKKnlxXKJRQ21iYQ0VaFFnC2MJkUQOV2djVxJ68qQ1WMQjZuVfwY+gkiy7zH8VevYM
         CoQ94Fj37YgKGpcqR6Db64AkOR1q/SLzEpU4IYNiqW1HFt4CYBEUsuBICweuxASNj1AM
         hNqy28fErjfaOqyvdqoBT7iLKrZA6LLEC82s+YqKdrekUpDhTqBunDYFMcyZJYqOhzXT
         py8iNl3XYgFmke6UNCs3pP917H0we56bZKcz2xDm/8HrIephzy56YREZgYxhLsSB3isq
         y9mdCfkX9F/AzyBe3boBEt0VA9t4v3J2mMAkAr9IRvbOwLCEBS0LvvllGBM/Wb5VIpBp
         hp8Q==
X-Forwarded-Encrypted: i=1; AL+hErGibFIP2Xyi84ebAt9kCNquZklQb/RwjSu52baVb+K15YEV3mzp9zO47OiQzRDwlI/EInZCDXK+IyaAQA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/xMi4lukcQdaBTuTSCjFf8Ek58gmbx4LQHeuvsywEhZJUMXaD0
	hF+n4WEis8ZHMYPaeYRMMy1YDK6AQ3RuOfFmyyIXUrBPFrb2I5gz68YAjpC2IWXt/QkkdBQKgHK
	0hAac5EYjKqLf8KLGSueGyNo+sBe0biRkw8BqhrJ+dFrmdrcG3eZ57WrAGTc2Vi+cjuzAl+8=
X-Gm-Gg: AZFdTZfXCieH6lXfMACBD9ucOW+3/WQ20/PLuF2Rxd8j40wgNvCLaxyAy5w/riabFj1
	W+Ns0KJl/p7gcCwBE2D4zsps9rLM2leA/mqa6EESwWWpy/VUHmehM6YKZnKjtk4+PZDRtmOGN+Y
	4t/+rtBFmRZhAZI0iJYDD88zrSL8jJHKJ0yrrUKDZi5cSwr9EBO1FxFsGVMv/BUSI5pr01b2T1e
	U9Xyazg2+jISlkmGjFC9xwhh5Uz3WwWtAaJhuTwOrB/FB+cB4mZ34FLYRCeY6oP8ytTCCfLiSEs
	PybzJM9LTB+6ZeMOjurdRhFw1+HYa5ABo/hFqCHu9RiSXP6+aG3ykAyKvj4oyBiUHJXbcPoWAAw
	wSTKlgmctLpYPdDY93CX7zf7rcUQBMQhFQQzE5+lBzz2ywKSco2+w4yWR/jXa95kQyYDzcN4uvP
	zvnEZ7h+156St5Dob/vh2BUo7JkiqCxwgArUjvgg==
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179606a91.29.1795601469383;
        Wed, 25 Nov 2026 02:11:09 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179571a91.29.1795601468716;
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm5931651a91.17.2026.11.25.02.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Message-ID: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:11:03 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX0qQrHZ/qD6I0
 op/o15kcDB+AUAhQohDiU7/MkIlCl30OK10hBIHZZSls3B27JIMuPNNqwdPkH3u3EcYHsWLNxod
 XPvnUDXuJPkFV5FIgLqcX5E9lXwTqKs=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b43e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=C-wyTywGbBTeqauinx8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX3JsCl+COt7GW
 xhiDZwwUAlWsba6xoIwsaMQOe/8/Xr9m4B2PbGPnz7PiMWJYp3TclFkMdTmJemD3CDYhlBJ+iso
 h/3EmK3JHYvTa2c2n0bkBC4kmCYeoR8J3iL+CeVDJPdQRmsh+b1p0VUNTyeMvDcAOSCM2atF0uF
 2vMxIC3OWUYYdQV8l2hgmmOnfLOKv1ql0F1Ic3WierKNYvWGTCf+7sKBLL4eH6V8fJgIOkgmkm6
 uLQAijiM94THQO+Qqs6jAhR/aYNzKFQU1cLFUSzHFyvuiAH4FJKmblINQcsEgFP1ANiCyclXW8y
 UU7XA91WqmQ3wdOPbRR/E6+SrCsOcxvgNRM4PVP2o+lAh5KSfq8x8B4z5hQNkP2Fe5b2V8PhBrE
 k+zRd/wg9sd8sRgF6TsR488XEAizNnTOAcsONr4BSUEC7mWQOPOGvrqpI7rbVh2Ip8RJo0LUrhn
 eXfPXM15addp6txsLTQ==
X-Proofpoint-ORIG-GUID: oOtfLv4V6d6NyT0ulVT6o-k9jsaZcnig
X-Proofpoint-GUID: oOtfLv4V6d6NyT0ulVT6o-k9jsaZcnig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_021111_283545_0D0F958A 
X-CRM114-Status: GOOD (  18.78  )
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



On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
> On 11/16/26 12:03 PM, Jie Gan wrote:
>> The cti_riscv device is suspected to have a clock vote issue on the
>> KVM enabled path, which causes the device to crash during bootup. Mark
>> the node with status = "fail" for now to avoid the crash.
>>
>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> That would mean Gunyah is enabling some clock that the TZ itself isn't,
> which would be solveable through a clock driver patch. Do we have more
> details here?
>

We are currently debugging this issue. What we have found so far is that 
the RISC-V core is not powered on when the AMBA bus attempts to read the 
PID from the device registers, which causes the system to crash.

Normally, the RISC-V core is powered on by remoteproc much later in the 
boot sequence. However, we have not observed this issue with either the 
UEFI or ABL boot stack.

One possibility is that the RISC-V core is powered on during UEFI or ABL 
and remains powered on when control is handed over to the kernel.

Thanks,
Jie

> Konrad
> 
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 0a95ad5a5582..5f5a786fbd2c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -3996,6 +3996,7 @@ cti@982b000 {
>>   			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>>   			clock-names = "apb_pclk";
>>   			label = "cti_riscv";
>> +			status = "fail";
>>   		};
>>   
>>   		tpdm@9860000 {
>>
>> ---
>> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
>> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
>>
>> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
