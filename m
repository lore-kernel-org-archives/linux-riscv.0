Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93B4C531FC
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 04:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk9ZoD0d8mTgiKHG8eR/KMdPb94OV9bCN3VAabEFgTI=; b=Pf/gWL1ENm22QE
	AS2V8/wUetveH2VUC8XFOModtCIhmuW1ObWVPz5jMHZdOsmQDJC/F6doqx/9EyhliQXTqHSwKwUu+
	IEmIwfo9TAUE7o2aJRQEq5PR45kyNCRgWIVa8K3ZdFODr0BsPo7DJuHNu1C3DOtv0sce7GTgSJWSt
	Qc7C9PQpVXLVYrGuG0U5z7UkjQGAVyRxw0+Ent8Su2b7KOKC0JXkg7gwGrGyGPw7YZGzippuW4cZg
	Qz9azxEcjZSlPBBjYtIgoJ4K+HRZM9YoOE/uwyi9P4jQ66Yf7pKek99qzWibQ31AQ8Igbw2UluQbA
	B+RbNAoE/oznnPkPUyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCpX-00000001v8Y-2wbQ;
	Mon, 27 Jul 2026 04:20:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woCpU-00000001v80-3QIa
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 04:20:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fpDT2240165
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 04:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCoOJuUKOVYsnlf2kaT/TdC3k8f/jBug3kH1xo0Rt7w=; b=E0Lhqxqtp6T6SXNn
	GIVb4tFN9MgtZ/F7o7JusH2D2QQIDUdnaWy/UIphdNFUlLTHNCiO6KODDeGqu+pE
	Z6dVJVbxU1Z8pd684+Z5/966GSFu94tAlZDjVUmSHO9ieEWAZHYzoICuy8M+9cDu
	C1505oHPvzZJ0213MYe4lfu74dvOJTliMiKQW0Q4s/IkEEkB6T34JwJzkU23dvL2
	+GxoOb0IUQc9SNrT34VM9gyiMOBkuwSoKokEHKw2lu88N3v+IVa9ccGjox0G+90K
	N9Ehs1Gahzb7U3pvQ0LytYLt5rLpWyDtGB7R0XkeXTWgC7w/OrMmoUvSvfEvr2Cl
	sz+XxA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs0ra4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 04:20:38 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455ad408573so1568740fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2026 21:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785126038; cv=none;
        d=google.com; s=arc-20260327;
        b=St0vGkDADzyvKG5TyRvPjjiGmyRm9fhfDErMK/Mw+Fi8WxfUfY2zLkH4+yWTXmW82U
         0eCIlSACICMpQN8Wg/vKSl3TGFnZ3Kzlfn5K3w2yKlDxq205dqQHc6F6MW3G8BzeuBNP
         WbVmxqKAWoEbfHCQgIfudlJYQEgnGO7eg0QLi2QbYW16qGi+yqMZRDFg/LLd08Vmtq2+
         ZF2A7E1io+ihCenBEZZRmmeCrSWJBqiTpg+4UlpOGlvBhywMQUx0MY9m7AwHKpCO6yyH
         Wck5iTcm+eMc8/EHToSeQWeKrJ9OUkrbZwtQBCybxOIc3ZZ7AS2z3hH3eTQr8z8KcOuz
         poWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eCoOJuUKOVYsnlf2kaT/TdC3k8f/jBug3kH1xo0Rt7w=;
        fh=CdUMaEJu13I/KoDFc9XjfiChftCRG3UAgwdnp9tfHMU=;
        b=STqHdkwM5wsvwc5y4HFBJc87bGsI3/iYVunKQASzIVGmwWyHMI3ryalyijxOOPD1sv
         duQARET3qn7eLOFsLMDrCXbYWnT2RPgOmghbTZmJ3C8WBN2MTRxhCiNVpHmSuk7IgLh5
         R8pLYIuCIrVtdNWVSTTIrA6M/QwD7v4P3z1EwFTRO9411JNxKM8Blmiq+J0oT2frWl4q
         BWuZ4DtSs6PMnO+qQokOwMwKMvUyIVdOAyDWN6FBbpjV1s0ouk3UzZn6mQdb/uM2wbKd
         +SoD2IhSW+/T3gkdT5GbhrLayOtUeQTkJhvflYND2yjh7ukvSmovA9VbbfbAHO3ycwUd
         vWoQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785126038; x=1785730838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eCoOJuUKOVYsnlf2kaT/TdC3k8f/jBug3kH1xo0Rt7w=;
        b=aJqfGiJ/8MxHlG9PI2bq5sAmrE7grTK3uoI6Ob7SMIhDON8S1gBaKu0rY7+afj8r9b
         o/+dzVrwpDB5oqGoer4RvhsGnrlTCsmfckMkFmPVN/TI0ys9lte4VRVWty2LfXzCeNLR
         HNnzPpMGG0PrR7b7FAbaOyE/BtBdaIFe6sziFrzvzIUkXz7VBEr0c39ZWuVadUqTwf3H
         nCksg6+okMrnOofxfmSjR7CGSFtZHrRXSYydoJh6QowqwrtnHS7+36VgnJDgXD8F3Pwp
         zIPqQ1t9ikvPINs0SGFQmi9f6RteDT6A9hN/47V+16o+9Ve4dVOvVMsucBdlou2rZ49d
         vKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126038; x=1785730838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCoOJuUKOVYsnlf2kaT/TdC3k8f/jBug3kH1xo0Rt7w=;
        b=sxqyKXg8A/8Gpcc8L+YS2ZhA7cCgSs3wq7ZZ6OZLTuD3fJXlBK7h1fW5ibfcQMCRbA
         X0WRASOgjEtWY7sMY8/7HmNOpNF19StleVYdZoTz4XlONq42hrwTmQ0CM46Y0imSERab
         GcRt2nSexQSwOd0VvwI3c4h1GG1Abbl0Nfx4jhpRDxYhBcexR4VutTadNfnFrZSP3L1Q
         qeauWS/FFuDUyyb8URwPf1UnrIWu9LsQqqZfOPliIkEhM1vP+VOiTCESq0/gqGbrpqHz
         KwsD4xgwhe0/nwfuaJSk3sudLP1CI3cVBHiC48r+phLQlXF4YeGwOqoARbAmTs/u7pfk
         CFcA==
