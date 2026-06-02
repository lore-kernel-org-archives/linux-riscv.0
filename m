Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6641ACD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjmVNrP8YnSTmqrPS8tkkKpA1btQDuX39SfvOO88MqA=; b=O4LX8Xl6fE/v6O
	Ivt4M3gVPmaUNbwQNK+0jRPHgws6ZAvY3iv//FoWTfRApCK6wYc39/TK87700sgd+ZNPcr1J93BLK
	8wI3oHNgRoh7hSenjYvlJ+6pFPvmE1/XD4dLr5NCfPHbAwCuw6kzrPbVs0w7qgTCInBupLD+f501i
	u8/V9XbJDIVbAG8I0Eo60LtC+vznsa/98eSjc0JcJSWB30BetaBWtkKPIwvaX1N/utRYhF29dRlz0
	wmsUfQ9sFl1j1HkhnpA7XJLfV5d1CxkAt79kFV4ukSQdWEhG8tTMJVeVbCVaQNrV2SNpIFRD/ttQW
	m1q9vbFVzKkB6UEVmb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNLZ-0000000CseB-0KGk;
	Tue, 02 Jun 2026 11:31:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNLW-0000000CsdY-0jKq
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 11:31:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652AhfKt2692226
	for <linux-riscv@lists.infradead.org>; Tue, 2 Jun 2026 11:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=; b=bNE3kNOwED7xSK7J
	m6O8eXrcXo5eN1fFAshvuLkLbxWcveyG5aw6JhhDPuPyzBHfGI+MuJp9f9JjcKeb
	Bjcqv3AWG/2sMgTqM3kOUpLBcv6WuGN8YUO6PcQ0IO4EiieRyfBNC7c5g35wmpmk
	4VxvlIQQsCDtTDOx946YyVhFFJZaFeAlXP6KLfE4obfmZbs9lJZsqNP6bKbiqx24
	uGcaR5DkinrtZuHmyZ+FHtnm592adFXMbhdl2EWlb3LGV9L62oWO2TWW2IFdKBc2
	4s8928U/GOyNRN0m0+HPGOAWJukREG5OigXWR4M8q/n8kGiuwgCEFxzvmdBo5j6N
	LqKcWA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqumhny1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 11:31:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccebf7e86aso94125486d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 04:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399904; cv=none;
        d=google.com; s=arc-20240605;
        b=HbxZI4dLiKmfLERDjOHwoXJ5XTGSoX4gsVRVKSJGgJg3XRs06AfNdrsIQQovfyqUXe
         164oUZQzl15xW+/n33Q8SR+2TaKZwRbrE8FAuxMepQstik76vdd+44VG6Dg/n71MODmA
         ZnWebD+DNW5AUPEfgP8iXmDoz/wN5DcpLC0KC10xvNekCbTrzgvHatfQXqQ/pNT+iszk
         7F+UoqhO3Ht4sjXOPZpYZMqn30gHTaXWXG2Qq7K07ZM//vqo7f0YQw9d4CeM+5apskSZ
         kOg2pYBoGA0+3koxFiMB0RRm+lzZO7c3y3SmymYpcDsl/PML0HjjkicITbhKu0b5AEjC
         o8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        fh=MXRozjGyAfCy438XoIGKDn/BkaDXprcWxCBdrSCp72g=;
        b=PK0pI+cgCLeCipKeQO/a0vPWLBQYuPjYDXfCt0Qyla4ws8fIYK7tdZKJQO0roCkhWI
         af04xNZpZkHMy3lKST9n6Wzz0WNA8VKR7Ol/oGKoFcZh5DLy+seuwAwI9sEns+nNNwbs
         FGIfYIb8c8/9xdUL7KUqeGpbnKtAwanwYDX3YHrxEbQhiBwuBNHMcW/NXBXkgkWojVOp
         9YZXBPvEP4RExAxYIWU5rwsfJnehaeGqMoL6g7FyRbplf7NMUEn31uerqlVKBOOFl+XY
         kk8I+ESA3CKzca63SKZFJhETVKIK1y3vvaYdhgn24D9hsR1sys2xhlO3PCPPzotsU1fv
         L7Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399904; x=1781004704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        b=FZsuafEVptfVGKKYYIlZnZxGY2J9hAxrAqzGt14A/I23G8piH6stc4Jnx9g9y1bU1i
         Rk5k+tN5HMX+lc1O04dUV2ln5McQoXmgQ6su8e3kkzt9tj+JZLasrvCiie37V2Sfupr1
         RGeNNI6pHN3Xn5Ef0wpRDSPZz8aigVDSEVSJrhX2XAO2UyLD5PFaN0AYfTbeDRXrCy5j
         2h7UmpAy9IRjNEVQ6sVgrVoqwjwniQVtdpmYoxBWBXjn7P5yUEn9YZnagNuN+1SiObhh
         MCJ/bPvc1TMxN7OlsqNm/Ld+V+UcyKZLTSM4600+JrjZGw3rWR63+AkuBBVEdnCJZNRc
         YD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399904; x=1781004704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mda/j6EyDm1KJxOCvnXRr8yaQnB3DX8BLyXxmxL3WS4=;
        b=El0GTgagFBlpIK3NEynTsdW69o3WsZOmzKm4k2oGFVmFMRsI1oGCA2d7Tslt2Wpehn
         0oW8fKckhQ2IL6t9S+7hwACyi4i6Ne0bNU9vZsO0NrD+eme1kj3dzncxRMZ57t0VURWp
         5kPdvXpmcxWISOPmkwe2p8O7GqwU0UmCp+/2jUJiMBkM8uhwhWzFWWL8Flu5neuBDceh
         8GdzhbFh4mgiiIyyUsn29acLeRQkZD4nlZ1tZ7AduGIzkfORZd4xNm2lknyafruNGn5s
         AE4+c8zHQYijAOB/1QJIPJIf1jrC5WWT4TiOVhO0cX1JLUC4p9X+MeXcsyQByxVW7mOk
         pBPA==
