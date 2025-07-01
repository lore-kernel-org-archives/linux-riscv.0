Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE36DC8303B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSwkare3qQHUS171Fp4iReGPABzBkKvbtIm9obobyts=; b=qYt4ZOWGAqstb+
	Dm1qO+Xw4cMYWr1A4RC9/HGZz4mKIvlmW24ad199F9pKwppeXFhhMzIz8Z1nzAk8u9QJJY1kJzzkd
	zmgygPEDpfidv44MjCUkO9ubWt21YbbWydg6Hk/DckfEySg4LAnhSfMuawj84R9HZPnDC5xINLee7
	M+7V/CTsCOBduJvPUKDL4U3NvwpeAPN/eIvshn9ulOOAMRCxLUbAGeEVqLL+e6WdqxeGb/NUi/ugJ
	b+3GQjfX2FDEUUc5QqALp4tBr7/hVKLldXr2VCDnWVePvcF0z/otky8iXyGuqcINnTKFAozW7lHJy
	16CwJtfygpBz7WALrfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWche-00000005qwJ-02cW;
	Tue, 01 Jul 2025 15:15:22 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbBr-00000005XnM-2Ncl;
	Tue, 01 Jul 2025 13:38:28 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561Ao1Lm012254;
	Tue, 1 Jul 2025 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=AJLNXeZBidDlQX/9niKzeIA7RdIQ35
	aaPXD/kLpTeHk=; b=rlhS3ni/cF+oHD+o2LmQH00Tt1yf+IXrQwS8k/NYdNoQmt
	duh9xElSzAv31IeesiKLOuUaS7Js+v1FcCM3idLgVIqiFfWon7XDGjUUaGS1gO7k
	A0JrbTyaswrFc7s4ZFW4HADsPTEgUor320+59p+Q02H940E/xpViJv61e7ViyNjJ
	vMcXo0c5xDHAYQwHYeEOaFbcipPGvNgKtWbscb8fvFkysHG+EG7pEVr+wrBpt5rP
	TvpzBk/V8AqMNvTK7fz483B21FzXBpDlDdKDMGCI6bWWjVPpwYCBxl8uHjAuPKPZ
	sumQ0qg/FxaZ17KQzTSCoQkinixWtocLfr+JROcQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrfqxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:34 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 561DK4Af030631;
	Tue, 1 Jul 2025 13:37:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7wrfqxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 561CFQo0021945;
	Tue, 1 Jul 2025 13:37:32 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqpju2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 13:37:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 561DbRkS39191032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jul 2025 13:37:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64A12004B;
	Tue,  1 Jul 2025 13:37:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79D812005A;
	Tue,  1 Jul 2025 13:37:25 +0000 (GMT)
Received: from osiris (unknown [9.111.81.242])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Jul 2025 13:37:25 +0000 (GMT)
Date: Tue, 1 Jul 2025 15:37:24 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
        glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        johannes@sipsolutions.net, dave.hansen@linux.intel.com,
        luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
        nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with
 kasan_enabled
Message-ID: <20250701133724.10162Bea-hca@linux.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
 <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
 <20250701101537.10162Aa0-hca@linux.ibm.com>
 <0400f0be-6b63-4bc7-846e-8852e1d01485@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0400f0be-6b63-4bc7-846e-8852e1d01485@csgroup.eu>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=6863e49e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=9kVARt_T5sJ8cKZ6P08A:9 a=CjuIK1q_8ugA:10
 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: RhlQaPOLrhblKhkyaR8lhPAADXtAGdqv
X-Proofpoint-ORIG-GUID: GE-5RQzQLYwKSRuZzvD2Ieha-YyMeWy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NSBTYWx0ZWRfXzvbPIXoCFjaA YSsHPBvgZlo8uA940MrN2nhmDxVD4yrQC0Blr21wUJpIGCnNlNYIEYn0zUSw91bxc/h5BgvR4PQ 8+gmBbA2hDH7/zlVMxuAui0Eg0eLEMWJxQ2/qxuHFp9hM4UusUMJXT1gcIBCqFiNlncOSMVN5PG
 Ld5QIjM0M/RCgeT9uZc/VoQiigSg/ZOOijWeB0ApYuTWAn6oTpW5uLedkuEa+H9gsqL267RFsh+ hsZlShfTEsI5dV1qJMDiUaZYdjPAHbt+/Y5HPTDay65IxTT2JuvXcJaPY0TCfNXxBXRdcK6cNfg T9ENU2fNsIOPb8h0JhVPWTlgBKUQsNsQrY0goxWlNMztanR3wFR0fwoMfm4Jvvns3yERoc04SWn
 h0O40s/ZVSLp603nO33OhPNgBdCIeQQuKGnHgEsIbQLtMjKZdTC34lQKNuw31VIbsvBRZVlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=594
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_063827_606048_2D7655DB 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, Jul 01, 2025 at 12:25:32PM +0200, Christophe Leroy wrote:
> Your patch below is simpler than what I proposed, but it keeps the static
> branches so the overhead remains.
> 
> I also proposed a change, it goes further by removing the static branch for
> architectures that don't need it, see https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20250626153147.145312-1-snovitoll@gmail.com/#3537388
> . Feedback welcome.

Yes, removing the static branches during compile time is of course
even better.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
