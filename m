Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12787E6B275
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 05:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkvbPvWqIBCdab5g60i+tYgMTJ1gZPPmUVTNrV0aPM0=; b=lvZ864Nv4SdD3y
	OrZ2+DhldSsmLh4lFoUWxJH90QRTUtxibsSCjSbC8NzM3rNmwBkPPEv8l28moXXwauvBhN9c0OFHs
	cJRH0J6CAAJeioNyJU3aAhpcJH+l7Fv98yiUv4DMRz8u7sVAG+r8ahDGxKEtisEDB5AM0AmilpBzd
	m2h0av8ax7HN12cKwzar3dI+fg8fJtOzWlE/i47zWlaSSMiyz0i75WJC3nEHOjAAZfdJz2JBiQnT1
	cBGgMIqzXLJCTrVO6g2lnEIcz3GL8mQyj7Dm1syjSUAFYScPf2+qJweNMWqbpsJIvoGlKlYn0gR9t
	k1wNrQ4PpAa5/T6bQgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvGw-0000000EZJC-17lV;
	Tue, 23 Dec 2025 05:49:26 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXvGu-0000000EZHF-0d1T
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 05:49:25 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BMFeGuI007059;
	Tue, 23 Dec 2025 05:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hUQC9Q
	qHxVAbj0doEs4oapZTuSJT6eFBkNbzGOXoVrU=; b=h43t/huXajZ4jf9NCBRDYj
	p/cMXkPwMgHWgoOQMd26dLhNQ1IGee5Dd3QhTmgWA8J+vLWQtACnQVdnamFyd5Tf
	20RbyP0raQj7+vJyr1P8ps2CFD17F53bJ8wVsDI0Ih+ZowRpKQ0GGXCU0/Oea1i4
	h7tUcozKcT2NUjAtm/XypP2NljapCSP2UGGBnsWjE3CJR1KxVFC0+2hOV4NFYITP
	DLA7zsZBpEHXS0ozKqfB8QRly6E/IKZl8k74FuNIXeWXT9DACVWgItuPnwJ8/Kv0
	OITX6IFwluivKVwChOlFQvnepItmlIG1p3MY2dVG36PZz3fO/fBRCuWS7GB1Z2IQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kh4bbtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 05:48:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BN5m4Ie004968;
	Tue, 23 Dec 2025 05:48:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kh4bbt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 05:48:25 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BN25mbv032310;
	Tue, 23 Dec 2025 05:48:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b68u11ff9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 05:48:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BN5mKch52429126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Dec 2025 05:48:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0D920043;
	Tue, 23 Dec 2025 05:48:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD18A20040;
	Tue, 23 Dec 2025 05:48:16 +0000 (GMT)
Received: from [9.124.209.226] (unknown [9.124.209.226])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Dec 2025 05:48:16 +0000 (GMT)
Message-ID: <972f7168-6dba-4a29-83e6-91f31355b90e@linux.ibm.com>
Date: Tue, 23 Dec 2025 11:18:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "David Hildenbrand (Red Hat)" <david@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Heiko Carstens <hca@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
 <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
 <87fr93ky5i.ritesh.list@gmail.com>
 <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
 <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
 <e97c41cd-44f7-4560-bc75-79283a438e91@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <e97c41cd-44f7-4560-bc75-79283a438e91@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=bulBxUai c=1 sm=1 tr=0 ts=694a2d2a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8
 a=yPCof4ZbAAAA:8 a=hSkVLCK3AAAA:8 a=i0EeH86SAAAA:8 a=jlNTI0j22tuo82LuuOcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-ORIG-GUID: 5InZCgUrAuKcmji2nC7kndDcD9vdRhpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA0NyBTYWx0ZWRfXy0fLUe1vayjV
 kV+7Uk/SF/f0PKKexUvcaZ+ZEKNF6UIiBmjoLyXWPR9CPX7OJeudE8DetFJb6fwYDpIHvep8BML
 FvmWzBGQo8kgJKZiMJ1goMztGjyCYMZRHijrZsriMy/dr4Yhei2IZ+3W2+kURjc0WNI5Hr0gOHJ
 HDOW+Xfd+ipapPm7xNHTA2xVswX8HPNajZYpu0m7Xd4DQQ97bXZDT+ZC8PQ4wEKEfEcNuYDrJei
 5+F3Yi0n/djy9LSjhBeJxkiUNHOFmuRJfeqi973qFJfNZK14MtYHkE7yxEzMWZmdrQzPm8kMLrr
 n97CVaqERBSYhA+nrI9rryOSP25AhPnRAKbeSbE/3SmAVPksqu/G6XtJUzF8AkxROuCIKD0qROM
 cY3YqTSPUOG4WHomj6F3yd6uvx7RMZ9A698qFoAXMvWSlukgtNXICO5MhRb66fqFR2783Qi6SI3
 LBSkZYWPauWZOAfXeVA==
