Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B66C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmyRtKEHTsCL3+pYIXSxvZifEr0cgH3fmOhxFOv9oNs=; b=kfkGU1DfVHnROx
	wLEDER4HfDxb+3n9CINwKJjpGXMX8RIFzrVcETJjhrjnbb4Pg71hyIslUp9DN+lOsjNljePuD3CVl
	vOqtmf33+Ne2DnTHLjzWRE+xFpzLhqopk2TwDloI4kYAjOyhR9poamzghdVRYeen9DonYmBZqckRM
	Ag3iefmabbn4xUj0iCTBNUq822ienKe/ZMtlYmRUXkfRXx01MKOgH01+KShvN0i99hvdEELjmSnre
	DnFo1axMH2zqkYmSD7lK0C2zsXKoTAkEytXuze4bxh60fylXV7vDziD0PLGxyT53hAGkPnpSyHmb8
	GsoXXhJ9jhZjtUFN6WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q04B5-00Gu35-0J;
	Fri, 19 May 2023 17:46:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q04B1-00Gu22-2Y;
	Fri, 19 May 2023 17:46:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34JFMfDd012512;
	Fri, 19 May 2023 17:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eudHzY6WP7JinnfOr70AykPZvSkkpEMxuNg8hMfppYo=;
 b=DMV0U+nIXEVCY+aepXRfFYvdfBeVO+N4QF0je1NreoKWWMhdhmNCmkCFY69GHp3G1MUl
 W4uLhQQIfJlWzCmL2UlwpB67SLBLlnvd3eaMcPBXY3xpzTd4DPesNiwRSj6AMqZBspVo
 08MDwx36HiK4jQA4XpyJQxV1CWo2sx0aEh71PEANzSjVcRsNE8URDp/9OH/+p2Kh4/Bd
 u8dY8/MWw20kSLCJ06My3a975QQQC9ySq7nhEqEvzzuIHXWUfJmJ+Gzj0a0CNBUiRPUE
 dcRr1k8AfSKrqIM3q0pDGScz3hGnOYsEF+bviVQ6TCuLFhAIK7GTUA+1LUQeisPdvBFr pg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp95v0w04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 17:45:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JHj1wR008027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 17:45:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 10:44:59 -0700
Message-ID: <ebe36911-024a-839c-3b7e-05c99bfb0d66@quicinc.com>
Date: Fri, 19 May 2023 11:44:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [patch V4 36/37] x86/smpboot: Support parallel startup of
 secondary CPUs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        David Woodhouse
	<dwmw2@infradead.org>
CC: <x86@kernel.org>, Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen
	<arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney
	<paulmck@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sean
 Christopherson <seanjc@google.com>,
        Oleksandr Natalenko
	<oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme
 G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
        Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
        <xen-devel@lists.xenproject.org>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren
	<guoren@kernel.org>,
        <linux-csky@vger.kernel.org>,
        Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,
        <linux-mips@vger.kernel.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller
	<deller@gmx.de>, <linux-parisc@vger.kernel.org>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sabin
 Rapan <sabrapan@amazon.com>,
        "Michael Kelley (LINUX)"
	<mikelley@microsoft.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        David
 Woodhouse <dwmw@amazon.co.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.411554373@linutronix.de>
 <16562305-3bc0-c69f-0cb5-1b9da1014f19@quicinc.com>
 <0cafbfcb-2430-6d90-ee77-4e5de08ee1da@citrix.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <0cafbfcb-2430-6d90-ee77-4e5de08ee1da@citrix.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wzgfaxTFUND7jtAhGx51l9t9Ic-_fDjs
X-Proofpoint-GUID: wzgfaxTFUND7jtAhGx51l9t9Ic-_fDjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_12,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_104603_832718_88F34B88 
X-CRM114-Status: GOOD (  19.72  )
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

