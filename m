Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6248C982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+IeThtDG7tpJo7WtK7l9v5LNgyne95JtfhXQo1QnfY=; b=B0kHmT2HUkFEK9
	jsR5mkw7dnBaLJ1qmRHLSwWnGXHFZgPQVgF48JaOLKDZU1hL3mzcgCF1KbXG8tTLLAlDTfahT5+fV
	B1mABDzPp3xu1g7YV0DJhnxHwuQLThDt9qUmVSOiZg12MqPmIW9WnahrzbCCei28r0hDJk+SfryZW
	4fVD9Q3O8wFYyA/ziFt210UEgCFwh2mD1yYLZK8Gy3arVn68dkosZ+wv48sJyiylYn4rkrtCLoNGZ
	ivUSZvRpfIWfC/9tUHeMQkLquxtvJdqNbGd+dHN7/7utECyuVkT0QUxadlZa2v2LqWoIUlougHn4+
	tAlPEb0T03SwqA0W8zVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f4g-00000002PH0-2aeY;
	Mon, 21 Sep 2026 14:32:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f4e-00000002PGb-2BvO
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 14:32:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGTV02567822
	for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=; b=IhPDDERPEIKbMFAd
	g4ug9QshGTwL0pna643qpJ0WaDvB6HfRtmpn9UQ3FmOO9xhx/lpZOMwF1GyOPPXM
	EsZnb5K7B8VtRS78CS+aZAXx+s9CXPeSCAG/w4sCEmgmifFcFnKU+utbEWQ3gGEf
	TiDyyAKUSJ09MzWPAgql/ZJuMpVYIFXkWr2Bu6o9kRqrfxfPQ4VxftA0Jh98sb0W
	jqT7GW/y6BxcOHfO6K39alWyOb8uJxDptadWSHP/rxq44Y7oTGNpuzaEjjarvHLp
	761Qz6vDg+47aHh35c+cNwqqwgvfFiholHvdXhvm8mJ2BPrUyxkqvdWfwD2/xiz+
	mAmeFw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtudv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 14:32:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc435388657so4624788a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 07:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001170; cv=none;
        d=google.com; s=arc-20260327;
        b=q0HoqZHJBsEbmLqst043h9WKZC3ddPRtgrgNQxa/jQiciHe0I3YPN5flE2NFKWkTiS
         tJ5UTvHwgAntTldeVbVCPl7d1eZDJWadtd5I9zqwHLkJMHn7Fk/CslzgaUx3Y+nLvwGZ
         x7mHgTZCWwNs6siRlc0sIVIYufHLn3srne2ck2z7uZt2EikNUZuRexVQnwoIAvvczMjs
         AAGhIbyqXOSFthxrwlIv74W/akGsMLvzXAB2LyiKJGMvqJA1ZfVCZQBNoVA0MH43tRY0
         FsFIs0SC9+dqYIWoFB5FJJZ5FxDLAMy3SYHdXq5GoEjlJKv2Womw9jBlDUc7lOKzVjK/
         sNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        fh=fBoV4/vXnyrNzubVaugfjcJn3hKg3Qwx8M4FoPnxOxs=;
        b=L5rszW1D8vKvISiCxGkWs64X2bzpIAxaFhZAHRzwuCBFAeciLN1BqWsqpdgxZwTrNd
         Nivp48hZuhfZHUZso/jyMY72MbS/cvfuMvhByf9+yqBU2PIgPyOz5HnVFAGS3Y1CuXld
         EL3fZXcKaJvx0Orkorndj3EMktQWW0XW9BTrP46+YSvHJEEIjm/KLDA9/O4n1E7mewmf
         HbPn7/RUV8JkUZJjzEYHICvPR1uB3G+u9UjsDQwKOtIuDbxzH19h4MXcz8nYan2SBlz0
         oEgvOwRw4cPph1LnSdZigKEEcx4z6FQdqQ3QMR9rRNsWi6/t1MNb73JW0ye5iOSNZlpx
         VbpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001170; x=1790605970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        b=jBDYhKgiJh9zOgIw4neDuahOGJDkdkiMaGfmt5F2XovqVDT744uWfwzh5+Xt2LmD7r
         ZxHkQHyoT4/846i4UilsypG+AY8u9WzyGFjDNVaXcED3lqTx9fF24MbDrZVEEEFVpooj
         1a7H14eFwlCAZUiqPxTumqmr8t3a/oUd+PKnvRy2B4XtA2LsMtEl5+yIJiailhMIxwMX
         sXMtSnCWTxCAgvmhfPKEOiIWNWx1/8URGnHjHlDXA8YpH4awDwMo3qjr1gul0qlZfx8B
         qP9HrTbIVKagYAgs0daat+MiwrdejoJhtbdhoFkIgurIzZQwfllktPoTwr681/ghGx38
         ZDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001170; x=1790605970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V9qRL8QsRUF83XpiMXUfrfmmQn7slBViBa0BqoAT0o=;
        b=tpMOzyGeQ2XQ+0YnteYDuQ4FhUUFaE07Y1D3Yu+7+cqnmBEFHdQijbHlt+68Mq0Bed
         2dvmg+TRaG9m7IQC9/inYTtUd2rhFG6Epz/Q1r1/dnWndXD6krHr7KEhPudHhFBsEed2
         KK2lGrrcyVIlN7SQPuczTuvM/MEmdQrTLoImmwTAAUJuCGOaZElhCGp7tfOazDrcvU47
         IJpv67ZXT/WLNY/Tt+rI0LuuLgGSIRchDIM29VKana5fJ6PNcLnnOV3HpVeWddU0imZN
         Ht58uQrWiQR9iemdEpdrNWBrmHYAMfVV/LZO3e967s3eop0zvzOwFeFfx0uW1nnj8KsP
         8J6w==
