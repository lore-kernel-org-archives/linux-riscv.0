Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71587FCC056
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcNU9Cnq550Ee/YcYGquX7+/HSJieDul1qQOm5e0eBo=; b=LmK9EHMiaUbCJ4
	/LeLXCZ+FKMLzN3edJOEy4ruX5S05rMaPLqD1+ai5icRFiEOBiKikbZYugVyt86eUHfgLLNrTqEXa
	fA5XuwctpDXVjjPNOC3niwVlIoepDycjAsikMiAwTSfK9ZkBkcHGWxk+5AMShPZuGCe5IwoddHr40
	DCQCb1fzKqp0sOfAb3dd1G1aXQv07JYwWOdvEh1dpbte+VZkkCvGN7dRBqxPxU4tRfpK3+9HANrQO
	d51GFHOlPju9QWFpzGG/ui6vHXRBRSEFNaZAU6tJMN6grTDUQcmyeMEWhCkLH3sDf3yWUU3ACWERO
	ozNIH7GAQMng64hQrbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya0u-00000004L5z-1oTa;
	Fri, 06 Mar 2026 18:35:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya0s-00000004L4k-09VG
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:35:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1ZTQ232623
	for <linux-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=; b=ILmPJVb2t/5n5Wkq
	W+CI6HNPAgybqw/FfJsR++RGB4AU5QXiMxM8k6RGxrQGLpMNR6UU3XCqmfc0ecOi
	Q86nDQkcYe3RH6mxwxKLEXTsD5ZTD9FLBxpD2t6N03EaTpDYxc8EKFBCPTcmmqnb
	GI1guRlDeJkA/EX4UN/5jxpfjc5ngTRPmONqCEajrce1hm2VSiQ9/6vrRvSgAzmU
	jB/C20ozpg4Um2gR7GPAEpA0QlyQzt4m7KaStURI2Nh/bAkZIGVGpu/2TWrNK2II
	oRnwL2m4jMPMi+1wys1px9FgofaE1corBN+AFg3T7OxISOQrtzk9oRU3LgValRzQ
	8qFIgg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp440ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:35:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be07cafe1cso79173472eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822100; x=1773426900; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=;
        b=D3x5rWiPh4CsslLkvCm/4V1Dmv4O9MkhkBxB4Ehmqdpv8o1sNYUFxQzxOhSvABmfeA
         O8+ZH+7Mk/BZAAVveWA7IKOzwT7oazeQ3AWLPcDCq0QhImtP37fb1nyp3awtSa002vxB
         5QmolLZLShSWSyizlw7aXV1mn5nq3YEGt3obN6BUdXRz7HaPSpXjd0RT1qE5rpJYhdmE
         5N/sLb9rvqoqNKpoY2eNgaNBBmuFW8FCWhHO9Jq828wx2pFomIz6ab+NjMQCN6BayzBY
         Jp6BUqlUgLlT7iUzGiCQj4omlLOZRm3fx7NhDRJSAxculURk9M8+/Oo6u6+sZu6BvSRu
         6btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822100; x=1773426900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feJQUbUrRnnQVQxZy0C6zZEnPDZXirlsq/N2FX9A204=;
        b=GuhOc6H6oPNUhWKrpVVj7v1wBYDYbKBUpJQNfrPXlvCgNwnDwiI1JeMXsoMwSniI+J
         PXQPDmYLgtF/T8bomtYIKLDFpsq38nXHjSQ+E5CqtNMS8KOd4pO7+O2KnPhlXuSj+6pv
         l8xuepxrSlv9tWdmW0haxHpqRHSU4Y0se7kUUa2AOy32TRN0+ZOI9WOgAqrmpbFrGXBr
         FzBY157lZ4EefRWYnWpYuYl6PKlH5RUXW6SXTDr+6vGunY+6m8ustdibcx4NISnAr+FK
         bjE+lEsYXF3bV42VKJnGGAbTY6hdGsUiNLlJlVHfLOdA4hX/iVuzJ9j8p5RIRVCM1qpV
         8yqg==
