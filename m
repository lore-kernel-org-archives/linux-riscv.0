Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DEECD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 04:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlnJ0OCiBYRTLHCb/1JiHk+q6+2RynU4G4yFg9K9Gbo=; b=UZVDPZC6MrRSjM
	EBT3VkVdUHI9J1Z4N7gBSaJuLzzTWZCHJYj4bkMkkTjr+3Sq3S2x15m/T9/nS+eoF+2gypUuL6pI7
	29aG6eM9mGW2q7HZx8qSOdS50uqFbZUQLa4Xfr+9taZHLjdJT6LvxSYjVVxjmaCwh2i2AEYxxWl8A
	4EmIMDlAZAUEjYmpucdfAQ8bCsxJrjBUtlAuaqXb/+e1wdciCfJShtjUVs1dorGJkae8+tLo/s2Qv
	XPbDmDDpJavKOI0ccg8fvpSy35zHcW/wAiqUb3Rls84zqCeBadryXrIpSDdXPyNDMuv8gBq7ypFJP
	a8goDMu7UJUA0uFKZbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLRF-0000000FCaY-2ciH;
	Tue, 16 Jun 2026 04:30:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLRD-0000000FCa9-1avV
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 04:30:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G20maP1804604
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 04:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=UKLHuG7I8+uSwaC0t/8nMhKrQXsWi0ZYpQKJQdQ+Z7w=; b=DC
	Bpk3uCIW1PQs0AKKOiqVuhYcxyuLhNDT5QWyAkSVoLhUqYkMgbwr0u7tMitr/b84
	IooXYHSxWH9G4R2PT3276e0mPG3y8n95G+Sc/Q8PebH41xoP7l4Ve++vMGd+3KfZ
	6Vgjj9cu7aBJ9Q7lmbAm9ltQlPvAEDp3/1EDXAzvYI52eLZpPuOesQKpN4XIKcwM
	3g2+f9ePjgyxktdYnzfHtxQDcR6gFnXQ/M+6hiaJDyvB5+UmRRgZkqTR8BSd2xRy
	wwH0U95cu6oo3L5gc8GuK5o8nlXfoXNLopoePVSzTeJ6P6R3pI5WJJu7oazDcEVV
	HskBhCz29C2YC6JZ+Lmg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa74pgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2026 04:30:10 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-660e9fe3c70so637502d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 21:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781584210; cv=none;
        d=google.com; s=arc-20240605;
        b=VUVHMfXXvlMifpNxiQI8oV/MghDA0J0T/fBfcoixm4MxgUTNoiMpW1eo+G6T+AfF49
         Q8EPYsfiya972L6h3tZCPV+C2EVuzqnbQel8/wzup5/gxEBI/CkHY73spGz58aGX8L7K
         VnPwa9J+Dqb913wSsXRUEsGPrwr3I4YIk7qnrzEPYZpk56QGObqlzOdCLLsjL5fNSlKr
         dNp/z4MsDeZ5LXlC4IKAL3TDP2ycnlumPftoAZ29/CJxBdbAFn5EBJu3mBCPKWjNmzBr
         SmkwJ1newfh0+WWgyjAwpZlwzG3aSVsFk6BWs3UXhgxeRfqtyg0R1tEP2u2M+duoodBo
         lCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=UKLHuG7I8+uSwaC0t/8nMhKrQXsWi0ZYpQKJQdQ+Z7w=;
        fh=xM3UPUV97MiapNQ13y5zwWAcgEcITPuLF5F1OmGsgWg=;
        b=BWA8OEixE2w9djznhaWmwAQnCwuGfvbUDGBI78++6/TmkNP38TKmABvcC26gi5R3Rn
         /lpisbtYqO3CmNC7twieHO3CPkwaNAnC/whB8nFzxCgJQ47tEiUc+9vJ5UT8DTv9VRzk
         B2maw8CMyac8P5bvhwK7vDnhoFgE6ljta71dhk7I1C0WOCIpGb8Kaj1CZvwooaMukXmz
         kx35a3zgFDYOPdUJEBH1vS9rcH72scsSgwwqSVYg2GFYi0mbJqUebpDEzigyBdUqmyoq
         9X5OCB8c+4ZDTJTcyk1K+NeSWsgxHhyldJADKXm4mKX7Ao479pq1+hFG2geGMBijoy+2
         ChJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781584210; x=1782189010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UKLHuG7I8+uSwaC0t/8nMhKrQXsWi0ZYpQKJQdQ+Z7w=;
        b=Mxr4jOZkOfHDWc2sab0Etssojo6HeNYKQUIn9TyZFDVKuA6fuIvJgkdcuMy4L/5AqH
         larOLr+uZyLsNVWBikKQ4zxh1dJfx1cVq5pSrHYPk/mt2Ik9sVklCiXGJ8HDAuQXesNv
         aFCaghJN89ef2zCt96P5gaYm35Z4j7zYE94XKefeePasNJ2wKXJgGKDA+tIhKiIQpfjs
         ofQZkc1ziOdHdkcQgE1NLE/49GYx+HFq7e1ojdyD2dQkWNfDZ2VKNDvUIckZnx9I7Rtp
         aHtKbSLfbNKtByabhB57318W9URS/zKIn31GE+T799Auh3NqghWrF6/DpBH4ZuElEK7p
         6Vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781584210; x=1782189010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKLHuG7I8+uSwaC0t/8nMhKrQXsWi0ZYpQKJQdQ+Z7w=;
        b=KXISg6kbz9ykIsnW7RNrnd4eK6sR5Hz8j3Qdmf/6gYptpTEvFnD4m1WTzcQsqK0y+q
         pfTBIt2KQYPdNqwe1JhPHD83K/hdT/oFWYijiGa2vnrw3vYGsJ+2OArUJvqnyJh7fz50
         ccvvucSZfn0b2h1kuKfUWofs+UDcxADsEx6XY8Qe+IMgS1Ei16C5JcMS3ohLuPwHtc9I
         Z4YSVtEhFDgVaijRDuxPjQMiCUYhsvWorlq/RAilUonaehWW0TMuAdyygkPdEkYSrfOJ
         xvIwhfYAyHYQI9otB24hFKi30jZAQCJ9yaqm8QfuwxmPs4dnuVtTgMjhoqLrXrSHPYxF
         o9OA==
