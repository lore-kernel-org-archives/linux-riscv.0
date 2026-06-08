Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D4CD6E79
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEb0tFvZAI7g9/5xm+tiehnoH6Jn0cLXvV0wACVjwnI=; b=zOblk7AuG0Azdu
	IHW5AkV2iK8rs/M3Jj622+/4NxO0INe/NYt+nRXJfyxR4vAjFFVXFxkvQYwJOOHOONL6aXHZMzWI5
	5i+k6u4oqcZ21yzeaCY8arJUKbYOe1dd+yElLLUm1rBYIqdf/SHmGwnczXBdoCHAF4SBLjnGuzhs6
	XzM/jG1CtOJw3ddYdJzptGkkCJhukrh8zMFn0GPsJlvBO85/oZYyUX3dqVRGqi9coEXe04JkSzgXC
	yvoxh+e0CjF5XJZxCO3MUf/+3CFViZhAMC7nsCy9YIrvqmskRiT7uYp0fUokK0DdbEv3yNdNha6KY
	J0cUqxc86MX9dEf/QcVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcmL-000000043as-0yiD;
	Mon, 08 Jun 2026 16:24:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcmJ-000000043Zz-1KcA
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 16:24:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFx923525621
	for <linux-riscv@lists.infradead.org>; Mon, 8 Jun 2026 16:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=; b=CI
	oqh3I7IcyG/H02/RR9QY59roYBIBZCHhjF20nryzSkdGX9jFL1GYb5ZWrxtoNBNz
	P6gJKZcqLfYkRev1cXr/PJPRFcjxAED0USSsoam8+QonnPfDW1e4ruqcOe6Hw5/W
	7SPF7k0BTM+Hy2ZlbB/sekwRDyNPZCNjZpGEPJNr57AwW8djS4RrpTAQrPEZH0Xm
	NNgJUEvFgqCjNOYiuiJOet+bM7/RrUL+YoMQEi16G0mMaXUsRAtwntl3L1YRjoTh
	k30l132C1F26TWS6ladsXlcxx1wa2x8SEHioDW5H1JYYLQ4Fr0cHgZQg7Xj3nk/q
	Fcyn+p0Jc1Krn1Yq0K6A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkt1yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 16:24:41 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-660555be5a0so6921548d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 09:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780935881; cv=none;
        d=google.com; s=arc-20240605;
        b=jIOfcv5lGy3VDjLywzdSuJU/uwfZpNLL5n5oX1GsKKon03O4XGg08uHwroCesMXhHx
         jPChciKWQ44F3eZDYIgiXuraHEZTqluWxcJM0+0Nq3syYFiCgTCyq2ddutETSPJ4D4d/
         DIi/V+jGD5lgnByUiZ6gYefiD8j5GMp3rWOgyXlAsME+Qihn6/JmJcROB7m/7dhOq7Zm
         w6HDa+lvZ0VIHS28mz3eL6tULKkqsf70ArJrvGiizzbypICqTeg9mxaCyJ21gdknJmLv
         +DHgxGpfGhrNVICxU7wfSGr+KQYmyjHyCiOYK2ECae3YlNVOiYiHmWGE4aLdntH8rLW4
         UcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        fh=49G+olHr9Ys7fOh/xk0YSWpw4YvRqCC0MpKlOvsNQ9c=;
        b=cNetg/9KNjDyK4jMmqe/M3JLXehNV0EkATYRy5j31JH6clxsS4Xzy4fsZDqsyJyuS6
         y0wuI9ut/LQtxvc/1wrNUPazCwNHikcwyqtxA2QSca2xu+ATB6qQY/7+EhIv83yviXg+
         BxrTt/Wz8tMYHNqW0RGJbeNTbI9udflrs9PxbmONDXC3IvcMdB5fleePyvn8aeKyfZ93
         8tKAgkPknGvdv5x6GbJg6wyK8upP98IVjtkDdpM3HDivyL8eJ8h3KxZuj8rs0WxGVTsZ
         aQd1FyjAVuvfz4zQ13l2Z35lAEQUi5W3EqkO6Wi6RvQtg004EwUs8Hb//wGNMdu17Ufh
         NBrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780935881; x=1781540681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=InWCZs6Ejfo+sFKb1z594HGNhy9P+pjkOsZFarmTqNKwhDhmDX0oEnl0vXJyFhllLA
         yS0DSbsmWhatUPkRpmdrzmq7QDCN8zKr/74o/szh7GwKwbRYgvx7yBJsRngObkkBnI3p
         es0C9CU6DNzHcPzHhXY4BUj8Mt+Lw9X423crdTWbj8bEmH9Hk+o9So7ryEeQgHHSm1Rj
         lcfuswQ8mbw3YwiRr4EP7AcMNd478mVdR3KiD4PzoQN401+GQBm0EqurrQlqRof2qWbd
         9FlOWgP47TbUgp+VwUOjIKsa4dayuf7Xo189fToMoyMceRyydUt0Th/sYgCaBCXa8tQh
         8tuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935881; x=1781540681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omE+o90JVMH1c7abLG/VTyLnn33GZG5/r9bSbPT2L6M=;
        b=iYX3hfUoA2Rfk/P7kT//4kzFRoPLtO1vYTALnujgJl+Mv4c56+hQcIzEcT/YmDOBkL
         uroEwxQDC3a+Q+axA1pMUByTnq8CfYorPPuEbZWj+NPTuxtIV84aTZNLXsOoIDjf5RjH
         INUADwxiCE7Hagkx7tSVqQjF+dxFyylx6YVa5EZV0ijCDXWfRbxt8lxcpwirgYM5VT81
         pqHDrCduUA3oIjOHnl5BUP9sEaiyL835Bc4jICS99JJA+S4clsQQksek1MPp3ObYzASk
         qozoXoLR2zHXHEdJ4/MEONY4DCn/BI6TA6i1Yp3H0aXFffC4Vy5iu+0FMcpe9AObGakT
         W7aA==
