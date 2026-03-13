Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9F3105F7AE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rel4r2CoNHfH5mcABORXSiQ2M6cSAJPcG8f8/7LrebE=; b=0LZ+MDMpFytuhs
	0teYZhIt5lqKj2rmQQHYvqveJr9GnbeyFbNAcGoBaWeXHKCO8nYOpv8WC4esQMP+IDW4unsX6juQl
	BLFu9Qzsjpp9ucekpzsWrix2/Paz8JWGEWHCyDEkOTpEilz0AL24sZaaWOcX4hMVqtoJMdHWor+Hv
	OegfIS9Ig6ulGR1Bg32OELtZiMEUJE+7j5Xi1b6wpb1kiWNdagZ10K5DVe2tgOyhjRegCcbLzeZE4
	yKXs5W4lSKbLJ7m5+6CdrU4S71cO5R/36gIzUUPuloFX5I4FrwPOscvurRAY2gG5sUND3c3k+mJlO
	ljHuceaX8FHpXKrg+1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13PF-00000000Ncm-315D;
	Fri, 13 Mar 2026 14:22:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13PC-00000000Na0-0h3u
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:22:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8vBYf481521
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=; b=csiaSIRJZfSYLPYA
	OrDIRC1jhNz96DNbH4FgjgNtXEk06/yjZyfbyDL8yH+010LGfAbN/1SJ3/Po24YE
	HHlDtbCDvHuxPyoZitbxXcFzqaEzrCFwcNcf3oJGiS4HNZaZC95RC/CVRzgSSrxL
	n+e3yegRuYAVPYp6fvqm4RDOmCoDhdhByr8kx2p9eOBCYHzb/sQhogV42oFLU8z3
	W60tQTewvGrjRV+dmK0/cKLFk8fGCQr2uWD39SmQM3gXripaRMy6ucknAoHYm6CQ
	2UaZksqdljY5jERkLaXws6E57GU7ooZqzWtRe5wlcCO4Uy/dLoO1eWCrs3RAWtxg
	Ou1FSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7s394-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:22:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd91c0262fso1483894885a.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411740; x=1774016540; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=IkS2BOE7vkq5RFi0pRuV4QWzmBQZxci3aCRbk9GX/UHN7jWoPAgSAjjsBkCVUqwlKm
         ELFT7XrNLpmIZ9SJsXzE0JYGdCbGzBkkPGIErJEwzRPtQSHxA687UUfYS31F2dn+MmW+
         teqeH0BlDDNSLyPmEEXrMb/zvG7ydkivTH8zc/l4T0jMy8Dek5PJlWkIE7KPXGJzqRZh
         SI0nyUVEDRc5f2Z3OJ9KG8ru+4WjV8LBbKFpAR7gFzfxVfI9sWnjZUbJOj9GAYav1n5m
         +P7IpNA/Zhpqzck6KrvmB6hP04DNXjukqJYuyyjrEnPOUiRKAb78zWVwx9Wc/oZJmcel
         3fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411740; x=1774016540;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=FGut7Xb7Sy7EgiDlkbR2+bWPgYN6IzmRvTVuVODqCBZDC7xAqBMgmGPY3IFuFZkznd
         vU8NWaE1l9yqMEe19r+3mSam6ERd3vbl0wEo4Sf2oGyn6+v1ONmzgxaSLZo+CQipGYuf
         hKhSfaFMiIv1xr2vvV+2XJhVAfodc+LBdgrH2tmsqmnUwM497jt7ggZzETzMuowvH2nD
         sPqLfkuHVVDLT4J1s/Ub1kLmNXou835PCshsf1MmPq1zXm20rBvfBhquESm7LV9lPY3h
         hYxups7XUrfHItglYg6md01/wuZKW+dlM6uF/+nApWrUxlmKFRhY/0HnANxw1lIdQcLh
         /pDA==
