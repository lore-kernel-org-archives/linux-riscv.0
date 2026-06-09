Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A6DCD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qR7oIG+hMHooHv0LcLoKMEjYiK7aJo1KTakYUrfYhZQ=; b=Bc4oRa0xGjjJ9w
	XuxK4y/bQ9P7Ziv9TWctaVpbsPC77Y1V3D+BNwQUnjRtuGiXwfXEBsNYuq9VvP3pK9hco9LE58XJ9
	KFexSudueFC1ZUiUcLc7lzaSlKBa5c0T7wpn/uxNcZNZC+V0Qp26gJEMVTPhwe0ojnzBGXI+DJGE0
	eEQ0LgSqZVOnjeBzC+Rr/7v2c6kaxCl0qnJOKFLTPEENnjD5rGJmyCToPza3MhAcimgxofSlalZTr
	I+VrqzP+YLWZ6QwOsZGAySuWE4SQ0lhjdRNwe0oH+npVjw04lrcE6zmbYG1AY0k630JyQW+yaaP+F
	8i4KVir8llYz8P6WkuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWreA-000000052jB-2Yz5;
	Tue, 09 Jun 2026 08:17:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWre8-000000052ir-3RF0
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 08:17:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rMm61585684
	for <linux-riscv@lists.infradead.org>; Tue, 9 Jun 2026 08:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jvupPNCldiQKAIDZ/DjgPDJckTZ6qUBUmQZPH8bK9Sg=; b=eQ
	k5Xu9bgZXNXJ4bQsWSdE0Q/hF3srxk9yTe3JRQkdC40uDEowSMrqS7QQqHTqZxVk
	eCGeFEusOg+w5sz7cCmeEO1aHxb2d3NamlhES9kf/HO2CDCbvfCjo2vAo9ww7EUB
	qr/0zdDRAgFFq2ypYQ28gc8ntwbaW+2G8MtoKN3iiteLwr3qDzMPGyi0kXSuOpay
	DrYLUpeGo41/qmgvY5kLPgIM+o7n+zoNoKMpXZUOMwx1w6psgTzgWXpXhSyQi2j/
	kpMrZ82TNStzxJqvdx+xZgnohrv2T+eGo/F5vXVaGUhCqXsDhaUJqx5NkU79XOzW
	kX0G8azJRS4o4VXLdPwQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgg4qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 08:17:16 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ea3cda53f5so11826167b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 01:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780993035; cv=none;
        d=google.com; s=arc-20240605;
        b=k4e4z7/WJbayYZ4cX5vix6b4HOzUe/4CJTcDFxdftlHSLr9EDs8tFmxS4XwlZcWDyS
         LSBh0ChVEmewxpJAmWeg12aJRxGj/ZawsPmKx22cAUO+AJjFDkvq5yyN2le9uO8c/D1M
         CyMe3u1InrWx4ASaP3I1nognPM1NQj2v2nmEoaKEVZSvVjQPe5NGpOGnQ8YHEjC9NTox
         uCkbkEYduqrM7O0CA83Qz4fOrAqqDkiT99c+PeCNSf4iucvca5/nr/KUzXn9RHoRN/BJ
         dMduUDU98JJ3n+XTMoYrm+uBnXzeLUepBPVy1S9x6K/u7HcRRprcfG7/iDmX0xNJ9CWL
         GTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jvupPNCldiQKAIDZ/DjgPDJckTZ6qUBUmQZPH8bK9Sg=;
        fh=JPBs0T0mqs7AduWVQZ+nKlQm2WT+U42QM4etRF6cFkc=;
        b=M6LheQ01TfNzOYMg3BxqdMVtoddwvOl27EhKODSpcKjHT6mt/xRyPn/iDsYpM9LBuu
         8JvIeu7bejENP55UxVJEEt2y82LdYiDKQR0R49WkGXTEN2YfI7E+oJ0HrDwkVhaSCLVH
         9bCngf0bmD4kP7HWaBbr5FqU6hnEp+RghT2bkEjX99UQLTGmJ2qKSjptbAzqW1ZFpdXC
         JcOC6UNwvg5aqjZy1YeNyk3liR082mui5nN7qG/cUOhxQDVfPxYrGw3WfqxRqwJsQ7ZM
         lDytUydlqgY2ybt4amgFYLrA0XZ0F+PlaIoXuhxUfztC89sbpGtXtsgreu0u1PROXUEs
         BHDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993035; x=1781597835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jvupPNCldiQKAIDZ/DjgPDJckTZ6qUBUmQZPH8bK9Sg=;
        b=LMBrhKfgyjMseZPF5bE5OwTTO4Uv3CDxUlKJIznhTK2k62fgnB059LH2ReHjlAWyEA
         TFJtktJNynfFQOuUS1wvAMJ0x5CR2pNg2My3lLR4VRn4O5S8qPnhtXeJQXAXGPF+MJ4/
         7StlAKMIFWH1YvSqxCb0F5zMWnFAl4o4s6ImuaVkPNAb0nAueaxCMX5ogUJ/doQRZe6d
         yf8zg2BhSPFSsgAgGfo/mFOyBVH7yBYZ2eyHfGTpBz3j+WHLbehM8/7W1XIccekputIF
         HH3ZyJU6Qe3rzmNu1gwYDkkI6g7Y8b7UYZ3aP+eD7Kej9Dki4//xTsBtujIJpDvLKowJ
         0iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993035; x=1781597835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvupPNCldiQKAIDZ/DjgPDJckTZ6qUBUmQZPH8bK9Sg=;
        b=lXcaQdRokRi1J7MXrzb+mxfKg5McpUk3wvWKeTiMJurNm95nI/WlLpA9VEnewN/7g2
         dL5Lmqg0x0KMyuQRwPYJYH8123BrOqWVJRPM3JZEmu4/W7UDpt05tdkxcNF8GU9XH2e0
         57gWOaWtJJZj5mCZYDxu2fTNHcUiZf908I8WMaPxVkANRPRRXbA5pTFc0O7nzA9y6QP+
         BjUZeNaBsXbMLrFV7/XZrxlxLu6AzG55/EjPKpBWqDmC4nnSNlAGDI2cJrOvM3z5LvOQ
         Q7q5lml5b7Q3JSfPBk2SHRKhWOcsVNMynyWg/z+LvDjpF4QPugK/o8OzPoioStNGqWdm
         srsw==
