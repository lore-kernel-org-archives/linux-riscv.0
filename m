Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA55CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB9izyRJRVFDa98zcMCimJ7LJ72acoDRIKGz4ctyJWw=; b=z5uG8UofQUSBls
	YeGVkmNlrx5sbO9oYtWGfCMip3+AFhNFBAw/rqaWSZyg5Bk0cSzFJ29c1sc37JXION+ZiQs9pC0dz
	r+qNmKnxBXzTIEYdvSp3JmW6udJx1cwC2XdHwtAUNq0QBTCmsuon7lSNB9ObFKZ9JDfJK16pDTRH/
	eoMFMF7wmW2cLhm52DJznY83+gTqhO7DUzrUw/K9pCBbftkhfzoOnn3sspp+hmkhmh9pMDq9GRyP5
	6/CBUv69ZWxVy/y68InwyBrre/vX3T3DKCMMRJIjNpFKaWEUtpRl3ofu5RvmVRSdXXFcn49nW2TXt
	xlzYEBWqfI2N3TVS5vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE00B-00000000EHx-3pdL;
	Tue, 06 Oct 2026 07:54:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE009-00000000EFn-1uRB
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eBte3269458
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=; b=TCUUpHGqUNnSnBbM
	Ka2gFF6b1N63N8paycB00rfSWKRnvI978SQVTmHjYXiv1kPbeg6CFqEhC+rZ6Orh
	lkcmeGrD7AxdoyL901td0qGJoVR6I4y4jzjlyUljPLWVX1iWqbw8x1RTRoncimlz
	rXCXrkGeitLizDdnlbXL/8vXm7BEskhZUa13SpiWsYNgSFpAsElUwjFc5RMbpdoM
	6VlYiNvUPE6sj2e1EhVCntjLcUmkd8qnMKK99pBZJwxT/dTGN3q85l5LnxCJ3mf1
	xWYZ5nuCFc/8PtEONrWZmCeZl6ZdS50dTQjvzlEJWGzLDD2gCetF8AcvT3LeSuzm
	QQetEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkujx4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so572561985a.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273256; x=1791878056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=;
        b=NnZVDXotvP4DAG5H6SmZZHsY9+Y5zmwLYNM87x6RtyFUAc8LCBqnFCegKojqaFLr4U
         jxDEn6p5GLtcTzLuHUz92V6aK882+tYAt0A9Xp03rTi+dwhZZ3XVHe6HBny+pM5PhwJw
         gzsmUbs5DNWUJW7he3MUcZgwTTdzlIXSMJRPm+EHlWEmLOk2/kar4zQnBAy/eKV9jEdQ
         JGMIr1y/XFzwRzlmKEFLJo+DqALIAxpioHXSyRDV1CI4qFOUpq4I7YSUvPrxreyneGi9
         5symArQirsNovP2zq3U3Mgou45opAVKFFiukl8/m9ABH23J4kXFLu9WufdOWpO1gD4Rt
         C3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273256; x=1791878056;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfgie0JUgoj2t3qdSY96bh/GuBapB4o0d4bNUXr17Dw=;
        b=dF+FgiMruvP4zA/UDx7TmgszyrDv3LdIBJ42tpJ2IwVwlNetFd2XJDhCMKB8ma+De5
         TSgBUPg/eqpHWhiEycHzPtUjTqQlDVOoeoaXpLLH6gy2U1D248J3YYXwmjfbki0jq6x0
         AwX6kqbAT6tzBZvG+joZGStZ8oAZHLf7wn6gXdvj621a9D1HzzOVIuCwOShbC2bedseI
         50MztIhhD6kWDVj4uQD9d/t1wRGrYe3t3JOegT/afTo8Zjqjb8BoAyusgX4XJy8eiGvu
         UCxCT0FcwaF5VC7dZytoccsaameAJpVA5tvGdNWp2whqFttl0dR8jgxK6tA2MEgVi3Ze
         Jw+Q==
X-Gm-Message-State: AFuF++mmYsSQFrwPQo6YeUGP5dDrL/9ypyynWevWMaqPMoapZV+gnhqu
	GdEF/DxsJstsL7C5Sz9B/NsUKwlMiUhuhHTlJ21YxCPMVcBySG6Qf5btXagCDuw0PDcM9rnp+Pm
	qXzTfHKkbQut/ZiRUp3P1kEiaMbfPHqmC+Ddkr4VsQvU9yKBUfzG8VLevzG7DCqawuSZmi4MqCn
	LnoTc=