X-Proofpoint-GUID: Euac01tVCVlxww6eiT2IVB5NPNIOAUsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512230047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_214924_220120_23AF4CC5 
X-CRM114-Status: GOOD (  24.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi8xMi8yNSAxNjoyNCwgQ2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JPVVApIHdyb3RlOgo+
Cj4KPiBMZSAyMi8xMi8yMDI1IMOgIDExOjI4LCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkg
YSDDqWNyaXTCoDoKPj4gT24gMTIvMjIvMjUgMDY6NTcsIFNvdXJhYmggSmFpbiB3cm90ZToKPj4+
Cj4+Pgo+Pj4gT24gMjIvMTIvMjUgMDg6NDIsIFJpdGVzaCBIYXJqYW5pIChJQk0pIHdyb3RlOgo+
Pj4+ICJEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkiIDxkYXZpZEBrZXJuZWwub3JnPiB3cml0
ZXM6Cj4+Pj4KPj4+Pj4+IENvbWluZyBiYWNrIHRvIHRoZSBmaXhlcyB0YWcuIEkgZGlkIG1lbnRp
b24gYSBiaXQgb2YgYSBoaXN0b3J5IAo+Pj4+Pj4gWzJdIG9mCj4+Pj4+PiB3aGF0ZXZlciBJIGNv
dWxkIGZpbmQgd2hpbGUgcmV2aWV3aW5nIHRoaXMgcGF0Y2guIEkgYW0gbm90IHN1cmUgCj4+Pj4+
PiB3aGV0aGVyCj4+Pj4+PiB5b3UgaGF2ZSBsb29rZWQgaW50byB0aGUgbGlua3Mgc2hhcmVkIGlu
IHRoYXQgZW1haWwgb3Igbm90LiBIZXJlIAo+Pj4+Pj4gWzJdOgo+Pj4+Pj4KPj4+Pj4+IFsyXTog
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/IAo+Pj4+Pj4g
dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbGludXhwcGMtIAo+Pj4+Pj4gZGV2
JTJGODc1eGEza3N6OS5yaXRlc2gubGlzdCU0MGdtYWlsLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0Nj
aHJpc3RvcGhlLmxlcm95JTQwY3Nncm91cC5ldSU3Q2ZlNDBmNDg4MWU4NDQxYWIzZWJmMDhkZTQx
NDRlNzQ3JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3QzYzOTAx
OTk2MTM3NzA5NjI5MiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25S
eWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lz
SWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9RG52enk1a0olMkJ5RjlHSmpJdyUy
QjEyRlRqYVZnZUFNMmdBOWc3aHNZbDdRb2slM0QmcmVzZXJ2ZWQ9MAo+Pj4+Pj4KPj4+Pj4+IFdo
ZXJlIEkgYW0gY29taW5nIGZyb20gaXMuLiBUaGUgY3VycmVudCBwYXRjaCBpcyBhY3V0YWxseSBh
IHBhcnRpYWwKPj4+Pj4+IHJldmVydCBvZiB0aGUgcGF0Y2ggbWVudGlvbmVkIGluIHRoZSBmaXhl
cyB0YWcuIFRoYXQgbWVhbnMgaWYgCj4+Pj4+PiB0aGlzIHBhdGNoCj4+Pj4+PiBnZXRzIGFwcGxp
ZWQgdG8gdGhlIG9sZGVyIHN0YWJsZSBrZXJuZWxzLCBpdCB3b3VsZCBlbmQgdXAgCj4+Pj4+PiBi
cmluZ2luZyB0aGUKPj4+Pj4+IHNhbWUgcHJvYmxlbSBiYWNrLCB3aGljaCB0aGUgIkZpeGVzIiB0
YWdnZWQgcGF0Y2ggaXMgZml4aW5nIGluIAo+Pj4+Pj4gdGhlIDFzdAo+Pj4+Pj4gcGxhY2UsIGlz
bnQnIGl0PyBTZWUgdGhpcyBkaXNjdXNzaW9uIFszXS4uLgo+Pj4+Pj4KPj4+Pj4+IFszXTogaHR0
cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/IAo+Pj4+Pj4gdXJs
PWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGYWxsJTJGYjFmMDRmOWYtZmE0Ni0gCj4+
Pj4+PiBjMmEwLTc2OTMtNGEwNjc5ZDJhMWVlJTQwb3JhY2xlLmNvbSUyRlQlMkYlMjNtMGVlZTg3
YjQ1OGQ5MzU1OTQyNmI4YjBlNzhkYzZlYmNkMjZhZDNhZSZkYXRhPTA1JTdDMDIlN0NjaHJpc3Rv
cGhlLmxlcm95JTQwY3Nncm91cC5ldSU3Q2ZlNDBmNDg4MWU4NDQxYWIzZWJmMDhkZTQxNDRlNzQ3
JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3QzYzOTAxOTk2MTM3
NzExNzE1MCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJ
bFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlq
b3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9Yk9PN0ZHTjRqQXRYM2pqQm5KVnBTdXJtTTly
R216OHZJczFpR3RibTFnVSUzRCZyZXNlcnZlZD0wIAo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiAuLi4g
U28sIElNTyAtIHRoZSByaWdodCBmaXhlcyB0YWcsIGlmIHdlIGhhdmUgdG8gYWRkLCBpdCBzaG91
bGQgCj4+Pj4+PiBiZSB0aGUKPj4+Pj4+IHBhdGNoIHdoaWNoIG1vdmVkIHRoZSBocGFnZV9zaGlm
dCBpbml0aWFsaXphdGlvbiB0byBoYXBwZW4gZWFybHkgCj4+Pj4+PiBpLmUuIGluCj4+Pj4+PiBt
bXVfZWFybHlfaW5pdF9kZXZ0cmVlLiBUaGF0IHdvdWxkIGJlIHRoaXMgcGF0Y2ggWzRdOgo+Pj4+
Pj4KPj4+Pj4+IFs0XTogaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/IAo+Pj4+Pj4gdXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZz
Y20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUyRnRvcnZhbGRzJTJGbGludXguZ2l0JTJGY29tbWl0
JTJGJTNGaWQlM0QyMzU0YWQyNTJiNjY2OTViZTAyZjRhY2QxOGUzN2JmNjI2NGYwNDY0JmRhdGE9
MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDZmU0MGY0ODgxZTg0NDFh
YjNlYmYwOGRlNDE0NGU3NDclN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM5MDE5OTYxMzc3MTMzODYwJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIw
ZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9J
am9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT0weVR1RUN5JTJC
QkdETGlTTll1cVlIOXhHQk9TeGlSTHhBdFclMkZXVFFVJTJGQiUyQkElM0QmcmVzZXJ2ZWQ9MAo+
Pj4+Pj4KPj4+Pj4+IE5vdywgaXQncyBub3QgcmVhbGx5IHRoYXQgdGhlIHBhdGNoIFs0XSBoYWQg
YW55IGlzc3VlIGFzIHN1Y2guIAo+Pj4+Pj4gQnV0IGl0Cj4+Pj4+PiBzZWVtcyBsaWtlLCB0aGF0
IHRoZSBjdXJyZW50IGZpeCBjYW4gb25seSBiZSBhcHBsaWVkIGFmdGVyIHBhdGNoIAo+Pj4+Pj4g
WzRdIGlzCj4+Pj4+PiB0YWtlbi4KPj4+Pj4+Cj4+Pj4+PiBEbyB3ZSBhZ3JlZT8KPj4+Pj4gSSB0
aGluayB3ZSBzaG91bGQgZG9jdW1lbnQgYWxsIHRoYXQgaW4gdGhlIGNvdmVyIGxldHRlciwgYW4g
ZGVzY3JpYmUKPj4+Pj4gdGhhdCB0aGlzIHBhcnRpYWwgcmV2ZXJ0IGlzIG9ubHkgcG9zc2libGUg
YWZ0ZXIgWzRdLAo+Pj4+IFllcywgSSBhZ3JlZS4gTGV0J3MgYWRkIHRoZSBhYm92ZSBkZXRhaWxz
IGluIHRoZSBjb21taXQgbXNnLgo+Pj4+Cj4+Pj4+IGFuZCB0aGF0IHRoYXQgbXVzdAo+Pj4+PiBi
ZSBjb25zaWRlcmVkIHdoZW4gYXR0ZW1wdGluZyBhbnkga2luZCBvZiBzdGFibGUgYmFja3BvcnRz
Lgo+Pj4+IFN1cmUuIEkgd291bGQgcHJlZmVyIGlmIHdlIGNoYW5nZSB0aGUgRml4ZXMgdGFnIHRv
IHRoZSBvbmUgd2hpY2ggSQo+Pj4+IHBvaW50ZWQgaW4gYWJvdmUgWzRdICh3aXRoIGV4cGxhaW5h
dGlvbiBpbiB0aGUgY29tbWl0IG1zZykuIEhvd2V2ZXIgCj4+Pj4gSSBhbQo+Pj4+IHN0aWxsIG9r
IGlmIHdlIHdvdWxkIGxpa2UgdG8gcmV0YWluIHRoZSBleGlzdGluZyBmaXhlcyB0YWcgYW5kIHNo
b3cgCj4+Pj4gWzRdCj4+Pj4gYXMgYSBkZXBlbmRlbmN5Lgo+Pj4KPj4+IEkgdGhpbmsgd2Ugc2hv
dWxkIGtlZXAgdGhlIGN1cnJlbnQgRml4ZXMgdGFnIHdpdGggYW4gZXhwbGFuYXRpb24gZm9yCj4+
PiBkZXBlbmRlbmN5Cj4+PiBvbiBbMV0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Pj4KPj4+IFdv
dWxkIGFueW9uZSBoYXZlIGEgZGlmZmVyZW50IHZpZXc/Cj4+Cj4+IFdoYXRldmVyIGludHJvZHVj
ZWQgdGhlIGlzc3VlIHNob3VsZCBiZSBjYWxsZWQgb3V0IGluIHRoZSBGaXhlcyB0YWc7IAo+PiBp
ZiB0aGVyZSBhcmUgZGVwZW5kZW5jaWVzIGZvciB0aGUgZml4IHRocm91Z2ggb3RoZXIgcGF0Y2hl
cyB0aGF0IHdlcmUgCj4+IGFscmVhZHkgbWVyZ2VkLCB0aGF0IGNhbiBiZSBkb2N1bWVudGVkIGlu
IHRoZSBwYXRjaCBkZXNjcmlwdGlvbiAKPj4gKHJlbGV2YW50IGZvciBzdGFibGUgb3IgZGlzdHJv
IGJhY2twb3J0cyBvbmx5KS4KPj4KPgo+IFdlIGNhbiBhbHNvIHVzZSB0aGUgRGVwZW5kcy1vbjog
dGFnLCBzZWUgZm9yIGV4ZW1wbGUgY29tbWl0IAo+IDk1MTdiODJkOGQ0MiAoIm5iZDogZGVmZXIg
Y29uZmlnIHB1dCBpbiByZWN2X3dvcmsiKToKPgo+IMKgwqDCoCBSZXBvcnRlZC1ieTogc3l6Ym90
KzU2ZmJmNGM3ZGRmNjVlOTVjN2NjQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiDCoMKgwqAg
Q2xvc2VzOiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjkwN2VkY2UuYTcwYTAyMjAu
MzczNTFiLjAwMTQuR0FFQGdvb2dsZS5jb20vVC8KPiDCoMKgwqAgRml4ZXM6IDg3YWFjM2E4MGFm
NSAoIm5iZDogbWFrZSB0aGUgY29uZmlnIHB1dCBpcyBjYWxsZWQgYmVmb3JlIAo+IHRoZSBub3Rp
ZnlpbmcgdGhlIHdhaXRlciIpCj4gwqDCoMKgIERlcGVuZHMtb246IGUyZGFlYzQ4OGM1NyAoIm5i
ZDogRml4IGh1bmd0YXNrIHdoZW4gbmJkX2NvbmZpZ19wdXQiKQo+IMKgwqDCoCBTaWduZWQtb2Zm
LWJ5OiBaaGVuZyBRaXhpbmcgPHpoZW5ncWl4aW5nQGh1YXdlaS5jb20+Cj4gwqDCoMKgIFNpZ25l
ZC1vZmYtYnk6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KClRoYW5rcyBmb3IgdGhlIHN1
Z2dlc3Rpb24gQ2hyaXN0b3BoZS4gSSB3aWxsIHVzZSBEZXBlbmRzLW9uIHRhZy4KCi0gU291cmFi
aCBKYWluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
