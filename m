Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C4CA5FB1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 03:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TQxSV89WpWSGG1hcfIswdde0Xz7npLp11aIUxm1ckI=; b=CJMyeX2d7Ssyxc
	sahwMghql7GY9SHSRRHL79OSvNlDZ6YsZjtymkjLLPPREiBWn0YmtcU0j6hd+UUnDfPE+Xkm3lurU
	IpC/e3ni9SYJpndpgXDd7mLMnFGHuHbwbeDxepbiAKZG14B8p7gms6NJs4EH9QIkLxTNKy5zFD8jt
	bBXpXP6ETkDw1OObcK+wtzR+l86paWUZ8has2YBo/qeApyXz7P39f7Bnlzcm7ZJjCIsjME1p63LTO
	2P+Ua0jMycwI54W22jh7jbi+OcgPgEuWs+itUObeIewFBgJ44xVL4jdpLERmo5p2sD7QtWP3yj1vv
	JwnObg8nURZKwGuQZvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLl-00000002BzB-0Pon;
	Tue, 29 Sep 2026 03:17:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOLi-00000002ByO-369B
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 03:17:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jgmI4181782
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5V+tcV8r7h/bBAiPAxg49R
	LDye23rkCQxQjoFzn0eAY=; b=pThb0bHf0CNLv7kdyhTwajN94O2reA4BP1EvsW
	wZwUocvlVT4ncCLqlYHdnYGofD7urzJlmpuLHXzb35c2kr8ybt3w2JK9WF0Ig0XP
	ap4ZyRxAVm4KND0rIOsLCxZ21YYs12sdp1zj/36OB7NMYfoAwlCa+yIYiITB8d9e
	cb/bSV6zyb7GAEYPaFvDQqidpdhSRYGM4/jEKZXybNVoydywL+f18pWXO91n7jUf
	6i5pAjJu8ayPt8Vrht/wsDrTr5e8qGJGxtgLl3lE4M0zKO92MYIq7TfsTigbazIw
	5/Tm4tbxGcKOxp0FpCt7Y001FFMnqZrSflyQG/aQ+8gmi2Vg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmu9c4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 03:17:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438492fb40so212988c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 20:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651865; x=1791256665; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5V+tcV8r7h/bBAiPAxg49RLDye23rkCQxQjoFzn0eAY=;
        b=kYvzHL5M6PXiRg/BGhXuR01NCEpjfaDH/MbQbckvhm3SbxDcl0thTsqK2Jhc3xwiJt
         ovsgnsenoWGxRjVunBOsnbvRsFbBav+gOhSWpIBZO6kXA4nIhhf22L26yLhTvucPPD3U
         9KzZSf7ls7nfLkdaQkX5u2imClxNZNSJ6BrJJAHC0uPgpZc0TLZ/xwwTXguU9OZr3BGg
         E4TLoiaDzfnlHLPYcNQtjyyj+V2ZgQnOed2+vbQEjCscP8eAkdMB2+V1Vlx4jiXrqfoH
         tG8jnIBFumqZ0w83h0gD4+J89MGpkH2/EFYJLxDhUNGRlfUD6jS1wmxQbk36FQ7j/aXB
         Eb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651865; x=1791256665;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5V+tcV8r7h/bBAiPAxg49RLDye23rkCQxQjoFzn0eAY=;
        b=cZWim4F34/b6w5VIXxffw1pzKae7EmMBnZaGMa4M4zsF9bkiS5CqY1gmQct10Qe5K9
         mECn+xkczn+PmmwqmTF1q/tmzZPhKVTs1OvYoaxMrYaIxA7Id60i80Bk82W81zihMRZF
         i/GlRAZ0I0D87/BWubULETtTTdxY1aQG53jR/nMLRhTGGoZYFebxaBLbxzezMPgSUCG+
         6oDmuufR/WCPN5R8cB2w4dVEa5PfAdXB9f0ZRaZLDSjacMVtbuoRi/HnphdOtKu05rWp
         q4slIvCFR3P8IW1bURd81Qc7z7sswCDCaCa/10KdjMiyKXkUVsJ7EITSFIil7P+9zmsI
         jbdA==
