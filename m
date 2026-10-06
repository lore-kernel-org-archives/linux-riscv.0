Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E61CA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 07:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSWAujS4Q7dompl7kQx3+zIvX/+ZpuSAy4PBBzZwFms=; b=GLE5FT0JcwfMxo
	wfvrA8WYSx43unEmDQw/qFmeUnVqX9w55WGY5aMKH+9vR16t1bCITr1cZLklBOPdlF46IfGqP8Ykd
	oXhs2vCTr8ccBnqjsb85tlHg3Pn/00MofIL5MaLsR9EJmN7Uv2u25RDNqMDYrsqro1U43VtaI7Ok5
	6btrtzkvsKiOF2l1c8VkgkpI5QRrk0KKiRfdvxn51nNEjv+VSGkjnoAVIZVoSr397k860KGGEmlkS
	Yg3+emGtq23pFG7zsFHR6OChuvAF709nvSmxYe1NndBoJDDyh8XrDzLEJKw6VMTadDoDS1MDGr3F8
	Zh8dj2BrRxVwYckfnXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE006-00000000EDJ-094Q;
	Tue, 06 Oct 2026 07:54:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE003-00000000EBy-3Xux
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 07:54:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eC9M061287
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 07:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=; b=IO4OMD23Sd+p/2it
	pv4/OhNsNYfXM7oUBBoaWmNMnDCue7HXuUIc9P0JDBnf1zCHZB+u7ABDdwX1r52/
	PF5k7+PnejvKI7UbKDZSECQZiEa6zY6ZH1nXPgUxGrekb5ScseRFnBT++xJAWMZF
	p3jeB+oE0SRtH38MNjmyPNUnkf79p/CR18Vs7SPJ1nWn6cUPWm2+UX5WqPmnldu+
	sRQlMcQ3F5ZstfBt0973qjvtLz8BwCT02rGMNQL/hy8qv41874AHykaUTM3t6Wv0
	Sx1Kv79iCfNP23kSbznKmdfYZ7VXCdWHE4ea1052sUS1CdqYpjtAiKlXIK52uTfl
	pyZ7YA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4cj63v78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 07:54:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso45458116d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273250; x=1791878050; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=;
        b=X1kRMsXtfDZpbivroefEy5752LP6JZklGmta+TSyJkIQyz261LjPfV0A9h8ye41SPL
         HZFABqmELubESyuS3SeSkZ8wmKIyr6pH2A1QiYonM0OLdmnQXFfYsjxKJmFOkl39Tyjw
         bamDwUubnBUDWWOplUq5J9mbMjnLVv9GIRSWITBBNbJvoxsIAbuyf2IpQsKRzPSwh3QS
         emIMogfinAj2ob0eEtLBJoIyuwdl/N1XgpPFJVM7jqqmlbbANktCpSTrOhx7ODTzp+Ev
         dIUT4LPR/JROz0ey5OpE3VrGcNFd8f1T5bjNS4wdd0TczD8taFwLd1D0d9DC1DEOCQGd
         tN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273250; x=1791878050;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN0zsaPxFhux6cbo2jc8qlCQetZ3Jm0QgCjj5N6fBMw=;
        b=gp2E0hN8YbAUstqau4HUtw+oVq+8kq1cGP5NgdqnoRCj6hcmiTNmxRITi8WDksNdJ6
         /iJHBdBSqqubnXob9BA2R6+HWypnJsPXOd+CEilgrwBJ0ziGeaAcSs1IsiE3jHawBY43
         HGzLCK9pA/PM9hpU417Sqomwq1M+mPgm4761zIkpr5P5ptqKC4/SCJvIt7y8o4jCEsaE
         3js32/0+pdhPioHhtWfUATCdrHJiZqplE+gE85WSa+kDcyzEU+GJzOUxcAXr9jwv37/M
         v69CXNmLLwOqOItn8UlVxYbdS32FholSesgYyzIaQfNSYwUe3oAXZ4DgpG1pX4ktRwZf
         Z/SA==
