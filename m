Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E192EF55429
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojbQ71oMid6/WD/FK5y65GU4XM8BkbNUm9pxiEE8xPM=; b=p6FZxfKLvI40Tr
	+9djN789heWY5u32mx7+2Mcsi5kIMYYknGBgeYn6FAUdfYZSverrTIVPJ+XO2q59mGezKPUT+yFJJ
	jBDUIAoC/heaa0oW5QN3nH1MeuQVzYc/ax4+XWknoPeaPp0MQM58yzfPJ2ravr07vbDJhUpvFaTLt
	WF2tqDic1sWPHsXyrI6dMq4weMXprVx2pBiyXE33leRcggEOLqHSR2OKLZxMEN/h6rN+6Y2vp5mAZ
	kNwpBHl/tH8SskwBE7nEo4IJXuwPl6WNeEf8XNDunq0qKnOSE7OtwdnVrarljGGNa9WlSRboEpe5S
	FvVls+089yv1yB9ZJ+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Sj-00000002uDF-2tIq;
	Tue, 24 Feb 2026 23:05:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Sg-00000002uCP-2gtZ
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 23:05:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OH2WKA3660155
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=; b=WGrIRmAPJnxWctHU
	NMzIyty/ExrDpLaWDqBLricPM0MQR8UtQ/S0GgyGKLbZoTyZ07OK1kiy3Ve88Hjq
	RDJonpzl3tL9oh3OeIVe3KTkD/pceWV6ICc5We/nrhaIvO0ibkvZWAie1lAp9UQS
	VVvWaGbD88aPAIGPZBUuZY+AqqmLq3fdBgZUWkyIwiZyVlvjpibRlUxdSM1X+WQ+
	eeodAKOalWvGX+yFXaGtATXNKjHC4NHPb3k+hgMtBaGC5lCGClTiMN4YB3DiWJG5
	1+By5hA0uJ3oz9u3GDX+oe5MUXULiIfSkGne04X7uxQOZEWKt4WopyB2qcljAoI0
	MLrd3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1s96pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:05:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124a95b6f61so21457319c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 15:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771974301; x=1772579101; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=;
        b=OLjhiBQmQmJACCUMdE18YeC5S+DCjCLDWzMSfWrdaf88zlhzo5ZIenYj7a/33P5OKM
         RNl2UgQl6e1JowK/cB1r0g14A5AfZBbTXduCvYWUI19vMtRRkzA4G4rHHQazcYkAfg8w
         o4d4dZJdmLI397PTc6fnq0YhAvBog+LC6MpmBDIwZeDERErLyHAn0FdymqKVkR1okopr
         fBkbqHw0H/JW36agRHIR88+s1tAG7geiLzaKzGilNc/U64PuyQSP35js4I4RxnyiRPGt
         mCH1kjKgAaGBDwPExcs0ZjowVllskTDvX/UtIl1feiyTKmQeElDCG/H1Aw1oOCDY1Ijp
         rRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974301; x=1772579101;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rjQwK1qKjDzMCdZLz5Cguq1yBjxCkVTfteQMsWX41Y=;
        b=sbDesP5tet/T8MLgvjmkkYQu/OObkuq/QLiOYyToW/2g3be/NfxTSBOWNvpdbLvBNI
         LaSp+VUjlCMvHbG547AwXe4rAn72MDAnwBQlDDFFioTVVq1ivr30CfVvacD9WfDHQpu4
         Bg5GgLojA6dH/lQH0hgFjEE6o4vBuWVJsDbqmwUOK4+SkAQr7FlIn3FJ23v7OzR2mRNt
         gSoV3XDi1+2SYTYfN7KRJk4KjTr93tiVu8wdbg2vMHICNBOME+7gBm2LGVm/5Xuidy9F
         sYT1V2OaUXhkXyFdER84lfwMS9CzFp4ZLfxsGfVR2AoDi+4VO/uzJVC5pALUA7j9Rl2f
         pStw==
X-Forwarded-Encrypted: i=1; AJvYcCVpOc8L9cQewO0tLvCEhKSZ3Aihu27rBZ3oU4/dqxc3kwzg2Y5sg+GcRpkOdc0fxBeS134X58yTI81tLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVppGrSsQrEdx/SAgIQQ3dBiiI2/OWXdLh+Q30FScgFX1zrOn0
	3YJQti70KwN3uqwxxBAnDfbfnc+cyQYQTs+TWGcj7VCrSrmZld/wBQsR9pePdR6UBkxfVUJKPbX
	8PZOFTSg5ig06NakYBiM5wPAYZ6DG+uXVJ229bap+Dfai+z4CynxxWnjTykFrKlGrDB2gpj0=
