Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740D4C44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 00:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaA1EQ3GMSzgF2HezHwTGWGJ2ZufWpm88cViEsLUhi4=; b=NjJgn3LITQ28fa
	zeClmzfvP82Zp4vWdSKhaVXjDO8FDg+0y5eIvDSHHhuK5kGavMeVZ5NdO5WaNGIfNQufQ5nMhjppw
	JTZJQ+Rezqd6680b+k78QoOsBu38PAt07UDyqNcBSWQCgdETPK3HwlNLgH4yTVDc4OIg8EOrjg6Nz
	/0T0Gqps0joKMYA4AzlpzsPmb8h3cr2pjVJrZSvioFoIBGGgjEzbv0CxgwCn5MHFcKK7VVkVLvyjm
	YDZTTbQF9ZEkyMDgsJ4V/kAXGc8p+dxtfdDYnhC3v8EH8b1qv7YEkou2vbqC5ybZPAAH5UoK+YVDt
	t/83CXa4ksscDf1vO+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnp6-0000000DW3I-2cy7;
	Wed, 15 Jul 2026 00:50:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnp3-0000000DW26-19Pv
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 00:50:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IrTs2076909
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=; b=UxM3n7GHhTu9Z4EV
	DUFuDd7MSIHmG2bG5x2S6YD+v/a9tM2U4acC12QxZ7kmjWhrpIBCQukUFJDwEeAe
	67iqBvmEbKl74UqYpxohEC5VH5v3EdgYK/GBvmkZIvf6WF2pmDTuc5tyK/kUGo7V
	wdwB17KSKIZ2eI9L4z90BfX8ghTH0XILKLdFfjwympdgJIPbz4FPseDypQq+rcs0
	hhBO0wBFVaYdpSGjGkTuRbLe1HZ/NMZBuwl/oG/4HQ6ESw7CDjGYuVdEZVdvSoDW
	9oiJ0Q39uzSCTcyCOUocW7mubJ4ZYCT8cBsPPePgfDk/UJrOdmmOoVi8wPFOqEI0
	ALnHnw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr2d6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 00:49:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so7341683a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784076598; x=1784681398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=W3VpqAtgUIezpRrC5Pzb3sv4O4HSS4baK5sE3I27nmFsrQr22Uhp18Sn3KvDvEZVB7
         5U4FR1f+aCYh7A5qpssEDSutIOIf3FuRpLFaP4GQTylpGg0rNLW/2VaQafOZFU7FgOKC
         FfLMQzYtCKRiyvXMsCKvSH6PSu4wYhQZrlHFOvAcncgYRxU/6HZYCpeiIBRXfKqDU+Qh
         WdlUmvwReZzEVPElufwRJe8xf02P/VITkjm+ySbRGyYMwIlTgCm9bb1M6oUvfNGztbLW
         2e0ensEd/DK1sXEKfN4DXCAUjilV8kiaU2QguUWRlAjhCqJbO814LAJsHy0gYks1SK7R
         5gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784076598; x=1784681398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUGR1Dey91RMv6/UrlIf+RTVS0A3peDLMNZcwXJR00o=;
        b=j9fCTb2V5k2tFbeVDZ+i0hFd+1yLC2j60Kv6gLbrr6b7KmmpQFLLWY8zPog6j7vfaW
         z0JJ1MEOnSvdMf3bZx1RJVGWInKioXGHLo3P4eT1D4713WILpBZInSqu/RvkP/4tgPg7
         n3ReTHe5sAXv5RZo0mdrML9NRYDCK47J8ilmwAIlgGS3fg7qbdUDrmWCxCjxOx2CZLrI
         F8bYRZCH7JWrsMsrnnT9dvPEEdU1sIz5Fit+4M94FkMu6mfSuvWmLeT1CEIzJj2KNAkB
         q/Yf6KPGqDwQN80R0zzgVFapnmT8MdgukrS5baFDhmCRcKKth1yscJnx2IcFdwv3Z53Q
         W8Ew==
X-Forwarded-Encrypted: i=1; AHgh+Rpy4ga8pshRYrjhlV0HB4+ptb5boiwOsx6dC8k/ZIhR5ijxUQ1DlMrJVnO6PEGIcgeVLWrAA/v9skDfAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAYvaefew9t4RxlWyfINF0XiiH+e/6G0NEBaMjwRhCPQkm2qLa
	4kT5vzClpzPmZyMorgzjbrHn5viVHskqU9eU+D9se/7Itq/Ni3gmN3ja/VtXIEgo0/zcfR4oqdN
	EQGc3DJcu2Q2LmoV6GzSQim9z4tekm6veWAuCs+/VzZmWgVbg2DjVFapk8TI1Wh4h/5ziMEE=
