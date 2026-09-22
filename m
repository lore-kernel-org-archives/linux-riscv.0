Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5445CC982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IIVeY5CbWdbqw5Fv6X0HrC4ecvb1oXY530A2AWDhRH0=; b=ODRVd/gO0glCXL
	mibw6i1RwB4BCuDA8eghWoF0PfjIeYlgTcxzXUjEAAQwgNSgw4O9T6XBFOBxBiMlYV3vkTtONE4gh
	/MtiVPK57rvVdPNBXygM0JIY2mMKPNJkn1E267xNfc83vrtKLq4IZcRF1hsmlQ6IEwXsfmAaAQZVy
	28H633gS5CxRNlO6dpps4Ngya1Q4sR8xO2/GeITPwqDE4AnjCWcmLolhe59nFB6YipmoQuGkdjOQh
	1Dt8MwsuSiZqNObQM2G1IJj4NGo9rLQUZ5LSZJ4wMjxdI/r4hv8lz/k94Gpl04RfpOo7mbiX7Lkml
	264QV/J9JsIX1B5tqjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vJV-00000004ZV8-1gdm;
	Tue, 22 Sep 2026 07:53:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vJS-00000004ZUU-4A3W
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 07:53:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7RNVp2578884
	for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 07:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=; b=HJM1jRTJWzZcVx+p
	mWV08rpifDcLwRU4dEETmvvT3bgJAlIPB4g3kaqx6I9Re+H5w3ftTAXJJSef9bff
	oVhbHiK7C9XnMMZLHuTU45pO+uplMp/JFmBhXKk9/vifIvm0buSM0gc/U5ZpN2UH
	7ENVnTgHl8wUHxxL/TJ0HKk/V4O9OWkyvkxLztXncllM6rlDdHEYEwdIR9Vh+Snj
	530fUHFUzMEoKxvWYt9w84s1r8r0beYVGR/3/7xPE2e73ZCWVDrgG7+REhBMLsJl
	n6KSRZju/Zhcuxn0Dwf00a0z8yL8ykyRJ7ueyn8/TGTEc6sUecKVZ3XrSq/c9PJ4
	6rrMJA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub32aa4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 07:53:13 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8200c815489so42005127b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 00:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790063593; cv=none;
        d=google.com; s=arc-20260327;
        b=igK+m4e48CMh178GqBWn1CIDiFRt+F/uyXoB+1fDpWgqu97xmhtrWcOXF26i8dBrQh
         J34j0R1j888pgrkixbLEVmuYCM86UXhHtGW9d7TUE4vxy3f6/mzVkfe9Q6f6tLpjsoxv
         CNSCPRqjrzuDJPQGzZwFoVLejTJeYDFjk2AbWUEOeqSy/715kIEFxwygJwIbseMIBjaB
         cXwGpCjLo5LW6Ksh+Cm9QpnuGA7eraLnlq/6KZd0uuw6dYAz6g/zAqN0dc7eOj86hEq3
         wb7SmmDf4PWZ/5lf0NU8lCKXdyYYGy8lijvvDQiCxm3Tn2tneMYSKg0M8KHp9BpW59hA
         068w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        fh=Yx/4dxDC24Vz9vaTVUSJlgO3sz732z+bmTmnCCE2X4g=;
        b=B37t3SHJZ+t/4CMh8msxmKJlDzysx0ys5yZcjQ5EY45KhxA9aEfCK1lZMqDaFptjMb
         rYL7b+98g/rUNHm+CYL/8jHwJisIFRlGhMyicO5xVH+id7Qq/ga1jYR7mlFf04XK9GGI
         NROFOB0dbqN1tXuwHINnxoWhHeVB0yPmoon4eAuCTtZM1UmFcOHCqj67mkV1N07MnISE
         2y8bWIddujLWJZMziZqCR5ugTVrOePDWWY58GMYraS68yCO2WKqqWTjUG+egEZGUNb9I
         DMCIHbPGF4IJ67+tREHstpl4+YXVzJ2CFCJf8FJvzDQLfEmDT8l58QS+9I2ZwiJPCfiw
         bnDw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063593; x=1790668393; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        b=YTfKiHvstVThp5i5wIrPRccG/BoveLZ0Ai4n8ZHsuqrDlsFXUWRUJOSjxYuH4vf7Ar
         OWIDoYZTlStWzoP7inuD+Wf1461f5pvcbHSkbrc5fFHitBuXaEn0iy7eLwkLrQ0TeE2j
         ER7xm+OaEjbfRGqnT2H4aIMa4bM5zfn1iIaM7l+/XNX8XE/qji3BSDFwzsELItVCglpU
         PUvhYk13jfJfbMqspHvHfZLF0qkVAkJhS2hRxeV0bCpjW+cpLXUHWzeGj/NHWpRMLOZA
         4axUixdtvo5LFRLuU3iWdKtOW2LA9B3Ogwv1Z6rlLhmhQpLpBdnGMwyLX1hinanZtFrb
         QC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063593; x=1790668393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eM4o3vQJG5YSqEOi7+3WJZVTDqM9mwXMz1W8oS+gJdw=;
        b=SPGWrb1UQYGdHvWYh3FlImXLOs2sB5RJuBunFtU0/swW7Y9ln9c7Z86FRDAoYBqVaA
         VGQqKr411vhKeII1kvtINK600bRp3b8eKrVS8EPtqTqUOPlbl3wJKfL0AhpBzPUvxl1M
         ps5VGTDqhrqGv6gXSMX1RRsJnHTs8dKaS1yrrKDuyXJV9KJHh2XQq7YrBUFzGSXxO54T
         w4/fRgArCQwRYdq7dkTxm6V5rODmv8HkVpDI6xrWulqJkCTG0IPS4zsyN6bvNKqm9d6Q
         S6Uf50YuLbdzli5Ifwx2wMLxVHkZR60YQDMcpGuNEV1gg2s8mukmKRuNg896ZJxd0d9t
         Ea1A==