X-Gm-Message-State: AOJu0YwxSUZosCBvo3ZBHsJkCl3+R9N9+dh819RYH1gTh+DND8I22d/2
	n6M9YoXK4/+hC4v8DcglyEyWmOrE/nFr/jBXCMAk6iolO6QHDKcvmKhBLjuNVyk3n7sjrWb5BIS
	k/WXz/xnqlEJzgaDKXnt0744XT8jAm243SZWRtD71z6pWfY9aBqDNKFnx7Wr0YSLmbHbPmhSjhm
	QDechGn5lBXW02tblvV3ESMTvta+CKIcvuYVSFcVkPDWgqcwRHNvDV2PEf
X-Gm-Gg: Acq92OHzy2HhoA3Z8i8BAnidtryqkJ6g6UU8q7xXKxPyaOeHchzR1fjI+sA5GtefwW0
	3R+6zdR9Cvv35ak06Qav0OWXqkD2SEA3/sVcB3TKRniC0narN1xLZRznCYU2Bj0G6EsfSezpOta
	AgIMqlL3cX0eVTEmTbYrsdwpFpT4MpGz2n3bRITqCmagNg3U7Rr/QWW42OoPf1BbiHglIIjuiuO
	CAi6LOcsGbiSEoRZg==
X-Received: by 2002:a05:690e:4105:b0:660:2f29:9d9c with SMTP id 956f58d0204a3-6614f8195bfmr1177962d50.57.1780993035306;
        Tue, 09 Jun 2026 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:690e:4105:b0:660:2f29:9d9c with SMTP id
 956f58d0204a3-6614f8195bfmr1177943d50.57.1780993034797; Tue, 09 Jun 2026
 01:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-6-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-6-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:47:03 +0530
