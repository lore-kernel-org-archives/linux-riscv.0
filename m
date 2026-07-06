Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A675C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 05:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B3j865BPjlZk4S9mYAYuygmwKHRVylQG8G05VmAHWI=; b=NefX0hDUyfDlpb
	lD+KAKus0tSotjh6NrWlMOQBY6PrNQREqLkFF13jURgTYIjZI4XtGv9w3ykEp6mGimrd5rcHMUxQw
	MlSRJoM7ZjxEWYDO6XlJZz3IQS1hiVOihBvAZckOfzJRCaYsdv+Oa9cyy7nPGq+SYLsKBTi9LEgCU
	wKenFecP9ci0zbgdkNEJilgHt7WAxIUO1LMRYXeCnd+4NDW4d/5zM3jzcfXgF4lnPkrsO2AzTdtfI
	fKHye0oMv3rSyXVlU+VrEi+Iu6ouPD+89FwUe+VlF//Jc2+pNw57GwDBAhy7Ns/T65uI74Hw066HD
	3KxdBVh9Ln9sgu8UyErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbsd-0000000BWyd-1Voy;
	Mon, 06 Jul 2026 05:28:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbsa-0000000BWyC-39BX
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 05:28:29 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MIDNn2197654;
	Mon, 6 Jul 2026 05:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qyT8QO
	PwSCCU+wrCNesdHnEoidpizVQFXDm2JOPh3Ls=; b=NqCvs3pY15h1C7mpnIjIaN
	6jlCH42vtL2ODLXxmTALUdQExNoGcX68JO94EtwfUAL21T7CaUG/plS81M6YmYMU
	k6FtpqURKyqbAvIOV0ibqzLJhP2o68nJBh7er1hWV/J4dU9y3r7MLI0G54UwszRj
	fzvtb5Ii5fzFCyrJ+m3hrCWGbb7MgT2o8FZ2ODTNu93yFGfhODuQsf7BjXrNRKur
	5zXNA6HnZ2gf0SeENwLApCO7qKJ5TFesQ0PxQ/7sXzUSxj43bz/1g2ujukK9Y8m0
	8i9DFq3s+9sqM3pGje6tZ8wTkDXeDPsLQ82NRJ++2CsXKUSZWGtQu3uqVpmsfjKQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw4fqrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 05:27:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6665JdIY031696;
	Mon, 6 Jul 2026 05:27:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0h430r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 05:27:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6665RI5U51511744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 05:27:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3CE120043;
	Mon,  6 Jul 2026 05:27:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20E0C20040;
	Mon,  6 Jul 2026 05:27:18 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Jul 2026 05:27:18 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Peter Zijlstra
 <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
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
 <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov
 <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
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
In-Reply-To: <69ACC6A7-7845-41B4-B0D0-2E6FCDA7443D@zytor.com>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
	<BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13>
	<yt9dwlvca8rn.fsf@linux.ibm.com> <87ldbsmnie.ffs@fw13>
	<yt9d5x2w5r84.fsf@linux.ibm.com>
	<20260703105718.GO751831@noisy.programming.kicks-ass.net>
	<akecJWAJP-e5CYP_@kunlun.suse.cz> <yt9dtsqg480p.fsf@linux.ibm.com>
	<69ACC6A7-7845-41B4-B0D0-2E6FCDA7443D@zytor.com>
Date: Mon, 06 Jul 2026 07:27:17 +0200
Message-ID: <yt9dwlv8adsa.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: PVkMc2zyQ0D-fUI5jf8JPax52k-2R9m6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfX4qHTNGyBlHze
 ZpjjhVXVNWUf52+eH/j3Xj275yLvQIX9M5+SfrKeFVExBXF3r8VQK7M4tt8Et5rma8xzWEUxOye
 +Dm8prjgMBXEoa/9S0SMzMEpqSbYfMlMqMhsiRtF8j6NbGqjQAlv2ikwCzE1288nR/F43heFGQX
 8+8uMJ4Q/fmxYy0YasNluoqfxvSGTcHc9er9G/Zp/2d6fZEZs7HKrufFkld/iHPCWGL8rdCKPwJ
 K9giRvtbCnCiTL+FmCUbnj0P9Zi7MgRA0tfj2R1TjbFSlKyLgkwvhDY1Pc3M2MRBe7MsbFs7FZ1
 nxBXSQA+y+IAdsPPdmIvbKJfUuBDeIkbubPAVgd/Jnt0CI+mnzetibKeul6Tdue5QowHOnF32J5
 6URwC4eT3UI9Tskf2Szq1xngH6vioDy9MLJ0ahrSeimGXO4WRBwDhrcsVJwI0R9HB6YZGjRoDEA
 lGo2MhmSUrdNq5tTP6g==
