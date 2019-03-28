Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35845C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 07:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070C32173C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 07:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6SAkU+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070C32173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wM1mCFh0yARdOVigVSNljHU0LlaVRqR6Kj4ukqi/QmQ=; b=R6SAkU+4UziTCS
	OsxeZ4A2z9I4Ng4xog/TjPAAJquOS87C/TYmuc3KzZeJcQ3ZBxax1ZUqZguyxGwGBozFVEO4wXMM6
	3FQCdJMECipIb9fx7geH9xr7fA2MrXZKPA/EM6KKXpxgig0gM6ZrOeke6t+5U8oJtqoX1pRLjVdEK
	L7M+2maSp/ic7ThOwoiF/NC/yZDfNK1/6kl/mjsClKRKKVMgeYEsu9j1N16A50pNVfOC69gVIa073
	qeJgSggmT+7CHjBWU2FbHEA/cxu/VwysfSq41HKSEvO+CSNkmFRXtiAjG/uIrM9MKmh49AfB9R0Sf
	P/7dpN7eL+hVLd6yGhKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Pt5-0007Fr-VJ; Thu, 28 Mar 2019 07:55:47 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Psz-0007EQ-5l
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 07:55:46 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2S7nkjN088904
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 03:55:36 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rgt4x8e4n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 03:55:36 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 28 Mar 2019 07:55:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 28 Mar 2019 07:55:30 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2S7tT4428377104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Mar 2019 07:55:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3364D4203F;
 Thu, 28 Mar 2019 07:55:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7391A42041;
 Thu, 28 Mar 2019 07:55:28 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.112])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Mar 2019 07:55:28 +0000 (GMT)
Date: Thu, 28 Mar 2019 09:55:26 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
 <20190327075441.GA29894@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190327075441.GA29894@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19032807-0012-0000-0000-000003083ADB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032807-0013-0000-0000-0000213F6AC0
Message-Id: <20190328075526.GC14864@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-28_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_005541_336417_5EC7C0A6 
X-CRM114-Status: GOOD (  23.94  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 12:54:41AM -0700, Christoph Hellwig wrote:
> On Mon, Mar 25, 2019 at 09:46:59PM +0530, Anup Patel wrote:
> > > Why do you even care about kernel mappings for non-existant ram.
> > 
> > We care because there will always be some buggy kernel driver/code going
> > out-of-bound and accessing non-existent RAM. If we by default map all
> > possible kernel virtual address then behaviour of buggy accesses will be
> > unpredictable.
> > 
> > Further, I think we should also make .text and .rodata sections of kernel
> > as read-only. This will protect kernel code and rodata.
> 
> All of that is useful at the final_setup_vm() time - but none of it
> matters during early setup_vm where life is complicated.
> 
> Mike suggested on the previous iteration that you only do smaller
> mappings when setting up the final mapping to avoid the ops churn,
> and I fully agree with him. 
> 
> So I would suggest we avoid complicated the fiddly early boot changes
> that just add complxity, and you instead redirect your efforts to
> say implemented proper ro and non-executable sections using 4k mappings
> in the final VM setup only.  That should actuall lead to less code
> and complexity, and provide more benefits.

It might be worth keeping trampoline_pg_dir if we are to split setup_vm().
Then setup_vm() will only initialize the trampoline_pg_dir and
final_setup_vm() will setup the swapper_pg_dir and switch to it.
Otherwise final_setup_vm() would need to update live mappings which might
be fragile.

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
