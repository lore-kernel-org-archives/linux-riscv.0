Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E42F55433
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 23:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6TQHVN6jbO7g807Rnj5F4KrvSqZfbrNZIIC7d1kluw=; b=j41gwUB2YW9bxL
	P8Ql0gSpb6jmp/5N9c8PGhbxwICcTGk0si88ySicxC52zhrdC7PvIyq5KRIsNouY/CDAk3wMAJmBn
	kv8fhmCzZ3FVOW67R2I+pPEsbde8fHw6qyMgcauqU3inHLvoN6nA7Lgr009bOh7E6a+LhyZxZZBwt
	T+XfPAqU/pvyckOP66/t23Ek8OGdh+ZwE32TzlyLIf72hW0GGqQpUn4iHhyJUQjJmPs1X1xUccIb7
	2OjJQs3d4jyUixaBmBg66qAgLWkUX+FVcWF0T57tn4OebT0ZyaNi1rVZYDglnVuP+P6JpnCZ5vBuP
	zTLXTM2mL8sc9ECEy3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1tY-00000002wMt-1dTP;
	Tue, 24 Feb 2026 23:32:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1tV-00000002wLW-31P2
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 23:32:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIG0FG3333204
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=; b=pTG4xCT49FAr7UOg
	pF2qErdScpUIC2b3l4TbAwGkzKRagwPm7TjTGPhJNRRLPbUUadELpRoj8ufMwEjp
	vbip9XsUl3zqNBP5zNgCCU6xTUjcpbm0Htb621/drE1FBTqC2QVl40Z7oA0eD1w0
	JLsswRD7uEwYRPieivH93nVuuUxT745KxtonfBrMz5AojuORjKnCQ0rA8ZwiXWeS
	qXVhYHylUGWljuGgjYqfAzg5VLjwQCBe68DknbMwi88m950ydHVeA6y0isZNxl9i
	lWrdCI+dbqN1GAd/nmTJh1UqJVENjAVTFSitoju3OBABTxSALIWkWVmCKYNVcMf+
	wlGDDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh470xfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:32:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c2ae713so813251c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 15:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771975964; x=1772580764; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=;
        b=ccGwfmlngwndwn8OH1te0wHD6XDWqCW/8T3puUX8/oCGzCBPmZJTy2p0uIeroD4lLR
         Tj8to4qnNF1FocXRD8+ey+sZ31lzXSvthS/uEjZyI4uX2zP86p22KzrZV1gcy1g5Kn7r
         Do6VQOx4FZqXIWiXWXTKNW5rm4oACRNJzaX/MSXdp8zO7dbGP4ASyoFAdMsNsRdmJ6Qz
         aw1tQSEIvfD8IoQe5n3ujTDDCfXxsZoYNfWkxvHed8ALM4ltugPP1AC8CitUPGK6dyin
         Q2f3PShOYbvhJiUR7HHoOtRmxnfMltapKxPhCN3gaGdviBp1BwOVvjGBSlJkavioYx7K
         HKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771975964; x=1772580764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=;
        b=c1ZMgvFkMUWSWKWsov6UJ4BVzXj2hzNdNmgqmj3KK7JSJMO/6U0nJk2iUzIaVCvyiw
         n+iz+UHXx8z2YfzGhSi+F2k7RnlVo2/vBFNEfjNgt46aq9CDTlgrE6XHivgAdkSQlGd0
         9ZYnnkDPTtWawsfhpE0seSJKquYVdmNKoWslkpOfUjyZB8F7+zv63HuxunfvHlMjuDsk
         Pte+kZs+2vLG/oReV1ucMYJ6GtMQ5M4/PiCdFYzjwrlNwcn/m+ey7gPkIfgMb33nwZzL
         WfUJqZPpBopse0eLYuBfbEAzk7RWKpNrH5w0jEZSHSXTAm9dOozWXdYavHxHB0c5T2f8
         BKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6XZcQKvniY/hqlOBKdUyXMyeO+nPCD6LBoIKKmm4EbapJG5/Befr6tyNMt5ipE354l62JsXg8i1aSMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPLtLecodG1E256U9wbqyuQYlI38UqjN3nKbkGSxJo2o9ZT1y
	sdCnWArN1btzPwpjFEDU1t5MZ1+PEWv9idBlIJSl+otwBL352zKSxYW9KFtteFBHWsNCjVptdjH
	+skPReK1QYf0oTh685sSgfbMaQX0z95EQnICJHmrCh+X28FPkOHS+3jrM9Cu46eDfOIHLlbE=
