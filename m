Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B32FE9129A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 15:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EDg+XvZt0PQ8oxblsOMoG1RzX60s5r/iIE1GeVv6bM=; b=CYOj1gY8gXfH4E
	yX+9OKsA+qghr2KFrS9ZsPQqsHmE9t+OG5SXySPlcAoqu02i0hJKROsIlNLcQhyHl4nQDEktTJOHj
	qvClsXC8WAiL2ifGAzNIgMi5SoG4uo7VEP/etqWU1umPsN3F4U7VQ2NyMZPJsPJIBghg+FDjGYrY0
	5Ol7jnPgUzdiTyMnjNNDf9OFI7a7iEux/OuTG2lvpKqg8e6FoQzBGMbqWH5X9yu43CTRdgYamdxbW
	KETW5jm7bpbKaAnoB7EJncRyGMpxvkXYhi1ALgHlCahAZ4+22m3YNgWWt29A/lyNxbQiZRT7YZiQY
	9iCW/9YOSqzhCmI/jtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Ci-0000000A8M6-2iz4;
	Thu, 05 Feb 2026 15:23:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1Cf-0000000A8LF-1zEo
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 15:23:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BAudc3237295
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 15:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fo5EChFJxxbLb85YiCCw15lKmFakF/DE4q1kK+Qroqs=; b=CkqoqxYnzOKs9q68
	XFI21yuj+oAFgjbA/X/FNlLGJvtgK8pyCgByoxx+snhxd/mhLWdakQ9+pyc42IWG
	L0zqO3thCvDBTHFtItuCgIbM9OYXlviCfVZZrfMDPotRHWoGOHqLAamu5+hqQU7e
	dMZhruqtC2vyJuz6DPlHAs2DOScm6BcI9wMp4f680ixIfRnG+hj50FclHjgw1arU
	Ax+e2qdRqlxStdL9+5QqU6zulS705p9yB6iY4BmocLizXQHM5IF+f1FVBLxc3xCF
	AtUsKW9dNMhrdFoKFriAuRsSbpnpDu/IfCoatDy4NkZ1z+fSOBCydpQEuq75l9ia
	CFzWgg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp534bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 15:23:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b71c5826fbso1010758eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770305012; x=1770909812; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fo5EChFJxxbLb85YiCCw15lKmFakF/DE4q1kK+Qroqs=;
        b=VzYH3zWSZ6rCxoQT2zW3TtAGQRnMePev9UlHwETg7Tf41cyZqpI7w44sWfHqugGyrJ
         Sc8uYpEd9Mbuu5XCHRB/YgUe5QrxubtBD7KPzQo7R2ZmCsYU8f49Jba3j+yoA/Xu89WI
         q+ZuQnpy6zLlNSnT6sztlWrpNSqnAuRPVxxagwY4D2qBDtInHGA0Fmt44Z3xjy9DizFE
         Smceer0jN/HY945NffkDE/5Z9wV8OfenZENFwhfabhPyxKhHkAsKjFy2XX99Inxqi5Fn
         udRBYeEOPeVMiCjhYRE4+AMJCUEjHqPSKsP55m1SFex3EHTwVZ2efVSrvUQAl+VuVfB+
         wd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770305012; x=1770909812;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fo5EChFJxxbLb85YiCCw15lKmFakF/DE4q1kK+Qroqs=;
        b=dqqm2UPdvhlh0PmrWd1VESEP5Q+6izdW3YPY9kJcJJajUSVgc9sliYl/GujBnuQ52C
         mlimYfUxnStTGgfQd0TIi0c9+mk2bXqp2oOKQan4KLTpzZBt0p+3ednRspAv0dGP60yh
         lXd7LeOlY8s1QsOvu9u4JcM7VugA7lmRItw2OWGx2iuwymJ1BKF7rVajCbWLhtW8cRMO
         uudBRDcd8sCE7R6K1WXAaRxrmg0+xFWRTq3h0KrPF5Y5w52znNAZ/k+jMsByrOrIVrDx
         961iqLZVYe7VQjgiQNA7vvdVZLq3jLSKbD37++Hi/ttRFbEDrXh3XEH3v6L4dndygRTt
         MONA==
