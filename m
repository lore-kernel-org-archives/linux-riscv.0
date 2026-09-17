Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A81C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDKsbmPcY92JEPqTfs+g4mVEHto0j1k6BXr8LQRMBl8=; b=KkvH0gC4RG5EQs
	bAYDl8bCfxFfM9RW325JWHOgMbutV/UqxRsIhyiAXLTzhvYr/gr7Xu4HBxUwucbnFWmriPb8p7dJA
	ccSeB95TxnODzMDWpWxbLdKH8ewZaDpbnYUu/G0gj4KN9lxnZScGID2yX5+nfdzUkXGrFmt0y5OV0
	JJQ96+fuYuhYGbw4vjvyRE5HTSsmTASE9HjOQiy4nBO5ZVAWY7fLM2j16Awxz8cQGm+G5tPWpYaQ+
	mTRpF4J5IUP75tnvn9hHFco6Ox2p3R38c4vqu8qcLl8DW8q6016pGhff6l8LqqN8CwPo6SOMeNJ9Z
	hf6xXrkzD7/QsfQoQqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hdr-0000000CK0X-09E3;
	Thu, 17 Sep 2026 19:19:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hdn-0000000CJzn-0D9o
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 19:19:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH63rR1640538
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=; b=Gg1dBU/UgIrQlyOk
	RB7mM6wl7+MRMoiyeZHFRhxqOHR4lVd3MH993bH4jjs5sP1iBLaO/H4lFbl6++WK
	JROglw1qFdhG597l18dJ1sKBwkIqLCRyvtuhk50AacgjuG9yT+0VRjYF8TwKFii8
	3Ty5qgOpRnDyUgQbwAm9t1m8lYoJESsFSWBZP85LM2fYfvJ9Ymxni31qlH/Y0nsQ
	qaUgDazSh1ioO1KNct6Vk0Fl2Sl7Z2eXsVq28OPr6yozaAgpszIpxGhgryw1TTZ8
	TQy17VblJH69UrKVeHrvVpcmIGjcvnr949TsF2f538kj0zEoveAG4I4YhYBjcSml
	voNgmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0u3f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so32136a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789672765; x=1790277565; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=kjtUv5TDCcqDuswtQgk28ebCkJBQVXqrzmBbz6in3KJlAu+WLWviUv1vISSVtP72QN
         RCTqgfJTHRX0VTqWnoG3K1IRfrffWkST5pUgTT9m0FfPII5iw/3hKnalzOzWDhWdoPRB
         NYR1PB6GLdnLzRKvoJHMVQV8uacJbS9/4FD7gqe4cRbwSJf54dcLQa5hvA88PR99yX+n
         Ey4+mLxofg7VRN+PV0azEJHOGAZnhhxKN3jvk/JGC6gWSRhG9QvEHkngy06mgSB9DzuU
         wcRhVJivtXWy924PvkeqrfZEUX58//yH6m9lpuoGh3VyR8HhQv7W1f8xGz3wvVFHNiON
         P1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672765; x=1790277565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuxVL5v35fCI4IDOIYjgw6aBb4lWvxLcOgjhSBm3cvQ=;
        b=FiwYxq2AJ7zuaPQrO5twhlmnTRHUKheeW4Nxa7qA0zc23GDZtuxs8i/U1psYcU1uR8
         4n5c08q1ukK04oWA+wzZ4XTa10TU6z+p5VGh3DKYxzjiGbbAfv0O4L4genIdMKM6JqFo
         3O9u3SXA3Y7T88Vuvat147JDaESNtT499KCm0u7hfQTgITtFmZ05nxf41vGHCnK8Fz90
         Xv2KkjgJ5DIAXthFLScXUYgOa/YfxjHzGg43fLTouPbwhwNzkolG12hMETZK3dvol/IU
         KEnhNqfeYRIRXvcdGqYOm44JZbhkMSFHmgF65QoTyxs9bl38L0xfxoa0Rqj7kwg6nHcH
         dqVg==
X-Forwarded-Encrypted: i=1; AKwUvBwk+ZZjUKk/wNQsAmcx6JfjO3fQM2Z4JJ3uRXI1xVDKXoKqTac5qXOo0sNadwVHwCm9KE2ccYHbQWhkyw==@lists.infradead.org
X-Gm-Message-State: AFuF++n83c2Lb0BRvQXcAffSkZHkNWslVw8EV/GcM/8hRgxF4Ml+XZke
	GOwR65+eqTYe4xrHMUuyyjHWdmu7X7X8FZZtSIZepU26tEo6Tmod4+an9plB7iPThBoPs6mDnZa
	pxbPg4JGPRjVxsOLEabAead48D6nCftzcDVrsDgvrehn5t+uXf7Ur0lILYrQB2KOHD6T0hQ==