X-Gm-Gg: ATEYQzyMWc60kp9opxcEuaJ3u4lyKN6rfGHotfVonFqH7OYcxNoVYpfhs4IXfERTn1v
	o/ACZNB+oFLU55ktm+SKZIWSjOvYtuJKUPLrsC1B/IRJkZeXzxDJyty6kKYrsAE0sn3h7lHN0/M
	EEttbAeLkptbn3KWWckbgxfxYtxdmYqlYMTxJoCJKZiLf8kFBuX4iNrzEUqAU4715lczoWCTy9b
	SoTk85hnJEQAuqtKg0yiqvOGGGMyFVKnU4HgXANZxo3nBTWGfgGWErjE5WnSM4MbxThguZ1nlFL
	IkHPIMkHREUbPsMn+mNMCn5IhTNboTKqfDfSwSJ40J6YPvow7gQNkS+8/T3zzFoNIjNPwv3Ba2J
	7aiuw0eWmsRxKyeREsiBxmqit0xUMqYs=
X-Received: by 2002:a05:7022:2482:b0:119:e56b:c75b with SMTP id a92af1059eb24-1276ad356acmr6183542c88.32.1771974301062;
        Tue, 24 Feb 2026 15:05:01 -0800 (PST)
X-Received: by 2002:a05:7022:2482:b0:119:e56b:c75b with SMTP id a92af1059eb24-1276ad356acmr6183525c88.32.1771974300533;
        Tue, 24 Feb 2026 15:05:00 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm11691070c88.10.2026.02.24.15.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:04:59 -0800 (PST)
Date: Tue, 24 Feb 2026 17:04:56 -0600
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
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699e2e9d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1k2Rzbposw6HX_UEYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ADnvDI57fZRh-taLtuQq-hMoOQ_etBv2
X-Proofpoint-ORIG-GUID: ADnvDI57fZRh-taLtuQq-hMoOQ_etBv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwNCBTYWx0ZWRfX/77vbw+XzpeO
 3onC5ix5gESBBPcomEfNEGNfEB24sNsgI+48Ta5UfQTkAdN4fJFkuePSUfwdf82KMPFv/wSXX8j
 8pzIeherZ6yTyTrygnAPtQOosl4Ko5xg7X1ZTQVDN4ng0rata0px1800r9FwBZaXCmM9M9Fvk48
 NYF5J6NvLPpvuuJm628U19hc3ZN3cF+kblgzUUuCouUn1456IqcUgRv5Z0rF5QhelbL40urZwqW
 sIT7xURsTXPAyblFyI4rPtyd/kMiymLOz7M4cPn2CZZjWLwFgvWrByfZMQbMHe8jWTMvSzzOb6y
 rJey067e2Thuz0E1W2DpJ3wBvlNUXhDm1S6gEcgn5p8JJY+5JsbpITBlYT0kViWBj2x8EqcYkR5
 tOIUui6oZFMUi/RVkcofFYb2xoOnpE4dmmlggjBNq79255I1i6azmC9WttKf5iU8EKzjOej11fv
 EcK7J4apJ2htrChoNOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_150502_705969_321E00C9 
X-CRM114-Status: GOOD (  25.23  )
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

