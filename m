Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D628CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVB3fCDq6hskgK1/29zJ5zrrvDSB8BOmPwzS2gvDC7w=; b=LFEYia/6cL15cw
	vnuGcnt0idAEHHyy3G11XCQsIXZ5ObSxcviXneEWLZLn7O5HuheIdO2I4n9HyiXcz5d5/H279x7b5
	iBxLT2ud7DEorXo5i4LnwLwhSuydiWOLsJR/egFeJrI7qurR76i3Q5RBfIXcbVD9l9oFp71ELllcI
	yCsb0efjJ+to4/IXEj2Pxq1x16+uOUnb4Cspc6zTIFnv5KmlH1tFrrOE13RDyBSjus0gxyCY5xzso
	GO1PxsvwR95kOFR0TtCjhwo1nDKuy9ElN2bUnUyI3sk4wfs886K7fO0djLXspga1WrH3NR6+YqQ/p
	/bIm0Wu0JNB93C073hng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE001-00000000EBI-3DXN;
	Tue, 06 Oct 2026 07:54:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDzzz-00000000EAs-2SPx
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eFp52834276
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=; b=bRhYLZ3wUFlpI7ye
	yjUYghnmNbZT83j9Viiz4Tlz+RQ9gnfooUtMhyAKi/WdXkck3hiOWtPEj3GYVipv
	9wkdA+PMNQ1aWQ7Y/i2T5FdbXEBstQ1eAah5WTh93Cl/S9Y7DPaI7hQCGg9CEG4b
	AovtipeiIi6ifM87lbGuh3Oa+97U57RrgWgCzB3pJiINS3jv1C2cY5mQbUypt71m
	KBTiz5KI9cSbvvtFbDAD0YNAzhC1R/L7oDcCv8Y74q9WMgvp8aM/H4I88NMKrVu/
	diXrr7hl5ZHKtvvugnhQRe3TKCbt5wTQjEOg5Ud9/62aW0LlxJbne32kZPW5o3U1
	yQLBRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnckgj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so410962485a.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273246; x=1791878046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=;
        b=IeJc8EXCZI6uo1Mxk/qIw66+35P3sgtayfiaBPU/Yubjt3z08bbBmvO8GTK86on89r
         USc66XP1lhTFf9xb4A1FBlKPC7xjsrLCtScZ+aKT8rUIOrh6zs1qJKrfI5DXaUMUpdYW
         SoziPzn5Xkz/FYO7zexrrFZvxiqjW6L9Lh4eTIwD+veIPtJCKiDXo3/QS4Sl/KcedWeJ
         SvDhcCcgMGRPzGmMIJH6lnKAnCiSGYoNHFAu52/cudNMrrKvnZLmw6JmCxAHBbmzbtue
         hhzYIkmkywAdCIjhMVE7wM+YXO5EIHN+/Xba+Tjh1RD9rP+r1TAoqaC7XvhiV6mubi3+
         k6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273246; x=1791878046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQirbEcE3MktqOY7DcIz0seaLPIF4Zmwh3AsCZ5btSs=;
        b=v0FN8qUy1M/uvNE0eMPWBlx4lyWTp4XjsCPrLQ9y6Iy7SHXnzEqttoKYVXBoyOengm
         j9IWt4r6OE5MxLxCykjvdgdHWtFXL63dDD2A7QDVESf2vIIlLTeGKQKKnp3h0Hk3T5Mu
         hmezMWBhV2T01h3KdVzpZZFnMhF8h7174VV+7okbTkaf65o+b3FD1ank71IHmnYfg2Kf
         SAc+J0SE04/CnWki9T/9qAiXhR5cmqa9LnYIBtXaPAeYUBNSgyQAYRCqnKkuNFNgkCIm
         PAZhP6/TaocTg9Nmtit02WKJXnDpgaH5YQ3som9irF+1X7QnvssX2Z4gf1DGCOfB1UYs
         Basg==
X-Gm-Message-State: AFuF++mnqrqvhvdSUtdaBhab9CQDgrkKVTrD/AN51aujx8ZmNNJHfNQF
	Rf/v4lQg43cC1W+PqhtlutULpusgZ06Xmj9FTFDB+5cPTaXN7Kl3XbU60ZV0/VrMGlFy9CMbgRA
	2xFyCn2gO4mvimcysnVDQNZNDEA4DdyxfJUL3X/LDhV5iha9AJHK/q9186k2fISgEmS2GeQKFIT
	ILRcc=
