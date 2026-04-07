Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DF6FB5190
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph2ZH77c8YVUtPzu3A1dxlJ95D43LAHLNLt3k6MSrjY=; b=bQQfG30yfrYQVt
	0wlSm6KwK2uh8lEC3fB7DjU/a/rFm84+hIxou83JYUtSCxWukuhzmYEsOzMPzSAf5IzQLb7YGgpr1
	t83PlX3Yzkh+Q/+KdUkBDekkeVjw8GGDvbK7+NkmXU4TaKpPZ1Vkqep6kQrLrJvhCJh88sjpc6ATQ
	9aoxTiJMyHjd7EneiMghiT1drolDJ1db6OQG6vQwVU59VlUOWSEleC/Ysys747VCK47T3b324oE2w
	Gt/UX4q/pppxuIJ+vUaSkP/bPbD6NFcwPdtKH3Kls6mZxWorbOyAE94yrJdGplxJ9pJhu4zFpvGwJ
	b+PsEPD/NJkxMJenlYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yS2-00000005tIa-2rhN;
	Tue, 07 Apr 2026 04:54:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9yRz-00000005tI7-2iJs
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 04:54:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQHkX493201
	for <linux-riscv@lists.infradead.org>; Tue, 7 Apr 2026 04:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhAmw9O/6ASHpdLFuCqecDW2RlT7EoyU4nBUyO3XqI4=; b=JciHyifxYe1xgeWP
	86dK1AMIwNL/XpEFGViGy8wBXms3eP7OY+Ub7JruCtYjsZH80Ajk+vqYz7QZYmtU
	M+a7gAzeAwzhSc5DJuJQXveMmNmdDEm2BLs22V+CrN/iZ0CZXPRquGXrrt65vJ3U
	Q4i+VWGSYPQzVkdfsfwzTS8Ad+/YNWGthJeYr35NT7TSrHEyxLybwcWeunpfzM1w
	2oGt5G9sKOSEnjRLs62TT8fd/sCtPm21bkRfeF9vAjtyxtHkPLmhTWt1+ZPyieJu
	CCM7nkL1LNFUTyZYXbwRxP0njJNF+Dcux2tXEZxRrG+DMn5C2nShL8ld8pjZGh4z
	hORsGg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8s2aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 04:54:06 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-46f85ce99f8so1868164b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775537646; cv=none;
        d=google.com; s=arc-20240605;
        b=G5rra3jgHDMgmLgK0sMSJUQIgUrWsAEzh7PkH0mRVVdWuQa/VW3JSdzZD4LDvGZAo+
         seQapSrm4ZxMXMtRKqY9k/OZpWM0q5rKWuGrSLLwoW7sqcUMpX1YRjO0zsDfmQim9eBN
         13UOT27Upxw5cOhjWZwX4a0QVwhT4UXvkgl50t0ofwnn3q3WWXIO1OE7k7r4abuH5Lky
         g+oj4iq/hFhJpDV5gRfcj5fC+G1xH+ayPdKcf5MhdkS6DzZ6U+NkGYaP2wUawd3F6Mvy
         MEQDyUP/VHXqg49F9owWfzfqAjDjErMxYOK0Ajhmlvh82e/j7kZr7sGFMzM/wDRPl9M0
         aTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhAmw9O/6ASHpdLFuCqecDW2RlT7EoyU4nBUyO3XqI4=;
        fh=83LWpgVrKoQjU+vHIWjcZurU8BUH1YEXkDu6o6Fw1Lc=;
        b=EycVZoR9i5sWwKDJM0pIp7LYILWSoWbN4ad9uUTwNBx9MKQcc3yrEL+Lt1VMJloQtq
         oyQ0NV7toUl4+4MS7JM7w+urRcStsF0egU4P2mwN+REKAx9C3JWJ8TW4y6LDhd+JYntk
         5hvcwA4TMIC2+W0wZnQaDMVQTYKVntgzRs47HpJQqDTxJB+7xIGtxJJSX+1Y7l+ebPEC
         9LZF7e8taA8s5Z6HsbV++pWwZq8mB2jIB45e9O++lKxWFLHUY9phFn2kQdTyr5Dqka3M
         jaoFoFixTRSaGQi8RVwdRSVIZpAOWauLEW+wQy++tgfjgX072Y1l8MwDyYqcQ2IEFjm9
         w1gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775537646; x=1776142446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhAmw9O/6ASHpdLFuCqecDW2RlT7EoyU4nBUyO3XqI4=;
        b=iZ4XDU/6mV67gXEalafLf3A50bHT1XrhGzikpJVP1fjhk7sJn6rGNUHROX3DVJ0KuS
         zw90bognsCwT+mr2IgZ0HSf6W8OmTCujQMv8HPeRFP+w+JGBHNiSai6BbREWDfs9yiVl
         O90KeSBE+HRkSk2LsirQJ3rqakf4oeaMGnOcB+vV5/7US+Uew3MauVvS8Iq7FCSAENzL
         vF5XGRWoFAOhdGmt9t7pJ/jDxSRCUDQGWzLqsuI4ms4EZ6/oGtfRHExI+90DXEeEvrwf
         EJxoI2OTPHaksNNeakp5YWJBDU7Zp+6GLNEALtEEMM4s4BFmXdE191DSORU1P2EHyY7v
         0A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537646; x=1776142446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhAmw9O/6ASHpdLFuCqecDW2RlT7EoyU4nBUyO3XqI4=;
        b=THWSyaeXz6cNvbpQN2DdlKfP7MyN1OJZ2mhBRAzqLT1g+UOD5AEa8ktsWwP+AlcsDS
         ksjvtGFt9sEeqPb00K78aK4d1i2DylB9JyF/DjKVm5WzY26jg+dN1gV4enVAd20GQAvk
         DzlyWcIhWTBN2DhR787DQNen4pVzAoL0ZdHn2/j3t3XgpL2dNIvK2SEz4E4m1ZAECzXZ
         +mVQjxA+0ZqjxOm6pmSIHZwXjUnePKYlSjABHy9Fw3gunQlkhW0OQu0Qh+BUoH3M0ntw
         +IZygopYHBavsVmkx3+W5mk1AEYuH1cxXUPfxBiALF6wvM2kcUrtGn8jr67WVRcX69Rs
         q84Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtK6MwIexW3xauxJQ+r3Mqb6jP3OVagVIIK1h4wCIExweRtgBXce7G0tQTgF4PeXRyocq+hIeklf99BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxREk+AM77WbVkNhwpmhJVnd1WpixQ8Omvmf1FP3i/OTPcWZGB2
	1ppLGQVaqYNBtE0j2uoFAYOZBQcIu8lBkB+fRO10WVWK0fmM2IwPD3IElC7AWFjkh62lKBO0QFi
	3XvY+oQCK1Po08L1XCpX8gO/AyXVtHqCFbAsM652Wat9onaIagyuixQhdL3unOmTmruXNFSV7zH
	UDs4vwq3Y08U0nC7HdeZsaVhv/7vgr7fKJJdFxB9WvBrI38g==