X-Gm-Gg: AYBFou1zKzt46xS4cYOUyOaJPXLXyGvdK7nqunghpiZdA0PqLV32Mf2iaoVRI0hHv7l
	yl6yK2bhj/ELkfMZmSPGOSznzjlo5vwjctVLK0Enjn2y17Q/WAoKAyyqcJ8Jvr8YtConSU8Qpav
	IHEDSDiu2bCCP7tA3I6ZX/noU9lKh3wfMGD9AiHDG5AsidG6B8fY6IaedHYoR83eSf40dxhZX8F
	McJC4NXqXKtABKmtBbcKGLxSmnnrhC3BwtEral2N9U9P2wIHRlDKXM0f6Alb7OWAaM0qxfJwfhB
	JY4YL0VGaVPhTPlfzDVWMqu3YyRQY25LGIA50JS/NAOQpfrPD/Vo/ttV7C4r8C5KOEcJsk0bQZM
	QANp0WA2VV1pDr8yL+rOFCOveRFhziKndPUTl+Q==
X-Received: by 2002:a05:620a:3950:b0:93c:1ecc:20d3 with SMTP id af79cd13be357-93e8f39c11cmr107847885a.28.1791273255751;
        Tue, 06 Oct 2026 00:54:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3950:b0:93c:1ecc:20d3 with SMTP id af79cd13be357-93e8f39c11cmr107845685a.28.1791273255279;
        Tue, 06 Oct 2026 00:54:15 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca806fsm50828115e9.3.2026.10.06.00.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:14 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 6/6] riscv: hwprobe: Report SiFive vector extensions only when available
Date: Tue,  6 Oct 2026 09:53:03 +0200
Message-ID: <20261006075303.205216-7-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4a928 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uPCuBOvzkMiWwmi2Qq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ZcpcUlI5cdLt9qynRFuuSy2dTeH28qCa
X-Proofpoint-ORIG-GUID: ZcpcUlI5cdLt9qynRFuuSy2dTeH28qCa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX8uN24/gz4Ov9
 6ZopM+p8HUaPnO7pKlVAIVs5+C+JNjcIYzkL78zzLMQ/1hisy1CrvXxvPNI9TcO+nO95BDeRSu6
 T1ki8NW4Mfcw84KcDuR1TKpyVPjprvY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX0dctdOQHc8UM
 KEa+MFVs7EXuTvbYFhNs4HDnAzl1JE9L5nxjL2IdTdhGJLuF4P/cky5hyB4kOzFty9jZjbTMt9+
 L80+5FGciFYfsc4Un/H3cvYs5JVCwPNdsjgC/LeYQhB0SuX0N4e4Zkn1rdkgRQcQPjrwmQXYj8T
 UqKYPnJRF5/Z65pShd/j4iIXQRjolqSftPPSHLnpa0WwlqfbjAcWO3QplZSgk3UgNHBz9L3pptE
 7GjU+9o9UQB9YzokHG93KQHgUZC97uHYBOk5EMGbA3eTd7FA2FJt8rSXIP3Kxb5imq8t2Yeu2uR
 pm+vWVQ/D5tQrkILHIci0j9nVWVOhNtZzMCxsRPgQu+VntQCVDkkPnv7PDkFJfGLIhDEpkg1o0n
 zQNQ0AqUVhKcSIYkSDu4JyVwgbJjQoQbUlGt448k5O+3W+6IjyYRU8DI9atxqfVVEPkfVde6Zme
 UxCsKM6XJ4jeF9dXQCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005417_669884_56E4B8D4 
X-CRM114-Status: GOOD (  12.75  )
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

