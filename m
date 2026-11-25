Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63D606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xQKsn1Xf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnUDLB4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qx+aGCpfaNa+FRTc+cQasWhGJ016DhLTDk6nVyLNv90=; b=xQKsn1XfJK+2HLIN894p6GEmyI
	ddc4rmQJWL+bJntFYmeB9q8+lpXHXQlyRPKwsTFqVqPfmB7RsBivrt1it59TWwhJd1Jb1OwQ3D48N
	lNjCIVFcs5tVLtk85ZDT7gI8JXZnngbWDViXXx2RByPliItsaxWN+TwQm2ujElknuIIUORuS1J7J4
	P1ZZoJgpK+rvyworT8zLfOkBg30d6mmZ158VfwRf9Eg+xNFsvjOXvzusJa9qX2W7XUPPxjqUzm9Nr
	G4x8+P2WayzRkSZEotBzWHQCzJ0la//MRlR8zQOQ8xpQFcvyavTkSulAXyz5zs2K0pguLpFCiAX6U
	VgSPgNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9gn-00000009OA8-1anp;
	Wed, 25 Nov 2026 09:53:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9gl-00000009O95-19yf
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 09:53:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlTd3611457
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 09:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=; b=c90SPQ0DmhnIfA3r
	fBrKNi5CwIVs9Q8Y8e8HNHuZfGGLUTD2ALfns6N3iIW/vOOtX7VuYnZj5H11z8CC
	zw6ViY0s1Px6n7wqZlubqL/Wa2dOIJhkuhnIyl7ZLROz+HFrWuJfYuH2oekxqtRj
	5ioWP54l+lu+gYEHXfKxwZy0SeDJnMPLAZa0I3GbdpXiseygAHC5tej/p5sLK6/E
	fS4s0bp7PoCZgum5wnkiAzhWNFtktcXCHYSYQrhgsQ3lz00vazOJPXSEu0MbdTIz
	yYBAEo5sJswRwCP/AUxrb+tlJS/RMRLWRDCrJ8BplFv50zlyUIwZFaeFKDypjQb2
	+sT2Iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb0es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 09:53:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94964828890so70288385a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600398; x=1796205198; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=jnUDLB4sTLYUyDu24N/v/wPS+SEcVPrZGtpDGJsPzx2yNaHXWIGqZAhb0nRXwQ1eO1
         MerG3/U/+Yqb5SGXniIQH+oymrhRMmC6NLsTX6BTS9xVHZLtPIRP+Y0e3mahrxd81rNv
         szG/nSFF45RDf5hQ+w38bUaDUqtOfgOq87sWn/secTlEl3UDWVMgW4yBfm+6BysgKISh
         7Rh63oErHpca4gERMcbiJ1okiWAIze8wYBlknVvrSZpT8uqW0iQQYHW6dlaqERAi5VyQ
         oqd2a+a5WySar4okPvgN7Xxskom5XbiZD9a4Pcx++OiqGZBXZmJOZLqmFR4YN0mFIFvG
         1VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600398; x=1796205198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=PMjjr5N0iFtqkJeL8uJv5TiOoi4mUcZ2aN9x6Ec8ukPqZ8aB0RtpqSFsA6yLQidOfH
         QQeGJcniKRJ8+EeKV6wGyns0DYfGpxCGRuK6H4TFHW7x6QRm09Wqy6jwym+ZKO1rY6RG
         iaqioQdGc3/tRyABWW3uN2VYR5XwIWSbnmoj2WsoFrZIRe18o7k/Ra/KMO4kZar5ciPM
         EtEIEn6G4Y3yB07ZxRaAo1nYb6BRQFn/Pr5hcU6LZQtpK7M1HpYefFAfScnPaCvg58jE
         +GAg6n9WzwY9g+wYhU30EtpQjjVVCWUXGvCsr6Hz3nMowdR95BWW4NYugFIO3DlHARWC
         n0Wg==
