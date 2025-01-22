Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D582C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3uIpz1j91VfsWWLXqsef/2pgA+p0KPj0jDyiOf/zpE=; b=ssbFgXTjw/TR8U
	NiDtatyaeUH5sVYmBwyHbtUqZSVAgPXx6UHHYaUW5oRERRS804pOalNO8xG2QG23MJfvJXHE5UnW9
	4TTsy5vN+NpcFgtGBKZ1lwMYnvGdbM009UUSuPhqNYSOuIAs62GJZPCPi0yf1A7ud1kgVTsaLVZQi
	eoc0bFoG5Jsz8fsX8VddW5hjXanr2xLmveJ4hStGbmYFlHusBXzYu+PpxihIAh6Vu1lvdoVn9VDag
	NqyDVnVmefRwYZrXVvP3Iz291UTA/MJuwPgg4gjIT1q0OULD1L/IFs5i4AAJZbvJpadS1jtc+kH+8
	/ggZvSfEdLRAAuwNzHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadvY-0000000AlSU-31DS;
	Wed, 22 Jan 2025 16:50:04 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadvV-0000000AlRs-3wLy
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 16:50:02 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MF1bVw027703;
	Wed, 22 Jan 2025 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=tn6kHzxWYCuaWfhS7twBe8ajn1hW/8
	C/C+k2mgUQe44=; b=SriPO9v56pnKes5h+CCJkoPhmImRFBQgIOiNx0rRNt58LC
	HClfytDFRilfWert0SnToRYBpT9It9rDEqpjLaqeWFSUp7u7N2lBSriQtkrqEv5l
	lrqwxd/35/lwHZEOPOmQOyq6Sv+O+KggA/JkKNIClxuKd0QVf9tQvQZdlWyNMk7r
	FUyCXhKCPjYF7hZ9ZDs+uVIXYI6HdEvYQmERwVYsdqLncITdD3fW84PAv78Mg9sV
	nhcfixaSySQzd+RYHfU0sGjbQlnMEm9z/RCfYloql4JCUNoAvNYY+4yYrKHqg6NG
	uY7kxvQ1idttx2Anrtfg/6ZF99fSrWlA83jEJY9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xygjng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50MGluIn004037;
	Wed, 22 Jan 2025 16:49:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xygjne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MG6YLP021074;
	Wed, 22 Jan 2025 16:49:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1gy8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 16:49:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MGnsEi36962654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 16:49:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B52D020040;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7291E2004B;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 16:49:54 +0000 (GMT)
Date: Wed, 22 Jan 2025 17:49:53 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
Message-ID: <Z5EhsaJOaRjjMEp4@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250113155306.1922992-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1FIFpjqDLl7j4eqDhN1i8UjGeotJiCdU
X-Proofpoint-ORIG-GUID: RYJA-gNaND7vC0TXC6i9NN-fNHfjO9zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_07,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1011 bulkscore=0 suspectscore=0
 mlxlogscore=720 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_085001_987568_45ACAA35 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:

Hi Ard,

> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
>   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> 
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> 
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.

On s390 this is before:

  [32] .relaruntime[...] RELA             0000000000000000  13b3fe20
  [34] .relaruntime[...] RELA             0000000000000000  13b3fe98

This is after:

  [ 2] .rela.text        RELA             0000000000000000  13b3fe20
  [ 4] .rela.rodata      RELA             0000000000000000  142cf588
  [ 6] .rela__ksymtab    RELA             0000000000000000  142ece08
  [ 8] .rela__ksymt[...] RELA             0000000000000000  1433f200
  [13] .rela__param      RELA             0000000000000000  14432d40
  [15] .rela__modver     RELA             0000000000000000  14436358
  [17] .rela__ex_table   RELA             0000000000000000  14436538
  [20] .rela.data..[...] RELA             0000000000000000  14446228
  [22] .rela.data.rel.ro RELA             0000000000000000  144d9240
  [25] .rela.data        RELA             0000000000000000  14559148
  [27] .rela__bug_table  RELA             0000000000000000  145b4ae0
  [29] .rela.data.rel    RELA             0000000000000000  1461aab0
  [32] .rela.amode3[...] RELA             0000000000000000  146eb280
  [34] .rela.init.text   RELA             0000000000000000  146eb430
  [36] .rela.exit.text   RELA             0000000000000000  14750c20
  [38] .rela.altins[...] RELA             0000000000000000  14753d28
  [41] .rela.nospec[...] RELA             0000000000000000  1484ca58
  [43] .rela.nospec[...] RELA             0000000000000000  1487ef90
  [46] .rela.amode3[...] RELA             0000000000000000  14a0d168
  [48] .rela.amode3[...] RELA             0000000000000000  14a0d270
  [51] .rela.init.data   RELA             0000000000000000  14a0d330
  [53] .relaruntime[...] RELA             0000000000000000  14b5d6f0
  [55] .relaruntime[...] RELA             0000000000000000  14b5d768
  [57] .rela.data..[...] RELA             0000000000000000  14b5d7e0
  [61] .rela.debug_[...] RELA             0000000000000000  14b5d918
  [63] .rela.debug_info  RELA             0000000000000000  14b80478
  [66] .rela.debug_line  RELA             0000000000000000  250ef010
  [68] .rela.debug_frame RELA             0000000000000000  25123060
  [71] .rela.debug_loc   RELA             0000000000000000  253bb1a0
  [73] .rela.debug_[...] RELA             0000000000000000  298eb5a8

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