X-Forwarded-Encrypted: i=1; AFNElJ9wOutjoeaxwz1DjG7aqxRl+7qxhs4qswuXrddfRDi06tV4YnscQ0ZV6kuM117Gm2LhX4jQY9GArmEqnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyE9rRgtH0qmatR8ycKHPimejz6CH0hqkUwwzrVmzS/Ca0p0ndj
	giuuwVfilF/LRW38O7X6nzJiLrRGStBSOEGvzomnUK9vq4g3g5o+UOEsEW6pnDaY4E5VsYfB95+
	GJTXqsziadDhqv7I7tHFdJxrMKCTJoBd0yPVOseuzicrQXDjPeuiX7B+wp7+GNBNwGAufGJzn1q
	w/SKmfmJVcANxybI7i3n3wS6A6ZYoZ4a4M/gCS2qx0Rsc4ZQ==
X-Gm-Gg: Acq92OHTvgwovYMvaQ2L3M2ZL7IMtBuLUuND+MzmvSPYVlHeHbDVMBmsycBZ2FMTA8U
	S7kduGkPHm+xPohgprQy5MsB+KjOtdONJiUq7Oe9Nalj7+mxONaselPqHwpl7wY8+e5tKOdRfr3
	EFGRd+//ebwUm33d0DqTeIZd2hi4lVXi6roWLfkd4MN/1mwfetlvjpkSCAKd14VOyfI8zg8KlSS
	KmJBlBl
X-Received: by 2002:a05:690e:4850:b0:657:a0f4:ac1d with SMTP id 956f58d0204a3-662b5f55649mr1162533d50.12.1781584209756;
        Mon, 15 Jun 2026 21:30:09 -0700 (PDT)
X-Received: by 2002:a05:690e:4850:b0:657:a0f4:ac1d with SMTP id
 956f58d0204a3-662b5f55649mr1162527d50.12.1781584209338; Mon, 15 Jun 2026
 21:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com> <20260615-efi_reset_shutdown-v1-1-9414edcbbab0@meta.com>
