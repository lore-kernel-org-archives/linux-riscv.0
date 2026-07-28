Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68757C53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6v4eMb7kYplDfhG6XgDrarYfhlvdsti2LhSoX9ZgCyQ=; b=vU7x2Xcb2ssp+R
	J6BRKGpLCn5yPYPdx9hjndeEC8a0TBnqtNpqzY0duUoJMQZgjdA2SLU99hjeKWMlLc1QzJLBYlOPp
	sjLH09DKrgbi2KFsOdDz/8Q4ROEh3Bu+4MlTkzmDsUvoiHVALrMgeE7MrjrfgrNEHoyB8Tvl/GY7j
	VaqIVc67v307yUzIi5Rj5yBID88pceFDmo8GfL5sSC8KfWo2cLd0DpFcvrWCBER9g3VSQ6jZjIAKU
	vR1VkiA+xGjFsDHpVlA7KPntjQkgBvMy4wk/vVdP4xUS0BvR7F02dY5H40CITRDoRr7DhOSrbBqwj
	2hVk9g8NBNN0OgCCtxFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohiS-00000005Knd-1UkU;
	Tue, 28 Jul 2026 13:19:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohiP-00000005Kmu-1H2O
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 13:19:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHxR82817895
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=; b=Nv
	UXdXZd9+hB42Fk1exzHMahtIrXNLTWhyNOcrlmRhvPbtCpm3ALUp7tJx+iHwTAm3
	Me19xmPpfwHjXiVHKjbhPg4yY26O0pkGHWYYw/B0LMYmVIhCwVh/wMPByBdqpIu5
	IkZiNEm5ddg++0lomRQvfJ9dh3XtDlj1amSlH8D91oeEoEhoxfk5XH2fgrlQeHcr
	R2eFVQy0PCgAOnxBJ3aVDCL/qSLEkS6nw1TBcH2zImElIT1kes72yrF8MlTVRECj
	VjyqtuLmdj4F4YhZ3mD9fp0SaH0u1ySuIJNgxaXDhTn3rDci6GK1p3zHoKejr3NM
	1NIyuZ+XdTc/Bu0QwH8Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y256f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 13:19:24 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667c0eadf4aso10235136d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 06:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244764; cv=none;
        d=google.com; s=arc-20260327;
        b=NJRZwuvMUvtiLVeiUVv6pB97D293LJZSRbJfwzlNvUFYVvHx8sozMm5oyncL40oGty
         9eoy5A9LwASrfoHzn8+8sKa57tG8LXXJ1sa3/CXaVD7hZRsbr1QZJEr92YQky8y/1llm
         A/4DfE9jhv1beKcBVs6BS3UcxT/gRlUAqt1gnKzA/L5GM85Qh/D4lageQdu0rOstWrFL
         SYmyOQtTTa11gzyZ86TIauBZR5F5T8Xmr6lvjh3JFGgczadU6wg1gYiDs5G3nqeNX/q4
         aiipwEhbD7Jyn0I7bWjKF1bLX+fXBP2EYzA+diqOeNeidg2vXcNtGOp8l0RO3PRElvS9
         iViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        fh=DKdtLYn5I9qfj+L10ec0gDo4d4gH4n8h+5xBJoonBbM=;
        b=kElbthaEmvz0IIYTyqLt+Kik3OeujEyABYYguwUAOveelvTN0JGj0tdMAMIgVVrcGy
         TYgBC/qQRVzZ3qkIaVOh2+F64C32ZRBKOoH9k1Xqv16wyAS2KIaO5EQpMtS9lHBtsgC/
         7GoYoSnNHTZQvX6vNRpk+u/SJ7gRzF1avu7hJL5jdbS4ZWjKe2zqKdIKuhH4KHlpZXZc
         e0EQ5Z1Sci4AuBLPWmuiE4C0hJ5XCBiYL7f9wo0OtQ45zVPBCQX3k7t42+9quJq28k4I
         JDy3ju174VHIyDreN56upCz+VXOhM0FFsSE4q/SwJTqmDwsxKk6qv4VH0oTOZI/eVQ9E
         jkvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785244764; x=1785849564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        b=B7aYpUqZlnC5dFYeroCdYmR0OUy5hcVJaAcKIMcOG8M897mjCKtGWGLG2asH0Di5jF
         H93cwudpMjXo0EAtefOaohB5sY4J2wYV9iWorwdL25h/ijT7aa+z+qpSF9pcmsQrhaxJ
         cPMdDxQGYvwl9PkkYYJ2LfVY3Ksb6rT15BGtA5PWZBjmiKGaVwmAQxGR0x64vafRdF/c
         sdr6MQs8BmBDG0gdwALmodVXUKoNRM/TqnMUUMc7vK9HWPYYr7kSQwkI1ZcjgDpuK1fY
         JCQmAYnBEdxHboBh9Q9IFmIQapqDpcgHpW8Zqnxhb9QkHkAMv/6UFagFiebKLcbzSSAt
         /t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244764; x=1785849564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        b=YzPw1Ibvp71BQFIeTORUHMQknRzbN26BqR4A0Kcv+jfsgMlS8HphuX/MDuQtgIElPZ
         0lI+u5gV4G5IDdJT6CzTugbR92tS6BMLoVqkvZR4bgHKs3LjHcfoXGXONpPF6lCOGZ/k
         E/7e4ZiR1cQTBxWNfvzx0Em3c/SsWPcXA3TZ+KgzbdW9CCoIzCg5ZPDplr1kIXMSrbVp
         jz/8L7eT4Ae4ZIQpGhy0z8/dn9enKAXIK0qvrhs6PyqvOKjJZjujMky9JMNRAWn9oJZB
         6q4Xmh7ApELWIxLWillaI/ZAlqf5Z3FMGr+WSnm635U7JMiTvhEH38HkWPmjfhjW9c6C
         eVag==