X-Forwarded-Encrypted: i=1; AJvYcCUTWlT1rif97V6MWteVR8YI7qOGFbT/yMXEZOUOumbnQ+bHBV3uWtR9a4f1aGQPUsH3F2R8N9zty0/z5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOS9Labkmx4R7t7+2tHz33fKksjlO7eb0tRgSdI8L9a2A3Mse+
	ee2ZqiGUCPonMIDE2kkiWwL53vjhmNy+Tx+5NqgCevI91gT9jPSemTeFUgg3ITEaK5Ox1vVFQHt
	zp4Iw0DOkScNr6B7ghi6xslDmosnWS9xOmGHrJ/WzC+NGVvWoMqAMkurBg0wK0ROtoTVznwc=
X-Gm-Gg: ATEYQzyv9MBQI4MxYcm2Hs18WC40of/BNCvmsxipN752okFAmuTpjx2sYAEFf1qESl9
	Z6VbBvQfsOcwbQ6FGqklIqGJi3DRc8GIPydrAUIEWbwvNoZokbOMVPAphQ4lvYrADmOhhglqumN
	dle1RoXDawnXT5Pc6u7LtCWxVPPFGlqpdCbshI//KliEdInlRaDJvcV3YvV2oCawa4DXXv/r7yd
	0e+JcfXRM7InNqc8SkSX49Lcsz53f+FWcQguiEBRIG3xJALhPPjO7HSNUQaGUTh3cR0D2cunpyo
	ZMBKDj0ssTUbeC7sjxaf32S4H7splHifpLtNVA89c7rle1kY/s2XbKKkFDaeVsZ2kH995AnR/7q
	NDNznZjImn+mYX3I49sZXedIPipDTSkM=
X-Received: by 2002:a05:7301:fa12:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be4de90d9bmr1378408eec.1.1772822099734;
        Fri, 06 Mar 2026 10:34:59 -0800 (PST)
X-Received: by 2002:a05:7301:fa12:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be4de90d9bmr1378378eec.1.1772822099160;
        Fri, 06 Mar 2026 10:34:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f670062sm1718228eec.0.2026.03.06.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:34:58 -0800 (PST)
Date: Fri, 6 Mar 2026 12:34:57 -0600
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
Subject: Re: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to
 output
Message-ID: <jlbtmuz3wlzup5cqpjp5rtpdcnhxi46ibxdulothylwcahrbe6@huyy47zy5nzp>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-11-andrew.jones@oss.qualcomm.com>
 <CAH1PCMaAiQC1+zqPeRQAFDQz6QG8DzV4FpYGhjPh1ymko_7TMg@mail.gmail.com>
 <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
 <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: Hp4qPGUjFrl9S9cBGQaT-KEPIKUjTHuH
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69ab1e54 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rJBQKMjNdry9CuFLpqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NiBTYWx0ZWRfX8uxPz5n9XrlE
 oWwjFTqwifc+ccrFGlsVsRtA50enFHEj+70H3CIMaYVDyIrZ/ZhCrwgaTDNznfaGfATBs+7+NTy
 FDTylokDIz1ije36SwIdKJdFrjCdpM2z4gR6w6N9XY0wRSGWlLuq8UTuFOkyotf7VcOtSAhfrXa
 50mtClg21N5yIDKVmibEakZNfFHDHI3yT6sDqd3nGci0+iJkv+cHrRAAC5iiYn2dHIS9WCNnDQa
 63XH76N27rqmNYKbwZlNdxE5BV4PPreXQjTpg2y8cAp0fXiMy2sWe9dxa6z5yrzseY2lsw46bec
 dixyBxENF3A0WdauPzGpMtt03VxRUiYiKJBY7DhZhJ2cwyTcNZXQiCynA/XM8KaMQfhACsKBEGJ
 TIOzzgMopMnPjXyNl5//uJkgAk1RUJRBXt8T6dVj21IKpShWClk5TVltWnAW+RHvjGpoaFM7yun
 oWHX3BjJPGpyMLH9Pbg==