X-Gm-Message-State: AFuF++kdP9dwe+WRVaECnZC86Ewv1qe9ObqY1vfhykUFr09WnDSRCc9u
	jmImuVKeSHk0RxcGmJr2sx9v2lto/j0QEIfy70RianvHIXo/vpNHdNBrWCqgP3YLayoloQjcF00
	ct8uR5zP1YVTBYc7BAqlKNhyD+NrCxlw/z1iu9E5AUOlS+4XmF9puGyPNL/aL7pHNdF1QVL85j3
	wzpnY=
X-Gm-Gg: AYBFou1o+7mMxYq28Syyv4/DeN8FLuYy3H2TfH9uQ8wjauAAU5yz5uOpEbnxNmtXStg
	SrgzCkbNs/lUtY1Gu8fUpOUqoZNRKqctNGRbG91sj3UiW6zssBcwCoz5FTNSA9j9e4bUesGTXJ0
	sj1xSjXrm3SSD/XaB5q4ueo987RtVTVj17R/B34jf5Ihytw0m3h1ur7P8WScNGNm6NlMapImo1b
	AbyTJRj3So739zqTerKp7P6rHnPVWzzO4JBzmxP+TMdoDU+x7UIoKfDV0IQ9MmIxYmPW2MndyXs
	DmSJpBbCkDLY9Fbee+0Xk3cnKhJ7rmc4CBxSuq0tXmzI4J0uMeQI+P0KWZvGFBB2ix2XbjTUItN
	FBelxudMwyWHdroXFMxkWFaqKD4PHuaQMhflx8w==
X-Received: by 2002:a05:620a:460e:b0:93e:7dfa:262c with SMTP id af79cd13be357-93e7dfaa9aamr745876785a.35.1791273249958;
        Tue, 06 Oct 2026 00:54:09 -0700 (PDT)
X-Received: by 2002:a05:620a:460e:b0:93e:7dfa:262c with SMTP id af79cd13be357-93e7dfaa9aamr745873485a.35.1791273249365;
        Tue, 06 Oct 2026 00:54:09 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm256801115e9.1.2026.10.06.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:54:08 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when available
Date: Tue,  6 Oct 2026 09:53:00 +0200
Message-ID: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX7DhK3HilE++I
 7LdmN+5Kgc7CdGVGHa2BkxD4xg9tr3hgcz0bhFbVRrYadSD/1WpCRMLm8gLyXl9x6N3xuFU6aQz
 lQ2HCy+IDn58jbqSTc4pFd49P8oqJNucllIdqzRMWmKL0PK211+PLGDizgC5XsYxmyUCVELz0Ji
 TfKf1x+K0CtEcEmJ1t5pJWLULycrQG4qKXkR8IBweyY9gmbDBp4t34Ex/uvIy2Swkq5+kYlhq2+
 MH2IvYOTZWOwsqogkcdyBdAhia3CnXOAeD0Q+h6fKG7PcAnabYkSO5XFgMDjyekYFKEOj4PvwYx
 tZ6YkUfHjb8TmqrJVPvM5uHsi0/5bhKV52dN3xD3wVtcDZ9J0iTHhaJY4qT1QqNFiWrPIuN2dEA
 6JGMHhxTs3isYR1r4/jOBvLr/jqGY+o7CZV5U1Ci20eM2IEkOsfooHrisZpKvhM6N9f2WdpaqQb
 3ClaKnRZwiPDHa5uI1A==
X-Proofpoint-GUID: dkcSGj-yfmsZUqNAOzbvWwW1vfnb76kP
X-Proofpoint-ORIG-GUID: dkcSGj-yfmsZUqNAOzbvWwW1vfnb76kP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMSBTYWx0ZWRfX0PxrZYnSyOFi
 fxgCkSnmjY4bD2vEseAV1rl5WEm2xWvVh0+tZPxd/ava2GBC63IxswW7ncbvADze6zxdtGnK9of
 PgSHU4RILVLCJ9GNhBIP4zlkHRECF9U=
X-Authority-Analysis: v=2.4 cv=bpTZl0ai c=1 sm=1 tr=0 ts=6ac4a922 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4R1f5vs9XcR1zJr38ZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_005412_006543_A187CC6C 
X-CRM114-Status: GOOD (  16.23  )
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

