Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7BCC83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 02:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVkJEQso47kkyWjeWvNc0mCJTJs9DFkS730WXIMNf94=; b=B4mzMniR3Yp0/Y
	/N5iNRT/R4a9I1i8f1kRTRv8xyTG9/AtFO7VAompXub00DRnRwMq2CRUIcVk7OGlhGuGCwXtpPWPS
	BeqgOyGT05siPOm5wRneq2Q2NqEnJZ8xqAINvwEouUTBIx4BXwpzlGSSJywCbGRyqnSoDhgUwh4Aq
	EHgRVT6oTS5jddeGwS9p5paDxrz/pCeydbkEoqc0KFz9sKzuJX+3v+lxh5+Hgr2wwX5Ujx98zpQTf
	6D9AktyNLAToTZ6tsjPib8XHqq8MXwP+2HpZ9dL3nZXu3k/4p2ZUqm0yb3B8ATLgGKbBVx+t4Dpun
	Dbj+Y1h9Wc7A1TR8TeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaos9-00Af6F-1q;
	Tue, 29 Aug 2023 02:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaos2-00Af5J-2G;
	Tue, 29 Aug 2023 02:54:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T2NYix025517;
	Tue, 29 Aug 2023 02:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cKhR/hXI9TfQVMxJKBEpbKXuPkzD/6c5MCP4RSxTLCw=;
 b=aJjaitgE+MNEcv6pStestGm3ovNl2PCHIDgAS0ezUu1PJhWjiVAJkaWbVdyPPMxXqeuv
 J8TGIrU+0GAuxQX7eIIapM8gHoJ/i/+3Lg86ilvRhCdks0OYIgvIXDu+m1F9qvPig1n9
 qmaPZSttzxHapTHsQhqj+8ez1Mh6AU41gyUZuYSjEw/M6ix2alFl2clZcq2fzw9TRV8m
 T3VdqIsiJZXsGkuNzRqG8q7Wyez0X9VKsY1Jq2v4Bt+32v5og2RtpbTDAMPn6awuDbIF
 bXfmOhB1JZWgA6QKAkE/ndq/tn0aSh7gBLV6EKEnJxvPb+roMqUGXj3Ar6OaLs3F+VbY DQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss7mer1wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 02:53:30 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37T2rTft030498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 02:53:29 GMT
Received: from [10.110.29.109] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 19:53:26 -0700
Message-ID: <253965df-6d80-bbfd-ab01-f9e69b274bf3@quicinc.com>
Date: Mon, 28 Aug 2023 19:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Content-Language: en-US
To: Ackerley Tng <ackerleytng@google.com>,
        Sean Christopherson
	<seanjc@google.com>
CC: <pbonzini@redhat.com>, <maz@kernel.org>, <oliver.upton@linux.dev>,
        <chenhuacai@kernel.org>, <mpe@ellerman.id.au>, <anup@brainfault.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <willy@infradead.org>,
        <akpm@linux-foundation.org>, <paul@paul-moore.com>,
        <jmorris@namei.org>, <serge@hallyn.com>, <kvm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
        <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-security-module@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chao.p.peng@linux.intel.com>,
        <tabba@google.com>, <jarkko@kernel.org>, <yu.c.zhang@linux.intel.com>,
        <vannapurve@google.com>, <mail@maciej.szmigiero.name>,
        <vbabka@suse.cz>, <david@redhat.com>, <qperret@google.com>,
        <michael.roth@amd.com>, <wei.w.wang@intel.com>,
        <liam.merwick@oracle.com>, <isaku.yamahata@gmail.com>,
        <kirill.shutemov@linux.intel.com>
References: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
From: Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j_S7WCFYaAduXo62GgrPKoDWB6xd2scP
X-Proofpoint-GUID: j_S7WCFYaAduXo62GgrPKoDWB6xd2scP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_20,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308290024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_195423_423878_43DDA30B 
X-CRM114-Status: GOOD (  24.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/28/2023 3:56 PM, Ackerley Tng wrote:
 > 1. Since the physical memory's representation is the inode and should be
 >     coupled to the virtual machine (as a concept, not struct kvm), should
 >     the binding/coupling be with the file, or the inode?
 >

I've been working on Gunyah's implementation in parallel (not yet posted 
anywhere). Thus far, I've coupled the virtual machine struct to the 
struct file so that I can increment the file refcount when mapping the 
gmem to the virtual machine.

 > 2. Should struct kvm still be bound to the file/inode at gmem file
 >     creation time, since
 >
 >     + struct kvm isn't a good representation of a "virtual machine"
 >     + we currently don't have anything that really represents a "virtual
 >       machine" without hardware support
 >
 >
 > I'd also like to bring up another userspace use case that Google has:
 > re-use of gmem files for rebooting guests when the KVM instance is
 > destroyed and rebuilt.
 >
 > When rebooting a VM there are some steps relating to gmem that are
 > performance-sensitive:
 >
 > a.      Zeroing pages from the old VM when we close a gmem file/inode
 > b. Deallocating pages from the old VM when we close a gmem file/inode
 > c.   Allocating pages for the new VM from the new gmem file/inode
 > d.      Zeroing pages on page allocation
 >
 > We want to reuse the gmem file to save re-allocating pages (b. and c.),
 > and one of the two page zeroing allocations (a. or d.).
 >
 > Binding the gmem file to a struct kvm on creation time means the gmem
 > file can't be reused with another VM on reboot. Also, host userspace is
 > forced to close the gmem file to allow the old VM to be freed.
 >
 > For other places where files pin KVM, like the stats fd pinning vCPUs, I
 > guess that matters less since there isn't much of a penalty to close and
 > re-open the stats fd.

I had a 3rd question that's related to how to wire the gmem up to a 
virtual machine:

I learned of a usecase to implement copy-on-write for gmem. The premise 
would be to have a "golden copy" of the memory that multiple virtual 
machines can map in as RO. If a virtual machine tries to write to those 
pages, they get copied to a virtual machine-specific page that isn't 
shared with other VMs. How do we track those pages?

Thanks,
Elliot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
