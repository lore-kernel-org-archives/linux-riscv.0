Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3B606A339
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4EY8gLYy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfbd/6p+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XbrOvh4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YYF9XVpMhTtkzVmf06gfyx8labEkBHF1kQUn0Bki9Ps=; b=4EY8gLYyMRopt07Ix0JIt8ka++
	cPcoydxBWURoEj4cRSQYpkWg1B5NcnuJJuj5WB5usOntEBScVcJ8iRf2e2Qb2mghyknYtrK15clci
	YJtrM3Ro1MSmQOO/sViiRqeMEoNDQ4vnnn67h2e36DqnusGe+n8qohJnLExWtAeTt/OC7i+1mTFGz
	aFv88KKeKoOGBr2W133yYItu7cjzbnnASxSus9P01PaGrMcN5F8p/+2ESzYgCU33Jn13gM2Il1tK0
	QtPYBMOBmosbWBfFBbdzsWhJoMc6rNiPnEna32K0gpK9Ngxsev51KIdyjgucCkUcYV5K6Sqv3i4ox
	9rfGUt8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAH8-00000009SH7-1GWu;
	Wed, 25 Nov 2026 10:30:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAH5-00000009SFm-2Kqf
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 10:30:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mLre555411
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=; b=hfbd/6p+NLV5Xds1
	S80CYesJCHgqcIGqbf7yj2y4Ri0FQ+QUOhYlkOC+1NBMvz//PG6BhZfQor+AcE7J
	uRi9VsKRNw+ust46DIQXj3UTlM3oTxKYSwpq+NuaXyI+7HNIbWGE69VO26PPT9y1
	4H+h5diw9LZeeA2aEbFm9aV6gq6e4cWKgI1WDvjAzOEhZbGhpIeEPNjC4Bb0EO6q
	BWZvVLz0gyiiWaslPlCv/xee+MZJtYAUgxi4SfeF2BgYb0GXuFPOkL9YiyNc7DIK
	FzlhYuYTt4VdgR0m3lsthPeIZ2UYB9CPgfGEaghfif58GPRhTfa8B8v/B4bGSvM/
	POAXbw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrbbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 10:30:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55cbd8c22b1so8446681cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602649; x=1796207449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=XbrOvh4scyvylnxw7qcjZRK3tt0lK6iLSyhpDtP+RV8pGheyCOQudx1sG1ZkPqynsd
         ct+EcfmS/chdqQ4bY4eSWsj+xqwuL7te7IVHPOxXqbg7p69yr0OCsdYW/O3xxw5/imlE
         ASNR3SNNLkw5tf4MP8766trpydH9w1R4qwNUsxKSGoTnP2MNsAa2PrOQSF6zsS+ZPu6S
         6zYavz+Wr2AEVRQ2dZ9Mib7HjGg2eKqpblScu+zmd/oNCp67cbipdL2s8PDogZVuZVJV
         Rco6rhdqNQYExAT3Kh5BoOXKTWDNBI85loh08Usy+2CqGt/yHQ2W9C9LgLNVT8ChV4o2
         VV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602649; x=1796207449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=XZI8H7liLojrfpW1dnlmQbdUbwQPYkbGsRRUOn55Pt+KP5mXtjy7j0NK1IiI3osvNf
         7n1KhazD7xOKRJ8DuBI7rULI3xcP8p2AXHD7jinPBZT1ymvLHeGjuG2VFiVZbStjrPyA
         4Q1vnYgEkRsjwqRC26fSHHL9/uNBq4hFCmAYG8ROX8rbxUsuug1MaZv/YLjLeZCZyjTa
         YhMt/hA4vIson9Lnh9YyCf6pzRl84UAfR6brDX5nCKuyh48sooo1YVYcFKAHa+e3v/GP
         uwjDYWGDFj6gyT7pQJVLZaHOgfo4FTFE/0pCENHDMfNQJIQoJ7T0tOlvCvvZRv31JM3G
         x8RA==
X-Forwarded-Encrypted: i=1; AL+hErG23MKQSFmP0iJCN9PqbWdfjBkpEp3LDx4lHJ9Ms+K0pU8zdmB8g3fc79tfk6o38lbE55xccKDbmYFMPQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z83TsvGRcmpoMP6Lr/T2cyQVUkif2h8Bqw0blOk3zxCJ/daolC3
	1a5PGVpO4xVv18qQbEbOemjIB9TkK0fkpns/MLi7TTTRPfdgbmqT6jMP/3tMTpgyWHgbTHVNvCb
	yto5CGvXneVOPCDpPyK1yBEB1I9o0Gc/p5r/EVH+j1WqycJpzzzkHuueQ0PAjwDdFtMH3rNY=
