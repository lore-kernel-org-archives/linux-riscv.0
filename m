Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD076CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IhnPBPTXJHJt/9Yo65lZ9qKewL71sNTTRPnKMUEZ+0=; b=QPLZRA4WB6yGG6
	8S3JH9mKWEVUFumY/oZlwdXbVIsNbGj7DHLMafzvhpKacGXV35POvTjhCAcSvamT9fPwguPwbRL3y
	LywBt7Udrr7b2ObRSL6OPPZh5s/dFTtPBN+SGefDRDboEkzPLBDY+bSveByW3E4wKDNwbdLdU2ly0
	uDq+Qkyz7jEJcPM20CDNK+pgDuefo3NtlgRt/JNRfee6sA0gwYKRgJ3R0YYKVbeFPgsbAXefxStcy
	q8ym/jrRTvRhtfLSf4q+r4O9WNdSH4dbPLul3s4fgfyavuHisFR/zHEbMQaqVLVJuiiki0i9+6AwR
	jBQtK2nWSSBA7AIB4esA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE008-00000000EFh-3PRv;
	Tue, 06 Oct 2026 07:54:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE007-00000000EE1-1JvQ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eAvm1083520
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=; b=gqgLaz7fIc1LT8oS
	nH4a/1dy9xHDQInZIUsNqSx8fROhTfeA2XIqjfesaAyli1aFbkHUvoCgU6s8Od8O
	XpWXjgOzWpIzGLkmpKY6ySSAeVfOZ2jX4Ey/19Nvr6Iy4tvw2nnlnKcsK6SkDp9B
	oLS6DKh33IKwJEVtqxtTVE6iKFZOjnCqlWyHGAFf+rVvIospLRRqxomWusstk7rw
	sdHYiHORJXT7bcxYHWGfk0C2SEqHi79ULlwwUi1k22GhuSOgxCmf2cS7FPkvK3sY
	bWBJMYzp8O3+dYg8MarhJ6jE9NoGGHI7r643J+I+4rdXIVyF7KwJ7SQ/jaD/qQvI
	LQ0znA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cuu3px5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so421170285a.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273254; x=1791878054; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=;
        b=JvoOucr6nUfVVWigmjhr60/x6jEv9Ea0tqitM9Ib0x+uE7xwdBqa/JwDGpQP9rfUt6
         f4hHCPpdVQvZ4axdG3gD/OMEmtfvVZFpuz7nHgEBD42T2hdjxSqKfFp48es1SRWWbrvU
         8UDAHswS+9fJ6hPNQmQu1Hm0sEBjl1JRpGiryd5wLggZTOpQypibO3eY0ig8YaRIAoKe
         m5ZBG1ffL/68SfgPoIAsk0IVUcMnUskfcXEEZd6YlnaW75Qkz+X2NisuOX60WCd2drlY
         Y4Os8tWuEqL5ppO80+GQxw5QCiGFfsKX+ykbyz1djNZO7no0YppiV56bfVR1vYqVthLs
         tD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273254; x=1791878054;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JVegSjDalYslNS8cueXSJhmz7qjyNa4KJ7hnj6u/Q=;
        b=LSRdLcT4L/7ZBF4BbmnZC4aU6ilKhcGDYqtEw+m7OdSFcFb88TJ3oIljWZbxfPGRC0
         KdGSGJZ749eHZGXb776/O++tlUUwXDppum26lO71CZBVUwkGMWAVJ24vyy+s1y/Oe88M
         gI2XNbCYnlMzjvCTieBjYx2tRiYD3s9bZWcBpVWJkhyu+5u9O9qFunojyd6XME4MN9Bq
         xJz0wsfUKqzjrnFBdXhFSvf4mDJa2XibMrBwXIZfxbEIu9EVpfySV33IljQ5cEJPHcck
         /PJujTg/gHoeRpvjyq1P/vuFn18SyBH9g5OFRC4WixLbx5jojCemHIyBqpHZ/DdRGpQG
         t3XA==
