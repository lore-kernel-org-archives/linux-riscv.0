Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85011CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dl3Hi/5Lb/5KKAwRmCKNS95nQSij6/DrwuA5FvP6cE=; b=beFjk5dVIybyJc
	FWgaTfoCl1km453jGoqgI5Y0ehoypvWaJx/bWw1rNXWxuoDogEBndaS4L6eyXDUYECx5UR1GClcYR
	QrttDg9zSrJLgjkR0ELjASgFxGpbB+Ln75fzjDCnpX8ajlBN3zBTw8A78LoSiciVO9jOQ5Vje2bWp
	RmkPjNWuj1r1fTQEpop7eu/08ueofqlJ06ouoYjzYNt334hkaf6IMoPfujbV+b2eLscQg24gzIKkj
	bwKikbl8/+LV2TU/fMsHwFvCXilFlSfwjAo0B6rWL2tCAXgtb22evjzsr3xaXJlXaFx9PJWd93ilo
	hqlipotp7Zuwox02ToiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE007-00000000EER-2z7e;
	Tue, 06 Oct 2026 07:54:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE005-00000000ECp-3BIZ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eH4R548442
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=; b=Nmy85fiYuzwr7PLx
	xg/MeqPpOICLj+yunc6CcPDVfuORe3hYfVkN8CIWyn2FNrYJMOUL/DMxN0TpEQDy
	NrVrVliPE7+zSlwNSTaFBOpPc3HvuNBEt779aoDIzEofgmPhckWtlFZceJf9yQ+4
	3HHrSTJWbrTvlKn/mlKHk91wSxyaaBj8EAGR23JTU4QTOlCfG9mToHZSCSg58suj
	rx7PYSZ0y2MFfeQZwp0QXMNGJkVEpjZryl6X6VZ4s/AVBO1L6/0m/afw6xpVKgUP
	O+xxEddVHMT725HRUeUPr/oR2Fl/nxW9v7k/N8Vkj2TzeSoaH+E6cTv4arqep7y2
	9HXwSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvv90n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso424069185a.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273252; x=1791878052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=;
        b=gyY5dPMY7iAWUqgJPWVZ8Ik/c8dK/6kagyn/UFEVeyWdnD974X5UG0gbbmttrvpYi+
         UD3BTBSHqdKJbpGABOJfNrXWTtN5cWf+a0FO54ivV0GKVlm0m2l0MPheZUk4WsqPpaX5
         li1d9RDFHB411E8fRk+q6vgVdFMV6P7qsByic0aoZiS0NvrzuX1oCiHG082VNaPKm+9q
         1o0OUJYB6m72ReokABozx+tAxLYJfl2V9+HwVjhfegY74tdzeSmK1sjIyfKta+xYOr0p
         ngMPt5va/ea58sH7/DrfJ+cD8XpcuAy19+1/umE9Tq1Mf7iQUi8BhTa0InxI1NTOxS7r
         S4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273252; x=1791878052;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFnfnPear/fdNA0OyqkJxkeHuPIYZpYZjPnfQwEYFIM=;
        b=XBOoOOimbKYozs3LYoh//06yWiZUhZztLxfqsV/6WWo37KBVLTOVZQXJ/b4c+Ih24U
         gMaRTXiZ48+ZErd82HxHpegF4+zDWrZ5XsJewfUttweGcinEjeDISA0jcrSLkHYJ9WkX
         395TK0/gIAZFoXs2ckILUygwGVcdGC9CcQIAv7ch0Mzlcomofzo1q+GqlWIvDlk2wO+O
         C1z+cKOqOe3hZZqgRDvUQLmugwGm5Oa7Q3XIVwRtzI6w4Zw4pmakkibZAm7O5DouOt73
         AgtPP5uXhhGO6zx2/1+z9Mp8K/fA1T2HQdTYOfLJwlUJqPUNyRB6gWRbq1NcdA+6IUvQ
         sQnA==
X-Gm-Message-State: AFuF++kBNTcQ45Pis7OEW0tweoTcUMSdGAll5WWL5sh1Z74/wYOrpPcJ
	19fY6sepQ4jbJn+Nheo0M+suvdi3HyLPy4fEw70ZNnEacFuo04yp2yz0OzLheUGd/WD8kXmFalq
	yqWOnTDKFCnWEhBgzVAdJY23FAWrkYIb8JjyZwNNgwXT4USYIXiXnDT0Q9QHmv0mBQh83Eb/Wae
	YYMRI=