X-Forwarded-Encrypted: i=1; AKwUvBzkYy7njgmQphVa2CMRLXH2hy9lCdN/TmrZVZlMtP+G8Hg0lhhoWYAke7st5r8ShUNgNktfW8NMKFSS9g==@lists.infradead.org
X-Gm-Message-State: AFuF++n95B0p1If9dFwxjhKJ0adJg1HGS8h8YkFkrqsESl2OY2n/OvDg
	ryMAK9aUw8+WvwupeCs7rZg8PJnF8u4oLoKMPf+4AdpDDxywYKEQkHceaHbCjyuaVN4Nyr/R7wC
	nJhXHqcJG4LFnc09PbEKfT3DRW5rmaafD+cNXorxGQyZ9zrpKAC8E7qrtlX4jRGhcGKZq0riPCI
	NYskhkqjuV0F+bxpKMy08a/WNQr5NT/J35Af5EK/vu6AMldA==
X-Gm-Gg: AYBFou0akPmvZ1EzC1ayNIRtE5sfZ/aZpjYsaT5zydAOzS5q3TL0iPJSPucHPLIijuX
	1ldgLrh+vn+ey4Mon5kryuF0DSc/xa4L4Vw05/OP3ny2kqRPK/+QAz8QuCQU7kx2JlLCFx8vi+k
	SbYcG47DGcj3EHyLHKYvb90lMAu53QTbJH/vmHZAqfTB4jxZ1Dwhev1n4=
X-Received: by 2002:a05:690c:34c9:b0:8a2:2993:5237 with SMTP id 00721157ae682-8a22993528dmr6368417b3.26.1790063592658;
        Tue, 22 Sep 2026 00:53:12 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:8a2:2993:5237 with SMTP id
 00721157ae682-8a22993528dmr6368287b3.26.1790063592222; Tue, 22 Sep 2026
 00:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260914175435.118303-4-marouene.boubakri@oss.nxp.com> <20260915020235.507302-1-marouene.boubakri@oss.nxp.com>
