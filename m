Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BD7C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wssKXcwvxWxy+93jglSN2eRveWhOxIBL5PkNCYvaEQQ=; b=CqgV+oxBvvvSC5
	0DbV4DQeoZyVjuh9WT2ezNZC1BX4nMhiQy6JqNcBglyPO+ZWzNu2703oq/FfGfz/eK5LlmcdUMhn1
	G8gfh3UYoGKTMb47JKSoVfq37sem85vS5Xz/v4WS9UFgbGFAOTjAsarFQEQGHoZaj2xLWAY0BuM7y
	b4snpNFAwlWjTtHxSPfwd/VzIMJU19t2s+IGHJKk5mq84mBXjv9jTkN6TZ8Ld5zllmyN6IJeOR/+a
	UsaufosNP2lZ4QUlnNiPl+eDhEe/F9+W+zLWJMceeyIUXkjsN4VFM2CKSD42007iULrSDxI05OVvG
	iufnkcX5sX7V1N4L3dFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6obC-000000099eu-1rg9;
	Wed, 16 Sep 2026 12:18:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ob8-000000099dx-3RXZ
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 12:18:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G9335X2822936
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 12:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=; b=k9
	V8GFXWHIdnHp6Y4RnNpVLDr67AHxIWYMsbp2wmPOzH94cRlXMQtwXV7xIZ+9BXR0
	0nR/078w0RDY5npb796BNWhMuXLAAqG6YK8dtpYEurKNfXq7Fa/7aD8tX3wFdkE0
	6OHdaRuZIiumN1U6y20TE8eyAsSsgbwWzLMle0j74mNUcOwU9w13bLZnbHclBNtu
	moDljfiHU5n5r9RW2PtAkTPiqmbehLJGMTTfkBwrO4AQzmgh35DJCUDpox7iqzDr
	mGAcBB8eoI1ibcz/V3z+ZnEVL93hmW3Yer9TFDNbRPMORE3IkU6KVJOQnmPVv+Jg
	lOWWtHO7wLNgrboDzF0g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjrr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 12:18:44 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8823e022390so69226197b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 05:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789561124; cv=none;
        d=google.com; s=arc-20260327;
        b=faG2pN/0oDB1e8sFj2mwErHA2wf7m0CCEzqxcSnyMpmDunk2Je42VyRTWXzPsQLSal
         zav9V6sG97Oi4bTH+7l10SPSsB2VjexTv5ZdOLqUdmUGt59ruCWsWLQO1BgbD4gjznIi
         Hy/j6aGttCI9e2DhoOnLUaFLgQzTgYE1rb51sShlSTgKG8mDVAob9/RslSx/Mn3bS64Y
         MXz7Ubfc0k3t75u77m+cbLxx19wUlBFGzxzJ1JS/Kim4Ymrw51PS/QjdHAYmybf9StXg
         ZHO/jxoGn0oF3Tzc76RCH2WYUal+zLdkmaROiFJNHhasChfm5oCjitrx9nNiMKgQVzun
         Htgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        fh=6/mkT/MTDV6GVvSG4wjrv+VjKY9YU/dOwi5fQz+FV1k=;
        b=Guxma/PlcifshGtyMwtBRlf0gCvX3VfomY+z2U401H8ZcBxn1AttP4xkuCHQvfuygv
         ttbUEvGkb7Ad/A7ydv8wWG2GvzJTYbib95nds3u2x0hnk8a6vPMzqutpIc+7FTsmU3LT
         JbyiFogE4USzxhU5PtgPag2wDAAbRyS+EcjS62ZZ22FksmuJroguWtWfqatpklI6EGLe
         fbjWa0u6RiTX/i/odiT/MCSWnUqeaaX9FfViYmVNS2bbJtaG1aTxMFmLlSh5kQkh1sHR
         Hcz8+s/q4bx7jV7TQNNwtHTuODYGrxxLJP/b3iaEodrja0lXYq+CCrDht7biDrMWkXqn
         i6rw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561124; x=1790165924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        b=g+CI++xNeDk+owbWAy953qIEQg/0+et6vfMYHgB5SUFtNlcWG1VWGrjpkafdjcCraL
         +97g8m3lAb+t5yI8E9fMy3LbN+Zou2Uiv6SCYloQsrfAnqJCdXrcH8MSyVycuYqFgOHK
         f9hDCKk1pD5QIAj+C/K+bjEnGHOno38BKeJQXVQz6uVjSWlxnnd3Nebkj+Vyt/2T4USG
         yzXqzGKCm4xRm4YeCRMWX8EeRc8MgGuMUvPNEFLTG1p9gk9ZdefyfO/AGkFXbzeDSyfS
         SJ08/silm2swBr80VklkJARTHfgxRFEWOn/ak6Raz8S9sUrCTI7VgfvtmqnNFL8U1X/3
         ddXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561124; x=1790165924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZBupEoFPUauIn4/x4mdIDMsjjahDV5vgXK9nZDkKoc=;
        b=eMr8p7kPEP/tvz5KnhYIdrxkZ1lKWF/1mvue0b8ieRrrdKmYeKL4CzOojEqiwcrFHp
         1DyRZfcqCwae3/aOdYs0Q5DzHTcO0/z4rq7oSLvdjIAezHzxfllpJjXTlAEHUN1P5QQ4
         yir096wvcVA++zz3ejOg933V9qzgsvmu2ktqwKkLH2X3khhHUyhJ5ggwtsvJOZQ+Pefc
         0GdCZHdEs7xzipP3z3IeExXKnoGgra7mpSbJ0/O2Gi3vf+tAw4sP09QEGo3dY6V3Mj2W
         atvMiTks73yIen1LuORvJ0D5R+ONYytgjZefzrmsNRQIjh5qBP/uS00QDqOjyIsmrxui
         VmEA==
