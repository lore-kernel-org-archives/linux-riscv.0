Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE553C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/16dVSgTL2YBInSRVV04WSaU+h4GdXl0yduEe3ubgtY=; b=oFSNJ+lrn33YKk
	0wXS5zQTNiOFdHVOkZTYhF4wc7IPSeP1vBYL0IlESrWurTISNPPeoqX/yzBCJQmqENK7IJmujmZZy
	TY3x396Mq+2I7fPszo2d5uDC5Yipjmo25wxdM1N4JDw6Ix6UL2azzpC9dzrx9iKe7ycP+LHGNXKHw
	VJlpZHibb3t7IIoU7OsOkwsPonst7PE1h/axGyeuXVbqQFq2gYWkjOAS5yB5kaO7PPuepbSTJEpQY
	VOsWhcbhi95QMMeTF7vYMz7SNEp5ruks5nmLxUDgD/2jG34DtbrJcIgUnXmzFMB/OjUOO4eu1ceZx
	9Gv0opZ0o65eowFfyKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCYR-00000003oyG-17A1;
	Thu, 02 Jul 2026 08:13:51 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCYO-00000003oxl-2KDK
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 08:13:49 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KlGo2509852;
	Thu, 2 Jul 2026 08:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hqCLUV
	UGlo7JiPK9HmHjC+v213ae/U7iW09vTUMaQAg=; b=pZK8TbTJnNMAyZxjXBKemz
	WG95jwJ+gE68MwV5sSXtJd4BF5pREzpXbDk24iP/dPZpCrj+6o23XVWuWs+IAErT
	BbHfEuYE7GaSRUt7JZO2upuMd8p7Q3sOwF/X9o9jSOIZE5T+fPCCzCFNSW8Xe46S
	32wY8T03xrM5wqOEaF50gohxKSBymr4TWcd815Mm4QBvbcGQl/LZZ71WNEgVhWQ4
	Bb0xSU+IZisDQ6y8SqNyIweWlkpNOiPMVRMU0HJvrwLCKuyK5gwIrMKa6TrITK72
	04L3zVt3tzqIZh2FJIZl8F+aPVcpgj53SwloGZ6OyHO0JcrkF81IrZ/Fh3NptQ4w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe8wrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 08:12:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 662855Gj005192;
	Thu, 2 Jul 2026 08:12:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2u2gjxrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 08:12:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6628CaKk47186188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2026 08:12:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C63F20043;
	Thu,  2 Jul 2026 08:12:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9CE120040;
	Thu,  2 Jul 2026 08:12:35 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  2 Jul 2026 08:12:35 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet
 <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan
 Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin"
 <hpa@zytor.com>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Mark
 Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Jiaxun
 Yang <jiaxun.yang@flygoat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mukesh Kumar Chaurasiya
 <mkchauras@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Zong
 Li <zong.li@sifive.com>,
        Nam Cao <namcao@linutronix.de>, Deepak Gupta
 <debug@rivosinc.com>,
        Lukas Gerlach <lukas.gerlach@cispa.de>,
        Rui Qi
 <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [RFC] entry: Untangle the return value of
 syscall_enter_from_user_mode from syscall NR
In-Reply-To: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
Date: Thu, 02 Jul 2026 10:12:35 +0200
Message-ID: <yt9dechlbyj0.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: DKlldyY4bhkCnlcbefPy2HU56VqtiBGr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3OSBTYWx0ZWRfXyOQuthEL9my+
 L3goQ8RSe3aEKWelY2bJXttBAFwFZ3nxAMd4YsPCcEXn38MypvsePfJ6K0Xa0t/CkI83BjCtnVw
 m6hD2NKtpMS8QTJ1dKDLehpY3uSIRHk=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a461d79 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=H7Grb0cKppj6FskhoBQA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3OSBTYWx0ZWRfX/oe4D2SHEsm8
 fnh8Zogh7aWRM7RCWhvCxl9KxCazzx0GZhXpTwQ6IVs2rk1Lht0I2Pw7XYWwx94bCT3Ez7rq8Dg
 lg8HV4ioS+8K8e2rqvVEnOYfMVPDiJZERcROKpg9FVgHynbSsV/0kzAosEQ+xeI4rV2SVE0ldfP
 T/9tPCQSRrH3OFOXXIOJF8xBBCWy/L2bfBCsah4ga0qm4ebPbs3ZjFLYIwziTnpFKZxHXHmd98N
 MYh5DqQ2fp7GI0HPArVfNFgaDdDflOraiPWOnzhqFhPDp2lG56c8K0xzWRL3jW6kUeiDKuXG+Nk
 YxA5p0vWRe8IkAgAj8cQkTfxSxUnmjY99x2Cj4BgrgbekYiNXkLROH5O2zrOMUrrb+POiYKlvOZ
 HnQMDbLmGSoz9dPTQu7oFDFNks2D4/MlmtTaw+2HyBz8naZWPeeOO6fVfljQpTQ/9wmpAyeBa30
 MxGwR6nRsgmgvSeCamw==