X-Gm-Gg: ATEYQzyQKPDAm82tjbybiONSGvtisugS3KuLCED8VvekVLdtB/VmcDX8wHvJ1o7JNvL
	chG28i5lqRJLN9uEk5nza18X4IUlm1L97Awt+Y0tyqReroQirgxija5XiAa7J5peBaMz2qIUm3X
	0m2tlBOCW/j9Adn8moqawt2ZwSWYiP1dd66fpJXdQF3AN7Dqne8SzHYPr3+aPJRRljM5WeqDiiZ
	9Tl07Js5xr1l6jl16trn572RAGeJ4uLx/6xkgeXTCQWy8XOCQVRKjEbV/6at5sa2KIrNzd02BZM
	UCeBIlpwGaPhs6oUS8JEFdkIrSX+GZvVjugkYPnLHXPOMpgn39/3I8xTslTNBKOhnUhWa8GH9HI
	d81U9DALRgTSp2wORvubeh4nwfzG0i1I=
X-Received: by 2002:a05:7022:f96:b0:11b:7970:ea3f with SMTP id a92af1059eb24-1276ad11866mr6760056c88.25.1771975964489;
        Tue, 24 Feb 2026 15:32:44 -0800 (PST)
X-Received: by 2002:a05:7022:f96:b0:11b:7970:ea3f with SMTP id a92af1059eb24-1276ad11866mr6760037c88.25.1771975963864;
        Tue, 24 Feb 2026 15:32:43 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm11749921c88.10.2026.02.24.15.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:32:41 -0800 (PST)
Date: Tue, 24 Feb 2026 17:32:40 -0600
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
Subject: Re: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
Message-ID: <rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
 <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: LnvUcj8VlLFDRs4aK8Stg22zQiAXy8x5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwOCBTYWx0ZWRfX8swQozt9Sjfl
 RAar8b63Y9u3c2I2DzX6vX7fo46Z+c9irnnZQj29AyC8mRHlwZInYwoyccXIX/9+cBtQM1gLOYY
 daQ7GSSjqnlcjDh6nfAVH4GtQmzNUO7TqRlMbJoQTVQ/pE1jESGNVGflcExadj+AfuN7CAmFHrM
 JmGDuRVZtoLtjNSLSVQr03IOTrKRtFB2SHwjo+afKKsXaUWMovx/c7ognpc6nxVIosGYhhRIi8u
 hl0t7QgaVRcRQ3XmhPZ0pG3LwUwpXlnsUMLzlYmv5JSV3nDVDP/m6V8oM2eyMMfBrySzD7uRW+/
 5kpFZ4Q3DK3MPnQHQMcZaS1vZPSZVxj1EmbOs7AK/d+bJHsuvVs/6Y4Q0SzSp2iF1ljQD+PmlAo
 OP0irOw10pACvTmjcwSuQwz0PvfmRAzfuxuXhfibv2rlidP8hHZayEoBJqBP/I6YR9MOw+rSJQ7
 5rBv8f5H+H28m26uz5Q==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699e351d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=q-mjPIJXDBu-ais8TUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: LnvUcj8VlLFDRs4aK8Stg22zQiAXy8x5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_153245_766559_DFDDDDF3 
X-CRM114-Status: GOOD (  29.70  )
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

