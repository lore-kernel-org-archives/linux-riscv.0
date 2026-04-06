Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34566E9D831
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKpJ6Kci2pnKnYwNeulTs+Tdk1YxBECn0WVUYxeQdIQ=; b=u2dfJJXnxDocg7
	DOQ7h7PiANEO/6RueyX4wen69T8DKHV585MJwisc6WJA0lvSySdopZ3dy2c9V3ysCyUXZqxbQmj1i
	mqRU4CXpS1HJKquoZkN0Uj+XDGJXyagcj+li9R0J1WgFt87inZdmN61qBtnZvnuYfhlqSN6DL/dcj
	effcs6HcTSklzC5Oc/jOUz9Mym7y2sP0HIMQ71TRC/iddqhqEikt8XJYRe3SRgfpxTDuklD5lQ2uA
	nIU0vBlCNW5wlYFonYgYrFb0IqwDf9fMOg3HhzWUN8dikdI0OYlKO7xXbqjzAMl5ICDuKBJg3dhES
	4jOOyADmJ00cKSYgoi7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bvl-00000004mW1-3ZIJ;
	Mon, 06 Apr 2026 04:51:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bvj-00000004mVd-1WZT
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 04:51:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Kq2lL3594801
	for <linux-riscv@lists.infradead.org>; Mon, 6 Apr 2026 04:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Efn/MTaK7C9KxDlLmzLB5+sqj0GiM2v4iQu5E53DpY=; b=S9xATjICreUu8lTz
	pCQ3MC+kllaMadusWZgM2KZRMmysUYpwCAem6eyVQtHt9gtjlW4f3W94v6bEqP53
	4QtEgdhVbdBTm1vXMCo1xscglTujzyDiiF9WANspEo8NrYKcJ0+2CG+kU5JbWHnL
	7dXZ+yVLiQ4EWIlSo6o6ZNfJNHoLbIfisYj4lCMGcfz0O9q6oNVQZZCeuKAvWRzE
	amnueWPo8/svuCgpsJGSP9B62SnMef9yJfu8wEpS5N3oFKj8jtrd5Vu4AnXORrKj
	S0u2ifsUZiBrckguS0dJoltxSeIFfH4O7s/1cxZE6OBusSfD3+cDZ4ir4z4l2LB8
	X1yYOA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1bsqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 04:51:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dbd8aaba98so547980a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 21:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775451078; cv=none;
        d=google.com; s=arc-20240605;
        b=RfK5zdsRgy+3sl7SU7jjAzWZsZA/xAvuU1sxzpCa7kdGKlw7Ly4Q7wxIqnLg2xCVGi
         QpDKMToitsZOY9BGRQxeDJTtoN22H5Xfj8nLOp2byr+sI5JbdzboHAiexxNSuYGlyIat
         FZ63M7PWIXYmqX7dn2oh2KHPnGu4RavZVsafXDoe2Yhls1Y8UFd6vdYihP7jCqkEiBZ6
         YQ4Tcg+FJwK8UpXltLjt0nwJFKAVxUgmN4jEtz9tpC+Ot5zo5d9pTj0xcz0CqwiKAwBR
         eK3klRTu/rVJMjpX4ywjnI5HHiDdRmARWyEhqEOTq3P9VX+oB41Y0HzkfK/13T8juflU
         EGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Efn/MTaK7C9KxDlLmzLB5+sqj0GiM2v4iQu5E53DpY=;
        fh=/J7HXTLg2u8MEblAh4+uSZIqbb1FY0q+eH7PIXzOS/U=;
        b=d4kQ/10cO6bkjqNreG2/UNtSa1L+/P6vMSpcYawZKo4dFO80Jeb/U9agcY5Woe2KAm
         WOpb2mRFhKXJDgLAnqEO1i+SeqB/rUyLMUsTWvKJzyP45e9LZS4K5U/Bdia/Eqy3vnkH
         nwiKOzOjFHTY6DlkCzyzjx+45Rp+dfLd6qOUIbB4e9y+ZBQkW9um2cIZNgn7xOQXKp1j
         RBelYY+id60/QpgStIzMl9qJcfK3c2J6mY3FddRpwnCwnTZsI6sp0CW+t5dzaJH+qucN
         O58+R3Yhb1BGng3dJun6wcfnz6QaG2JuW0ei76uETtZ659XnwDbwZJyN4P1aPHTJUCvi
         JT/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775451078; x=1776055878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Efn/MTaK7C9KxDlLmzLB5+sqj0GiM2v4iQu5E53DpY=;
        b=gKBn1goZWu+oV2OK0ZD2LOkgeWUCcvCjmlCpklv+X72Z0bEWgCh946ila/8DsELk4h
         Ca6zdx5ML08t3CHSSUQ9Ff10qKq5HaqsBNTpaPaOBS+rB3e4nzueWku/jkkjFXS64wnL
         joXvY6znR9iHBGmN6mdfw24qCYuUt8uQLgLdx/G9VlDR/Uo4BMsICMHMNKYB6hA8Zulz
         lUFBdroloNlqwQt/4/dQtIeCbLpggGsQHQcD1qe8crBJX7hHtmG/lXjaqn8w+XKuX2M+
         c+ER30N+Kzlrf6cJaLPiON1wfhHFCfRelurR34cGRVIYicxwTtDOTBpljXiXvW82I1iw
         7ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775451078; x=1776055878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Efn/MTaK7C9KxDlLmzLB5+sqj0GiM2v4iQu5E53DpY=;
        b=J34t47xg2vHbOWAhv68pcpMFyUFpPfdnHfAD3azgFhKzc1OF2JoJMEcLL4Qk9DLTFr
         PKudkZJ7j1wcNorCMUKuw4bY8kDbycOA6fBHCO6frTjMqv8zi7sWGn+fuYZGWs66ULnY
         deZZ7xNhZ/sfh2Wp8P89HovYvQ8OU3LLh6vtCYEsZGFufIPrXVYtDN3CVIjo5zlVIrBc
         DNx3IvqwMwkLmg4teEYsvNWOBVk4KmEQX3YHy+XVgjNH1/gAjqA8GiSkHNWZnF2Limpk
         zne2lhAd0eWnGxzzd6cPbMMkkgquvK3vx0fb+CAp9Xu7DQrLW8wahxm7KxovxFxiDodl
         Csug==
