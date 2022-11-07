Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920E6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9h/wMilCCUyzIPXYojxQoBLkYpUOKz9wFYenoXeS00=; b=Xn89q2yfGBMwSz
	iLxL3NNjm/Sh+AAPIwNdfW2onAwrqCEyID47+uN+n/Ms1UqGPlB2lGNwoEUOHYU574uneELd7xsw5
	1N1/PYamJKFNgBer12q717frBl9VEgdwMbAo0EGGJNmFHfJMf1CMHckadynIBPDlRjzYpJHqMBZ5V
	VA1LcMrLZjQ/ZvwnAJRGl+JgHHLCis32wmWnGP3G21rLYL6ixwgXWG6YcFiowHE3XlkwqsQOpHx9u
	EhzbYaTsc+PMuWIysXIygAOPO/4OqzGinQqJUoZzrtOvy3aQUrN5cSeRONm1BD0W+aRmt7v5YmthJ
	5ZN3a4ID39Yrszg+1n9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6R0-00H0Ex-CB; Mon, 07 Nov 2022 18:01:22 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6O4-00GysF-5H; Mon, 07 Nov 2022 17:58:21 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7GwDic011947;
	Mon, 7 Nov 2022 17:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YihfQm6JRpW3FFMAWPS/MkEOkqiW/lbLXXaGSks5I5Y=;
 b=RmD9JtKvUg9mHfb6CMoDoiJwC4LwdRkwwMPnUP0+ML3lsvjLRm5m1SxYiMb3WRhYQFk0
 VVTpLv10dzML14PzTxA17a+meZi9SVZlmkNg/nNXWorX1oVwSU05SmVRYjq76jbrEwe7
 ix+v4arhKFwHnLT5ZzI7WGnJm5nL1eaZZIYSXxqgmKN3lhZIF5Aez2YyK2FLT2o3PvCa
 P4/4GWhyQ1jb6gNiyeSCtYeSAXD38BT8KoUps434p/v3mRFsfpmY4GruA8/z9GDigjvt
 JesjjGdkEkLL7eNvk3XJ78eYdrhitHcx3p7SiQxW6u1SuwPxBdPqwR1FSz3X1CM/pw/Z ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14xc29y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:25 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7GAU5a024872;
	Mon, 7 Nov 2022 17:57:24 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14xc296-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:24 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7Hotxo017059;
	Mon, 7 Nov 2022 17:57:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 3kngphwhp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 17:57:23 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7HvI5v35914384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 17:57:18 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38E3658062;
	Mon,  7 Nov 2022 17:57:21 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1971F58059;
	Mon,  7 Nov 2022 17:57:18 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 17:57:17 +0000 (GMT)
Message-ID: <1386ccd1ff60cb8e4af80fbb294160a8d7cc3b5b.camel@linux.ibm.com>
Subject: Re: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init()
 piece-by-piece() if a step fails
From: Eric Farman <farman@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen
 <chenhuacai@kernel.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
        Alexandru Elisei
 <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Date: Mon, 07 Nov 2022 12:57:17 -0500
In-Reply-To: <20221102231911.3107438-6-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-6-seanjc@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x0CFSwe6XYz-Xhj4j-0SH7l6f0V92YqI
X-Proofpoint-GUID: 6DNbjcvPaQN4ZD-vbbGxEV1nmcCcrdiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_095820_259788_73C00CD6 
X-CRM114-Status: GOOD (  18.04  )
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

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE4ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOgo+IEluIHByZXBhcmF0aW9uIGZvciBmb2xkaW5nIGt2bV9hcmNoX2hhcmR3YXJlX3NldHVw
KCkgaW50bwo+IGt2bV9hcmNoX2luaXQoKSwKPiB1bndpbmQgaW5pdGlhbGl6YXRpb24gb25lIHN0
ZXAgYXQgYSB0aW1lIGluc3RlYWQgb2Ygc2ltcGx5IGNhbGxpbmcKPiBrdm1fYXJjaF9leGl0KCku
wqAgVXNpbmcga3ZtX2FyY2hfZXhpdCgpIHJlZ2FyZGxlc3Mgb2Ygd2hpY2gKPiBpbml0aWFsaXph
dGlvbgo+IHN0ZXAgZmFpbGVkIHJlbGllcyBvbiBhbGwgYWZmZWN0ZWQgc3RhdGUgcGxheWluZyBu
aWNlIHdpdGggYmVpbmcKPiB1bmRvbmUKPiBldmVuIGlmIHNhaWQgc3RhdGUgd2Fzbid0IGZpcnN0
IHNldHVwLsKgIFRoYXQgaG9sZHMgdHJ1ZSBmb3Igc3RhdGUKPiB0aGF0IGlzCj4gY3VycmVudGx5
IGNvbmZpZ3VyZWQgYnkga3ZtX2FyY2hfaW5pdCgpLCBidXQgbm90IGZvciBzdGF0ZSB0aGF0J3MK
PiBoYW5kbGVkCj4gYnkga3ZtX2FyY2hfaGFyZHdhcmVfc2V0dXAoKSwgZS5nLiBjYWxsaW5nCj4g
Z21hcF91bnJlZ2lzdGVyX3B0ZV9ub3RpZmllcigpCj4gd2l0aG91dCBmaXJzdCByZWdpc3Rlcmlu
ZyBhIG5vdGlmaWVyIHdvdWxkIHJlc3VsdCBpbiBsaXN0IGNvcnJ1cHRpb24KPiBkdWUKPiB0byBh
dHRlbXB0aW5nIHRvIGRlbGV0ZSBhbiBlbnRyeSB0aGF0IHdhcyBuZXZlciBhZGRlZCB0byB0aGUg
bGlzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4KPiAtLS0KPiDCoGFyY2gvczM5MC9rdm0va3ZtLXMzOTAuYyB8IDIxICsrKysrKysr
KysrKysrLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51eC5pYm0uY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
