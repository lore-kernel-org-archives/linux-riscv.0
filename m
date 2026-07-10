Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16934C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdQ67js0DPWx+MAfN/RBh5YhjFCKvlY2uFIO3u14HoQ=; b=UDc9SjxLqD2X8t
	553FkIcFryYom1CWwwAedQ1DWkUF5mWF6ZIL/EjNDncsh4pWCtSYnuaHbR07/vWLwgWuSx2+ebmMB
	JO0+qcqCmgORBA+cKtanTRLcdTktYQTGJxb3tdjHijo66pZEzeUhliZrharxCkLNdZPY4fUs7vAy+
	RTH91JulYjYdeDEREiSjhrxLenAKqdPSd1NIgmYTtatyQhBV3tWtmkBScB88W5wu4ZRUSQ4qO+RFF
	PsDMCy56TV5ivSkblMioKqhNvytJ8xQzzg9r77PVUXrZEW3SkHpUbkiLK+1pCriVIjK2bKk9MVk7D
	O+eOy/bCavjvu4etyCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6wD-00000004Uih-0lyB;
	Fri, 10 Jul 2026 08:50:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6wA-00000004UiF-0QxO
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 08:50:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eJcM141562
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=; b=Xg42b0g9MUSCQ9s9
	qurkfwSTMG6N35ozQPKaN5u+nbzys08f8XsFv4NIhisNMtn7IcSV0gUsuyb1v13A
	/gtHNuvVFUSE50JwppjGYTR0czD3xR0F3WnsuT64VgQvZUahdJNCf14Q39IJLLBm
	htVWmPmThcCn302tmihCRcdtCYhyl8q244e4BBMfDw78RwVgyOB/HH4/Qw7HmelH
	LVtzEIAzW8OgqQxMOGXsQyH8dzdGQJh5ocqJMvg2od/JmyA+H0o24kFPgau22FYd
	h9lp10hZTxXxxPEgOwj8sDJmK3+TZlRzdZdDZGmqqhsyTUyh8CG+hFZcgv1hj+Q+
	coGAWA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf5mucf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 08:50:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so7913445ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673418; x=1784278218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=;
        b=Cnu1ZLQC6sqt9o7Cqymxu9WRd2xgZTYhToBTIDqNoHa/qIFFetiTrgBBpmrf5av+K3
         e+BEFY/UC1cryQwWG6Kh2tRhHs8bSCJ5/PassiSB7AnayKOSr3bTQ2c7PQnFvM2KqaTd
         7qjirnjqwC/ONejFxZ6WPGRnzRH2oWedWxVtB2DaPcPdctWg1haT9JvW06uXL+QukrZI
         DDgxJ9nNObsA/8LFC567IjoSY7dcJHJi93aLNmU+Z/3xB11So0bR5tX3FybY2tb8O2l0
         +PNz7zY+84eC+ZyGECFmFZrX9uvYdyap8Oe0Sjt80j5Sl5/LqALW3VjgcB629dhj64JS
         N+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673418; x=1784278218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=;
        b=T5V97kJ33vDevl2twQw/JXfafwyCMgvmS5/BtXVW1HVIfdTQUBypU5YGfBsS08UjXZ
         JFBwp0ubt/5JpksdVqUuO/xozwu+9kLi3H8z3ZDG4BUCW/Nx7ilPzG7qZpsbqaJMOHkM
         emC8m0PeZcNuvb6Mf0gjdeIhkFkJE4RZvOKzv60uz0uZPiyHaktQSReqPplWkVxp6gtY
         TxDkGGKsPibmwfmdM3q8QOSP5y+DTiRoHUcKVAhjxRtSlAcUs8t4jhxPgRxWb3ruIvFw
         YEu2VEK9stWSp8LeloEco0/NUip05p/YAbN3+Ewzj4nq3Ug1a1rjjnCeS2c1dtnlrmbE
         onoA==
X-Forwarded-Encrypted: i=1; AHgh+Rqtl7U0wiIb64DDBVFkx6Xkud9slw6biPUg4YCqc9wJOFA842WQqWnSTfP3tHKehpDl/1DBPecQpp5Wsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiwkxLeWDGDcRI6+HuUx8iwZtiuipHf1/jC6nv//QCLp+mgGCj
	5n7hX0gd6Mp/h4IuhFXagOBjlmhTXrm+WwFkcWFhHFknQCA2gGbXenNfC8MjHMm5tNoffyjsS4s
	sSKsqNtXuuDdrTtgpdJuO4178kiDBg+DDQZHImFoVgBRoOt3XGakmknDQNX17GOT/0wydTi0=
