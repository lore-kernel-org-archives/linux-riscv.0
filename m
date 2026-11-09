Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDC606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mqrEt++f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALf1fyLf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgwn36uj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u/5jDtR6dd58buaiG9OTWf6aczcs6VAzd8UcGECHPsg=; b=mqrEt++fp5BTEZHSLsilVpwMQZ
	R9PiZdsaK5e1i9BzfoWJcxEfL+JT4ZQDpFBPzJsO1m/CvZ51bX/tOYeJcgQJ1agmv0FuiDOTDww4e
	fbhpYBxD4sWjUC5+7rk6DDvND33GokxjA+bLON6N+shqJlNXvRilTuGonYH2VezGdHFRvI/dqvHWc
	XkCXnh2HadcBYuf3SIwPrir/St2kJ4DJB4ReSdls3uqNmzUKogRntQgxRF9qKrqDvgBCgoCiZ+SD2
	6VzMFHP/8epWAgR9+D4LiQPJeQ2Jovutav/y3eB2Kuo9hruZgfbdH+gdb+OPKQayIKDWHAFTQ9pRj
	NGnd2Qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQR3p-000000011RX-1rSi;
	Mon, 09 Nov 2026 15:13:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQR3m-000000011R7-0dg1
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:13:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFSg63589080
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 15:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=; b=ALf1fyLf2FjXdUoU
	6oeeOPdFeB1HyHQDhDkeN8ThA5C1tMT2b6TzcY6eT8wxJD4QoVVhh/M5IZBWRQmm
	ivVbAHAZv0MpvVkNN9khzL2abl1xU3wpzbKGwZQ7+lEtc3vVJyDz/UZ+Sq8AVATI
	o6qeLi08z5O5iqpANWASXnXDpBM11cuZ53nWnxtmoo3JlNYd7t8ViLyDskJgzeWD
	NpihyKfmsSKPJ4E8MZGT4ptrRGxSkVpR93BJlGB7ApdqQBkqpgw/TaRi3yd8Qr4I
	h+gORQZLHTZtFOMn2tTvBg1OvzpMh1QhBWznrWjEnt23FMlDI4lx6Q86OrXaoa9o
	ooxlQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8r7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 15:13:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so935704a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794237204; cv=none;
        d=google.com; s=arc-20260327;
        b=pZE8Q86Ur6fgJ6UJij+IMaTjMrUxtcFMt18esZF9SmHaM7XOrwHoyTvO1svdQkWT6a
         Be8ZH5P3VW1mvgmBrm/XpsulpQkceXJQMvlb0lbfN6Se95BE6iQ384g3rpRQohMEWo0P
         ty9crFKfge9wqoB9rEwq9B293163hFTd6rycdryKtq7g/C4GYZ5ESoFEWJVJ55pVCNrA
         ctcC/hN31z33lbUta+XN1u75HIMzuO8WgaR12kWVwrsXJ4KwoebfHA6G6sTqN+EPwppE
         0mb0NQ/b3Y8cLp3ZZ5p14d4vLtKid1R6ldQguXofGbOGJ5tpxLwR1J/deRI8sUw8cTYM
         maSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        fh=6QrB5T49aUpR1teVC2UI4M2gtWyWcOPQySc7AUKWOCk=;
        b=I+Th755KTU2JO0rDFjHKd8rc0t+mqDVkl3JKSZmyCUExbCLIEvFSmi41YN5jCOeX6K
         rmLAcA7q78AYNdj2S9NrfoqBlqUq6cjzqFJ5M2ka4y5kTvsOMlkk28SfourQx1zDOLPO
         ODeFt2zavNUk2OBOhEFms01lTv9vuK5JZFTciV0mGxpBjgcGShDSXjPhl4pApDD3H1TJ
         GJLCGC2p7x5b6Ms59/ldGvRGz5zMSnFkl6jmLYS0Il5orN0h7luCxAVX+e43tee97IP3
         2QbKve+DjIMn7kfObLIX3/BbZeDlZH7ZOKkXIco8C1D3XFQE0W6oXMhitR1zU5BJyar/
         eX8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237204; x=1794842004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=fgwn36ujrx4IxBFnXbr+71ZGNf9Qk0rXdwxt09cmBWz93Z1XiZG4TzvRAET0ON90RK
         99R0h8ye3DNMN7skTJJSEYCFE/RYFx85rPIpDAWNbEboaRWR+vsUzGf91DFo6QkeuG7g
         oUJ6peC2en/ctR1M/a6o9Hlk5pPG9fYcqCEtLvjmc6Q7QsPerVH657ajmzr8+KMMFeKl
         BRi7cqGaTyo+J2KsmQqVpNWsAN6kW58o1bRnuiECDm2J957WSYCl2bMPdC82WmXVEPPp
         e4ttsT5gtsUS2EhvMG42naP5hN3oBCG7wIxnbPWrODa3Qct2S6u98nz6/6t7NTqqPdGQ
         auWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237204; x=1794842004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=AqDbFPQFzEun8x17RUYxIetJfCdsZ6Gh9rj01VOQ7ThpQxzonPxBRuirINxsSeQZLF
         dCNrriCkoii6Ifjfq+TTlqx3+OitUUCMr6i1X5ONYNv/2M0sOyCKPpySGAum1F26zvlk
         +SBBCF/KWi0zSbstiB63NMlPPajPKizB0DUz4ROtSRMmLDll+m4HP7fb5DAW+o3/28OS
         wEugdLOGmowRxe+S+cl4TEfsqM8HXHwUHy2iGLIyoebhxCogMc7nKlNCuv+lQKae6KJn
         jAUmNrBJMJeNV+oS85ppHBeLmB9iCyGg7bwhiM+2/rvCSDMFc3fL6/ArpqmWWszeyr4b
         3BrA==
