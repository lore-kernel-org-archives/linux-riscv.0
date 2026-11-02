Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EB4606A326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Pxl9IXC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Otw4bcgG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQSSohZn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C8zwxGn0XIyNySoVtVVgHmu9tHQPoFC+0M+gTG0iLhg=; b=1Pxl9IXCzLFMI1rQSZ0//P9UN3
	dgeQxkK4YI3w5CuWtXnUXgxsO0co0mtWXm8X8DuH/vups+XoAU1xVnUD99h6OumclIiQDmhJMkr1X
	lg6AWLORLfVT4zueJOHGdlrJwvr1RmJHIvjIaWhgtgT/gqvPFy1qgaksRsPFAJg+ObR7rxw2/UAnw
	b8o+Aql/SpRLlKOyh9JvcTKp+1ncSn2WVp48whhjxH364O2kcqKMGNbRZmNxsGNyHLG4TnD0mPjLj
	UXDTKUWqvYYU8oLswMUGn3tVhlxenZ+USA774EVbrVsZxcNJ0hHbOUxmURrUPI1Qcv98Ox/5wt+MY
	D9JR9YaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmhJ-0000000FmAX-1Zdi;
	Mon, 02 Nov 2026 07:43:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmhG-0000000Fm9S-2HXc
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 07:43:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vBEG2752948
	for <linux-riscv@lists.infradead.org>; Mon, 2 Nov 2026 07:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=; b=Otw4bcgGn2SZvAAU
	SHiX5S9Rrnm3QRUvZgrsRrqaD1dQiFSlL6Md4O+n4J4OGWK5rdgqDryMx/ELO3o9
	XR2WZjLrBBBBT+XfyZi2JUlFaOkcZFTcMnIirfWcxJ1gx1u7d1dEJCtVS4f2vl0q
	V4JDx9bri+DEGBQ25AaMFinqdsyFdOtaaABhZ56xYF5mpOgBkJM9Z2CgbBpcEBsX
	Oe5llLh5WSVoaj/VW1LSKDHpP/+Q8VOLXwrDkVpMXR8btuMadadyEdw/PwnqDFeQ
	n8KbV2HD7uzE5n6SLGqsl/i50c4wroRDDp3Vgls+M+01/nSjtv46kjeJyHRGqUV5
	mvmKFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg20176v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 07:43:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so441778185a.1
        for <linux-riscv@lists.infradead.org>; Sun, 01 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793605393; x=1794210193; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=WQSSohZnKwMme9UiL6iNdeHFCQoEN0Kbj7R5d39DRcFycvVKz82335WskDsSievfmH
         3yL2srhXpxveHRapnQ/MEYti11oSWEgvxn0HQFT9logzyl/E4UAODXLC2udksm6DdYF8
         NZaiBTiYdXOdpuXG+FSPJnig0a11R89IfwnNQMJ23O6jVvPpCOt8p2O327X5dLFAoUDE
         gQNdGDA6qfCZwMOQKShgBjwZmzkhExYazHKMMMpUwq0UdxFrllBYpTbhxGSiMsiWs2Pg
         qsnz/c3/IT/xgsCaYBDX5A5KakcKaC1/HK4fsiEGJiZdk03cmqV2pWkfPTdnnpS3eveh
         Z8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605393; x=1794210193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klOv1N84yVFiX5VyeIBQfSwBuik5rDbfaMDuPGgQBP8=;
        b=Nu+Z+Bp7QZZQfcg4+eBFYnPDUTmmOW/udXE0rj+eGlFGB70c9shUZ5eCj5dasUSfV8
         xw4AAvKycoSc/XlWOkfR1kh48FlF0VBfJPluxXQHiXA1ztqiXH0/cwLZKuwGdS3unLou
         F7atJIpojErCcKmBJTnmjjBuXiQ0HFcfluBjY1Pc5ckw/h3WZxKK8jpnfA4Kta/Szwkw
         wf1VRyJ57+jFnrb9fZm552KAWA8DOtUmzfUKV2+Sg0H6eXMtjXHRZt+QikYSqJ8W8l6/
         QtR896W/5Mq2L+T6IkXSDusw8PMjYu3QDuvqLeJ5m53o5zdTGOvM6yIWeJKk6hkiN04t
         /sGg==
X-Forwarded-Encrypted: i=1; AKwUvBxfx8GS5JD/A/nHRVt3UmpUnfinartRYCnX+qD619qRzaw2UIOCxVH9m1lwrP+c3qP2sjDLfw+gVnqXwg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKUxcPbQ5iaX0byozL0sXRn2f7TYBeLXrBEG6Cx4z6Rt239hfq3
	+G9MVKJjNIS7tWI2vL7xizY31cV27UP3KLdWcJYLvY0jqckrzsesQKvionixcoRDMI0xztpOing
	kOFpG+YnltBKkX96eFFUGCtFpW5TiPeMyMpz/eHQqjv55cni+/0J2RI2U13W/qoL8uT0hoMI=