X-Gm-Gg: AYBFou0o3RAhaqDZidQbOSdM+NbjF77iztqYOZIAKiPLjDu7unYzUw8CJrQdq4xIWp0
	ziS/xhq/gSewn+vxaqloSiz5ISZcZQ6hsCNSJzy78N6TpZbocKuGO24k7j93nBFjV7jClul9QKt
	Go6roflGDXbWaxepkz2I70yJoN2vCb17kAcvy4GPflfTPItWC1bXmpa8Od/tfKSoheg1v5ZmvWX
	vep/z/L0+WohXiDGmpWZxJ4OWeG5SNOayTHqFIX37ePM0zyr14iadj+pJ4ePUUPROTSk3xgf6vz
	O4kyN5aADfr2x/qFfUbn9M7t5o+PdhSoetknPJVBxeSApYf6pNUaISFXeWiQOxgCZjs6vXsh7cL
	Fe2sQ1IzsU0eLfsNgS4xgYC3l+8ej4GS/
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429886a91.3.1789672764582;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4484:b0:39d:f97c:bb2f with SMTP id 98e67ed59e1d1-39e54b66cf5mr429836a91.3.1789672764046;
        Thu, 17 Sep 2026 12:19:24 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.114.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5547a04dsm40272a91.3.2026.09.17.12.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 12:19:22 -0700 (PDT)
Message-ID: <4da526fc-f763-4f8b-8b33-362177aec889@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 05:19:15 +1000
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
 <d7ba3e45-84fa-409d-bd43-23caa05587de@oss.qualcomm.com>
 <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAAhSdy1F1rASWA2Xht_LQF6ixBu1oQDBtdkW2YTiqVDqLczPsg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: idEtcTuH31wz2k25P-n0xskDE8qW91jj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX6PI0wC/F4q9s
 x+A/NL3sUkENB2IV8XeJsgjKkIBJHgsUViCK5BKrg5ONt/orgII1pImEfpVdKwPT+KeYkYuCips
 i0rIM3TXbGEIMUBNDltixEnQzrLg284=
X-Proofpoint-GUID: idEtcTuH31wz2k25P-n0xskDE8qW91jj
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac3d3d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Sf69FToG0YAVI/MxTdzZwA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=hNa552Fws9iX_tKzEZsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI3NyBTYWx0ZWRfX+iskl2JLG8My
 /02eoLjYgWrNvzRu3AuGW15/JPBp2Odvm0jVFs0cPBsPn++r9TSHqa/koKB2XfmxvIGujHsQ6Ro
 Ko3gS2aFKt13EZVQoMDJiGYedwirIXCzEppS6OQqpBlWJBsdZMttNuXoBjZYgMzUk1gzyHI/vrq
 /B7GM0ErwdYfp5aPFIRVju80epdvENZTJGMK2bKId5B8vqaBuJLeTR5aaE/Q1F6DrWawxffJEIZ
 0cJ1yZk8ISfc9pRCVhDpIqIMRz+dn+sA3qe4oju5sMlwp8B6P9w8Q1mjrqpRZz2whwCN7XZQJiC
 JKde3qtXcM7z78zCTW6hlH7M+yXTvrf6iHK54jEDVO3Ko/slFmf/q+edRZPq/YSv3+R5R34lX12
 SsBzzyz52WSADQsIowixr8zy5iMCoyFI2/QY37jX/OPecEdGegNJ5tsov4BcZs47boQrdX4POU4
 UNozTWm3K3GkrlI7JVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_121927_208882_237CA291 
X-CRM114-Status: GOOD (  41.98  )
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