X-Forwarded-Encrypted: i=1; AHgh+RqKfHQV96xUqnAH2geOYD4IgYazMz6m1ouZ9FJWihnbZT4f3RGcom8YAHyD1NpxxGENmr3LAOoFDQk90g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmyKkHADMMv0A6sddeSXh85GrTz1aczkMFpUJNBafRQLxcDtMu
	LtnhD6Lwb7eOTVTkiqaucIZboCyqFAKCtKMWJPB+Gp3q+fco4BurrPRdCRmQ66GgvkOke/21JYB
	q0EPlALr2shvcVziw+NBi4iktga6ppiEmgsurVWHzyVlRT2ekPHnGedqcAujL1kYtgRnoa/CBr1
	LqQH8R3ZOtNhe+9xKv64gM/t4RzdpnXpx8ofdfAzcQCYoXAw==
X-Gm-Gg: AR+sD11R8y0symCAF4LDQe0fC8cvTUyJGz7arBTS/QBsA0qhvtivVXPUsQ6TlO6wMsQ
	RuyXPo9zwkpQMNcqGpJNrKHrqFz1QhQpwiKTt/Z8Vl6JVqw1b6/YxhFKIvGnb2fzvC8LP0Jz2sw
	DkhJKoQF57JY+P4u+q2PlPivzid5hklM1gBkpT8itM2uR1vQbEcShLTDcmTQ==
X-Received: by 2002:a05:690e:4849:b0:668:81d:342f with SMTP id 956f58d0204a3-66905809df9mr477883d50.73.1785244763899;
        Tue, 28 Jul 2026 06:19:23 -0700 (PDT)
X-Received: by 2002:a05:690e:4849:b0:668:81d:342f with SMTP id
 956f58d0204a3-66905809df9mr477865d50.73.1785244763406; Tue, 28 Jul 2026
 06:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
 <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
