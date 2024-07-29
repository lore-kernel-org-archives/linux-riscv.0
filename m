Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4E6C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E78JIVF67cGR20ZVJ9D0VyZ+/RfnZklGYfYOZsTPaQ=; b=VIcKEXm/qMI1Vn
	tRdCn0MyA27mXle2+AK5YBFJNgs5itOJIZn+g4Jo7yl++Jwr2UJHN3fKCOdaIXKu/oR/QyBiVII+8
	tb45iC1FhGTBVGCQOE6e8OAvGneUqNMc9dpj8k6BPR/125pmwxF7+Ijh7JcJgpl3G8qsMLJz3fjhD
	H6j41AjNycdDMDYKTxgLtNawBNghEwuuqxc1ICmGidpK8R5pA5kkIqpjsyr6uU+QMB8KgSD3uJ9AU
	YmZdVGgE6IDuqekqYje7cSJ+il27mxPwmZ1fABX1qbbwEEJlOq0bL+ToUAwiCyPwTZ43o9gy+xNEP
	qRKY2tn//ufEidbbPWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLkx-0000000AY2p-2FA4;
	Mon, 29 Jul 2024 08:29:23 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLkW-0000000AXwm-2cAH;
	Mon, 29 Jul 2024 08:28:58 +0000
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T5lmAm022522;
	Mon, 29 Jul 2024 08:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	j8aSvM5c0U5e8+c0U5FZ/H+W5Oq37NGrCmQ7dwBTMt8=; b=K07xeRmBmXNW3OKV
	ou5+xS47PHAo3UUjTTWkxEh3OCJm+8l0BlP+WUUS5cO/IyCS5l1lMEyWZj4UbgTb
	ukIvz9ntSs8D96T0wXAN8d5NKgxH6ldNRhlRdOz0dO1eKMFZpIaJpNPeXgAvt2dk
	/jZCB2oTGE6olCnxcfdSWocOOiLx2LhuDu114SGHHEDu1ZMRuyfKHHww//bR6N4F
	yyOZrn2RG22OuvoAUgLKgsvmb7vLJaPNJErEoXCtG1lW2aaU/qLhWm+h9uuZlkGT
	U9vaFQmgpbibBrQc8J08irxBGgNVfX9NG8m8/a402k9k9q4Y+YQRr7LYpuJJYj+V
	5u1wAQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40mputc9j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 08:28:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46T80Af6003856;
	Mon, 29 Jul 2024 08:28:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndem5ckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 08:28:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46T8SaSv51773812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2024 08:28:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98BF720040;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB172004F;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jul 2024 08:28:36 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.0.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 88C7360245;
	Mon, 29 Jul 2024 18:28:28 +1000 (AEST)
Message-ID: <6fb5918a9a56b3e459055025f3b7b25e6d0d3247.camel@linux.ibm.com>
Subject: Re: [PATCH v12 00/11] Support page table check PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Cc: "x86@kernel.org" <x86@kernel.org>,
        "christophe.leroy@csgroup.eu"
	 <christophe.leroy@csgroup.eu>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-riscv@lists.infradead.org"
	 <linux-riscv@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 29 Jul 2024 18:27:55 +1000
In-Reply-To: <ab298f1f-2c99-40eb-b5ba-13f3ac9260a9@cs-soprasteria.com>
References: <20240402051154.476244-1-rmclure@linux.ibm.com>
	 <ab298f1f-2c99-40eb-b5ba-13f3ac9260a9@cs-soprasteria.com>
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ky4T8G8i_WE-rFM0yd5Xro-fFvHA9kMA
X-Proofpoint-GUID: Ky4T8G8i_WE-rFM0yd5Xro-fFvHA9kMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_06,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=630 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407290053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_012856_789271_9EA5946F 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, 2024-06-18 at 13:09 +0000, LEROY Christophe wrote
> 
> Seems like this series doesn't apply, patch 1 has conflict with
> RISCV, 
> patch 2 with mm and RISCV.
> 
> Please rebase as appropriate.

As you've probably gathered from the mailer-daemon failure notice I
assume you probably received, Rohan has sadly moved on to other things.
I'll send a rebased version of this when I get the chance.

Andrew

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
