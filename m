Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D027CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D50nF58Tw6+veu8AnK+sWsVEHcoeVUpwPm3CBeIoNqU=; b=n79Ru3pgdLMvhO
	9ZQxgrRpE21EF7PhgzsTZYL4NjYwpY8DEWiLGSOyaMOahZTJSvIF7UpZVfz85JaBD8owj80z4tsjJ
	2iZvGExNdMAa7+VZAg5OY87JDbDPLF0/HypxgCnM7U+VuB6m5zzmdGoeidP5xD5h5u6D5XC4Z+USL
	DZYT2RgJt7Cv4RYrDWPV1+8L5tHKQyLS7Iqh5aipJmSdhcgbf6p0mO3BBjBiYDhoCPp3CeqwQ5VT6
	zVz3Mcfoio5sa6wZN/XEJHIfyokS4M/sbEOQ3cOB8fFShzOidfS1fb14S4zsiCA9tDLKeliVH4lZT
	pDvz4Fj6yGJB2A5m8hUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7WT-00HTQb-3Q; Mon, 07 Nov 2022 19:11:05 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7Uh-00HSUg-B2; Mon, 07 Nov 2022 19:09:17 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7IMGET008477;
	Mon, 7 Nov 2022 19:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8yB1T9kkcj6JZp4TFm1A7hnrKTeQoKKGrd8tbPdyOEs=;
 b=mPK9o5wVItAdUCHHrTW+8HPUpMJmXCn685NlXKeVscLMgyHN4njk8bVPEIHZQPcPLZqK
 Ztz8RCrPoADtS/PrmmIEoIPAMygo0OG+ehIy/Xh5qIWr83a/qhrmNPRWHT7LucYzuM6v
 GRY8EZO5Yi9cBmIGqjDcuXfelRLAZTOy12d0YJGmmFC79SKpFsiYDDpFKy4ciSN4pXgq
 ZH3CiU5g+v8IvCRrWHCXajaSzXembp+poMANK9d6PkKxLctLIG6WcGSnTwltbKhrZ/q9
 fu9tqSDViuxcUkN+0hEHKxNVgqwvD3l/8QHsqgCbXQ/CCD24BS1R0u7ACKjl2l8sEdL4 +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1vspb26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A7IgUpc024059;
	Mon, 7 Nov 2022 19:08:56 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1vspb1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:56 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7J6ZLd012249;
	Mon, 7 Nov 2022 19:08:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01wdc.us.ibm.com with ESMTP id 3kngs3smh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 19:08:55 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7J8sh916712426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 19:08:54 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26BC558068;
	Mon,  7 Nov 2022 19:08:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 430D958060;
	Mon,  7 Nov 2022 19:08:50 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown [9.65.225.56])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 19:08:50 +0000 (GMT)
Message-ID: <13c194d02d02a0e2adc006c724809b63c11f1e80.camel@linux.ibm.com>
Subject: Re: [PATCH 30/44] KVM: Drop kvm_arch_check_processor_compat() hook
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
Date: Mon, 07 Nov 2022 14:08:47 -0500
In-Reply-To: <20221102231911.3107438-31-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-31-seanjc@google.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RHHp999uHGQe6ZCvMSlBReRcUeSiiV8m
X-Proofpoint-GUID: DuaePqxTnOnEid3ZLdZuErIqRkSISZr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_09,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=793
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211070152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_110915_765351_03402A34 
X-CRM114-Status: GOOD (  13.59  )
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
b3RlOgo+IERyb3Aga3ZtX2FyY2hfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCgpIGFuZCBpdHMgc3Vw
cG9ydCBjb2RlIG5vdyB0aGF0Cj4gYWxsCj4gYXJjaGl0ZWN0dXJlIGltcGxlbWVudGF0aW9ucyBh
cmUgbm9wcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPiAtLS0KPiDCoGFyY2gvYXJtNjQva3ZtL2FybS5jwqDCoMKgwqDCoMKgIHzC
oCA3ICstLS0tLS0KPiDCoGFyY2gvbWlwcy9rdm0vbWlwcy5jwqDCoMKgwqDCoMKgIHzCoCA3ICst
LS0tLS0KPiDCoGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmPCoCB8wqAgMiArLQo+IMKgYXJjaC9w
b3dlcnBjL2t2bS9lNTAwLmPCoMKgwqAgfMKgIDIgKy0KPiDCoGFyY2gvcG93ZXJwYy9rdm0vZTUw
MG1jLmPCoCB8wqAgMiArLQo+IMKgYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMgfMKgIDUgLS0t
LS0KPiDCoGFyY2gvcmlzY3Yva3ZtL21haW4uY8KgwqDCoMKgwqAgfMKgIDcgKy0tLS0tLQo+IMKg
YXJjaC9zMzkwL2t2bS9rdm0tczM5MC5jwqDCoCB8wqAgNyArLS0tLS0tCj4gwqBhcmNoL3g4Ni9r
dm0vc3ZtL3N2bS5jwqDCoMKgwqAgfMKgIDQgKystLQo+IMKgYXJjaC94ODYva3ZtL3ZteC92bXgu
Y8KgwqDCoMKgIHzCoCA0ICsrLS0KPiDCoGFyY2gveDg2L2t2bS94ODYuY8KgwqDCoMKgwqDCoMKg
wqAgfMKgIDUgLS0tLS0KPiDCoGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaMKgwqAgfMKgIDQgKy0t
LQo+IMKgdmlydC9rdm0va3ZtX21haW4uY8KgwqDCoMKgwqDCoMKgIHwgMjQgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gwqAxMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2NyBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBFcmljIEZhcm1hbiA8ZmFybWFuQGxpbnV4LmlibS5j
b20+CSMgczM5MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