In-Reply-To: <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:49:11 +0530
X-Gm-Features: AUfX_mzeOeCPWWFFch2ozJZGQHNRh9Ub0Dz-7Jpvn5Ws_eaBKb5S0K8D3nqJKts
Message-ID: <CAB19ukHpFS-=nK6Tfjk-nY_Jz7Pi82pE4-YQkfQqoBXekOLtuw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: acpi: Handle LPI architectural context loss flags
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
        Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
        stable@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a68ac5c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=yZKCaVM-5Wx_WF_-bDkA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=FO4_E8m0qiDe52t0p3_H:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExOCBTYWx0ZWRfX7Sx4j+iecSnr
 SLgdGS/xAuBAzo8l8f16S1o/U5mbvEvGVk0AOlf7lvEOaNTARb9FH/2mI9J2yHD5iuFzXVZn+C+
 mpdztEMWUnf77tGhMdQu9P2qZZ2S/60=
X-Proofpoint-ORIG-GUID: omkOSfQ98j15cWN8mSWydB65YsPxjCIl
X-Proofpoint-GUID: omkOSfQ98j15cWN8mSWydB65YsPxjCIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExOCBTYWx0ZWRfXyfGwvlQoGnAI
 tEDmUnydajwhyy4k3PJ8zi4XHQWBT3FwJx3rQPlbGOM7vxR248jt+11Md7khH80i/q+Ny+/rQmr
 8ZVc0LZKsfvfQ8fICYdHTxte9FlwMhmB7g9mJouvmscbO3SIM191c7hEYpEGgI0HVFJjtHN1k9O
 vs6JaiqmwlAV/2xT7Ri36zXrY1CycLr7fjSsyZNjTyEuHLObl0gFsWs/qUw0M0z4VaBiCxOC+wu
 EUr/yGTpEE6RpsQZp6pU9Zt2PhOZqsgqcEheV3p/Xd/zVS7R74lvj8tQhykYuHJnjkGhtE1oAaE
 ys6wRSZ3jOZvB81hMRif0zshXX1af/pkeEUeSt6YfcBAcELUqB3+PRl5UEavl3ifB8zKBpoIYO/
 sWOHvLLg6c5feIj73vPc+IN1kUyOeDd7GNlEQ6mx+btqwpDtcnPlhm73uSjwu5iXDQPW7imdVmP
 4z84GO8y52L8hYk3f3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_061925_462130_B49F5B80 
