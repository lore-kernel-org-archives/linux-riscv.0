Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3E7CD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUJl2hcqrWsf/n5OSPcjmrYo4U+6E/dCcrDAXRA18KE=; b=uiazGLUbPskST9
	vaPElmzH7qA5R4P+cnlm6wPlWln4af0YaR4upNKDPcq4K8JihHf+DpWOhA2FYyylr5R88yDnnNby5
	2RGqX0G7leBd0mZ1JWYSL0kZuZk0bliWHRWeb20rEOiCbbVtGk13kaOtOPbw27izevpkR3zCO6k8K
	4bseWbreqdXBEXO2BABaw3ysJY2FwFLMJoIH4wG4VhVa5ZyrZvOUOTXxRN0LsABYvtMspvf9WEiZM
	M7xSeMEN7TNIJCBpA/tuRMFEc3uQ4eNWF9xOxYBfFLndjTNm6R7k9Lk9deXcH345HmkC259u0R4MD
	NbQGyYvsOkOL4fVPytYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUSq-00000009X4Y-3RBJ;
	Tue, 02 Apr 2024 03:05:32 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUSk-00000009X2U-2BQl;
	Tue, 02 Apr 2024 03:05:28 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4322pAve001216;
	Tue, 2 Apr 2024 03:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=iQwzyM3YuPSqsRjXfGIgPKdaOi+Dw2asit+BiGT5wIQ=;
 b=dQ9yjcRHLw1deKP1zuA5qKSiGRobaUtAWmhCnVcADROMAEUfPamNlRDIU9l4PpKo0CIM
 +J7Nt8StNDTUbyDXWYCKBM6qU5BA7Qh2suFzZJkl0TXgagiDKtrRbhEcIpvin4L7vz3v
 w1vl5cYTC1YzLuWbzBo3gI400mxh+YJuunCRmDM3NtXKcDyyiLTX/W022k70ZlrutHUx
 JJMDbqslb+ZbMUyZZB9OBGCLUlHzFxox10JiraGI9ezRDaHw4sMm+mASUUEqI24GCYWV
 U7axd0HhptCR2TT/CGPj3PZxKESxjsBTVDcdvfGMfBIjx2mZN1ZOKtNIJVMUAZgROEGV rQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x898ag1n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 03:05:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4322a37X008477;
	Tue, 2 Apr 2024 03:00:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6w2tv924-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 03:00:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43230usK47120648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Apr 2024 03:00:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E48FC2004D;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C86C20040;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Apr 2024 03:00:55 +0000 (GMT)
Received: from [9.69.91.168] (unknown [9.69.91.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CE3BA6009D;
	Tue,  2 Apr 2024 14:00:46 +1100 (AEDT)
Message-ID: <f774bbfc766966a0ec7742c5b0c4e60e6ea42f94.camel@linux.ibm.com>
Subject: Re: [PATCH v11 00/11] Support page table check PowerPC
From: Rohan McLure <rmclure@linux.ibm.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, linux-mm@kvack.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        x86@kernel.org
Date: Tue, 02 Apr 2024 14:00:42 +1100
In-Reply-To: <ZgU4LoWBXDeJY8VS@gmail.com>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
	 <ZgU4LoWBXDeJY8VS@gmail.com>
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kSmGIbO-lEBXnvbtf7A196zFBtw95S1S
X-Proofpoint-GUID: kSmGIbO-lEBXnvbtf7A196zFBtw95S1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=943 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_200526_666530_8722AC0B 
X-CRM114-Status: GOOD (  20.99  )
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

T24gVGh1LCAyMDI0LTAzLTI4IGF0IDEwOjI4ICswMTAwLCBJbmdvIE1vbG5hciB3cm90ZToKPiAK
PiAqIFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPiB3cm90ZToKPiAKPiA+IFJv
aGFuIE1jTHVyZSAoMTEpOgo+ID4gwqAgUmV2ZXJ0ICJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1v
dmUgdW51c2VkIHBhcmFtZXRlciBpbgo+ID4gW19fXXBhZ2VfdGFibGVfY2hlY2tfcHVkX3NldCIK
PiA+IMKgIFJldmVydCAibW0vcGFnZV90YWJsZV9jaGVjazogcmVtb3ZlIHVudXNlZCBwYXJhbWV0
ZXIgaW4KPiA+IFtfX11wYWdlX3RhYmxlX2NoZWNrX3BtZF9zZXQiCj4gPiDCoCBSZXZlcnQgIm1t
L3BhZ2VfdGFibGVfY2hlY2s6IHJlbW92ZSB1bnVzZWQgcGFyYW1ldGVyIGluCj4gPiBbX19dcGFn
ZV90YWJsZV9jaGVja19wdWRfY2xlYXIiCj4gPiDCoCBSZXZlcnQgIm1tL3BhZ2VfdGFibGVfY2hl
Y2s6IHJlbW92ZSB1bnVzZWQgcGFyYW1ldGVyIGluCj4gPiBbX19dcGFnZV90YWJsZV9jaGVja19w
bWRfY2xlYXIiCj4gPiDCoCBSZXZlcnQgIm1tL3BhZ2VfdGFibGVfY2hlY2s6IHJlbW92ZSB1bnVz
ZWQgcGFyYW1ldGVyIGluCj4gPiBbX19dcGFnZV90YWJsZV9jaGVja19wdGVfY2xlYXIiCj4gCj4g
SnVzdCBhIHByb2Nlc3MgcmVxdWVzdDogcGxlYXNlIGdpdmUgdGhlc2UgY29tbWl0cyBwcm9wZXIg
dGl0bGVzLCB0aGV5Cj4gYXJlIG5vdCByZWFsbHkgJ3JldmVydHMnIGluIHRoZSBjbGFzc2ljYWwg
c2Vuc2UsIGFuZCB0aGlzIHRpdGxlIGhpZGVzCj4gd2hhdCBpcyBiZWluZyBkb25lIGluIHRoZSBj
b21taXQuIFRoZSB0eXBpY2FsIHVzZSBvZiByZXZlcnRzIGlzIHRvIAo+IHJldmVydCBhIGJhZCBj
aGFuZ2UgYmVjYXVzZSBpdCBicm9rZSBzb21ldGhpbmcuIEhlcmUgdGhlIGdvYWwgaXMgdG8gCj4g
cmVpbnRyb2R1Y2UgZnVuY3Rpb25hbGl0eS4KPiAKPiBTbyBwbGVhc2UgbmFtZSB0aGVzZSA1IHBh
dGNoZXMgYWNjb3JkaW5nbHksIHRvIHNoZWQgbGlnaHQgb24gd2hhdCBpcyAKPiBiZWluZyByZWlu
dHJvZHVjZWQuIFlvdSBjYW4gbWVudGlvbiBpdCBhdCB0aGUgZW5kIG9mIHRoZSBjaGFuZ2Vsb2cK
PiB0aGF0IAo+IGl0J3MgYSBmdW5jdGlvbmFsIHJldmVydCBvZiBjb21taXQgWFlaLCBidXQgdGhh
dCdzIG5vdCB0aGUgcHJpbWFyeSAKPiBwdXJwb3NlIG9mIHRoZSBjb21taXQuCgpUaGFua3MgZm9y
IHlvdXIgZW1haWwsIEknbGwgZG8ganVzdCB0aGF0LgoKPiAKPiBUaGFua3MsCj4gCj4gCUluZ28K
CkNoZWVycywKUm9oYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
