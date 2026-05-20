Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9644CD4F5E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW4EdmOLiX0BAMeg/a4dloXWszRS2FKLjn0NDGgHjUs=; b=NmtmuogUQGWiIc
	pbqML/7xIQRu0wu5EayTZIT6KPYba4f3RGZTTo5cHDDDOh2pmWFs6N/6r28NJQ1aTkvfmDHjDy/4u
	DD/I4iV5hniCs796SMjPaEXOQ6iEvKP9pfAeQa+2F346dQA9K4k4ldSY8fe+V5NbPOOhUK4N9NcDO
	FnIUz6+ZK21iCHqr3KKzZgQ1se8fsML8j3v0SvAhSuN3dPCElVoJrDeK7VYkLCug7PkEflTR0Hu1N
	sBqjIxCijqZjBWu2sKIRConBv4jOtCYRNfKt6eFa3zBm4f1PUC/6yUhnNtnLEEFF0nBQ60FxwSXMt
	v8/qnoiKoR6VCtK5SvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbd6-00000003qOi-0qIx;
	Wed, 20 May 2026 07:46:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbd4-00000003qOI-0CJG
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 07:46:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6uN041739333
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 07:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=O+neZlhZoIPG55qPIJ1F9Q1q+0lcFRe0NrLx1x9e9Mg=; b=Qg
	lqAxWl9zlp/BXEt0wTEfUDjLvrekKb2KieQ32ophaZyfi7NEXkme9yKlOeCH2Ccw
	G735FLq3/syCLVTnv2EEC2klCo95mG6MAsB9wROl7rU6lcrwkhuUwFIbjLwm8hYV
	gf34/KriAyhL/RiG6hB0HLhKfKC4WK/+4Etq2eAgy9+Y7oljqKXoUailAc+73beN
	cykXPUTonfgzRFMOCc88TKM6c9TYSHDU1GoXC/nSBEx6pd7+EwZaufKJPb5nUVtg
	NpMtK5gyO7GBZqFqcilheHyIIyoxLSV4AZqOIxeNNI6Cc9N4qfVSiCfY0B0eOefR
	I7MW2+8a1PwppNOWiL/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbj5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 07:46:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b1f39c5827so110777636d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 00:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779263168; cv=none;
        d=google.com; s=arc-20240605;
        b=VpQMSF2rbnlHZgNJPSjfD52t8obHGMJcccK8KinLdBj4Jsga48HCBpS7BaLAjXjcNt
         WwaR7V06/LoKOEVpH76GpYSHOXZ8CMNtB9E13dg4wA35O65+0rPjmyxv8XameEZFot24
         v42Z8xLyUXf714s0jnCMzGFSubajZ8ZwkLXdUdoQacIym5/SzfWShJ0BFii9J2jEDmjx
         R7bQffAydIeqhZJaZxaaI3PCACKQw7JSQ25VSY74zv3d0UFzm1ZlJXID9LR4amoFH4ZK
         ye+It8rjvGK+15wweCkSZKAnnuLdv5BLACc6ueT6j5RLs8PZp8Wi982blROgROlnVS1l
         EsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=O+neZlhZoIPG55qPIJ1F9Q1q+0lcFRe0NrLx1x9e9Mg=;
        fh=ZPoOyA5Ua2zvIzJl55OZfVOT/TYbs/1qQKmhVE8wTQ0=;
        b=WWQQKoJIyWCTWMPZQi1/4lV7WDEuPwd4Y7gP1k2rQeuy138bsjWTZs8Zzf3KUOqQ/P
         nnP2SerRa3+Pb6lszm4BqZU15SCPirr3WpDCRMKxXABehHY2s/N00YKwSZZvsCu6ZDDI
         QGWiaMgrGbfVYWYf+wXboxdvxTP/8jGrdOxf4VgCsfkQ41sMKM6r50c8u7m6Q6rjMM/m
         ZWHrSxx02Zy7FZovmGDfebhYrqQ82gp8KILmwiVzM0eSzzA/eCuC1VcULyrMVItL1DfA
         OGD4JmsT/pvII0X43vjyCkVTKOQ5xyArG7/9hQMIGUMfL5h9TxyM+/D9Oxh9KhHdknaF
         J6LA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779263168; x=1779867968; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O+neZlhZoIPG55qPIJ1F9Q1q+0lcFRe0NrLx1x9e9Mg=;
        b=fCs1PRmFluduiBencW78jGn0BDY7wOZC7dPWrX7MmONPfNOZgOOlpjev7blcAQQdux
         b7sXeS7kCfpdgoFMF9N7noUvHUuEOQE3pF4u9udvBwvWffy0+y1DQCW8wtzVulxDw/DR
         Jf/S9Ed6fbglh2j9lBYtQtcGKYz6c4Nth9mKtXKsunPjjf0MfJIdgiU1KKg0Hwqu4hzg
         W+HN1WH5UNUtuL9BJ8MlEFhz26FiIC0ce/AfSc7P/9n0LFkBnddpJPR+M2TWDSIzPfgm
         j6tjRtfcxGo36FejPlBNU/HXmgHX/DOTm0Uf21n22lX7yvo1vvCpJ4cqv8KbGynJN+gZ
         xUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263168; x=1779867968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+neZlhZoIPG55qPIJ1F9Q1q+0lcFRe0NrLx1x9e9Mg=;
        b=mganmFBPsfIUgozp3ifPOyRAWhcfhg/iSuNsQ2PG1fLfoE+UEQ73E4vhJErXv+imRr
         7QM8ZLnZMUN0PyCv7mjUWvs5FBJnYKNcy0xBcNnPwtz2y8hhEnCq+ebn6xnTwPOR7cv6
         5ZDNF5e6aZn3dkvjPJjsGu3skFi5BGCaMoDPWlmhT6vgx9McDrIq4TcMmW/eqQSpxVRq
         TF1lAMAXVrpq4fsHGb8ON0sPHwfb8T5kzIofSfnPKlXkS/LZLzOCBiwEsrZ99edFNjQC
         rd3X8aH8jG5Z9M+atvh7VxRnLtqhfmStmx5tQCuksP+Eoht4MU4rDfslUR0M1JhnbA2A
         YkjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eppQg8/DLKj6mQWHUYZsmUnKyxkKDdnx3173HSnIJQ37zIVbckeeBr3q4Wjek1pV9M2Qdt3LKRJqkBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcLIn6/hwJdaZUfkTppSy+JgryCrORNgvFy3J3HBOXIrTSwyGn
	PsMpN0/SPo1lLPJagXPVYlw3Sh87kTra0DXssmci69Wp28NIXZrgThZ1sKSvEG0fhBbqe2Qalxf
	nEclqY3NmLpO0gNhnbtmXLG/fcVgnv+r1bdfWG/bhmWqiL4zm0IQ85A1oj/D7bNaNrnyo7KrNpP
	+gxJqLHgEqhJiXtjGOMMJoYWWfsZYNZ3NuUsgCD9P6n9ia2Q==