X-Gm-Message-State: AFuF++nK8T4Flg7fjAHki1Lj2+34b+8MtOt7u8T4IDeK+CtZTgmeooZ8
	9EBYPfl7opFsc6+fxxTNwLipOGBgBSwqjwX/5IAdHvCdBg8ghGhqKzN4tGiMoZfU9ZKXnNPpOd4
	T7uCYrlTFfI+pbaQC8LbLixs2eStw7aD1qFgqWEW2GqMkEYM+B1p/WqrCr3kDgDuaCzbk1pp1Hs
	6Rhi0=
X-Gm-Gg: AYBFou2N2JUDtRcJNqEUo5bnqaIVhx/tpUJPoClHq058rVWIjN8ypkDbaGqiutQ8H20
	fIiY87PxmxQVMPaMrpvPFqsEt90lK083KCMrmScQ1mJr9XLyPnRSPFjYCPq3cfT0FNxFLwz93JF
	ebhUW5kjW3IKxVSeZOd0VY49mI1kxrWWk9Gwj1E+dtsmUsaw8fzoWQzKbk58Vk9gbbsBIiG7MSp
	kKMnoeVW43w2q4/Lw+2CP39+rRXRkqn/Nd3Ml6z/3rwQ6xcuRMLZ7JkDBmSFQhwIRH8E/ytKUYl
	P4dZ27l3I+yXckYkKov1S0qa5QOlwTAsDGRsbLJQUDqVgNl8cnmYSakKVAkqGAPYwfIfcx7q8az
	b8tohLo5b+LYcsEkSLyz7pdDmbYt1vpb/K5dYXg==
X-Received: by 2002:a05:620a:2705:b0:93e:646c:9138 with SMTP id af79cd13be357-93e8f359779mr106435085a.26.1791273253760;
        Tue, 06 Oct 2026 00:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2705:b0:93e:646c:9138 with SMTP id af79cd13be357-93e8f359779mr106432485a.26.1791273253172;
        Tue, 06 Oct 2026 00:54:13 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6bd2bcb0sm2002662f8f.1.2026.10.06.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:12 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when available
Date: Tue,  6 Oct 2026 09:53:02 +0200
Message-ID: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX1dqmd+VWPNnM
 tH6AHX1dbbicSxwHHHYukH4JuYKkY+C/SMsYPgi4jR+LEsl8NojpFFN1gcocP7WzfVccSmpMmlq
 bql7eXKZt1Axib6fEeX1/btBOVAOQnM=
X-Authority-Analysis: v=2.4 cv=aKRlOr9m c=1 sm=1 tr=0 ts=6ac4a926 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZyeoJApBXwK9WkWdqV4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ujy9wzreBwUgcD-858vH4A4wxBP8k-7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXz/60cUdUd3LK
 cxd+fy2e+ijvmrpt7Tkf37KfSeHUIu0fr+kmFu9rLWMjV7TlIo1x7t9x5ysVHFPva5WKPcWpR4+
 1Hx1DsWBrnWUPWrGmVD/jkyVD82oaMeC4imGtJo8r8Go5kEZlA8hMfVFV7P/MYa8X3mN9HLuhzG
 9VQsEJD/rg7xfB9fnFb6NdzNUpKr7qwXlywZpOJ6NevkhZOBE6hKHrpjUwkCgq2bnr9v0X697Vz
 KKYiDler6QAoQiZbOrw1BMVk6BMSWGqDU6DrrXjonuunUAK8RuO67MSBGVGmoheSAsV7fY4NI8K
 NNADvngc4zacDRzKjG29SAd4TAGOidZxr5uWmU4lBY9yWy9oQfvOfiKgBOreK0aA+bzTEG88GWO
 OiQpPOmcqJeOHY0QCL5M8FFeoUmQxNNt7EbnMDGmus+WfSQmGzrCu38RbG8J5EnXHlcJWRy2dcC
 t3w98guYZYMY7SQXKTA==
