Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE924D4A5F4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJjvDOmN9a7gH5rVLBkQKk/dyre9HWYdZhLiwws0Tps=; b=tMX5d9r2RVtx48
	fI9FBAO/LILw8Lg6vlk6Q0RGRikYFXMT4/yNUI3+ODP03o8mb9vyHRjFLEPhwbUxsyPIZAa/mrt7y
	2P5V2U6k0KVlUNFXPUhiVB5AlUFD12HIlVAl/w6RaIKh6KOEffAbAWMqQGONw7D/17nNTfh/QGNkR
	YbpiGwbT8r/+OfMsj2mUQpuIuPgTzetDMVLE5oRTmV4/d03TtSQw8Ta/2ShbgGHytNBzJG953RAJZ
	Fb+xMq3DnXFIyXJdROL/LSi355ka8RCRl1Nza0FI1wIC2ekGyuCW/tNfTICuQ9k2MfoyQ86AIjjEH
	02E9VVCFTkGy6QIBrpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaHk-0000000DVvQ-2Qqx;
	Fri, 16 Jan 2026 03:14:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaHh-0000000DVuv-3VPU;
	Fri, 16 Jan 2026 03:14:03 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNIHeB029136;
	Fri, 16 Jan 2026 03:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fW9DCo
	yeRwgZraySQWN8vHpYbvVPEVqIauwbJyIM5A0=; b=NYygGJ9J3OYSrN2x4e9z6X
	NYJJ7RxBn3MNL1AVw7mshGtX9hPULZCWlATJxyuqbZdUQNguUfdOxrarn4j5Ydg1
	AGxQ+d5Zgz6XZzKjE2TXf58qyp1fSESB+YjMrh9aoxPdurBGbMmC22goMcZuNX/z
	f9zzUdAKK6dBmJVMrUhMz+afmJX2H72x6505h4wAImixn8Ym3Uw54J2ocq8sNd24
	Tnbr6UBUIEDOOI/BkljqDwrEkqyz7B/CNXwLzBbk12VTJjv2QrIFNMGmWZWDEcyy
	x/HlZF3eMB4ZeJMeBQ6mXmns4eec10jUcxphWK90EAjjjDG36OrRJ2dqbKDWG3tQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G3DoSk002919;
	Fri, 16 Jan 2026 03:13:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNYKXh014274;
	Fri, 16 Jan 2026 03:13:50 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fykxcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G3DnoW25101006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 03:13:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BE25805C;
	Fri, 16 Jan 2026 03:13:48 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A470458051;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Message-ID: <ba35672820c2fbad2611a0a89b3cb60125776f9b.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Pasha Tatashin	
 <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Rohan McLure	 <rmclure@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
        x86@kernel.org, Nicholas Miehlbradt
 <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan	 <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Fri, 16 Jan 2026 14:13:42 +1100
In-Reply-To: <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
		<CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
		<bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
		<b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
		<cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
	 <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=6969acef cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Y5EJBO6SgJiHs8anXDIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 55htG9PDokbxJx8uQ6srL93nebqrpK1p
X-Proofpoint-GUID: YOi29F4SNz54m1WROzu-sRkP6zlVhnnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyMiBTYWx0ZWRfX+AFfHh/cyIIs
 bJQv6kvsfmeTtynUjb6q5acSz5NV99GlwAWc2Cdw+aIY773Sk1Jx0AU8AGPqrkiFsh5DIgsWZab
 l4KzZtSHmo4HZ6zzXOr8C5VRJI8wJtmrLRHxvQhtRdWyhdOlJTWYsr11jTchKxv8aEGc7AQSEH4
 PewoYzY2OxNY+PBDkh/xfq7ECz3wsnqg4Ot0ixK+uM67WU1GFayhSS1Xv2R94C2p1Aleg6ympam
 PBuyjS4HCHvSNa/blb2ORlmIncCBmSTSBjvXh3yuRJ8/x9kPI30vigZ97XQ+5gUduWdvjeZOz64
 5yUKs1skk9SpC5UfQMTteYAjlJmk9mR3kPFfFR76igDW6b1BTU7Z4deWPfgEJ2SzlNbgWL6xkdN
 1KEbXNv7crX3PHM3ZLXRK+2ftCyNFptvnp/hpTMzaDxvNeGOnIODTok8V2WUhnRn2GL6xdQHsCl
 /G87cYrP3vwn/veSdtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601160022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_191402_024530_7D3BB614 