X-Forwarded-Encrypted: i=1; AKwUvBynY/nQe0/lfk+i4rGYy8thNiDAYElJ6moY9NUBgXP/WF1ka1prZw9CHmGg27JSmspVQW8yS205fIBf1w==@lists.infradead.org
X-Gm-Message-State: AFuF++kagBOBuhNCpuHTsXSgVTtEBUer59dJyM70pIY/oig1zB98Uwtx
	iQf0Wq2D4y0U+ZXdPCstUeVDdeu4HDnDEuzu1TYcSB0sp4ID2AItqFqe1DOBgmtwI0d9qXGMmBP
	WTrvMVNkqQcrQDeyiBBqmggFYqZrFyVulM55lb0jFEHZmGozMkmk+nD3YnXKbpWDn/2avs/AiC4
	cTbZ1X658ol3sTBp/LOPMTY46Tk9YTYZ5EZ21b1Y39U39LJQ==
X-Gm-Gg: AYBFou0GvyQyagPUQy+tT+d0UbcDgdoitHC3gDKSdsZZGfE0G0hePfrklm97175cp+n
	ihP0IIwyzpXmLWqil/Opn8cTrstK8kwIoqdJ/ShJUMTenRIF6oPVS70emS52h+UhJP24swy7Bgu
	lH6KRkY4aTbWymt3wDmExxiQlBja5UQpuwt7zernCEGyI4zFAXGp2oAgTa+A==
X-Received: by 2002:a05:6a21:6194:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd8c3fe021mr18964758637.8.1790001170324;
        Mon, 21 Sep 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6194:b0:3cc:f008:8123 with SMTP id
 adf61e73a8af0-3dd8c3fe021mr18964705637.8.1790001169714; Mon, 21 Sep 2026
 07:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:32:37 +0200
X-Gm-Features: AcwNN1WpGO3jxKAH0ED7jq5tX0NF1bkBB1T37oZy7cznqRrvJi696dq7Itctpt8
Message-ID: <CAPx+jO-3ZgVTSE2y0_TW4cy8wUYCJaogNnzgCr-WX681_H+sfw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add RISC-V RPMI device power service support
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulfh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX0POQB2o5obdM
 HwPN1g7LPfgMe1StiKPMfdCOZTZSGkW3MSkkbDVbOJQOVIDVbdCCh8feNeKedWEZZmAc3yBii5F
 vKiInOLalwrYqfmweepHh1WnFyZlkYKzZbMU61jDWuinFYfxVmpSDKiM9zVPMJwjke6jtgXh6ul
 gCSWKmVIMuzN1KIe8ra5kw0MLqCZ1h6Q0qDyMiI5LhFTLLUlx/4hqDiVx87O3ipV0VxMyfegmO2
 JwKXOkNwEW9mpTNy93gXcRch9ZCJNwXRSa8lYtebOoLo90n1MsLtSGhBkkGVfv2AeQv06wjlLqe
 6beRSv9Qf8Akunmorw0U58zRBgjXTjiugvVICnrPtBvSK8qH+PgZ5BjRHle05eDb7Ygb+wckVVG
 gyndHsc4TuWbjdQl/9KQaIFnkBdb6/quhxAtwo/ypjLY93qpfHZPnXNTUrCJIB7zORYHUKWSY4L
 iNNXA/Qapa6tCjqcpTg==
