Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB754C982C1
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Af+ak0/DcdDVR7G6QiqVw1mgiAP5RYyGN0DIsNiXTw=; b=MmW8Lya7g7lGH0
	7Uiq+OgsBX5Qj9JmM/MEGfLCqKk3R2ozpYFmuUqSAe8r9GJl0fiEE2Nv0s8eyazbZfBwleOASXpzZ
	PuRVll24pUacmEaStZ4Ao57TZLiRJ7Kz/MS4uz4cx+S+lfFmt7wfcv9sw7HOpyYS2XbLoliJsTbDs
	xxQF89WAOtk8qc9y/4T5DjTUOTOp+aeqelgihKOYnMbdz1iUM8giJ757FCCOsPZ1/5Z2CHB36kt3a
	YwZxBWr8AivEilZ6ZnkHSa4ST+Zo1Eh5fEDWPvLLRVZYJxfdVtEGzW+V3HahUv8NxGrDE71Q5bDvT
	g2+KCREyO9Ci0/AjZ6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wzh-0000000A8Xm-0ZX0;
	Wed, 16 Sep 2026 21:16:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wze-0000000A8XF-0czA
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 21:16:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GGiRIR210634
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 21:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=; b=GGyK/0zHNxSER+y2
	LaQiDgbRKmox1nWm6jaUokUYLQp7Wle7RA2P9+sEAt0iAnLMR/5HNtMUZVIXqAC9
	gxpBU2pYo437aMdnbYROqvsqeFmXRBpcwYO9tKgCY4vwuYPDTEVLWvypG+CDihoz
	OQnrWld7Q9ZTRb8uiXz5DsDm61iz+vtuoi6Hcu3KUTBCBkEp00qO90XSl4YnHIah
	4cD0QOf86qmD3vibijpIY8nYM5wqP/9sEeCQ4UEtV+Ayqm7lvWv91/fCA9bSchKC
	r5VSz8aurAUmSVofu7dpEpGm6C04jj6YrSJldOGTNpcdkU8Dwq26FGPJ4u42rzZU
	zTd7tg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxw8s6eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 21:16:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso250368a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789593396; x=1790198196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=;
        b=OvOgh3Ic3YxJcoAz+b07ejRKhAUDzbXXcM9Q2iboXzCboBM+6s/T8tnArV3O8nQOMt
         SrwR8Dqecz38FWsuTAq6I8jPifR1zfZFhZTVFMutM2SrK8+WwZwEs/hDgsWHgHT0FXQ/
         Suyh8pGhy5uKUVi61vHne6U2vpoUNpqr/pZ9MHr4+tvl209TFmA2eABrwH5p84KD2keI
         MQhomEelXqRIA6dDFZHZQuz9L2FvJ5XbZ9LVMIFChg8pfjvXJqnDUhbcYPtYaGkomgSl
         YXPcW4Y883l8V4wV2BRzGLSAVM/c3dkQSVSbZLetv1CcCS7QvkHoSp8JoRoAgyB4KDca
         H7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593396; x=1790198196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJ5ikrelPOxZxaf5C/PtGjFWO0wzJsRg+Use1Q/ipvM=;
        b=sCxbuyo3iYVu/xppQBoBb8oeqSGOHfMrhYViFLmbNFjvgs4ipbuv5mcLBgoSKFwxAj
         nD35NdHVa+r7It+ILD/2yxsEiGEkhDLfMmuRunYjX1IFd36CH4tvOILx1yQMcg5wWb75
         DWwerCOq3xLs/nQZjfebq9KQrq2Fy4J+5RC+c67JN1y2ekmE4OKnQQkj8YPmvmIEnAOI
         5fMO2YRnXKtgjunGTbEUocL95jQYv1EXqbWky59UAM0YLvfnLPQahzRY8qLMn/MhN1+F
         ZYPHAiYKM0b2slCF2UkgzI/L6KV+XNKp+AjDMuQFrz84q8wEj51QOv3RdpY3XNP8yS5e
         x6Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxTWQlECFsw9LC7KWSCS4cbAlK2jcCJWtxye83MT9vqsQ2VpQAmP7qpVJ03mZKUQpaL9p5JP4VxB3759w==@lists.infradead.org