X-Forwarded-Encrypted: i=1; AL+hErGcP833p1XT4Q+34nkb1irHFEMYh0ZqKFx+zjKEHrLgawLC0T/qbzGsylMBv4H8prh6aHseS644CBJ+xg==@lists.infradead.org
X-Gm-Message-State: APuU4Z94hGDZD603f3wMkQHQBwtqJHPXrM5a7lKfHcTTDfKVSbpvOsRD
	DfZMSclgJteR67/j+Qfx37/UswuJRdokbiNI4DoKv4bZ7k/zbu2i+WNSK16kCR4c04HcPiuIF0e
	/Jiczy2dpHN5zaHmBo22uc5Rtc5dGOW8nuGoT7PdC3QGWv5qaNK7V9tG+uePG9U6nu9DmeUD3eu
	x3EjfA+0LS+ftG17yZXmx+lu+TvUOtDLHbIR5VTdNZDRgX7w==
X-Gm-Gg: AYBFou3m4+kn7lmwP6TJDYWoo6rEtHO9YFkoK4ZbDjQWFqp/3dcpYq3QDRVUeQGgNaJ
	Zlb0L1EPLFzfmxyQXWbJ8tMtciQytd/fnSXXJDCg48KI8gJOK+Ap6puKZUP4/uuILdFwtUU8v7k
	GhXUuv5zV4dvk+G9aA1SB6l3IM3XFP5Pbk0OGQDY02C6AKzvUU/YMXM9zVdA==
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b12d33ca53mr3640828a91.32.1794237204219;
        Mon, 09 Nov 2026 07:13:24 -0800 (PST)
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id
 98e67ed59e1d1-3b12d33ca53mr3640777a91.32.1794237203488; Mon, 09 Nov 2026
 07:13:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com> <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
In-Reply-To: <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:13:09 +0100
X-Gm-Features: AclHuK-qxobxprSMzZBUYKJj_uyReksqIyxGSuqu40gW9TvUywVmIwdWYsE9eVQ
Message-ID: <CAPx+jO9-fANS=WN74rFz=dFZqE5PQo9gDcqb1A33W5ohEsbevA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: dvfs: Add RPMI performance service bindings
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, rafael@kernel.org,
        viresh.kumar@linaro.org, ulfh@kernel.org, rahul@summations.net,
        anup@brainfault.org, lftan.linux@gmail.com, alex@ghiti.fr,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-GUID: H9AxTUB1HHmjztKt3H1vqDjxf6Ahdg6C