X-Gm-Gg: AYBFou3hnYS/ci14vnJFa0toWVp5IsQxvSvExEoM+qwHYLivFfKauGucQRvok/Pu8W7
	lYX4RQ71SkfNdgGH0t1PtqAnsmNbrnjBs0SI6O3NHjDAPTlg+IbXe1wK/Ekii1GYAUsNvsIPVDo
	RmTpuNHMGEZ7QfgnwH4XqimYviPR38PRIC90tY21flhVDmV2vMCAeKS3Ymz8RsuEmK0inzQZCtK
	C+cEyBsX6L0uyg2eWnJYTgp3XGTW9sp8JBPeWXWIIaJk7GjUaHMyZQ8Zajyc9UTcLFMrDv7xk6Z
	/1IdueR8nE9nNeOI2rEB7/aNQCYRsWHo0xSpF4REUGIeeHiGRX/lBhz87LqSPPrb5s/+QzwY+Sz
	x6bIbUvnBsLETqtC5DQloJiGVH0pwIxphtKYw1g==
X-Received: by 2002:a05:620a:4686:b0:93c:b895:6109 with SMTP id af79cd13be357-93e85ff3d03mr369081685a.9.1791273246001;
        Tue, 06 Oct 2026 00:54:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93c:b895:6109 with SMTP id af79cd13be357-93e85ff3d03mr369078285a.9.1791273245483;
        Tue, 06 Oct 2026 00:54:05 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178daa115sm53604975e9.9.2026.10.06.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:04 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when available
Date: Tue,  6 Oct 2026 09:52:58 +0200
Message-ID: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX5CFUynqIWvxj
 /WZT4kMdOFt6yGtTSLQxxXrxyB3g15vL1uitKVPY4Da/fA74miIezD+7/V70isMW2l/uUFz0J1t
 /XVuHJ7VgkuSy9PmY3j9JevwoafwdKk=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac4a91f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6k3ItfHtZ7OA1SFZEpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UF38TgxYum5UOq699rxeckmd2N3N8-RD
X-Proofpoint-ORIG-GUID: UF38TgxYum5UOq699rxeckmd2N3N8-RD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfXwXQC2ksL5o5x
 bdUI8Yhc1NdTkaIx7LSPZT9kgj0n4W/2JHxS7IRagJvvOVcHrO5qPlBF7Y8FJ7lG3714gRmh78D
 a85Hi7XI1Oj4WafGtm7RwwXDOZOTCRy3TCcUDHx8Dgc59ePPW2XTy7+1BjM34VpbumdHsvcbVoj
 gRINWRzeew81cBxpZr4YZJb5aWScIkR2UKyaUbxn/4nt5zAMPS7tZYRny5BG2BnzRUqv++QuFzC
 S6CLva2ay/Pz/OG0YvMPyoBKK/4F91OEcxngQBdDZnMhAQXVzurnRQdY9ZSLPvp96bXAn6awF9p
 M84k+KeDK3TFmjvP9CDnn22iwXOQLYWOyPPmnLBy/CD07iC4LyMpqO6/o+26WSDldJWwn1izKmg
 P2JfQRdFGpDfXUmix2/mLxbuvsZbc6XIw6BcoiRR8ze4bvMe8L2wv9AtLbWfZORdlKUhI5Sd7Rg
 yrsqAB+gIOgpzVwdsUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005407_627802_8C39B5CE 
X-CRM114-Status: GOOD (  12.63  )
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