In-Reply-To: <20260915020235.507302-1-marouene.boubakri@oss.nxp.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 09:53:01 +0200
X-Gm-Features: AcwNN1XNGpI1PX37tg0BbLtLSRsjIrFGw8p2FV8jkmKL1NiS6WMD2T0eaz1XIwE
Message-ID: <CAGgiveUEFL+UWzydBGxVveadffpO3BWbKjQ1UbJ_dOPgLu2m4A@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: prepare the driver for RISC-V
To: marouene.boubakri@oss.nxp.com
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-riscv@lists.infradead.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab233e9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=zEqzrABc4qne4u8U3FwA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 1hlW0pTMqAGPjObfGOXYS1MOmCzXgKkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX2Op9ZD8dMZaE
 maVwcFAWXo9vW0MnU2nc6rEoafDH0XPUjTYFqOH25b9jMsoVU1pYri5O48lOAA2SHIpDrrCsQXB
 BixDx+yvOTsxH6li31BWCpCOQYk3Gf7PWWKFG+NkzOXB7NWD696wp93aPkfrXo+9vMtFm6Xm9WW
 vYKCjRliFrShmHP31Xoevk+8zpLhXCVoiEIbmNjLReGmQPyGuXxFKpuwON6OimW8X7O28ENdZ1S
 tuZW+QZnwij+HwsF5+FVwu4zb5o+ZAA+Ad28f6J7VJrUNiDT0ogOAbSouLQ3XOb6n1kRL5Zxl4n
 lyyD+ie4chOAnG1isjWY098EjX65xlR95318DtTQJS0c7OMVJFbzkRvwIHIOaoSElKuOie3OK3O
 p97vco0525d1SCE7CSX4U+8GFor+kJ3ZTRCkyhBdHMOAHwGI8/yztiOLoWLOPuWtRGeVgpasoX5
 GgxCQVgfBg+o7tA1sqw==
X-Proofpoint-GUID: 1hlW0pTMqAGPjObfGOXYS1MOmCzXgKkd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX6YDYIB5m7k3B
 8LTtZNvp64SatsFFXMelSvbStAliFpzRGW7hwvbmLI5CD16DXqGRfsHyNe2hJmuG4gWFE7SBvGf
 AJdxSp0VZ/nY0WNOCRbgD364hJdU9CI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_005315_153210_F82E1036 
X-CRM114-Status: GOOD (  36.03  )
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

SGksCgpPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCAzOjQ44oCvQU0gPG1hcm91ZW5lLmJvdWJha3Jp
QG9zcy5ueHAuY29tPiB3cm90ZToKPgo+IEZyb206IE1hcm91ZW5lIEJvdWJha3JpIDxtYXJvdWVu
ZS5ib3ViYWtyaUBvc3MubnhwLmNvbT4KPgo+IFRoZSBPUC1URUUgZHJpdmVyIHJlYWNoZXMgT1At
VEVFIHRocm91Z2ggdGhlIFNNQyBBQkkgb3IgdGhlIEZGLUEgQUJJLAo+IGJvdGggc3BlY2lmaWMg
dG8gQXJtLCBhbmQgdGhlIFRFRSBzdWJzeXN0ZW0gYW5kIHRoZSBPUC1URUUgZHJpdmVyCj4gZGVw
ZW5kIG9uIEhBVkVfQVJNX1NNQ0NDLiBPbiBSSVNDLVYgdGhlcmUgaXMgbm8gU01DIGluc3RydWN0
aW9uOiBPUC1URUUKPiBydW5zIGluIGEgZG9tYWluIGlzb2xhdGVkIGJ5IHRoZSBNLW1vZGUgZmly
bXdhcmUgYW5kIGlzIHJlYWNoZWQgdGhyb3VnaAo+IHRoZSBSSVNDLVYgUGxhdGZvcm0gTWFuYWdl
bWVudCBJbnRlcmZhY2UgKFJQTUkpLCBjYXJyaWVkIG9uIGFuIFNCSQo+IE1lc3NhZ2UgUHJveHkg
KE1QWFkpIGNoYW5uZWwsIGZvciB3aGljaCBMaW51eCBhbHJlYWR5IGhhcyBhIG1haWxib3gKPiBk
cml2ZXIuCj4KPiBUaGlzIHNlcmllcyBvbmx5IHB1dHMgdGhlIGJ1aWxkIHBsdW1iaW5nIGluIHBs
YWNlIGZvciBhIHRoaXJkIEFCSSBuZXh0Cj4gdG8gdGhlIFNNQyBhbmQgRkYtQSBvbmVzOgo+Cj4g
LSBwYXRjaCAxIGJ1aWxkcyB0aGUgQXJtLXNwZWNpZmljIGNvZGUgb2YgdGhlIGRyaXZlciBvbmx5
IG9uIEFybToKPiAgIHNtY19hYmkuYyB3aGVuIEhBVkVfQVJNX1NNQ0NDIGlzIHNldCBhbmQgZmZh
X2FiaS5jIHdoZW4KPiAgIEFSTV9GRkFfVFJBTlNQT1JUIGlzIGVuYWJsZWQsIHdpdGggc3R1YnMg
Zm9yIHRoZWlyIHJlZ2lzdHJhdGlvbgo+ICAgb3RoZXJ3aXNlLiBUaGUgU01DQ0MgaGVhZGVyLCB0
aGUgU01DIGFuZCBGRi1BIHNwZWNpZmljIHR5cGVzIGFuZCB0aGUKPiAgIFNNQyBSUEMgcmVnaXN0
ZXIgcGFyYW1ldGVycyBpbiBvcHRlZV9wcml2YXRlLmggYXJlIGtlcHQgdW5kZXIgdGhlCj4gICBz
YW1lIGNvbmRpdGlvbnMsIHNvIHRoYXQgbm90aGluZyBBcm0tc3BlY2lmaWMgaXMgbGVmdCBpbiB0
aGUgY29tbW9uCj4gICBwYXJ0IG9mIHRoZSBkcml2ZXI7CgpUaGlzIG1ha2VzIHNlbnNlLiBUaGFu
a3MgZm9yIHRoZSBjbGVhbnVwLiBJJ20gcmV2aWV3aW5nIHRoZSBwYXRjaC4KCj4KPiAtIHBhdGNo
IDIgYWRkcyBhbiBSUE1JIEFCSSBwbGFjZWhvbGRlcjogYW4gT1BURUVfUlBNSV9BQkkgb3B0aW9u
IGJ1aWx0Cj4gICB3aGVuIHRoZSBNUFhZIG1haWxib3ggZHJpdmVyIGlzIGVuYWJsZWQsIHJwbWlf
YWJpLmMgYW5kIGl0cwo+ICAgcmVnaXN0cmF0aW9uIGZyb20gdGhlIGRyaXZlciBjb3JlLiBUaGUg
dHJhbnNwb3J0IGlzIG5vdCBpbXBsZW1lbnRlZCwKPiAgIHNvIHRoZSByZWdpc3RyYXRpb24gZmFp
bHMgd2l0aCAtRU9QTk9UU1VQUDsKPgo+IC0gcGF0Y2ggMyBsZXRzIHRoZSBURUUgc3Vic3lzdGVt
IGFuZCB0aGUgT1AtVEVFIGRyaXZlciBiZSBlbmFibGVkIG9uCj4gICBSSVNDLVYsIGFuZCB0ZWFj
aGVzIHRoZSBtZW1vcnkgdHlwZSBjaGVjayBvZiB0aGUgZHJpdmVyIGFib3V0IHRoZQo+ICAgUklT
Qy1WIHBhZ2UgYXR0cmlidXRlcywgd2l0aG91dCB3aGljaCB0aGUgZHJpdmVyIGRvZXMgbm90IGJ1
aWxkCj4gICB0aGVyZS4gSXQgaXMga2VwdCBzZXBhcmF0ZSBhcyBpdCBjaGFuZ2VzIHRoZSBkZXBl
bmRlbmNpZXMgb2YgdGhlCj4gICBzdWJzeXN0ZW0td2lkZSBURUUgbWVudS4KCkkgZG9uJ3QgdGhp
bmsgd2UgbmVlZCBhbnkgZW1wdHkgc2hlbGxzLiBJJ2QgcmF0aGVyIHdhaXQgdW50aWwgd2UgaGF2
ZSBzb21ldGhpbmcuClNvIHBsZWFzZSBkcm9wIHBhdGNoZXMgMiBhbmQgMy4KCj4KPiBUaGVyZSBp
cyBubyBmdW5jdGlvbmFsIGNoYW5nZS4gT24gQXJtLCBPUFRFRSBzdGlsbCBkZXBlbmRzIG9uCj4g
SEFWRV9BUk1fU01DQ0MgYW5kIHRoZSBTTUMgYW5kIEZGLUEgQUJJcyBhcmUgYnVpbHQgd2hlbmV2
ZXIgdGhleSBjYW4gYmUKPiByZWdpc3RlcmVkLiBPbiBSSVNDLVYgdGhlIGRyaXZlciBidWlsZHMg
d2l0aG91dCBhbnkgQXJtLXNwZWNpZmljIGNvZGUKPiBidXQgbm8gQUJJIHJlZ2lzdGVycywgc28g
aXQgZG9lcyBub3QgbG9hZC4gVGhlIFJQTUkgdHJhbnNwb3J0IHdpbGwgYmUKPiBpbXBsZW1lbnRl
ZCBvbiB0b3Agb2YgdGhpcyBpbiBhIHNlcGFyYXRlIHNlcmllcy4KPgo+IFRlc3Rpbmc6IFRlc3Rl
ZCB3aXRoIHRoZSBjb25maWd1cmF0aW9ucyBiZWxvdywgcmlzY3Y2NCBhbmQgYXJtNjQsCj4gYnVp
bHQtaW4gYW5kIGFzIG1vZHVsZXMsIGFuZCBXPTEgYXQgZXZlcnkgc3RlcCBvZiB0aGUgc2VyaWVz
Lgo+Cj4gICAtIHJpc2N2NjQsIG1pbmltYWwgY29uZmlnICsgQ09ORklHX1RFRT15IENPTkZJR19P
UFRFRT15Cj4gICAtIHJpc2N2NjQsIG1pbmltYWwgY29uZmlnICsgQ09ORklHX1RFRT1tIENPTkZJ
R19PUFRFRT1tCj4gICAtIGFybTY0LCBtaW5pbWFsIGNvbmZpZyArIENPTkZJR19PUFRFRT15IENP
TkZJR19BUk1fRkZBX1RSQU5TUE9SVD15Cj4gICAtIGFybTY0LCBtaW5pbWFsIGNvbmZpZyArIENP
TkZJR19PUFRFRT15IENPTkZJR19BUk1fRkZBX1RSQU5TUE9SVD1tCj4gICAtIGFybTY0LCBtaW5p
bWFsIGNvbmZpZyArIENPTkZJR19PUFRFRT15IENPTkZJR19BUk1fRkZBX1RSQU5TUE9SVD1uCgpT
aW5jZSB0aGlzIGlzIGEgVjIsIEknbSBtaXNzaW5nIHdoYXQgaGFzIGNoYW5nZWQgZnJvbSB0aGUg
VjEuIFRoZQpwYXRjaCBzdWJqZWN0IHByZWZpeCBpcyBhbHNvIGluY29ycmVjdCAodGhlIFYxIHdh
cyBjb3JyZWN0KSBhbmQKY29uZnVzZXMgdGhlIGI0IHRvb2wuIFdoZW4geW91IHBvc3QgYSBuZXcg
dmVyc2lvbiBvZiBhIHBhdGNoIHNldCwKcGxlYXNlIGRvbid0IGFkZCBhbiBleHBsaWNpdCBJbi1S
ZXBseS1UbyBoZWFkZXIgaW4gdGhlIGNvdmVyIGxldHRlciB0bwp0aGUgcHJldmlvdXMgcGF0Y2gg
c2V0Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTkvcHJvY2Vzcy9zdWJtaXR0
aW5nLXBhdGNoZXMuaHRtbCNleHBsaWNpdC1pbi1yZXBseS10by1oZWFkZXJzCgpDaGVlcnMsCkpl
bnMKCj4KPiBNYXJvdWVuZSBCb3ViYWtyaSAoMyk6Cj4gICB0ZWU6IG9wdGVlOiBidWlsZCB0aGUg
QXJtLXNwZWNpZmljIGNvZGUgb25seSBvbiBBcm0KPiAgIHRlZTogb3B0ZWU6IGFkZCBhbiBSUE1J
IEFCSSBwbGFjZWhvbGRlcgo+ICAgdGVlOiBvcHRlZTogYWxsb3cgZW5hYmxpbmcgdGhlIGRyaXZl
ciBvbiBSSVNDLVYKPgo+ICBkcml2ZXJzL3RlZS9LY29uZmlnICAgICAgICAgICAgICAgfCAgMiAr
LQo+ICBkcml2ZXJzL3RlZS9vcHRlZS9LY29uZmlnICAgICAgICAgfCAxMCArKysrKy0KPiAgZHJp
dmVycy90ZWUvb3B0ZWUvTWFrZWZpbGUgICAgICAgIHwgIDUgKy0tCj4gIGRyaXZlcnMvdGVlL29w
dGVlL2NhbGwuYyAgICAgICAgICB8ICA4ICsrKysrCj4gIGRyaXZlcnMvdGVlL29wdGVlL2NvcmUu
YyAgICAgICAgICB8ICA4ICsrKy0tCj4gIGRyaXZlcnMvdGVlL29wdGVlL25vdGlmLmMgICAgICAg
ICB8ICAxIC0KPiAgZHJpdmVycy90ZWUvb3B0ZWUvb3B0ZWVfcHJpdmF0ZS5oIHwgNTIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBkcml2ZXJzL3RlZS9vcHRlZS9ycG1pX2FiaS5j
ICAgICAgfCAyMyArKysrKysrKysrKysrKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy90ZWUv
b3B0ZWUvcnBtaV9hYmkuYwo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