X-Gm-Message-State: AFuF++muMUyJhl0FDsoR4u2K56amwrzii4w4F7HbyTmjT/ef/lkv03rH
	GQHJoQO7Bb0OfdAKuhS4sNS3Wok9QrcY4FLbokVKaAAzqHUa2LHKBVO6MbqXtmfFZl8uWuXxejt
	yY5H3IJwecCNs7mMMJNq6evGwyqS38j8saTtA6KvF9g4QMXAH/XNfgx8jbTPLQPLead4hAA==
X-Gm-Gg: AYBFou2eBR314UvRXIzhg8i2M4GGsTXVPtc+kimNyhe/D3tU9wmrjfCKqz2uicPMmyl
	dpC79MVROhzzOclQaII/ENd20GBySy61RcG8XnqHd2SpGjxeBHupIVOy3loOMDP/UI8KkquqzeV
	GUk3OlOY4Ol7/nVFbUG8PgbQ9F7HuPRGIvKwtbVIUKiteQkQB0LDCWvFsozlOah1jGmoazDP5Li
	LeUD7ZklJgeUIdRN8IhScDf0nmaUTjGB3brrvJn5M1gSRD+D5e/PXYOolVDuVkkmT1qI+vylnqR
	8YrpZG+njYSqC+I/UQ7+myy50oXMogsOSHIsquxw9ILCrGDyWlUTfqTUPZci/GdGVC78Kv/YPte
	I1ce8x/nhjI4XNpAwFDgl27dzFOeaqFe/
X-Received: by 2002:a17:90b:1811:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e1e250230mr11033521a91.5.1789593396037;
        Wed, 16 Sep 2026 14:16:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39e1e250230mr11033403a91.5.1789593395476;
        Wed, 16 Sep 2026 14:16:35 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.15.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35e532e4sm1147947a91.10.2026.09.16.14.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:16:34 -0700 (PDT)
Message-ID: <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:16:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/5] dt-bindings: tee: add RISC-V RPMI TEE transport
To: Anup Patel <anup@brainfault.org>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-5-1d1d35c2a859@oss.qualcomm.com>
 <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAAhSdy3Or_uDWuQniUGguc9AwL8smF6XHhJ0kizFOJKJ0N+9OA@mail.gmail.com>
X-Proofpoint-GUID: 79MK9FGgz1H_bN_Tptn8pdwucfGz4aUu
X-Authority-Analysis: v=2.4 cv=bY3+w+PB c=1 sm=1 tr=0 ts=6aab0734 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=RYJI0oIToGyOemi2SthaJQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=b45o4kL6AAAA:8 a=oSFF6Vc5-LCmsOG0wpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=dhdsR-PFWuPJUldTnwXm:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI5NiBTYWx0ZWRfXz24wQgNCwKRt
 LQwm7BPPDGkz4EgS8bioTGcJwFqwdHjtIQv/7nS4NGnzh5XW6SSrURRL5jdIL93E4gpuxwjZdzy
 i4Pz8F7v1/t7DUqdApD/QE8Q7dS+sXU=
X-Proofpoint-ORIG-GUID: 79MK9FGgz1H_bN_Tptn8pdwucfGz4aUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI5NiBTYWx0ZWRfX3BW9Z2d5PQ/h
 zcQm7PbANvkPO19DV5f/O2ctIYdJBzerJuZOvWp1oRSFRIp6tzBFi84yno8peDNIQchPsqb7ghR
 oBxw0D1eDhqaRqLJkbe7BIlgmv+TV8Jeh2JFMfD1EVhvHQCxCReAoB+IQZHCYhbqtj7gJNymZ+p
 v22OVOqRyZlZJFHIs0PzXqJ78ebMQWOUv7qoiRm6SxNdn2M5VIxRji+0T3uxNpzjl7jvSTAO/iO
 7yCng438jjtUu0GI0VEuB3skNMkkfWmib/89/I4+Cf95xHZcYGVgrPQSwmSjcbQlmett5qGeCxA
 r7FCehOhk6MXu9YM8+xWalmrDBVNt42ol1BTzvLJgu4gnIR7ZKA7OoYPJqeTdGjLWvQ2bAmRnVU
 E6kUtbT7UkX3N8m9g/Fu6vM/ijEB2poC4WomUidFLqPTBiK1tM+u+aqe+l+JR/92vYcHyzJxgJT
 56LxKOnimtkHb2jBrNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_141638_195288_CBFA4366 
X-CRM114-Status: GOOD (  30.15  )
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