X-Forwarded-Encrypted: i=1; AJvYcCVFHQ/i0IxwffpDNt/s/vrp20gdwFmFjpRvO1dXUJkN9MxWxZTbYdBEqR4eS0USH47mu5wtZePiLC/h3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe98jiCjlJrT4L1TD88DSaVX9pKnvCwE3JLkUfngiK3IvxhENB
	9uMqAQb0TnPURWhZHvTyVEniVD2+9KKmodRO3STeArqmUlhUE4KyQptQKXRzJ8cnvH0JkUtEMn+
	98sHGTmfhiTKgvjwQXl1rcsLT/PmZiRVgFwCJYJM7FfWlJBZqMmzR2+oldU1DX3VkD9wsLis=
X-Gm-Gg: ATEYQzzKRUe5e5J8Qbxfz8DwA7KOOF/tjIVSyqnQHXaa3s3V0p0njbMF2MNNVlzPF/T
	H8V+Qrlr5yrPrLFdiTsJDcPGNb3CvAGX/Hr1BjjM96ipK2FUkvIpW75FHQ5l/H3QbY1c9939Z0n
	AJVmQf1hOOi9j9+MetsUFD90PNWbmbnam8pSkWcF2WbCEIEQYWi5jqRjFPdfOZnISqghsqPY0iy
	LYa3kK1Npf5EC7EgELk9Lekm8vCW6rno5VrIgwVBFCATjXC/i7mw2el6GDydD82MB3mhMeDsjOk
	FMChGtvzdnANut8VnVBxa4wIE5UgBpy2jj43OGSKAZNWhWDTlgg0Qi/8OwtJVefF1aDXk5XKpwb
	p6ew9SNaj+c6ASnvblsvKKN3IF4LJUYYgYmD9I/IplmM/wWQbpoqZXm/TRj2I
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328969185a.38.1773411740463;
        Fri, 13 Mar 2026 07:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328963685a.38.1773411739954;
        Fri, 13 Mar 2026 07:22:19 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a73494sm25547505e9.13.2026.03.13.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:22:18 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 15:22:17 +0100
Message-Id: <DH1PZT7KCZE2.1LC6II43GX0XT@oss.qualcomm.com>
Subject: Re: [PATCH 04/27] RISC-V: KVM: Introduce common
 kvm_riscv_isa_check_host()
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pJiED5mRzQ9onNK5Agu_PBaO4hZ-nGHs
X-Proofpoint-GUID: pJiED5mRzQ9onNK5Agu_PBaO4hZ-nGHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNCBTYWx0ZWRfX8ProNfJRjiPh
 l6Nl6qS5Opr1fx6EuxVKaR6vjXse+l21J5mDmQKA/eGGsneEqlQHHL7XiORPikM1HWX5Szg5/wu
 J4NKR2JiIz/2/nqUGwZ/lnm+xDyHHovUHPVVZHxuy/OpFWp/o2nvYnTdQV/nxowdVNzOlILyThF
 kTcmfXK/sERgx1+kUEguLc6G0yFYbfzadHPlhPEwgSLv1RdDWV/z8M6srjbCRiRXr5qxUYWpF9r
 3/GMlfCGjj4hUwucaT8Z5p6Vrb+ABmnQEmF/Ded/TWB5ebupzQSUIZhXbT3GAzhJancOcqTVa+t
 gZXZmucFG7QHYbKBRGVG36iCbiocqnORqbsmICISsbD9jeeL9c/d4IivSEgZF7V4WgX40AsFOJq
 ZCq6gz3ZqL7UutixCi9OOYEWcKxoocZy8f/fZPFLEXvz9rGHjNOsMPZHbh9Fhg19MBAdBCW1XtL
 VZC3S3HFNEkAOVrK/Rw==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b41d9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_072222_322762_5A90FBB1 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjAyNi0wMS0yMFQxMzoyOTo1MCswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBSZW5hbWUga3ZtX3Jpc2N2X3ZjcHVfaXNhX2NoZWNrX2hvc3QoKSB0byBr
dm1fcmlzY3ZfaXNhX2NoZWNrX2hvc3QoKQo+IGFuZCB1c2UgaXQgYXMgY29tbW9uIGZ1bmN0aW9u
IHdpdGggS1ZNIFJJU0MtViB0byBjaGVjayBpc2EgZXh0ZW5zaW9ucwo+IHN1cHBvcnRlZCBieSBo
b3N0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNv
bW0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFy
QG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