X-Gm-Gg: AeBDietJk4UGckYTIS/DiyzP+oeO6HSQ3HdZrU9x0u2DQB4vRLUm+SmBD4eKcRTiI/q
	syWlEBG1SA4o88R1I/psjHxh+FkD85cxomLFjT/2SduwdBRoI/QEIkmFiB6UiYaUPf5MEzCDrv3
	7pzyegrbz2rXSLXdkPIZ3m6MJ555w5bZCZJb0pSAsCvRknxF0kpIkaW6FISxFvIo2Ffzq0tB68h
	dQKDqBz
X-Received: by 2002:a05:6820:f02a:b0:683:1323:e16c with SMTP id 006d021491bc7-68313332656mr6302137eaf.23.1775537645647;
        Mon, 06 Apr 2026 21:54:05 -0700 (PDT)
X-Received: by 2002:a05:6820:f02a:b0:683:1323:e16c with SMTP id
 006d021491bc7-68313332656mr6302125eaf.23.1775537645184; Mon, 06 Apr 2026
 21:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
 <CA+Ht8=bLxTz8_Cm2s=01CBNpmx4g6XhT6ZzTfJH9rPgDXPOUjQ@mail.gmail.com> <406D63D11CE43166+c3d29042-4097-4309-9117-3cdbce71ddb7@linux.spacemit.com>