X-Forwarded-Encrypted: i=1; AKwUvBxKy/RfDzzhSDmVK6A96HS3A335elpLWk7l8eV4GCRPYUVBaVbyyCLY5dFhZRNykDuRWBB6sMClBB9O1w==@lists.infradead.org
X-Gm-Message-State: AFuF++k6cxk/dVkIZj+ziBCx5k49jh6am2HctkuUIogNDPHTrfTF4a8q
	dkp2c7rIZTVqLYKN+mEE+86LJw7tStvTO8IMvnrr9ULzEpb9+Ywfi8F+sMt3w49QLuQQIGnuI7E
	2kY+iyFQ6QE77H/LFehyYjO95pHvcAKBVNQAsqil0Hmt3mIxYiO7onIeSHphXpFX9yBy6yf75Cq
	z0yxJFnjohrYYJ8h9kioltFjfcbJCgzwU9l1jwRrKsp/+dCII0J7tumJPT
X-Gm-Gg: AYBFou2dwB5jPRdgf6b10dgBDn/7OYftCvJ48ThykeXYUe8TQdZd/M5c9RV4deyeY/h
	3/kxsAs/rVnfmICl9dWiVSI8obgfeo3pzL8G/ls7Fgwykvhf40KC5fIl1qntQy0v4j6u0vCv7/k
	Rd+5IrDDdwhVhG4nsZb9soJk9i4acn0B+wOk8wr2y1bcs5a4hGkq9/QIrIllA=
X-Received: by 2002:a05:690c:34c9:b0:873:5bb2:6c12 with SMTP id 00721157ae682-892265e7601mr6043677b3.60.1789561123707;
        Wed, 16 Sep 2026 05:18:43 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:873:5bb2:6c12 with SMTP id
 00721157ae682-892265e7601mr6043477b3.60.1789561123293; Wed, 16 Sep 2026
 05:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:48:31 +0530