X-Gm-Gg: AfdE7ck5ra4HS9+oFZdXYswtIEt8qMGU5YbpyAxgqdEuMscaDUaLgewH0n8nt5O28iG
	E/8SKgKcs3Yq6YJj1SVqGWbYVR0k1gWqtuP/9LUoVKpqbLgL4fBF9/DZrPhv/rWNJEaYxfb9TQ3
	ujBW7EeR6ViRdan5CI+TlCdtu9Bx0e0lTW9IBpmnBR+5pX+rr9xApbwDf+CgsLRym7xrSydkelE
	v9tOCi9Gz7CJianIXsei2UP484LSO64pJb/dqy3LO1vc5TEB1BH7arXhrXEhkdWfDSkr4iZmYzf
	AZZSo1XQs/IIkU6l+iOYCVjiir76HMT00OKtMEhLG/P/wWqougtTIQXr2G+k+ptCxVXIY5MKpx8
	S1roXHwkYcT5Wt5MLTILc2e1vYWDNxCZ69W7bi4UPtg4fHZyPkNyYNSqK9P8e14eV4NNYBel+Jr
	U=
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161162637.24.1784076597662;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9a4a:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c3570141a9mr5161142637.24.1784076597207;
        Tue, 14 Jul 2026 17:49:57 -0700 (PDT)
Received: from [10.133.33.53] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm10602524a12.32.2026.07.14.17.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 17:49:56 -0700 (PDT)
Message-ID: <603db28d-32eb-4187-bd10-e77e663f106d@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:49:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
 <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfX0IBZUW/gzimo
 /wBGJRJfg8lXsGRYgwfKyj1OG8Vlv8jt+XCr4/N94hfJJijeYRiN9JV5ysLFi1hHVRV8sO/x3kT
 asT8/5WAfxgFk3FTWzIAlcucUqRS5UQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAwNCBTYWx0ZWRfXyFjSu7pbXmvw
 lEYtKletztD4GCWIO8RZI62A1Ojk61h7Qh58F45mg2WI4n2i2vnUEhGLoB91ZdUg91KrX46yMQm
 pKBfqm5BcW1TPuEwHIpFDDHiQD1MNwWx9VNkoh2FYV88dAf2QYUMRpA11K4EqJ8YYk4bqDd1oc7
 ij49fP7+2wfz/sWcJ3C/O79QXj9y9SoWbZlyqbLjGI/WynDEMuD9EX/qzjIlS8r2vYJfmmxXryQ
 mHkQIn8aYQaTHYrpGxzOXHy8XbCHbH20VLx4lsDelwI2emay4NZzqsN1BhzWp7ENcAbYjNNKWgh
 GvYGHQMTi6y/OlcDDFatXDQCoKHo2cU/6z3wGgU5PYoAcJ5uWL8pHejmy3u0U0GC+R1lvc6+Bnn
 URE7M/OLignI9kF0wb8X1Kr72/6H0qrGQwzP7MKfz0g7dCyltoG9HDmqQEXTzXfUVaJGcrcQcOf
 7zjiB5Ulmf0xXAxUwKw==
X-Proofpoint-ORIG-GUID: tt7JfHBs9Dnu8GWM5TefLHDc1UJiSvL1
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a56d936 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=miRBm6SHGmt7Tc25g28A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: tt7JfHBs9Dnu8GWM5TefLHDc1UJiSvL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_175001_473252_E661B88D 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzE1LzIwMjYgNjoxMyBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MTMsIDIwMjYgYXQgODo1OOKAr1BNIEppZSBHYW4gPGppZS5nYW5Ab3NzLnF1YWxjb21tLmNvbT4g
d3JvdGU6Cj4+Cj4+IEFkZCBEVCBub2RlcyBmb3IgdGhlIENvcmVTaWdodCBkZWJ1ZyBhbmQgdHJh
Y2Ugc3Vic3lzdGVtIG9uIFF1YWxjb21tCj4+IFNoaWtyYSBTb0MuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEppZSBHYW4gPGppZS5nYW5Ab3NzLnF1YWxjb21tLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9h
cm02NC9ib290L2R0cy9xY29tL3NoaWtyYS5kdHNpIHwgMTI5OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEyOTggaW5zZXJ0aW9ucygrKQo+
IAo+IE5BSwo+IAo+IEZpeCB0aGUgc2FzaGlrbyBpc3N1ZS4KClRoYW5rcyBmb3IgcG9pbnRpbmcg
b3V0LCBmaXhlZCBpbiBuZXh0IHZlcnNpb24uCgpzeXNyZWcgRVRNIHNob3VsZCBub3QgaGF2ZSBN
TUlPIGJ1dCBhZGRlZCBieSBtaXN0YWtlLgoKVGhhbmtzLApKaWUKCj4gCj4gUm9iCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
