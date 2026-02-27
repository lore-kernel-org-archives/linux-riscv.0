Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC10FEFB4F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kxlse+u3LAwv2H86W7Oqj4M5IHrUtY4RfsIflF6eTVY=; b=u6gFSaqr8zCVYv
	X6evvBWUBAqmoKQuKVYg5NzH09o/X+UAJ4Au9VxnlWwq0WFrRz37ITV1qvL4Epb4NRBY+pAnHULbs
	ZunTlayOFQH+wvOIrhYwh+yR0ZvyI06xftwwBVhghm7toAslsCI04yFXHL5lNlV8BT95pEkWL7r+F
	LSnfedm4ytL7N5JmcMh+b++ykCXE3W4+WOhzI4ekwvQ1F3R9IHD7X3cLzn4ESCyzyTTeuYUlDlPyO
	gzRlLf6IyIQkTc1O0AO2ewOUclqxfblyGR7pfOSm0qyxUpCJ8X/9+WrpVyTjN8OFaCsQrscCkl6Vy
	DqSS9nuzRW85EwZSie4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyEu-00000008P9N-11Js;
	Fri, 27 Feb 2026 13:50:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyEr-00000008P8a-0Fmn
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 13:50:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fuE52309927
	for <linux-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UCqPGnCmWVQCsvHc/I8KF7
	mIauDPj2v0RjbE6kW19F0=; b=XR3vXfwIypu+k3TAlyzhOMwyBXzSoy3roAsh08
	jyjRjY0elVLYz5y8pD+WyB/LhJLYpXfDYRT9NEqFEj3UpgeZoLFP1MSsPx/D0OD0
	mZqZupUhNcV1IhlGRYWgmVoq0yq3IcSeA9jwIw7/7CBhQlqvTZ7HYjcfkXl4dpop
	/x5aD+b/GfUt9DVbz8AIXlSEPC+z+wnNkoCBhxoWnNHsDuS3cfYYT3nLRdxb6fgU
	MOjGevHIjTCdJ2MYtCrmw24aZrbPk4GpryBFDNSVcIxEK3Q0s6IhEP9HCndZOUAh
	nHWVZXarrQP5qyGOBFTOrCOh6Vy6P/UFD6T7Rt1BN7nCFFRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q12y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:50:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso2406608085a.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Feb 2026 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772200239; x=1772805039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCqPGnCmWVQCsvHc/I8KF7mIauDPj2v0RjbE6kW19F0=;
        b=QXOESULU2jZsVVwQH/B3uN1DKedHVgQdkorsdZ9elavUhm8fly76rFW2a/A45Bk/rT
         WCjc3lBljzpJvZFSK0nzzI4K21zd2aEaZ4MOhTEnjUNZ6WE/NmGve5hsnhkiO+TOeHvh
         RrxlV9f63A/gboTrPqfqzyp/l99r1n9AWopBSgXSBv0fKR1/mv7BgRmKngN3jWQLuqmb
         2cUU1ydJWNRGhvZyMUeGGVSpbCeAggp0s0tiYyCSh3HHHNjXTogoWrIuVWJh+1MaPlr4
         WxGVFtttSRSn+6nnoqJi7xAS21yJP6kuW7ej+6LJUboTQ46D9Ul7m+tiYdfyMaZrtVip
         cT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200239; x=1772805039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCqPGnCmWVQCsvHc/I8KF7mIauDPj2v0RjbE6kW19F0=;
        b=nFRA/uvZ9vU/QVCyklkfA4OXMMjIGVELcF26+zNUGqbv++0vX00ZHAadb/7qUdFUCV
         5O9VQeMpyfGPsqzGt8sLLjFu3P08U/AkR1Rqs4VCG6fC8BfL2MN/RjAuWsjMva7TeoDA
         wendBi/GDx+IibPL7O+YCJY5quaR+/2s68rCYD6LZRvIxctjs62vp/iaW5akLUsGlCBm
         SJl+3a+YdsJxLLtMRL5yi7yqlnTiZfq+30rlgH2+12VZ+qB+oNCUYt6p39319Vzwg3tI
         /5nTEuGk8t5atHktGbKvnHdpxKgacwg29uW8KMmElBFpyL0iEJ/FgIxucBhnJ7acG1QU
         b1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHWKpC1HWrICCsyh9rK7LBkkaa3ocWfefO37HXVR2fqADQyXNTkkB6cT+VhnLsSP0tzyQLDLNUbd59A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5+MYUgVI0aNo4XS2tHi944YAAHJ5A2QF+M5WbaqazF6jyJ7M2
	KwpE2P5Dd29Kjcujzo33D1SxkjVoMEVHdTAJaB9fwgePDG89KSuo08h+9+nUj6V9XJVe3f9+Mhv
	Kj7eXaX+9uS2w+ZHx4rdOf/0TwPCYhCHSYGtWuQJwL4NpRwl3HwYqPiCU8N2+pf9Y7aPKBFA=