X-Gm-Message-State: AOJu0Yz1ACerW8JbS58HefxA8Qlkpdu6W/8T1x6UWfrhsJnagbFFsODu
	EU4MhsoDoWrjXGP11mgFizp7Sgj6sbcWOc8hpxV1i6KKzxZ6qhblaAE0GDLhLhCiAQaWjoodb+U
	bR85jXsKrdWq6crKS86okpOUGmz+GWXBqer4B0vRMI0ST6/QKmWyofPG1d8neUBp6LqqM2AYZLR
	WGWWLkE1oP/LqkjlONG/V0dUnXqAsI8KTWJdMbFF6DdukPKQ==
X-Gm-Gg: AR+sD11VcJaCYhQSEaMK1pOybo+B+M+7jklY+P8i59tO0vCnzwIfPCGkcfA2W8NP3rT
	XcQ/sK7vOw18+NOQxkQHo6AmyVe9H2CPIlv2SRmBRQ6Zd1jukPpAEfzHruefsPTfnSK/2LnvbAi
	3XjsL3Os3WbUjFiYHjyS0IpxhUaAihsxT3xwaXhbgLnAg3ahDgrUFPJ0N/Bw==
X-Received: by 2002:a05:6870:5ba1:b0:456:1b93:abfd with SMTP id 586e51a60fabf-457f270826cmr5969076fac.22.1785126038160;
        Sun, 26 Jul 2026 21:20:38 -0700 (PDT)
X-Received: by 2002:a05:6870:5ba1:b0:456:1b93:abfd with SMTP id
 586e51a60fabf-457f270826cmr5969056fac.22.1785126037719; Sun, 26 Jul 2026
 21:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com> <CADRr4bcoS6pFw8VQcNORJuOzOnD-MY4ggauzoiO6FqJ410f5ag@mail.gmail.com>
