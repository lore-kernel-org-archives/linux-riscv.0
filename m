Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21220CA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkjP8TNJjsrgTnTzxvxn1gKAu4focM9L2PFx2LcyE9A=; b=EYIdeZZRe0pj0V
	z7agr5lTWpzNrJ8v/4F/A26/kA9f1ZCHPolkzMNfnoejXdec8wcgQ7cIpCz3QocOE7WyPuuKZAZCQ
	/txsyqYbBu9iY3z6k+74MzeUoZsmeAKlgB+dUE4P18uukddYkAMGOmXdhuUBZbrZ3jYuIjRHqACRV
	MBJJCJTc+bjCzolpX4G4togoB4SJwXXxUbHGA3MqzBxCaomvauMaOrqSb/mUVsle6YgeRCIpRXzjp
	lRvMJt/vkyWvp7xmaYyMc1yT1ZzI/qQ3LRPt54DbVGghzleLExzBjwl33kMt1dxl7A24iui5HpE1S
	ES47oquyuYDFBAwGhKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE004-00000000ECf-3kVC;
	Tue, 06 Oct 2026 07:54:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE001-00000000EBH-2q7T
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966e4Ta3902923
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=; b=mGIGuZi4GT6PslIN
	Q18GR1q8BtmMzl7IUD56TZseEteYQzkSPo0xqtF7tgYN3lixiBNQ8f2cX/NhqDLd
	p0ywOoZnSLgwwC0O6ASAO9yjvy0qy89B8bYpQni4mrJdbx1IS/zDVXcsUKFS8C6J
	tewe/SlkILUgACgtHGNgAIdo6xGbY8VDIdGQViu1aBAjSCYntPeKGNmRLPuKoBET
	U3ljsuT7fn+J/IgwW3ORdy+BS7RDnyx5jvOvSHOsNDLyOQHzvkwN7i0aWA6VLGOQ
	rJN8iQfpUmA5vcNDmeDu11byQ0tSLArDRLbq/Z9rVoDOgkgfNRoaIoTMQ56ahH3X
	GT9F+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dv952-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917ae0d52d2so59386146d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273248; x=1791878048; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=;
        b=MJbPrU2gcUqxmA6PcO452ha+uVeIPDSW2gIoZJlfeRj8OXkf5jsyMwNCu+CoA8WDF+
         4A2B2bolKLnWerolS9vrPGTtRwqqKiinlwJkgH/N7VxnYx+vrmJ4kEPay3i/w/+leJeM
         aGw0YaZLRxq4LRroafppCfbcxiRaLVIxeZJr8xPprvjh9e2X5Asm/cmL+OoetwwIJiSt
         kzqtkNCWqqVWXwWX4A/5aG9jR+cmUlEdOdSYH7tc/9TlP8AKba6zkNpWVecKEq5Y5Zww
         DjsVnIVm3286WofvUQ+8TVlSlXHoPOxDWjtn1B0vQmDHFKi5wiEi74NAMEHDi2MoA4Ff
         C+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273248; x=1791878048;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkCk3UAJBlHK8tB/KMNLfFuY3QwNXFJZwvI/1UtsZbQ=;
        b=fEW/hjlEU3q7u3FNtYneCdYQi1HwZCUfnpcl6MdDsF93owh6jIucg2j9vAJRy+jpmu
         fMh3dlKOo3p5t6cjwEb6aUuCIAeJmVhb9g+spfwXYFC1ztLiSl7x922OvHuwJZBSl1Dp
         VdGMTZnmuQ4c04MZnVkvYL+WtOsouUow20XDfPBxmhZnKBpixKWt5UkS6bTyIwHSjavl
         7nMv9aTYckREt2W8MAPAdeCHBFxIn47FvTl7zHwGrtfQ9ouQaJ+IQ4HymVWhdjwxoaBG
         TZUOzsCnaYgmDh3ALd0BAE6gOCv+eTW0FMIqZjhEE0EeLuIgaPgAQ6VcZ2bFqcb50aIh
         Ln3A==
X-Gm-Message-State: AFuF++kF12es3kB6SzuzxgENzUvdxfDmqsAEosQBsqI17wXJe8g5KvzL
	zwijH10r1aUUSY91C5ggNIcKB2nb7wAKw9AI1D3hqRzODM1hzBQzr7IfwZdfF0rkZtAYtpjNFS+
	10rZOprbzAVQjPUrCe1adcZN5NT1UWWiy72IqBKaiClRLOtjPSBH1KGaxhmDdEfTxkXP0iSMz7s
	SRhaI=
X-Gm-Gg: AYBFou2JHvLBZJ+2zKrXSZkBFsZEcasrm8o6kgYpWijWicP3LQE2kNhIM1XbLxGT3dc
	XTtDN0UYpCJRObfDuCXIQxLCi8ZC726gLqPWwfMv/3hAWpXB7XbWuL/DE48fmYm6iqkiELgO0CT
	Hxrb8i8emhHpteq6tsMpAAbXNCwIRol3HXyasY9Anc4qyo84gGnR3scVxCsSMylU9r/I/MEIlR2
	IcIjxut7F8SMa9x4X/RUcI7tJ5akVgdHzCzK3OcC4RpYPMe5o5q5Q6h51XxyN/lTgTkWpbHwKSB
	vWf0UZCvPFfTZQ45TgOnw69Dir8gFYlIY8+daaVsnmJc/qASpSTaTg8cXVCjMaba/sPUAUvqrp4
	d4iTNUmi4J06veHUV6thuP9NKdWWgpYy+rJAc4w==