X-Forwarded-Encrypted: i=1; AL+hErHdJ3BY2NVVjnQOl/+gSAKnXt7MXapvDH89tT4xRevWNUQou7hdFop1szNNhrRFNbZtanvOspJU/Yxd1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/LDtsHBz2i8gcLQbglZ1mXk0kDOc8U3pQzvERWFMb7FGnlQRZD
	M6RrpFRy1xwXlldUFjlbmMou66YSfANo8MQ+kNiJ+iUuxUpbdZ8a/sWC8p12XmDsxkU5dNsIrDo
	IV5v9L/kmgQUXmzoziHbFcZGa24PaX9QnATratDJk7mzc/0W7yL3z2S9IdwZTQ/lEgkZbLEC3xV
	4AhzQ=
X-Gm-Gg: AZFdTZdMSafAUgBKyLi+uVsPwWxkb0rEZzweIft4aaJV7mAKeCv4EgNVwZpvtVFAGJp
	/mDjzH7+oz6cIHw/cAqfVPNODcFpB5jmsw+hC0HJMCUQDCsqHHyVDCCHGSASQ2smu7Zjk4ZIy3/
	UTphDUyp9QFh4z/AWYdHE+4iiyAZHbR/aV6hiiezEud1UEWKM0q2Mv9cR4l4B7Dlas3THIuah88
	/FGZ/eD/HpR7iwCZGXY3ivtyxZRMtvCsYVIZSC7FhmSqHKdWxiTUu4dnqwrFd4kFkWL/p/FrYAa
	w5YI5WE8+HH39IIafb3nZfkB6iN4+Yh2v1MNbYaeDLHXSb9SKGcrH8pQVN+pS8GlevjOR/wV72u
	8J2GnJ7kjv8auP7pEENJe2VR8/BPsJVZ7jtTRGmdf8OSiVodtR4f5SSONvtQtUa1xoF5tTeU=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847962185a.1.1795600397591;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847960185a.1.1795600397077;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68802sm622707866b.28.2026.11.25.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:53:16 -0800 (PST)
Message-ID: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:53:13 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
X-Proofpoint-GUID: FCmgdekJKdJIp4Bp_VmV-d-uHTwXrbJc
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06b00e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=K9kiO-SBJ6ozCPIvxsMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX+LE1PRVSv4re
 y/OAPzwEJDO2XTeWr3+fS8JUurb/NEXAVqewwyO5RJlWZDjuP4biKinIOwtsiOSp70t/CNcHACn
 P7FV0hn/w3DIAFe6dKYuAIw/dfgPPf0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXwmJXL4Au3L+h
 nd3OXfJGEEWkvLfZ48uxgDxZwD/mzp466vqEBttofEEYAbzuB0g23/0kmSpZ5dHcOV53Y+bKMnM
 b3UpBhM9GWNwDUwAjGWqx2QyOXStrS979kDxaEf5fpsLwdAnzkEDMe1arS2fOKGQ4nLZZ57npX5
 9NMVPRnxfU9N5XKXh0D2BefEZ8SxsiYkhN+g7JZVd924KGAYL1V1mdljn8r242PdZdxEk4GkrbI
 j8XwNAgjLk19CNVs1CyPiBIL8CiQh9iuUyCfKcULAT4RcwdvgHBPNVqnhZ0NHQCo9XpZky4PmxT
 uFAi0XC9Jy2eceQBwlQ3rMsKVSfs1T66lgp7Gg4i/I0hwYahl9T+d0rRecLfOeJ5oT/1hrjA8O7
 3rshMaCFGw4TwdAowFljsoRUrmtsLPiNvN3MkbU+wH6no0fc3Si6Hmn46X8ZL8mRK5J+AtU4fpC
 vG6hccaUEXx5c43ZJFA==
X-Proofpoint-ORIG-GUID: FCmgdekJKdJIp4Bp_VmV-d-uHTwXrbJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_015319_330964_DF7F7721 
X-CRM114-Status: GOOD (  16.65  )
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

On 11/16/26 12:03 PM, Jie Gan wrote:
> The cti_riscv device is suspected to have a clock vote issue on the
> KVM enabled path, which causes the device to crash during bootup. Mark
> the node with status = "fail" for now to avoid the crash.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

That would mean Gunyah is enabling some clock that the TZ itself isn't,
which would be solveable through a clock driver patch. Do we have more
details here?

Konrad

>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..5f5a786fbd2c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3996,6 +3996,7 @@ cti@982b000 {
>  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			label = "cti_riscv";
> +			status = "fail";
>  		};
>  
>  		tpdm@9860000 {
> 
> ---
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
> 
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
