Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BFACD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1JKdaDwPPF3dNTuwAhbZTq7gNJWWXq6JMArUUZdBeY=; b=RsjrrM35885Ffy
	1gGShf/T/7p62ex/80sU9T2qNqFGcfpB5DeqAvNNMt8aTOBH3od/OeW6obNL/jMlQpMG4svtrANq+
	AFl/MqIH6HdvrpxR2HoHNZx5ZzXPRmDn0wYXfpsb4VDDdnSKdL5vpZqYbvkAahBQlDybk+lWfqQIb
	UIGTaA0I9ybSTvqmKDbNHSSrmWr5cbTvJ6LDrZSgFJApIGw7XANqwY51MCPkfxeeaC0fQCIAb4UFn
	1SsSvm18e8+bOaAplwEvDTioWI75zaJSsWzu3esWURLIEHQuqLnSNjA229qxjcWQlu3w16SY8B8H8
	VnM0zDAM5Cb811LDnplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtWBg-0000000D8Ez-2NsY;
	Sun, 07 Apr 2024 17:20:12 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtWBc-0000000D8Dx-2t0f;
	Sun, 07 Apr 2024 17:20:09 +0000
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 437GxAvB025509;
	Sun, 7 Apr 2024 17:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=F86vIyT96NLScE6Zk6mOrLIIbnCvATnEMB/X/BdWurM=;
 b=Vy+JfL7+GdlmHij4DY9+FF6bZBGKIzybu3H9TGxNhGMOiNojOX6vU1kcZiUile2ZWzzj
 xdBoUwoyOtYP6C2NH8E73yzr2geuDlQWgZsDTp5+Iatp3+IrlT56kZKLZgVECtOMYtPR
 LkTDs7Vdk/Yc3lJ1Mhn4FEZpQa9kh78F+6mul9elFYjbxv3mkUAXeNoCQwKRAvQioEsg
 vgXqRrAovajP2pMj78xg4rCIrdAvqZLlapXXlRbIUAU2z5zYjzt5z1bvp1jNwpY6p5vk
 Fclj73uOz2kJ1MmHrqV2Io+jRhoaAhECrFGmyWtX2RAlax5j2OLWRZiZvB7LbEkaYT1J Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbyf4r11k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:12 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 437HJBOd027129;
	Sun, 7 Apr 2024 17:19:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xbyf4r11d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:11 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 437EiDmP021485;
	Sun, 7 Apr 2024 17:19:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbjxkb7y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Apr 2024 17:19:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 437HJ5ah37552504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Apr 2024 17:19:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2FE620049;
	Sun,  7 Apr 2024 17:19:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C46CC20040;
	Sun,  7 Apr 2024 17:19:03 +0000 (GMT)
Received: from osiris (unknown [9.179.2.159])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun,  7 Apr 2024 17:19:03 +0000 (GMT)
Date: Sun, 7 Apr 2024 19:19:02 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        surenb@google.com, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when badaccess
Message-ID: <20240407171902.5958-A-hca@linux.ibm.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
 <4d45fffc-877a-4ad1-ad02-a33341e467e7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d45fffc-877a-4ad1-ad02-a33341e467e7@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y3MmKFoPZYTA6URYFqSoHvL5OT_14Ypp
X-Proofpoint-ORIG-GUID: Ts9vZ863gBFIi5c6rKKJKZ5ZbhTxcstc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-07_11,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=950 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404070139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_102008_746605_ACE19927 
X-CRM114-Status: GOOD (  22.38  )
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

On Sun, Apr 07, 2024 at 03:49:53PM +0800, Kefeng Wang wrote:
> On 2024/4/4 4:45, Andrew Morton wrote:
> > On Wed, 3 Apr 2024 16:37:58 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> > 
> > > After VMA lock-based page fault handling enabled, if bad access met
> > > under per-vma lock, it will fallback to mmap_lock-based handling,
> > > so it leads to unnessary mmap lock and vma find again. A test from
> > > lmbench shows 34% improve after this changes on arm64,
> > > 
> > >    lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198
> > > 
> > > Only build test on other archs except arm64.
> > 
> > Thanks.  So we now want a bunch of architectures to runtime test this.  Do
> > we have a selftest in place which will adequately do this?
> 
> I don't find such selftest, and badaccess would lead to coredump, the
> performance should not affect most scene, so no selftest is acceptable.
> lmbench is easy to use to measure the performance.

The rationale for this series (performance improvement) is a bit odd,
since I would expect that the changed code is usually never executed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