X-Forwarded-Encrypted: i=1; AFNElJ/rgkZ6sZhXdBSiCB1mLzZNEcH5W6bHvvCwpWXld0g+Hz79UUy/CARFFNXhK6FEXyU4IgAdx3sRDZbp4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrLsQp3wQFZHmIaW0ig4v6o4cvtGHxOhn7AH9ekg5gvzcFV9w
	bGIyouEcUN0eicEtue1l/rYMP/tzlEHnEW7TFih1VkBOLJxjdf+5ESOvjDghN+v4LhR24/Gs5Ha
	eKSYgBB+n4ASkwk+qsm4nzC2dvo7Pb45G+lpTOJd6OQH2So24d2K+lRqrjuBpDF0jNjifO8+kVE
	XsRPDiwBffAWogfylSf//PWV0Gq4wpPl4WqcOPxKDUDn4QAQ==
X-Gm-Gg: Acq92OF8kMtKRs/FeCSynX85W4iLmbbYxW5XO5IVx2/R2Ptm5f2RwxtmKgJm4JCZl2h
	p4KxIPuB4fFe7UUcFVgSFwn1E6S2giRUBgaEAFdms6biIgdbAcPR8hJqgko9fusAV0wDqts7Wv1
	eR3efUXBBjUy4IHgGra5o1E97vGxuVSyUKnaDq3qO8v7Bef4ARDZiQ/FNGTgrxeZ560h/qharoj
	684BnEBhLXUc9xLTw==
X-Received: by 2002:a05:6214:408:b0:8ac:a91c:c8d with SMTP id 6a1803df08f44-8cebf469960mr51143676d6.14.1780399904177;
        Tue, 02 Jun 2026 04:31:44 -0700 (PDT)
X-Received: by 2002:a05:6214:408:b0:8ac:a91c:c8d with SMTP id
 6a1803df08f44-8cebf469960mr51142956d6.14.1780399903677; Tue, 02 Jun 2026
 04:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-11-anup.patel@oss.qualcomm.com> <a56d974c-64c2-450e-8668-f987de64468b@intel.com>
In-Reply-To: <a56d974c-64c2-450e-8668-f987de64468b@intel.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 17:01:31 +0530
X-Gm-Features: AVHnY4IKT6gwN_NhQ_Tbfeb8vUpJWfrBiHQzMe6WPUfF3CZMEfaVOhAAY8SepWk
Message-ID: <CAHuiULCzUNkXTSwcHHUDFXM-oU=_gpCeTNM+VAHdwZP47Xw4qw@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] perf tools: Add RISC-V trace PMU record capabilities
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nutty Liu <nutty.liu@hotmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExMCBTYWx0ZWRfX5By0uZ481e4o
 3FGzYAsXfQvzTRODs6B+X1W+YELrGgFcXB64rS6jz06SdnxE7isKAhbP65yGnX7I+oXiKnvDQAa
 nmSwrUaBfdrcajum88mwmLV4BlOyyUQBczMmt3g1doFfL4g6VuRdmpz/wzZi6qXVAF995M8cQTi
 9PxW0kyoEwDQUOvspANEoJyrDd8IH3RT3ULxdHSwJ4giv8VpWm6XgLpK6pvdnRO2co8OUANZMl2
 PY9qrYK6HxZ9PKYshBBQlCMo9xdrO8uk/Kep8e8uxt3pRmwA6qGbbHKfUuOrb+Hit8Lba68G4FM
 pZtWH/4MSBgsuMF8hwQGp/5wFJxw9Gl8Pm+mqV/nMjW72uMS99Z1ZRX9RaXg/6ghWJPCmakNmLz
 1/D9xzEPJF95VtEj+8g7uyHPZTMEEVQmSEfdQYb+WoDnjQTUjmL+jREWhbAyVSJPcFyKQAMfriM
 68+ni0roMKNLeN/sS1g==
