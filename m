Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB34AF55459
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 05:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1giIRvB6g9wx7W7fbPboGqMooNKEWWGAh72U+n8NfVQ=; b=hSBiXrqTqU50gq
	plgpLohqLJqMMn8d6kEwYK4HP7n4kmatG0d0bGPA2w/yctRB9FPkUye+7PGG5v5l1kz6AD9keXvf0
	2HCKOYaSg0OwH5wtTvix4XexPTIMp76gRB7AqPoOuO5EbJWV0aiOvT8uW/hzxv/m+ky0yDuesz+ul
	2EqqPwYri4HSJKCXyWO9MMVgsPzdZXfG6lMPIzYH9rs/v/vqHssHCDJR33AEe7NeRV3cpIGvPbPaP
	02TXbztzcNG+xViwCpj0Sy8NbZoDdrRw/bdujZPbr9bB8LoH7BxtXKVfrv0R0dkMTX3BZQXgyv07E
	QPLat8AgJp2AUpEPBiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv73p-00000003DXN-3SzW;
	Wed, 25 Feb 2026 05:03:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv73n-00000003DX1-0pHd
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 05:03:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2H5V34077429
	for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 05:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b41a+9bp4JqJAOZW3g/GdEZYpcUEVlxvv5VPzD6I9IQ=; b=C3q+rXVJsCx4xIJZ
	X6Dm+FekfDDgeNIf5lfb3gc6s39Mup18c3g1RRrN9tG3L2VKp76FK3GUCCAH5+9E
	0iUvkxI+2KM5lnQRKw5RwhUv411bz82S7aRjZSF0EMrnzyTzFSKvACh7DdYQWHaT
	OsEFGX1PxDHpurirdaqr0h98l8HqSSbvMMPSlhVzMHixB9lDrSGvyUXnVkKp03w+
	dpi4ZSzQgDHEvwnt1x+cU70iR3byHV7+/GJqAhrtMdrDXhdLCJIZvaP9/tOyE3hd
	9NcFTujN8XlbG1eJoP5u6eqD2lKopRpk5lmleaDMGiRDH6An/RMF35KeIRn6J2/X
	ldvSJA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p8bsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 05:03:39 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-679c448d15cso62754686eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 21:03:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771995819; cv=none;
        d=google.com; s=arc-20240605;
        b=l3Y0j2vCvOPpCuzk+uQDoF7/uh4hPCqm8QDsP5BzeYCaqvdK0RV0Q3vZvbV9KfXn6p
         EaglYM9/mz2MtWSy2juqxKFH5jvXOfBkX6ilrt/2mr0xHFnIRGOUcS2goAd5h6G20YO1
         mTOtHM15z9fqrn9iaALhHqapFOyxhPy6hSNhnYBNkZxVxdRmpINtSE5ZwQfKfa4SCEWY
         N+hl6hRhV++uvsPt1tRXPMe+xzEIZJ8Y1BNuP4w57ZuK/OHWuLP4z5Qn5V3o0RZpVuTV
         djjLOrTt+t5LoP23zx9Huu0N+IcR/2DoqkrvF3LbQfCIkoxDcOuiMRuabS7gLrFkuoZt
         LCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b41a+9bp4JqJAOZW3g/GdEZYpcUEVlxvv5VPzD6I9IQ=;
        fh=KxxpG87eyZhsuELkctlJBpcOPHnJSqUK2LINvlKUc7s=;
        b=QtI/SUFaaUuD0p+dgH716KvXhZgsAcTNNSId3930Jz93sKDnRPwElCWT4VmwsWK7xl
         3hiWPmRxGipVrYg52c465HMWJuE3AdBpuo+zqrQNSw+udbZ2+b/gBWWoHoXyQEIRQHH2
         QF9lqJfvOzgXci2XrwGAhsJqWJoQP+1NH+WLbzcFNbeO7Vg3jDMhQCRCo537MwmzsseU
         iKhxa0IYl38Elc8lDXsHu4E19rHxwSLh/GJ3EpI7vf46ZKIw4QYaehw/OU+XbWstOyB3
         fwmlKkpmA6iLJng3UCdO1fqZyQ0DRQDceUHg1oOucBdhi2SxLlcmt3QXJkyw1wqqfn+/
         g4vA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771995819; x=1772600619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b41a+9bp4JqJAOZW3g/GdEZYpcUEVlxvv5VPzD6I9IQ=;
        b=UD/UYm8Wo7ndzGLScS82ovpkqtMAX33BHgRpyxoap/c32HxkGpxRPySpHgFDFhMhpL
         xFDUaNkP6gGe5YLvUYqkAxxhrwhma2Bc8A8D3rZWMPkFhpPWjLqz+BWIxpqDDEUj6vB/
         4rt8hGevwvq07HZ7l116Sx16D90zcRqi1LQjxbJ49Z6k/H8qlTKWR11XV/EmkVNCq84t
         OUWg4yG/WzUqwHgbZkdPVpRPoSBl3yccUiJWsBR1RCwWOt+E/HSkACUOExHTAHreUQlq
         ZCHaWY3iFVo38FE1yDcw1q1i2/RlU+izMinPM0HsCZWQaRLWe/utFYnGfMFS6/YJ0uvS
         I8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771995819; x=1772600619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b41a+9bp4JqJAOZW3g/GdEZYpcUEVlxvv5VPzD6I9IQ=;
        b=eQNe8NuJ5Dhas7zNPRsNberdv96uI9U8LOIqcwRKRuni9wHAMeNKtQ/aT96y8LgDyJ
         8yY5QR/H3/1nOVmVICv8XdVKa+8xSh6LbUn0ttHP/ZmPifySrbomDkDhLUl5jAsL0XVA
         Db67fmFHk9g4ofOmYA4iFBYS1xZIsdE9QJ3yczvH8B9jvAnx2ksAyIlJiib5wtUF6oCI
         TaBp9b2Jzi10H5rBKDFUn2dWarTubFt3KaMMrKFDoSck+n+gQcitNyv9bjXNpXswvfF4
         r/wTAzZqoPopiRHDx8wtWE2j9kJRiiNQDLB2WxCB+MnpFINI3POBoGYC7w2OrS4Cl6Uu
         4SVA==