In-Reply-To: <406D63D11CE43166+c3d29042-4097-4309-9117-3cdbce71ddb7@linux.spacemit.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:23:54 +0530
X-Gm-Features: AQROBzALKPePJbh2DoxzvAP3H0wlpRSp6E1dEvnwwwr7MeuKxIjcOWd_lagT-Q0
Message-ID: <CA+Ht8=bwQDR1rVp9AJxBnH8Qk_j_Ow9A2fAeYcvSh6pCkeA6ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: liangzhen <liangzhen@linux.spacemit.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
        shuah@kernel.org
X-Proofpoint-GUID: UrOosZHLJoY7HStXw0id4DCKcwbWwhUm
X-Proofpoint-ORIG-GUID: UrOosZHLJoY7HStXw0id4DCKcwbWwhUm
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d48dee cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=lv0vYI88AAAA:8 a=dv6V6jgCZJb2qAY8wgMA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MyBTYWx0ZWRfXzAPMD18De9n2
 L8D7Y4tgsa0SCCZx5APFgPjuclb28JZKCGSBEkpK1S2SJEgv7Eh5KPk5oN7XxZ/hilnyXAZ5aau
 QZgrur0NE1J7PXoMuWEFG1fp6yCNcCCbbQ5Z48A63RcCUisVZS2o7zw4G3bYGgOiizD/mM3fQPu
 UrddFoR1Q0Pp7dNuMdCiXYXaczeLgBOeVAi5sYvD5ANdPtvS+s+1mgqbwDRVVI9y2uFW4gNtDXF
 Lg94/WTVBLJa+cte2J+vbDzkvA2kFz6tYzlvg83Ij40lO7MEIqTqcifh8aHwK0Jt2Rw3M5l7Glu
 5uwcEkbuGOYQOhn1u/DkdCYNCEbx0znGK1NdwWDMT/cJqTp++BC0+ozKnDYQGVkd2PgOuCtnVp7
 ngWCGao9xfnbIZoSJG7aAXFMGKPaYd9d69ZlEMNnV4M/Lrr1AbbHmSQ5qZusIUWGtEgNr/O0Deh
 wA3dgpAkLL8XpJ5p+Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_215407_711763_920B773B 
X-CRM114-Status: GOOD (  25.31  )
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