X-Forwarded-Encrypted: i=1; AFNElJ8BRrGobY2cvuSExu3ZIKTE9uQMsgMTGYwocB/f6WYKvcwECqd0EwKhhQwlo48mWWvoqyHBkUrV7TYiCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPn6fRVBKwZCjskLFVHQDj8CIITOQh2owzyfCdy8JXlni78aHb
	vNuMwtHzuYsLC6N2Ubenlp8TBlwwFYVxJ8vIT/wf2BYBnxSGpFs+pBQ5c2dIraKAk+S0BGta6b6
	rzBKsCkxPzn2V+wfyNJUMh8AtP+xzb013ArvyCdC9Lnl833j5tdRqD05xHDox2Kd8+BryL4/qUV
	3z2cj33hakoIZU3RL5ydA2U1+0pOEhX1zslV4CY1qSJBlWRA==
X-Gm-Gg: Acq92OFoN0olbOiWy3LuUBMQ4fRIp074RewQWkBE2xS0l/xexS3Yo7SPBtz7jeclH06
	SptcJZuUf/GMXAAReeMEP0AIU65altZiG2ajJbvWpc2Us/Ogyg4l8sLiiVwhsz9vzR6RLBYOAHD
	TusAjcAOyAAlryNGfUplrc8NPjF3UMGwuZzir5X271nnM+jgG9HNvFpRpfwZ8wh4rtlbAYHVm5+
	75xTgIPlYO0fknAnw==
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id 956f58d0204a3-66106f6a47bmr10491405d50.54.1780935880721;
        Mon, 08 Jun 2026 09:24:40 -0700 (PDT)
X-Received: by 2002:a53:c5c3:0:b0:65e:48cd:7fd2 with SMTP id
 956f58d0204a3-66106f6a47bmr10491371d50.54.1780935880148; Mon, 08 Jun 2026
 09:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 21:54:28 +0530