X-Gm-Features: AcwNN1W_xPwCRH9HhXLAxBaZmSSff5vjkIMgObB2TpK3jfnwJHHIzxaUu74RxEQ
Message-ID: <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
Subject: Re: [PATCH] riscv: iommu: ask for ACS to be enabled
To: BillXiang <xiangwencheng@lanxincomputing.com>
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa8924 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=D19gQVrFAAAA:8 a=4BKX8IsyAAAA:8
 a=RP7urAqO3HFMDD4ElOsA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=W4TVW4IDbPiebHqcZpNg:22 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX030IqB2IerWm
 CsREkDbTz5BSqEzSsGB3SXvURWgmOl68VWdHZFq4ok3kNInLAD37lE4Dxl80hV9wRiSfpbpuET/
 DrhtWOUSDYqfemHBrbnWxYu0/3USUo4F+3TMrTeFE9XE05W60eOz/f5yCAjlooz4THL27x/n8UW
 fLs7iWOvaBoguSbPk2L0LU76uY+jTxRQA8Qxzj55OPBhRIV/8RcxCqrpKGUvm8Awc4nepbZXk5Z
 ascACTyI4FmmfAkiQ1nyEkC8nw/aAj66PTk3BiDB9Xnw0uKW5RyC60giVMiSeDsbEqpoviyj3ue
 zza1gy0cs9UGXE91iH/msp5JTorpfssDVEnoY401KjTueoAJ+6+qPrrIscjyDRpdfqo0OVyFhE3
 +tHNCUz+EPqER1Bt/r9096aMl1nuQt6j0eM42jhsT5M5YLRpqD2evvx2S5XgGxrTnE0USqiasDT
 gWEEMFylPjtuUvsChFw==
X-Proofpoint-GUID: Yt-Yrg_ARTupKB1vqF6NKfnEPiSKL9MD
X-Proofpoint-ORIG-GUID: Yt-Yrg_ARTupKB1vqF6NKfnEPiSKL9MD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX9/z2dcw7u2Vx
 UDpwnersIQ8QXnvWgANpr7PgDcgdIhKwl0iDmL32gRbYca1BSVEjA0fkZurILn+W/GSjQ6NokpV
 rR8jwk4BhHdNWXX4QI4wQ8jl3r3y6Kk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_051846_978933_C01794DF 
X-CRM114-Status: GOOD (  16.23  )
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
Cc: aou@eecs.berkeley.edu, tjeznach@rivosinc.com, alex@ghiti.fr, rafael@kernel.org, guoren@linux.alibaba.com, linux-kernel@vger.kernel.org, luxu.kernel@bytedance.com, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, palmer@dabbelt.com, jgg@nvidia.com, pjw@kernel.org, linux-riscv@lists.infradead.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgNToxNeKAr1BNIEJpbGxYaWFuZwo8eGlhbmd3ZW5jaGVu
Z0BsYW54aW5jb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IE1ha2Ugc3VyZSBBQ1Mgd2lsbCBiZSBl
bmFibGVkIGR1cmluZyBQQ0kgcHJvYmUKPgo+IFNpZ25lZC1vZmYtYnk6IEJpbGxYaWFuZyA8eGlh
bmd3ZW5jaGVuZ0BsYW54aW5jb21wdXRpbmcuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvcmlz
Y3YvcmltdC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9yaW10LmMgYi9kcml2ZXJzL2FjcGkvcmlzY3Yv
cmltdC5jCj4gaW5kZXggZTQ1MzhmYTZjMmM4Li4zMGQyZDAyMTFkNWUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9hY3BpL3Jpc2N2L3JpbXQuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9yaW10
LmMKPiBAQCAtNTI1LDQgKzUyNSw1IEBAIHZvaWQgX19pbml0IHJpc2N2X2FjcGlfcmltdF9pbml0
KHZvaWQpCj4KPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+ICsgICAgICAg
cGNpX3JlcXVlc3RfYWNzKCk7Cj4gIH0KPgpUaGVyZSBpcyBhbHJlYWR5IGEgcGF0Y2ggaW4gdGhl
IG1haWxpbmcgbGlzdCBmb3IgdGhpcy4KCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI2LzkvMy8x
OTMwCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