SGksCgpPbiBUdWUsIEFwciA3LCAyMDI2IGF0IDc6MTjigK9BTSBsaWFuZ3poZW4gPGxpYW5nemhl
bkBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+Cj4gSSBpbXBsZW1lbnRlZCB0aGUgcHRyYWNl
IGFuZCBHREIgYnJlYWtwb2ludCBzdXBwb3J0IGJhc2VkIG9uIHRoaXMKPiBwYXRjaCBzZXJpZXMu
IFdoZW4gc2V0dGluZyB0aGUgU0laRSBmaWVsZCB0byAwLCB0aGUgdGVzdCBjYXNlIHdvcmtzCj4g
Y29ycmVjdGx5Lgo+CgpOb3RlZC4gSSB3aWxsIGJlIGZsb2F0aW5nIHRoZSBwdHJhY2Ugc3VwcG9y
dCBpbW1lZGlhdGVseSBhZnRlciB0aGUKcmV2aXNlZCB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzLiBJ
IHdvdWxkIHJlcXVlc3QgeW91IHRvIHRlc3QgdGhlIHB0cmFjZQp3aXRoIHlvdXIgR0RCIGJyZWFr
cG9pbnQgc3VwcG9ydC4gUGxlYXNlIGxldCBtZSBrbm93IHdoZW4geW91IGFyZQpzZW5kaW5nIHBh
dGNoIHNlcmllcyBmb3IgR0RCLgoKVGhhbmsgeW91ClJlZ2FyZHMKSGltYW5zaHUKCj4KPiBPbiA0
LzYvMjAyNiAxMjo0OCBQTSwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiA+IEhpIExpYW5nemhl
biwKPiA+Cj4gPiBTb3JyeSBJIHdhcyBidXN5IHdpdGggcHRyYWNlIGltcGxlbWVudGF0aW9uIG9u
IHRoaXMgcGF0Y2ggc2VyaWVzLgo+ID4gV2hpY2ggaXMgZG9uZSBub3cgYW5kIEkgd2lsbCBzZW5k
IGl0IGFmdGVyIHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoaXMKPiA+IHBhdGNoLgo+ID4KPiA+IE9u
IEZyaSwgQXByIDMsIDIwMjYgYXQgMTowOeKAr1BNIGxpYW5nemhlbiA8bGlhbmd6aGVuQGxpbnV4
LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPj4gSGksCj4gPj4KPiA+PiBUaGFuayB5b3UgZm9yIHRo
aXMgcGF0Y2gsIEkgaGF2ZSBvbmUgcXVlc3Rpb24gcmVnYXJkaW5nIHRoZSBjb25maWd1cmF0aW9u
IG9mIHRoZSBzaXplIGZpZWxkOgo+ID4+Cj4gPj4gT24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMTA6
MTk6MTdBTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiA+Pgo+ID4+PiArICAgIGNh
c2UgSFdfQlJFQUtQT0lOVF9MRU5fMToKPiA+Pj4gKyAgICAgICAgaHctPmxlbiA9IDE7Cj4gPj4+
ICsgICAgICAgIGh3LT50ZGF0YTEgPSBSVl9EQlRSX1NFVF9NQzZfU0laRShody0+dGRhdGExLCAx
KTsKPiA+Pj4gKyAgICAgICAgYnJlYWs7Cj4gPj4+ICsgICAgY2FzZSBIV19CUkVBS1BPSU5UX0xF
Tl8yOgo+ID4+PiArICAgICAgICBody0+bGVuID0gMjsKPiA+Pj4gKyAgICAgICAgaHctPnRkYXRh
MSA9IFJWX0RCVFJfU0VUX01DNl9TSVpFKGh3LT50ZGF0YTEsIDIpOwo+ID4+PiArICAgICAgICBi
cmVhazsKPiA+Pj4gKyAgICBjYXNlIEhXX0JSRUFLUE9JTlRfTEVOXzQ6Cj4gPj4+ICsgICAgICAg
IGh3LT5sZW4gPSA0Owo+ID4+PiArICAgICAgICBody0+dGRhdGExID0gUlZfREJUUl9TRVRfTUM2
X1NJWkUoaHctPnRkYXRhMSwgMyk7Cj4gPj4+ICsgICAgICAgIGJyZWFrOwo+ID4+PiArICAgIGNh
c2UgSFdfQlJFQUtQT0lOVF9MRU5fODoKPiA+Pj4gKyAgICAgICAgaHctPmxlbiA9IDg7Cj4gPj4+
ICsgICAgICAgIGh3LT50ZGF0YTEgPSBSVl9EQlRSX1NFVF9NQzZfU0laRShody0+dGRhdGExLCA1
KTsKPiA+Pj4gKyAgICAgICAgYnJlYWs7Cj4gPj4gR0RCJ3MgZ2RiYXJjaF9icmVha3BvaW50X2Zy
b21fcGMgbWV0aG9kIHJldHVybnMgbGVuPTIgZm9yIG5vbi1hbGlnbmVkIGFkZHJlc3NlcywgY2F1
c2luZyBzaXplIG1pc21hdGNoIHdpdGggaGFyZHdhcmUgdHJpZ2dlcnMuCj4gPj4KPiA+PiBBIHNp
bXBsZSB0ZXN0IGlzIGFzIGZvbGxvd3M6Cj4gPj4KPiA+PiByb290QGszOn4jIGNhdCB0ZXN0LmMK
PiA+PiAjaW5jbHVkZSA8c3RkaW8uaD4KPiA+Pgo+ID4+IGludCBhID0gMDsKPiA+PiBpbnQgbWFp
bigpCj4gPj4gewo+ID4+ICAgICAgICAgcHJpbnRmKCJzdGFydCB0ZXN0XG4iKTsKPiA+PiAgICAg
ICAgIGEgPSAxOwo+ID4+ICAgICAgICAgcHJpbnRmKCJhID0gJWRcbiIsIGEpOwo+ID4+ICAgICAg
ICAgcHJpbnRmKCJlbmQgdGVzdFxuIik7IHJldHVybiAwOyB9IHJvb3RAazM6fiMgZ2NjIC1tYXJj
aD1ydjY0Z2MgLWcgdGVzdC5jIC1vIHRlc3Qgcm9vdEBrMzp+IyBnZGIgdGVzdCAuLi4gc3RhcnQg
Li4uIFRlbXBvcmFyeSBicmVha3BvaW50IDEsIG1haW4gKCkgYXQgdGVzdC5jOjYgNiBwcmludGYo
InN0YXJ0IHRlc3RcbiIpOwo+ID4+IChnZGIpIHgvOGkgJHBjCj4gPj4gPT4gMHgyYWFhYWFhNmVh
IDxtYWluKzg+OiAgICAgICBhdWlwYyAgIGEwLDB4MAo+ID4+ICAgIDB4MmFhYWFhYTZlZSA8bWFp
bisxMj46ICAgICAgYWRkaSAgICBhMCxhMCw4Ngo+ID4+ICAgIDB4MmFhYWFhYTZmMiA8bWFpbisx
Nj46ICAgICAgamFsICAgICAweDJhYWFhYWE1ZDAgPHB1dHNAcGx0Pgo+ID4+ICAgIDB4MmFhYWFh
YTZmNiA8bWFpbisyMD46ICAgICAgYXVpcGMgICBhNSwweDIKPiA+PiAgICAweDJhYWFhYWE2ZmEg
PG1haW4rMjQ+OiAgICAgIGFkZGkgICAgYTUsYTUsLTE3NzAKPiA+PiAgICAweDJhYWFhYWE2ZmUg
PG1haW4rMjg+OiAgICAgIGxpICAgICAgYTQsMQo+ID4+ICAgIDB4MmFhYWFhYTcwMCA8bWFpbisz
MD46ICAgICAgc3cgICAgICBhNCwwKGE1KQo+ID4+ICAgIDB4MmFhYWFhYTcwMiA8bWFpbiszMj46
ICAgICAgYXVpcGMgICBhNSwweDIKPiA+PiAoZ2RiKSBoYnJlYWsgKjB4MmFhYWFhYTZmMgo+ID4+
IEhhcmR3YXJlIGFzc2lzdGVkIGJyZWFrcG9pbnQgMiBhdCAweDJhYWFhYWE2ZjI6IGZpbGUgdGVz
dC5jLCBsaW5lIDYuCj4gPj4gKGdkYikgYwo+ID4+IENvbnRpbnVpbmcuCj4gPj4gc3RhcnQgdGVz
dAo+ID4+IGEgPSAxCj4gPj4gZW5kIHRlc3QKPiA+PiBbSW5mZXJpb3IgMSAocHJvY2VzcyAxNzg0
KSBleGl0ZWQgbm9ybWFsbHldCj4gPj4gKGdkYikKPiA+Pgo+ID4+IHJvb3RAazM6fiMgZ2NjIC1t
YXJjaD1ydjY0ZyAtZyB0ZXN0LmMgLW8gdGVzdAo+ID4+IHJvb3RAazM6fiMgZ2RiIHRlc3QKPiA+
PiAuLi4KPiA+PiBzdGFydAo+ID4+IC4uLgo+ID4+IFRlbXBvcmFyeSBicmVha3BvaW50IDEsIG1h
aW4gKCkgYXQgdGVzdC5jOjYKPiA+PiA2ICAgICAgICAgICAgICAgcHJpbnRmKCJzdGFydCB0ZXN0
XG4iKTsKPiA+PiAoZ2RiKSB4LzhpICRwYwo+ID4+ID0+IDB4MmFhYWFhYTZmNCA8bWFpbisxNj46
ICAgICAgYXVpcGMgICBhMCwweDAKPiA+PiAgICAweDJhYWFhYWE2ZjggPG1haW4rMjA+OiAgICAg
IGFkZGkgICAgYTAsYTAsMTAwCj4gPj4gICAgMHgyYWFhYWFhNmZjIDxtYWluKzI0PjogICAgICBq
YWwgICAgIDB4MmFhYWFhYTVkMCA8cHV0c0BwbHQ+Cj4gPj4gICAgMHgyYWFhYWFhNzAwIDxtYWlu
KzI4PjogICAgICBhdWlwYyAgIGE1LDB4Mgo+ID4+ICAgIDB4MmFhYWFhYTcwNCA8bWFpbiszMj46
ICAgICAgYWRkaSAgICBhNSxhNSwtMTc4MAo+ID4+ICAgIDB4MmFhYWFhYTcwOCA8bWFpbiszNj46
ICAgICAgbGkgICAgICBhNCwxCj4gPj4gICAgMHgyYWFhYWFhNzBjIDxtYWluKzQwPjogICAgICBz
dyAgICAgIGE0LDAoYTUpCj4gPj4gICAgMHgyYWFhYWFhNzEwIDxtYWluKzQ0PjogICAgICBhdWlw
YyAgIGE1LDB4Mgo+ID4+IChnZGIpIGhicmVhayAqMHgyYWFhYWFhNmZjCj4gPj4gSGFyZHdhcmUg
YXNzaXN0ZWQgYnJlYWtwb2ludCAyIGF0IDB4MmFhYWFhYTZmYzogZmlsZSB0ZXN0LmMsIGxpbmUg
Ni4KPiA+PiAoZ2RiKSBjCj4gPj4gQ29udGludWluZy4KPiA+Pgo+ID4+IEJyZWFrcG9pbnQgMiwg
MHgwMDAwMDAyYWFhYWFhNmZjIGluIG1haW4gKCkgYXQgdGVzdC5jOjYKPiA+PiA2ICAgICAgICAg
ICAgICAgcHJpbnRmKCJzdGFydCB0ZXN0XG4iKTsKPiA+PiAoZ2RiKQo+ID4+Cj4gPj4gQXMgYSBy
ZXN1bHQsIGhhcmR3YXJlIGJyZWFrcG9pbnRzIHNldCBvbiAxNi1iaXQgaW5zdHJ1Y3Rpb24gYWRk
cmVzc2VzIG1heSBmYWlsIHRvIHRyaWdnZXIgZHVlIHRvIHRoaXMgc2l6ZSBtaXNtYXRjaC4gU28g
Y2FuIHdlIGNvbnNpZGVyIHNldHRpbmcgdGhlIFNJWkUgZmllbGQgdG8gMCAobWF0Y2ggYW55IHNp
emUpLCBoYXJkd2FyZSB0cmlnZ2VycyBtYXRjaCBtZW1vcnkgYWNjZXNzZXMgb2YgYW55IHNpemUu
Cj4gPj4KPiA+IEkgdGhpbmsgeW91IGhhdmUgYSBnb29kIHRlc3QgY2FzZSBoZXJlLiBXZSBjYW4g
c2V0IHNpemUgdG8gMCBpZgo+ID4gc3BlY2lmaWNhbGx5IGFza2VkIG9yIGluIHRoZSBkZWZhdWx0
IGNhc2UuCj4gPiBEbyB5b3UgaGF2ZSBhIHBhdGNoIHNldCBhZ2FpbnN0IEdEQiB0byB0ZXN0IHRo
aXMgb3V0Pwo+ID4KPiA+IFRoYW5rcwo+ID4gUmVnYXJkcwo+ID4gSGltYW5zaHUKPiA+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
