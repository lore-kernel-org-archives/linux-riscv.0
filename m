Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79037C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWV5uVZ2ZGZ0naOb9c1fhBlV+zJ4uZPKmDftNjX5+/A=; b=vL9TNSlzMJfofW
	X25hhVlzxl0htubTCodYiORrsXcuDMTQiOIlc4JUKQ5jL44Isi9f7+dRFaQazG14HHYbiohrb0tfu
	MVv07BivTYWDsd+F38m7lFeIO+liXhvuzTgmwohatJAzHveWmsHz62QGXLFbJsAyjJyEp4T0cOAl6
	qlmdCOdbl1t3ltKLhAu5LqOrp7F8ZCbwYY/U8405V4BYZ+K5+FRxlOOPM98zXYVhO1f+LgT3IfteQ
	Ll4FeOKGc1U5VGL362e6HVc+QthqB6O+gwVi7IVQeG5b2xgXKn7ZmfdeSnDxh6VJyiySECgOhH2KY
	/zpX7rBRrcIR6yOpDUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5ja0-002iTh-TV; Fri, 07 Jan 2022 07:22:28 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5jZy-002iSm-AH
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 07:22:28 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20756Xbs011438; 
 Fri, 7 Jan 2022 07:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=vEkORE+Epga5s7ASjVd+4jgI0LEIOYrUZHM9uSEuFS4=;
 b=AtY/muleo+xSFpG6X+/Qts7oPrSBNHVz6kRu78nlQUj/NKgkvchx1PfVctrHZYpzqA3r
 LsneJD6mu3wXvlwkU0QRE1Cx6xg7cYU/38OYxEMzW6SEA3j8fm9BMT3ZymXeN9SyU+w2
 G5oq+aQ6FPktL0MaHhd0eqpU/n/EqwVHZeduLLzjLuo3nnZI8kwkSCWrjxH92IutQtyg
 jLoM9/AlHZnso8Pn2fxpikdkGOdL1SFHU1mYEx7GsvkKI0n8mganA9PNzO63QjRAiSs/
 CJh3SXJjnHlpkmdph1jK2bVyyCr0MdvX13x2lV3G9vdc4rHpqz91HMI9XF64AxnRFuAs +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y7u30f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:21:47 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2076qs9i009364;
 Fri, 7 Jan 2022 07:21:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y7u2yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:21:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2077CAqg018540;
 Fri, 7 Jan 2022 07:21:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3de5gfupb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 07:21:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2077LgvQ39125256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 07:21:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CF7A4C05A;
 Fri,  7 Jan 2022 07:21:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B09C4C04E;
 Fri,  7 Jan 2022 07:21:41 +0000 (GMT)
Received: from sig-9-145-3-155.uk.ibm.com (unknown [9.145.3.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 07:21:41 +0000 (GMT)
Message-ID: <64d4b0d66379affd59c5a24ddb71a8f208330362.camel@linux.ibm.com>
Subject: Re: [RFC 00/32] Kconfig: Introduce HAS_IOPORT and LEGACY_PCI options
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: John Garry <john.garry@huawei.com>, Arnd Bergmann <arnd@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Date: Fri, 07 Jan 2022 08:21:41 +0100
In-Reply-To: <00c5a9e2-1876-e8d1-68f3-2be6d3bd38cb@huawei.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <00c5a9e2-1876-e8d1-68f3-2be6d3bd38cb@huawei.com>
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cynwMk4apZ0bHAkiwK6hO9RNLLeiN4I_
X-Proofpoint-ORIG-GUID: jonzyFcjLIyJ-g8t0bSxk_jRV-DRUS3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_01,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=936 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_232226_647109_34F7EC6E 
X-CRM114-Status: GOOD (  21.82  )
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

On Thu, 2022-01-06 at 17:45 +0000, John Garry wrote:
> Hi Niklas,
> 
> On 27/12/2021 16:42, Niklas Schnelle wrote:
> > I performed the following testing:
> > 
> > - On s390 this series on top of v5.16-rc7 builds with allyesconfig i.e. the
> >    HAS_IOPORT=n case.
> 
> Are you sure that allyesconfig gives HAS_IOPORT=n? Indeed I see no 
> mechanism is always disallow HAS_IOPORT for s390 (which I think we would 
> want).
> 
> > It also builds with defconfig and the resulting kernel
> >    appears fully functional including tests with PCI devices.
> 
> Thanks,
> Johnw
> 

I checked again by adding

config HAS_IOPORT
       def_bool n

in arch/s390/Kconfig and that doesn't seem to make a difference,
allyesconfig builds all the same. Also checked for CONFIG_HAS_IOPORT in
my .config and that isn't listed with or without the above addition.

I think this is because without a help text there is no "config
question" and thus nothing that allyesconfig would set to yes. I do
agree though that it's better to be explicit and add the above to those
Kconfigs that don't support HAS_IOPORT.
Thanks,
Niklas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