VXNlci1tb2RlIHVzZSBvZiBaaWNmaWxwIGFuZCBaaWNmaXNzIHJlcXVpcmVzIHNlbnZjZmcuTFBF
IGFuZApzZW52Y2ZnLlNTRSwgcmVzcGVjdGl2ZWx5LCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGlz
X3VzZXJfbHBhZF9lbmFibGVkKCkKYW5kIGlzX3VzZXJfc2hzdGtfZW5hYmxlZCgpIChDT05GSUdf
UklTQ1ZfVVNFUl9DRkksIHRoZSBleHRlbnNpb24gb24gYWxsCmhhcnRzLCBhbmQgbm90IGRpc2Fi
bGVkIGJ5IHJpc2N2X25vdXNlcmNmaSkuICBod3Byb2JlIHJlcG9ydHMgdGhlCmV4dGVuc2lvbnMg
ZnJvbSB0aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMgYWxvbmUsIHNvIGl0IGNhbiBhZHZlcnRpc2UK
ZXh0ZW5zaW9ucyB0aGF0IGFyZSBhbHdheXMgZGlzYWJsZWQgaW4gdXNlci1tb2RlLgoKUmVwb3J0
IGNvcnJlY3QgZW52aXJvbm1lbnQgdG8gdXNlci1tb2RlLgoKVGhlIGNoYW5nZXMgdG8gYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggYXZvaWQKSVNfRU5BQkxFRChDT05GSUdfUklTQ1Zf
VVNFUl9DRkkpIGd1YXJkcyBpbiB0aGUgY29uZGl0aW9ucy4KCkZpeGVzOiAzMGMzMDk5MDM2YTkg
KCJyaXNjdi9od3Byb2JlOiBhZGQgemljZmlscCAvIHppY2Zpc3MgZW51bWVyYXRpb24gaW4gaHdw
cm9iZSIpClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5x
dWFsY29tbS5jb20+Ci0tLQogQ2FzZXMgd2hlcmUgbmV3IGhhcnRzIGZhaWwgdG8gZW5hYmxlIHVz
ZXIgY2ZpIGFyZW4ndCBjdXJlbnRseSBoYW5kbGVkCiB2ZXJ5IHdlbGwuCgogVGhlIHJlc3Qgb2Yg
dXNlcmNmaS5oIGlzIGN1cnJlbnRseSB1c2luZyBtYWNyb3MgaW5zdGVhZCBvZiBpbmxpbmUKIGZ1
bmN0aW9ucywgYnV0IEkgY291bGRuJ3QgcmVhbGx5IGJlYXIgdG8gZm9sbG93IHRoZSBzYW1lIHBh
dHRlcm4uLi4KCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCB8IDkgKysrKysrLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICB8IDkgKysrKysrKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3VzZXJjZmkuaAppbmRleCA2MWVlMDJjZWUyOTcuLmJiZGUxNzFiY2NkZSAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91c2VyY2ZpLmgKQEAgLTQ4LDYgKzQ4LDggQEAgYm9vbCBpc19pbmRpcl9scF9lbmFibGVk
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzayk7CiBib29sIGlzX2luZGlyX2xwX2xvY2tlZChzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRhc2spOwogdm9pZCBzZXRfaW5kaXJfbHBfc3RhdHVzKHN0cnVjdCB0
YXNrX3N0cnVjdCAqdGFzaywgYm9vbCBlbmFibGUpOwogdm9pZCBzZXRfaW5kaXJfbHBfbG9jayhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgbG9jayk7Citib29sIGlzX3VzZXJfc2hzdGtf
ZW5hYmxlZCh2b2lkKTsKK2Jvb2wgaXNfdXNlcl9scGFkX2VuYWJsZWQodm9pZCk7CiAKICNkZWZp
bmUgUFJfU0hBRE9XX1NUQUNLX1NVUFBPUlRFRF9TVEFUVVNfTUFTSyAoUFJfU0hBRE9XX1NUQUNL
X0VOQUJMRSkKICNkZWZpbmUgUFJfQ0ZJX1NVUFBPUlRFRF9TVEFUVVNfTUFTSyAoUFJfQ0ZJX0VO
QUJMRSB8IFBSX0NGSV9ESVNBQkxFIHwgUFJfQ0ZJX0xPQ0spCkBAIC04OCwxMCArOTAsMTEgQEAg
dm9pZCBzZXRfaW5kaXJfbHBfbG9jayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgbG9j
ayk7CiAKICNkZWZpbmUgZ2V0X2FjdGl2ZV9zaHN0ayh0YXNrKSAwVUwKIAotI2VuZGlmIC8qIENP
TkZJR19SSVNDVl9VU0VSX0NGSSAqLworc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGlzX3Vz
ZXJfc2hzdGtfZW5hYmxlZCh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQogCi1ib29sIGlzX3VzZXJf
c2hzdGtfZW5hYmxlZCh2b2lkKTsKLWJvb2wgaXNfdXNlcl9scGFkX2VuYWJsZWQodm9pZCk7Citz
dGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaXNfdXNlcl9scGFkX2VuYWJsZWQodm9pZCkgeyBy
ZXR1cm4gZmFsc2U7IH0KKworI2VuZGlmIC8qIENPTkZJR19SSVNDVl9VU0VSX0NGSSAqLwogCiAj
ZW5kaWYgLyogX19BU1NFTUJMRVJfXyAqLwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCBj
NzRlMzZlOGZjZGQuLjQ3N2Q4ZmQ3ODBhNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0x
NCw2ICsxNCw3IEBACiAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgogI2luY2x1ZGUgPGFzbS91
YWNjZXNzLmg+CiAjaW5jbHVkZSA8YXNtL3VuaXN0ZC5oPgorI2luY2x1ZGUgPGFzbS91c2VyY2Zp
Lmg+CiAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5z
aW9ucy9taXBzX2h3cHJvYmUuaD4KICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvc2lm
aXZlX2h3cHJvYmUuaD4KQEAgLTk3LDYgKzk4LDkgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2Ff
ZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAlpZiAocmlzY3ZfaXNhX2V4dGVuc2lv
bl9hdmFpbGFibGUoTlVMTCwgWklDQk9aKSkKIAkJcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9C
RV9FWFRfWklDQk9aOwogCisJaWYgKGlzX3VzZXJfbHBhZF9lbmFibGVkKCkpCisJCXBhaXItPnZh
bHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0ZJTFA7CisKIAkvKgogCSAqIExvb3AgdGhyb3Vn
aCBhbmQgcmVjb3JkIGV4dGVuc2lvbnMgdGhhdCAxKSBhbnlvbmUgaGFzLCBhbmQgMikgYW55b25l
CiAJICogZG9lc24ndCBoYXZlLgpAQCAtMTI3LDcgKzEzMSw2IEBAIHN0YXRpYyB2b2lkIGh3cHJv
YmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaQ0xTRCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWkNNT1AsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5p
c2EsIFpJQ0JPUCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotCQlFWFRfS0VZKGlzYWluZm8tPmlz
YSwgWklDRklMUCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8tPmlz
YSwgWklDTlRSLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+aXNh
LCBaSUNPTkQsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZvLT5pc2Es
IFpJSElOVE5UTCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwpAQCAtMTk3LDYgKzIwMCw5IEBAIHN0
YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDEoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAK
IAlwYWlyLT52YWx1ZSA9IDA7CiAKKwlpZiAoaXNfdXNlcl9zaHN0a19lbmFibGVkKCkpCisJCXBh
aXItPnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0ZJU1M7CisKIAkvKgogCSAqIExvb3Ag
dGhyb3VnaCBhbmQgcmVjb3JkIGV4dGVuc2lvbnMgdGhhdCAxKSBhbnlvbmUgaGFzLCBhbmQgMikg
YW55b25lCiAJICogZG9lc24ndCBoYXZlLgpAQCAtMjEwLDcgKzIxNiw2IEBAIHN0YXRpYyB2b2lk
IGh3cHJvYmVfaXNhX2V4dDEoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCSAqIGNvbmZp
Z3VyYXRpb24sIGFzIG5vIG90aGVyIGNoZWNrcywgYmVzaWRlcyBwcmVzZW5jZQogCQkgKiBpbiB0
aGUgaGFydF9pc2EgYml0bWFwLCBhcmUgbWFkZS4KIAkJICovCi0JCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaSUNGSVNTLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaSUNDTFNNLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaSUNDQU1PQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWklDQ0lGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Ci0tIAoyLjU1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
