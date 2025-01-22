Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8EAC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEgETJIZgu4ssccq3IaJKZzHGOoCuY7BTIGWYX/mEkI=; b=fMq4b7PheEyDFJ
	Dy/JYBjxosami+ssE9cXE0cQmAVirvu5Xmalb07UJtmrlR6VhpXrb5nGVKH/aqE/7rlsMtKFqhjyU
	gGL+FK4v5k3yh3ABTVSqKxGOBBc7ZA5UwOm0L06oZwDuOu++mTm8O4dkCQnMXa6KD+ytmC9bAmHHt
	/yc/H1HvkYpeSON+8AAWV4nwiYcmrS6BA6ZIcTBF7F25Yo2U2jxpw7ZvRTCV/+g6ymX/Acnu1/DVe
	gdraow6wXVBvAv+k8HEPonVukQnaUdAFQSuJsRbwtPzEajkBl7XiiFN5gXLHfN6tH7JsJGQ1Hk5V+
	BwgqmcQ1y1BN7jKq3XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taeRY-0000000Ar6Q-1OG7;
	Wed, 22 Jan 2025 17:23:08 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taeRV-0000000Ar5u-3xk6
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 17:23:07 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MF1XM8027463;
	Wed, 22 Jan 2025 17:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=s+Sx6TftRkP+5tcfW8mhCC8MHQ0TqM
	hpnL7cjp8hA34=; b=TecEmbZedJD2Zim15/iZMZidEE5svB8jChFO0xijV5n5+w
	DHc5sI/9AeUfiyfx+uayPLJs57v4t0XJuBHu+EzOcqxdBGoJ8fZnAZc8sJkJtlA1
	AmHge5YOpjxtYzdaNhvZxSx79tBLB0Iikr3n70MnMurR6E1Fg+gFF+o1GAFiKrtT
	OGwmL/gRADXtO3xXW0Dq/2QGzYe/MHSFOBPJ69g3roDLov4wrf/k8RY26TY5KdVh
	OVvPeqAGYoK/4T6eWDzlJvDQv2RNBmVUfV/061xl/xUgtXuoP+0UBQzN087wxh7a
	XjdFcFAboALXhyCCTU+Xq98RbLlJymjCEsDrZeNA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44b2xygr3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 17:23:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MDejnc024307;
	Wed, 22 Jan 2025 17:23:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448q0y9kn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 17:23:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MHMx5M36241906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 17:22:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC9CF20043;
	Wed, 22 Jan 2025 17:22:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9248320040;
	Wed, 22 Jan 2025 17:22:58 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 17:22:58 +0000 (GMT)
Date: Wed, 22 Jan 2025 18:22:57 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
Message-ID: <Z5Epcb+GnqFegstq@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250113155306.1922992-2-ardb+git@google.com>
 <Z5EhsaJOaRjjMEp4@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5EhsaJOaRjjMEp4@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HoteUIm15bMeGwcSzQy8xKdqG5FmEHlS
X-Proofpoint-ORIG-GUID: HoteUIm15bMeGwcSzQy8xKdqG5FmEHlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_07,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxlogscore=637 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_092305_991713_8BD1CA2B 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, Jan 22, 2025 at 05:49:53PM +0100, Alexander Gordeev wrote:
> On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:
> 
> Hi Ard,
> 
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to get
> > removed are left behind.
> > 
> >   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> > 
> >   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
> >   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
> >   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
> >   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
> >   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
> >   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> > 
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
> 
> On s390 this is before:
> 
>   [32] .relaruntime[...] RELA             0000000000000000  13b3fe20
>   [34] .relaruntime[...] RELA             0000000000000000  13b3fe98
> 
> This is after:
> 
>   [ 2] .rela.text        RELA             0000000000000000  13b3fe20
...
>   [73] .rela.debug_[...] RELA             0000000000000000  298eb5a8

Sorry, I checked the wrong version. It works as expected.

Tested-by: Alexander Gordeev <agordeev@linux.ibm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
