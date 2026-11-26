Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDB5606A33B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 05:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dEkGz57y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=VDsx2Jou
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jz5M2qGzy9dqRX4EMbamRBOMqEnxpXRZGeRJFhrnNCQ=; b=dEkGz57yHC7pJ81hO6rE8gZiwY
	lo54/B1AylHgMMEuH1IyLevjWt7S22Gxm/CyEtTevwxWGfAToNK++381lluSvjzr8nCJNfIyqie8x
	ovIEnHZ2UOOfa5G/lilyHcleoJ1zoSu8yGSWBYjExLbMX+ssqchFdSeVB/ddNFJGWRmBnt4O8buaH
	5HEIlD3lMMIlImLcoZXjCONggz08MO0fSnaOGir44tp8g8i+rS9NOL1i69qaCYWOMrggu2YE9MH+E
	EPjm65CSawdrs6LAYlBHisnq8fdMG9dfCdiM/4RVety303eOp6EY9faWpzpzfdr6Y8dnq2xGfmIf3
	stZ1g29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRns-0000000C6hl-0uP3;
	Thu, 26 Nov 2026 05:13:52 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRnn-0000000C6gp-0sM9;
	Thu, 26 Nov 2026 05:13:50 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ47qpX281990;
	Wed, 25 Nov 2026 21:13:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=GlP/qnK7GaJomyX1u2X4fCGFzrkFFk/lafWQT
	IfuqaY=; b=VDsx2JouX6viH6G7jhEFHXf3pKttm227kzyrgiu5zEOTIDjvirBM4
	MrXaZ5SRXRkB21ZjZcsok8BXfCLiBFJDX56OC30clsKr3UXRW+F2RtzZIIFuXPvs
	yWNNdnb7GCmMlabkOcGk5ohbtcVPh3InWOXZJkmj3Nlz9ayYRSAe5LFHUWIPlBFn
	FFcOHXEXyXEaMG51XcpGxRGX2P70jGXC9aTcua8Evik/MtCNT+sscRF9lJtqKAZ3
	5zbani+hyE7x/CV0+AGwGO/el912T75Dlm5hOHvJPDsL8uZKDTyXuAHtcjAjVK2B
	9jpenEah5Y1COxmM5hyWkMZnv8+GDo1xw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j67ajhw47-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Nov 2026 21:13:22 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 26 Nov
 2026 05:13:21 +0000
From: Yann Collet <cyan@meta.com>
To: Ping Li <leeonion.muyu@gmail.com>
CC: Yann Collet <cyan@meta.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <palmer@dabbelt.com>, <pjw@kernel.org>, <mark.rutland@arm.com>,
        <alex@ghiti.fr>, <emil.renner.berthing@canonical.com>,
        <masahiroy@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-boot@lists.denx.de>
Subject: Re: [PATCH v2 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Wed, 25 Nov 2026 21:13:16 -0800
Message-ID: <20261126051316.1050992-1-cyan@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com> <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ZpN4uN7G c=1 sm=1 tr=0 ts=6b07bff2 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=VabnemYjAAAA:8 a=5IwbW6H4hVdjvO_v7jYA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXz8YNemU33ufO
 o5xBoDi3IvGzoOGdCZgLYA4RfCYbDMwD7Q5x5x10n25tIsxGfu0vPnXK54Pi+jk5jtFdo/r8/hP
 Wlpf/nCrdY+XvV9a+S6+hzxzOOTjVK+3qjnkg/x3Uz7FU8yqATpyL61Z5ryc1xvbwTyK9SgHJpD
 yjA6BWgJ2I3nHTn36TcDJZLXH3i/v6QVG1flpLib+dJMiT7r4iP2mguElNRzlFtC6gCB6xCNGIf
 kH1aIOX4W848OhExTyGUVptAG2vnTAMlE6ypM3EqJ18NLeK/Mz+bVLj6ewRV46056ROOI0l93Af
 GoL2co+5v//52pZ9hYixbxf5YHFhltG4JGEtFCOeQ3jkXWiQYcLaZI8NE/gv5/r8GyIpQR5EPtC
 C0vmmh+o8Mkdbrb80GsSHqDjiy8Y2HdS7hVqcyT7bRrmM+GxxGVfNxIqNvQ49yvYF+ZbGfuKq/8
 pEHacu9k3tO2Vly4QyA==
X-Proofpoint-GUID: I2XxeRX9jXjlTSIji9u4ZBPn-DT-v1wO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX3Qn1LInr7CSt
 nk3KkVmaNSHX0zsVso5Ex3vKbIOgZHIZnvbvoxfI/eOZ9dNQfLDbd++cPGe+BGlMAhSqecEZQLB
 nSBOVUqOfiTq0nLyrzfISM4DJbtzt7c=
X-Proofpoint-ORIG-GUID: I2XxeRX9jXjlTSIji9u4ZBPn-DT-v1wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211347_321328_7363C59C 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 11:02:31AM +0800, Ping Li wrote:
> Changes in v2:
> - Pass -BI so the blocks stay independent regardless of what the lz4
>   CLI defaults to in the future; deployed U-Boot decoders reject
>   linked blocks (suggested by Yann Collet).
> - -BI was introduced in lz4 v1.9.0 - older lz4 versions reject the
>   flag but already default to independent blocks, so the rule probes
>   for -BI support first.

Checked the new rule with lz4 1.8.3 (no -BI), 1.9.3 and 1.11.1 (-BI):
independent blocks in all cases, and the output round-trips.

For the series:

Reviewed-by: Yann Collet <cyan@meta.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