X-Forwarded-Encrypted: i=1; AKwUvByn5cP+t8fEzCTzWIjJ5mABorB4HcptoFuWzDLZQ2MJDyuGn7i01Z4P9KAIMGPpHxax+07pHVf2gTK4GQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kRxi9JNMmzeJEYlGdFKv+X5HV+euWX57o1qAGqiJ/Rm4ud+i94
	RdJAUx3d+CBJLs6Jm083+9CqDxeMiAwYnYwlsbm8XP8ausv0IVeMt8efP9t+1T9styolzqz1p+N
	nh81sf0p7lh83mmdz5fKRKkI/IkJZfq4D/NLehrto3Q3880jxp3xxUg3nGDcUIixuwOdIzg==
X-Gm-Gg: AYBFou2Sr3ZKXHCeSOZXHnfoYgnd7/fUJsY0zgMgnWjo0TB+ty09jXNb2Pw+DiMTTXN
	/JW5aOhOxQTbIhch02olJFfVEmPrSTCBugcuzvO25NLtCTCy24xVzrhwIMxJtyIXSzg2ozwog1u
	VwaP9SLJ8rNRFyq/MsZ8ZR6mcvh1T6tu6+PFWpTisoWUd9Zpvpq3dvk7hgOYmSySo11tr9YZJHl
	45QG08EJZn9TQK8bDZB1z1XvNhI7d7RNYvED+ze7I4xEWHCsIKKqURb76Nhx4K3tAsqrHbF5nFP
	Bod1ZZoL4qoAlWLyXuWpEdiFxPsFp2OTsufB6tKVn/GU2ToqV4KW4gtBBEnv6TuQhi+1W9GIBoB
	NTOX7G66t5H8WD6zmYrzwtElZIdqCH92OkqfPW4S+lAnvtRVztR9yIqjSwtM=
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr4999988c88.8.1790651865143;
        Mon, 28 Sep 2026 20:17:45 -0700 (PDT)
X-Received: by 2002:a05:701b:2212:b0:149:ef22:2fa2 with SMTP id a92af1059eb24-149ef223168mr4999954c88.8.1790651864531;
        Mon, 28 Sep 2026 20:17:44 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC 00/10] firmware: riscv: add RPMI TEE service group
 transport
Date: Mon, 28 Sep 2026 20:16:51 -0700
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKMtu2oC/x3MPQqAMAxA4atIZgO1FbGuggdwFYeqUTP4QypFE
 O9ucfyG9x7wJEwequQBocCejz0iSxMYV7cvhDxFg1a6UFaXKOzHgHJujBcRuoGxUIasM0NurIU
 YnkIz3/+0g7apoX/fDzEuc3xpAAAA
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXx1T1pEk9y1cU
 usKgkr/5LpYONTUFHoIkXjP2ek9Rmej/r0vmFvEpGehk0fR8mH2hxy/RhLwbSxy06bGk8qzd/Nh
 xDA20uVnKRrA8qqAWn5ezr/uvrLUmJEtfHOM6rCbRdhXa32VNIgX6FXExdQG7pyYbaN9+8jGYMq
 UBiUF7rOsINW5wa3dJVPJLHGm94nOObr1sbYkQUqHPBG7bdc2mQC/vCkmM+N27M9WXtzW2HQcKZ
 gkTE1yAJ5MTQ0hYClHG++SOT6JiSMUBgxkDvxAWs9wzXYwUPabOBFjHQ4nFXE77lXpLvjk4kvPb
 W9blErXD6HOVFM5gOVC+5YrGfkxrp76Ua4sCoZPHwT/m5xIIzqiULUN+PjtqDo/CHrL15zmGzXH
 XsePlQbt7vaV7f2BaiBxh3mEp4hBUV5jVo+L6LmnnIwv/+CVNWXgl2NcBinOunyg0COJLlL5jR9
 FLZWzVEHvPVTy5dJfxA==