X-Gm-Gg: ATEYQzxBnzF3j+BhH4f0tEAQOVjFaqhz2/g4iog6vEM7aQMgr4ObRjbeflCEHWsb/LG
	wxJP7br3PeMHjiEEKA83+OdNVr4NhfR6vQJ6RWjxsN8H6s2bEDuhKDfCE4vq1a2Q+dNYlfOtUfB
	L/GS2Oj6VVSJ7xzgXSNU5ul6GPAoS33rmL0+Df+c6Hnp9EL173wbhPcoy+KFCrxSjnQ2UTm2UdP
	s74j3QrPxjrcA8ElHzEaZ4BpO1cun1LCRfwjqJ2wsdhqLltbRZyiH1giDwedn/wHX5Ct+JAjjpC
	/ZPTQsqKR1htPZ7kD6142HH3kizBE+q+O7HsoKYDgonYTGcuT1741PZf0qLBrX8gtzNfdLh6uvm
	S1aYlCPPuSrHdvkohVKxXlREzGJ4jGlHci/wQJl1Q3Xik0pizpjnzN26CZGVy
X-Received: by 2002:a05:620a:28c2:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cbc8e7b3e4mr334775085a.67.1772200238912;
        Fri, 27 Feb 2026 05:50:38 -0800 (PST)
X-Received: by 2002:a05:620a:28c2:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cbc8e7b3e4mr334771285a.67.1772200238459;
        Fri, 27 Feb 2026 05:50:38 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec7091sm149414866b.58.2026.02.27.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 05:50:37 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: fix off-by-one array access in SBI PMU
Date: Fri, 27 Feb 2026 13:46:16 +0000
Message-ID: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyMyBTYWx0ZWRfX5c1S5bK132pd
 uXWjtwncBQftQgJcoklN789Uln31BHGxahJ9pwzXxy2zEbO96jzMFdpazs299YnnaL4nrv1ZS2l
 7q+jsNEFAmtuz0Q3qZyT6vZMxUswu35UtwjOxz/i5G/2ht/R+zloXe3MrS2QRLl20f0NPBu5Ez1
 ciqsKsjlNOZ3oRCYWuzNf1F1yH2k5vEa12KC48scL6y8H4mNfDdzODeuuJjxeAA8I3Js37/Uz/1
 1XBon7r+8USELjqzjOtkAJfYPMLyyPsenWZMPwZvKd2daLCfK4n8PmTfyduCBcpSnZ9UOv6xmir
 RKUcOT9tU52YALBJJTiWmTgaNTUJgripS6RRXTZZ8EWvLPlT96uvuAGo+0ZWbAR2rvdfut9ZnG/
 zweOvaoSRddSzvn8U0uTG3434D39/LboEp8Y82agToGD7f94riLXaDNn4R0VlZecRF/QH+Ko1xd
 5JREWyJ2sDRyMlYsLrQ==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1a12f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9SFidOni61YWn9SpgYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nIt_i1GKyMx0zlZ7grKCUncjyIl51tgG
X-Proofpoint-GUID: nIt_i1GKyMx0zlZ7grKCUncjyIl51tgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_055041_215008_B2B92C52 
X-CRM114-Status: GOOD (  15.23  )
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

VGhlIGluZGV4ZWQgYXJyYXkgb25seSBoYXMgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyBlbGVtZW50
cy4KVGhlIG91dC1vZi1ib3VuZCBhY2Nlc3MgY291bGQgaGF2ZSBiZWVuIHBlcmZvcm1lZCBieSBh
IGd1ZXN0LCBidXQgaXQKY291bGQgb25seSBhY2Nlc3MgYW5vdGhlciBndWVzdCBhY2Nlc3NpYmxl
IGRhdGEuCgpGaXhlczogOGYwMTUzZWNkM2JmICgiUklTQy1WOiBLVk06IEFkZCBza2VsZXRvbiBz
dXBwb3J0IGZvciBwZXJmIikKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5r
cmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
cG11LmMKaW5kZXggNGQ4ZDVlOWFhNTNkLi5hZWM2YjI5Mzk2OGIgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwpAQCAt
NTIwLDcgKzUyMCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2luZm8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCiB7CiAJc3RydWN0IGt2bV9wbXUgKmt2
cG11ID0gdmNwdV90b19wbXUodmNwdSk7CiAKLQlpZiAoY2lkeCA+IFJJU0NWX0tWTV9NQVhfQ09V
TlRFUlMgfHwgY2lkeCA9PSAxKSB7CisJaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVS
UyB8fCBjaWR4ID09IDEpIHsKIAkJcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5WQUxJRF9Q
QVJBTTsKIAkJcmV0dXJuIDA7CiAJfQotLSAKMi41MS4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
