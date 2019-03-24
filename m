Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC622C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 16:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE5B2087E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 16:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T8iEeRlb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE5B2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9NpVQkdOpT5X9ETF+0gy9B481LxGVplfkVVEnJOsEI=; b=T8iEeRlb0gSV5E
	FJfJV/18M/AlYt6nLBONUcvrkRs92nMOt3NacUBi3Or7Yuw/eGg0z8pPBV+lmD56+GUV13AvOY9+U
	FgkI649qSk1Tykb0Lw3cyq/aa2RKqJgkWPg34TLKZixe6YG2Sqp1NDdlZx/6dkWvLGnLcWSlghRxK
	DESl3dfU82r9SoRebDku2ZYq/jEr8eMaSz5WQ3ZCvaX5I6UpmTzo6HCzzvLICYOyJ6gy9KDMcetju
	vyvSNaqDzVPw3NH5HAVPxYKPB4fqleM7YaW49Fx+wCcT4B1Lm9iQVxCN1CS0T5UagnhXXpHfyL6PJ
	MnB5X1j422AIlvotxWfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h86Dg-0007Qq-J5; Sun, 24 Mar 2019 16:43:36 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h86Da-0007HB-WE
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 16:43:33 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2OGd37R163466
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 12:43:29 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2recw61n4q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 12:43:29 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Sun, 24 Mar 2019 16:43:27 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 24 Mar 2019 16:43:23 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2OGhM8U38010966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 24 Mar 2019 16:43:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F31642041;
 Sun, 24 Mar 2019 16:43:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E5E04203F;
 Sun, 24 Mar 2019 16:43:21 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sun, 24 Mar 2019 16:43:21 +0000 (GMT)
Date: Sun, 24 Mar 2019 18:43:17 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] RISC-V: Always compile mm/init.c with cmodel=medany
References: <20190324110804.68555-1-anup.patel@wdc.com>
 <20190324145708.GA3355@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190324145708.GA3355@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032416-4275-0000-0000-0000031EB317
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032416-4276-0000-0000-0000382D429A
Message-Id: <20190324164316.GA2925@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903240128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_094331_393657_64B9F575 
X-CRM114-Status: GOOD (  19.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 03:57:08PM +0100, Christoph Hellwig wrote:
> On Sun, Mar 24, 2019 at 11:08:29AM +0000, Anup Patel wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Huh?  I don't think this is from Mike and me.

Suggested-by: would me more appropriate indeed :)
 
> > +unsigned long va_pa_offset;
> > +EXPORT_SYMBOL(va_pa_offset);
> > +unsigned long pfn_base;
> > +EXPORT_SYMBOL(pfn_base);
> 
> Can you move va_pa_offset and pfn_base next to the swapper_pg_dir
> declaration?  Thats where I move them in my current nommu patchset,
> as that allows to just have a single CONFIG_NOMMU in mm/init.c.
> 
> Otherwise this looks fine to me.
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