X-Proofpoint-GUID: gHVEV5YEkknojpaznOTZCwHdLIFsyJZz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX2XX3ZSOGq201
 l7LV54Ey6kzWnlNKVCcg+ZqKG8ff/R5R+EYSrkE82KPu44ZPeCG3uv43PgEpwuuri5IqbjHj+Lj
 E+IQfODND74EAQvrFyQvscbsNKpoMH0=
X-Proofpoint-ORIG-GUID: gHVEV5YEkknojpaznOTZCwHdLIFsyJZz
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb2dd9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=SoDOECYcTc9ExgbA9_YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_201746_808963_A6F2F1F4 
X-CRM114-Status: GOOD (  15.15  )
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

VGhpcyBSRkMgc2VyaWVzIGFkZHMgdGhlIFJJU0MtViBSUE1JIFRFRSBzZXJ2aWNlIGdyb3VwIHRy
YW5zcG9ydCBbMV0sCndoaWNoIHByb3ZpZGVzIFJJU0MtViBzeXN0ZW1zIGEgbWVjaGFuaXNtIGZv
ciBMaW51eCB0byBjb21tdW5pY2F0ZQp3aXRoIFRFRSBlbmRwb2ludHMuIExpbnV4IGFuZCBhIFRF
RSBhY3QgYXMgZW5kcG9pbnRzIG9mIHRoZSBSUE1JIFRFRQpzZXJ2aWNlIGdyb3VwLCB3aGlsZSB0
aGUgUlBNSSBmcmFtZXdvcmsgaW4gbWFjaGluZS1tb2RlIGZpcm13YXJlCm1lZGlhdGVzIGNvbW11
bmljYXRpb24gYmV0d2VlbiB0aGVtIG92ZXIgYW4gU0JJIE1QWFkgWzJdIG1haWxib3gKY2hhbm5l
bC4KClRoZSBzZXJpZXMgaXMgbGF5ZXJlZCBhcyBmb2xsb3dzOgoKIC0gVHdvIG1haWxib3ggcGF0
Y2hlcyBhZGQgYSBkaXJlY3Qgc3luY2hyb25vdXMgc2VuZCBtb2RlCiAgIChtYm94X3NlbmRfbWVz
c2FnZV9zeW5jKCkpIGFuZCBpdHMgaW1wbGVtZW50YXRpb24gZm9yIFJQTUkgTVBYWQogICBjaGFu
bmVscywgbmVlZGVkIGJlY2F1c2UgUlBNSSBURUUgcmVxdWVzdHMgbXVzdCBjb21wbGV0ZQogICBz
eW5jaHJvbm91c2x5IGluIHRoZSBjYWxsaW5nIGNvbnRleHQuCgogLSBUaGUgUlBNSSBURUUgYnVz
IHJlZ2lzdGVycyBvbmUgZGV2aWNlIHBlciBkaXNjb3ZlcmVkIFRFRSBlbmRwb2ludAogICBhbmQg
c2VydmljZSBVVUlEIHBhaXIsIGZvbGxvd2luZyB0aGUgZGV2aWNlLXBlci1zZXJ2aWNlIG1vZGVs
LAogICBzbyBpbmRpdmlkdWFsIHNlcnZpY2UgZHJpdmVycyBjYW4gYmluZCBpbmRlcGVuZGVudGx5
LgoKIC0gVGhlIFJQTUkgVEVFIHRyYW5zcG9ydCBjb3JlIGJpbmRzIHRvIHRoZSBtYWlsYm94IGNo
YW5uZWwgYW5kCiAgIHZhbGlkYXRlcyB0aGUgUlBNSSBhbmQgVEVFIHNlcnZpY2UtZ3JvdXAgdmVy
c2lvbnMgYmVmb3JlIGFueQogICBkaXNjb3Zlcnkgb3Igc2VydmljZSB0cmFmZmljIGlzIGF0dGVt
cHRlZC4KCiAtIFN5c3RlbS1pbmZvcm1hdGlvbiBwYXJzaW5nIGFuZCBkaXNjb3Zlcnkgd2FsayB0
aGUgZmlybXdhcmUtcHJvdmlkZWQKICAgZGVzY3JpcHRvciB0YWJsZXMgdG8gZmluZCBwaHlzaWNh
bCBURUUgZW5kcG9pbnRzIGFuZCB0aGUgc2VydmljZXMKICAgdGhleSBleHBvc2UsIHJlZ2lzdGVy
aW5nIGEgYnVzIGRldmljZSBmb3IgZWFjaC4KCiAtIE1lbW9yeSBwYXJjZWwgb3BlcmF0aW9ucyAo
bGVuZCwgc2hhcmUsIHJlY2xhaW0pIGxldCBhIGNvbnN1bWVyCiAgIGRyaXZlciBzaGFyZSBtZW1v
cnkgd2l0aCBhIFRFRSBlbmRwb2ludC4gTGludXggY3JlYXRlcyBhIHBhcmNlbCBhbmQKICAgdGhl
IHBhcmNlbCBpZGVudGlmaWVyIGlzIHRoZW4gdXNlZCBieSB0aGUgY29uc3VtZXIncyBvd24gcHJv
dG9jb2wgdG8KICAgcmVmZXIgdG8gdGhhdCBtZW1vcnkuCgogLSBTaWduYWwgYnVzZXMgbGV0IGEg
Y29uc3VtZXIgZHJpdmVyIGV4Y2hhbmdlIGFzeW5jaHJvbm91cwogICBub3RpZmljYXRpb25zIHdp
dGggaXRzIFRFRSBlbmRwb2ludCBpbiBib3RoIGRpcmVjdGlvbnMuCgpUaGlzIHNlcmllcyBvbmx5
IGVzdGFibGlzaGVzIHRoZSB0cmFuc3BvcnQsIGJ1cywgYW5kIGRpc2NvdmVyeSBsYXllci4KQSBj
b25zdW1lciBkcml2ZXIgLSBhbiBPUC1URUUgYmFja2VuZCBtYXBwZWQgb250byB0aGVzZSBzZXJ2
aWNlcywKYW5hbG9nb3VzIHRvIGRyaXZlcnMvdGVlL29wdGVlL2ZmYV9hYmkuYyDigJQgaXMgaW50
ZW5kZWQgdG8gZm9sbG93IGluIGEKbGF0ZXIgc2VyaWVzIG9uY2UgdGhpcyB0cmFuc3BvcnQgaXMg
cmV2aWV3ZWQuCgpGZWVkYmFjayBvbiB0aGUgb3ZlcmFsbCBhcmNoaXRlY3R1cmUsIHRoZSBidXMv
ZGV2aWNlIG1vZGVsLCBhbmQgdGhlCm1lbW9yeS1wYXJjZWwgYW5kIHNpZ25hbC1idXMgYWJzdHJh
Y3Rpb25zIGlzIGVzcGVjaWFsbHkgd2VsY29tZSBhdAp0aGlzIHN0YWdlIGluIHRoaXMgUkZDIHNl
cmllcy4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1pL2Nv
bW1pdHMvbWFpbi9zcmMvc3J2Z3JwLXRlZS5hZG9jClsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzCgpTaWduZWQtb2ZmLWJ5OiBBbWlycmV6
YSBaYXJyYWJpIDxhbWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+Ci0tLQpBbWlycmV6
YSBaYXJyYWJpICgxMCk6CiAgICAgIG1haWxib3g6IGFkZCBkaXJlY3Qgc3luY2hyb25vdXMgc2Vu
ZCBzdXBwb3J0CiAgICAgIG1haWxib3g6IG1weHk6IGFkZCBkaXJlY3Qgc3luY2hyb25vdXMgc2Vu
ZAogICAgICBmaXJtd2FyZTogYWRkIFJQTUkgVEVFIGJ1cyBzdXBwb3J0CiAgICAgIGR0LWJpbmRp
bmdzOiBmaXJtd2FyZTogYWRkIFJJU0MtViBSUE1JIFRFRSB0cmFuc3BvcnQKICAgICAgZmlybXdh
cmU6IGFkZCBSUE1JIFRFRSB0cmFuc3BvcnQgY29yZQogICAgICBmaXJtd2FyZTogcmlzY3Y6IHJw
bWktdGVlOiBwYXJzZSBzeXN0ZW0gaW5mb3JtYXRpb24gdGFibGVzCiAgICAgIGZpcm13YXJlOiBy
aXNjdjogcnBtaS10ZWU6IGRpc2NvdmVyIFRFRSBzZXJ2aWNlcwogICAgICBmaXJtd2FyZTogcmlz
Y3Y6IHJwbWktdGVlOiBjYWNoZSBURUUgY2FwYWJpbGl0aWVzCiAgICAgIGZpcm13YXJlOiByaXNj
djogcnBtaS10ZWU6IGFkZCBtZW1vcnkgcGFyY2VsIG9wZXJhdGlvbnMKICAgICAgZmlybXdhcmU6
IHJpc2N2OiBycG1pLXRlZTogYWRkIHNpZ25hbCBidXMgc3VwcG9ydAoKIC4uLi9iaW5kaW5ncy9m
aXJtd2FyZS9yaXNjdixycG1pLXRlZS55YW1sICAgICAgICAgIHwgICAzNSArCiBkcml2ZXJzL2Zp
cm13YXJlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKwogZHJpdmVy
cy9maXJtd2FyZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGRy
aXZlcnMvZmlybXdhcmUvcmlzY3ZfcnBtaV90ZWUvS2NvbmZpZyAgICAgICAgICAgIHwgICAgOCAr
CiBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X3JwbWlfdGVlL01ha2VmaWxlICAgICAgICAgICB8ICAg
IDggKwogZHJpdmVycy9maXJtd2FyZS9yaXNjdl9ycG1pX3RlZS9idXMuYyAgICAgICAgICAgICAg
fCAgMjAyICsrKwogZHJpdmVycy9maXJtd2FyZS9yaXNjdl9ycG1pX3RlZS9kcml2ZXIuYyAgICAg
ICAgICAgfCAxODE2ICsrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
X3JwbWlfdGVlL3N5c2luZm8uYyAgICAgICAgICB8ICAzODUgKysrKysKIGRyaXZlcnMvZmlybXdh
cmUvcmlzY3ZfcnBtaV90ZWUvc3lzaW5mby5oICAgICAgICAgIHwgIDI0NCArKysKIGRyaXZlcnMv
bWFpbGJveC9tYWlsYm94LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3MiArLQogZHJp
dmVycy9tYWlsYm94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYyAgICAgICAgICAgICAgfCAgMTk2ICsr
LQogaW5jbHVkZS9saW51eC9tYWlsYm94L3Jpc2N2LXJwbWktbWVzc2FnZS5oICAgICAgICAgfCAg
IDEzICsKIGluY2x1ZGUvbGludXgvbWFpbGJveF9jbGllbnQuaCAgICAgICAgICAgICAgICAgICAg
IHwgICAgMyArCiBpbmNsdWRlL2xpbnV4L21haWxib3hfY29udHJvbGxlci5oICAgICAgICAgICAg
ICAgICB8ICAgMTAgKwogaW5jbHVkZS9saW51eC9ycG1pX3RlZS5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTc1ICsrCiAxNSBmaWxlcyBjaGFuZ2VkLCAzMDk4IGluc2VydGlvbnMoKyks
IDcyIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDYzNzVlNjFjMDFlOTNlMzVlZTdhY2Qz
MzZhNjg5YWMxZmFlNGI1MDkKY2hhbmdlLWlkOiAyMDI2MDkyOC1yaXNjdi1ycG1pLXRlZS1hYmkt
NjAzZTlhM2I0Mzk5CgpCZXN0IHJlZ2FyZHMsCi0tIApBbWlycmV6YSBaYXJyYWJpIDxhbWlycmV6
YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