X-Gm-Gg: AYBFou0yrt+XHJ//ry6CHEDO5oARimVHpfm8HDDuZ85FWQ8u8DuJ50dK5xuiGuupUfC
	MNeSeLwo10L7p6XbbAzqcHmAwP1x+zXQZL7L18K3cw4T/uP9KLqXsXsVhkKTS4AZOlJ128tWHKX
	P33Q5VspeYHPUgpFTEXtxQ1wC1MWC0N6bbOjfpNSR/D+gXb2B3NZc5WYfdiEksLeJ08fD+YlBvN
	DBSYtR5ofQSctrpZJwj3Hj0tFqvcc5sBloUcoHOGxsPsiZ8YwTMx/rBl4abTAg0iGoUYX5H93qy
	cDXdOFBxWcLcmlOp+zvBATMfsHE3v4ClNaUh3zY6gKyMgc0n23Yd2W5tKOHMq8ricvsxzC5jom7
	9sYtruSYcTmvY1ZpUuK86VJcUM78ff8ipbhwzBUTnoVTm5xFjXoaKviHyv1eo+epCpRH/IXZ8jQ
	==
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455248585a.49.1793605392601;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
X-Received: by 2002:a05:620a:29d4:b0:93f:3cb0:464b with SMTP id af79cd13be357-944216f1ff6mr1455245285a.49.1793605392157;
        Sun, 01 Nov 2026 23:43:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm18976337f8f.12.2026.11.01.23.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:43:11 -0800 (PST)
Message-ID: <151dfde0-4057-4ace-88f3-3939612e4dde@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 08:43:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add UFS Host driver support for SpacemiT K3 SoC
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman
 <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20261002-08-k3-ufs-support-v7-0-bb39007ff9ae@kernel.org>
 <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DMICF1DA617T.1TZ7DMV5WG818@baylibre.com>
X-Proofpoint-GUID: 7uo7_HV6b1qtdZySqVgwzmAC1E0mn9a9
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae83f11 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IpJZQVW2AAAA:8 a=T2WrtOQxrTuvjP7BPBsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 7uo7_HV6b1qtdZySqVgwzmAC1E0mn9a9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX2cju9rYhEyiy
 ELmTSuuSMnY5nffzzdpT4ldV+XOXgTeP6PXC0s3gDAPtoLGOTtOJIPdZi6KkEOLRBXVEbFj+G9q
 k1mXlTlXEo77aIuLDCoViPhSVpkYbwEZxDiud5YvvSfSQE0ZTftxz9sLo8fH7HtOi5F6GXCbzTh
 bLMWj9lRJLeXiDX3roiRgPwUyMk9pEKwsIS/P2ALr5ZbdU1vExngWia+DQHxGm+tt3y8PI4Q2cE
 wzG1hZ2NTQc3WID+TXR4qeIMm3dtPeABr9x/PujaQhMsF7zGjf+k0PX7uaZnFgQ3w2xGydPG5RR
 7fIvYy33k7b567ry7wqhQLOgExuUBIqzhC4IyE/255aJD8M0cSZtIt/1eRfPshL0/4waw6JohYZ
 sqmFluLlTo0D4iANaHykVb7tuCpeDQJSzTJjjMQRj01/xYZmkk8UbRRYALQtO5mwEUloOWSob28
 23pN1aDHnpgpCpHcUfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMCBTYWx0ZWRfX607EN0/5J98P
 TTwJpr+szCbbwCkmFurEiL4EtL6l2QNPxXsEsWhLx5Ku9qNG25fmuIlmyXlizC9A3XLqtwdJWmR
 dKxYSJQcVeAs4k7Hu2CILhtq7TtwheA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_234314_700898_F59EDF15 
X-CRM114-Status: GOOD (  16.87  )
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

On 30/10/2026 18:19, Trevor Gamblin wrote:
> On Thu Oct 1, 2026 at 11:10 PM EDT, Yixun Lan wrote:
>> This series try to add UFS support for SpacemiT K3 SoC, the controller
>> components consists of System Bus Interface Unit, UFS Host Controller
>> Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
>> Management Entity (DME), Transport Layer, Network Layer, Data Link
>> Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
>> block diagram can be found in SpacemiT website, chapter 9.7.3 [1]
>>
>> The DTS patch has been dropped in this series [2], and will send
>> in separate series once this patch accepted. For people who want to
>> test UFS driver, please grab the DT patch from version v5 [3].
> 
> Hi,
> 
> I've been testing this series (and the DT patch from v5) successfully using a
> v7.3 kernel in Yocto's meta-riscv layer. It's been working well with fastboot
> flash in our nightly CI. An example:
> 
> https://forgejo.baylibre.com/tgamblin/boardgarden/actions/runs/827/jobs/9/attempt/1
> 
> For both patches:
> 
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>

No, you cannot test a binding. Otherwise explain me how did you execute
it on the device?

So if tag does not apply to 50% of patches here, why you can't just add
it to the ONE single patch where it applies?

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