VXNlci1tb2RlIHVzZSBvZiBaY2QsIFpjZiwgWmZhLCBaZmJmbWluLCBaZmggYW5kIFpmaG1pbiBy
ZXF1aXJlcwpub24tT2ZmIHNzdGF0dXMuRlMsIHdoaWNoIHdlIHNldCBvbmx5IHdoZW4gaGFzX2Zw
dSgpIChDT05GSUdfRlBVIGFuZCBECm9uIGFsbCBoYXJ0cykuICBUaGUgdmVjdG9yIGZsb2F0aW5n
LXBvaW50IGV4dGVuc2lvbnMgWnZlMzJmLCBadmU2NGYsClp2ZTY0ZCwgWnZmYmZtaW4sIFp2ZmJm
d21hLCBadmZoIGFuZCBadmZobWluIHJlcXVpcmUgaXQgYXMgd2VsbCwgYnV0Cmh3cHJvYmUgZ2F0
ZXMgdGhlbSBvbmx5IG9uIGhhc192ZWN0b3IoKS4gIGh3cHJvYmUgb3RoZXJ3aXNlIHJlcG9ydHMg
dGhlCmV4dGVuc2lvbnMgZnJvbSB0aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMgYWxvbmUsIHNvIGl0
IGNhbiBhZHZlcnRpc2UKZXh0ZW5zaW9ucyB0aGF0IGFyZSBhbHdheXMgZGlzYWJsZWQgaW4gdXNl
ci1tb2RlLgoKUmVwb3J0IGNvcnJlY3QgZW52aXJvbm1lbnQgdG8gdXNlci1tb2RlLgoKRml4ZXM6
IDJlMmNmNTU4MWZjYyAoInJpc2N2OiBjcHVmZWF0dXJlOiBhZGQgdmFsaWRhdGlvbiBmb3IgemZh
LCB6ZmggYW5kIHpmaG1pbiIpCkZpeGVzOiBkZThmODI4MmE5NjkgKCJyaXNjdjogaHdwcm9iZTog
YWRkIHp2ZSBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBpbnRvIGh3cHJvYmUgaW50ZXJmYWNlIikKRml4
ZXM6IDVkYWRkYTVlNmE1OSAoInJpc2N2OiBod3Byb2JlOiBleHBvcnQgWnZmaFttaW5dIElTQSBl
eHRlbnNpb25zIikKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJA
b3NzLnF1YWxjb21tLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwg
MzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4
IDc4MThlMWQzMjYyMi4uYjU3Y2NkMTE2YmIxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAg
LTE0NiwxNSArMTQ2LDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3Qgcmlz
Y3ZfaHdwcm9iZSAqcGFpciwKIAkJaWYgKGhhc192ZWN0b3IoKSkgewogCQkJRVhUX0tFWShpc2Fp
bmZvLT5pc2EsIFpWQkIsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaVkJDLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFMzJGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFMzJYLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFNjRELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFNjRGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFNjRYLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZGQkZNSU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaVkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQkJRVhUX0tFWShpc2Fp
bmZvLT5pc2EsIFpWRkgsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaVkZITUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWlZLQiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQkJRVhUX0tFWShpc2FpbmZv
LT5pc2EsIFpWS0csIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaVktORUQsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKQEAgLTE2MywxNCArMTU2LDI2IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZLU0VELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7
CiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZLU0gsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsK
IAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktULCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CisK
KwkJCWlmIChoYXNfZnB1KCkpIHsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFMzJGLCBw
YWlyLT52YWx1ZSwgbWlzc2luZyk7CisJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0RCwg
cGFpci0+dmFsdWUsIG1pc3NpbmcpOworCQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NEYs
IHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZGQkZN
SU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZG
QkZXTUEsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WlZGSCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOworCQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VkZITUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CisJCQl9CiAJCX0KIAotCQlFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWkNELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaQ0YsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZvLT5p
c2EsIFpGQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WkZCRk1JTiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WkZILCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0JCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaRkhN
SU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJaWYgKGhhc19mcHUoKSkgeworCQkJRVhUX0tF
WShpc2FpbmZvLT5pc2EsIFpDRCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOworCQkJRVhUX0tFWShp
c2FpbmZvLT5pc2EsIFpDRiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOworCQkJRVhUX0tFWShpc2Fp
bmZvLT5pc2EsIFpGQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOworCQkJRVhUX0tFWShpc2FpbmZv
LT5pc2EsIFpGQkZNSU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaRkgsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaRkhNSU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKKwkJfQogCiAJCWlmIChJU19FTkFC
TEVEKENPTkZJR19SSVNDVl9JU0FfU1VQTSkpCiAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgU1VQ
TSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
