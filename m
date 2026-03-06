Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B59FCC050
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eu8MOq22oEfteBQNvkjVglBQmyzuIs1lR81wCt0h//k=; b=SQpTp/L2iRS6U9
	revzGS43G7fQV2uAvK7WJA12GoaWC41iaapmE9+bvbPWjL2gqHkUcJrwc5NLU3Vzeli8/6Fh+OGTi
	ODfcNxJrQt6MiPFoT4wrzBgecVRZU96VRvJllhpfZYd418F+RMyszFe5pXJ5D/9bXPlcoPBRIMf/W
	axOSEgXVvoEDCIwmYAo9ZXPK7OQEbK6MRPLmgGOfPbMY4Qmq6KE62Cqp6CKNv79EtGmoRMqK2PF4G
	fl+QlUpgiORHFIQk8AONjlAVkejzE8oWcQvCHuc/2n2TxgFyQY9G95h6vtbQwELaMixWD73BO2gA3
	wVJh/9UAzoZeKF0yMKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZu3-00000004KAu-1tYD;
	Fri, 06 Mar 2026 18:28:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZu0-00000004K8o-1K1k
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:27:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2Iib2734507
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7khmP6S+uVhwH1v1FXsxCHBzB/GPDxbNuFLl/91rwCQ=; b=HiCS3lOzBmRGyQGq
	xXaI/sFovtGzwK+ftNr3OCD+QDG7LPUVEKQEkhuWA/1GRpdYl38xIlGT6IalKcoF
	QRLt6zjXndE5T1Oyh4c9ocHH7cs7M0TBHqRgxZJ8JAp7ZqfjYC1AciM0uoefhRRq
	eovajwxGxCaCY0TGj1X6fd3IDe9r5kxd2tOwTleC9zkPDoJK3zLbBWjJ1L3/AUdZ
	mG/Umy0U7eRJN1gldwCbvWfVSVzYkUE4Obnmtf72TaBqPsJkvQ5s2nws+vJF8+5/
	eKKG0T7MaS93NJpAZ/bXDQRdm3k6TM6lAEvM9fyiaAtDshx2mc/ASVRlu3VvGoEy
	NHuBOQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2utrbjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:27:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be2f742c46so18364863eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772821674; x=1773426474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7khmP6S+uVhwH1v1FXsxCHBzB/GPDxbNuFLl/91rwCQ=;
        b=gGSx8Yy5BcN071YrdWa5VT03LE0Pc5s+p5QKCNL/YoWIGLWEPY43tYOjZCPd77Ojxb
         urlxpdxMau41RZhvEe8j+7Q2DlJg750GDU86HnFp7G0gzbe//H6ngjmKFIZUafjIDAfD
         nqUgz1uwFIN/Nf+g+V5Nmkifq9txmOLXrBSnDy8ZyDq0dnfYqPhJY+5x6IQSvhJDLfR3
         yABJavB5g4kdgXqVJSsr6TRtTPUhfw0xlrsUx03Ft3isZzW4BuNfmm8Zl0F0ppUx7CGG
         w+lKqegm35pFPP9dblXGgsWHzG0C2wLz/ykjeXfWxrBCPOLzNAZWj8wTJGyT1EsDExar
         sIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821674; x=1773426474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7khmP6S+uVhwH1v1FXsxCHBzB/GPDxbNuFLl/91rwCQ=;
        b=xN/L47TMrjLXd+rcPmpIF2gpfdYG00r62RZEZNsl7r8lSui+AZtLF1hqPyKFadJ7ED
         EMCW6uBBpDB6U8W4cau/8q+ASlOdca4VETlGSHTssg5gqosnqsg8NiNV9azse3EGABTZ
         VN1I0Xx8FWQFdO0oTdns5PdOYOYYkjS93DKvW96szFmzhbkawjlNBFohRQV31d74vswB
         Sw/ysL+qxINIe3HlS5HxTxyVTOIxqAnGeWzjYdToZeX9Z9zyUKbEqG0SPP694HMHQMOz
         HZ9dnpVH7GjgYLAyXV5Fc+mCrX2Yi2Xs0sauGPC7IbB1nlu79VnqXyN+kKMbE6T0Ek2r
         W8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcdlZdM6nOMsG4NP+4KCFyT4TFAedzwIMQOwBPP8LbB/rUSUd0l4ICdYnwVQkwqzafcjtRovVr4dFDpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb2xRdCtMu285YBolZ0FOjUA0h4bvnC6d6+B8RITac0SWVbLfI
	BOmcgnTswZZqgU41EBoyvn4Qp7gl1PADZL7OShF6BmB0FcuxvqXb3jCAQbpgNj1Pb0L88CAPVYI
	dqrU7Bb/hHI36gajaAKeQrIevQMMpKR3wymCCTvwkrXtl5aaqlItf5uDE4qnNConY56ihTMg=