X-Proofpoint-ORIG-GUID: DB5Cizx3s3LIu5FN8bbo5Zw1FptATo2x
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a4b3cbc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=oGMlB6cnAAAA:8
 a=VnNF1IyMAAAA:8 a=MuErSGU5NpPTm9C_53oA:9 a=QEXdDO2ut3YA:10
 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MCBTYWx0ZWRfX+MY8RMEHb64s
 y8kuegBntKLPrluFLndLQY7dg8NCbGkUX7kXz8/Z7uIHXtMeQlR3E2d6vH13gFXOSJAb+B/Rugv
 TNusXlfi/XZQLeaclmqkQoCtkwFx/OM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_222828_795549_090BE3FF 
X-CRM114-Status: GOOD (  25.48  )
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

IkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4gd3JpdGVzOgoKPiBPbiBKdWx5IDMsIDIw
MjYgNDozOToxOCBBTSBQRFQsIFN2ZW4gU2NobmVsbGUgPHN2ZW5zQGxpbnV4LmlibS5jb20+Cj4g
d3JvdGU6Cj4+TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKPj4K
Pj4+IFRoZSBzYW1lIGNvdWxkIGJlIGFza2VkIG9mIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21v
ZGUuIEkgZmluZCBpdAo+IHZlcnkKPj4+IG9kZC4gV2h5IGRvZXMgaXQgY29uZmxhdGUgdGhlIHN5
c2NhbGwgbnVtYmVyIHdpdGggaXRzIHJldHVybiB2YWx1ZT8KPj4+Cj4+PiBJdCBuZXZlciB1c2Vz
IHRoZSBzeXNjYWxsIG51bWJlciBwYXNzZWQgaW4gZXhjZXB0IHdoZW4gcmV0dXJuaW5nIGl0Cj4+
PiB1bmNoYW5nZWQuIFdoZW4gaXQgcG9rZXMgdGhlIHJlZ2lzdGVycyBpdCByZWFkcyB0aGUgc3lz
Y2FsbCBudW1iZXIKPiBmcm9tCj4+PiB0aGVtLgo+Pj4KPj4+IElmIHRoZSBjYWxsZXIgb2Ygc3lz
Y2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSBvbmx5IHJlYWQgdGhlIHN5c2NhbGwKPj4+IG51bWJl
ciBmcm9tIHRoZSByZWdpc3RlcnMgd2hlbiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIHJl
dHVybnMKPiBhbmQKPj4+IGluZGljYXRlcyB0aGUgc3lzY2FsbCBzaG91bGQgYmUgc3RpbGwgZXhl
Y3V0ZWQgdGhpcyB3aG9sZSBzaGVuaWdhbgo+IHdvdWxkCj4+Cj4+SSBhZ3JlZS4gVGhlIGZhY3Qg
dGhhdCBpZiAobnIgPCBOUl9zeXNjYWxsKSBqdXN0IHdvcmtzIGJlY2F1c2UgLTEKPiBnZXRzCj4+
Y2FzdGVkIHRvIDB4ZmZmZmZmZmYgYW5kIGlzIHRoZXJlZm9yZSBvdXQgb2YgYm91bmRzIGlzIHZl
cnkgb2RkLgo+Pgo+Cj4gTm90IGF0IGFsbCBzdHJhbmdlLiBJdCBpcyBhbiAqZXh0cmVtZWx5KiBj
b21tb24gY29uc3RydWN0IGluIEMsCj4gZXNwZWNpYWxseSBmb3IgcmFuZ2UgY2hlY2tpbmcgdmFs
dWVzIGludG8gWzAsIG4pLgoKQSBjbGVhciBpbmRpY2F0aW9uIHRoYXQgdGhpcyBpcyBub3QgYXMg
Y29tbW9uIGFzIHlvdSB0aGluayBpcyB0aGF0CnRoZXJlJ3MgYW4gZXh0cmEgY29tbWVudCBpbiBh
cmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6CgogICAgICAgLyoKCSogQ29udmVydCBuZWdhdGl2
ZSBudW1iZXJzIHRvIHZlcnkgaGlnaCBhbmQgdGh1cyBvdXQgb2YgcmFuZ2UKCSogbnVtYmVycyBm
b3IgY29tcGFyaXNvbnMuCgkqLwoKSWYgZXZlcnlvbmUga25vd3Mgd2hhdCB0aGlzIGlzIHRoZSBj
b21tZW50IHdvdWxkbid0IGJlIG5lY2Vzc2FyeS4gQnV0CnRoYXQgY2FzdCBpcyBub3QgdGhlIHRo
aW5nIGknbSByZWFsbHkgaW50ZXJlc3RlZCBpbiAtIGlmIGl0IHN0YXlzCnRoYXQgd2F5LCBmaW5l
IHdpdGggbWUuIEJ1dCBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoZSBjaGFuZ2UgZnJvbSBNaWNoYWwK
Z29pbmcgaW4gd2hpY2ggdW50YW5nbGVzIHRoZSBzZWN1cmVfY29tcHV0aW5nKCkgcmV0dXJuIHZh
bHVlIGZyb20gdGhlCnN5c2NhbGwgbnVtYmVyLiBCZWNhdXNlIHRoaXMgYmVoYXZpb3VyIGlzIHZl
cnkgc3VidGxlIGFuZCByZW1vdmluZyB0aGF0CndvdWxkIG1ha2UgdGhpbmdzIGVhc2llci4gKEFu
ZCBhbHNvIGVhc2llciB0byByZWFkL2F1ZGl0LCB3aGljaCBpcwphbHdheXMgaW1wb3J0YW5kIHdp
dGggc2VjdXJpdHkgcmVsYXRlZCBjb2RlLCB3aGljaCBzZWNjb21wL3N5c2NhbGwKY2xlYXJseSBp
cykuCgo+IEluIGFkZGl0aW9uIHRvIGJlaW5nIGlkaW9tYXRpYywga2VlcCBpbiBtaW5kIHRoYXQg
dGhpcyBpcyBvbmUgb2YgdGhlCj4gYWJzb2x1dGVseSBtb3N0IHBlcmZvcm1hbmNlIGNyaXRpY2Fs
IHBhdGhzIGluIHRoZSBlbnRpcmUga2VybmVsLiBPbmUKPiBvZiB0aGUgZnVuZGFtZW50YWwgY29y
bmVyc3RvbmVzIGJlaGluZCBVbml4IGlzIHRvIGtlZXAgc3lzdGVtIGNhbGxzCj4gY2hlYXAgc28g
dGhhdCB0aGV5IGNhbiBiZSBzaW1wbGUgYnVpbGRpbmcgYmxvY2tzIGZvciBtb3JlIGNvbXBsZXgK
PiBvcGVyYXRpb25zLiBJdCBpcyBub3QgdGhlIG9ubHkgcG9zc2libGUgZGVzaWduIHBoaWxvc29w
aHksIGJ1dCBpdCBpcwo+IHRoZSBvbmUgd2UgY2hvc2UgdG8gYWRvcHQsIHF1aXRlIHN1Y2Nlc3Nm
dWxseS4KPgo+IFRoZSBkb3duc2lkZT8gU3F1ZWV6aW5nIGV2ZXJ5IHBvc3NpYmxlIGN5Y2xlIG91
dCBvZiB0aGUgc3lzdGVtIGNhbGwKPiBwYXRoIGJlY29tZXMgb25lIG9mIHRoZSBtb3N0IGVzc2Vu
dGlhbCB0dW5pbmcgdGFza3MuIFRoZSBnb29kIHBhcnQgaXMKPiB0aGF0IGtlZXBpbmcgdGhlIHN5
c3RlbSBjYWxsIHBhdGggY2xlYW4gYWxzbyBtYWtlcyBpdCBtYWludGFpbmFibGUsCj4gZXZlbiB3
aGVuIHRoZXJlIGFyZSBxdWlya3MuCgpJIGhhdmVuJ3QgbWVhc3VyZWQgaXQsIGJ1dCBJIGRvdWJ0
IHRoYXQgdGhlIHVuc2lnbmVkIHZzIHNpZ25lZCBzeXNjYWxsCmJvdW5kcyBjaGVjayBtYWtlcyBh
IGRpZmZlcmVuY2UgaW4gcmVhbCB3b3JsZCBzY2VuYXJpb3MuIEV2ZW4gZm9yCm5pX3N5c2NhbGwg
Y2FzZXMgaXQgd291bGQgYmUgc21hbGwuIFdpdGggdGhlIEMgZW50cnkgY29kZSB3ZSBoYXZlCm5v
d2FkYXlzIHN1Y2ggb3B0aW1pemF0aW9ucyBzaG91bGQgYmUgbGVmdCB0byB0aGUgY29tcGlsZXIu
IEkgd291bGRuJ3QKYmUgc3VycHJpc2VkIGlmIHRoZSBnZW5lcmF0ZWQgY29kZSBpcyBldmVuIHRo
ZSBzYW1lLgoKQnV0IGFzIHdyaXR0ZW4gYWJvdmUsIEkgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQg
dGhpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