X-Gm-Message-State: AOJu0YyQx16LXxEz/urQaJEIRWa8czwT3Iq/eqp4uRh+MNY5GK08i1P6
	pCqFvvcZQe+KfJGuqvakK5liFbcQRUMpALskl+q/S9maeQqDjnAzSxVQKpr4nxLK7rTw328Xiro
	T8amZvaJqVAnywoH/CwCZDfaqfhc9xJSM9l5dRmLeMcVw2MxzE0xRtytMq4Hpx/LRHnz9EKZU+R
	DPqFbPTdAiAfakvlD+bIim3j00pDVb/aDSBhTGzokHo+NSmg==
X-Gm-Gg: ATEYQzyRTf0xo4GENtmwAZBRBmxPp3Vc1WiQsh3Ib3GSY1aPN+rrXoWgvhnKk9Dn+gs
	Sz00aDcfJr6XEEOTzWrf+BBvy53VooG43CJDHFbOWi4G2Ekwtvr3TVd2qtrhU1qOcq+6PyX3X/D
	jCNiF4kUBmg06ngtEqVeJ3UD9ZwSyGPn4Ewo5i/p/tfEWP/FbO5BNUzMyVlZOXQY+neOoDmODUZ
	OyZCfc=
X-Received: by 2002:a05:6820:2223:b0:676:6c3c:a1f7 with SMTP id 006d021491bc7-679c4506021mr6893639eaf.63.1771995819271;
        Tue, 24 Feb 2026 21:03:39 -0800 (PST)
X-Received: by 2002:a05:6820:2223:b0:676:6c3c:a1f7 with SMTP id
 006d021491bc7-679c4506021mr6893629eaf.63.1771995818819; Tue, 24 Feb 2026
 21:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy>