X-Gm-Gg: Acq92OGknwOnalsxlc2gn6zkSB5svDwLjWCNONNENIsRQsWJB7QEoGOXtTiY13bSkdL
	Zxlk9EdiOU+73j0rLrjDOZAxrFBJQnze4rsEtteyYvTfZi/yDmlrypF1p7DrQkUSmw5jNUwxM66
	c28Mu5iBIUgHkFeWsCLUfh14ZSGlse8eU+7A7eyJUyuQjCaK4j5MkO+DSSnXwT8Dh0W+9znHYD+
	ZuiIUM=
X-Received: by 2002:a05:6214:5b0d:b0:8ca:25e6:e892 with SMTP id 6a1803df08f44-8ca25e6e8bbmr269085736d6.2.1779263167783;
        Wed, 20 May 2026 00:46:07 -0700 (PDT)
X-Received: by 2002:a05:6214:5b0d:b0:8ca:25e6:e892 with SMTP id
 6a1803df08f44-8ca25e6e8bbmr269085396d6.2.1779263167340; Wed, 20 May 2026
 00:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260519125716.81594-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260519125716.81594-1-fangyu.yu@linux.alibaba.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:15:56 +0530
X-Gm-Features: AVHnY4Lgw6DV5LpnwFbar1eFNvQ3Rqpaj6_FwIN8ELASJvNY0Bf-7-jKrWD2V6Q
Message-ID: <CAB19ukGk2AUA3yjsrBxjsUsH9pUSeeu5F6vo1FFBcd504VQPzg@mail.gmail.com>
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are described
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
        andrew.jones@oss.qualcomm.com, guoren@kernel.org,
        iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-GUID: r01dYmCaKQgqvaz0KjUnll_jq6a6eqrR
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d66c0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=SRrdq9N9AAAA:8 a=RxsSgplYz4Zavn4rlPAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: r01dYmCaKQgqvaz0KjUnll_jq6a6eqrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3MyBTYWx0ZWRfX2gFxcuPBO+Hs
 oa44Yf3RL9v/fwfmntZ+IDytnDQMk5OlO8mgSCYMuiYl+qRsQ4jrT3VUPLOiHKusyaUdtC0WdQ3
 pEjoKK/j1m/ZffhFC2CSlEOImNWi0whBnr2plY2SbY+EyjA9g2mw+YL7/z2GmrbdM7kGDHdaWdB
 52is03W/g1Iz9wRxmLyKYkmQlIbv/QVaUmhazwAHlLG3HYQakxInaYRx2ZvKed1mxKJgJGGfgF3
 u0IWYzogygVPQlHNkYpG8JF1CCNQElrgxKx+f4SNVZYeQfDUXXyPCJV3qB499Y3eZ2+yi6B5Eqn
 sIat+7ZFz1TM4z2NzjbUfO0naeTyECl2mUvN6k+UDs3CvaPRa/IFcxlNx72fozzdlDQqP9e3ioS
 jnvDXeWxONR6DjdMtwEWsxmlc0B79fs56+pBiWeNWYAlU8hwUiCnwN5s7n98A0/tQFyTHu/3PTh
 h2B1seh9Qym7tY1Qs5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_004610_208947_A02552D0 
