Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773FF5A8A6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC88lcF5G2KsiJkW7joHlWQeHdXOXqW2WKjKANcaYT4=; b=KR9+4dBNTmPklS
	4hUBhNZO5j8fKJ2ZzHtGONN4qoRfdSCBzcrp1hI9P5hEjflz/TEIOO5PQQY+6+k3D1FyMp3w6GR6d
	sUucOOMP4v8kZU71lL4OCA+3lxKNE4tPW0zST6je5LYlZ0vzRpkt85nigoFb5VufQRE6eWK+Iwyrq
	HwqcfZRlKoidlGTCsvC40pilgihKn/mUwBRW9hhtcyYCAK4YrQ0+7GGDD4ltxk534UFb0MA2tdWx5
	tx1KxjzgXLCqsqxw9u/yrml1++oYJsUMRepMy9XcypL5ldN+oU47zPEdRROCLJdFW3jz2P1prD8st
	p3XTJpCmv1mystdhe34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsqC-00000007WXl-0p96;
	Mon, 20 Apr 2026 17:55:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsq9-00000007WXE-1sg9
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 17:55:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KD0sTK3454948
	for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 17:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=; b=jdJqKdokxWedLT6+
	4Xx5HgmsNgw2OuO8PTivMlm2IiqYcyqg30oh8UXKHX7BYVsS95SKc+Zcphc1qZOZ
	gOoaf4mKuNzTGA83aSI30+UhuIlcmpbK9m7JMCMZnj9su7WHoBuXljHhLrF43oq+
	zgu2IH/zjrj3H5OXN29BPbImk15iFAjD+25enHI7rF4NXdpFGSLGN6J4XzfW4Wph
	3mutCqK5Z7ocR1eIYkYoEq2HpzFcMefqlU0ZWCyb6LwWHQdh08fBQUpnXBct0ZVB
	ruuTPMUx7TooXwHpiWK9/HElMPzo8Y/VgFM9FVxvzn++ABdym5C5CU339guKaHJ2
	vUTmog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjtgx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 17:55:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so8764051cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2026 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776707720; x=1777312520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=;
        b=Z8WabcljUouimK2jLj11sqmfmAgt9WS6UD8zRFFQLWo+amsbHj/vCuKJZPtVjgi5cy
         AXC1fZWFWuUauJeUlzP79wg97ASE0UhVIiUWZOkfemHFDybsioNJtMJ2LS/Tu0a+3Amg
         ROp2WO2Rp5J/+nJw/J8hlZDJLf/rwebZRyAcMoop/HlRusDXmkb5mGN7aLhmi6xdyJRu
         vqbVICgW2B2rfGZiETjHXwdLSk3EAJ90CRW47l4fHWNhRsNULLRQGhLIkMyeqi5JsuEE
         D06Ns4L4GFMgpask7/oBUz5InCuZ3ml3X2ZiK2Eo1hIMmXIQxtoBdTsGgTqQdZPHi0o6
         VzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776707720; x=1777312520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mWc8pu5UPxrZcFIMvMGsIUsa3LBefYhNY/mt9+x6Aw=;
        b=Jy0CIL9AcldT+KlYF0YsSMzpARg8wHn8XgnF3oa5xWTfOwj4e1q30c3AZ3Xg/bqJmm
         z5XH6aHx7oEy9fbmJPXuHAjEcfrljsWTWIqcJiXbXzD3vA4Z1jGTj2uY+rejtZxrKuLe
         YQJ771wOtKiXFzTvSvPCYsA3LXF8WWustYHKGEfT3IDF1lw08iN/cwT9zPLUgDK0pK6S
         SOAxBzvDp0PctB4GiN4lq51r3B6As+TpuCHqF6mmNfKVbfMVerrArWFo0GfXfjb2dceu
         b+oy8/NPGaPmAecb8bOp0qdMQnr/hJxcUcVnNOQeqzZfQns2giVDeOFju+NnITG+sCGL
         7EfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eaxUmnSAUG95ilY1dQ3CoJDi2JrMMUNUaxRIp/n9sZcwgSFMGOiDDPIMVNP5bPzeJKoQpyqJxvyFwVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQaDnIqY6qCW3srZq62+8EbrK3SX/Gq03eEl6ABlWKMEBp2p7
	B1R3OU/ZXcYzYCFy8durpvAuVcCj6xRlS284qbCwjnDRM4mwD19KJgwFAiIsNcEp9aePuyrra4T
	vemh5BH+3HEx1cLxJCRjAGWsBcMTn2/Vy0c4ouoV0heezCZDEg+fjcpzBX3/qENSxWS1gR38=