In-Reply-To: <20260224-likewise-rimless-151f6a12b092@wendy>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 10:33:27 +0530
X-Gm-Features: AaiRm52Z1zngkBsn48VMPVprB6sCs-JRKAJ1ZguiVd6ty7ux0rSqFFA9PfXPnvk
Message-ID: <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA0NiBTYWx0ZWRfXynLy+uJVEenN
 Wu0PUSvF9Ff0a1TalCIsxDvvONvCUTRQ042XmzxSJLrsyGLLNmzazJ2dl155E9AzBec7ommJNWM
 ihsa7NF2eslFhBuqQOx5QK7JGzlBsyJrRifv1Qsy6mFzBgkv672gGI864cYR/2FgqplQ02ONzZe
 /SCs4z1tsPETVrnvaLf6m/cMEuhdZWHA3TWFuOJ7uTDymPMuMfCWVC52KIGsy9Pz6U2F3hFZJXd
 WgYZrkmUP7h2JJhUjKvNt/6KFBKbjl5AOxtyYM/DQmHqy70/yc/Ru0fVApJ4+kL6IUZGyNv2ZJK
 KBQQ+fy5/w6IA+mAqoEelyznoNzlhbPU37rf6oiXlEPCR41YujTOW82PAliPi+88Hptbg7w2Qvu
 wrfqMBdKikwoyCvSgP8zNuY6IlgPJkUxfQX3jIBfpx1rwwQHfc8exlCs9Xi/RQmb0b90iXwCx58
 A+VCOHa07/qr+6Ztn2g==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699e82ac cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=XYAwZIGsAAAA:8 a=9hAbLlrP2ua6GwJJK6QA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: eO_tAdx85nZNhf3XFG6gmA4LxLITCZLJ