X-Gm-Gg: AfdE7clHqBKiScMqPz4iM51ZMQwBrl1Rs0ArwumybJJOWfOunhfYmSYuV66Rg9bLw0L
	2ajmfxDlFsMzDFl5hcC/vfHAAkZKEpip5Sk+RW7o5mI2bswVQBGpNjr0aJ2VObGSKe++e46zMS3
	Pd29ld6wubqKVo5YbxLz72HxOsArimAjnwCPTZCYWMDDxEYBJzMmiSnP0w9hxZpRklwzXPgahR8
	o9r2ixieTmx2fYLMguaXiB3WnUZHwdemofVk4KDwoyE5XCEYqOlbU5oWebXjzbGR0dOhm7GZE5X
	SCg+44RBvRfpAV+fCXJQYKR7y4AzHUaGZzZMhAAaIMA13AOje/jMG6GQ2JDipIV64ihpWXaaSDx
	LiXI/DeTMkcjOGaHOrKqqUFjOAUiI+DQ9b6S+GZomLrr5
X-Received: by 2002:a05:6a21:6115:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c0f0b6fda4mr3080656637.26.1783673418508;
        Fri, 10 Jul 2026 01:50:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:6115:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c0f0b6fda4mr3080616637.26.1783673418002;
        Fri, 10 Jul 2026 01:50:18 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm38642648c88.3.2026.07.10.01.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:50:17 -0700 (PDT)
Message-ID: <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:20:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
X-Proofpoint-ORIG-GUID: JwSb4gAeKn-1Wu_Hdi1WX2Nft3SJ0Tr9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfX7XSlYbxVBxqb
 +dJwRWmGu23+qkIr0aG5csMGr6NHC7lKeUd16itC1Sg3NHO9iMccWLm4kD4qS9StaV2CyseIv49
 +iB16xBjdRcCZwGHu4y3+PCeGMn9Y5Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfX7kx25Ut+xQqZ
 1j5quGJnzfl4zawqpqBsd6N6vAmT+0rZ5avJT0iw76KKZoja7egUXAQnu0j7MrI322B3+c4KVuI
 bDQ+LVVzhH0/R5Q8GQ7oR6bivMDN5ml785Zb2dRKgrOMpGOzqR5Bl9x0d92jd9CoG/PpVHBz0Mg
 XWHgZ47n60ErcUKuYzhidjYw/v6I1N3LiUHE9rW6RsdS1TN+pFE3VVx5XuvGOLaKt0A1YWXjY63
 F21yRCyviCI0CxWzfUyuWROhuZtnWn5jI/4OaxPBCSHsvXOyY8CDZcOWBOtwpPdfqXVp4OP2S8L
 M9B2mFb3h9TekrG3lZB8HwLGbX+LuNgOCBhSRb03sUWNPdi9/DxXJg1w0/9TJypMqSl/xHJTX2V
 lq2/h2PCRUeg4KG6YOFT6zeMf2Vy06fbRzT1N+t6tehNX8m85VRcpk5vcIJTYFZI1wZltoz+Ks0
 w3SbEUaFgRzgdGEpdMg==
X-Proofpoint-GUID: JwSb4gAeKn-1Wu_Hdi1WX2Nft3SJ0Tr9
X-Authority-Analysis: v=2.4 cv=N+QZ0W9B c=1 sm=1 tr=0 ts=6a50b24b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fdZnArvSVwIb3KS3I78A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015022_285279_74645334 
X-CRM114-Status: GOOD (  19.45  )
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



On 7/10/2026 12:51 PM, Pei Xiao wrote:
> When the interrupt status register reads zero, the handler should
> return IRQ_NONE instead of IRQ_HANDLED. What the return value
> actually feeds into is the spurious interrupt accounting in
> note_interrupt(): falsely claiming IRQ_HANDLED defeats the "irq XX:
note_interrupt() ? You mean to say No interrupt OR invalid interrupt 
here ? I could not understand function name.
> nobody cared" detection, so a stuck interrupt source would never be
> caught.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
> changlog in v2:
> modify gitlog for Modify the incorrect Git commit message to match the reason for the modification.
> ---
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index c2d090f6ba80..487f23fde725 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -728,7 +728,7 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   
>   	status = readl(i2c->base + SPACEMIT_ISR);
>   	if (!status)
> -		return IRQ_HANDLED;
> +		return IRQ_NONE;
>   
>   	i2c->status = status;
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