X-Proofpoint-ORIG-GUID: 6oOUthd_8wuuiZSDvzV41mK9HGxR98Sz
X-Proofpoint-GUID: 6oOUthd_8wuuiZSDvzV41mK9HGxR98Sz
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14013 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=Bq6zwJu1AAAA:8 a=NEAV23lmAAAA:8
 a=2HKowqdte-bNKO3h_Y0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX6Oj4v2CerUwg
 hq4fTgWEk5ws3yINPrWSBPMuRqNedm3cV/Xtn/W6VofSfWAkSfyf6LwbIujnb9jHbxyzFWcDglw
 Xa7kwVKmcGjrRV+kXT7nno7hXxxkmE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_073252_567328_3E7FE045 
X-CRM114-Status: GOOD (  32.37  )
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

T24gVGh1LCBTZXAgMywgMjAyNiBhdCAxMToyNOKAr0FNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gVGhlIFJJU0MtViBQbGF0Zm9ybSBNYW5h
Z2VtZW50IEludGVyZmFjZSAoUlBNSSkgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIGEKPiBtb2R1bGFy
IGFuZCBleHRlbnNpYmxlIG1lc3NhZ2luZyBwcm90b2NvbCBiZXR3ZWVuIHRoZSBzdXBlcnZpc29y
IHNvZnR3YXJlCj4gYW5kIGEgcGxhdGZvcm0gbWljcm9jb250cm9sbGVyIChQdUMpLiBBbW9uZyB0
aGUgc2VydmljZSBncm91cHMgaXQgZGVmaW5lcwo+IGlzIHRoZSBkZXZpY2UgcG93ZXIgc2Vydmlj
ZSBncm91cCAoc2VydmljZSBncm91cCBJRCAweDAwMDA5KSwgd2hpY2ggYWxsb3dzCj4gdGhlIHN1
cGVydmlzb3IgdG8gZW51bWVyYXRlIHRoZSBwb3dlciBkb21haW5zIG9mIHBsYXRmb3JtIGRldmlj
ZXMgbWFuYWdlZAo+IGJ5IHRoZSBQdUMsIHF1ZXJ5IHRoZWlyIGF0dHJpYnV0ZXMsIGFuZCBnZXQv
c2V0IHRoZWlyIHBvd2VyIHN0YXRlLgo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBlcnZpc29yLXNp
ZGUgc3VwcG9ydCBmb3IgdGhhdCBzZXJ2aWNlIGdyb3VwOgo+Cj4gIC0gRFQgYmluZGluZ3MgZm9y
IHRoZSBwb3dlciBkb21haW4gY29udHJvbGxlciBleHBvc2VkIHRvIHRoZSBzdXBlcnZpc29yCj4g
ICAgKCJyaXNjdixycG1pLWRldmljZS1wb3dlciIpIGFuZCBmb3IgdGhlIFNCSSBNUFhZIGNoYW5u
ZWwgdGhhdCB0aGUgU0JJCj4gICAgaW1wbGVtZW50YXRpb24gdXNlcyB0byBleHBvc2UgdGhlIHNl
cnZpY2UgZ3JvdXAgdG8gdGhlIHN1cGVydmlzb3IKPiAgICAoInJpc2N2LHJwbWktbXB4eS1kZXZp
Y2UtcG93ZXIiKS4KPgo+ICAtIEEgZ2VuZXJpYyBwb3dlciBkb21haW4gKGdlbnBkKSBwcm92aWRl
ciBkcml2ZXIgdW5kZXIKPiAgICBkcml2ZXJzL3BtZG9tYWluL3Jpc2N2LyB3aGljaCB0YWxrcyB0
byB0aGUgUHVDIG92ZXIgYW4gU0JJIE1QWFkKPiAgICBtYWlsYm94IGNoYW5uZWwuIEF0IHByb2Jl
IGl0IHF1ZXJpZXMgR0VUX05VTV9ET01BSU5TLCB0aGVuIGZvciBlYWNoCj4gICAgZG9tYWluIHF1
ZXJpZXMgR0VUX0FUVFJTIGZvciB0aGUgbmFtZSBhbmQgdHJhbnNpdGlvbiBsYXRlbmN5IGFuZAo+
ICAgIEdFVF9TVEFURSBmb3IgdGhlIGluaXRpYWwgc3RhdGUsIGFuZCByZWdpc3RlcnMgdGhlIHdo
b2xlIHNldCBhcyBhCj4gICAgb25lY2VsbCBnZW5wZCBwcm92aWRlci4gRG9tYWluIHBvd2VyIG9u
L29mZiBpcyBkcml2ZW4gdGhyb3VnaAo+ICAgIFNFVF9TVEFURSB3aXRoIHRoZSBnZW5lcmljIE9O
L09GRiBwb3dlciBzdGF0ZSBwYXJhbWV0ZXJzLCBzbyBkZXZpY2VzCj4gICAgY2FuIHNpbXBseSBy
ZWZlcmVuY2UgYSBkb21haW4gdGhyb3VnaCB0aGUgInBvd2VyLWRvbWFpbnMiIHByb3BlcnR5Lgo+
Cj4gVGhlIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgZXhpc3RpbmcgUklTQy1WIFJQTUkvTVBYWSBp
bmZyYXN0cnVjdHVyZQo+IGFscmVhZHkgcHJlc2VudCBpbiB0aGUgdHJlZSAoZHJpdmVycy9tYWls
Ym94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYyBhbmQKPiBpbmNsdWRlL2xpbnV4L21haWxib3gvcmlz
Y3YtcnBtaS1tZXNzYWdlLmgpLCBhbmQgb25seSBhZGRzIHRoZSBkZXZpY2UKPiBwb3dlciBzZXJ2
aWNlIGdyb3VwIGRlZmluaXRpb25zIG9uIHRvcCBvZiBpdC4KPgo+IENoYW5nZXMgaW4gdjM6Cj4g
IC0gTW92ZSB0aGUgTUFJTlRBSU5FUlMgY2hhbmdlIGludG8gaXRzIG93biBwYXRjaCwgYW5kIGFk
ZCBhIG5ldwo+ICAgICJSSVNDLVYgUlBNSSBERVZJQ0UgUE9XRVIgRFJJVkVSIiBzZWN0aW9uIHNj
b3BlZCB0byB0aGlzIGRyaXZlciBhbmQKPiAgICBpdHMgYmluZGluZ3MgaW5zdGVhZCBvZiBhZGRp
bmcgYW4gTTogZW50cnkgdG8gdGhlIGV4aXN0aW5nICJSSVNDLVYKPiAgICBSUE1JIEFORCBNUFhZ
IERSSVZFUlMiIHNlY3Rpb24sIHdoaWNoIGNvdmVycyBkcml2ZXJzIG1haW50YWluZWQgYnkKPiAg
ICBvdGhlcnMuCj4gIC0gRHJvcCB0aGUgcmVkdW5kYW50IHRyYWlsaW5nICJiaW5kaW5ncyIgZnJv
bSB0aGUgZHQtYmluZGluZ3Mgc3ViamVjdC4KPiAgLSBDb21wYXJlIG9ubHkgdGhlIHZhbHVlIGZp
ZWxkIG9mIHRoZSBSUE1JIHBvd2VyIHN0YXRlIHdvcmQuIFRoZSB3b3JkCj4gICAgYWxzbyBjYXJy
aWVzIGEgY29udGV4dCBiaXQsIHNvIGEgZnVsbCB3b3JkIGNvbXBhcmlzb24gd291bGQgcmVwb3J0
Cj4gICAgLUVJTyBhZnRlciBhIHN1Y2Nlc3NmdWwgdHJhbnNpdGlvbiwgYW5kIHdvdWxkIGRyb3Ag
YSBkb21haW4gYXQgcHJvYmUsCj4gICAgd2hlbmV2ZXIgdGhlIFB1QyByZXBvcnRzIGNvbnRleHQg
YXMgbG9zdC4KPiAgLSBDaGVjayB0aGUgcG1fZ2VucGRfaW5pdCgpIHJldHVybiB2YWx1ZSBhbmQg
bGVhdmUgYSBmYWlsZWQgZG9tYWluIG91dAo+ICAgIG9mIHRoZSBvbmVjZWxsIGFycmF5LiBFdmVy
eSBmYWlsdXJlIHBhdGggaW4gcG1fZ2VucGRfaW5pdCgpIHJldHVybnMKPiAgICBiZWZvcmUgdGhl
IGdlbnBkIGlzIGxpbmtlZCBpbnRvIGdwZF9saXN0LCBzbyB0aGUgcHJldmlvdXMgY29kZSBjb3Vs
ZAo+ICAgIGhhbmQgYSBoYWxmIGluaXRpYWxpc2VkIGdlbnBkIHRvIG9mX2dlbnBkX2FkZF9wcm92
aWRlcl9vbmVjZWxsKCkgYW5kCj4gICAgdGhlbiBsaXN0X2RlbCgpIGFuIHVuaW5pdGlhbGlzZWQg
bGlzdCBoZWFkIGluIHRoZSB1bndpbmQgbG9vcC4KPiAgLSBTZXQgR0VOUERfRkxBR19ERVZfTkFN
RV9GVy4gVGhlIGRvbWFpbiBuYW1lcyBjb21lIGZyb20gdGhlIFB1QyBhbmQKPiAgICBhcmUgbm90
IGd1YXJhbnRlZWQgdG8gYmUgdW5pcXVlIG9yIG5vbi1lbXB0eSwgYW5kIHdlcmUgdXNlZCB2ZXJi
YXRpbQo+ICAgIGFzIHRoZSBzeXNmcyBhbmQgZGVidWdmcyBuYW1lcywgd2hlcmUgYSBkdXBsaWNh
dGUgZmFpbHMgZGV2aWNlX2FkZCgpCj4gICAgd2l0aCAtRUVYSVNUIGFuZCB0YWtlcyBkb3duIHRo
ZSB3aG9sZSBwcm92aWRlci4KPgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYw
ODI5MjA1NTIwLjE2OTEtMS1qb3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNvbQo+IHYyOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwODMwMTUyODEyLjMxMjY2My0xLWpvc2h1YS55ZW9u
Z0BzdGFyZml2ZXRlY2guY29tCj4KPiBUZXN0aW5nCj4gPT09PT09PQo+Cj4gVGhlIHNlcmllcyB3
YXMgdGVzdGVkIHVuZGVyIFFFTVUgd2l0aCB0aGUgUlBNSSBkZXZpY2UgcG93ZXIgc2VydmljZQo+
IGltcGxlbWVudGVkIGluIGZpcm13YXJlLgo+Cj4gQ29tcG9uZW50czoKPgo+ICAtIE9wZW5TQkk6
IGxhdGVzdCBtYXN0ZXIgYnJhbmNoCj4gICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3
YXJlLXNyYy9vcGVuc2JpCj4KPiAgLSBRRU1VOiB0aGUgUlBNSS1lbmFibGVkIHRyZWUgYXQKPiAg
ICBodHRwczovL2dpdGh1Yi5jb20veWVvbmdqb3NodWEvcWVtdS90cmVlL3JwbWktdjExLjEuMAo+
Cj4gS2VybmVsIGNvbmZpZzogZW5hYmxlIENPTkZJR19SSVNDVl9SUE1JX0RFVklDRV9QT1dFUiAo
ZGVmYXVsdCB5IG9uIFJJU0MtVgo+IHdoZW4gTUFJTEJPWCBpcyBlbmFibGVkKSBhbG9uZyB3aXRo
IHRoZSBTQkkgTVBYWSBtYWlsYm94IGRyaXZlci4KPgo+IFJ1biB3aXRoOgo+Cj4gICBxZW11LXN5
c3RlbS1yaXNjdjY0IFwKPiAgICAgICAtTSB2aXJ0IC1tIDJHIC1zbXAgNCBcCj4gICAgICAgLWJp
b3MgZndfZHluYW1pYy5iaW4gXAo+ICAgICAgIC1rZXJuZWwgSW1hZ2UgXAo+ICAgICAgIC1NIHJw
bWk9dHJ1ZSBcCj4gICAgICAgLW5vZ3JhcGhpYyBcCj4gICAgICAgLWluaXRyZCByb290ZnMtYnVz
eWJveC5jcGlvIFwKPiAgICAgICAtYXBwZW5kICJyb290PS9kZXYvcmFtIHJ3IGNvbnNvbGU9dHR5
UzAsMTE1MjAwIG5vX2NvbnNvbGVfc3VzcGVuZCBtZW09MjA0OE0gZWFybHljb249dWFydDgyNTAs
bW1pbywweDEwMDAwMDAwIgo+Cj4gVGhlIFJQTUkgZGV2aWNlIHBvd2VyIGRvbWFpbnMgYWR2ZXJ0
aXNlZCBieSB0aGUgZW11bGF0ZWQgcGxhdGZvcm0KPiBtaWNyb2NvbnRyb2xsZXIgc2hvdyB1cCBh
cyBnZW5lcmljIHBvd2VyIGRvbWFpbnMgYW5kIGNhbiBiZSBpbnNwZWN0ZWQKPiB0aHJvdWdoIC9z
eXMva2VybmVsL2RlYnVnL3BtX2dlbnBkLy4gVGhlIHNlcmllcyB3YXMgYWRkaXRpb25hbGx5IGJv
b3RlZAo+IHdpdGggQ09ORklHX1BST1ZFX0xPQ0tJTkcsIENPTkZJR19ERUJVR19NVVRFWEVTIGFu
ZAo+IENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVAgZW5hYmxlZCwgd2l0aCBubyBsb2NrZGVwIHJl
cG9ydHMuCj4KPiBKb3NodWEgWWVvbmcgKDMpOgo+ICAgZHQtYmluZGluZ3M6IHBvd2VyOiBBZGQg
UlBNSSBkZXZpY2UgcG93ZXIgc2VydmljZQo+ICAgcG1kb21haW46IHJpc2N2OiBBZGQgUlBNSSBk
ZXZpY2UgcG93ZXIgc2VydmljZQo+ICAgTUFJTlRBSU5FUlM6IEFkZCBSSVNDLVYgUlBNSSBkZXZp
Y2UgcG93ZXIgZHJpdmVyCj4KPiAgLi4uL3Bvd2VyL3Jpc2N2LHJwbWktZGV2aWNlLXBvd2VyLnlh
bWwgICAgICAgIHwgIDY1ICsrKwo+ICAuLi4vcG93ZXIvcmlzY3YscnBtaS1tcHh5LWRldmljZS1w
b3dlci55YW1sICAgfCAgNjUgKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgOCArCj4gIGRyaXZlcnMvcG1kb21haW4vS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcG1kb21haW4vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcG1kb21haW4vcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgICB8ICAxNSArCj4gIGRyaXZlcnMvcG1kb21haW4vcmlzY3YvTWFrZWZpbGUg
ICAgICAgICAgICAgICB8ICAgMyArCj4gIC4uLi9wbWRvbWFpbi9yaXNjdi9yaXNjdi1ycG1pLWRl
dmljZS1wb3dlci5jICB8IDQ4NSArKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9t
YWlsYm94L3Jpc2N2LXJwbWktbWVzc2FnZS5oICAgIHwgIDExICsKPiAgOSBmaWxlcyBjaGFuZ2Vk
LCA2NTQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Jpc2N2LHJwbWktZGV2aWNlLXBvd2VyLnlhbWwKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dl
ci9yaXNjdixycG1pLW1weHktZGV2aWNlLXBvd2VyLnlhbWwKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvcG1kb21haW4vcmlzY3YvS2NvbmZpZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9wbWRvbWFpbi9yaXNjdi9NYWtlZmlsZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9wbWRvbWFpbi9yaXNjdi9yaXNjdi1ycG1pLWRldmljZS1wb3dlci5jCj4KPgo+IGJhc2UtY29t
bWl0OiA4ZDNhZTU5Mjg4ZjFlN2Q1OGQ3NjU1OGE2ZWU5NmQ1MzNiYzUwMTlmCj4gLS0KPiAyLjQz
LjAKClRoZSB2MyBzZXJpZXMgYXBwbGllZCBmb3IgbmV4dCwgdGhhbmtzIQoKS2luZCByZWdhcmRz
ClVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