VXNlci1tb2RlIHVzZSBvZiB0aGUgU2lGaXZlIHZlY3RvciBleHRlbnNpb25zIHJlcXVpcmVzIG5v
bi1PZmYKc3N0YXR1cy5WUywgd2hpY2ggd2Ugc2V0IG9ubHkgd2hlbiBoYXNfdmVjdG9yKCkgKENP
TkZJR19SSVNDVl9JU0FfViBhbmQKWnZlMzJ4IG9uIGFsbCBoYXJ0cykuICBYc2Z2Zm5yY2xpcHhm
cWYgYW5kIFhzZnZmd21hY2NxcXEgYWxzbyBleGVjdXRlCmZsb2F0aW5nLXBvaW50IGluc3RydWN0
aW9ucywgd2hpY2ggYWRkaXRpb25hbGx5IHJlcXVpcmUgbm9uLU9mZgpzc3RhdHVzLkZTIGFuZCBo
ZW5jZSBoYXNfZnB1KCkuICBod3Byb2JlIHJlcG9ydHMgdGhlIGV4dGVuc2lvbnMgZnJvbSB0aGUK
cGVyLWhhcnQgdmVuZG9yIElTQSBiaXRtYXBzIGFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGV4
dGVuc2lvbnMgdGhhdAphcmUgYWx3YXlzIGRpc2FibGVkIGluIHVzZXItbW9kZS4KClJlcG9ydCBj
b3JyZWN0IGVudmlyb25tZW50IHRvIHVzZXItbW9kZS4KCkZpeGVzOiAxYTYyNzRmMDM1MzQgKCJy
aXNjdjogaHdwcm9iZTogQWRkIFNpRml2ZSB2ZW5kb3IgZXh0ZW5zaW9uIHN1cHBvcnQgYW5kIHBy
b2JlIGZvciB4c2ZxbWFjY2RvZCBhbmQgeHNmcW1hY2Nxb3EiKQpGaXhlczogMWQ5MTIyNDM5NGM5
ICgicmlzY3Y6IGh3cHJvYmU6IEFkZCBTaUZpdmUgeHNmdmZucmNsaXB4ZnFmIHZlbmRvciBleHRl
bnNpb24iKQpGaXhlczogZDk2NjllMzNjOGZhICgicmlzY3Y6IGh3cHJvYmU6IEFkZCBTaUZpdmUg
eHNmdmZ3bWFjY3FxcSB2ZW5kb3IgZXh0ZW5zaW9uIikKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LE
jW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KLS0tCiBTYW1lIGFzIFRIZWFk
VmVjdG9yLCB0aGlzIGNvdWxkIGJlIG9wdGltaXplZCBiZXR0ZXIuCgogLi4uL2tlcm5lbC92ZW5k
b3JfZXh0ZW5zaW9ucy9zaWZpdmVfaHdwcm9iZS5jICAgICAgfCAxNCArKysrKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3cHJvYmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3NpZml2ZV9od3Byb2JlLmMK
aW5kZXggMWY3N2Y2MzA5NzYzLi5iY2VhNGY3YTgxYzQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3NpZml2ZV9od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3cHJvYmUuYwpAQCAtMSw1ICsxLDcg
QEAKIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKIAorI2luY2x1ZGUg
PGFzbS9zd2l0Y2hfdG8uaD4KKyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+CiAjaW5jbHVkZSA8YXNt
L3ZlbmRvcl9leHRlbnNpb25zL3NpZml2ZS5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5z
aW9ucy9zaWZpdmVfaHdwcm9iZS5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy92
ZW5kb3JfaHdwcm9iZS5oPgpAQCAtMTQsOSArMTYsMTMgQEAgdm9pZCBod3Byb2JlX2lzYV92ZW5k
b3JfZXh0X3NpZml2ZV8wKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLCBjb25zdCBzdHJ1Y3Qg
Y3AKIHsKIAlWRU5ET1JfRVhURU5TSU9OX1NVUFBPUlRFRChwYWlyLCBjcHVzLAogCQkJCSAgIHJp
c2N2X2lzYV92ZW5kb3JfZXh0X2xpc3Rfc2lmaXZlLnBlcl9oYXJ0X2lzYV9iaXRtYXAsIHsKLQkJ
VkVORE9SX0VYVF9LRVkoWFNGVlFNQUNDRE9EKTsKLQkJVkVORE9SX0VYVF9LRVkoWFNGVlFNQUND
UU9RKTsKLQkJVkVORE9SX0VYVF9LRVkoWFNGVkZOUkNMSVBYRlFGKTsKLQkJVkVORE9SX0VYVF9L
RVkoWFNGVkZXTUFDQ1FRUSk7CisJCWlmIChoYXNfdmVjdG9yKCkpIHsKKwkJCVZFTkRPUl9FWFRf
S0VZKFhTRlZRTUFDQ0RPRCk7CisJCQlWRU5ET1JfRVhUX0tFWShYU0ZWUU1BQ0NRT1EpOworCQkJ
aWYgKGhhc19mcHUoKSkgeworCQkJCVZFTkRPUl9FWFRfS0VZKFhTRlZGTlJDTElQWEZRRik7CisJ
CQkJVkVORE9SX0VYVF9LRVkoWFNGVkZXTUFDQ1FRUSk7CisJCQl9CisJCX0KIAl9KTsKIH0KLS0g
CjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
