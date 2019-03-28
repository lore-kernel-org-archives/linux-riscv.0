Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E702AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 11:49:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B669A20700
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 11:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GuHfBIj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B669A20700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djZYca+macm0CN8cETVCmP4lnYfELM+GqzYwUAkTbXc=; b=GuHfBIj3599BaH
	i9p0NJ5VzPt3LLw4E+H/UWHvfGbxykcp2JI0fnWOCxNiO8vFXhmNV3hycj2MMiZ4n11vcFHF2TmAj
	dpl1ZjA/eY4O5hk0/pFNZ981JrLA3tu6LXUjJYV+qVsca9Yzbvbau35+f5sY3zXxd+52fajj/9cVS
	zLzw2ND+Elt7Vs4He9WoFvelmrXrlfKOuo3iX2ndC6Yp68jgHnw7fJw4xTMaKqK8t02CGXSa2mkfJ
	X1srDuOtVk2ZFTtIHEoI62dLIoUdTXEqgYfJGVZcNLhoO1G35L1grQrQ47BITDfTvmex74s3kTz2w
	7ZMHAy54rYyPMcd5XbCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9TXR-0005w4-5I; Thu, 28 Mar 2019 11:49:41 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9TXM-0005ch-47
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 11:49:39 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2SBYKlT031831
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 07:49:34 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rgvtntkun-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 07:49:34 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 28 Mar 2019 11:49:32 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Mar 2019 11:49:28 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2SBnRYN38207632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Mar 2019 11:49:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259E2AE045;
 Thu, 28 Mar 2019 11:49:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72F92AE04D;
 Thu, 28 Mar 2019 11:49:26 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.112])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Mar 2019 11:49:26 +0000 (GMT)
Date: Thu, 28 Mar 2019 13:49:24 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/7] RISC-V: doc: Add file describing the virtual memory
 map
References: <20190327213643.23789-1-logang@deltatee.com>
 <20190327213643.23789-3-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190327213643.23789-3-logang@deltatee.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032811-0016-0000-0000-000002686884
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032811-0017-0000-0000-000032C3AAF6
Message-Id: <20190328114924.GD14864@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903280084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_044936_277606_1C6635C3 
X-CRM114-Status: GOOD (  25.41  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Mar 27, 2019 at 03:36:38PM -0600, Logan Gunthorpe wrote:
> This file is similar to the x86_64 equivalent (in
> Documentation/x86/x86_64/mm.txt) and describes the virtuas address space
> usage for RISC-V.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  Documentation/riscv/mm.txt | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/riscv/mm.txt
> 
> diff --git a/Documentation/riscv/mm.txt b/Documentation/riscv/mm.txt
> new file mode 100644
> index 000000000000..725dc85f2c65
> --- /dev/null
> +++ b/Documentation/riscv/mm.txt
> @@ -0,0 +1,24 @@
> +Sv32:
> +
> +00000000 - 7fffffff   user space, different per mm (2G)
> +80000000 - 81ffffff   virtual memory map (32MB)
> +82000000 - bfffffff   vmalloc/ioremap space (1GB - 32MB)
> +c0000000 - ffffffff   direct mapping of lower phys. memory (1GB)
> +
> +Sv39:
> +
> +0000000000000000 - 0000003fffffffff  user space, different per mm (256GB)
> +hole caused by [38:63] sign extension
> +ffffffc000000000 - ffffffc0ffffffff  virtual memory map (4GB)
> +ffffffc100000000 - ffffffd0ffffffff  vmalloc/ioremap spac (64GB)
> +ffffffd100000000 - ffffffffffffffff  linear mapping of physical space (188GB)
> +  ffffffd200000000 - 0xfffffff200000000 linear mapping of all physical memory
> +
> +The RISC-V architecture defines virtual address bits in multiples of nine
> +starting from 39. These are referred to as Sv39, Sv48, Sv57 and Sv64.
> +Currently only Sv39 is supported. Bits 63 through to the most-significant
> +implemented bit are sign extended. This causes a hole between user space
> +and kernel addresses if you interpret them as unsigned.
> +
> +The direct mapping covers as much of the physical memory space as
> +possible so that it may cover some IO memory.

Please move the text before the tables, so that meaning of Sv32 and Sv39
would be clear.

> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