T24gNS8xOS8yMDIzIDEwOjU3IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDE5LzA1LzIw
MjMgNToyOCBwbSwgSmVmZnJleSBIdWdvIHdyb3RlOgo+PiAgwqAgREVTQ0VORCBvYmp0b29sCj4+
ICDCoCBJTlNUQUxMIGxpYnN1YmNtZF9oZWFkZXJzCj4+ICDCoCBDQUxMwqDCoMKgIHNjcmlwdHMv
Y2hlY2tzeXNjYWxscy5zaAo+PiAgwqAgQVPCoMKgwqDCoMKgIGFyY2gveDg2L2tlcm5lbC9oZWFk
XzY0Lm8KPj4gYXJjaC94ODYva2VybmVsL2hlYWRfNjQuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+
PiBhcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5TOjI2MTogRXJyb3I6IG1pc3NpbmcgJyknCj4+IGFy
Y2gveDg2L2tlcm5lbC9oZWFkXzY0LlM6MjYxOiBFcnJvcjoganVuayBgVUw8PDEwKScgYWZ0ZXIg
ZXhwcmVzc2lvbgo+PiAgwqAgQ0PCoMKgwqDCoMKgIGFyY2gveDg2L2tlcm5lbC9oZWFkNjQubwo+
PiAgwqAgQ0PCoMKgwqDCoMKgIGFyY2gveDg2L2tlcm5lbC9lYmRhLm8KPj4gIMKgIENDwqDCoMKg
wqDCoCBhcmNoL3g4Ni9rZXJuZWwvcGxhdGZvcm0tcXVpcmtzLm8KPj4gc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDozNzQ6IHJlY2lwZSBmb3IgdGFyZ2V0Cj4+ICdhcmNoL3g4Ni9rZXJuZWwvaGVhZF82
NC5vJyBmYWlsZWQKPj4gbWFrZVszXTogKioqIFthcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5vXSBF
cnJvciAxCj4+IG1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4+
IHNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk0OiByZWNpcGUgZm9yIHRhcmdldCAnYXJjaC94ODYv
a2VybmVsJyBmYWlsZWQKPj4gbWFrZVsyXTogKioqIFthcmNoL3g4Ni9rZXJuZWxdIEVycm9yIDIK
Pj4gc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTQ6IHJlY2lwZSBmb3IgdGFyZ2V0ICdhcmNoL3g4
NicgZmFpbGVkCj4+IG1ha2VbMV06ICoqKiBbYXJjaC94ODZdIEVycm9yIDIKPj4gbWFrZVsxXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPj4gTWFrZWZpbGU6MjAyNjogcmVj
aXBlIGZvciB0YXJnZXQgJy4nIGZhaWxlZAo+PiBtYWtlOiAqKiogWy5dIEVycm9yIDIKPj4KPj4g
VGhpcyBpcyB3aXRoIEdDQyA1LjQuMCwgaWYgaXQgbWF0dGVycy4KPj4KPj4gUmV2ZXJ0aW5nIHRo
aXMgY2hhbmdlIGFsbG93cyB0aGUgYnVpbGQgdG8gbW92ZSBmb3J3YXJkLCBhbHRob3VnaCBJCj4+
IGFsc28gbmVlZCB0byByZXZlcnQgIng4Ni9zbXBib290LzY0OiBJbXBsZW1lbnQKPj4gYXJjaF9j
cHVocF9pbml0X3BhcmFsbGVsX2JyaW5ndXAoKSBhbmQgZW5hYmxlIGl0IiBmb3IgdGhlIGJ1aWxk
IHRvCj4+IGZ1bGx5IHN1Y2NlZWQuCj4+Cj4+IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIGNv
ZGUsIGFuZCBub3RoaW5nIG9idmlvdXMgc3RhbmRzIG91dCB0byBtZS4KPj4gV2hhdCBjYW4gSSBk
byB0byBoZWxwIHJvb3QgY2F1c2UgdGhpcz8KPiAKPiBDYW4geW91IHRyeToKPiAKPiAtI2RlZmlu
ZSBYQVBJQ19FTkFCTEXCoMKgwqAgKDFVTCA8PCAxMSkKPiAtI2RlZmluZSBYMkFQSUNfRU5BQkxF
wqDCoMKgICgxVUwgPDwgMTApCj4gKyNkZWZpbmUgWEFQSUNfRU5BQkxFwqDCoMKgIEJJVCgxMSkK
PiArI2RlZmluZSBYMkFQSUNfRU5BQkxFwqDCoMKgIEJJVCgxMCkKPiAKPiBUaGUgVUwgc3VmZml4
IGlzbid0IHVuZGVyc3Rvb2QgYnkgb2xkZXIgYmludXRpbHMsIGFuZCB0aGlzIHBhdGNoIGFkZHMK
PiB0aGUgZmlyc3QgdXNlIG9mIHRoZXNlIGNvbnN0YW50cyBpbiBhc3NlbWJseS4KCkFoLCBtYWtl
cyBzZW5zZS4KCllvdXIgc3VnZ2VzdGVkIGNoYW5nZSB3b3JrcyBmb3IgbWUuICBObyBtb3JlIGNv
bXBpbGUgZXJyb3IuCgpJIGFzc3VtZSB5b3Ugd2lsbCBiZSBmb2xsb3dpbmcgdXAgd2l0aCBhIHBh
dGNoIHRvIGFkZHJlc3MgdGhpcy4gIEZlZWwgCmZyZWUgdG8gYWRkIHRoZSBmb2xsb3dpbmcgdGFn
cyBhcyB5b3Ugc2VlIGZpdDoKClJlcG9ydGVkLWJ5OiBKZWZmcmV5IEh1Z28gPHF1aWNfamh1Z29A
cXVpY2luYy5jb20+ClRlc3RlZC1ieTogSmVmZnJleSBIdWdvIDxxdWljX2podWdvQHF1aWNpbmMu
Y29tPgoKLUplZmYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
