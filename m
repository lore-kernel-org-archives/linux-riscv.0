Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64322CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFDh75aXLLe8hdAlWq1dlQp+3w6921Ca92uuBjMmHWs=; b=tspUFDhvg7LAGm
	ahTTnExfFYg1jYv+IqKw5pI/c3mRCFQCU8Z1CPRJYKF5v2dzX3sYtphzXc6r6lyPdzaM34sETSgo6
	cxMDv+1ubbu6Z+RXU43BmQBeyjsAHSgG5VE76T30VZpo67ZuC6GhLCo15JELTBccCXziKRlDHjJD3
	8deO2SI7UcUUvvz0PEkyO4wTmqGe78ePJMzQkol5+bJTGQs1xFBtkdmCXb/+ub16I6h8ivURAkYKx
	Jv5xaJfLKxXnOf+LdmfrsmbLyWoD2gDfqr19KCwscuQ1uq0yn2HGFl0L1swP3+nbxKhFZsiuxB6oc
	YqEX/1eJOf4eqrGkmGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQaW-00000002feo-1lYT;
	Tue, 19 May 2026 19:58:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQaT-00000002feF-3gve
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 19:58:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExI9v2983950
	for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 19:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3rRvKyrfVr2+BEXQM+JTXfSy
	QCUSzpqv5pJm94aFtfA=; b=WgwZLRTVNm7jAaOBhP2wKIlY1IYb0MMgXkaIca3t
	fVf2dKyuP5VWQbcaiIiQkmgjMETFCDcbuGF3+Q5/gwkAwBw+WMg5TBEdnuQgFL81
	L4X36TGPJPBikDPst4WabEz/YmI5VMJWH7m+1OL9rNQ1/lsT2gn8siSZwpAOQhtu
	TOhPm1eCigI1VmRIq81aYh5soQC21P5GSDQL6CHGbruOaiwEM14K4IKfhxAQYOhw
	diteeD2kKraovMYKVXmCK1BikXufDBnujqkpLqY15I62IsRNGXpdiqoi3OHvUbnz
	AC5pKgJN0u1pLcjQZvB9rhlK8jm3GpVddsUEJGwIumowpw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t197q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 19:58:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2eebb099efbso16465190eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779220723; x=1779825523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3rRvKyrfVr2+BEXQM+JTXfSyQCUSzpqv5pJm94aFtfA=;
        b=I93OphY/T/GLvIOx0TKoMV6ewWRSGBg69fQ6Qgt9doYFiTPBiqLv+zCSR4APEcvwEH
         f8ePeKIV/ZAWk813J9x9G3pKAD3k1GwwZ2ibwfSUBz9nHMiRmvcNbZiF8KanS7K58Q8/
         S9qaqRKc0l6HMB8sGQqWFlYPowRVD1bDpTo2kR/eXL8Lz25OoXJI5Q+vokDXL7B0oCbm
         YBDyebu6A4aT149uWAXkbyLFekDid4YbrPt1W3Ird0rU54wWAsg9h4bDMe3cs6xcNyLu
         OoBzP3XLkKQ2QCX4qxFUjmQYrqrQIMhywTO2XfNBsjJoFVMcrunqxCBmlhV3E2J1ak/y
         K+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779220723; x=1779825523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rRvKyrfVr2+BEXQM+JTXfSyQCUSzpqv5pJm94aFtfA=;
        b=fi2Xqh7i9W1WVRVKb8aLZxpAS6mRAjbktIWyrOoM7OyWziDmvjHK8kRGa6K64EvMNc
         alPIxaP7QMh4axVWtdwDH2A4XModVm71fqAd+1uyyLlbeppmBeSZpwNTi10ldU5fmBu/
         P4wi3UAsconKwTvPqhuxMVf7fM0iGV2B24IUwo2LGcMj3SG7yv/M/hjOdtn3xwpINWY+
         4Bqf3w4EBKKHSf7BOxmSpPJlMjAN+5JgIKAsdrBRwhykWmdphLdG1Ka09qEKNXkdDYVn
         IcM70tALCe1Jec5cFiLc3RiSOh2Gr1iLyygtyR/0FbutIjdG6C2IRQQj1U4ADdlY67Qq
         HYeg==
X-Forwarded-Encrypted: i=1; AFNElJ/oAx/e5PzVEDl9RoQVKNzndRoW5sLMFojJv4HRxfy+7BPHc9iDvnRnhA6/dUY0/FY95jNBj3Vss//tdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFdbILsUGuGahGRbreXgqEsKqpN41fbqfdrVofNoa2RKmribDK
	vdnVXEJvrrbN2Bx0IP3a5p9RgrV04LGDCxjX42Cm0yH/S2r48Ugw76y35L1KuV/p8bGHq5pn3OX
	9zk/b1kHb2ORqAVtfBqKY53RIPDrqezVPd3tusc2fiwrjluSd6lEOOI3eaCB4LsBlrMvOa08=