X-Proofpoint-GUID: ujy9wzreBwUgcD-858vH4A4wxBP8k-7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005415_363029_561D1CC6 
X-CRM114-Status: GOOD (  14.37  )
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

VXNlci1tb2RlIHVzZSBvZiBYVGhlYWRWZWN0b3IgcmVxdWlyZXMgbm9uLU9mZiBzc3RhdHVzLlZT
LCB3aGljaCB3ZSBzZXQKb25seSB3aGVuIGhhc194dGhlYWR2ZWN0b3IoKSAoQ09ORklHX1JJU0NW
X0lTQV9YVEhFQURWRUNUT1IgYW5kClhUaGVhZFZlY3RvciBvbiBhbGwgaGFydHMpLiAgWFRoZWFk
VmVjdG9yIGFsc28gYnVuZGxlcyBvcGVyYXRpb25zIHdpdGgKZmxvYXRpbmcgc3RhdGUsIHdoaWNo
IGFkZGl0aW9uYWxseSByZXF1aXJlcyBub24tT2ZmIHNzdGF0dXMuRlMgYW5kIGhlbmNlCmhhc19m
cHUoKS4gIGh3cHJvYmUgcmVwb3J0cyBYVGhlYWRWZWN0b3IgZnJvbSB0aGUgcGVyLWhhcnQgdmVu
ZG9yIElTQQpiaXRtYXBzIGFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGFuIGV4dGVuc2lvbiB0
aGF0IGlzIGFsd2F5cyBkaXNhYmxlZAppbiB1c2VyLW1vZGUuCgpSZXBvcnQgY29ycmVjdCBlbnZp
cm9ubWVudCB0byB1c2VyLW1vZGUuCgpGaXhlczogYTVlYTUzZGE2NWM1ICgicmlzY3Y6IGh3cHJv
YmU6IEFkZCB0aGVhZCB2ZW5kb3IgZXh0ZW5zaW9uIHByb2JpbmciKQpTaWduZWQtb2ZmLWJ5OiBS
YWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgotLS0KIFRoZSBj
aGVjayBjb3VsZCBiZSBkb25lIGJlZm9yZSB0aGUgbG9vcCBpZiB3ZSBjYXJlIGFib3V0IG9wdGlt
aXppbmcgdGhlCiBjb2RlLgogWFRoZWFkVmVjdG9yIGNhbiBhbHNvIGJlIHBlci1wcm9jZXNzIGRp
c2FibGVkIGJ5IHByY3RsLCB3aGljaCBiZWxvbmdzCiB0byBBbmR5J3Mgc2VyaWVzLgoKIGFyY2gv
cmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYyB8IDUgKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMKaW5k
ZXggMmViYTM0MDExNzg2Li5mMDdhYTFjOGFjYWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMKQEAgLTEsNSArMSw3IEBACiAv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAKKyNpbmNsdWRlIDxhc20v
c3dpdGNoX3RvLmg+CisjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS92ZW5k
b3JfZXh0ZW5zaW9ucy90aGVhZC5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy90
aGVhZF9od3Byb2JlLmg+CiAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3ZlbmRvcl9o
d3Byb2JlLmg+CkBAIC0xNCw2ICsxNiw3IEBAIHZvaWQgaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF90
aGVhZF8wKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLCBjb25zdCBzdHJ1Y3QgY3B1CiB7CiAJ
VkVORE9SX0VYVEVOU0lPTl9TVVBQT1JURUQocGFpciwgY3B1cywKIAkJCQkgICByaXNjdl9pc2Ff
dmVuZG9yX2V4dF9saXN0X3RoZWFkLnBlcl9oYXJ0X2lzYV9iaXRtYXAsIHsKLQkJVkVORE9SX0VY
VF9LRVkoWFRIRUFEVkVDVE9SKTsKKwkJaWYgKGhhc194dGhlYWR2ZWN0b3IoKSAmJiBoYXNfZnB1
KCkpCisJCQlWRU5ET1JfRVhUX0tFWShYVEhFQURWRUNUT1IpOwogCX0pOwogfQotLSAKMi41NS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