X-Gm-Gg: AYBFou1Sbbrt00CEwVeqL1LTRb8Za8/l4gQULeaM8MSEAsh6M15x9bkR6tYLOE4CZbm
	4XuK8qgrZoRT5Q0m1L+kMApGoq2U7vMzG8HfI4d2faZiPkTOQlgsfSVGemOoaUu7n06419QULne
	a0NyhGiie/3sH/xw/2R20qyhzVPUsR/lF86IePOsjzPrek9FU3xWfjTdYRzjm3jUU0vQNFLmly1
	o6kC6CB7l6QkhaorNNSeCQlgBAI9AoVsBhu0EGrOywHkFSu5ewXQWQK8KWFg6yQWXyuD89/1u+O
	tvWSDchHUa789kmq2UwuHppG8mXaYDijfPWj2+lahUpXDAppjEndd7LRc0RHktuYczyaOQ8GzLP
	Ss2+mU0J3La3/m0+AG6nujPCOS/RAgloXR16IBw==
X-Received: by 2002:a05:620a:3186:b0:93c:6963:ff3b with SMTP id af79cd13be357-93e8f4a60a9mr100050285a.42.1791273251815;
        Tue, 06 Oct 2026 00:54:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:93c:6963:ff3b with SMTP id af79cd13be357-93e8f4a60a9mr100047985a.42.1791273251322;
        Tue, 06 Oct 2026 00:54:11 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db8c6dsm84506095e9.14.2026.10.06.00.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
Date: Tue,  6 Oct 2026 09:53:01 +0200
Message-ID: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4a924 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lsg-wI8U2ADVYaVtWPkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: u0D_mTwba3rjd-KyzTXWhqf8FSpbhr6N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX6VGqbNsF6P9n
 fmeOUUm9pgMuqE0/1LKdbA7xknVvRcyI8oxPNf+tFk9KL2JNLB9pkoblFPCvAK3HnsGTDgV2W3w
 jPdKNwpb2pD5q75wfL/UDavBLR5yxKU5rj9GgVPVMJpQasxQJRKeXIuc2u7kknuEStSck8tvVNr
 mshA3Y8TlLT4pykDu3ic1CrZCv+sy/j4nDbwAwlhGIaE1iaylbvsBeRUawZ3IICuVaf20HXOZtL
 rXggnEgsDeLvSTfwwKGPyZVBh34VHBf+hXgGfg2jtRIm+uVJ56LB7AS85QeUYeDTJ/Xu1410QU/
 dSeHBh6cN+QmkZG3HiRAgO65GNF9lMT2/w1MvNmiyYg8GUcVuj9AuKjee8PX334LvZLybI2r7sq
 pf8+0NxfbNXgnrnYto3n4xaxdbO1F23kj/BvYS+dt+mOp+uuEXFRhqdOe+6kdNLLZGBpRyzfuXv
 GwiuiWgGxxoa5yETZvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX7UdIFEVDrhar
 0SDx3ZoHWaQFUGz7jZFXQYdYnr8qeBPrNnNW2I00l+ZBmFkFPV8pYTSdGSbll6UiC00MsLg57d6
 yw5gqKgazDn3gaxqgoXUCKo6aSyJWAo=
X-Proofpoint-ORIG-GUID: u0D_mTwba3rjd-KyzTXWhqf8FSpbhr6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005413_945336_C2611BF7 
X-CRM114-Status: GOOD (  15.74  )
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