In-Reply-To: <CADRr4bcoS6pFw8VQcNORJuOzOnD-MY4ggauzoiO6FqJ410f5ag@mail.gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 09:50:26 +0530
X-Gm-Features: AUfX_mxPl5armuOAQ3_IuCpPs8bMpske7K0LWepA_GhLFpMYLD-KD8Z79oYOJVE
Message-ID: <CA+Ht8=aGnAioD0_jCkoJ4eoS4G0tbKiJ9dA-wJ--N1L9kxRRXg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] riscv: Introduce support for hardware break/watchpoints
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, qingfang.deng@linux.dev, alex@ghiti.fr,
        aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
        shuah@kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzOSBTYWx0ZWRfX7/YeCbjDxFWb
 pXdSMZKn8XpYoo7pywyHdZnPNgo2xPDTeKl8A8mALUA9jhmBDYRsZYOoGqTcBVW9VbeblUfvS1M
 Xu8qgBuQ714+NQfstkiKbNmjnpWtwMSn3DGN4z7Te65EfdIpXN1Quue4qytRYvv2rVMgw3H/Tqp
 ghleslR+gEaKRJ4ohvpIkuHuZt3/WLnVH8EslGz605C6TID5LTqfEe4yjyNtmr1LI5yphsU2oi6
 +m2TN+ZZrIrjuR79CPNWB4M2xejl84kHiQlmx7L1UfXykFsok8R5vGj1cG75P5sLohxum6Z174V
 XdysBZDvPSBQWU0X3bJVzkU47B+2SeG8aymx1C6TuL02NIFwhkqA4C1sctqiJWAnmvleJ58vE2z
 Asltb/xFZK157hxfYxt0SSbJ+UiVFZPqjENIKaBvdr4wNfFVA0LVdSXaAlz4BChlJGf2/diZ7/R
 i1RliBFEhcnBt+tdWKg==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a66dc96 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8 a=V1jnuoLLAAAA:20
 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=NKD68_ny5E-Bt0Efw5EA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=MSi_79tMYmZZG2gvAgS0:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: EWbgScB9KJ4N_77IZemfCeVEDKZB4D7p
X-Proofpoint-GUID: EWbgScB9KJ4N_77IZemfCeVEDKZB4D7p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzOSBTYWx0ZWRfX0+hY7MEoU8a6
 5pi8ICmrmxPWRfdXkUzDPlsxTN1ILoCdUe9Sj5+Rj/UL1iCRum/GbggtiN8GSMOlWIo2sFN+D2/
 MIwbn2nnEAcq8c8NDfXYiL1GLgBpkE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_212040_987496_851084E2 
X-CRM114-Status: GOOD (  37.53  )
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