SGkgQW51cCwKCk9uIDkvMTcvMjAyNiA2OjM4IFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFRo
dSwgU2VwIDE3LCAyMDI2IGF0IDI6NDbigK9BTSBBbWlycmV6YSBaYXJyYWJpCj4gPGFtaXJyZXph
LnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEFudXAsCj4+Cj4+IE9u
IDkvMTYvMjAyNiA4OjEyIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gT24gU2F0LCBTZXAgMTIs
IDIwMjYgYXQgMzo0NeKAr1BNIEFtaXJyZXphIFphcnJhYmkKPj4+IDxhbWlycmV6YS56YXJyYWJp
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gQWRkIGEgZGV2aWNlLXRyZWUgYmlu
ZGluZyBmb3IgdGhlIE9QLVRFRSBSSVNDLVYgdHJhbnNwb3J0IHVzaW5nIHRoZSBSUE1JCj4+Pj4g
VEVFIHNlcnZpY2UgZ3JvdXAgb3ZlciBTQkkgTVBYWS4KPj4+Pgo+Pj4+IERlc2NyaWJlIG9uZSBt
YWlsYm94IGNoYW5uZWwgcGVyIGhhcnQgYW5kIGFuIG9wdGlvbmFsIGludGVycnVwdCB1c2VkIGFz
Cj4+Pj4gdGhlIGF2YWlsYWJpbGl0eSBkb29yYmVsbCBmb3IgYXN5bmNocm9ub3VzIG5vdGlmaWNh
dGlvbnMuCj4+Pj4KPj4+PiBBZGQgdGhlIGJpbmRpbmcgdG8gdGhlIGV4aXN0aW5nIE9QLVRFRSBN
QUlOVEFJTkVSUyBlbnRyeS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFtaXJyZXphIFphcnJh
YmkgPGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4KPj4+PiAtLS0KPj4+PiAgLi4u
L2JpbmRpbmdzL3RlZS9yaXNjdixycG1pLW1weHktdGVlLnlhbWwgICAgICAgICAgfCA2NSArKysr
KysrKysrKysrKysrKysrKysrCj4+Pj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2Vy
dGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGVlL3Jpc2N2LHJwbWktbXB4eS10ZWUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy90ZWUvcmlzY3YscnBtaS1tcHh5LXRlZS55YW1sCj4+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhmNmZmMzEzZmQ0Mgo+Pj4+
IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdGVlL3Jpc2N2LHJwbWktbXB4eS10ZWUueWFtbAo+Pj4+IEBAIC0wLDAgKzEsNjUgQEAKPj4+
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCj4+Pj4gKyMgQ29weXJpZ2h0IChjKSBRdWFsY29tbSBUZWNobm9sb2dpZXMsIEluYy4gYW5k
L29yIGl0cyBzdWJzaWRpYXJpZXMuCj4+Pj4gKyVZQU1MIDEuMgo+Pj4+ICstLS0KPj4+PiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy90ZWUvcmlzY3YscnBtaS1tcHh5LXRlZS55
YW1sIwo+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPj4+PiArCj4+Pj4gK3RpdGxlOiBSSVNDLVYgUlBNSSBURUUgc2VydmljZSBncm91
cCBiYXNlZCBtZXNzYWdlIHByb3h5Cj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoKPj4+PiArICAt
IEFtaXJyZXphIFphcnJhYmkgPGFtaXJyZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4KPj4+
PiArCj4+Pj4gK2Rlc2NyaXB0aW9uOiB8Cj4+Pj4gKyAgVGhlIFJJU0MtViBQbGF0Zm9ybSBNYW5h
Z2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYSBtZXNzYWdpbmcKPj4+PiArICBw
cm90b2NvbCB3aGljaCBpcyBtb2R1bGFyIGFuZCBleHRlbnNpYmxlLiBUaGUgc3VwZXJ2aXNvciBz
b2Z0d2FyZSBjYW4KPj4+PiArICBzZW5kL3JlY2VpdmUgUlBNSSBtZXNzYWdlcyB2aWEgdGhlIFNC
SSBNUFhZIGV4dGVuc2lvbiBbMl0gb3Igc29tZSBkZWRpY2F0ZWQKPj4+PiArICBzdXBlcnZpc29y
LW1vZGUgUlBNSSB0cmFuc3BvcnQuCj4+Pj4gKwo+Pj4+ICsgIFRoZSBSUE1JIHNwZWNpZmljYXRp
b24gWzFdIGRlZmluZXMgYSBURUUgc2VydmljZSBncm91cCB3aGljaCBpcyB0aGUgUklTQy1WCj4+
Pj4gKyAgYW5hbG9nIG9mIEFybSBGRi1BOiBPUC1URUUgYW5kIHRoZSByaWNoIGV4ZWN1dGlvbiBl
bnZpcm9ubWVudCAoUkVFLCBpLmUuCj4+Pj4gKyAgTGludXgpIGFyZSBwZWVyIGVuZHBvaW50cyBh
bmQgdGhlIFJQTUkgZnJhbWV3b3JrIChtYWNoaW5lIG1vZGUgZmlybXdhcmUpCj4+Pj4gKyAgbWVk
aWF0ZXMgZXZlcnkgbWVzc2FnZS4gRW50ZXJpbmcgT1AtVEVFIG9uIGEgaGFydCBydW5zIGl0IG9u
IHRoYXQgaGFydCB1bnRpbAo+Pj4+ICsgIGl0IHJlc3BvbmRzLCBzbyB0aGUgU0JJIGltcGxlbWVu
dGF0aW9uIHByb3ZpZGVzIG9uZSBTQkkgTVBYWSBjaGFubmVsIHBlcgo+Pj4+ICsgIGhhcnQ7IGFs
bCBvZiB0aGVtIGFyZSBsaXN0ZWQsIGluIGhhcnQgb3JkZXIsIG9uIGEgc2luZ2xlIG5vZGUuCj4+
Pj4gKwo+Pj4+ICsgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Pj4+PiArICBSZWZlcmVuY2VzCj4+Pj4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+Pj4+ICsKPj4+PiArICBbMV0gUklTQy1WIFBsYXRmb3JtIE1hbmFnZW1l
bnQgSW50ZXJmYWNlIChSUE1JKSB2MS4wIChvciBoaWdoZXIpCj4+Pj4gKyAgICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJwbWkvcmVsZWFzZXMKPj4+PiArCj4+Pj4g
KyAgWzJdIFJJU0MtViBTdXBlcnZpc29yIEJpbmFyeSBJbnRlcmZhY2UgKFNCSSkgdjMuMCAob3Ig
aGlnaGVyKQo+Pj4+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNj
di1zYmktZG9jL3JlbGVhc2VzCj4+Pj4gKwo+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+ICsgIGNvbXBh
dGlibGU6Cj4+Pj4gKyAgICBjb25zdDogcmlzY3YscnBtaS1tcHh5LXRlZQo+Pj4+ICsKPj4+PiAr
ICBtYm94ZXM6Cj4+Pj4gKyAgICBtaW5JdGVtczogMQo+Pj4+ICsgICAgZGVzY3JpcHRpb246Cj4+
Pj4gKyAgICAgIE9uZSBTQkkgTVBYWSBjaGFubmVsIGltcGxlbWVudGluZyB0aGUgUlBNSSBURUUg
c2VydmljZSBncm91cCBwZXIgaGFydCwKPj4+PiArICAgICAgbGlzdGVkIGluIHRoZSBzYW1lIG9y
ZGVyIGFzIHRoZSBDUFUgbm9kZXMuCj4+Pgo+Pj4gSSBhbSBub3Qgc3VyZSB3aHkgeW91IG5lZWQg
c2VwYXJhdGUgTVBYWSBjaGFubmVsIHBlciBoYXJ0LiBUaGUgTVBYWSBzaGFyZWQKPj4+IG1lbW9y
eSBpcyBhbHJlYWR5IHBlci1oYXJ0IHdoZXJlYXMgdGhlIE1QWFkgY2hhbm5lbCB3aWxsIGJlIGRv
bWFuIHNwZWNpZmljCj4+PiBmb3IgVEVFLgo+Pgo+PiBUcnVlLiBNeSByZWFzb25pbmcgd2FzIHRo
YXQgVEVFX0NBTEwsIGFzIEkgdW5kZXJzdGFuZCBpdCwgaXMgZXhwZWN0ZWQgdG8gZXhlY3V0ZSBv
bgo+PiB0aGUgc2FtZSBoYXJ0IHRoYXQgaXNzdWVkIGl0LiBHaXZlbiB0aGF0LCB0aGUgbWFpbGJv
eCBjb3JlIGhvbGRzIHRoZSBwZXItY2hhbm5lbCBzcGlubG9jawo+PiBhY3Jvc3MgdGhlIGNhbGwg
dG8gYHNlbmRfZGF0YSgpYCwgd2hpbGUgdGhlIHVuZGVybHlpbmcgYHNiaV9lY2FsbCgpYCBpcyBz
eW5jaHJvbm91cwo+PiBhbmQgZG9lcyBub3QgcmV0dXJuIHVudGlsIHRoZSBURUUgY2FsbCBjb21w
bGV0ZXMuCj4+Cj4+IFNvLCBpZiB0d28gaGFydHMgc2hhcmVkIHRoZSBzYW1lIGNoYW5uZWwsIGEg
aGFydCBleGVjdXRpbmcgYSBsb25nLXJ1bm5pbmcgVEVFIG9wZXJhdGlvbgo+PiB3b3VsZCBob2xk
IHRoYXQgY2hhbm5lbCdzIGxvY2sgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgY2FsbCwgYW5kIGFu
b3RoZXIgaGFydAo+PiB0cnlpbmcgdG8gZW5xdWV1ZSBvbiB0aGUgc2FtZSBjaGFubmVsIHdvdWxk
IHNwaW4gd2FpdGluZyBmb3IgaXQuCj4+Cj4+IFVzaW5nIHBlci1oYXJ0IGNoYW5uZWxzIGF2b2lk
cyB0aGF0IGNyb3NzLWhhcnQgY29udGVudGlvbi4gSSBhZ3JlZSB0aGF0IHRoaXMgbWF5Cj4+IG5v
dCBiZSB0aGUgcmlnaHQgbGF5ZXIgaW4gd2hpY2ggdG8gYWRkcmVzcyB0aGUgaXNzdWUuIEkgZGlk
IG5vdCBwdWxsIGl0IHRvIHRoZSBkaXNjdXNzaW9uIGluIHRvIHRoaXMgUkZDLgo+PiBJJ20gaGFw
cHkgdG8gdXNlIHNpbmdsZSBjaGFubmVsIGZvciBub3cgYW5kIGZvbGxvdyB1cCBvbiBpdCBzZXBh
cmF0ZWx5IGlmIHVzZWZ1bC4KPiAKPiBUaGUgcGVyLWNoYW5uZWwgc3BpbmxvY2sgc2VyaWFsaXph
dGlvbiBpcyBub3QgcmVxdWlyZWQgZm9yIFNCSSBNUFhZIGJhc2VkCj4gbWFpbGJveCBjaGFubmVs
cyBiZWNhdXNlIHRoZSB1bmRlcmx5aW5nIFNCSSBpbXBsZW1lbnRhdGlvbiB3aWxsIHRha2UgY2Fy
ZQo+IG9mIHRoZSBzZXJpYWxpemF0aW9uIHdoZXJlIHJlcXVpcmVkLgo+IAo+IEluIG90aGVyIHdv
cmRzLCB3ZSBuZWVkIHRvIGltcHJvdmUgdGhlIExpbnV4IG1haWxib3ggZnJhbWV3b3JrIHRvIGFs
bG93Cj4gU0JJIE1QWFkgbWFpbGJveCBjb250cm9sbGVyIHRlbGwgTGludXggbWFpbGJveCBmcmFt
ZXdvcmsgdG8gbm90IHVzZQo+IHBlci1jaGFubmVsIHNwaW5sb2NrIGJhc2VkIHNlcmlhbGl6YXRp
b24uCj4gCj4gT25lIHBvc3NpYmxlIGFwcHJvYWNoIHRvIGVuaGFuY2UgTGludXggbWFpbGJveCBm
cmFtZXdvcmsgaXMgc2hvdwo+IGJlbG93LiBNYXkgYmUgaW5jbHVkZSB0aGlzIChvciBzb21lIG90
aGVyIGFwcHJvYWNoKSBhcyBhIHNlcGFyYXRlCj4gcGF0Y2ggaW4geW91ciBzZXJpZXMgPwo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbWFpbGJveC5jIGIvZHJpdmVycy9tYWlsYm94
L21haWxib3guYwo+IGluZGV4IGVmYWNkMjRhMDg1ZC4uNDM3ZTdlMmU2YWQ1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LmMKPiArKysgYi9kcml2ZXJzL21haWxib3gvbWFp
bGJveC5jCj4gQEAgLTQ4LDcgKzQ4LDcgQEAgc3RhdGljIGludCBhZGRfdG9fcmJ1ZihzdHJ1Y3Qg
bWJveF9jaGFuICpjaGFuLCB2b2lkICptc3NnKQo+ICBzdGF0aWMgdm9pZCBtc2dfc3VibWl0KHN0
cnVjdCBtYm94X2NoYW4gKmNoYW4pCj4gIHsKPiAgIHVuc2lnbmVkIGNvdW50LCBpZHg7Cj4gLSB2
b2lkICpkYXRhOwo+ICsgdm9pZCAqZGF0YSA9IE5VTEw7Cj4gICBpbnQgZXJyID0gLUVCVVNZOwo+
IAo+ICAgc2NvcGVkX2d1YXJkKHNwaW5sb2NrX2lycXNhdmUsICZjaGFuLT5sb2NrKSB7Cj4gQEAg
LTY2LDE0ICs2NiwyMiBAQCBzdGF0aWMgdm9pZCBtc2dfc3VibWl0KHN0cnVjdCBtYm94X2NoYW4g
KmNoYW4pCj4gCj4gICBpZiAoY2hhbi0+Y2wtPnR4X3ByZXBhcmUpCj4gICBjaGFuLT5jbC0+dHhf
cHJlcGFyZShjaGFuLT5jbCwgZGF0YSk7Cj4gLSAvKiBUcnkgdG8gc3VibWl0IGEgbWVzc2FnZSB0
byB0aGUgTUJPWCBjb250cm9sbGVyICovCj4gLSBlcnIgPSBjaGFuLT5tYm94LT5vcHMtPnNlbmRf
ZGF0YShjaGFuLCBkYXRhKTsKPiArCj4gKyAvKiBUcnkgdG8gc3VibWl0IGEgbWVzc2FnZSB0byB0
aGUgTUJPWCBjb250cm9sbGVyIGluIGF0b21pYyBjb250ZXh0ICovCj4gKyBpZiAoY2hhbi0+bWJv
eC0+b3BzLT5zZW5kX2RhdGEpCj4gKyBlcnIgPSBjaGFuLT5tYm94LT5vcHMtPnNlbmRfZGF0YShj
aGFuLCBkYXRhKTsKPiArIGVsc2UgaWYgKGNoYW4tPm1ib3gtPm9wcy0+c2VuZF9kYXRhX25vbmF0
b21pYykKPiArIGVyciA9IDA7Cj4gICBpZiAoIWVycikgewo+ICAgY2hhbi0+YWN0aXZlX3JlcSA9
IGRhdGE7Cj4gICBjaGFuLT5tc2dfY291bnQtLTsKPiAgIH0KPiAgIH0KPiAKPiArIC8qIFRyeSB0
byBzdWJtaXQgYSBtZXNzYWdlIHRvIHRoZSBNQk9YIGNvbnRyb2xsZXIgaW4gbm9uLWF0b21pYyBj
b250ZXh0ICovCj4gKyBpZiAoIWVyciAmJiBjaGFuLT5tYm94LT5vcHMtPnNlbmRfZGF0YV9ub25h
dG9taWMpCj4gKyBlcnIgPSBjaGFuLT5tYm94LT5vcHMtPnNlbmRfZGF0YV9ub25hdG9taWMoY2hh
biwgZGF0YSk7Cj4gKwo+ICAgaWYgKCFlcnIgJiYgKGNoYW4tPnR4ZG9uZV9tZXRob2QgJiBNQk9Y
X1RYRE9ORV9CWV9QT0xMKSkgewo+ICAgLyoga2ljayBzdGFydCB0aGUgdGltZXIgaW1tZWRpYXRl
bHkgdG8gYXZvaWQgZGVsYXlzICovCj4gICBzY29wZWRfZ3VhcmQoc3BpbmxvY2tfaXJxc2F2ZSwg
JmNoYW4tPm1ib3gtPnBvbGxfaHJ0X2xvY2spCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJv
eC9yaXNjdi1zYmktbXB4eS1tYm94LmMKPiBiL2RyaXZlcnMvbWFpbGJveC9yaXNjdi1zYmktbXB4
eS1tYm94LmMKPiBpbmRleCBiMDJjMTdjMmM2NGUuLjlhZmExMGM3MmJkNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21haWxib3gvcmlzY3Ytc2JpLW1weHktbWJveC5jCj4gKysrIGIvZHJpdmVycy9t
YWlsYm94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYwo+IEBAIC00MjAsNyArNDIwLDcgQEAgc3RhdGlj
IHZvaWQgbXB4eV9tYm94X3NodXRkb3duKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4pCj4gIH0KPiAK
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtYm94X2NoYW5fb3BzIG1weHlfbWJveF9vcHMgPSB7Cj4g
LSAuc2VuZF9kYXRhID0gbXB4eV9tYm94X3NlbmRfZGF0YSwKPiArIC5zZW5kX2RhdGFfbm9uYXRv
bWljID0gbXB4eV9tYm94X3NlbmRfZGF0YSwKPiAgIC5wZWVrX2RhdGEgPSBtcHh5X21ib3hfcGVl
a19kYXRhLAo+ICAgLnN0YXJ0dXAgPSBtcHh5X21ib3hfc3RhcnR1cCwKPiAgIC5zaHV0ZG93biA9
IG1weHlfbWJveF9zaHV0ZG93biwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tYWlsYm94
X2NvbnRyb2xsZXIuaAo+IGIvaW5jbHVkZS9saW51eC9tYWlsYm94X2NvbnRyb2xsZXIuaAo+IGlu
ZGV4IDI2YTIzOGE2Zjk0MS4uNGJjNDc5OGM0YjFmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvbWFpbGJveF9jb250cm9sbGVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21haWxib3hfY29u
dHJvbGxlci5oCj4gQEAgLTI4LDYgKzI4LDEwIEBAIHN0cnVjdCBtYm94X2NoYW47Cj4gICAqIHRy
YW5zbWlzc2lvbiBvZiBkYXRhIGlzIHJlcG9ydGVkIGJ5IHRoZSBjb250cm9sbGVyIHZpYQo+ICAg
KiBtYm94X2NoYW5fdHhkb25lIChpZiBpdCBoYXMgc29tZSBUWCBBQ0sgaXJxKS4gSXQgbXVzdCBu
b3QKPiAgICogc2xlZXAuCj4gKyAqIEBzZW5kX2RhdGFfbm9uYXRvbWljOiBUaGUgQVBJIGFza3Mg
dGhlIE1CT1ggY29udHJvbGxlciBkcml2ZXIsIGluIG5vbi1hdG9taWMKPiArICogY29udGV4dCB0
cnkgdG8gdHJhbnNtaXQgYSBtZXNzYWdlIG9uIHRoZSBidXMuIFJldHVybnMgMCBpZgo+ICsgKiBk
YXRhIGlzIGFjY2VwdGVkIGZvciB0cmFuc21pc3Npb24sIG5lZ2F0aXZlIGVycm9yIHdoaWxlIHJl
amVjdGluZwo+ICsgKiBpZiB0aGUgcmVtb3RlIG5vdCBhY2NjZXB0ZWQuCj4gICAqIEBmbHVzaDog
Q2FsbGVkIHdoZW4gYSBjbGllbnQgcmVxdWVzdHMgdHJhbnNtaXNzaW9ucyB0byBiZSBibG9ja2lu
ZyBidXQKPiAgICogdGhlIGNvbnRleHQgZG9lc24ndCBhbGxvdyBzbGVlcGluZy4gVHlwaWNhbGx5
IHRoZSBjb250cm9sbGVyCj4gICAqIHdpbGwgaW1wbGVtZW50IGEgYnVzeSBsb29wIHdhaXRpbmcg
Zm9yIHRoZSBkYXRhIHRvIGZsdXNoIG91dC4KPiBAQCAtNTMsNiArNTcsNyBAQCBzdHJ1Y3QgbWJv
eF9jaGFuOwo+ICAgKi8KPiAgc3RydWN0IG1ib3hfY2hhbl9vcHMgewo+ICAgaW50ICgqc2VuZF9k
YXRhKShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLCB2b2lkICpkYXRhKTsKPiArIGludCAoKnNlbmRf
ZGF0YV9ub25hdG9taWMpKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sIHZvaWQgKmRhdGEpOwo+ICAg
aW50ICgqZmx1c2gpKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sIHVuc2lnbmVkIGxvbmcgdGltZW91
dCk7Cj4gICBpbnQgKCpzdGFydHVwKShzdHJ1Y3QgbWJveF9jaGFuICpjaGFuKTsKPiAgIHZvaWQg
KCpzaHV0ZG93bikoc3RydWN0IG1ib3hfY2hhbiAqY2hhbik7Cj4gCj4gUmVnYXJkcywKPiBBbnVw
CgpZb3UgYXJlIHJpZ2h0LiBJJ2xsIGluY2x1ZGUgaXQgaW4gYSBzZXBhcmF0ZSBwYXRjaCBpbiB0
aGUgbmV4dCBzZXJpZXMuCgpUaGFua3MuCkFtaXIKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