T24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMDY6NTA6NDNQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBGcmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcgSm9uZXMKPiA8YW5k
cmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IEEgZm9sbG93aW5nIHBh
dGNoIHdpbGwgbmVlZCB0byBhY2Nlc3MgaGF2ZV91c2VyX3BtbGVuXzcgZnJvbQo+ID4gYW5vdGhl
ciBmaWxlLgo+IAo+IFRoZSB2YXJpYWJsZXMgYXJlIG1hZGUgbm9uLXN0YXRpYyBoZXJlIGJ1dCB3
aXRob3V0IGFuIGV4dGVybgo+IGRlY2xhcmF0aW9uIGluIGEgaGVhZGVyLgo+IAo+IEhvdyBhYm91
dCBhZGRpbmcgdGhlIGRlY2xhcmF0aW9ucyB0byBhc20vcHJvY2Vzc29yLmgsIGluc2lkZSB0aGUK
PiBwcm90ZWN0aW9uIG9mIHRoZSBDT05GSUdfUklTQ1ZfSVNBX1NVUE0gYmxvY2s/CgpZZXMsIEkg
Z3Vlc3MgYXNtL3Byb2Nlc3Nvci5oIGlzIGEgcmFuZG9tIGVub3VnaCBjb2xsZWN0aW9uIG9mIHN0
dWZmIHRoYXQKaGF2ZV91c2VyX3BtbGVuXzcgZml0cyBpbiB0aGVyZSBhcyB3ZWxsIGFzIGFueXdo
ZXJlIGVsc2UuIE1heWJlIEknbGwgYWRkCmEgZ2V0dGVyIGZ1bmN0aW9uIGluc3RlYWQsIHRob3Vn
aAoKIGJvb2wgcmlzY3ZfaGF2ZV91c2VyX3BtbGVuKHUzMiBsZW4pCgpUaGFua3MsCmRyZXcKCj4g
Cj4gc3lzX2h3cHJvYmUuYyBhbHJlYWR5IGluY2x1ZGVzIGFzbS9wcm9jZXNzb3IuaCwgc28gbm8g
bmV3IGluY2x1ZGVzCj4gd291bGQgYmUgbmVlZGVkLgo+IAo+IFBTOiBJIHNwb3R0ZWQgb25lIG1v
cmUgb2YgeW91ciBwYXRjaCBbMTAvMTFdIHJlZmVycyB0byBpdCwgd2hpY2ggYWRkcwo+IGFub3Ro
ZXIgYmFyZSBleHRlcm4gaW4gY3B1ZmVhdHVyZS5jLgo+IAo+IEJSLAo+IEd1b2RvbmcKPiAKPiAK
PiAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3Mu
cXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwg
MTIgKysrKysrLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vz
cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCAzMWEzOTI5OTNjYjQu
LjRmYTE0YWZmN2Y4ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBAQCAtMjc0LDggKzI3
NCw4IEBAIGVudW0gewo+ID4gICAgICAgICBQTUxFTl8xNiA9IDE2LAo+ID4gIH07Cj4gPgo+ID4g
LXN0YXRpYyBib29sIGhhdmVfdXNlcl9wbWxlbl83Owo+ID4gLXN0YXRpYyBib29sIGhhdmVfdXNl
cl9wbWxlbl8xNjsKPiA+ICtib29sIHJpc2N2X2hhdmVfdXNlcl9wbWxlbl83Owo+ID4gK2Jvb2wg
cmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzE2Owo+ID4KPiA+ICAvKgo+ID4gICAqIENvbnRyb2wgdGhl
IHJlbGF4ZWQgQUJJIGFsbG93aW5nIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvIHRoZSBrZXJu
ZWwuCj4gPiBAQCAtMzA2LDEwICszMDYsMTAgQEAgbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3RybChz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gICAgICAgICBw
bWxlbiA9IEZJRUxEX0dFVChQUl9QTUxFTl9NQVNLLCBhcmcpOwo+ID4gICAgICAgICBpZiAocG1s
ZW4gPT0gUE1MRU5fMCkgewo+ID4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1M
RU5fMDsKPiA+IC0gICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl83ICYmIGhhdmVfdXNl
cl9wbWxlbl83KSB7Cj4gPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fNyAmJiBy
aXNjdl9oYXZlX3VzZXJfcG1sZW5fNykgewo+ID4gICAgICAgICAgICAgICAgIHBtbGVuID0gUE1M
RU5fNzsKPiA+ICAgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzc7Cj4gPiAt
ICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgaGF2ZV91c2VyX3BtbGVuXzE2
KSB7Cj4gPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgcmlzY3ZfaGF2
ZV91c2VyX3BtbGVuXzE2KSB7Cj4gPiAgICAgICAgICAgICAgICAgcG1sZW4gPSBQTUxFTl8xNjsK
PiA+ICAgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzE2Owo+ID4gICAgICAg
ICB9IGVsc2Ugewo+ID4gQEAgLTQwNyw4ICs0MDcsOCBAQCBzdGF0aWMgaW50IF9faW5pdCB0YWdn
ZWRfYWRkcl9pbml0KHZvaWQpCj4gPiAgICAgICAgICAqIEFzc3VtZSB0aGUgc3VwcG9ydGVkIFBN
TEVOIHZhbHVlcyBhcmUgdGhlIHNhbWUgb24gYWxsIGhhcnRzLgo+ID4gICAgICAgICAgKi8KPiA+
ICAgICAgICAgY3NyX2NsZWFyKENTUl9FTlZDRkcsIEVOVkNGR19QTU0pOwo+ID4gLSAgICAgICBo
YXZlX3VzZXJfcG1sZW5fNyA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fNyk7Cj4g
PiAtICAgICAgIGhhdmVfdXNlcl9wbWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1f
UE1MRU5fMTYpOwo+ID4gKyAgICAgICByaXNjdl9oYXZlX3VzZXJfcG1sZW5fNyA9IHRyeV90b19z
ZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fNyk7Cj4gPiArICAgICAgIHJpc2N2X2hhdmVfdXNlcl9w
bWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fMTYpOwo+ID4KPiA+ICAg
ICAgICAgaWYgKCFyZWdpc3Rlcl9zeXNjdGwoImFiaSIsIHRhZ2dlZF9hZGRyX3N5c2N0bF90YWJs
ZSkpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAtLQo+ID4gMi40My4w
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