X-Gm-Gg: AZFdTZeGM5HZmZPjZPq1lNfefdIRF0n3GQV/kL+9Q2OaXHhvT1N7jGI7KgmYlXQ3TpZ
	armbXtvgo0BPCzb2rLaqm5+ENJm2Ykn34Xi2PXraIZefGyRsMwjyk5pDBOWTD52PTVJll5k8rLs
	pApBu3I0WyxcDTDzmEVAaHk58nehxqQgKnCEbyddhcuLlBBw9C8mqP8NOvdLX5KwPZkXeEcNNfi
	jr9Yg4PyFNSLVpr9zwP9P10Jy8X7Xs8aiOryzeYL2koXCGSZoj4h/NopY0MwXsxvLeI9o8Fg9AF
	neHr3TiZBnAq1T10pSStZZ2r19LsZNw7iSW3uH/YDpVu6OCAk+ipAfK9pD2KwGZblJ/eyib4Hp0
	NFsi55LHfGKRsWzSC4QBIj7VjilHfvHzF+OoyZVZOGzidJPnsAP9p/EaB8v1ZKr9mQI4qAzQ=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293214081cf.3.1795602648914;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213541cf.3.1795602648401;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm611728366b.77.2026.11.25.02.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:30:47 -0800 (PST)
Message-ID: <9ab9503d-1668-401c-8d56-632bac5d82ff@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:30:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
 <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXy5znHjZJ/cxD
 sj6u1LJK3AVaj46RcK1CbCN87nY5vQUDzE2FPUlHbCRCQfXZISBG06SPC1ie1Ep4o6+xVF7YP0n
 SfSzbf7igEPuu2/qdX8G7Jbd6TgrWQEoGez08UAj+61qPBSNXq2YWs32c673ZGmXfdx4B4k+GIk
 7UAxCYWiuGtW5kRugkrBjjgTmwfbpKMWs6ghqsz3cE+YU+2NIPWKx2d1GMXWQxmYLeZwZliho5a
 MoncsZgavLo0SXw+8T2G4fLHV7e8rCjI+oxkmshR/8XDu3XnYCi1tCgpkrubJ36kmtqXCGUHicf
 AJwST1vQnr3jKUUH6z4bb3nTz3JkdAhkkBdxkWMuvLDQjxSlmIvFA3OEaJ4jXXS0YWpJlHZlsFH
 vQD26sJqhYz1Zoi4YKFLVBH4fC4XKkV/TjAHBHtjuVS1PgHCwgxUiwCKz2cnLWS8B0Jzw/dFQsb
 diGkKvGwf6TMx+6euVg==
X-Proofpoint-ORIG-GUID: bcX88DKV37MidSaPp7-Pwln9l8nIG92Q
X-Proofpoint-GUID: bcX88DKV37MidSaPp7-Pwln9l8nIG92Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXzE5/IvVWqE5h
 PheFYSV/Ya8DuPQPJ2U0vvJo+62a7elsS1N4xqjYqO5ra4wAysMcxuiBd/KH6DW9tR/4vVaokvZ
 5Q0uS9vu0OlJAC2VtkIyzLtBQ0NL8Es=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b8da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D7e9McI_jBWpmMXics4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_023051_847327_223AF709 
X-CRM114-Status: GOOD (  16.63  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 11:11 AM, Jie Gan wrote:
> 
> 
> On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
>> On 11/16/26 12:03 PM, Jie Gan wrote:
>>> The cti_riscv device is suspected to have a clock vote issue on the
>>> KVM enabled path, which causes the device to crash during bootup. Mark
>>> the node with status = "fail" for now to avoid the crash.
>>>
>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> That would mean Gunyah is enabling some clock that the TZ itself isn't,
>> which would be solveable through a clock driver patch. Do we have more
>> details here?
>>
> 
> We are currently debugging this issue. What we have found so far is that the RISC-V core is not powered on when the AMBA bus attempts to read the PID from the device registers, which causes the system to crash.
> 
> Normally, the RISC-V core is powered on by remoteproc much later in the boot sequence. However, we have not observed this issue with either the UEFI or ABL boot stack.
> 
> One possibility is that the RISC-V core is powered on during UEFI or ABL and remains powered on when control is handed over to the kernel.

As a workaround for now:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