X-Gm-Gg: ATEYQzyV5AevXzBjPXFdSB0cmVic4mnvAsXZHXB3fYxaGAystxfaV8nAfgK88QgGw/p
	ryfNQVytsnyU2n6DfKXUz74FLdVa0rhKSe8Qnj3SAWXT6/DVjqgim2JBKriUPgCDaglD2JlQRgj
	FTHULjzb5bXgyXFNRqUhY7BeXFV5qYvT9HJXRYvLq+i68CDD6M3vp7DGSqD0iad3OTp+bB3U8NK
	Oro/0HL2/dnfKEGOB2jyfTx6o6JGpcI2ycm9gbcxFfDXIXoKtkq1TIsiLnDLnfQdTr2tCrn3BmO
	73iKV1yYAxT7Sl+bbljQ9vhPyYoihLNKx4Hu0GuCIxCrRFaK+BiKezdkmRTZl1DYTaX8o6Ri5Zg
	bshkV+wBqWTWP/6PGuRtF/XH/4GYfZZU=
X-Received: by 2002:a05:7300:8623:b0:2be:2409:6c6e with SMTP id 5a478bee46e88-2be4de767damr1395577eec.5.1772821674001;
        Fri, 06 Mar 2026 10:27:54 -0800 (PST)
X-Received: by 2002:a05:7300:8623:b0:2be:2409:6c6e with SMTP id 5a478bee46e88-2be4de767damr1395550eec.5.1772821673251;
        Fri, 06 Mar 2026 10:27:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948390sm1625291eec.22.2026.03.06.10.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:27:52 -0800 (PST)
Date: Fri, 6 Mar 2026 12:27:50 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <z5bm4uoryuvz5cnsdl37pqmctkqrxw3kk7vqnb3vopnyg2mhl2@ctwdfkgahjfk>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
 <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
 <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=N8ok1m9B c=1 sm=1 tr=0 ts=69ab1caa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uJyaG0lRjW3x0rXblaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NCBTYWx0ZWRfXwoJZIQQiBehU
 30NNiD9vkvLiQi7Vj5GF+ni+KJJeLx0s2Cb+Ebf2zlV2OusU6Cg7cRSI6SiUT+6aYjJ+7YFjGPo
 VcewcrK7m7Zt6883tGYZMqV7vKUcjL9TjbZnAIgnoitUUHmO+0uq6bwPWl/bGmCyJmSNKjMIOC+
 jGRQ1zTxstzMYYdUMIgL3pF70GJtyxoJd9+zS2Rth4wCUfaPSvXGsrTxhesjyTX9pXs6j8dkPme
 utWIO5bz9BxyNxQhfmbFcocJ16xQ569dKLG/hZUnzUXDUEjqel7oKX0PQtO1JEWCY8SKjQ93/DF
 q0jT/zISgSiCceKp9m/kzbcLqqGqR0U370uOb5bMFIi8HlJXBPxvtbfpB+sk3/L128Z+M8W5LwZ
 kOoBa6gkzJYW5/LuD7uTPbeNj0DIUTDoFS/FP0k0h1ISWGdDkt8C27xrCX/70NFLHlKoaMkUkD1
 cW2r6V0UPJrtStUPcrQ==