X-Proofpoint-ORIG-GUID: eO_tAdx85nZNhf3XFG6gmA4LxLITCZLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_210343_372787_39CD2532 
X-CRM114-Status: GOOD (  29.57  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMTozM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgMDk6
MzA6MjRBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IE9u
IE1vbiwgRmViIDIzLCAyMDI2IGF0IDM6NTXigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBGZWIgMjMsIDIwMjYg
YXQgMTA6MTk6MTdBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiA+ID4gPiArc3Rh
dGljIHZvaWQgaW5pdF9zYmlfZGJ0cih2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICAgdW5z
aWduZWQgbG9uZyB0ZGF0YTE7Cj4gPiA+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiA+
ID4gKwo+ID4gPiA+ICsgICAgIGlmIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfREJUUikg
PD0gMCkgewo+ID4gPiA+ICsgICAgICAgICAgICAgcHJfd2FybigiJXM6IFNCSV9FWFRfREJUUiBp
cyBub3Qgc3VwcG9ydGVkXG4iLCBfX2Z1bmNfXyk7Cj4gPiA+Cj4gPiA+IFRoaXMgaXMgZ29pbmcg
dG8gcnVuIGFuIGFsbCBzeXN0ZW1zLCByaWdodD8gQSBwcl93YXJuKCkgc2VlbXMKPiA+ID4gaW5h
cHByb3ByaWF0ZSwgZ2l2ZW4gdGhhdCBub3Qgc3VwcG9ydGluZyB0aGlzIGV4dGVuc2lvbiBpc24n
dCBhIHByb2JsZW0uCj4gPiA+IElmIHlvdSB3YW50IHRvIHByb2R1Y2Ugd2FybmluZ3MsIG9ubHkg
ZG8gaXQgZm9yIDwgMCByZXR1cm4gdmFsdWVzIGFuZAo+ID4gPiBtYXliZSBwcmludCB0aGUgYWN0
dWFsIGVycm9yIGNvZGUgdG9vPwo+ID4KPiA+IEl0J3MgY29ycmVjdCB0aGF0IHRoZSBhYnNlbmNl
IG9mIHRoZSBleHRlbnNpb24gaXMgbm90IGEgcHJvYmxlbSBidXQgYW4KPiA+IGluZm9ybWF0aW9u
YWwgbWVzc2FnZSBjYW4gYmUgaGVscGZ1bC4KPiA+IFNvLCBJIGNhbiB1c2UgcHJfaW5mbyBvciBw
cl9pbmZvX29uY2UgZm9yIHRoaXMgd2l0aCBwcm9wZXIgZXJyb3IgY29kZS4gT2s/Cj4KPiBJTU8s
IHlvdSBzaG91bGRuJ3QgYmUgcHJpbnRpbmcgdW5sZXNzIHRoZXJlJ3MgYW4gYWN0dWFsIGVycm9y
LiBJZiBldmVyeQo+IGV4dGVuc2lvbiB3ZSBoYWQgc3VwcG9ydCBmb3IgaW4gdGhlIGtlcm5lbCBw
cmludGVkIGEgbWVzc2FnZSB3aGVuIGl0IHdhcwo+IGFic2VudCwgb3VyIGxvZ3Mgd291bGQgYmUg
c2F0dXJhdGVkLgoKQWNjZXB0ZWQuCgo+Cj4gPgo+ID4gUmVnYXJkcwo+ID4gSGltYW5zaHUKPgo+
IERpZCB5b3UgbWlzcyB0aGUgY29tbWVudCBhdCB0aGUgZW5kIGFib3V0IHRoZSByZW1haW5pbmcg
VE9ET3M/CgpOby4gQXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlciwgdGhlIHB0cmFj
ZSBzdXBwb3J0IGlzIG5vdAppbXBsZW1lbnRlZCBoZXJlLiBJIGFtIGFjdGl2ZWx5IHdvcmtpbmcg
b24gaXQgYW5kIHRoZXNlIGFyZQppbXBsZW1lbnRlZCBpbiBwdHJhY2Ugd29yay4KVGhlIHRlc3Qg
aXMgZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGlyZWN0bHkuIFRoZSBzZWNvbmQgcGF0Y2gg
aW4KdGhpcyBwYXRjaCBzZXQgaGFzIHRoZSB0ZXN0IGFwcGxpY2F0aW9uLgoKUmVnYXJkcwpIaW1h
bnNodQoKPgo+IENoZWVycywKPiBDb25vci4KPgo+ID4KPiA+ID4KPiA+ID4gPiArICAgICAgICAg
ICAgIGRidHJfdG90YWxfbnVtID0gMDsKPiA+ID4gPiArICAgICAgICAgICAgIGdvdG8gZG9uZTsK
PiA+ID4gPiArICAgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJldCA9IHNiaV9lY2FsbChT
QklfRVhUX0RCVFIsIFNCSV9FWFRfREJUUl9OVU1fVFJJR0dFUlMsCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIDAsIDAsIDAsIDAsIDAsIDApOwo+ID4gPiA+ICsgICAgIGlmIChyZXQuZXJy
b3IpIHsKPiA+ID4gPiArICAgICAgICAgICAgIHByX3dhcm4oIiVzOiBGYWlsZWQgdG8gZGV0ZWN0
IHRyaWdnZXJzXG4iLCBfX2Z1bmNfXyk7Cj4gPiA+ID4gKyAgICAgICAgICAgICBkYnRyX3RvdGFs
X251bSA9IDA7Cj4gPiA+ID4gKyAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gPiA+ID4gKyAgICAg
fQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICB0ZGF0YTEgPSAwOwo+ID4gPiA+ICsgICAgIHRkYXRh
MSA9IFJWX0RCVFJfU0VUX1REQVRBMV9UWVBFKHRkYXRhMSwgUlZfREJUUl9UUklHX01DT05UUk9M
Nik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX0RCVFIs
IFNCSV9FWFRfREJUUl9OVU1fVFJJR0dFUlMsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHRkYXRhMSwgMCwgMCwgMCwgMCwgMCk7Cj4gPiA+ID4gKyAgICAgaWYgKHJldC5lcnJvcikgewo+
ID4gPiA+ICsgICAgICAgICAgICAgcHJfd2FybigiJXM6IGZhaWxlZCB0byBkZXRlY3QgbWNvbnRy
b2w2IHRyaWdnZXJzXG4iLCBfX2Z1bmNfXyk7Cj4gPiA+ID4gKyAgICAgfSBlbHNlIGlmICghcmV0
LnZhbHVlKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCIlczogdHlwZSA2IHRyaWdn
ZXJzIG5vdCBhdmFpbGFibGVcbiIsIF9fZnVuY19fKTsKPiA+ID4gPiArICAgICB9IGVsc2Ugewo+
ID4gPiA+ICsgICAgICAgICAgICAgZGJ0cl90b3RhbF9udW0gPSByZXQudmFsdWU7Cj4gPiA+ID4g
KyAgICAgICAgICAgICBkYnRyX3R5cGUgPSBSVl9EQlRSX1RSSUdfTUNPTlRST0w2Owo+ID4gPiA+
ICsgICAgICAgICAgICAgcHJfd2FybigiJXM6IG1jb250cm9sNiB0cmlnZ2VyIGF2YWlsYWJsZS5c
biIsIF9fZnVuY19fKTsKPiA+ID4gPiArICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiA+ID4gPiAr
ICAgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIC8qIGZhbGxiYWNrIHRvIHR5cGUgMiB0cmln
Z2VycyBpZiB0eXBlIDYgaXMgbm90IGF2YWlsYWJsZSAqLwo+ID4gPiA+ICsKPiA+ID4gPiArICAg
ICB0ZGF0YTEgPSAwOwo+ID4gPiA+ICsgICAgIHRkYXRhMSA9IFJWX0RCVFJfU0VUX1REQVRBMV9U
WVBFKHRkYXRhMSwgUlZfREJUUl9UUklHX01DT05UUk9MKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRSX05VTV9UUklHR0VS
UywKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgdGRhdGExLCAwLCAwLCAwLCAwLCAwKTsK
PiA+ID4gPiArICAgICBpZiAocmV0LmVycm9yKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICBwcl93
YXJuKCIlczogZmFpbGVkIHRvIGRldGVjdCBtY29udHJvbCB0cmlnZ2Vyc1xuIiwgX19mdW5jX18p
Owo+ID4gPiA+ICsgICAgIH0gZWxzZSBpZiAoIXJldC52YWx1ZSkgewo+ID4gPiA+ICsgICAgICAg
ICAgICAgcHJfd2FybigiJXM6IHR5cGUgMiB0cmlnZ2VycyBub3QgYXZhaWxhYmxlXG4iLCBfX2Z1
bmNfXyk7Cj4gPiA+ID4gKyAgICAgfSBlbHNlIHsKPiA+ID4gPiArICAgICAgICAgICAgIGRidHJf
dG90YWxfbnVtID0gcmV0LnZhbHVlOwo+ID4gPiA+ICsgICAgICAgICAgICAgZGJ0cl90eXBlID0g
UlZfREJUUl9UUklHX01DT05UUk9MOwo+ID4gPiA+ICsgICAgICAgICAgICAgZ290byBkb25lOwo+
ID4gPiA+ICsgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gK2RvbmU6Cj4gPiA+ID4gKyAgICAgZGJ0
cl9pbml0ID0gMTsKPiA+ID4gPiArfQo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiArdm9pZCBod19i
cmVha3BvaW50X3BtdV9yZWFkKHN0cnVjdCBwZXJmX2V2ZW50ICpicCkKPiA+ID4gPiArewo+ID4g
PiA+ICsgICAgIC8qIFRPRE8gKi8KPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArdm9pZCBj
bGVhcl9wdHJhY2VfaHdfYnJlYWtwb2ludChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPiA+ID4g
PiArewo+ID4gPiA+ICsgICAgIC8qIFRPRE8gKi8KPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4g
PiArdm9pZCBmbHVzaF9wdHJhY2VfaHdfYnJlYWtwb2ludChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRz
aykKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgIC8qIFRPRE8gKi8KPiA+ID4gPiArfQo+ID4gPgo+
ID4gPiBUaGlzIGlzbid0IGFuIFJGQywgd2h5IGRvZXMgaXQgaGF2ZSBUT0RPcz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