X-Gm-Gg: AeBDiesO7IW7guxuqrMuaY8t4WfQzgeKzK8+ba9DIZlAlQjMsvX+i56DieuwgTOTevw
	czonuIMpdakrFOJhmy4R7Hq6vPSdkEKH1yhlpn30drI+0mNvylscLAHnQ/3ROs3CeBp8navtQv3
	wLLtt+fyHWprrZGTrMnkVpDxenDIjHkDfEUb6iWCltVb6QKb3YOSX4Gr3+cAPFiy08KYdmdlMeo
	vEDoEqOz+Bre9lloQg9MsKzqLUzQXlcaoZmf4w0iou7xXbWELV5W3Q8jFldcRyb/Ea+Y1OhU1Ed
	d9iq/davf0fxEO3vpcXyJ97WQIyRA9qqxUANIas5SzmOb/kaEvuCL/yNzg/Ogb1tsmfFaVRw8ZU
	VgmfnO5qnQdweNO7CHUX8RpwxNnJB2pdBS9EQkaxkhx08AJGkNFb/Q9jPwF6k2qsCkz10JmTsDq
	dsIQJjwU7rz+eXKWNz8K4=
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:b4 with SMTP id d75a77b69052e-50e60540c4emr54801461cf.7.1776707719563;
        Mon, 20 Apr 2026 10:55:19 -0700 (PDT)
X-Received: by 2002:ac8:7dc5:0:b0:50e:6054:b4 with SMTP id d75a77b69052e-50e60540c4emr54801111cf.7.1776707719106;
        Mon, 20 Apr 2026 10:55:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7bf969sm91851475e9.33.2026.04.20.10.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:55:17 -0700 (PDT)
Message-ID: <cc1a4826-96c8-4074-a2f8-bc49f330d11e@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: timer: Remove sifive,fine-ctr-bits property
To: Nick Hu <nick.hu@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260419-clintv2-remove-fine-ctr-v1-1-7527f4d45850@sifive.com>
X-Proofpoint-ORIG-GUID: 1g6dCzMh5mQgr5w4AQfCqsYqhYLApXCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3MyBTYWx0ZWRfXxmC/yNbGaxWd
 X++lAJEaD92INmOfJ8SrfZ6L6JamBBc8zgWR+hHppLujCKnqwvoKgYwGxTVR/xr/bWUW6jjRFnZ
 Jycs4yBqQvo7KqiuRinLvzOpOg19q3jJE6fdxBFBv9HdeP/UToHPYSHjhsQwK95PTgL8p4c4u03
 UItTNPEB9t7mfIHdY8Jq2XOY4v5WbnuRRGkOOMqTJIs8f7ZF9Qn+KNs09TDSkOsFg/wUselCfUU
 Ulg5WRTMeT6ZeXALoFjelp0g24wTM+h8CoibWYCLRiisqF3MNNtgmUocIEfZ9FIaXX0pd92+C3M
 7l6i29NhI1G68dzp+pIGQFBEmOyRXt42lAoOC6+x/7LMQJc347yiKMMOY1JU++fqvP8olZaSu2C
 l7m3XzyhDGmV2yThk0sQOAQyoq7WmPjxjZBK9FlHHK5idTylRi7+u67fx437UI7Dci6D6Ds3GQx
 YKrHLhZCbUdHHKWqOiQ==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e66888 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pFyQfRViAAAA:8 a=8mMVmbDXBDW4nnSvDdQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 1g6dCzMh5mQgr5w4AQfCqsYqhYLApXCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_105521_617451_D22AD40C 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/20/26 08:18, Nick Hu wrote:
> The counter width can be inferred from the compatible string, making the
> explicit "sifive,fine-ctr-bits" property redundant. Remove the property
> to simplify the bindings.
> 
> Fixes: 0f920690a82c ("dt-bindings: timer: Add SiFive CLINT2")
> Suggested-by: Conor Dooley <conor+dt@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20260330-relative-hardened-5ce35fe1ef57@spud/
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> ---

Applied, thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