X-Gm-Features: AVVi8CewdCgb0dSR_aOfcZlf5FZmhKTqxG1BVy6uKMuIOJaJR9mdub3hX1vwY7s
Message-ID: <CAB19ukEWxUTnouJLG9pVBkS9VcfdFP_nVdG9T6V_4dAVLDNKxQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] riscv: conditionally compile GHES NMI spool function
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NyBTYWx0ZWRfX6Cc8qzNOPuHs
 ora2w5aZ3KAnDJeC5pZzh5UihbwW9v8+FdCisffue1rcgeZyzCA5raRRh2p+ypSyf9SKlQ4uZt0
 +4PuYyBy869XLes7cmzhNLpBLYBivrFpG5eJXXseydf9QxBNUM4i6b5XwMU5xzNNSaxpyHOnQ/R
 LZ63U08koWu/AQfCbcMD0f0xJs2OJGy+wht6eAk4rpHTUmUCQI0pty6AVax38EvkbQN51p2krHz
 G+3OOpAYdpJY3Das6cFXZbdwSZJOA9MyxL9T4Ykv8FATcH6kKRJMT4AZN57PTudmbzlxOu9UiJf
 Ko9HcLg3W/aYzoqe2qNj/emixt0xR76XcFY2h2PPvqlsAlaIIygcMvq+GB5giOPj6QdQe5C3OsT
 HJR64QZgfZMjZT9Kio246y20JOZ8ehCAdTbCiffKoS+5VnnqGEtVZVTqgkivWgFpOKRyc3ar9eH
 0xhdig+pqwVxycZMqOg==
X-Proofpoint-ORIG-GUID: JxZpJibRh1ChnB2AqGTL-BMqdv6wj69F
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27cc0c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=9L7PnyXcnU1f3mQPG5kA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: JxZpJibRh1ChnB2AqGTL-BMqdv6wj69F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_011716_860525_A68475BE 
X-CRM114-Status: GOOD (  14.65  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxNOKAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDb21waWxlIGdoZXNfaW5f
bm1pX3Nwb29sX2Zyb21fbGlzdCBvbmx5IHdoZW4gTk1JIGFuZCBTRUEKPiBpcyBlbmFibGVkLiBP
dGhlcndpc2UgY29tcGlsYXRpb24gZmFpbHMgd2l0aCAiZGVmaW5lZCBidXQKPiBub3QgdXNlZCIg
ZXJyb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBDaGF1aGFuIDxoaW1hbnNodS5jaGF1
aGFuQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvYWNwaS9hcGVpL2doZXMuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYWNwaS9hcGVpL2doZXMuYyBiL2RyaXZlcnMvYWNwaS9hcGVpL2doZXMuYwo+IGlu
ZGV4IDMyMzZhM2NlNzlkNi4uOGVkYzJjOGRiMWJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNw
aS9hcGVpL2doZXMuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9hcGVpL2doZXMuYwo+IEBAIC0xMzk3
LDYgKzEzOTcsNyBAQCBzdGF0aWMgaW50IGdoZXNfaW5fbm1pX3F1ZXVlX29uZV9lbnRyeShzdHJ1
Y3QgZ2hlcyAqZ2hlcywKPiAgICAgICAgIHJldHVybiByYzsKPiAgfQo+Cj4gKyNpZiBkZWZpbmVk
KENPTkZJR19IQVZFX0FDUElfQVBFSV9OTUkpIHx8IGRlZmluZWQoQ09ORklHX0FDUElfQVBFSV9T
RUEpCj4KPiAgc3RhdGljIGludCBnaGVzX2luX25taV9zcG9vbF9mcm9tX2xpc3Qoc3RydWN0IGxp
c3RfaGVhZCAqcmN1X2xpc3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBmaXhlZF9hZGRyZXNzZXMgZml4bWFwX2lkeCkKPiAgewo+IEBAIC0xNDE1LDYgKzE0
MTYsNyBAQCBzdGF0aWMgaW50IGdoZXNfaW5fbm1pX3Nwb29sX2Zyb21fbGlzdChzdHJ1Y3QgbGlz
dF9oZWFkICpyY3VfbGlzdCwKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICsjZW5kaWYK
PgpSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQG9zcy5xdWFsY29tbS5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
