Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9FBC43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6pefjCk8nPFl8zFIyTz0Suw+ZTej/uaXAnhucIRInI=; b=arqJJyw0MRuKXG
	XkCkxdg4H4ZbaxWBl27B6mYZeZ0/S20ccBZToMiAXp46z8mE/BYkiDTByHLmEe7WKbVmtm1lCQI/K
	Fh5s+qLebUk+GJnicTtwYM97YKT34NRoia6J2SxiAflSfNwX8ZUpnDORyFIGRa58qBbaopSTYZeVh
	R9WCkb+k9G8zajnlQB7z5kPMI0F8gHkaOBWtY272lW2uRAPM2RzsFaT5sJOrLj27Se/qAv83UobD6
	oQ1GGY707JGZVqNKnMLdgN0B9GUwIMHk+6UFCH1dWu4S4DAg1+0Bv815FisrOeOU9tMrT1EWvF+Qb
	0FUFUyRdIxYLcFxS1CWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG7i-00000004Ol9-3vAT;
	Thu, 02 Jul 2026 12:02:30 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG7e-00000004OhC-1Ynh
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 12:02:29 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621L37U2348150;
	Thu, 2 Jul 2026 12:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QXmH97
	+rWFoE2LAC88xt78ijllYCri9Xy6EsF1mVG6c=; b=ml+WJYctAzI5wdjjSDMgvP
	yYV2w0V14fb3FrleDRxXeZt2X9/C22lawvIy7y0+0JO66Vi6gKw1lfHi9eAyE3iB
	yoS3fYqtxvDpQ43tfL4lGRPA5bWXjXIUzVbxyYQxDdyfE1K1xqrHplG4o7Hdt20S
	AAsRGGTujytG5lXsdMbtKS8RLTE8pa6avsUyvnDduHvV2z5CY707mxKR2JNyI+r7
	IyOEJGe3WbV44naL8/o58lDH/tLH40lAil+soXDKPbWG+Z9RTVSTWMSdqkH2nDOb
	QLgPM5fv80o4n+0Z6dHnxoe02Eo3+yY6DnjNa6v6ZGL9BhLroq2Z252BbEu2DIUQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26mk1c1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:01:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 662BnaEX019880;
	Thu, 2 Jul 2026 12:01:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2tbhkrrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 12:01:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 662C13ZQ50987300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2026 12:01:03 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4769020049;
	Thu,  2 Jul 2026 12:01:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF39620040;
	Thu,  2 Jul 2026 12:01:02 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  2 Jul 2026 12:01:02 +0000 (GMT)
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
In-Reply-To: <akYreY_BHuRbxSsO@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <yt9dechlbyj0.fsf@linux.ibm.com>
	<akYreY_BHuRbxSsO@kunlun.suse.cz>
Date: Thu, 02 Jul 2026 14:01:02 +0200
Message-ID: <yt9d5x2xbny9.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX/Q+2VIkEZeXm
 zSpy3sSNQGU/T2UgslNS6VsPuREql8uSSdJVoQTob97qLRSMv8GJjVr6kKiJKJCJeXAZoKLkJvq
 5f+8ytV2grsx0grvISHbwQ84vmEGrrdzVPGn9ShEzfJJHyfO1sPZ67aE51b4LMU/UA4XKMH4nm3
 i3aZUnP9MOw4vJ1Gv1srPH7aTjCuWOOkR4qKRHoTc08VZ+RLjIvr8Wq1ycDRZScggqf8vwMr62U
 JjJTrtJxIQEPkt6pbRVU3+sX0S+j9wkj8f1eX7QLV6sX7z6Zs+pNzCEJDl3mKhspgytP+uB/ism
 Cbiu9d27//atMwvdZ67Jmyysa6pe9elrVf0h5Ag/2OdiGgMqcKBh7JR9tfXjSJ286bhQpmHm/WG
 VZ+c5pOODZgvCHxA60BGuyRiMofbgW+8J+7uiJsQ4y6cR6g7q0HtmmyhZwGSkt8korNuifin5NM
 AFNwBLKljHK92fKlxUQ==