T24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMDY6NDk6MThQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBIaSwgRHJldwo+IAo+IE9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEFuZHJl
dyBKb25lcwo+IDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
QWRkIEIgdG8gaHdjYXAgYW5kIGVuc3VyZSB3aGVuIEIgaXMgcHJlc2VudCB0aGF0IFpiYSwgWmJi
LCBhbmQgWmJzCj4gPiBhcmUgYWxsIHNldC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgfCAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvdWFwaS9hc20vaHdjYXAuaCB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYyAgICAgIHwgOCArKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+IAo+IEkgc2F3IHlvdSBjaG9zZSBub3QgdG8gYWRkIEIgdG8gaHdwcm9iZSBpbiB0aGlz
IHNlcmllcywgcGVyCj4geW91ciByZXZpZXcgb2YgbXkgcGF0Y2ggWzFdLiBJIGhhdmUgYSBkaWZm
ZXJlbnQgb3Bpbmlvbi4KPiAKPiBBcyB5b3Ugc2FpZCwgRkQsIEMsIGFuZCBWIGFyZSBhbGwgZXhw
b3J0ZWQgdGhyb3VnaCBib3RoIGh3Y2FwCj4gYW5kIGh3cHJvYmUuIEFkZGluZyBCIHRvIGh3cHJv
YmUgdG9vIGtlZXBzIHRoaW5ncyBjb25zaXN0ZW50LAo+IHVzZXJzIGNhbiBxdWVyeSBhbGwgdGhl
IHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBmcm9tIG9uZQo+IGludGVyZmFjZSB3aXRob3V0IG5l
ZWRpbmcgdG8ga25vdyB0aGF0IEIgaXMgbWlzc2luZyBpbiBod3Byb2JlCj4gYW5kIHRoYXQgdGhl
eSdkIGhhdmUgdG8gY2hlY2sgWmJhL1piYi9aYnMgdG8gaW5mZXIgQiBzdXBwb3J0Lgo+IAo+IFJl
bHlpbmcgb24gdGhlIHJ2YTIzdTY0IGJhc2UgYml0IHRvIGltcGx5IEIgYWxzbyBkb2Vzbid0IGNv
dmVyCj4gY2hpcHMgdGhhdCBpbXBsZW1lbnQgQiB3aXRob3V0IGJlaW5nIHJ2YTIzdTY0IGNvbXBs
aWFudC4gRWcuIG15Cj4gcGF0Y2hzZXQgWzJdIGFkZHMgc3VwcG9ydCBmb3IgZXhpc3RpbmcgKG5v
bi1ydmEyM3U2NCkgU29Dcy4KPgoKSSB0aGluayB3ZSBuZWVkIHRvIGNvbWUgdXAgd2l0aCBzb21l
IHNvcnQgb2YgcG9saWN5IGFzIHRvIHdoYXQgZ29lcyB0bwpod3Byb2JlIGFuZCB3aGF0IGRvZXNu
J3QuIElNTywgaHdjYXAgaXMgZWFzeS4gSWYgUklTQy1WIGRlZmluZXMgYSBzaW5nbGUKbGV0dGVy
IGV4dGVuc2lvbiwgc3VjaCBhcyBWIG9yIEIsIHRoZW4gd2Ugc2hvdWxkIGFkZCBpdCB0byBod2Nh
cC4gSG93ZXZlciwKZm9yIGh3cHJvYmUsIHdlIGNhbiBnbyB0d28gd2F5czoKCiAxLiBBZGQgZXZl
cnkgZXh0ZW5zaW9uLCBpbmNsdWRpbmcgJ2J1bmRsZScgZXh0ZW5zaW9ucywgd2hpY2ggYXJlIG5v
dGhpbmcKIG1vcmUgdGhhbiBhbiBhbGlhcyBmb3IgYSBjb2xsZWN0aW9uIG9mIGV4dGVuc2lvbnMu
IFRoaXMgaW5jbHVkZXMgc2luZ2xlCiBsZXR0ZXIgYnVuZGxlIGV4dGVuc2lvbnMgbGlrZSBCLgoK
IDIuIEFkZCBvbmx5IHVuaXF1ZSBleHRlbnNpb25zLCBpLmUuIG5vIHB1cmVseSBidW5kbGUgZXh0
ZW5zaW9ucyBnZXQKIGFkZGVkLgoKSWYgd2UgZ28gd2l0aCAoMiksIHRoZW4gdXNlcnNwYWNlIHdp
bGwgbmVlZCB0byB1c2UgdGhlIGJhc2UgYmVoYXZpb3JzCihwcm9maWxlcykgaW4gb3JkZXIgdG8g
Z2V0IGFueSBzb3J0IG9mIGJ1bmRsaW5nLCBidXQgSSB0aGluayBtb3N0IHBlb3BsZQphZ3JlZSB0
aGF0IHVzZXJzcGFjZSB3aWxsIHRhcmdldCBwcm9maWxlcywgc28gKDIpIHNlZW1zIHN1ZmZpY2ll
bnQuIEknbQpub3Qgc3VyZSBhYm91dCBhcHBsaWNhdGlvbnMgdGhhdCB3b24ndCB0YXJnZXQgcHJv
ZmlsZXMgYnV0IHdpbGwgd2FudCB0bwpjaGVjayBmb3IgYnVuZGxlIGV4dGVuc2lvbnMgcmF0aGVy
IHRoYW4gaW5kaXZpZHVhbCBleHRlbnNpb25zLiBTaG91bGQgd2UKdGFrZSBvbiB0aGUgbWFpbnRl
bmFuY2UgYnVyZGVuIG9mIGFkZGluZyBlYWNoIGJ1bmRsZSBleHRlbnNpb24gdG8gaHdwcm9iZQpm
b3IgdGhvc2U/IEluIHBhcnRpY3VsYXIsIEknbSBub3Qgc3VyZSBhYm91dCBCLCBiZWNhdXNlIGl0
J3MgYWxyZWFkeQphdmFpbGFibGUgaW5kZXBlbmRlbnRseSBvZiBhIGJhc2UgYmVoYXZpb3IgKHBy
b2ZpbGUpIHRocm91Z2ggaHdjYXAuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