X-Gm-Features: AVVi8Cd5IwkMkDgaeTWHmXts8_fu2m7CAyoGep37i45EZYnSM24rOUfn-o0eV7g
Message-ID: <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop termination
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Proofpoint-ORIG-GUID: T7bC-MMxLA9TKuXdkMvS-ZJDIDmxJP7z
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26ecc9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8
 a=66Rqm3UGZClwUuHIDRgA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: T7bC-MMxLA9TKuXdkMvS-ZJDIDmxJP7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE1NSBTYWx0ZWRfX7u+qn8OLHyJ7
 9zA/w9diVj4xr5JW3mGbDAUK7mjC8b/k02fuutGp+7iLGDZ+//W+uR9ZAbkoHTocpE4S+G4Qucv
 ER/w+hxwqBBFDpHybXq5aGOLD+oHtlQ8ZfDl9+rdFlbibrn0mUf84UeKaek9ffcWAJQE1K2k6ew
 K9BwdNUUkCo/ZrQ38KUkdwfkegAfpkHyd5XGX8+91Kqx8QnlQ84fmCLOYrI0dtsf7NOKuYwsvrv
 zfSIB3AGSuUCinThj4bGgPBDfFagv8np26aXu5ovipBdyc12WF06Es+x6AXjsBKo852lD846Zi/
 fS5RWbsWjraBQxQ9mk9rKgSdQ0o/mPKHh7G4ESW9NcKaBwHnMq8yrrC2Kvm+qMVvAwduvLXI7Ft
 lSNqBDqdFptOrmNavNxcIViw3C9f20G4j1UlvRInL+xHqGnU9yOYeVZzgcbaz574lCOQIGUXrjM
 qoVLlQbOuHW24T5s79g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092443_354525_11CF132B 