X-Proofpoint-ORIG-GUID: BbxRzj5OULkjMR0AZe7xHLImpWA5FvbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011348_598390_4DB527B2 
X-CRM114-Status: GOOD (  20.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKCj4gVGhlIHJldHVy
biB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIGlzIHVzZWQgYm90aCBmb3Ig
dGhlCj4gYWRqdXN0ZWQgc3lzY2FsbCBudW1iZXIgYW5kIHRoZSBpbmRpY2F0b3IgdGhhdCBhIHN5
c2NhbGwgc2hvdWxkIGJlCj4gc2tpcHBlZC4KPgo+IEFzIHNlY2NvbXAgY2FuIGJlIGludm9rZWQg
b24gYW55IHN5c2NhbGwsIGluY2x1ZGluZyBpbnZhbGlkIG9uZXMgdGhpcwo+IHNvbWV3aGF0IHVu
ZGVybWluZXMgc2VjY29tcC4KPgo+IFdoaWxlIHRoZSBzZWNjb21wIHZhcmlhbnRzIHRoYXQgdGVy
bWluYXRlIHRoZSBwcm9jZXNzIGRvIG5vdCBuZWVkIHRvCj4gY2FyZSBhYm91dCB0aGlzIGZvciB0
aGUgZmlsdGVyIHRoYXQgc2V0cyB0aGUgc3lzY2FsbCByZXR1cm4gdmFsdWUgdGhpcwo+IGRpc2N0
aW5jdGlvbiBpcyByZXF1aXJlZC4KPgo+IFBhc3MgdGhlIHN5c2NhbGwgbnVtYmVyIGFzIGEgcG9p
bnRlciB0byB0aGUgaW5saW5lIGVudHJ5IGZ1bmN0aW9ucywgYW5kCj4gdXNlIHRoZSByZXR1cm4g
dmFsdWUgZXhjbHVzaXZlbHkgZm9yIHRoZSBpbmRpY2F0aW9uIHRoYXQgdGhlIHN5c2NhbGwgaXMK
PiBhbHJlYWR5IGhhbmRsZWQuCj4KPiBUaGlzIHNob3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgdGhl
IHMzOTAgUElGX1NZU0NBTExfUkVUX1NFVCB3aGljaCBpcyB0aGUKPiB3b3JrYXJvdW5kIGZvciBl
eGFjdGx5IHRoaXMgZGVmaWNpZW5jeS4KCkknbSBub3Qgc3VyZSB3aGV0aGVyIFBJRl9TWVNDQUxM
X1JFVF9TRVQgY2FuIGJlIHJlbW92ZWQgLSB0aGUgc3lzY2FsbApyZXR1cm4gbWlnaHQgc3RpbGwg
Z2V0IHNldCBieSBQVFJBQ0VfU0VUX1NZU0NBTExfSU5GTyB3aGVuIHRoZSB0cmFjZWUgaXMKc3Rv
cHBlZC4gVGhpcyBtaWdodCBiZSBhIHBvc2l0aXZlIG51bWJlciB3aGljaCBjYW4ndCBiZSBkaXN0
aW5ndWlzaGVkCmZyb20gYSBzeXNjYWxsIG51bWJlci4gQnV0IG1heWJlIGknbSBtaXNzaW5nIHNv
bWV0aGluZz8gSXQncyBiZWVuIHF1aXRlCmEgd2hpbGUgc2luY2UgSSB0b3VjaGVkIGFsbCB0aGF0
IHB0cmFjZSBzdHVmZi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