X-Forwarded-Encrypted: i=1; AJvYcCVbIyfahWUh3udAeNP5AW2U6PCd3KZOqx6RbMus2NrzXlD2JhR989xD3QeNP84GeXDJlHmD4jCQpBTHQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjJg7bbniVtNCmWZiwRxIRZoqinSrTn8v0RXJWuDgNhIRNV+rN
	7ISVEt7jSj9+0mzroXaU98pGIH4oL/+P5z6rDYv4OdT0Byk25tI6KJeEmPK6HZ4RuLZ61vDE3br
	9GxWjC6LWszru1Z033+96XVtuWXStyDMuMgK+5Bu+2Hjh82Noi7pjtpJWzH3TO9QSQLzP7eU=
X-Gm-Gg: AZuq6aITWnT2VMHa9WF4BNRFTWKIeF1MIrmSxsN4u4AzeqivmPoDtcawnk/KcfK0Cax
	iheedWI6TJ07ToC+qCIBTQYq4SfBfObr9S0xytIAYrwSxwNgBaDAQW3O5zh9WB/+xKKX+uhQPMI
	/5wuqFFFT1NTHqxLsd2KpSt+k1DMt5h6ujJACpsys4A/jicK/XsHntQ80PJXxzW/rwBv+4zJOn2
	c7zg88gLsXUGo86IIl08pPkLDH6zNMDTEUWmXHlRG0YE+Y0jejWBFKMxIHo6pfa7Zb+RSmtEqiP
	q9wPivAOM2CnMVNOrP0moMW2t79t1sPkcR849Y3HBaW3tHSt+UH83O84AFHAFEtqF3iAdZ5VKFz
	saDMwVt/Mruj4E05joj0=
X-Received: by 2002:a05:7301:4b03:b0:2b8:1d16:9716 with SMTP id 5a478bee46e88-2b8329e5c13mr2779581eec.20.1770305010046;
        Thu, 05 Feb 2026 07:23:30 -0800 (PST)
X-Received: by 2002:a05:7301:4b03:b0:2b8:1d16:9716 with SMTP id 5a478bee46e88-2b8329e5c13mr2779535eec.20.1770305007985;
        Thu, 05 Feb 2026 07:23:27 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e107b4sm4844489c88.7.2026.02.05.07.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:23:27 -0800 (PST)
Date: Thu, 5 Feb 2026 09:23:26 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Zong Li <zong.li@sifive.com>, Tomasz Jeznach <tjeznach@rivosinc.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
        iommu@lists.linux.dev, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance
 monitoring
Message-ID: <zzbwkazzgeovgmbvg4qnibipzsldqcjnw4axnxlamhgvcld4hs@4m4cc2ctuuvf>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
 <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
 <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
 <6C65A3873186B07C+29da5dbd-ed27-4ace-a5ca-355b3983d60c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6C65A3873186B07C+29da5dbd-ed27-4ace-a5ca-355b3983d60c@linux.spacemit.com>
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984b5f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=lv0vYI88AAAA:8
 a=yG5aaNEj0tElPYM3_UYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=oJz5jJLG1JtSoe7EL652:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: LIzt9HAK0OHGM5HbovM__f7Em5uXH0ii
X-Proofpoint-GUID: LIzt9HAK0OHGM5HbovM__f7Em5uXH0ii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExNiBTYWx0ZWRfXxC9hsD3WYffi
 prPK7dM3L7yKzyJwKte54OyCT4TlBeapWilFZuA9F3H1h6ONgxFPmeWYqG5M0vXzkpuy3zVJp+X
 F4kIq+R9Ty3r2gPb/gtQ/y5vycXw6qw2xxOzUrsPi+438p5lV8a1GB4mJb+19oT+LgD4K1e3Doy
 rQYNXOKYqlqRvmrJWy6ZJS/aVCaCIEXnplAeuCavV8vBSMgamowH0czcd6W7hpOYUtl82gY0rvj
 kOypgJXBENCyFSmFMJ9KqMwtPkWyj7ftPV8VA3GWKGolsVm3LfmWYzPJikHP+gRPnlplmjPp5Fz
 iIyReaeTgp+mhss9yxhVofaouOcyjk06g7d+NtvQjCsrxHeS8XqgkMwLlMofHDKjxHa8dkD0j/W
 gbbi5MnHL+dfD5G/m4TFI87YHZmpEW2oG3rpfctwecLQMjnOHjbduwAFSs9cyP5R/oAn42BCaRw
 E4AZgZUZkgz4UnRUGHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_072333_666197_A1D2A59D 