SGkgSmVzc2UsCgpPbiBGcmksIEp1bCAyNCwgMjAyNiBhdCA3OjIw4oCvUE0gSmVzc2UgVGF1YmUg
PGp0YXViZXBlQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMjMsIDIwMjYgYXQg
NDo0OeKAr0FNIEhpbWFuc2h1IENoYXVoYW4KPiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNv
bW0uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBvZiBoYXJk
d2FyZSBicmVha3BvaW50cyBhbmQgd2F0Y2hwb2ludHMgaW4gUklTQy1WCj4gPiBhcmNoaXRlY3R1
cmUuIFRoZSBmcmFtZXdvcmsgaXMgYnVpbHQgb24gdG9wIG9mIHBlcmYgc3Vic3lzdGVtIGFuZCBT
QkkgZGVidWcKPiA+IHRyaWdnZXIgZXh0ZW5zaW9uLgo+Cj4gSGVsbG8sIGl0cyBuaWNlIHRvIHNl
ZSB5b3Ugd29ya2luZyBvbiB0aGlzIHByb2plY3QgYWdhaW4sCj4gY2FuIHlvdSBrZWVwIG1lIGFu
ZCBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4gaW4gY2MgcGxl
YXNlCgpXaWxsIGRvIQoKPiBUaGlzIHNldCBkb2VzbnQgc2VlbSB0byBiZSBhIGNvbnRpbnVhdGlv
biBvbiBteSBzZXQsIGJ1dCBkb2VzIGl0IHBhc3MgdGhlIHRlc3RzCj4gaSB3cm90ZSB0aGVyZT8K
CllvdSB3ZXJlIGJ1aWxkaW5nIG9uIHRvcCBvZiBteSAodGhlc2UpIHBhdGNoZXMuIEkgZG9uJ3Qg
d2FudCB0byBwdXNoCmV2ZXJ5dGhpbmcgYXQgb25jZS4gSSBsaWtlIGluY3JlbWVudGFsIHdvcmsg
d2hpY2ggaXMgaW5kZXBlbmRlbnQgYW5kCmVhc2llciB0byByZXZpZXcuCldoaWxlIEkgaGF2ZSBw
ZXJmLCBzaW5nbGUgc3RlcHBpbmcsIGFuZCB2aXJ0dWFsaXplZCBicmVha3BvaW50IHBhdGNoZXMK
cmVhZHkgYW5kIGluIGxpbmUsIEkgYW0gcGxhbm5pbmcgdG8gcHVzaCB0aGVzZSBmaXJzdC4gSSB3
aWxsIG1ha2UgYWxsCnRoZSBwYXRjaGVzIHNlZSB0aGUgbGlnaHQgb2YgdGhlIGRheS4KWW91IGFy
ZSB3ZWxjb21lIHRvIHJldmlldyEKCj4gT24gcGF0Y2ggOCBpIHdyb3RlIHRoZSBjb21tZW50Cj4g
IlRoZSBzZWxmdGVzdCBmYWlscyBhcyByZWdpc3Rlcl91c2VyX2h3X2JyZWFrcG9pbnQgc2VlbWlu
Z2x5IGRvZXMgbm90Cj4gY2FsbCBhcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludC4gVGhlIHRlc3Qg
YWxzbyBzZWVtcyB0byBmYWlsIG9uIGFybTY0Cj4gaW4gdGhlIHNhbWUgd2F5IHdoZW4gSSB0ZXN0
ZWQgaXQuIgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDgyMjE3NDcxNS4xMjY5
MTM4LTktamVzc2VAcml2b3NpbmMuY29tLwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9OTk0NzUwJnN0YXRlPSoKPgo+IFRoYW5r
cywKPiBKZXNzZSBUYXViZQo+Cj4gPgo+ID4gQ3VycmVudGx5IGZvbGxvd2luZyBmZWF0dXJlcyBh
cmUgbm90IHN1cHBvcnRlZCBhbmQgYXJlIGluIHdvcmtzOgo+ID4gIC0gUHRyYWNlIHN1cHBvcnQK
PiA+ICAtIFNpbmdsZSBzdGVwcGluZwo+ID4gIC0gVmlydHVhbGl6YXRpb24gb2YgZGVidWcgdHJp
Z2dlcnMKPiA+Cj4gPiBUaGUgU0JJIGRlYnVnIHRyaWdnZXIgZXh0ZW5zaW9uIHByb3Bvc2FsIGNh
biBiZSBmb3VuZCBpbiBDaGFwdGVyLTE5IG9mIFNCSSBzcGVjaWZpY2F0aW9uOgo+ID4gaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9h
ZC92My4wL3Jpc2N2LXNiaS5wZGYKPiA+Cj4gPiBUaGUgU2R0cmlnIElTQSBpcyBwYXJ0IG9mIFJJ
U0MtViBkZWJ1ZyBzcGVjaWZpY2F0aW9uIHdoaWNoIGNhbiBiZSBmb3VuZCBhdDoKPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1kZWJ1Zy1zcGVjCj4gPgo+ID4gQ2hhbmdlcyBmcm9t
IHY0Ogo+ID4gICAgICAgICAtIFJlYmFzZWQgdG8gdjcuMi1yYzQKPiA+ICAgICAgICAgLSBGaXhl
ZCBydjMyIGJ1aWxkIGVycm9yCj4gPiAgICAgICAgIC0gQWRkZWQgcHJfZm10IHRvIHByaW50IEtC
VUlMRF9NT0ROQU1FCj4gPiAgICAgICAgIC0gQ2hhbmdlZCB0eXBlIG9mIHNobWVtX3BhIHRvIHBo
eXNfYWRkcl90Cj4gPiAgICAgICAgIC0gVXNlIHBlcl9jcHVfcHRyX3RvX3BoeXMgaW5zdGVhZCBv
ZiBfX3BhIHBlci1jcHUgYWxsb2NhdGVkIG1lbQo+ID4gICAgICAgICAtIFByaW50IHN1Y2Nlc3Nm
dWwgcmVnaXN0cmF0aW9uL3VucmVnaXN0cmF0aW9uIG1lc3NhZ2Ugd2hlbiBubyBlcnJvcgo+ID4g
ICAgICAgICAtIEFkZGVkIFJJU0MtViBERUJVR0dJTkcgc2VjdGlvbiBpbiBNQUlOVEFJTkVSIGZp
bGUgYW5kIGFkZGVkIG15c2VsZiBhcyBtYWludGFpbmVyCj4gPiAgICAgICAgIC0gRml4ZWQgY3Jh
d2xlZCBpbiB3YXJuaW5ncyBmcm9tIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QgcnVuCj4gPgo+ID4g
Q2hhbmdlcyBmcm9tIHYzOgo+ID4gICAgICAgICAtIFJlYmFzZWQgdG8gdjcuMS1yYzMuCj4gPiAg
ICAgICAgIC0gRm9yIHdhdGNocG9pbnRzLCBjaGVjayB0ZGF0YTEuaGl0IHZpYSBTQklfRVhUX0RC
VFJfVFJJR19SRUFEIGFuZAo+ID4gICAgICAgICAgIGtlZXAgU1RWQUwtYmFzZWQgbWF0Y2hpbmcg
YXMgZmFsbGJhY2suCj4gPiAgICAgICAgIC0gSW1wcm92ZWQgd2F0Y2hwb2ludCBtYXRjaGluZyB3
aGVuIFNUVkFMIHJlcG9ydHMgdGhlIGxvd2VzdCBhY2Nlc3NlZAo+ID4gICAgICAgICAgIGFkZHJl
c3MgZm9yIHdpZGVyIG1lbW9yeSBhY2Nlc3Nlcy4KPiA+ICAgICAgICAgLSBQcm9ncmFtIGV4ZWN1
dGUgYnJlYWtwb2ludHMgd2l0aCBTSVpFPTAgKG1hdGNoIGFueSBzaXplKSB0byBhdm9pZAo+ID4g
ICAgICAgICAgIG1pc3NlcyB3aXRoIDE2LWJpdC9jb21wcmVzc2VkIGluc3RydWN0aW9uIGFkZHJl
c3Nlcy4KPiA+ICAgICAgICAgLSBVcGRhdGVkIFJJU0NWIHNlbGZ0ZXN0IHRvIGF2b2lkIGRlYWRs
b2NrIGJ5IHJlcGxhY2luZyB1bmJvdW5kZWQKPiA+ICAgICAgICAgICBzZW1fd2FpdCgpIHdpdGgg
c2VtX3RpbWVkd2FpdCgpIHRpbWVvdXQgaGFuZGxpbmcuCj4gPiAgICAgICAgIC0gVXBkYXRlZCBS
SVNDViBzZWxmdGVzdCBicmVha3BvaW50IGZ1bmN0aW9uIHNvIGl0IGNhbm5vdCBiZSBpbmxpbmVk
Cj4gPiAgICAgICAgICAgb3Igb3B0aW1pemVkIGF3YXkuCj4gPgo+ID4gQ2hhbmdlcyBmcm9tIHYy
Ogo+ID4gICAgICAgICAtIFJlYmFzZWQgdG8gdjcuMC1yYzEKPiA+ICAgICAgICAgLSBGaXhlZCB0
aGUgd2FybmluZ3MgZnJvbSBgY2hlY2twYXRjaC5wbCAtLXN0cmljdGAgcnVuLgo+ID4KPiA+IENo
YW5nZXMgZnJvbSB2MToKPiA+ICAgICAgICAgLSBUaGUgcGF0Y2ggdGhhdCBhZGRzIHRoZSBleHRl
bnNpb24gYW5kIHRoZSBmdW5jdGlvbiBJRHMgZGVmaW5lZCBieSB0aGUgZXh0ZW5zaW9uIGlzCj4g
PiAgICAgICAgICAgYWxyZWFkeSBtZXJnZWQuIFNvIHRoaXMgcGF0Y2ggYnVpbGRzIG9uIHRvcCBv
ZiB0aGF0Lgo+ID4gICAgICAgICAtIEFkZGVkIGJyZWFrcG9pbnQgdGVzdCBhcHBsaWNhdGlvbiBp
biBzZWxmIHRlc3RzIHRvIHRlc3QgZGVidWcgdHJpZ2dlcnMKPiA+Cj4gPiBIb3cgdG8gdXNlOgo+
ID4gfn5+fn5+fn5+fn4KPiA+IE9wZW5TQkk6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
c29mdHdhcmUtc3JjL29wZW5zYmkuZ2l0Cj4gPgo+ID4gUWVtdToKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9xZW11L3FlbXUuZ2l0Cj4gPgo+ID4gTGludXggS2VybmVsOgo+ID4gWW91IGNhbiBwdWxs
IHY3LjItcmM0IHRhZyBmcm9tIExpbnVzJyBUcmVlIGFuZCBhcHBseSB0aGVzZSBwYXRjaGVzLgo+
ID4KPiA+IEhvdyB0byB0ZXN0Ogo+ID4gfn5+fn5+fn5+fn4KPiA+IEZyb20gdGhlIExpbnV4IGtl
cm5lbCBkaXJlY3RvcnkgaXNzdWUgdGhlIGZvbGxvd2luZyBjb21tYW5kOgo+ID4gbWFrZSAtQyB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icmVha3BvaW50cy8KPiA+Cj4gPiBUaGlzIHdpbGwgbWFr
ZSBhIGJpbmFyeSBuYW1lZCBicmVha3BvaW50X3Rlc3RfcmlzY3YgdW5kZXIgdGhlIHNhbWUgZGly
ZWN0b3J5Lgo+ID4gTG9hZCBpdCBvbiB0aGUgbWFjaGluZSBhbmQgcnVuLiBTYW1wbGUgb3V0cHV0
IGlzIGdpdmVuIGJlbG93Ogo+ID4KPiA+IC8gIyAvYXBwcy9icmVha3BvaW50X3Rlc3RfcmlzY3YK
PiA+IEJyZWFrcG9pbnQgdHJpZ2dlcmVkIQo+ID4gQnJlYWtwb2ludCB0ZXN0IHBhc3NlZCEKPiA+
IFdhdGNocG9pbnQgdHJpZ2dlcmVkIQo+ID4gV2F0Y2hwb2ludCB0ZXN0IHBhc3NlZCEKPiA+Cj4g
PiBIaW1hbnNodSBDaGF1aGFuICgzKToKPiA+ICAgcmlzY3Y6IEludHJvZHVjZSBzdXBwb3J0IGZv
ciBoYXJkd2FyZSBicmVhay93YXRjaHBvaW50cwo+ID4gICByaXNjdjogQWRkIGJyZWFrcG9pbnQg
YW5kIHdhdGNocG9pbnQgdGVzdCBmb3IgcmlzY3YKPiA+ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRy
eSBmb3IgUklTQy1WIERlYnVnZ2luZwo+ID4KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od19icmVha3BvaW50LmggICAgICAgIHwgMzM3ICsrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rZGVidWcuaCAgICAgICAgICAgICAgIHwgICAzICstCj4gPiAgYXJjaC9yaXNj
di9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9od19icmVha3BvaW50LmMgICAgICAgICAgICAgfCA3MzggKysrKysrKysrKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAgICAgICAg
IHwgICA2ICsKPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icmVha3BvaW50cy9NYWtlZmls
ZSAgfCAgIDUgKwo+ID4gIC4uLi9icmVha3BvaW50cy9icmVha3BvaW50X3Rlc3RfcmlzY3YuYyAg
ICAgICB8IDIxNCArKysrKwo+ID4gIDkgZmlsZXMgY2hhbmdlZCwgMTMxMyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdfYnJlYWtwb2ludC5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
a2VybmVsL2h3X2JyZWFrcG9pbnQuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icmVha3BvaW50cy9icmVha3BvaW50X3Rlc3RfcmlzY3YuYwo+ID4KPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