X-Gm-Gg: Acq92OEXs6/k/1HpqFmAQSlUVGJUbl21k6YqJrBMFHLcW/UKxH7tJbb2KMKUlRC+aUK
	AKyN30e9LMa2OW58fS5dizh9CzwkRJmOEADc9FfnDIohijPgMFu3rikVnS+kHZka/ORJHqLyNFQ
	POJLdXTz2qWjGYTM8/caFxqpWZoKHXNoYBp0ahxnAxCnxt27h/eHQ+d4lKllosPDG0r69BT1KFq
	MSq0WAoAw58bR0B2Eaafjm819WtMInaFGBc89PVJeSdxarR3ODOSAuNz/ns5LZhHX1XG2emrkcC
	fMeMhJgk8EBwNVy6Scrq/eBwjoGa2Xxtl9gsyJRXzZnc5cbIloS2WtZEnka2hQJB+32AReKO6To
	BnWLgmwSSAvKmFAJlXWxqdTJAVMO4afw=
X-Received: by 2002:a05:693c:2c81:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-303986b16f4mr10458886eec.31.1779220723284;
        Tue, 19 May 2026 12:58:43 -0700 (PDT)
X-Received: by 2002:a05:693c:2c81:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-303986b16f4mr10458863eec.31.1779220722704;
        Tue, 19 May 2026 12:58:42 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm26093006c88.12.2026.05.19.12.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:58:42 -0700 (PDT)
Date: Tue, 19 May 2026 14:58:41 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        akpm@linux-foundation.org, pasha.tatashin@soleen.com,
        andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com,
        debug@rivosinc.com, baolin.wang@linux.alibaba.com,
        zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
        wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
        liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com,
        charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com,
        pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
Message-ID: <za6ihmyfohx35tt6kyja5yrfqf6xuwzu3sptkf3y24ccqodu7n@yh2vdsobszok>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519031927.70683-1-cuiyunhui@bytedance.com>
X-Authority-Analysis: v=2.4 cv=BOCDalQG c=1 sm=1 tr=0 ts=6a0cc0f3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=4tJTj4afH-7lSKzQSXoA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: h7FYx-iCZsw2gKhcBiFj7Mz9PS_p2nxP
X-Proofpoint-GUID: h7FYx-iCZsw2gKhcBiFj7Mz9PS_p2nxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5OSBTYWx0ZWRfXxkju9UpYqIik
 JOcxULMVPJFOVH3ipj35VIZr0faMy1URApQhBXEFdEm4zJ5PIIS2pz2K4575rGtbzZ+6+P55TBl
 aaWmmyRV9X0KrbbH2An47Tn0bTQpDF9ne5XFd6Egcu2EEyEQilKM93w39OYmIfrmnvQ4FlSCXu6
 9O63pO7CS6HoJFm5dx4U/sb2qC7ku6EWZlB+1M4ruIsiZi2WgFhR44M+2nkJZCo8RuXP+piCnZb
 jFmVRu/bhl6A9vkQWfH5OYC4F5c4vwFo0uHI2dUuUt4C8QXizintgpK5bXpAkQ2J0lFHbtMNxJj
 kND8s3EtdI5eKBD2KJ0kbQ0tymRLpb1BNdSk2Khe+ca60LG61WxU/IAoOWKmA9DVSlJzhTd4wC2
 PVJlPVkW66/y/awe4bFJFqKY9tokG442XsJkbW3bs0/vFzTcDokgxzLKpSaxVprZUWIzzzzjei/
 qLwnEaDETnJN6CFfFgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_125845_927689_1D5ED21A 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, May 19, 2026 at 11:19:26AM +0800, Yunhui Cui wrote:
> Platforms with Svadu but without Svade are treated as always using
> hardware PTE A/D updates.

This is correct, but I've become sensitive to the word 'always' after
recently reviewing the svadu spec. We should probably change the text in
Documentation/devicetree/bindings/riscv/extensions.yaml to something
like 'assume Svadu to be enabled at boot' because chapter 16 of the spec
states

"""
If the Svadu extension is implemented, the menvcfg.ADUE field is writable.
If the hypervisor extension is additionally implemented, the henvcfg.ADUE
field is also writable.
"""

So, if ADUE is writable then it cannot be hardwired to 1, which means it
can be written to zero. Then, in 3.1.18, we have

"""
When ADUE=0, the implementation behaves as though Svade were implemented
for S-mode and G-stage address translation.
"""

which means a spec-compliant system can never have svadu without svade.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