X-Proofpoint-GUID: Hp4qPGUjFrl9S9cBGQaT-KEPIKUjTHuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103502_222664_7FB1E176 
X-CRM114-Status: GOOD (  20.19  )
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

T24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDg6NDc6NDJQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCA4OjA44oCvQU0gQW5kcmV3IEpvbmVzCj4gPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEZlYiAy
MSwgMjAyNiBhdCAwNjo1MjoxOVBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBPbiBG
cmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcgSm9uZXMKPiA+ID4gPGFuZHJldy5q
b25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE91dHB1dCB0aGUg
cnZhMjModXxzKTY0IElTQSBiYXNlcyB0aGF0IHRoZSBJU0EgZXh0ZW5zaW9ucyBwcm92aWRlIG9u
Cj4gPiA+ID4gbmV3ICdpc2EgYmFzZXMnIGxpbmVzIGJvdGggZm9yIHRoZSBMQ0Qgb2YgYWxsIGhh
cnRzIGFuZCBwZXIgaGFydCwgYXMKPiA+ID4gPiBzaG93biBpbiB0aGUgZXhhbXBsZSBvdXRwdXQg
YmVsb3cgd2hlbiBib290aW5nIHFlbXUgd2l0aAo+ID4gPiA+IC1jcHUgcnZhMjNzNjQsc3YzOT1v
bixwbXA9b246Cj4gPiA+ID4KPiA+ID4gPiBwcm9jZXNzb3IgICAgICAgOiAwCj4gPiA+ID4gaGFy
dCAgICAgICAgICAgIDogNAo+ID4gPiA+IGlzYSBiYXNlcyAgICAgICA6IHJ2NjRpbWEgcnZhMjN1
NjQKPiA+ID4gPiBpc2EgICAgICAgICAgICAgOiBydjY0aW1hZmRjYnZoX3ppY2JvbV96aWNib3Bf
emljYm96X3ppY2NhbW9hX3ppY2NpZl96aWNjbHNtX3ppY2Nyc2VfemljbnRyX3ppY29uZF96aWNz
cl96aWZlbmNlaV96aWhpbnRudGxfemloaW50cGF1c2VfemlocG1femltb3BfemE2NHJzX3phYW1v
X3phbHJzY196YXdyc196ZmFfemZobWluX3pjYV96Y2JfemNkX3pjbW9wX3piYV96YmJfemJzX3pr
dF96dmJiX3p2ZTMyZl96dmUzMnhfenZlNjRkX3p2ZTY0Zl96dmU2NHhfenZmaG1pbl96dmtiX3p2
a3Rfc21haWFfc21ucG1fc21zdGF0ZWVuX3NzYWlhX3NzY29mcG1mX3NzbnBtX3NzdGNfc3ZhZGVf
c3ZpbnZhbF9zdm5hcG90X3N2cGJtdAo+ID4gPiA+IG1tdSAgICAgICAgICAgICA6IHN2MzkKPiA+
ID4gPiBtdmVuZG9yaWQgICAgICAgOiAweDAKPiA+ID4gPiBtYXJjaGlkICAgICAgICAgOiAweDAK
PiA+ID4gPiBtaW1waWQgICAgICAgICAgOiAweDAKPiA+ID4gPiBoYXJ0IGlzYSBiYXNlcyAgOiBy
djY0aW1hIHJ2YTIzdTY0Cj4gPiA+ID4gaGFydCBpc2EgICAgICAgIDogcnY2NGltYWZkY2J2aF96
aWNib21femljYm9wX3ppY2Jvel96aWNjYW1vYV96aWNjaWZfemljY2xzbV96aWNjcnNlX3ppY250
cl96aWNvbmRfemljc3JfemlmZW5jZWlfemloaW50bnRsX3ppaGludHBhdXNlX3ppaHBtX3ppbW9w
X3phNjRyc196YWFtb196YWxyc2NfemF3cnNfemZhX3pmaG1pbl96Y2FfemNiX3pjZF96Y21vcF96
YmFfemJiX3pic196a3RfenZiYl96dmUzMmZfenZlMzJ4X3p2ZTY0ZF96dmU2NGZfenZlNjR4X3p2
ZmhtaW5fenZrYl96dmt0X3NtYWlhX3NtbnBtX3Ntc3RhdGVlbl9zc2FpYV9zc2NvZnBtZl9zc25w
bV9zc3RjX3N2YWRlX3N2aW52YWxfc3ZuYXBvdF9zdnBibXQKPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gKyAgICAgICAvKiBSVkEyM1M2NCAqLwo+ID4gPiA+ICsgICAgICAg
c2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJLCBleHRfbWFzayk7Cj4gPiA+ID4gKyAgICAg
ICAvKiBUT0RPOiBTczFwMTMgKi8KPiA+ID4gPiArICAgICAgIC8qIFN2YmFyZSwgU3YzOSAtLSBh
c3N1bWVkICovCj4gPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZBREUsIGV4
dF9tYXNrKTsKPiA+ID4gPiArICAgICAgIC8qIFRPRE86IFNzY2NwdHIsIFNzdHZlY2QsIFNzdHZh
bGEsIFNzY291bnRlcmVudyAqLwo+ID4gPgo+ID4gPiBGb3IgdGhpcywKPiA+ID4KPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TVlBCTVQsIGV4dF9tYXNrKTsKPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TVklOVkFMLCBleHRfbWFzayk7Cj4gPiA+ID4g
KyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZOQVBPVCwgZXh0X21hc2spOwo+ID4gPiA+
ICsgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1NTVEMsIGV4dF9tYXNrKTsKPiA+ID4gPiAr
ICAgICAgIHNldF9iaXQoUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiwgZXh0X21hc2spOwo+ID4gPiA+
ICsgICAgICAgc2V0X2JpdChSSVNDVl9JU0FfRVhUX1NTTlBNLCBleHRfbWFzayk7Cj4gPiA+ID4g
KyAgICAgICAvKiBUT0RPOiBTc3U2NHhsICovCj4gPiA+ID4gKyAgICAgICAvKiBUT0RPOiBTaGEg
PSBTc3N0YXRlZW4sIFNoY291bnRlcmVudywgU2h2c3R2YWxhLCBTaHR2YWxhLCBTaHZzdHZlY2Qs
IFNodnNhdHBhLCBTaGdhdHBhICovCj4gCj4gSGksIGRyZXcKPiAKPiBBYm91dCAnU2hhJywgeW91
ciByZWFkaW5nIG9mIHRoZSBwcm9maWxlL3NwZWMsIGRvIHlvdSBwcmVmZXIgdG8gZGVmaW5lCj4g
U2hhIGFzIGEgX0JVTkRMRSBvciBhcyBhIF9TVVBFUlNFVCgpIHdoaWNoIGhhcyBpdHMgb3duIGlk
Pwo+IAo+IEkgZGVmaW5lZCBpdCBhcyBfU1VQRVJTRVQoKSBpbiBteSBwYXRjaCA4LzggWzFdLCBi
dXQgd2l0aCB0b2RheSdzIGNvZGUKPiByZXZpZXcsIEkgZ3Vlc3MgYnVuZGxlIGlzIGEgYmV0dGVy
IGZpdC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gQlRXLCBTaGEgPSBIICsgNyBvdGhlcnMuIEl0
IGluY2x1ZGVzIEguCgpJIGFncmVlIGEgYnVuZGxlIGlzIG1vcmUgc3VpdGFibGUgZm9yIFNoYS4K
ClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