X-Gm-Message-State: AOJu0YyswigiJfrZjFRLdMf1+l87mbKUfW4PN6XNBLDckGaXx/k6H//W
	b/TyYJiCYAxposTXH6X+yK+ngMN2pV2dfxllAsnxuumA0bmK+kASSKRM9g776ccx43QQzJ5L9di
	n3nL3+WcdfdQKSjZ6gw0p9Pc4zQ89Qgejba3aUkxVzwgHhB48JXCg5uxjEAWlBAY+IOifykAzLH
	Yttdg1hhX7bxGuuM7Vs7vK61eUQFgWoA6tOSchNnYwFdBI3A==
X-Gm-Gg: AeBDievpUlwdEj9L0sR76c6jLQkQ9Eo9/oyIKv7YJ2ZoN192UFw5+xydbjV6wL1C7G8
	suaivcOx8G5ESKuTbitAH7SOsDKu5zmuiEqgghd41T4ZrW28bP5FKEy7l0ZsMn7nIBlA1Z6uCF4
	lzKb/osFzzUqV9pneYEDo0P/8oXXVrOcPVmVSqE8wrrhZ5vUuQi6T283/vBm8befvzJk9pYaYQ2
	Q6J2E8=
X-Received: by 2002:a05:6830:83a7:b0:7d9:9310:5e87 with SMTP id 46e09a7af769-7dbb72b98e4mr6267992a34.23.1775451077972;
        Sun, 05 Apr 2026 21:51:17 -0700 (PDT)
X-Received: by 2002:a05:6830:83a7:b0:7d9:9310:5e87 with SMTP id
 46e09a7af769-7dbb72b98e4mr6267980a34.23.1775451077593; Sun, 05 Apr 2026
 21:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com> <20260318120019.z656r53gkv6kulq6@imamay-pc>