X-Proofpoint-ORIG-GUID: 7NVkOIiC16SyykSrxaCsy8quS2b2vArk
X-Proofpoint-GUID: 7NVkOIiC16SyykSrxaCsy8quS2b2vArk
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1ebf21 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8
 a=66weK1n04nU2DmxxcLEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_043146_287878_777D590F 
X-CRM114-Status: GOOD (  29.07  )
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

SGkgQWRyaWFuLAoKT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgNTowMOKAr1BNIEFkcmlhbiBIdW50
ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIDI5LzA0LzIwMjYgMTU6
NTEsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBGcm9tOiBNYXl1cmVzaCBDaGl0YWxlIDxtYXl1cmVz
aC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+Cj4gPgo+ID4gSW50cm9kdWNlIHRoZSByZXF1aXJl
ZCBhdXhpbGlhcnkgQVBJIGZ1bmN0aW9ucyBhbGxvd2luZyB0aGUgcGVyZiBjb3JlCj4gPiB0byBp
bnRlcmFjdCB3aXRoIFJJU0MtViB0cmFjZSBwZXJmIGRyaXZlci4KPiA+Cj4gPiBDby1kZXZlbG9w
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IE1heXVyZXNoIENoaXRhbGUgPG1heXVyZXNoLmNoaXRhbGVAb3NzLnF1YWxj
b21tLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBOdXR0eSBMaXUgPG51dHR5LmxpdUBob3RtYWlsLmNv
bT4KPgo+IEEgZmV3IG1pbm9yIGNvbW1lbnRzLCBvdGhlcndpc2U6Cj4KPiBSZXZpZXdlZC1ieTog
QWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+CgpUaGFua3MsIEkgd2lsbCBh
ZGRyZXNzIHRoZSBjb21tZW50cyBiZWxvdyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gPiAtLS0K
PiA+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCAgICAgIHwgICAxICsKPiA+ICB0
b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9hdXh0cmFjZS5jIHwgMjE5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gPiAgdG9vbHMvcGVyZi91dGlsL2F1eHRyYWNlLmMgICAgICAgICAgICB8
ICAgMSArCj4gPiAgdG9vbHMvcGVyZi91dGlsL2F1eHRyYWNlLmggICAgICAgICAgICB8ICAgMSAr
Cj4gPiAgdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UuaCAgICAgICAgICAgICB8ICAxOCArKysKPiA+
ICA1IGZpbGVzIGNoYW5nZWQsIDI0MCBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2F1eHRyYWNlLmMKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UuaAo+ID4KPiA+IGRpZmYgLS1naXQgYS90
b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZCBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91
dGlsL0J1aWxkCj4gPiBpbmRleCAyMzI4ZmI5YTMwYTMuLmUwN2Q1NTI1ZWNlNiAxMDA2NDQKPiA+
IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL0J1aWxkCj4gPiArKysgYi90b29scy9w
ZXJmL2FyY2gvcmlzY3YvdXRpbC9CdWlsZAo+ID4gQEAgLTEgKzEsMiBAQAo+ID4gIHBlcmYtdXRp
bC15ICs9IGhlYWRlci5vCj4gPiArcGVyZi11dGlsLXkgKz0gYXV4dHJhY2Uubwo+ID4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2F1eHRyYWNlLmMgYi90b29scy9wZXJm
L2FyY2gvcmlzY3YvdXRpbC9hdXh0cmFjZS5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi41MjkzZWNlMjE0N2QKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2F1eHRyYWNlLmMKPiA+IEBAIC0wLDAgKzEs
MjE5IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsvKgo+
ID4gKyAqIFJpc2MtViBFLVRyYWNlIHN1cHBvcnQKPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9sb2cyLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L3phbGxvYy5oPgo+ID4gKyNpbmNsdWRlIDxlcnJuby5oPgo+ID4gKyNp
bmNsdWRlIDx0aW1lLmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgPGludGVybmFsL2xpYi5oPgo+ID4g
KyNpbmNsdWRlICIuLi8uLi8uLi91dGlsL2F1eHRyYWNlLmgiCj4gPiArI2luY2x1ZGUgIi4uLy4u
Ly4uL3V0aWwvY3B1bWFwLmgiCj4gPiArI2luY2x1ZGUgIi4uLy4uLy4uL3V0aWwvZGVidWcuaCIK
PiA+ICsjaW5jbHVkZSAiLi4vLi4vLi4vdXRpbC9ldmVudC5oIgo+ID4gKyNpbmNsdWRlICIuLi8u
Li8uLi91dGlsL2V2bGlzdC5oIgo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi91dGlsL2V2c2VsLmgi
Cj4gPiArI2luY2x1ZGUgIi4uLy4uLy4uL3V0aWwvcnZ0cmFjZS5oIgo+ID4gKyNpbmNsdWRlICIu
Li8uLi8uLi91dGlsL3BtdS5oIgo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi91dGlsL3JlY29yZC5o
Igo+ID4gKyNpbmNsdWRlICIuLi8uLi8uLi91dGlsL3Nlc3Npb24uaCIKPiA+ICsjaW5jbHVkZSAi
Li4vLi4vLi4vdXRpbC90c2MuaCIKPgo+IHRzYy5oIG5vdCBuZWVkZWQgaWYgcmR0c2MoKSBpcyBk
cm9wcGVkCj4KPiA+ICsKPiA+ICsjZGVmaW5lIFJWVFJBQ0VfUE1VX05BTUUgInJ2dHJhY2UiCj4g
PiArI2RlZmluZSBLaUIoeCkgKCh4KSAqIDEwMjQpCj4gPiArI2RlZmluZSBNaUIoeCkgKCh4KSAq
IDEwMjQgKiAxMDI0KQo+ID4gKwo+ID4gK3N0cnVjdCBydnRyYWNlX3JlY29yZGluZyB7Cj4gPiAr
ICAgICBzdHJ1Y3QgYXV4dHJhY2VfcmVjb3JkICBpdHI7Cj4gPiArICAgICBzdHJ1Y3QgcGVyZl9w
bXUgKnJ2dHJhY2VfcG11Owo+ID4gKyAgICAgc3RydWN0IGV2bGlzdCAqZXZsaXN0Owo+ID4gK307
Cj4gPiArCj4gPiArc3RhdGljIHNpemVfdCBydnRyYWNlX2luZm9fcHJpdl9zaXplKHN0cnVjdCBh
dXh0cmFjZV9yZWNvcmQgKml0ciBfX21heWJlX3VudXNlZCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGV2bGlzdCAqZXZsaXN0IF9fbWF5YmVfdW51c2VkKQo+
ID4gK3sKPiA+ICsgICAgIHJldHVybiBSVlRSQUNFX0FVWFRSQUNFX1BSSVZfU0laRTsKPiA+ICt9
Cj4gPiArCj4gPiArc3RhdGljIGludCBydnRyYWNlX2luZm9fZmlsbChzdHJ1Y3QgYXV4dHJhY2Vf
cmVjb3JkICppdHIsIHN0cnVjdCBwZXJmX3Nlc3Npb24gKnNlc3Npb24sCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGVyZl9yZWNvcmRfYXV4dHJhY2VfaW5mbyAqYXV4dHJh
Y2VfaW5mbywgc2l6ZV90IHByaXZfc2l6ZSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcnZ0cmFj
ZV9yZWNvcmRpbmcgKnB0ciA9IGNvbnRhaW5lcl9vZihpdHIsIHN0cnVjdCBydnRyYWNlX3JlY29y
ZGluZywgaXRyKTsKPiA+ICsgICAgIHN0cnVjdCBwZXJmX3BtdSAqcnZ0cmFjZV9wbXUgPSBwdHIt
PnJ2dHJhY2VfcG11Owo+ID4gKwo+ID4gKyAgICAgaWYgKHByaXZfc2l6ZSAhPSBSVlRSQUNFX0FV
WFRSQUNFX1BSSVZfU0laRSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAr
Cj4gPiArICAgICBpZiAoIXNlc3Npb24tPmV2bGlzdC0+Y29yZS5ucl9tbWFwcykKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiBUaGlzIGNoZWNrIGlzIG5vdCBuZWVkZWQKPgo+
ID4gKwo+ID4gKyAgICAgYXV4dHJhY2VfaW5mby0+dHlwZSA9IFBFUkZfQVVYVFJBQ0VfUklTQ1Zf
VFJBQ0U7Cj4gPiArICAgICBhdXh0cmFjZV9pbmZvLT5wcml2WzBdID0gcnZ0cmFjZV9wbXUtPnR5
cGU7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlu
dCBydnRyYWNlX3NldF9hdXh0cmFjZV9tbWFwX3BhZ2Uoc3RydWN0IHJlY29yZF9vcHRzICpvcHRz
KQo+ID4gK3sKPiA+ICsgICAgIGJvb2wgcHJpdmlsZWdlZCA9IHBlcmZfZXZlbnRfcGFyYW5vaWRf
Y2hlY2soLTEpOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFvcHRzLT5mdWxsX2F1eHRyYWNlKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIGlmIChvcHRzLT5mdWxsX2F1
eHRyYWNlICYmICFvcHRzLT5hdXh0cmFjZV9tbWFwX3BhZ2VzKSB7Cj4gPiArICAgICAgICAgICAg
IGlmIChwcml2aWxlZ2VkKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb3B0cy0+YXV4dHJh
Y2VfbW1hcF9wYWdlcyA9IE1pQigxNikgLyBwYWdlX3NpemU7Cj4gPiArICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb3B0cy0+YXV4dHJhY2VfbW1hcF9wYWdl
cyA9IEtpQigxMjgpIC8gcGFnZV9zaXplOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChv
cHRzLT5tbWFwX3BhZ2VzID09IFVJTlRfTUFYKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgb3B0cy0+bW1hcF9wYWdlcyA9IEtpQigyNTYpIC8gcGFnZV9zaXplOwo+ID4gKyAgICAg
ICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKiBWYWxpZGF0ZSBhdXh0cmFj
ZV9tbWFwX3BhZ2VzICovCj4gPiArICAgICBpZiAob3B0cy0+YXV4dHJhY2VfbW1hcF9wYWdlcykg
ewo+ID4gKyAgICAgICAgICAgICBzaXplX3Qgc3ogPSBvcHRzLT5hdXh0cmFjZV9tbWFwX3BhZ2Vz
ICogKHNpemVfdClwYWdlX3NpemU7Cj4gPiArICAgICAgICAgICAgIHNpemVfdCBtaW5fc3ogPSBL
aUIoOCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIGlmIChzeiA8IG1pbl9zeiB8fCAhaXNfcG93
ZXJfb2ZfMihzeikpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIkludmFsaWQg
bW1hcCBzaXplIDogbXVzdCBiZSBhdCBsZWFzdCAlenVLaUIgYW5kIGEgcG93ZXIgb2YgMlxuIiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWluX3N6IC8gMTAyNCk7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIH0KPiA+
ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0
aWMgaW50IHJ2dHJhY2VfcmVjb3JkaW5nX29wdGlvbnMoc3RydWN0IGF1eHRyYWNlX3JlY29yZCAq
aXRyLCBzdHJ1Y3QgZXZsaXN0ICpldmxpc3QsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCByZWNvcmRfb3B0cyAqb3B0cykKPiA+ICt7Cj4gPiArICAgICBzdHJ1
Y3QgcnZ0cmFjZV9yZWNvcmRpbmcgKnB0ciA9IGNvbnRhaW5lcl9vZihpdHIsIHN0cnVjdCBydnRy
YWNlX3JlY29yZGluZywgaXRyKTsKPiA+ICsgICAgIHN0cnVjdCBwZXJmX3BtdSAqcnZ0cmFjZV9w
bXUgPSBwdHItPnJ2dHJhY2VfcG11Owo+ID4gKyAgICAgc3RydWN0IGV2c2VsICpldnNlbCwgKnJ2
dHJhY2VfZXZzZWwgPSBOVUxMOwo+ID4gKyAgICAgc3RydWN0IGV2c2VsICp0cmFja2luZ19ldnNl
bDsKPiA+ICsgICAgIGludCBlcnI7Cj4gPiArCj4gPiArICAgICBwdHItPmV2bGlzdCA9IGV2bGlz
dDsKPiA+ICsgICAgIGV2bGlzdF9fZm9yX2VhY2hfZW50cnkoZXZsaXN0LCBldnNlbCkgewo+ID4g
KyAgICAgICAgICAgICBpZiAoZXZzZWwtPmNvcmUuYXR0ci50eXBlID09IHJ2dHJhY2VfcG11LT50
eXBlKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHJ2dHJhY2VfZXZzZWwpIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiVGhlcmUgbWF5IGJlIG9ubHkg
b25lICIgUlZUUkFDRV9QTVVfTkFNRSAieCBldmVudFxuIik7Cj4KPiBTaG91bGQgInggZXZlbnRc
biIgYmUganVzdCAiIGV2ZW50XG4iCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBldnNlbC0+Y29yZS5hdHRyLmZyZXEgPSAwOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGV2c2VsLT5jb3JlLmF0dHIuc2FtcGxlX3BlcmlvZCA9IDE7Cj4gPiArICAgICAg
ICAgICAgICAgICAgICAgZXZzZWwtPm5lZWRzX2F1eHRyYWNlX21tYXAgPSB0cnVlOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJ2dHJhY2VfZXZzZWwgPSBldnNlbDsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBvcHRzLT5mdWxsX2F1eHRyYWNlID0gdHJ1ZTsKPiA+ICsgICAgICAgICAgICAg
fQo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZXJyID0gcnZ0cmFjZV9zZXRfYXV4dHJhY2Vf
bW1hcF9wYWdlKG9wdHMpOwo+ID4gKyAgICAgaWYgKGVycikKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIGVycjsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBUbyBvYnRhaW4gdGhlIGF1eHRyYWNl
IGJ1ZmZlciBmaWxlIGRlc2NyaXB0b3IsIHRoZSBhdXh0cmFjZSBldmVudAo+ID4gKyAgICAgICog
bXVzdCBjb21lIGZpcnN0Lgo+ID4gKyAgICAgICovCj4gPiArICAgICBldmxpc3RfX3RvX2Zyb250
KGV2bGlzdCwgcnZ0cmFjZV9ldnNlbCk7Cj4gPiArICAgICBldnNlbF9fc2V0X3NhbXBsZV9iaXQo
cnZ0cmFjZV9ldnNlbCwgVElNRSk7Cj4gPiArCj4gPiArICAgICAvKiBBZGQgZHVtbXkgZXZlbnQg
dG8ga2VlcCB0cmFja2luZyAqLwo+ID4gKyAgICAgZXJyID0gcGFyc2VfZXZlbnQoZXZsaXN0LCAi
ZHVtbXk6dSIpOwo+ID4gKyAgICAgaWYgKGVycikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGVy
cjsKPiA+ICsKPiA+ICsgICAgIHRyYWNraW5nX2V2c2VsID0gZXZsaXN0X19sYXN0KGV2bGlzdCk7
Cj4gPiArICAgICBldmxpc3RfX3NldF90cmFja2luZ19ldmVudChldmxpc3QsIHRyYWNraW5nX2V2
c2VsKTsKPiA+ICsKPiA+ICsgICAgIHRyYWNraW5nX2V2c2VsLT5jb3JlLmF0dHIuZnJlcSA9IDA7
Cj4gPiArICAgICB0cmFja2luZ19ldnNlbC0+Y29yZS5hdHRyLnNhbXBsZV9wZXJpb2QgPSAxOwo+
ID4gKyAgICAgZXZzZWxfX3NldF9zYW1wbGVfYml0KHRyYWNraW5nX2V2c2VsLCBUSU1FKTsKPiA+
ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdTY0IHJ2dHJh
Y2VfcmVmZXJlbmNlKHN0cnVjdCBhdXh0cmFjZV9yZWNvcmQgKml0ciBfX21heWJlX3VudXNlZCkK
PiA+ICt7Cj4gPiArICAgICByZXR1cm4gcmR0c2MoKTsKPgo+IHJkdHNjKCkgaXMgMCAod2VhayBm
bikgZm9yIHJpc2N2LCBhbmQgZG9lcyBub3QgbWFrZSBzZW5zZSwKPiBzbyBqdXN0IHJldHVybiAw
Lgo+Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHJ2dHJhY2VfcmVjb3JkaW5nX2ZyZWUo
c3RydWN0IGF1eHRyYWNlX3JlY29yZCAqaXRyKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBydnRy
YWNlX3JlY29yZGluZyAqcHRyID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250YWluZXJf
b2YoaXRyLCBzdHJ1Y3QgcnZ0cmFjZV9yZWNvcmRpbmcsIGl0cik7Cj4KPiBEb2VzIG5vdCBuZWVk
IGxpbmUgd3JhcAo+Cj4gPiArCj4gPiArICAgICBmcmVlKHB0cik7Cj4gPiArfQo+ID4gKwo+ID4g
K3N0YXRpYyBzdHJ1Y3QgYXV4dHJhY2VfcmVjb3JkICpydnRyYWNlX3JlY29yZGluZ19pbml0KGlu
dCAqZXJyLCBzdHJ1Y3QgcGVyZl9wbXUgKnJ2dHJhY2VfcG11KQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCBydnRyYWNlX3JlY29yZGluZyAqcHRyOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFydnRyYWNl
X3BtdSkgewo+ID4gKyAgICAgICAgICAgICAqZXJyID0gLUVOT0RFVjsKPiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBwdHIgPSB6YWxsb2Mo
c2l6ZW9mKCpwdHIpKTsKPiA+ICsgICAgIGlmICghcHRyKSB7Cj4gPiArICAgICAgICAgICAgICpl
cnIgPSAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsgICAgIH0K
PiA+ICsKPiA+ICsgICAgIHB0ci0+cnZ0cmFjZV9wbXUgPSBydnRyYWNlX3BtdTsKPiA+ICsgICAg
IHB0ci0+aXRyLnJlY29yZGluZ19vcHRpb25zID0gcnZ0cmFjZV9yZWNvcmRpbmdfb3B0aW9uczsK
PiA+ICsgICAgIHB0ci0+aXRyLmluZm9fcHJpdl9zaXplID0gcnZ0cmFjZV9pbmZvX3ByaXZfc2l6
ZTsKPiA+ICsgICAgIHB0ci0+aXRyLmluZm9fZmlsbCA9IHJ2dHJhY2VfaW5mb19maWxsOwo+ID4g
KyAgICAgcHRyLT5pdHIuZnJlZSA9IHJ2dHJhY2VfcmVjb3JkaW5nX2ZyZWU7Cj4gPiArICAgICBw
dHItPml0ci5yZWZlcmVuY2UgPSBydnRyYWNlX3JlZmVyZW5jZTsKPiA+ICsgICAgIHB0ci0+aXRy
LnJlYWRfZmluaXNoID0gYXV4dHJhY2VfcmVjb3JkX19yZWFkX2ZpbmlzaDsKPiA+ICsgICAgIHB0
ci0+aXRyLmFsaWdubWVudCA9IDA7Cj4gPiArCj4gPiArICAgICAqZXJyID0gMDsKPiA+ICsgICAg
IHJldHVybiAmcHRyLT5pdHI7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGVyZl9w
bXUgKmZpbmRfcG11X2Zvcl9ldmVudChzdHJ1Y3QgcGVyZl9wbXUgKipwbXVzLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcG11X25yLCBzdHJ1Y3QgZXZz
ZWwgKmV2c2VsKQo+ID4gK3sKPiA+ICsgICAgIGludCBpOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFw
bXVzKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgIGZvciAo
aSA9IDA7IGkgPCBwbXVfbnI7IGkrKykgewo+ID4gKyAgICAgICAgICAgICBpZiAoZXZzZWwtPmNv
cmUuYXR0ci50eXBlID09IHBtdXNbaV0tPnR5cGUpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHBtdXNbaV07Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4gTlVMTDsK
PiA+ICt9Cj4gPiArCj4gPiArc3RydWN0IGF1eHRyYWNlX3JlY29yZCAqYXV4dHJhY2VfcmVjb3Jk
X19pbml0KHN0cnVjdCBldmxpc3QgKmV2bGlzdCwgaW50ICplcnIpCj4gPiArewo+ID4gKyAgICAg
c3RydWN0IHBlcmZfcG11ICpydnRyYWNlX3BtdSA9IE5VTEw7Cj4gPiArICAgICBzdHJ1Y3QgcGVy
Zl9wbXUgKmZvdW5kX3BtdSA9IE5VTEw7Cj4gPiArICAgICBzdHJ1Y3QgZXZzZWwgKmV2c2VsOwo+
ID4gKwo+ID4gKyAgICAgaWYgKCFldmxpc3QpCj4gPiArICAgICAgICAgICAgIHJldHVybiBOVUxM
Owo+ID4gKwo+ID4gKyAgICAgcnZ0cmFjZV9wbXUgPSBwZXJmX3BtdXNfX2ZpbmQoUlZUUkFDRV9Q
TVVfTkFNRSk7Cj4gPiArICAgICBldmxpc3RfX2Zvcl9lYWNoX2VudHJ5KGV2bGlzdCwgZXZzZWwp
IHsKPiA+ICsgICAgICAgICAgICAgaWYgKHJ2dHJhY2VfcG11ICYmICFmb3VuZF9wbXUpCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgZm91bmRfcG11ID0gZmluZF9wbXVfZm9yX2V2ZW50KCZydnRy
YWNlX3BtdSwgMSwgZXZzZWwpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgaWYgKGZvdW5k
X3BtdSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJ2dHJhY2VfcmVjb3JkaW5nX2luaXQoZXJy
LCBydnRyYWNlX3BtdSk7Cj4gPiArCj4gPiArICAgICAqZXJyID0gMDsKPiA+ICsgICAgIHJldHVy
biBOVUxMOwo+ID4gK30KPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3V0aWwvYXV4dHJhY2Uu
YyBiL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5jCj4gPiBpbmRleCBhMjI0Njg3ZmZiYzEuLjk0
NGE0M2Q0ODczOSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5jCj4g
PiArKysgYi90b29scy9wZXJmL3V0aWwvYXV4dHJhY2UuYwo+ID4gQEAgLTE0MTEsNiArMTQxMSw3
IEBAIGludCBwZXJmX2V2ZW50X19wcm9jZXNzX2F1eHRyYWNlX2luZm8oY29uc3Qgc3RydWN0IHBl
cmZfdG9vbCAqdG9vbCBfX21heWJlX3VudXNlCj4gPiAgICAgICBjYXNlIFBFUkZfQVVYVFJBQ0Vf
VlBBX0RUTDoKPiA+ICAgICAgICAgICAgICAgZXJyID0gcG93ZXJwY192cGFkdGxfcHJvY2Vzc19h
dXh0cmFjZV9pbmZvKGV2ZW50LCBzZXNzaW9uKTsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4g
PiArICAgICBjYXNlIFBFUkZfQVVYVFJBQ0VfUklTQ1ZfVFJBQ0U6Cj4gPiAgICAgICBjYXNlIFBF
UkZfQVVYVFJBQ0VfVU5LTk9XTjoKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFj
ZS5oIGIvdG9vbHMvcGVyZi91dGlsL2F1eHRyYWNlLmgKPiA+IGluZGV4IDY5NDdmM2YyODRjMC4u
NGY0NzE0YzFiNTNmIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvcGVyZi91dGlsL2F1eHRyYWNlLmgK
PiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9hdXh0cmFjZS5oCj4gPiBAQCAtNDYsNiArNDYsNyBA
QCBlbnVtIGF1eHRyYWNlX3R5cGUgewo+ID4gICAgICAgUEVSRl9BVVhUUkFDRV9TMzkwX0NQVU1T
RiwKPiA+ICAgICAgIFBFUkZfQVVYVFJBQ0VfSElTSV9QVFQsCj4gPiAgICAgICBQRVJGX0FVWFRS
QUNFX1ZQQV9EVEwsCj4gPiArICAgICBQRVJGX0FVWFRSQUNFX1JJU0NWX1RSQUNFLAo+ID4gIH07
Cj4gPgo+ID4gIGVudW0gaXRyYWNlX3BlcmlvZF90eXBlIHsKPiA+IGRpZmYgLS1naXQgYS90b29s
cy9wZXJmL3V0aWwvcnZ0cmFjZS5oIGIvdG9vbHMvcGVyZi91dGlsL3J2dHJhY2UuaAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMjRiMzI5NDdmYjRjCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi90b29scy9wZXJmL3V0aWwvcnZ0cmFjZS5oCj4gPiBA
QCAtMCwwICsxLDE4IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
Ki8KPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAyNiBRdWFsY29tbSBUZWNobm9sb2dp
ZXMsIEluYy4KPiA+ICsgKiBBdXRob3I6IE1heXVyZXNoIENoaXRhbGUgPG1heXVyZXNoLmNoaXRh
bGVAb3NzLnF1YWxjb21tLmNvbT4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaWZuZGVmIElOQ0xVREVf
X1VUSUxfUEVSRl9SVlRSQUNFX0hfXwo+ID4gKyNkZWZpbmUgSU5DTFVERV9fVVRJTF9QRVJGX1JW
VFJBQ0VfSF9fCj4gPiArCj4gPiArI2luY2x1ZGUgImRlYnVnLmgiCj4gPiArI2luY2x1ZGUgImF1
eHRyYWNlLmgiCj4gPiArI2luY2x1ZGUgInV0aWwvZXZlbnQuaCIKPiA+ICsjaW5jbHVkZSAidXRp
bC9zZXNzaW9uLmgiCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiA+ICsKPiA+ICsjZGVm
aW5lIFJWVFJBQ0VfQVVYVFJBQ0VfUFJJVl9TSVpFICAgc2l6ZW9mKHU2NCkKPiA+ICsKPiA+ICsj
ZW5kaWYKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