In-Reply-To: <20260615-efi_reset_shutdown-v1-1-9414edcbbab0@meta.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 09:59:58 +0530
X-Gm-Features: AVVi8CcsjFOU3QW7M2B7U9IEgIu5I07vgt8Rowm7Ah-Xi1yMdGZKM_TLdNd9Ovo
Message-ID: <CAB19ukE7QEVLh8-vbAMbEXemnH6ENREWNTFQ1vBBD3GZyF6i0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: efi: Power off via EFI runtime services when available
To: Atish Patra <atish.patra@linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
X-Proofpoint-ORIG-GUID: ff-w-0boVU8ybjpoXNFikWPQ33V-6VOb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA0MSBTYWx0ZWRfXxIiIfg53uSbB
 qjQEidevGmVA/TK42JVF0jl2xDNvSXyPxpet3ctqZpHUHTsaFvD2JRvifzgpar8EriecThUazdF
 vqxGDJPOo6DWevmic8ffLwCp/LWIk0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA0MSBTYWx0ZWRfXwevvCbwVyOrG
 gzhZn8ZnvZtAO3UlkW3mtnt3QlBSYWGx1fUYF8wF6DxErOl5iweYfEgN1mrHgqCtVjhBQT12Auk
 /cwoo+eh4BYlH+S9Wwzw/3cC4kAeydJB5q0gmPRVtqmQTcveeriHWmKjUrRAs2LAQihrZBvBJbv
 YD38H+1qRFbGZY94QLalDjVcbdmpv3jil4eT6axL28x1yZxxFEydy2CI8cYqvy/50tfBp204b3w
 ZCKgBfoY7prkDUncoRY780hMNZppZ1IpRXgLG0vKgC/5ZNKDYS1+Tlj5myJBhvun9QxDIOlv7MI
 aVrPsRabp+HPmve9oBHK8yUF26lIQ4vYxHiLm2Zb2px1P4BniFbSw2iJqEwduLeDRF/sS3vhjIw
 yHcrY4q2/KT/ehITq6NOO0DNANbjsMj/fRdia2Mq13+I3cwP0XflAFS7eq7/RTrNq9NsNnfv7UZ
 WDCwWSKcHcPRpnmDsAA==
X-Proofpoint-GUID: ff-w-0boVU8ybjpoXNFikWPQ33V-6VOb
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a30d152 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VabnemYjAAAA:8 a=EUspDBNiAAAA:8
 a=_0tRYTEA66ICOSDQ-zYA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_213011_442066_23243F0C 
X-CRM114-Status: GOOD (  16.55  )
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

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgNDo1OeKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gRnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEBtZXRhLmNv
bT4KPgo+IFdoZW4gYm9vdGVkIHZpYSBVRUZJIHdpdGggcnVudGltZSBzZXJ2aWNlcyBlbmFibGVk
LCBFRkkgUmVzZXQgU2h1dGRvd24gaXMKPiB0aGUgZmlybXdhcmUtcHJlZmVycmVkIHNodXRkb3du
IHBhdGg6IGl0IGxldHMgZmlybXdhcmUgcnVuIGl0cyBvd24KPiBzaHV0ZG93biBob29rcyB3aGlj
aCBtYXkgaW52b2tlIFNCSSBTUlNUIGV4dGVuc2lvbiBpbnRlcm5hbGx5LiBIb3dldmVyLAo+IFJJ
U0MtViBhbHdheXMgcG93ZXJzIG9mZiB2aWEgdGhlIFNCSSBTUlNUIGV4dGVuc2lvbiB0b2RheSBh
bmQgRUZJIHJ1bnRpbWUKPiBwYXRoIGlzIG5ldmVyIHVzZWQgZXZlbiB3aGVuIGZpcm13YXJlIHBy
b3ZpZGVzIGl0Lgo+Cj4gRW5hYmxlIHRoZSBwb3dlcm9mZiB2aWEgRUZJIGJ5IG92ZXJyaWRpbmcg
ZWZpX3Bvd2Vyb2ZmX3JlcXVpcmVkKCkKPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAbWV0YS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2VmaS5jIHwgNSArKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvZWZpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmkuYwo+IGluZGV4IGI2
NGJmMTYyNGEwNS4uMmQzY2M1N2I0NTM1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2VmaS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLmMKPiBAQCAtOTUsMyArOTUsOCBA
QCBpbnQgX19pbml0IGVmaV9zZXRfbWFwcGluZ19wZXJtaXNzaW9ucyhzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1kLT5udW1fcGFnZXMg
PDwgRUZJX1BBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
ZXRfcGVybWlzc2lvbnMsIG1kKTsKPiAgfQo+ICsKPiArYm9vbCBlZmlfcG93ZXJvZmZfcmVxdWly
ZWQodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIGVmaV9lbmFibGVkKEVGSV9SVU5USU1FX1NF
UlZJQ0VTKTsKPiArfQo+ClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxj
b21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