X-Proofpoint-GUID: VgRuE495KBPQEUqPUFIoxk1LDurtQ14x
X-Proofpoint-ORIG-GUID: VgRuE495KBPQEUqPUFIoxk1LDurtQ14x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102756_361879_AF52878D 
X-CRM114-Status: GOOD (  53.31  )
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

T24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMTA6MTc6MTlBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCA3OjA14oCvQU0gQW5kcmV3IEpvbmVzCj4gPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEZlYiAy
MSwgMjAyNiBhdCAwNjo0OToxOFBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBIaSwg
RHJldwo+ID4gPgo+ID4gPiBPbiBGcmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcg
Sm9uZXMKPiA+ID4gPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IEFkZCBCIHRvIGh3Y2FwIGFuZCBlbnN1cmUgd2hlbiBCIGlzIHByZXNlbnQgdGhh
dCBaYmEsIFpiYiwgYW5kIFpicwo+ID4gPiA+IGFyZSBhbGwgc2V0Lgo+ID4gPiA+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNv
bT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAg
ICAgfCAxICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3Y2FwLmggfCAx
ICsKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCA4ICsrKysr
KysrCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4g
PiBJIHNhdyB5b3UgY2hvc2Ugbm90IHRvIGFkZCBCIHRvIGh3cHJvYmUgaW4gdGhpcyBzZXJpZXMs
IHBlcgo+ID4gPiB5b3VyIHJldmlldyBvZiBteSBwYXRjaCBbMV0uIEkgaGF2ZSBhIGRpZmZlcmVu
dCBvcGluaW9uLgo+ID4gPgo+ID4gPiBBcyB5b3Ugc2FpZCwgRkQsIEMsIGFuZCBWIGFyZSBhbGwg
ZXhwb3J0ZWQgdGhyb3VnaCBib3RoIGh3Y2FwCj4gPiA+IGFuZCBod3Byb2JlLiBBZGRpbmcgQiB0
byBod3Byb2JlIHRvbyBrZWVwcyB0aGluZ3MgY29uc2lzdGVudCwKPiA+ID4gdXNlcnMgY2FuIHF1
ZXJ5IGFsbCB0aGUgc2luZ2xlLWxldHRlciBleHRlbnNpb25zIGZyb20gb25lCj4gPiA+IGludGVy
ZmFjZSB3aXRob3V0IG5lZWRpbmcgdG8ga25vdyB0aGF0IEIgaXMgbWlzc2luZyBpbiBod3Byb2Jl
Cj4gPiA+IGFuZCB0aGF0IHRoZXknZCBoYXZlIHRvIGNoZWNrIFpiYS9aYmIvWmJzIHRvIGluZmVy
IEIgc3VwcG9ydC4KPiA+ID4KPiA+ID4gUmVseWluZyBvbiB0aGUgcnZhMjN1NjQgYmFzZSBiaXQg
dG8gaW1wbHkgQiBhbHNvIGRvZXNuJ3QgY292ZXIKPiA+ID4gY2hpcHMgdGhhdCBpbXBsZW1lbnQg
QiB3aXRob3V0IGJlaW5nIHJ2YTIzdTY0IGNvbXBsaWFudC4gRWcuIG15Cj4gPiA+IHBhdGNoc2V0
IFsyXSBhZGRzIHN1cHBvcnQgZm9yIGV4aXN0aW5nIChub24tcnZhMjN1NjQpIFNvQ3MuCj4gPiA+
Cj4gPgo+ID4gSSB0aGluayB3ZSBuZWVkIHRvIGNvbWUgdXAgd2l0aCBzb21lIHNvcnQgb2YgcG9s
aWN5IGFzIHRvIHdoYXQgZ29lcyB0bwo+ID4gaHdwcm9iZSBhbmQgd2hhdCBkb2Vzbid0LiBJTU8s
IGh3Y2FwIGlzIGVhc3kuIElmIFJJU0MtViBkZWZpbmVzIGEgc2luZ2xlCj4gPiBsZXR0ZXIgZXh0
ZW5zaW9uLCBzdWNoIGFzIFYgb3IgQiwgdGhlbiB3ZSBzaG91bGQgYWRkIGl0IHRvIGh3Y2FwLiBI
b3dldmVyLAo+IAo+IFdoZW4gd2UgZXhwb3J0IGFuIGV4dGVuc2lvbiB0aHJvdWdoIGh3Y2FwIGJ1
dCBpdCBjYW5ub3QKPiBiZSBxdWVyaWVkIHRocm91Z2ggaHdwcm9iZSwgd2UgY3JlYXRlIGFuIGlu
Y29uc2lzdGVuY3k6Cj4gdGhlIHNhbWUgZXh0ZW5zaW9uIGlzIGRpc2NvdmVyYWJsZSB0aHJvdWdo
IG9uZSBpbnRlcmZhY2UKPiBidXQgbm90IHRoZSBvdGhlci4KPiAKPiBUaGUgY3VycmVudCBrZXJu
ZWwgYWxyZWFkeSBleHBvc2VzIG90aGVyIHNpbmdsZS1sZXR0ZXIKPiBleHRlbnNpb25zIHRocm91
Z2ggYm90aCBpbnRlcmZhY2VzOgo+IAo+ICAgRitEOiBSSVNDVl9IV1BST0JFX0lNQV9GRCArIENP
TVBBVF9IV0NBUF9JU0FfRi9fRAo+ICAgQzogICBSSVNDVl9IV1BST0JFX0lNQV9DICArIENPTVBB
VF9IV0NBUF9JU0FfQwo+ICAgVjogICBSSVNDVl9IV1BST0JFX0lNQV9WICArIENPTVBBVF9IV0NB
UF9JU0FfVgo+IAo+IChJL00vQSBhcmUgZm9sZGVkIGludG8gUklTQ1ZfSFdQUk9CRV9CQVNFX0JF
SEFWSU9SX0lNQSwKPiBzbyB0aGV5IGFyZSBhIHNlcGFyYXRlIGNhc2UuKQo+IAo+IEYsIEQsIEMs
IGFuZCBWIGFyZSBjb25zaXN0ZW50IGJldHdlZW4gaHdjYXAgYW5kIGh3cHJvYmUuCj4gV2h5IHNo
b3VsZCBCIGJlIGRpZmZlcmVudD8KCk9rLCB5b3UndmUgc29sZCBtZS4gVGhlIG9idmlvdXMgYWR2
YW50YWdlIHRvIGFwcGxpY2F0aW9ucyBpcyB0aGF0IHRoZXkKZG9uJ3QgbmVlZCB0byBrbm93IGFu
eXRoaW5nIGFib3V0IGh3Y2FwIGF0IGFsbC4gaHdwcm9iZSBjYW4gYmUgYSBvbmUtCnN0b3Agc2hv
cC4KCj4gCj4gPiBmb3IgaHdwcm9iZSwgd2UgY2FuIGdvIHR3byB3YXlzOgo+ID4KPiA+ICAxLiBB
ZGQgZXZlcnkgZXh0ZW5zaW9uLCBpbmNsdWRpbmcgJ2J1bmRsZScgZXh0ZW5zaW9ucywgd2hpY2gg
YXJlIG5vdGhpbmcKPiA+ICBtb3JlIHRoYW4gYW4gYWxpYXMgZm9yIGEgY29sbGVjdGlvbiBvZiBl
eHRlbnNpb25zLiBUaGlzIGluY2x1ZGVzIHNpbmdsZQo+ID4gIGxldHRlciBidW5kbGUgZXh0ZW5z
aW9ucyBsaWtlIEIuCj4gPgo+ID4gIDIuIEFkZCBvbmx5IHVuaXF1ZSBleHRlbnNpb25zLCBpLmUu
IG5vIHB1cmVseSBidW5kbGUgZXh0ZW5zaW9ucyBnZXQKPiA+ICBhZGRlZC4KPiA+Cj4gPiBJZiB3
ZSBnbyB3aXRoICgyKSwgdGhlbiB1c2Vyc3BhY2Ugd2lsbCBuZWVkIHRvIHVzZSB0aGUgYmFzZSBi
ZWhhdmlvcnMKPiA+IChwcm9maWxlcykgaW4gb3JkZXIgdG8gZ2V0IGFueSBzb3J0IG9mIGJ1bmRs
aW5nLCBidXQgSSB0aGluayBtb3N0IHBlb3BsZQo+ID4gYWdyZWUgdGhhdCB1c2Vyc3BhY2Ugd2ls
bCB0YXJnZXQgcHJvZmlsZXMsIHNvICgyKSBzZWVtcyBzdWZmaWNpZW50LiBJJ20KPiAKPiAKPiBM
b29raW5nIGF0IGV4aXN0aW5nIGNvZGUsIGNwdWZlYXR1cmUuYyBmb2xsb3dzIG9wdGlvbiAoMikK
PiBmb3IgYnVuZGxlIGV4dGVuc2lvbnMuIFprIGhhcyBubyBod3Byb2JlIGJpdC4gVGhlCj4gY29t
bXVuaXR5IHNldHRsZWQgb24gdGhpcyBpbiAyMDIzIFsxXSwgYW5kIEkgcmVzcGVjdAo+IHRoYXQg
ZGVjaXNpb24uCj4gCj4gVGhlIGtlcm5lbCBoYXMgdHdvIGZhbWlsaWVzIG9mIGJ1bmRsZXMgdG9k
YXk6IHRoZSBaawo+IHNlcmllcyAoWmssIFprbiwgWmtzKSBhbmQgdGhlIFp2ayBzZXJpZXMgKFp2
a24sIFp2a25jLAo+IFp2a25nLCBadmtzLCBadmtzYywgWnZrc2cpLiBBbGwgdXNlCj4gX19SSVND
Vl9JU0FfRVhUX0JVTkRMRSgpLiBUd28gdGhpbmdzIHRvIG5vdGU6Cj4gCj4gMSkgVGhleSBhcmUg
YWxsIG11bHRpLWxldHRlciBleHRlbnNpb25zLgo+IDIpIEJ1bmRsZSBleHRlbnNpb25zIGhhdmUg
bm8gdmFsaWQgZXh0IGlkLCBzbyB1c2Vyc3BhY2UKPiBjYW5ub3QgcXVlcnkgdGhlbSB0aHJvdWdo
IGh3cHJvYmUuIFRvIGRldGVybWluZQo+ICJaayIgc3VwcG9ydCwgYSB1c2VyIG11c3QgY2hlY2sg
YWxsIDggc3ViLWV4dGVuc2lvbnMKPiBpbmRpdmlkdWFsbHkuCj4gCj4gQiBpcyBkaWZmZXJlbnQu
Cj4gCj4gSW4geW91ciBwYXRjaCBhbmQgbWluZSwgd2UgYm90aCBkZWZpbmUgQiBhcyBhIHN1cGVy
c2V0LAo+IG5vdCBhIGJ1bmRsZToKPiAKPiArIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChiLCBS
SVNDVl9JU0FfRVhUX0IsCj4gcmlzY3ZfYl9leHRzKSwKPiAKPiBGcm9tIGEgc3BlYyBwZXJzcGVj
dGl2ZSwgQiBhZGRzIG5vIG5ldyBmdW5jdGlvbmFsaXR5Cj4gYmV5b25kIFpiYSArIFpiYiArIFpi
cy4gVGhlIG9ubHkgdGhpbmcgQiBhZGRzIGlzIGEgbWlzYQo+IGJpdCAobS1tb2RlIENTUiAweDMw
MSwgbm90IHZpc2libGUgdG8gUy1tb2RlIG9yIFUtbW9kZSkuCj4gU28gZnVuY3Rpb25hbGx5IGl0
IGxvb2tzIGxpa2UgYSBidW5kbGUuCj4gCj4gQnV0IGNhbiB3ZSBjaGFuZ2UgQiB0byBfX1JJU0NW
X0lTQV9FWFRfQlVORExFKCk/IEkgZG8KPiBub3QgdGhpbmsgc28uIEEgYnVuZGxlIGhhcyBpZCA9
IFJJU0NWX0lTQV9FWFRfSU5WQUxJRCwKPiB3aGljaCBtZWFucyBubyBiaXQgaW4gdGhlIElTQSBi
aXRtYXAuIFRoZSBpc2EyaHdjYXBbXQo+IG1hcHBpbmcgaW4gcmlzY3ZfZmlsbF9od2NhcCgpIHJl
cXVpcmVzIGEgdmFsaWQgZXh0IGlkCj4gdG8gc2V0IENPTVBBVF9IV0NBUF9JU0FfQiBpbnRvIGVs
Zl9od2NhcC4gV2l0aG91dCBpdCwKPiBBVF9IV0NBUCBzdXBwb3J0IGZvciBCIGJyZWFrcywgYW5k
IHdlIHdvdWxkIG5lZWQgYQo+IHNwZWNpYWwgaGFjay4gVGhhdCBpcyB1bm5lY2Vzc2FyeSBjb21w
bGV4aXR5Lgo+IAo+IFRoZSBleGlzdGluZyBaay9admsgYnVuZGxlcyB3b3JrIGFzIGJ1bmRsZXMg
YmVjYXVzZSB0aGV5Cj4gYXJlIG11bHRpLWxldHRlciBleHRlbnNpb25zIHdpdGggbm8gQVRfSFdD
QVAgcHJlc2VuY2UuCj4gQiBsaXZlcyBpbiBib3RoIHdvcmxkcy4KPiAKPiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDEyLWRhcmtuZXNzLW5ldXRyb24tZmMxODQzZmYwNWZm
QHNwdWQvCj4gCj4gPiBub3Qgc3VyZSBhYm91dCBhcHBsaWNhdGlvbnMgdGhhdCB3b24ndCB0YXJn
ZXQgcHJvZmlsZXMgYnV0IHdpbGwgd2FudCB0bwo+ID4gY2hlY2sgZm9yIGJ1bmRsZSBleHRlbnNp
b25zIHJhdGhlciB0aGFuIGluZGl2aWR1YWwgZXh0ZW5zaW9ucy4gU2hvdWxkIHdlCj4gPiB0YWtl
IG9uIHRoZSBtYWludGVuYW5jZSBidXJkZW4gb2YgYWRkaW5nIGVhY2ggYnVuZGxlIGV4dGVuc2lv
biB0byBod3Byb2JlCj4gPiBmb3IgdGhvc2U/IEluIHBhcnRpY3VsYXIsIEknbSBub3Qgc3VyZSBh
Ym91dCBCLCBiZWNhdXNlIGl0J3MgYWxyZWFkeQo+ID4gYXZhaWxhYmxlIGluZGVwZW5kZW50bHkg
b2YgYSBiYXNlIGJlaGF2aW9yIChwcm9maWxlKSB0aHJvdWdoIGh3Y2FwLgo+ID4KPiAKPiBJbiBz
dW1tYXJ5LCBteSBjb21tZW50cyBhcmU6Cj4gCj4gMS4gRiwgRCwgQywgYW5kIFYgYXJlIGRldGVj
dGFibGUgZnJvbSBib3RoIGh3Y2FwIGFuZAo+ICAgIGh3cHJvYmUuIEIgc2hvdWxkIGZvbGxvdyB0
aGUgc2FtZSBwYXR0ZXJuLiBEcm9wcGluZwo+ICAgIEIgZnJvbSBod3Byb2JlIHdoaWxlIGtlZXBp
bmcgaXQgaW4gaHdjYXAgY3JlYXRlcyBhCj4gICAgZ2FwIHRoYXQgd2lsbCBjb25mdXNlIHVzZXJz
Lgo+IAo+IDIuIEIgaXMgZnVuY3Rpb25hbGx5IGEgYnVuZGxlICh0aGUgbWlzYSBCIGJpdCBhdCAw
eDMwMQo+ICAgIGlzIG0tbW9kZSBvbmx5LCBub3QgdmlzaWJsZSB0byBTLW1vZGUgb3IgVS1tb2Rl
KSwKPiAgICB5ZXQgd2UgZGVjbGFyZSBpdCBhcyBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoKQo+
ICAgIGJlY2F1c2UgaXQgbmVlZHMgYSB2YWxpZCBleHQgaWQgZm9yIEFUX0hXQ0FQLiBJCj4gICAg
c3VnZ2VzdCB3ZSBkb2N1bWVudCB0aGlzIHdpdGggYSBjb21tZW50IGluCj4gICAgY3B1ZmVhdHVy
ZS5jOgo+IAo+ICsgLyoKPiArICAqIEIgaXMgZnVuY3Rpb25hbGx5IGEgYnVuZGxlIChaYmEgKyBa
YmIgKyBaYnMsCj4gKyAgKiBubyBhZGRpdGlvbmFsIGluc3RydWN0aW9ucykuIFdlIHVzZSBTVVBF
UlNFVAo+ICsgICogaW5zdGVhZCBvZiBCVU5ETEUgYmVjYXVzZSBCIG5lZWRzIGEgdmFsaWQgZXh0
Cj4gKyAgKiBpZCBmb3IgaXNhMmh3Y2FwW10gdG8gc2V0IENPTVBBVF9IV0NBUF9JU0FfQi4KPiAr
ICAqLwo+ICsgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoYiwgUklTQ1ZfSVNBX0VYVF9CLCBy
aXNjdl9iX2V4dHMpLAoKTG9va3MgZ29vZC4KCj4gCj4gMy4gU2hvdWxkIHdlIGFsc28gZG9jdW1l
bnQgaW4gLnJzdCBvciAoaW4gY3B1ZmVhdHVyZS5jKSBhYm91dCB3aGVuIHRvIHVzZQo+IF9CVU5E
TEUoKSBhbmQgd2hlbiB0byB1c2UgX1NVUEVSU0VUKCksIGFuZCB3aGF0J3MgdGhlIGltcGxpY2F0
aW9uIHdoZW4KPiB1c2luZyB0aGVtLCB0byBlY2hvIHdoYXQgeW91IHN0YXRlZCBhYm92ZSAiLi4u
IEFkZCBvbmx5IHVuaXF1ZQo+IGV4dGVuc2lvbnMsIGkuZS4gbm8gcHVyZWx5IGJ1bmRsZSBleHRl
bnNpb25zIGdldGFkZGVkLiIKCldlJ3JlIHByb2JhYmx5IE9LIHdpdGggdGhlIGNvbW1lbnRzIGFs
cmVhZHkgaW4gY3B1ZmVhdHVyZS5oCgovKiBVc2VkIHRvIGRlY2xhcmUgcHVyZSAibGFzc28iIGV4
dGVuc2lvbiAoWmsgZm9yIGluc3RhbmNlKSAqLwpCVU5ETEUuLi4KLyogVXNlZCB0byBkZWNsYXJl
IGV4dGVuc2lvbnMgdGhhdCBhcmUgYSBzdXBlcnNldCBvZiBvdGhlciBleHRlbnNpb25zIChadmJi
IGZvciBpbnN0YW5jZSkgKi8KU1VQRVJTRVQuLi4KCkFuZCB5b3VyIHByb3Bvc2VkIGNvbW1lbnQg
YWJvdmUgQiB3aWxsIGFsc28gaGVscCBleHBsYWluIHRoaW5ncy4KClRoYW5rcywKZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