X-CRM114-Status: GOOD (  35.14  )
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

T24gVGh1LCBGZWIgMDUsIDIwMjYgYXQgMDI6MTE6NDhQTSArMDgwMCwgTHYgWmhlbmcgd3JvdGU6
Cj4gT24gMi81LzIwMjYgMTE6NDcgQU0sIFpvbmcgTGkgd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiA1
LCAyMDI2IGF0IDExOjM14oCvQU0gTHYgWmhlbmcgPGx2LnpoZW5nQGxpbnV4LnNwYWNlbWl0LmNv
bT4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBPbiAyLzUvMjAyNiAyOjM5IEFNLCBBbmRyZXcgSm9uZXMg
d3JvdGU6Cj4gPiA+ID4gSG93IGRvZXMgdGhpcyByZWxhdGUgdG8KPiA+ID4gPiAKPiA+ID4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTUwMzAzMDYuMjk3MzUtMS16b25nLmxp
QHNpZml2ZS5jb20vCj4gPiA+ID4gCj4gPiA+ID4gICBGcm9tIGEgcXVpY2sgc2tpbSBpdCBsb29r
cyBsaWtlIHRoZXJlJ3MgcGxlbnR5IG9mIG92ZXJsYXAuCj4gPiA+IAo+ID4gPiBXZSBkZXZlbG9w
ZWQgdGhlIGRyaXZlciBpbiAyMDI0IGFuZCBkZW1vbnN0cmF0ZWQgaXQgaW4gQ2hpbmEgc3VtbWl0
LiBXZQo+ID4gPiBkaWRuJ3Qgbm90aWNlIHRoYXQgYSBwYXRjaCBpcyBvbi1nb2luZyBub3cgaW4g
dGhlIGNvbW11bml0eS4KPiA+ID4gCj4gPiA+IE5vdyBpdCBsb29rcyBvdXIgYXBwcm9hY2ggc29s
dmVkIG1vcmUgaXNzdWVzLCBhbmQgd2UnbGwgY2hlY2sgYW5kIHVwZGF0ZQo+ID4gPiBpZiB0aGVy
ZSBhcmUgYW55IGNvbW11bml0eSBjb25jZXJucyBzdGlsbCBub3QgYWRkcmVzc2VkIGluIHRoaXMg
cGF0Y2hzZXQuCj4gPiA+IAo+ID4gPiBXZSBjYW4gYWRkIFJldmlld2VkLWJ5L1Rlc3RlZC1ieSBh
bmQgU2lnbmVkLW9mZi1ieSBvZiBab25nIExpIHRvIHRoaXMKPiA+ID4gcGF0Y2ggaWYgaGUgd2lz
aGVzLgo+ID4gPiAKPiA+ID4gVGhhbmtzLAo+ID4gPiBMdgo+ID4gPiAKPiA+IAo+ID4gUGVyaGFw
cyBJIGNhbiBmaXJzdCBwb3N0IG15IG5leHQgcmV2aXNpb24gdG8gdGhlIG1haWxpbmcgbGlzdCAo
aG9wZSBpdAo+ID4gd29uJ3Qgd2FzdGUgdGhlIGNvbW11bml0eSByZXNvdXJjZSksIHNvIHRoYXQg
eW91IGNvdWxkIGhhdmUgYSBjaGFuY2UKPiA+IHRvIHJldmlldyBpdCBhbmQgc2VlIHdoZXRoZXIg
dGhhdCB2ZXJzaW9uIGlzIGFyY2hpdGVjdHVyYWxseSBjbG9zZXIgdG8KPiA+IHdoYXQgdGhlIGNv
bW11bml0eSBpcyBsb29raW5nIGZvciwgd2hpbGUgYWxzbyBhZGRyZXNzaW5nIHlvdXIgaXNzdWUu
Cj4gPiBJZiB5b3UgYWxzbyBmZWVsIHRoYXQgbXkgbmV4dCByZXZpc2lvbiBtZWV0cyB5b3VyIG5l
ZWRzLCBwZXJoYXBzIHlvdQo+ID4gY291bGQgYXBwZW5kIHlvdXIgYWRkaXRpb25hbCBpbXBsZW1l
bnRhdGlvbnMgb24gdG9wIG9mIGl0Lgo+ID4gCj4gCj4gSXQgc2VlbXMgd2UgYWxsIGNvbXBvc2Vk
IHRoZSBSSVNDLVYgaW9tbXUgSFBNIHN1cHBvcnQgYnkgcmVmZXJlbmNpbmcKPiBkcml2ZXJzL3Bl
cmYvYXJtX3NtbXV2M19wbXUuCj4gCj4gUm9iaW4ncyBjb21tZW50cyBzaG91bGQgYWxsIGJlIGFk
ZHJlc3NlZCBJTUhPLgo+IAo+ID4gT2YgY291cnNlLCBpZiB0aGUgY29tbXVuaXR5IHdvdWxkIHBy
ZWZlciB0byBnbyB5b3VyIHZlcnNpb24sIEnigJltCj4gPiBwZXJmZWN0bHkgZmluZSB3aXRoIHRo
YXQgYXMgd2VsbC4KPiAKPiBPSy4gSWYgd2Ugc2VuZCBhIG5leHQgdmVyc2lvbiwgd2Ugd2lsbCBh
ZGQgeW91ciBTT0IgYW5kIHBsZWFzZSBoZWxwIHRvCj4gcmV2aWV3IGFuZCB0ZXN0LgoKWm9uZyBM
aSdzIFNPQiBzaG91bGQgb25seSBiZSBvbiB0aGUgcGF0Y2hlcyBoZSBhdXRob3JlZC4gRG9uJ3Qg
cHV0CmFueWJvZHkncyBTT0Igb24gcGF0Y2hlcyB0aGV5IGhhdmVuJ3QgYmVlbiBpbnZvbHZlZCBp
bi4gU2VlCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0CiIiIgpU
aGUgU2lnbmVkLW9mZi1ieTogdGFnIGluZGljYXRlcyB0aGF0IHRoZSBzaWduZXIgd2FzIGludm9s
dmVkIGluIHRoZQpkZXZlbG9wbWVudCBvZiB0aGUgcGF0Y2gsIG9yIHRoYXQgaGUvc2hlIHdhcyBp
biB0aGUgcGF0Y2gncyBkZWxpdmVyeSBwYXRoLgoiIiIKClNpbmNlIFpvbmcgTGkncyBwYXRjaGVz
IHdlcmUgYWxyZWFkeSBvbiB0aGUgbGlzdCB0aGVuIHlvdXIgc2VyaWVzIHNob3VsZAphdCBsZWFz
dCBkaXNjdXNzIHRoZW0gaW4gdGhlIGNvdmVyIGxldHRlciwgZXhwbGFpbmluZyB3aHkgeW91J3Zl
IG9wdGVkCm5vdCB0byBhZG9wdCB0aGVtLiBCdXQsIG1vc3QgbGlrZWx5IHNvbWUgb2YgdGhlIHBh
dGNoZXMgY2FuIGJlIGFkb3B0ZWQsCnNvIHRob3NlIHNob3VsZCBiZSBleHRyYWN0ZWQgZnJvbSBa
b25nIExpJ3Mgd29yayAod2l0aCBhdXRob3JzaGlwCnByZXNlcnZlZCkgYW5kIGJhc2VkIHVwb24g
aW4gb3JkZXIgdG8gcmVzcGVjdCB0aGF0IHByaW9yIHdvcmsuCgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