X-CRM114-Status: GOOD (  24.65  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgNjoyNOKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEBvc3Mu
cXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDI4LCAyMDI2IGF0IDU6MjTigK9Q
TSBQZWl4aW4gWGllCj4gPHBlaXhpbi54aWVAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPiA+
Cj4gPiBDb21taXQgNDc4NWFhODAyODUzICgiY3B1aWRsZSwgQUNQSTogRXZhbHVhdGUgTFBJIGFy
Y2hfZmxhZ3MgZm9yCj4gPiBicm9hZGNhc3QgdGltZXIiKSByZXBsYWNlZCB0aGUgZ2VuZXJpYyBu
b256ZXJvIGNoZWNrIGZvciBMUEkKPiA+IGFyY2hpdGVjdHVyYWwgY29udGV4dCBsb3NzIGZsYWdz
IHdpdGggYXJjaF9nZXRfaWRsZV9zdGF0ZV9mbGFncygpLgo+ID4gUklTQy1WIGRvZXMgbm90IGlt
cGxlbWVudCB0aGUgaGVscGVyLCBzbyBpdCBmYWxscyBiYWNrIHRvIHRoZSBzdHViCj4gPiB0aGF0
IHJldHVybnMgMC4gQ29uc2VxdWVudGx5LCBDUFVJRExFX0ZMQUdfVElNRVJfU1RPUCBpcyBub3Qg
c2V0IHdoZW4KPiA+IGFuIExQSSBzdGF0ZSBsb3NlcyB0aGUgaGFydCB0aW1lciBjb250ZXh0LCBw
cmV2ZW50aW5nIGNwdWlkbGUgZnJvbQo+ID4gdXNpbmcgYSBicm9hZGNhc3QgdGltZXIgZm9yIHRo
YXQgc3RhdGUuCj4gPgo+ID4gSW1wbGVtZW50IHRoZSBSSVNDLVYgaGVscGVyIGFuZCBtYXAgdGhl
IGhhcnQgdGltZXIgY29udGV4dCBsb3NzIGZsYWcKPiA+IHRvIENQVUlETEVfRkxBR19USU1FUl9T
VE9QLgo+ID4KPiA+IEZpeGVzOiA0Nzg1YWE4MDI4NTMgKCJjcHVpZGxlLCBBQ1BJOiBFdmFsdWF0
ZSBMUEkgYXJjaF9mbGFncyBmb3IgYnJvYWRjYXN0IHRpbWVyIikKPiA+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gPiBBY2tlZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAa2Vy
bmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4KPiA+
IFNpZ25lZC1vZmYtYnk6IFBlaXhpbiBYaWUgPHBlaXhpbi54aWVAbGludXguc3BhY2VtaXQuY29t
Pgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBDb3JyZWN0IHRoZSBGRkggc3BlY2lm
aWNhdGlvbiByZWZlcmVuY2UgdG8gQ2hhcHRlciAyLjEuMS4yLAo+ID4gICBUYWJsZSAzLCBhcyBz
dWdnZXN0ZWQgYnkgWWl4dW4uCj4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI2MDcyOC1yaXNjdi1hY3BpLWxwaS10aW1lci12MS0xLWM3MjJiY2UwMWU0OEBsaW51
eC5zcGFjZW1pdC5jb20KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5o
IHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmgKPiA+IGluZGV4IDI2YWIzN2MxNzFiYy4u
MjY0M2UyOGZjMDhjIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3Bp
LmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gPiBAQCAtMTIsNiAr
MTIsOCBAQAo+ID4gICNpZm5kZWYgX0FTTV9BQ1BJX0gKPiA+ICAjZGVmaW5lIF9BU01fQUNQSV9I
Cj4gPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9jcHVpZGxlLmg+Cj4gPiArCj4gPiAgLyogQmFzaWMg
Y29uZmlndXJhdGlvbiBmb3IgQUNQSSAqLwo+ID4gICNpZmRlZiBDT05GSUdfQUNQSQo+ID4KPiA+
IEBAIC02Nyw2ICs2OSwyMyBAQCBpbnQgYWNwaV9nZXRfcmlzY3ZfaXNhKHN0cnVjdCBhY3BpX3Rh
YmxlX2hlYWRlciAqdGFibGUsCj4gPgo+ID4gIHZvaWQgYWNwaV9nZXRfY2JvX2Jsb2NrX3NpemUo
c3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZSwgdTMyICpjYm9tX3NpemUsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiAqY2Jvel9zaXplLCB1MzIgKmNib3Bfc2l6ZSk7
Cj4gPiArCj4gPiArLyoKPiA+ICsgKiBSSVNDLVYgRnVuY3Rpb25hbCBGaXhlZCBIYXJkd2FyZSBT
cGVjaWZpY2F0aW9uIFZlcnNpb24gdjEuMC4xLAo+ID4gKyAqIENoYXB0ZXIgMi4xLjEuMi4gQXJj
aC4gQ29udGV4dCBMb3N0IEZsYWdzLCBUYWJsZSAzCj4gPgo+IElzbid0IGl0IENoYXB0ZXIgMy4x
LjIsIFRhYmxlIDQ/Cj4KSXQgYXBwZWFycyB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHRoZSBIVE1M
IHZlcnNpb24gcmVnYXJkaW5nIHRoZQpjaGFwdGVyIG51bWJlcmluZy4gSSBoYXZlIHJlcG9ydGVk
IHRoaXMgdG8gdGhlIGRvY3VtZW50YXRpb24gdGVhbS4gSW4KdGhlIG1lYW50aW1lLCBJIHJlY29t
bWVuZCB1c2luZyB0aGUgUERGIHZlcnNpb24gYXMgdGhlIHJlZmVyZW5jZSBmb3IKYW55IGNpdGF0
aW9ucy4KClRoYW5rcywKU3VuaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