X-Proofpoint-GUID: 4HRNE-F5FeM-i_rZBbEwAtB_lah-fAD7
X-Authority-Analysis: v=2.4 cv=Z8bc2nRA c=1 sm=1 tr=0 ts=6a465304 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=96I0iGyHsLkaCD_aHbUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMyBTYWx0ZWRfX3fqq5rJK1Pw6
 XAlVAtz6S5ae1lDAR5UGIg8LAyH/oHFacO80fJr93TGA5Wz3SkDELaofBJAuvm8s6hTRnqUcZGM
 jGAhDbq6yYnrtndAHrmEOWgPfMLlxrw=
X-Proofpoint-ORIG-GUID: COL-UTUh6U9SgZkk02MSCnjQmBsVFo93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_050226_545488_5629CE95 
X-CRM114-Status: GOOD (  29.11  )
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

TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKCj4gT24gVGh1LCBK
dWwgMDIsIDIwMjYgYXQgMTA6MTI6MzVBTSArMDIwMCwgU3ZlbiBTY2huZWxsZSB3cm90ZToKPj4g
TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKPj4gCj4+ID4gVGhl
IHJldHVybiB2YWx1ZSBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIGlzIHVzZWQgYm90
aCBmb3IgdGhlCj4+ID4gYWRqdXN0ZWQgc3lzY2FsbCBudW1iZXIgYW5kIHRoZSBpbmRpY2F0b3Ig
dGhhdCBhIHN5c2NhbGwgc2hvdWxkIGJlCj4+ID4gc2tpcHBlZC4KPj4gPgo+PiA+IEFzIHNlY2Nv
bXAgY2FuIGJlIGludm9rZWQgb24gYW55IHN5c2NhbGwsIGluY2x1ZGluZyBpbnZhbGlkIG9uZXMg
dGhpcwo+PiA+IHNvbWV3aGF0IHVuZGVybWluZXMgc2VjY29tcC4KPj4gPgo+PiA+IFdoaWxlIHRo
ZSBzZWNjb21wIHZhcmlhbnRzIHRoYXQgdGVybWluYXRlIHRoZSBwcm9jZXNzIGRvIG5vdCBuZWVk
IHRvCj4+ID4gY2FyZSBhYm91dCB0aGlzIGZvciB0aGUgZmlsdGVyIHRoYXQgc2V0cyB0aGUgc3lz
Y2FsbCByZXR1cm4gdmFsdWUgdGhpcwo+PiA+IGRpc2N0aW5jdGlvbiBpcyByZXF1aXJlZC4KPj4g
Pgo+PiA+IFBhc3MgdGhlIHN5c2NhbGwgbnVtYmVyIGFzIGEgcG9pbnRlciB0byB0aGUgaW5saW5l
IGVudHJ5IGZ1bmN0aW9ucywgYW5kCj4+ID4gdXNlIHRoZSByZXR1cm4gdmFsdWUgZXhjbHVzaXZl
bHkgZm9yIHRoZSBpbmRpY2F0aW9uIHRoYXQgdGhlIHN5c2NhbGwgaXMKPj4gPiBhbHJlYWR5IGhh
bmRsZWQuCj4+ID4KPj4gPiBUaGlzIHNob3VsZCBhdm9pZCB0aGUgbmVlZCBmb3IgdGhlIHMzOTAg
UElGX1NZU0NBTExfUkVUX1NFVCB3aGljaCBpcyB0aGUKPj4gPiB3b3JrYXJvdW5kIGZvciBleGFj
dGx5IHRoaXMgZGVmaWNpZW5jeS4KPj4gCj4+IEknbSBub3Qgc3VyZSB3aGV0aGVyIFBJRl9TWVND
QUxMX1JFVF9TRVQgY2FuIGJlIHJlbW92ZWQgLSB0aGUgc3lzY2FsbAo+PiByZXR1cm4gbWlnaHQg
c3RpbGwgZ2V0IHNldCBieSBQVFJBQ0VfU0VUX1NZU0NBTExfSU5GTyB3aGVuIHRoZSB0cmFjZWUg
aXMKPj4gc3RvcHBlZC4gVGhpcyBtaWdodCBiZSBhIHBvc2l0aXZlIG51bWJlciB3aGljaCBjYW4n
dCBiZSBkaXN0aW5ndWlzaGVkCj4+IGZyb20gYSBzeXNjYWxsIG51bWJlci4gQnV0IG1heWJlIGkn
bSBtaXNzaW5nIHNvbWV0aGluZz8gSXQncyBiZWVuIHF1aXRlCj4+IGEgd2hpbGUgc2luY2UgSSB0
b3VjaGVkIGFsbCB0aGF0IHB0cmFjZSBzdHVmZi4KPgo+IFdoZW4gdGhlIHN5c2NhbGwgcmV0dXJu
IHZhbHVlIGlzIHNldCAoaW4gdGhlIHJlZ2lzdGVycykgdGhlIHJldHVybiB2YWx1ZQo+IHdoaWNo
IGlzIGFsc28gdGhlIG1vZGlmaWVkIHN5c2NhbGwgbnVtYmVyIGlzIHNldCB0byAtMSBpbmRpY2F0
aW5nIHRoZQo+IHN5c2NhbGwgd2FzIGhhbmRsZWQuIEF0IGxlYXN0IHRoYXQncyBob3cgdGhlIEFQ
SSBpcyBkZXNjcmliZWQuCj4KPiBTbyB5ZXMsIGlmIHRoZSBzeXNjYWxsIG51bWJlciByYW5nZSBp
cyByZXN0cmljdGVkIG9yIHRoZSBzeXNjYWxsIG51bWJlcgo+IGlzIHJldHVybmVkIHRocm91Z2gg
YSBwYXRoIGRpZmZlcmVudCBmcm9tIHRoZSBmdW5jdGlvbiByZXR1cm4gdmFsdWUgdGhlCj4gZmxh
ZyBzaG91bGQgbm90IGJlIG5lZWRlZCBpbiB0aGUgZW50cnkgcGF0aCBiZWNhdXNlIHRoZSBjYXNl
IGNhbiBiZQo+IGRldGVjdGVkIHRocm91Z2ggdGhlIHJldHVybiB2YWx1ZSBhbG9uZS4KCkknbSBz
dGlsbCBmYWlsaW5nIHRvIHNlZSBob3cgdGhpcyB3b3VsZCB3b3JrIHdpdGhvdXQgYW4gYWRkaXRp
b25hbApmbGFnLiBBc3N1bWUgYSBwcm9ncmFtICh0aGUgdHJhY2VlKSBpcyBzdG9wcGVkIGJlY2F1
c2Ugb2YgYSBzeXNjYWxsCmVudHJ5LiBUaGUgdHJhY2VyIHRoZW4gZGVjaWRlcyB0byBza2lwIHRo
ZSBzeXNjYWxsIGFuZCBjaGFuZ2VzCnJlZ3MtPmdwcjIgKHdoaWNoIGNvbnRhaW5zIGVpdGhlciB0
aGUgc3lzY2FsbCBudW1iZXIgb3IgcmV0dXJuIHZhbHVlKQp0byBjb250YWluIDQyLiBXaGVuIHRo
ZSB0cmFjZXIgdGhhbiByZXN0YXJ0cyB0aGUgc3lzY2FsbCwgaG93IGRvZXMKZG9fc3lzY2FsbCgp
IGtub3cgdGhhdCBncHIyIGlzIG5vdyBhIHJldHVybiB2YWx1ZSBhbmQgbm90IGEgc3lzY2FsbCBu
dW1iZXI/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