X-Proofpoint-ORIG-GUID: H9AxTUB1HHmjztKt3H1vqDjxf6Ahdg6C
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1e315 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=Bq6zwJu1AAAA:8
 a=TxQ1F8pul8oCGEKA_3AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX9FXJzVDhobdJ
 QVtLqk0xArR3eqlGVeIdwm53SdYlBq0BeQoEi4QmJwzG1l0AYfc0jhYe0EZQs4gJxoti/FWNnZM
 d4QdmFlJItjZX4Alb2pcCgwu8/kQFbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXzVOD8WMERPtx
 JvbEf/qg9vBQvIbgENRM+1y0HsBgmx/R1C1Iir21tKmBq6qNpi1bkXceH7HMTFRt6ytry83PlS3
 e8zYbuUGUhzfWLLcgfu7mHfSZP148ckVm9HmBTdY4wTE9MuhM+MCVmJmd4+h8OtHg8jGxYTTbAJ
 V5C9zarVyeIrWHj5sVJ4x39BnZ3Ir0Ea5VUaZmyEgHNbk4FpGmXpF1x2sXm7O9+vlEXETgLDJDb
 icDO0T/IBkuMvbFURa5+1FDGHXC6YaJqbLtc+xirR/u591uHhEv1N66aeZHSXHkDxmdvAcqQe68
 Z59DWyD3MY5dLPb2NhZWtmDq1vLddmRLx341a/QXq0Jt6VcWqCO5cxzM2sE9WTr8pV4Ag5MyNfN
 /hSIcI3i/la3GmxCX/gIRU8RxndgFOmkpWL3y1+5WFpuC1WPuUiIKwUbrzAsT56/QJGH+aXaThD
 LR8bpauYOpVeNMUpKqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_071326_198050_416BE851 