X-CRM114-Status: GOOD (  20.81  )
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

T24gVGh1LCAyMDI2LTAxLTE1IGF0IDE2OjE4IC0wODAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+
IE9uIFRodSwgMTUgSmFuIDIwMjYgMTc6MTM6MjYgKzExMDAgQW5kcmV3IERvbm5lbGxhbiA8YWpk
QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+IAo+ID4gT24gV2VkLCAyMDI2LTAxLTE0IGF0IDEwOjM0
ICswMTAwLCBDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgd3JvdGU6Cj4gPiA+IFdoYXQgaXMg
dGhlIG1lcmdlIHBsYW4gPyBJIHNlZSBhbGwgcG93ZXJwYyBjb21taXRzIGFyZSBhY2tlZCBieSBN
YWRkeSwgCj4gPiA+IHdpbGwgdGhlIHNlcmllcyBiZSBtZXJnZWQgYnkgQW5kcmV3IGludG8gdGhl
IG1tIHRyZWUgPwo+ID4gCj4gPiBUaGlzIGlzIHdoYXQgSSB3YXMgZXhwZWN0aW5nIC0gdGhpcyBy
ZXZpc2lvbiBpcyByZWJhc2VkIG9uIG1tLW5ldyBhcyBpdAo+ID4gc3Rvb2QKPiA+IGFyb3VuZCB3
aGVuIEkgc2VudCBpdC4KPiAKPiBPdWNoLCBzb3JyeSwgSSBkaWQgbm90IHVuZGVyc3RhbmQgdGhp
cy7CoCBTbyB3ZSd2ZSBsb3N0IDQgd2Vla3MgdGVzdGluZyA6KAo+IAo+IFRoZSBjb3JlIE1NIGFu
ZCBBUk0gY2hhbmdlcyBhcmUgdHJpdmFsLCBpbiB0aGUgaWYtaXQtY29tcGlsZXMtaXQtd29ya3MK
PiBjYXRlZ29yeS7CoCBJcyB0aGUgbW0gdHJlZSByZWFsbHkgdGhlIGJlc3QgcGxhY2UgZm9yIHRo
aXM/wqAgSXQnbGwgZ2V0Cj4gbW9yZSB0ZXN0aW5nIGluIHRoZSBwb3dlcnBjIHRyZWU/Cj4gCj4g
QnV0IGlmIHlvdSdyZSBPSyB3aXRoIGl0LCBJJ20gT0sgd2l0aCBpdC4KPiAKPiA+IEJ5IHRoZSB3
YXkgaXQgZG9lc24ndCBhcHBseSBvbiB0b3Agb2YgcG93ZXJwYy9tZXJnZSBicmFuY2g6Cj4gCj4g
SSBndWVzcyB3ZSdsbCBiZSBoZWFyaW5nIGZyb20gTWFyayB3aGVuIHRoaXMgaGl0cyBsaW51eC1u
ZXh0LiAKPiBIb3BlZnVsbHkgdGhlIHJlc29sdXRpb24gaXNuJ3QgaG9ycmlibGUuCj4gCj4gQXMg
SSdtIGFkZGluZyB0aGlzIHRvIG1tLmdpdCdzIG1tLW5ldyBicmFuY2gsIE1hcmsgd29uJ3QgYWN0
dWFsbHkgYmUKPiBzZWVpbmcgaXQuwqAgSSdsbCBhaW0gdG8gbW92ZSB0aGlzIGludG8gbW0tdW5z
dGFibGUgKGFuZCBoZW5jZQo+IGxpbnV4LW5leHQpIGFmdGVyIGp1c3QgYSBzaW5nbGUgZGF5LgoK
VGhhbmtzLCBzb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiEgKkhvcGVmdWxseSogMTh0aCB0aW1lJ3Mg
dGhlIGNoYXJtLi4uCgoKLS0gCkFuZHJldyBEb25uZWxsYW4gICAgT3pMYWJzLCBBREwgQ2FuYmVy
cmEKYWpkQGxpbnV4LmlibS5jb20gICBJQk0gQXVzdHJhbGlhIExpbWl0ZWQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