VGhlIFJJU0MtViBJU0EgZGVmaW5lcyBTdXBtIGFzCgogICJBbiBleHRlbnNpb24gdGhhdCBpbmRp
Y2F0ZXMgdGhhdCB0aGVyZSBpcyBwb2ludGVyLW1hc2tpbmcgc3VwcG9ydAogIGF2YWlsYWJsZSBp
biB1c2VyIG1vZGUsIHdpdGggc29tZSBmYWNpbGl0eSBwcm92aWRlZCBpbiB0aGUgYXBwbGljYXRp
b24KICBleGVjdXRpb24gZW52aXJvbm1lbnQgdG8gY29udHJvbCBwb2ludGVyIG1hc2tpbmcuIgoK
T3VyIGZhY2lsaXR5IGFsd2F5cyByZXR1cm5zIC1FSU5WQUwgdW5sZXNzIFN1cG0gc3VwcG9ydCBp
cyBjb25maWd1cmVkLAp0aGUgcG9pbnRlciBtYXNraW5nIElTQSBleHRlbnNpb24gaXMgZ2xvYmFs
bHkgcHJlc2VudCwgYW5kIHRoZSB1c2VyLW1vZGUKaXMgcnVubmluZyBpbiA2NC1iaXQgbW9kZS4K
CkhpZGluZyBTdXBtIGluIGNvbXBhdCB0YXNrcyB3b3VsZCBhZGQgY29tcGxleGl0eSB0aGF0IGRv
ZXNuJ3Qgc2VlbQpqdXN0aWZpZWQgYXMgMzItYml0IGNvZGUgaGFzIG5vIHJlYXNvbiB0byBsb29r
IGF0IFN1cG0gYW55d2F5LgpSZXBvcnRpbmcgYmFzZWQgb24gdGhlIGEgZ2xvYmFsIHN5c2N0bCB0
b2dnbGUgaXNuJ3QgZG9uZS4KCkRvIG5vdCByZXBvcnQgU3VwbSB3aGVuIHNvbWUgaGFydHMgbGFj
ayB0aGUgZXh0ZW5zaW9uLCBiZWNhdXNlIGl0J3Mgbm90CmF2YWlsYWJsZSBvbiBhbnkgaGFydCBp
biB0aGF0IGNhc2UuCgooUmVwb3J0aW5nIFN1cG0gd2hlbiBvbmx5IFBNTEVOPTAgaXMgc3VwcG9y
dGVkIGlzbid0IGdyZWF0LCBidXQgZG9lc24ndAogdmlvbGF0ZSB0aGUgdGV4dCBvZiB0aGUgZXh0
ZW5zaW9uIGFuZCB3ZSBvdWdodCB0byBoYXZlIFN1cG03IGFuZCBTdXBtMTYKIGV4dGVuc2lvbnMg
aWYgd2UgY2FyZSBhYm91dCBwcmVjaXNpb24uKQoKRml4ZXM6IDNjMmUwYWZmN2I0ZiAoInJpc2N2
OiBod3Byb2JlOiBFeHBvcnQgdGhlIFN1cG0gSVNBIGV4dGVuc2lvbiIpClNpZ25lZC1vZmYtYnk6
IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+Ci0tLQogVGhl
IGNvbXBhdCBoaWRpbmcgYW5kIGdsb2JhbCBzeXNjdGwgdG9nZ2xlIGJldHRlciBmaXQgaW4gQW5k
eSdzIHNlcmllcy4KCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwgNyArKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCmluZGV4IDQ3N2Q4ZmQ3ODBhNi4uOWE4NjRlMDUwYWNmIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKQEAgLTEwMSw2ICsxMDEsMTAgQEAgc3RhdGljIHZvaWQgaHdwcm9i
ZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAlpZiAoaXNfdXNlcl9scGFk
X2VuYWJsZWQoKSkKIAkJcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWklDRklMUDsK
IAorCWlmIChJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfU1VQTSkgJiYKKwkgICAgcmlzY3Zf
aXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgU1VQTSkpCisJCXBhaXItPnZhbHVlIHw9IFJJ
U0NWX0hXUFJPQkVfRVhUX1NVUE07CisKIAkvKgogCSAqIExvb3AgdGhyb3VnaCBhbmQgcmVjb3Jk
IGV4dGVuc2lvbnMgdGhhdCAxKSBhbnlvbmUgaGFzLCBhbmQgMikgYW55b25lCiAJICogZG9lc24n
dCBoYXZlLgpAQCAtMTgzLDkgKzE4Nyw2IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAo
c3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkZI
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWkZITUlO
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCX0KLQotCQlpZiAoSVNfRU5BQkxFRChDT05GSUdf
UklTQ1ZfSVNBX1NVUE0pKQotCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFNVUE0sIHBhaXItPnZh
bHVlLCBtaXNzaW5nKTsKIAl9CiAKIAkvKiBOb3cgdHVybiBvZmYgcmVwb3J0aW5nIGZlYXR1cmVz
IGlmIGFueSBDUFUgaXMgbWlzc2luZyBpdC4gKi8KLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