In-Reply-To: <20260318120019.z656r53gkv6kulq6@imamay-pc>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 10:21:06 +0530
X-Gm-Features: AQROBzDDLr3G6z4c6xzNCB4ewUwaURCsTl13tXUwFhLRVenEKuwozDPzVqoSEcw
Message-ID: <CA+Ht8=ZDH+o9ocgDpX+JQ0TQONYn_eVRiEGedeauUoa4tsK6nw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Ilya Mamay <mmamayka01@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-GUID: XsJN3N1S7KV2JFnjOCcvBZkfB0Ffnsru
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d33bc6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=47coc4W8yktAOmDRRBQA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: XsJN3N1S7KV2JFnjOCcvBZkfB0Ffnsru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MyBTYWx0ZWRfXwG0LJnj6njmt
 3xbCVEd3B+Lpjt+I44C+n/WyB1Yjge/plLpFKfvh9jmbXOeOC2D9yTu/+52HJiOgEwmEEl7vO/L
 ufEYNyVO+eeqh3DTnqyXv93murCsLYoV/6BBvTiDKj6PW3MkDTZuiHfhaAipNOSn2Wdikk0GPap
 P70xBrNq1WjKbDsC+y02bQ6zsly2aFggPO1h25B9KXheFb53L3Z8CYtag6DScdvYh+XTjGJUrOJ
 LCJjs3KtQ/o0Pt1/n1QGDfKQl6Lj8tqiMZBvXwKeWZ8c1n8VM78Ka7C68gYVpiuVPs+WRCOv2j9
 bAa5zHawgPZ4vxsIDPxtiBFvN+cfMn0lKogp19ykWFAuGCSZyoR8N0AzI0bBWqWNlrTDpk7OAh4
 ipNU+bTZev4aNqok2DtoaAnLh6JDf23rXGcBJJCXRWeBXw4Awe/drdzSfM343fulajuTO7jq/DD
 3gHT5OaGVB45bIhu/mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_215119_405744_5A1F3129 
X-CRM114-Status: GOOD (  16.73  )
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

SGksCgpPbiBXZWQsIE1hciAxOCwgMjAyNiBhdCA1OjMw4oCvUE0gSWx5YSBNYW1heSA8bW1hbWF5
a2EwMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBUaGFuayB5b3UgZm9yIHRoaXMgcGF0
Y2ggLSBpdDtzIGEgdmFsdWFibGUgYWRkaXRpb24gdG8gdGhlIFJJU0MtViBIQlAgc3VwcG9ydC4K
PiBJIGhhdmUgb25lIHF1ZXN0aW9uIHJlZ2FyZGluZyB0aGUgbG9ja2luZzoKPgo+IE9uIE1vbiwg
RmViIDIzLCAyMDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6
Cj4gPiAraW50IGFyY2hfaW5zdGFsbF9od19icmVha3BvaW50KHN0cnVjdCBwZXJmX2V2ZW50ICpl
dmVudCkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgYXJjaF9od19icmVha3BvaW50ICpicCA9IGNv
dW50ZXJfYXJjaF9icChldmVudCk7Cj4gPiArICAgICB1bmlvbiBzYmlfZGJ0cl9zaG1lbV9lbnRy
eSAqc2htZW0gPSB0aGlzX2NwdV9wdHIoc2JpX2RidHJfc2htZW0pOwo+ID4gKyAgICAgc3RydWN0
IHNiaV9kYnRyX2RhdGFfbXNnICp4bWl0Owo+ID4gKyAgICAgc3RydWN0IHNiaV9kYnRyX2lkX21z
ZyAqcmVjdjsKPiA+ICsgICAgIHN0cnVjdCBwZXJmX2V2ZW50ICoqc2xvdDsKPiA+ICsgICAgIHVu
c2lnbmVkIGxvbmcgaWR4Owo+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArICAgICBp
bnQgZXJyID0gMDsKPiA+ICsKPiA+ICsgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSh0aGlzX2Nw
dV9wdHIoJmVjYWxsX2xvY2spLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICp0aGlz
X2NwdV9wdHIoJmVjYWxsX2xvY2tfZmxhZ3MpKTsKPgo+IENvdWxkIHlvdSBjbGFyaWZ5IHRoZSBw
dXJwb3NlIG9mIHRoZSBlY2FsbF9sb2NrIGluIGFyY2hfaW5zdGFsbF9od19icmVha3BvaW50IGFu
ZAo+IGFyY2hfdXBkYXRlX2h3X2JyZWFrcG9pbnQ/IFdoeSBpcyBpdCB1c2VkIG9ubHkgaW4gdHdv
IGZ1bmN0aW9ucyBtZW50aW9uZWQgYWJvdmUsCj4gYnV0IG5vdCBpbiBvdGhlciBQTVUgY2FsbGJh
Y2tzIGxpa2UgYXJjaF91bmluc3RhbGxfaHdfYnJlYWtwb2ludD8KPgpJIHByb2JhYmx5IG1pc3Nl
ZCBpdCBpbiBhcmNoX3VuaW5zdGFsbF9od19icmVha3BvaW50LiBJIHdpbGwgdGFrZSBjYXJlIG9m
IGl0LgoKVGhhbmtzICYgUmVnYXJkcwpIaW1hbnNodQoKPiBSZWdhcmRzCj4gSWx5YQo+Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
