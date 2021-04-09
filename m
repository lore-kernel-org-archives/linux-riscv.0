Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32AC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:10:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC7061007
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC7061007
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cjU4yrRlrd/6rwpdyDunexABqYDqdj2yaY9u+BTUSqA=; b=ITGfiQ/P0q7BqXyCqApDndkAp
	mdaWzFWBdp0wsKuU/71DQ4maeqhiXvtNP/YceKw1zRmR3fFHdPVN+OrlvO+Ifkiyo/FpoRUAU9rdM
	AMGmZFEyenA5eLekQtJOK0bO1cFfsiPX/1XstkM4O0EmldvPx73ext/57lWIZ7DYLpRBtKWs15DBS
	Z/KS1yQzbunVW+ZC5HD27FAZ8SpW/3zQq52/Dc0zUQuWqHZEcla8Ji+gVmmUUP+vY8yp13dRf+dgQ
	kY7g4awdno/DqNpYQXb0F3z7QSwQo5lxLck6X8lBPbXapQcODrkTGMcgnKveFF1KrH2z1iUlmKflF
	DR7t2wKSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUrqQ-000t0X-FC; Fri, 09 Apr 2021 14:10:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrqO-000szs-Ta
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 14:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fN8GTHnYb6PRqQ8ffJiwICPF/MXTfgce0XDLBvAfLrY=; b=oLgEbD+4ob1etyOOyVadHGMGER
 dLUR77E438VWZQRE1Tu22JG2kNFfQAfS+Nw94YrdB2PZoPB3XZsRflA46N0j2qOg2ltCMPnOcH3+f
 n6Jb5HgogNNjKAokklBvD80xJLVVgfWBZcQCRnWVUL3N89sST+E+v/HFL3Jq8Z4tND/uK0HY9rGPN
 IwyhYO1JHQeI/vJsnLtb5xKx2OM3IGX6Z9KqF/JnWZ0vdcfLQZo5qspVlWZGa3e5YpPGWuK7rVkBP
 sNefBe7cG29HZ6QtAHaH4A0dtQfEqWwA2KkHb+p5Cq6+GPy5/NZo+aJMLFInd0vkNhNDjcxogZXXg
 FEFmC1OA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrqM-004Zfe-Fu
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 14:10:43 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139E3fpi034753; Fri, 9 Apr 2021 10:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=fN8GTHnYb6PRqQ8ffJiwICPF/MXTfgce0XDLBvAfLrY=;
 b=qTMmWpaGAV6p4XkfMNZbXLagL7zbtA4E/nApBkLo/R+FqXlOOUy306U0qnq3HpWHi3mY
 BF+yZVUbrarrXikNDZjDZYzut+1PE/cye7+x1Wv4acODPwde5pFfl0H2kGUQYntAEgnw
 zrIMC81Janjk9LdUU+u/t5n23mSLSXTM5/FSR17+uuH/KjFWCNnxPalY7aYfvapUFQaL
 DLL6sKD4/S8thET48PN+gY3421jY1SF60A2dzhMojx92il550BNcCwL32vzjZWK38sUj
 x2Qrxqf1ImMIn3RT2fVpeFlyyU7IcSarVkYpQcorkPbZCPOvsWLCf+sAuI4ECRfEePNi nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37tr2ngtkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 10:10:35 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 139E3npm035697;
 Fri, 9 Apr 2021 10:10:35 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37tr2ngtj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 10:10:34 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139E36Fk005937;
 Fri, 9 Apr 2021 14:10:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 37rvmq9bkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 14:10:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 139EA9Gx27525440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 14:10:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41B5C11C052;
 Fri,  9 Apr 2021 14:10:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00BBE11C05E;
 Fri,  9 Apr 2021 14:10:29 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.82.136])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  9 Apr 2021 14:10:28 +0000 (GMT)
Date: Fri, 9 Apr 2021 17:10:26 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH v7] RISC-V: enable XIP
Message-ID: <YHBgUs1JKvHWkG9F@linux.ibm.com>
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4d771a8-c731-acaf-b42d-44800c61f2e6@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QDSG-5_Koocokt--_7BVPuAJFHwl6ulJ
X-Proofpoint-ORIG-GUID: sjncEtCvmTJ6p6qYWrqpBBcwCjEXFVaB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_06:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=729
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_071042_583469_C5593E75 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Apr 09, 2021 at 02:07:24PM +0200, David Hildenbrand wrote:
> On 09.04.21 13:39, Alex Ghiti wrote:
> > Hi David,
> 
> I assume you still somehow create the direct mapping for the kernel, right?
> So it's really some memory region with a direct mapping but without a memmap
> (and right now, without a resource), correct?

XIP kernel text is not a region in memory to begin with ;-)

It resides in a flash and it is executed directly from there without being
relocated to RAM.

That's why it does not need neither direct mapping, nor struct pages.
 
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