X-Received: by 2002:a05:620a:1b98:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e51058549mr1675044085a.47.1791273247921;
        Tue, 06 Oct 2026 00:54:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b98:b0:93a:1b82:4962 with SMTP id af79cd13be357-93e51058549mr1675041285a.47.1791273247439;
        Tue, 06 Oct 2026 00:54:07 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53997sm80934305e9.12.2026.10.06.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
Date: Tue,  6 Oct 2026 09:52:59 +0200
Message-ID: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX6rZsVUcimFwU
 uG8RQ5+L1UzfXmKvi7EdnrDN2CAB0xe4UJ6h8cP46Zvl6cRMwYrwYf97E5BhAz5lp4p96il2Rhs
 PR9C7i5YJmDlRHqw2MpLVVKn9ooPK6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXzisWUyho7puO
 0/YT5gTImUR9fsGhOhmAm5ZovUWJe9bCabPy9gwnHf+U0o501zkYnOgL+zST8RFd2mExw239deO
 9gcOP2zr50EOOqC91izWbPePfdXMuIv/zXVHYYAwjIhVWg9DlLr3nlcgaUSA14k9GLk44wotzZL
 hyguMyHlVFore2Q290d/FW4Vv+JBd7END81jNyDHcrFe2cXspVwElI6nAlJOQmT/zj1h6YC5D/e
 7Ci3/3zgy5KRiZlSEgRl0c9OXMepMwoj2AW9vt3t+yhMuZ5tYpfb74tbHbNx7JNbRi+R87UIbvy
 tw0Hbpo60I4cIKzWw61emOpfetwv9P1OLzic+Hy3wnFjgF1zsIqhKpOZKUQqJVkJq6p/lUhGXE7
 Lswe4bktg+q9AtBgZl63En5OqyS0tg/tDuDv8jiStT+/O7WitOkQ4yEqN4bZTlYGbhp2LXIYa/o
 5zbDJj5kJO7H+p3FcMw==
X-Proofpoint-GUID: TEOe-ANEq-xBE0lYtylYo2QSdPWz52ji
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4a920 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rRaSbe_MlDQN7V0TPG8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: TEOe-ANEq-xBE0lYtylYo2QSdPWz52ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005409_838028_3E8D4818 
X-CRM114-Status: GOOD (  13.02  )
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

VXNlci1tb2RlIHVzZSBvZiBaaWNib20gYW5kIFppY2JveiByZXF1aXJlcyBzZW52Y2ZnLkNCQ0ZF
IGFuZApzZW52Y2ZnLkNCWkUsIHJlc3BlY3RpdmVseSwgd2hpY2ggd2Ugc2V0IG9ubHkgd2hlbiBh
bGwgaGFydHMgaGF2ZSB0aGUKZXh0ZW5zaW9uLiAgaHdwcm9iZSByZXBvcnRzIHRoZSBleHRlbnNp
b25zIGZyb20gdGhlIHBlci1oYXJ0IElTQSBiaXRtYXBzCmFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0
aXNlIGV4dGVuc2lvbnMgdGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluCnVzZXItbW9kZS4KClJl
cG9ydCBjb3JyZWN0IGVudmlyb25tZW50IHRvIHVzZXItbW9kZS4KCkZpeGVzOiAxYjU3NzQ3ZTk3
OGYgKCJyaXNjdjogRW5hYmxlIGNiby56ZXJvIG9ubHkgd2hlbiBhbGwgaGFydHMgc3VwcG9ydCBa
aWNib3oiKQpGaXhlczogZWIxMDAzOTcwOTQwICgiUklTQy1WOiBod3Byb2JlOiBFeHBvc2UgWmlj
Ym9tIGV4dGVuc2lvbiBhbmQgaXRzIGJsb2NrIHNpemUiKQpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBL
csSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgotLS0KIGFyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGI1
N2NjZDExNmJiMS4uYzc0ZTM2ZThmY2RkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTkx
LDYgKzkxLDEyIEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKnBhaXIsCiAJaWYgKGhhc192ZWN0b3IoKSAmJiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2
YWlsYWJsZShOVUxMLCBWKSkKIAkJcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfVjsK
IAorCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaSUNCT00pKQorCQlw
YWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT007CisKKwlpZiAocmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWklDQk9aKSkKKwkJcGFpci0+dmFsdWUgfD0gUklT
Q1ZfSFdQUk9CRV9FWFRfWklDQk9aOworCiAJLyoKIAkgKiBMb29wIHRocm91Z2ggYW5kIHJlY29y
ZCBleHRlbnNpb25zIHRoYXQgMSkgYW55b25lIGhhcywgYW5kIDIpIGFueW9uZQogCSAqIGRvZXNu
J3QgaGF2ZS4KQEAgLTEyMCw5ICsxMjYsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQw
KHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkNC
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaQ0xTRCwg
cGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkNNT1AsIHBh
aXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ0JPTSwgcGFp
ci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDQk9QLCBwYWly
LT52YWx1ZSwgbWlzc2luZyk7Ci0JCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaSUNCT1osIHBhaXIt
PnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ0ZJTFAsIHBhaXIt
PnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ05UUiwgcGFpci0+
dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDT05ELCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7Ci0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