X-CRM114-Status: GOOD (  23.39  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTG9yZW56bywKCk9uIFdlZCwgSnVuIDMsIDIwMjYgYXQgMTo1MeKAr1BNIExvcmVuem8gUGll
cmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW4gcmlzY3ZfYWNwaV9h
ZGRfaXJxX2RlcCgpIHRoZSBtYWluIGxvb3AgY29uZGl0aW9uIHdvdWxkIGN1cnJlbnRseSBzdG9w
Cj4gdGhlIGxvb3AgaWYgYW4gaW50ZXJydXB0IGRlc2NyaXB0b3IgY29udGFpbnMgYW4gaW50ZXJy
dXB0IGZvciB3aGljaCB0aGUKPiByZXNwZWN0aXZlIEdTSSBoYW5kbGUgaXMgTlVMTCwgd2hpY2gg
aXMgbm90IGNvcnJlY3QgYmVjYXVzZSBzdWJzZXF1ZW50Cj4gaW50ZXJydXB0cyBpbiB0aGUgaW50
ZXJydXB0IGRlc2NyaXB0b3IgbWlnaHQgc3RpbGwgaGF2ZSBhIEdTSSBkZXBlbmRlbmN5Cj4gdGhh
dCBtdXN0IG5vdCBiZSBza2lwcGVkLgo+Cj4gUmV3b3JrIHJpc2N2X2FjcGlfYWRkX2lycV9kZXAo
KSBhbmQgdGhlIHJpc2N2X2FjcGlfaXJxX2dldF9kZXAoKSBjYWxsIGNoYWluCj4gdG8gZml4IGl0
IC0gYnkgbm90IGZvcmNpbmcgdGhlIGxvb3AgdG8gc3RvcCBpbiBvcmRlciB0byBndWFyYW50ZWUK
PiBkZXBlbmRlbmN5IGRldGVjdGlvbiBmb3IgYWxsIHRoZSBpbnRlcnJ1cHQgZW50cmllcyBpbiB0
aGUgQ1JTIGRlc2NyaXB0b3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFBpZXJhbGlzaSA8
bHBpZXJhbGlzaUBrZXJuZWwub3JnPgo+IENjOiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxA
a2VybmVsLm9yZz4KPiBDYzogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYyB8IDEwICsrKysrKy0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMgYi9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMKPiBp
bmRleCA5Yjg4ZDA5OTNlODguLmNkODNjMzAzNWNmNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Fj
cGkvcmlzY3YvaXJxLmMKPiArKysgYi9kcml2ZXJzL2FjcGkvcmlzY3YvaXJxLmMKPiBAQCAtMjk5
LDYgKzI5OSw3IEBAIHN0YXRpYyBhY3BpX3N0YXR1cyByaXNjdl9hY3BpX2lycV9nZXRfcGFyZW50
KHN0cnVjdCBhY3BpX3Jlc291cmNlICphcmVzLCB2b2lkICpjCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIEFFX09LOwo+Cj4gICAgICAgICAgICAgICAgIGN0eC0+aGFuZGxlID0gcmlz
Y3ZfYWNwaV9nZXRfZ3NpX2hhbmRsZShlaXJxLT5pbnRlcnJ1cHRzW2N0eC0+aW5kZXhdKTsKPiAr
ICAgICAgICAgICAgICAgY3R4LT5yYyA9IDA7Cj4gICAgICAgICAgICAgICAgIHJldHVybiBBRV9D
VFJMX1RFUk1JTkFURTsKPiAgICAgICAgIH0KPgo+IEBAIC0zMTQsMTAgKzMxNSw4IEBAIHN0YXRp
YyBpbnQgcmlzY3ZfYWNwaV9pcnFfZ2V0X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUsIHVuc2lnbmVk
IGludCBpbmRleCwgYWNwaV9oCj4KPiAgICAgICAgIGFjcGlfd2Fsa19yZXNvdXJjZXMoaGFuZGxl
LCBNRVRIT0RfTkFNRV9fQ1JTLCByaXNjdl9hY3BpX2lycV9nZXRfcGFyZW50LCAmY3R4KTsKPiAg
ICAgICAgICpnc2lfaGFuZGxlID0gY3R4LmhhbmRsZTsKPiAtICAgICAgIGlmICgqZ3NpX2hhbmRs
ZSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4KPiAtICAgICAgIHJldHVybiAwOwo+ICsg
ICAgICAgcmV0dXJuIGN0eC5yYzsKPiAgfQo+Cj4gIHN0YXRpYyB1MzIgcmlzY3ZfYWNwaV9hZGRf
cHJ0X2RlcChhY3BpX2hhbmRsZSBoYW5kbGUpCj4gQEAgLTM4MSw4ICszODAsMTEgQEAgc3RhdGlj
IHUzMiByaXNjdl9hY3BpX2FkZF9pcnFfZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkKPiAgICAgICAg
IGludCBpOwo+Cj4gICAgICAgICBmb3IgKGkgPSAwOwo+IC0gICAgICAgICAgICByaXNjdl9hY3Bp
X2lycV9nZXRfZGVwKGhhbmRsZSwgaSwgJmdzaV9oYW5kbGUpOwo+ICsgICAgICAgICAgICAhcmlz
Y3ZfYWNwaV9pcnFfZ2V0X2RlcChoYW5kbGUsIGksICZnc2lfaGFuZGxlKTsKPiAgICAgICAgICAg
ICAgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghZ3NpX2hhbmRsZSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgICAgICAgIGRlcF9kZXZpY2Vz
LmNvdW50ID0gMTsKPiAgICAgICAgICAgICAgICAgZGVwX2RldmljZXMuaGFuZGxlcyA9IGt6YWxs
b2Nfb2JqcygqZGVwX2RldmljZXMuaGFuZGxlcywgMSk7Cj4gICAgICAgICAgICAgICAgIGlmICgh
ZGVwX2RldmljZXMuaGFuZGxlcykgewo+CkRvIHRoZXNlIGZpeGVzIG5lZWQgdGhlIEZpeGVzIHRh
Zz8KCk90aGVyd2lzZSwgTEdUTS4KUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEBvc3Mu
cXVhbGNvbW0uY29tPgoKVGhhbmtzIQpTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