X-CRM114-Status: GOOD (  21.92  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNjoyOOKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBUaGUgUklTQy1WIElPTU1VIHNwZWMgZGVmaW5lcyBJR1M9Qk9USCBhcyBzdXBw
b3J0aW5nIGJvdGggTVNJIGFuZAo+IFdTSSwgd2l0aCBzb2Z0d2FyZSBzZWxlY3RpbmcgdGhlIHBh
dGguIFRoZSBEVCBwYXRoIGFscmVhZHkgYmVoYXZlcwo+IGFzIGV4cGVjdGVkIGJ5IHNlbGVjdGlu
ZyBXU0kgd2hlbiB3aXJlZCBJUlEgcmVzb3VyY2VzIGFyZSBkZXNjcmliZWQuCj4gVGhlIEFDUEkg
cGF0aCwgaG93ZXZlciwgY3VycmVudGx5IGZhbGxzIGJhY2sgdG8gTVNJIGV2ZW4gd2hlbgo+IGZp
cm13YXJlIGRlc2NyaWJlcyB3aXJlZCBJUlEgcmVzb3VyY2VzLgo+Cj4gVXNlIGZpcm13YXJlLWRl
c2NyaWJlZCB3aXJlZCBJUlEgcmVzb3VyY2VzIGFzIHRoZSB0cmlnZ2VyIHRvIHNlbGVjdAo+IFdT
SSBmb3IgSUdTPUJPVEg6Cj4gICAtIERUOiAiaW50ZXJydXB0cyIgcHJlc2VudCwgbm8gIm1zaS1w
YXJlbnQiCj4gICAtIEFDUEk6IERTRFQgX0NSUyBJbnRlcnJ1cHQoKSBkZXNjcmlwdG9ycwo+ICAg
ICAobWFpbmxpbmUgZG9lcyBub3QgeWV0IHBhcnNlIHRoZSBSSU1UIEludGVycnVwdCBXaXJlIEFy
cmF5KQo+Cj4gV2hlbiB0cmlnZ2VyZWQsIHJld3JpdGUgaWdzIHRvIElHU19XU0kgYW5kIHJldXNl
IHRoZSBleGlzdGluZyBXU0kKPiBoYW5kbGluZy4gS2VlcCB0aGUgZXhpc3RpbmcgYmVoYXZpb3Vy
IG90aGVyd2lzZS4KPgo+IEZpeGVzOiBkNWY4OGFjZGQ2ZmYgKCJpb21tdS9yaXNjdjogQWRkIHN1
cHBvcnQgZm9yIHBsYXRmb3JtIG1zaSIpCj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5n
eXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUtcGxhdGZvcm0uYyB8IDE1ICsrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUt
cGxhdGZvcm0uYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYwo+IGluZGV4
IDM5OWJhOGZlMWIzZS4uYmQ3NzEyMjMxMTQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUtcGxhdGZvcm0uYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUt
cGxhdGZvcm0uYwo+IEBAIC03MSw2ICs3MSwyMSBAQCBzdGF0aWMgaW50IHJpc2N2X2lvbW11X3Bs
YXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICBpb21t
dS0+aXJxc19jb3VudCA9IFJJU0NWX0lPTU1VX0lOVFJfQ09VTlQ7Cj4KPiAgICAgICAgIGlncyA9
IEZJRUxEX0dFVChSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSUdTLCBpb21tdS0+Y2Fwcyk7Cj4g
Kwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIElHUz1CT1RIIG1lYW5zIHRoZSBJT01NVSBzdXBw
b3J0cyBlaXRoZXIgTVNJIG9yIFdTSTsKPiArICAgICAgICAqIHRoZSBzcGVjIGxlYXZlcyB0aGUg
Y2hvaWNlIHRvIHNvZnR3YXJlLiBVc2UgdGhlIGZpcm13YXJlLWRlc2NyaWJlZAo+ICsgICAgICAg
ICogd2lyZWQgaW50ZXJydXB0IHJlc291cmNlcyBhcyB0aGUgdHJpZ2dlcjoKPiArICAgICAgICAq
ICAgLSBEVCAgOiAiaW50ZXJydXB0cyIgcHJvcGVydHkgcHJlc2VudCwgbm8gIm1zaS1wYXJlbnQi
ICAtPiBXU0kKPiArICAgICAgICAqICAgLSBBQ1BJOiBEU0RUIF9DUlMgSW50ZXJydXB0KCkgcHJl
c2VudCAgLT4gV1NJCj4gKyAgICAgICAgKiBPdGhlcndpc2UgZGVmYXVsdCB0byB0aGUgTVNJIHBh
dGguCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChpZ3MgPT0gUklTQ1ZfSU9NTVVfQ0FQQUJJ
TElUSUVTX0lHU19CT1RIICYmCj4gKyAgICAgICAgICAgcGxhdGZvcm1faXJxX2NvdW50KHBkZXYp
ID4gMCkgewo+ICsgICAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsICJmaXJtd2FyZSBkZXNjcmli
ZXMgd2lyZWQgSVJRczsgcHJlZmVycmluZyBXU0kgb24gSUdTPUJPVEhcbiIpOwo+ICsgICAgICAg
ICAgICAgICBpZ3MgPSBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfSUdTX1dTSTsKPiArICAgICAg
IH0KPiArCldvbid0IGl0IGNoYW5nZSB0aGUgRFQgYmVoYXZpb3IgYXMgaXQgZG9lc24ndCBjaGVj
ayBtc2ktcGFyZW50CmFueW1vcmU/ICBJT1csIHNob3VsZCB0aGlzIGJlIG1hZGUgc3BlY2lmaWMg
dG8gQUNQSQpieSBjaGVja2luZyB3aGV0aGVyIHRoZSBkZXZpY2Ugbm9kZSBpcyBhY3BpIG5vZGU/
CgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