SGkgQW51cCwKCk9uIDkvMTYvMjAyNiA4OjEyIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFNh
dCwgU2VwIDEyLCAyMDI2IGF0IDM6NDXigK9QTSBBbWlycmV6YSBaYXJyYWJpCj4gPGFtaXJyZXph
LnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBhIGRldmljZS10cmVl
IGJpbmRpbmcgZm9yIHRoZSBPUC1URUUgUklTQy1WIHRyYW5zcG9ydCB1c2luZyB0aGUgUlBNSQo+
PiBURUUgc2VydmljZSBncm91cCBvdmVyIFNCSSBNUFhZLgo+Pgo+PiBEZXNjcmliZSBvbmUgbWFp
bGJveCBjaGFubmVsIHBlciBoYXJ0IGFuZCBhbiBvcHRpb25hbCBpbnRlcnJ1cHQgdXNlZCBhcwo+
PiB0aGUgYXZhaWxhYmlsaXR5IGRvb3JiZWxsIGZvciBhc3luY2hyb25vdXMgbm90aWZpY2F0aW9u
cy4KPj4KPj4gQWRkIHRoZSBiaW5kaW5nIHRvIHRoZSBleGlzdGluZyBPUC1URUUgTUFJTlRBSU5F
UlMgZW50cnkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFtaXJyZXphIFphcnJhYmkgPGFtaXJyZXph
LnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4KPj4gLS0tCj4+ICAuLi4vYmluZGluZ3MvdGVlL3Jp
c2N2LHJwbWktbXB4eS10ZWUueWFtbCAgICAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysr
KysKPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGVlL3Jpc2N2LHJwbWkt
bXB4eS10ZWUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90ZWUvcmlz
Y3YscnBtaS1tcHh5LXRlZS55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uOGY2ZmYzMTNmZDQyCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RlZS9yaXNjdixycG1pLW1weHktdGVlLnlhbWwK
Pj4gQEAgLTAsMCArMSw2NSBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICsjIENvcHlyaWdodCAoYykgUXVhbGNvbW0gVGVj
aG5vbG9naWVzLCBJbmMuIGFuZC9vciBpdHMgc3Vic2lkaWFyaWVzLgo+PiArJVlBTUwgMS4yCj4+
ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdGVlL3Jpc2N2LHJw
bWktbXB4eS10ZWUueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRh
LXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogUklTQy1WIFJQTUkgVEVFIHNlcnZp
Y2UgZ3JvdXAgYmFzZWQgbWVzc2FnZSBwcm94eQo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAg
LSBBbWlycmV6YSBaYXJyYWJpIDxhbWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+Cj4+
ICsKPj4gK2Rlc2NyaXB0aW9uOiB8Cj4+ICsgIFRoZSBSSVNDLVYgUGxhdGZvcm0gTWFuYWdlbWVu
dCBJbnRlcmZhY2UgKFJQTUkpIFsxXSBkZWZpbmVzIGEgbWVzc2FnaW5nCj4+ICsgIHByb3RvY29s
IHdoaWNoIGlzIG1vZHVsYXIgYW5kIGV4dGVuc2libGUuIFRoZSBzdXBlcnZpc29yIHNvZnR3YXJl
IGNhbgo+PiArICBzZW5kL3JlY2VpdmUgUlBNSSBtZXNzYWdlcyB2aWEgdGhlIFNCSSBNUFhZIGV4
dGVuc2lvbiBbMl0gb3Igc29tZSBkZWRpY2F0ZWQKPj4gKyAgc3VwZXJ2aXNvci1tb2RlIFJQTUkg
dHJhbnNwb3J0Lgo+PiArCj4+ICsgIFRoZSBSUE1JIHNwZWNpZmljYXRpb24gWzFdIGRlZmluZXMg
YSBURUUgc2VydmljZSBncm91cCB3aGljaCBpcyB0aGUgUklTQy1WCj4+ICsgIGFuYWxvZyBvZiBB
cm0gRkYtQTogT1AtVEVFIGFuZCB0aGUgcmljaCBleGVjdXRpb24gZW52aXJvbm1lbnQgKFJFRSwg
aS5lLgo+PiArICBMaW51eCkgYXJlIHBlZXIgZW5kcG9pbnRzIGFuZCB0aGUgUlBNSSBmcmFtZXdv
cmsgKG1hY2hpbmUgbW9kZSBmaXJtd2FyZSkKPj4gKyAgbWVkaWF0ZXMgZXZlcnkgbWVzc2FnZS4g
RW50ZXJpbmcgT1AtVEVFIG9uIGEgaGFydCBydW5zIGl0IG9uIHRoYXQgaGFydCB1bnRpbAo+PiAr
ICBpdCByZXNwb25kcywgc28gdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBwcm92aWRlcyBvbmUgU0JJ
IE1QWFkgY2hhbm5lbCBwZXIKPj4gKyAgaGFydDsgYWxsIG9mIHRoZW0gYXJlIGxpc3RlZCwgaW4g
aGFydCBvcmRlciwgb24gYSBzaW5nbGUgbm9kZS4KPj4gKwo+PiArICA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+ICsgIFJlZmVyZW5jZXMKPj4gKyAgPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiArCj4+ICsgIFsxXSBSSVND
LVYgUGxhdGZvcm0gTWFuYWdlbWVudCBJbnRlcmZhY2UgKFJQTUkpIHYxLjAgKG9yIGhpZ2hlcikK
Pj4gKyAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJwbWkvcmVs
ZWFzZXMKPj4gKwo+PiArICBbMl0gUklTQy1WIFN1cGVydmlzb3IgQmluYXJ5IEludGVyZmFjZSAo
U0JJKSB2My4wIChvciBoaWdoZXIpCj4+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsg
IGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHJpc2N2LHJwbWktbXB4eS10ZWUKPj4gKwo+PiAr
ICBtYm94ZXM6Cj4+ICsgICAgbWluSXRlbXM6IDEKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAg
ICAgIE9uZSBTQkkgTVBYWSBjaGFubmVsIGltcGxlbWVudGluZyB0aGUgUlBNSSBURUUgc2Vydmlj
ZSBncm91cCBwZXIgaGFydCwKPj4gKyAgICAgIGxpc3RlZCBpbiB0aGUgc2FtZSBvcmRlciBhcyB0
aGUgQ1BVIG5vZGVzLgo+IAo+IEkgYW0gbm90IHN1cmUgd2h5IHlvdSBuZWVkIHNlcGFyYXRlIE1Q
WFkgY2hhbm5lbCBwZXIgaGFydC4gVGhlIE1QWFkgc2hhcmVkCj4gbWVtb3J5IGlzIGFscmVhZHkg
cGVyLWhhcnQgd2hlcmVhcyB0aGUgTVBYWSBjaGFubmVsIHdpbGwgYmUgZG9tYW4gc3BlY2lmaWMK
PiBmb3IgVEVFLgoKVHJ1ZS4gTXkgcmVhc29uaW5nIHdhcyB0aGF0IFRFRV9DQUxMLCBhcyBJIHVu
ZGVyc3RhbmQgaXQsIGlzIGV4cGVjdGVkIHRvIGV4ZWN1dGUgb24KdGhlIHNhbWUgaGFydCB0aGF0
IGlzc3VlZCBpdC4gR2l2ZW4gdGhhdCwgdGhlIG1haWxib3ggY29yZSBob2xkcyB0aGUgcGVyLWNo
YW5uZWwgc3BpbmxvY2sKYWNyb3NzIHRoZSBjYWxsIHRvIGBzZW5kX2RhdGEoKWAsIHdoaWxlIHRo
ZSB1bmRlcmx5aW5nIGBzYmlfZWNhbGwoKWAgaXMgc3luY2hyb25vdXMKYW5kIGRvZXMgbm90IHJl
dHVybiB1bnRpbCB0aGUgVEVFIGNhbGwgY29tcGxldGVzLgoKU28sIGlmIHR3byBoYXJ0cyBzaGFy
ZWQgdGhlIHNhbWUgY2hhbm5lbCwgYSBoYXJ0IGV4ZWN1dGluZyBhIGxvbmctcnVubmluZyBURUUg
b3BlcmF0aW9uCndvdWxkIGhvbGQgdGhhdCBjaGFubmVsJ3MgbG9jayBmb3IgdGhlIGR1cmF0aW9u
IG9mIHRoZSBjYWxsLCBhbmQgYW5vdGhlciBoYXJ0CnRyeWluZyB0byBlbnF1ZXVlIG9uIHRoZSBz
YW1lIGNoYW5uZWwgd291bGQgc3BpbiB3YWl0aW5nIGZvciBpdC4KClVzaW5nIHBlci1oYXJ0IGNo
YW5uZWxzIGF2b2lkcyB0aGF0IGNyb3NzLWhhcnQgY29udGVudGlvbi4gSSBhZ3JlZSB0aGF0IHRo
aXMgbWF5Cm5vdCBiZSB0aGUgcmlnaHQgbGF5ZXIgaW4gd2hpY2ggdG8gYWRkcmVzcyB0aGUgaXNz
dWUuIEkgZGlkIG5vdCBwdWxsIGl0IHRvIHRoZSBkaXNjdXNzaW9uIGluIHRvIHRoaXMgUkZDLgpJ
J20gaGFwcHkgdG8gdXNlIHNpbmdsZSBjaGFubmVsIGZvciBub3cgYW5kIGZvbGxvdyB1cCBvbiBp
dCBzZXBhcmF0ZWx5IGlmIHVzZWZ1bC4KCj4gCj4gQWxzbywgZm9yIHRoaXMgYmluZGluZyByZWZl
cmVycmluZyB0byBvbmx5IG1haWxib3ggY2hhbm5lbCBpcwo+IHN1ZmZpY2llbnQuIFRoZSB1bmRl
cmx5aW5nCj4gbWVjaGFuaXNtIHRvIHNlbmQgUlBNSSBtZXNzYWdlcyBpcyBhYnN0cmFjdGVkIGF3
YXkgYnkgdGhlIG1haWxib3ggY29udHJvbGxlcgo+IGRyaXZlci4KCkFjay4KCkJlc3QgcmVnYXJk
cywKQW1pcgoKPiAKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+
ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBBdmFpbGFiaWxpdHkgZG9vcmJlbGwgcmFpc2Vk
IGJ5IE9QLVRFRSB0byBzaWduYWwgYXN5bmNocm9ub3VzCj4+ICsgICAgICBub3RpZmljYXRpb25z
IG92ZXIgdGhlIFJQTUkgVEVFIHNpZ25hbCBidXMuIE9wdGlvbmFsOyB3aGVuIGFic2VudAo+PiAr
ICAgICAgYXN5bmNocm9ub3VzIG5vdGlmaWNhdGlvbiBpcyBkaXNhYmxlZC4KPj4gKwo+PiArcmVx
dWlyZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIG1ib3hlcwo+PiArCj4+ICthZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAg
IHRlZSB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1tcHh5LXRlZSI7Cj4g
Cj4gVGhpcyBtdXN0IGJlICJyaXNjdixycG1pLXRlZSIgYmFzZWQgb24gYWJvdmUgY29tbWVudHMu
Cj4gCj4+ICsgICAgICAgIG1ib3hlcyA9IDwmbXB4eV9tYm94IDB4MTAgMHgwPiwgPCZtcHh5X21i
b3ggMHgxMSAweDA+Owo+IAo+IExpa2UgbWVudGlvbmVkIGFib3ZlLCBvbmx5IG9uZSBtYWlsYm94
IGNoYW5uZWwgaXMgc3VmZmljaWVudC4KPiAKPj4gKyAgICB9Owo+PiArLi4uCj4+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4IDIwN2E2ZTJkYjcwYy4uN2Qw
ZTU1MDA4NWIyIDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJTkVSUwo+PiArKysgYi9NQUlOVEFJTkVS
Uwo+PiBAQCAtMjA1NzcsNiArMjA1NzcsNyBAQCBNOiAgICAgIEplbnMgV2lrbGFuZGVyIDxqZW5z
d2lAa2VybmVsLm9yZz4KPj4gIEw6ICAgICBvcC10ZWVAbGlzdHMudHJ1c3RlZGZpcm13YXJlLm9y
ZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4+ICBTOiAgICAgTWFpbnRhaW5lZAo+
PiAgRjogICAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLW9wdGVlLWRldmlj
ZXMKPj4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGVlL3Jpc2N2
LHJwbWktbXB4eS10ZWUueWFtbAo+PiAgRjogICAgIGRyaXZlcnMvdGVlL29wdGVlLwo+Pgo+PiAg
T1AtVEVFIFJBTkRPTSBOVU1CRVIgR0VORVJBVE9SIChSTkcpIERSSVZFUgo+Pgo+PiAtLQo+PiAy
LjM0LjEKPj4KPiAKPiBSZWdhcmRzLAo+IEFudXAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