X-CRM114-Status: GOOD (  26.37  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgOCwgMjAyNiBhdCAxMToxMuKAr0FNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUgUlBNSSBwZXJmb3JtYW5jZSBzZXJ2aWNlIGdyb3VwIGJhc2VkCj4gY29udHJvbGxl
ciBmb3IgdGhlIHN1cGVydmlzb3Igc29mdHdhcmUuCj4KPiBBIENQVSBuYW1lcyBpdHMgcGVyZm9y
bWFuY2UgZG9tYWluIHRocm91Z2ggInBlcmZvcm1hbmNlLWRvbWFpbnMiLiBBbnkKPiBvdGhlciBk
ZXZpY2UgbmFtZXMgaXQgdGhyb3VnaCAicG93ZXItZG9tYWlucyI6IHRoZSBjb250cm9sbGVyIGlz
IGFsc28gYQo+IHBvd2VyIGRvbWFpbiBwcm92aWRlciwgd2l0aCBvbmUgcG93ZXIgZG9tYWluIHBl
ciBwZXJmb3JtYW5jZSBkb21haW4gYW5kCj4gdGhlIGxldmVscyB0aGUgZG9tYWluIGFkdmVydGlz
ZXMgYXMgdGhlIHBlcmZvcm1hbmNlIHN0YXRlcyBvZiB0aGF0Cj4gcG93ZXIgZG9tYWluLgo+Cj4g
VGhlIFJQTUkgcGVyZm9ybWFuY2Ugc2VydmljZSBncm91cCBpcyBkZWZpbmVkIGJ5IHRoZSBSSVND
LVYgUGxhdGZvcm0KPiBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgc3BlY2lmaWNhdGlvbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBZZW9uZyA8am9zaHVhLnllb25nQHN0YXJmaXZldGVj
aC5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kdmZzL3Jpc2N2LHJwbWktcGVyZm9ybWFuY2Uu
eWFtbCB8IDg4ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kdmZzL3Jpc2N2LHJwbWktcGVyZm9ybWFuY2UueWFtbAo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kdmZzL3Jpc2N2LHJwbWktcGVyZm9y
bWFuY2UueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kdmZzL3Jpc2N2
LHJwbWktcGVyZm9ybWFuY2UueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5lYzc4NTZjYjcyNTcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2R2ZnMvcmlzY3YscnBtaS1wZXJmb3JtYW5jZS55YW1s
Cj4gQEAgLTAsMCArMSw4OCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2R2ZnMvcmlzY3YscnBtaS1wZXJmb3JtYW5jZS55YW1s
Iwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPiArCj4gK3RpdGxlOiBSSVNDLVYgUlBNSSBwZXJmb3JtYW5jZSBzZXJ2aWNlIGdyb3VwCj4g
Kwo+ICttYWludGFpbmVyczoKPiArICAtIEpvc2h1YSBZZW9uZyA8am9zaHVhLnllb25nQHN0YXJm
aXZldGVjaC5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRoZSBSSVNDLVYgUGxhdGZv
cm0gTWFuYWdlbWVudCBJbnRlcmZhY2UgKFJQTUkpIFsxXSBkZWZpbmVzIGEgbW9kdWxhciBhbmQK
PiArICBleHRlbnNpYmxlIG1lc3NhZ2luZyBwcm90b2NvbCBmb3IgcGxhdGZvcm0gbWFuYWdlbWVu
dCBmdW5jdGlvbnMuIFRoZSBzdXBlcnZpc29yCj4gKyAgc29mdHdhcmUgY2FuIHNlbmQgYW5kIHJl
Y2VpdmUgUlBNSSBtZXNzYWdlcyB2aWEgU0JJIE1QWFkgZXh0ZW5zaW9uIFsyXQo+ICsgIG9yIHZp
YSBhIGRlZGljYXRlZCBzdXBlcnZpc29yLW1vZGUgUlBNSSB0cmFuc3BvcnQuCj4gKwo+ICsgIFRo
ZSBSUE1JIHNwZWNpZmljYXRpb24gWzFdIGRlZmluZXMgcGVyZm9ybWFuY2Ugc2VydmljZSBncm91
cCAocGVyZm9ybWFuY2UKPiArICBkb21haW4pIGZvciBhY2Nlc3NpbmcgYW5kIGNvbnRyb2xsaW5n
IHBsYXRmb3JtLW1hbmFnZWQgcGVyZm9ybWFuY2UtcmVsYXRlZAo+ICsgIHJlc291cmNlcywgYXMg
aW1wbGVtZW50ZWQgYnkgYSBwbGF0Zm9ybSBtaWNyb2NvbnRyb2xsZXIuIFN1cGVydmlzb3Igc29m
dHdhcmUKPiArICBjYW4gaW50ZXJhY3Qgd2l0aCB0aGUgUlBNSSBwZXJmb3JtYW5jZSBzZXJ2aWNl
IGdyb3VwIHRocm91Z2ggYW4gU0JJIE1QWFkKPiArICBjaGFubmVsIG9yIHRocm91Z2ggYSBkZWRp
Y2F0ZWQgc3VwZXJ2aXNvci1tb2RlIFJQTUkgdHJhbnNwb3J0Lgo+ICsKPiArICBUaGUgbm9kZSBp
cyBhIHBlcmZvcm1hbmNlIGRvbWFpbiBwcm92aWRlci4gQSBDUFUgcmVmZXJlbmNlcyBpdHMgZG9t
YWluCj4gKyAgdGhyb3VnaCB0aGUgZ2VuZXJpYyAicGVyZm9ybWFuY2UtZG9tYWlucyIgcHJvcGVy
dHkgZGVzY3JpYmVkIGluCj4gKyAgZHZmcy9wZXJmb3JtYW5jZS1kb21haW4ueWFtbC4KPiArCj4g
KyAgVGhlIG5vZGUgY2FuIGFsc28gYmUgYSBwb3dlciBkb21haW4gcHJvdmlkZXIsIHdpdGggb25l
IHBvd2VyIGRvbWFpbiBmb3IgZWFjaAo+ICsgIHBlcmZvcm1hbmNlIGRvbWFpbi4gQW55IG90aGVy
IGRldmljZSB0aGF0IHJ1bnMgaW4gb25lIG9mIHRoZSBkb21haW5zCj4gKyAgcmVmZXJlbmNlcyBp
dCB0aHJvdWdoICJwb3dlci1kb21haW5zIiwgYW5kIGVhY2ggbGV2ZWwgdGhlIGRvbWFpbiBhZHZl
cnRpc2VzCj4gKyAgaXMgYSBwZXJmb3JtYW5jZSBzdGF0ZSBvZiB0aGF0IHBvd2VyIGRvbWFpbi4K
Ckl0IHNob3VsZCBiZSBzdWZmaWNpZW50IHRvIHVzZSB0aGUgcG93ZXItZG9tYWluIERUIGJpbmRp
bmcgdG8gZGVzY3JpYmUKYSBwZXJmb3JtYW5jZSBkb21haW4uIFNlZQpEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwgZm9yIG1vcmUKZGV0YWls
cy4KCkZvciBleGFtcGxlLCBhIHBvd2VyLWRvbWFpbiBwcm92aWRlciBub2RlIG1heSBoYXZlIGFu
Cm9wZXJhdGluZy1wb2ludHMtdjIgbm9kZSwgaW5kaWNhdGluZyB0aGF0IGl0IGNhbiBzY2FsZSBw
ZXJmb3JtYW5jZS4KCktpbmQgcmVnYXJkcwpVZmZlCgo+ICsKPiArICBGb3IgZXhhbXBsZSwgd2l0
aCB0aGUgcHJvdmlkZXIgbGFiZWxsZWQgInBlcmZvcm1hbmNlIiwgYSBDUFUgdGhhdCBydW5zIGlu
Cj4gKyAgZG9tYWluIDAgYW5kIGEgZGV2aWNlIHRoYXQgcnVucyBpbiBkb21haW4gMSByZWZlcmVu
Y2UgdGhlaXIgZG9tYWlucyBhczoKPiArCj4gKyAgICBjcHVAMCB7Cj4gKyAgICAgICAgLi4uCj4g
KyAgICAgICAgcGVyZm9ybWFuY2UtZG9tYWlucyA9IDwmcGVyZm9ybWFuY2UgMD47Cj4gKyAgICB9
Owo+ICsKPiArICAgIGdwdUA0MDAwMDAwMCB7Cj4gKyAgICAgICAgLi4uCj4gKyAgICAgICAgcG93
ZXItZG9tYWlucyA9IDwmcGVyZm9ybWFuY2UgMT47Cj4gKyAgICB9Owo+ICsKPiArICA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKyAgUmVmZXJlbmNlcwo+ICsg
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gKyAgWzFd
IFJJU0MtViBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgdjEuMCAob3IgaGln
aGVyKQo+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1p
L3JlbGVhc2VzCj4gKwo+ICsgIFsyXSBSSVNDLVYgU3VwZXJ2aXNvciBCaW5hcnkgSW50ZXJmYWNl
IChTQkkpIHYzLjAgKG9yIGhpZ2hlcikKPiArICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2
LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcwo+ICsKPiArcHJvcGVydGllczoKPiArICBj
b21wYXRpYmxlOgo+ICsgICAgZGVzY3JpcHRpb246Cj4gKyAgICAgIEludGVuZGVkIGZvciB1c2Ug
YnkgdGhlIHN1cGVydmlzb3Igc29mdHdhcmUuCj4gKyAgICBjb25zdDogcmlzY3YscnBtaS1wZXJm
b3JtYW5jZQo+ICsKPiArICBtYm94ZXM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsgICAgZGVzY3Jp
cHRpb246Cj4gKyAgICAgIE1haWxib3ggY2hhbm5lbCBvZiB0aGUgdW5kZXJseWluZyBSUE1JIHRy
YW5zcG9ydCBvciBTQkkgbWVzc2FnZSBwcm94eSBjaGFubmVsLgo+ICsKPiArICAiI3BlcmZvcm1h
bmNlLWRvbWFpbi1jZWxscyI6Cj4gKyAgICBjb25zdDogMQo+ICsKPiArICAiI3Bvd2VyLWRvbWFp
bi1jZWxscyI6Cj4gKyAgICBjb25zdDogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRp
YmxlCj4gKyAgLSBtYm94ZXMKPiArICAtICIjcGVyZm9ybWFuY2UtZG9tYWluLWNlbGxzIgo+ICsK
PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwK
PiArICAgIHJwbWktcGVyZm9ybWFuY2Ugewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3Ys
cnBtaS1wZXJmb3JtYW5jZSI7Cj4gKyAgICAgICAgbWJveGVzID0gPCZtcHh5X21ib3ggMHgxMDAz
IDB4MD47Cj4gKyAgICAgICAgI3BlcmZvcm1hbmNlLWRvbWFpbi1jZWxscyA9IDwweDAxPjsKPiAr
ICAgICAgICAjcG93ZXItZG9tYWluLWNlbGxzID0gPDB4MDE+Owo+ICsgICAgfTsKPiArLi4uCj4g
LS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
