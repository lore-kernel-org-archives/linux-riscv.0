Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD1CC43602
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci8VXEcWoWvSJScpF4IWfldL8eK3epycypYPhA6ev2s=; b=0AE2ND+7oyGuKF
	aF08rwz60trpTF7w4zNyyBNufoXBlsgQ0VN1+12EERvGTLrEKZ/zo8u665HHXEr5wHW2N0rGKJzw/
	+MJ6pjFfhWa4o7CA0Ux61FjE4stwWLPHaE3LK9/yLPLJQPM4Eb1YwXJNps9tRpoKF4E0u7PAAnvPv
	LTr8DfIgXpfy14AsNjkfFI84dgThj5jcUGfFT43cQ8syax2AAZ//wId4Mc0UmDeRW8F0L5D4b3log
	wDxt3O0CUzVTVqMQdv7v2l7tzsrzEmKzEwfIbSOtWA0M73uv+rJW1skCpx6wtCk4X4RFHhgr+gSJr
	S1OzOv5g1F3it050oXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcFc-00000006pBe-0a3d;
	Fri, 03 Jul 2026 11:40:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcFZ-00000006pAl-0zk0
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 11:40:06 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636ITbX1761163;
	Fri, 3 Jul 2026 11:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oF3oIU
	V+LKz0emUew5qxSHFBM4G51YQMA7zouIB8abk=; b=VXVUBoyppp/UHI5Y4PknK/
	64pw1LEU//x+soMgCRCdX4EdRm1zU4BCz8O9WW4oNRLNu5JhDcy4EBLyBm/6FrOQ
	hqGOcwUP7gl/7Sj9txOvVGDP8jQ9qbjCNjUToJILQOuNpLHDRC8DEuwqJjn5Bsbk
	jf3l63BG5cKpkTLnfzlDDlALQjJJoBf+gKHNlL4ClS0BXrHUc4dnXahOQIQvzOE2
	RnjFerav6HoB22z55ZqFWCNMvqeWu1Ub2Lv9DtcEBi0qc+6pcdgn8D9isf+11H2I
	9r8JlXCZvNiYvmLVs1eyz9jM/CbzeXd+fEHg62Ub1+lS6+670BWFEDmq6/u/L6Ow
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26mk6hfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 11:39:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 663BYsLL011332;
	Fri, 3 Jul 2026 11:39:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2u2grf4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 11:39:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 663BdJ1R49021346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jul 2026 11:39:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45EAF20040;
	Fri,  3 Jul 2026 11:39:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC89120043;
	Fri,  3 Jul 2026 11:39:18 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  3 Jul 2026 11:39:18 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner
 <tglx@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet
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
In-Reply-To: <akecJWAJP-e5CYP_@kunlun.suse.cz>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz>
	<BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13>
	<yt9dwlvca8rn.fsf@linux.ibm.com> <87ldbsmnie.ffs@fw13>
	<yt9d5x2w5r84.fsf@linux.ibm.com>
	<20260703105718.GO751831@noisy.programming.kicks-ass.net>
	<akecJWAJP-e5CYP_@kunlun.suse.cz>
Date: Fri, 03 Jul 2026 13:39:18 +0200
Message-ID: <yt9dtsqg480p.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX9A1mR90iQ9fU
 Jnq5F39WZRpZmJZJo+YsMXBKsZBl5gTM0jj9mCML5R/Bd24LYkLFgakI/FJBKEk/4h15P+huPhT
 Qt4x0X5evHrib3jUNImZ7xP5zALzpi3mdHxCzHrZiWHfDxHBlxixkSy9cDZPp/nTWVn344jkMMG
 O12i1eIjoY94y3kSaaPRuWeqICdkdOzFC9qN9cXcDbd4yx6KKWE4d1phTqPs9FLJ4FlkNJ8+4fa
 /LYyk6rTIsgzLZV9WgaObJlQoHbWw7lz4c+lbe8M9Y7kkveYms1BJh6DmtlzccJMJ25zlPyUfZ8
 JmMUjXhd8ewPBbHid4BGyyAMEeqTyK6ykKlCepPfXv4InKeRsqJriegDf9oxa/3VabPxqAi+ZDP
 fSV0sApuWT7vTMVqvinurA0q0Phf9Nlh1Md0MKTtLGwkyMUTXh+Ps6RpfCKXyu2yzYMrNM67vWx
 yRdPu407r0ZBuNDOK9g==
X-Proofpoint-GUID: 0UewXK-tXcTk8FWkyPWn8VMN9H9juXe0
X-Authority-Analysis: v=2.4 cv=Z8bc2nRA c=1 sm=1 tr=0 ts=6a479f6c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=7COA2AqOHvKb0wdBt1EA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExMCBTYWx0ZWRfX+Zctx0ZJQz6V
 Vq7aSPRPQpmK2s8ZW9Ab8ojRDqpVU5I5jpBSa8I4jJz5wtRMPZX84BaKOeHe7JCg0Z84TaNiznM
 cYzIAWu4Lm8wE8gWWhsc6/49iUcKYqo=
X-Proofpoint-ORIG-GUID: XUA9fyTmm3_KCsdJOv0Gf6JjV0mivGPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044005_396881_F918E7F0 
X-CRM114-Status: GOOD (  15.69  )
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

TWljaGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+IHdyaXRlczoKCj4gVGhlIHNhbWUg
Y291bGQgYmUgYXNrZWQgb2Ygc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZS4gSSBmaW5kIGl0
IHZlcnkKPiBvZGQuIFdoeSBkb2VzIGl0IGNvbmZsYXRlIHRoZSBzeXNjYWxsIG51bWJlciB3aXRo
IGl0cyByZXR1cm4gdmFsdWU/Cj4KPiBJdCBuZXZlciB1c2VzIHRoZSBzeXNjYWxsIG51bWJlciBw
YXNzZWQgaW4gZXhjZXB0IHdoZW4gcmV0dXJuaW5nIGl0Cj4gdW5jaGFuZ2VkLiBXaGVuIGl0IHBv
a2VzIHRoZSByZWdpc3RlcnMgaXQgcmVhZHMgdGhlIHN5c2NhbGwgbnVtYmVyIGZyb20KPiB0aGVt
Lgo+Cj4gSWYgdGhlIGNhbGxlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIG9ubHkg
cmVhZCB0aGUgc3lzY2FsbAo+IG51bWJlciBmcm9tIHRoZSByZWdpc3RlcnMgd2hlbiBzeXNjYWxs
X2VudGVyX2Zyb21fdXNlcl9tb2RlIHJldHVybnMgYW5kCj4gaW5kaWNhdGVzIHRoZSBzeXNjYWxs
IHNob3VsZCBiZSBzdGlsbCBleGVjdXRlZCB0aGlzIHdob2xlIHNoZW5pZ2FuIHdvdWxkCgpJIGFn
cmVlLiBUaGUgZmFjdCB0aGF0IGlmIChuciA8IE5SX3N5c2NhbGwpIGp1c3Qgd29ya3MgYmVjYXVz
ZSAtMSBnZXRzCmNhc3RlZCB0byAweGZmZmZmZmZmIGFuZCBpcyB0aGVyZWZvcmUgb3V0IG9mIGJv
dW5kcyBpcyB2ZXJ5IG9kZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
