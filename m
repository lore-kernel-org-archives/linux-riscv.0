Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD294606B42F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J9XIkXWs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k2QcxLev;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0klwe17
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lvdO9sZjawreWkZtG5kxd5MEq9Qa0pBVP7FbLtnLaZI=; b=J9XIkXWs0QkjqDz56TJki/h9Xb
	nXzOZYPx4G77UE1HuZj6HcwoQ6nsedWneN8Mmb97tuKQia8xSAVXhYWW5sSoLyP2yvrEmLGGoYgqF
	1sHTM0C4EBC746ycuOqjrXB4AKCwypAOGocL0mwRe0W1RkOWmjT0brZdOKDD3YC8YNVoDt+s8tCcP
	kaDRfNWKpBH/bevMTIffIkR+fyDG8ddzFgOS6ZaQ77s8po+junx7qWte0s47FUEAkZ4rZikIMYUJo
	N6gzCwDMMJVrXAmUCGL27yLQek8Do0qCTcR3q1qaGsQeEttlT5bNp+/UJJXrr6w4UGeRizVe/WQPd
	cXvB0RSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3L-00000004jDN-1uPx;
	Tue, 10 Nov 2026 17:54:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3I-00000004jBu-2cP0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0161484447
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=; b=k2QcxLevJbJOzp8H
	axk7JwKMC+hS9Pj2zI+LlegiASNOwO5NUacVgI6Wts892fEPCDlxR3pkw4jno+u5
	Y9QkO4SkxfKJMOkX+U6WQVtmZHXVnJ543QNNvyAjjg6TQ0EBB9IfGBQf9MHEdVnZ
	pG5zgik99E+v3O99AQkHypgikNwS1Gr3PGnJv+KTBCqQXMIHoS61L0yxtkwP05UU
	kvC9J7VJEvqHqMm+96B34cMRoYrrEXCe6g1QNdCYtyL1HdlwfHhHGx9CUfVlU43C
	cfwbsTrmy+eCrvQNmif295cniprX3Fz6VZdNS0x6Clvytnxn9mfVr2GSD77t9KvI
	qM061g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwj33x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:36 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso1826765241.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333275; x=1794938075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=;
        b=P0klwe17YHt7KQA40UnVSRIV2aPTISL95yGoKB1QDFxKQBha64+a7pv9I2NORc758M
         gPic6niRUxir7NYlxbAKcAEb7oV5yJTn4ka98TKWSzH1vViONDALdZQmwStjnoT3yl5p
         r9FbBViAHdg35FEHkzO40of9Y59vcUwyqMNIJeDIpRh0HdsMiI19GZzPzPx1jIklX9eh
         h0DxLjSZDCXOfPyUYfR13mgvzPq4CIiDE6ek/ZVEXfJAsYmz0cnP41EJv1cxvbgi5yw3
         4ZKKzG9OOmLYYKSl/TXW7kQO9D/ilvUvCgt71YbRKhgm1p2jD5t5SkQL1fRVMHaklqSo
         ZURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333275; x=1794938075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XartqBx0tjNe00fIZ99h8anaxL0zIppXq+ESoLfpk04=;
        b=pEdkxo8sAaCcPo6kKo0zsZOQ9oNjmEuGzoslFMBHim+Q02CeeY2K8li2msgaB6EDry
         cF/n/1m5JWezD2pvjc3e+ev9g5yLPG+IUE0FGvxpDiwf+NIzfXd3nJu4jMzOj8jASCoM
         6nQm0HGHlhmSBUkgUqO61rh5L4Fegdk5/MIS5sMT35l4EMh5HoVCGBwzRAkVRruknXJo
         VfqNSsCt0OVtXoHXi4gx8rBcGTOMkIGAumUuOWEy09fbdXyof9nofje+asrtu8qpdBGW
         hjrJELNhdBy/G4+tBtMnAlgVU7Nj7Gl6iq2lXGwcaKm1MB4Htm0bMJlm/wgQdPonrUY8
         aaiw==
X-Gm-Message-State: APuU4Z8f+UVi8yqGyXkDL3F1dL02jw1N7N3sBmfTrKIYAatB39bzxMv+
	heGI8ynReWwfAb2hIIAAlpGaews6LMUouseiLN4fULE0Uk3NQ/eH6PC1uH+1AououcTNAc6mkRY
	g0DbtdQdIPdNFP4GLGi8cW0hVOpVpzJpeulPfo00zG4WvfCC1Cxzg4rWq69w9oK50YOGJuqTVMe
	VFocc=
X-Gm-Gg: AYBFou0jN8x0FtTD6ObGYSmYkdqigqwxlEVWqq72Ohs4k3TAGCy9wTMBhbsC8hB+pC4
	r7cMmmWs7Qbeqd7O2uB1vBe5nf/dvJOMKiVfTIcl/YryJ2Yq9dqmIYyd5mwAvfV9GLmLJf4weQW
	aUr71pMcLOVgEfUSd4Ca7C4MZm/+aZPNo7mw5BeX0YCqmR7EyVDUM0cSDfICkWRFHbMxvduf8Ls
	StBCnTHTbInGdpAwj8MyWYp+ZF/k/YZFvhktroR6VoWvSOvEUKCIVAwqqS6wpDgFF3POsypf1RD
	Aw4QbkYGkMbjYvQNdzOLlZNxAKuJNeUOsrLPH+7Y5IH8zQo3IsykplwjBDo46uj0UFF+8tiLFJX
	SXNQag//WSe02lTq9vMhD7NiQLXi6GLCSQM41GnBrnCnE+ccPNsN7wfcDU+yvFLmDrNtWkMN1/R
	szWWzvO4jBFe8=
X-Received: by 2002:a05:6102:511e:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d301c1980cmr1624056137.25.1794333275160;
        Tue, 10 Nov 2026 09:54:35 -0800 (PST)
X-Received: by 2002:a05:6102:511e:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7d301c1980cmr1624046137.25.1794333274758;
        Tue, 10 Nov 2026 09:54:34 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm89774265e9.15.2026.11.10.09.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:34 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v2 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when available
Date: Tue, 10 Nov 2026 18:50:45 +0100
Message-ID: <20261110175048.82208-4-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: NPOJPhwZ8EPboO_QQW7DP-cBSHjCXUrR
X-Proofpoint-ORIG-GUID: NPOJPhwZ8EPboO_QQW7DP-cBSHjCXUrR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX2lj0+Q4PTw0x
 2d+Io7nDg9CNb7nsfE3L+VNedyT+h2Ue7URz0WFWBgej4SGC4Uic9W77jyibX2Vf1KL/tzPokus
 DshqLxq2H8/txX0n3DjlTqi9EUmckyo=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af35a5c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=Evxct9gNaP-SXZPfde4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXxL0qQsxl8T5C
 fBlTCJKU9oQymhh7+0ZwyVHhinzY75FiFVUtO+QwvoUIte55oDTaG+zvaGrJAVpm/stOPydl/KM
 9WA4M/kd0RsGWTNRx0doH289wMaqdLiLkBGtATsRJoi0tSK94ulSV1T2SLYO7E3He58V+F9F2Vx
 e4dZ76d2/aoyTujYkW7Z8siY+sgSiRQ6wJuQflbnN6OE/NewGaZN1y+bun+SGPmxoyCx8WURO1n
 eBurHBaI4PH7kJSVyv6t5TsWsHVHy7nwnQM6XLrnbji/qozDhMumB/xUDe0Lk6Vf/BXq27WXN9U
 CoEre//KVTWIB7fj/k3lKbUG8V9NXqzT22qeGABHGu/tK4tsfZpRVDhcu6dym71tLXQs8B44gaP
 5Hxa2Igm7pbQqIhdRgLznIVPTUB4D1/NBgaTal6D357mtA+WUOzs6wdezOGu0Odon1gS5gbFZk9
 h93TrO7fQPtZRCA451A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095436_673403_54E3719F 
X-CRM114-Status: GOOD (  16.23  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VXNlci1tb2RlIHVzZSBvZiBaaWNmaWxwIGFuZCBaaWNmaXNzIHJlcXVpcmVzIHNlbnZjZmcuTFBF
IGFuZApzZW52Y2ZnLlNTRSwgcmVzcGVjdGl2ZWx5LCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGlz
X3VzZXJfbHBhZF9lbmFibGVkKCkKYW5kIGlzX3VzZXJfc2hzdGtfZW5hYmxlZCgpIChDT05GSUdf
UklTQ1ZfVVNFUl9DRkksIHRoZSBleHRlbnNpb24gb24gYWxsCmhhcnRzLCBhbmQgbm90IGRpc2Fi
bGVkIGJ5IHJpc2N2X25vdXNlcmNmaSkuCgpod3Byb2JlIGN1cnJlbnRseSByZXBvcnRzIHRoZSBl
eHRlbnNpb25zIGZyb20gdGhlIHBlci1oYXJ0IElTQSBiaXRtYXBzCmFsb25lLCBzbyBpdCBjYW4g
YWR2ZXJ0aXNlIGV4dGVuc2lvbnMgdGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluCnVzZXItbW9k
ZS4gIFJlcG9ydCBjb3JyZWN0IGVudmlyb25tZW50IHRvIHVzZXItbW9kZS4KClRoZSBjaGFuZ2Vz
IHRvIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oIGF2b2lkCklTX0VOQUJMRUQoQ09O
RklHX1JJU0NWX1VTRVJfQ0ZJKSBndWFyZHMgaW4gdGhlIGNvbmRpdGlvbnMuCgpGaXhlczogMzBj
MzA5OTAzNmE5ICgicmlzY3YvaHdwcm9iZTogYWRkIHppY2ZpbHAgLyB6aWNmaXNzIGVudW1lcmF0
aW9uIGluIGh3cHJvYmUiKQpSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVz
amVua2luc0BnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPHRjaGl1QHRlbnN0b3Jy
ZW50LmNvbT4KUmV2aWV3ZWQtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmcueHVAb3NzLnF1YWxjb21t
LmNvbT4KU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1
YWxjb21tLmNvbT4KLS0tCnYyOgoqIHNsaWdodGx5IHJld29yZGVkIGNvbW1pdCBtZXNzYWdlCiog
YWRkZWQgci1iCi0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggfCA5ICsrKysr
Ky0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgfCA5ICsrKysrKystLQogMiBm
aWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91c2VyY2ZpLmgKaW5kZXggNjFlZTAyY2VlMjk3Li5iYmRlMTcxYmNjZGUgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdXNlcmNmaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdXNlcmNmaS5oCkBAIC00OCw2ICs0OCw4IEBAIGJvb2wgaXNfaW5kaXJfbHBfZW5h
YmxlZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spOwogYm9vbCBpc19pbmRpcl9scF9sb2NrZWQo
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKTsKIHZvaWQgc2V0X2luZGlyX2xwX3N0YXR1cyhzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgZW5hYmxlKTsKIHZvaWQgc2V0X2luZGlyX2xwX2xv
Y2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29sIGxvY2spOworYm9vbCBpc191c2VyX3No
c3RrX2VuYWJsZWQodm9pZCk7Citib29sIGlzX3VzZXJfbHBhZF9lbmFibGVkKHZvaWQpOwogCiAj
ZGVmaW5lIFBSX1NIQURPV19TVEFDS19TVVBQT1JURURfU1RBVFVTX01BU0sgKFBSX1NIQURPV19T
VEFDS19FTkFCTEUpCiAjZGVmaW5lIFBSX0NGSV9TVVBQT1JURURfU1RBVFVTX01BU0sgKFBSX0NG
SV9FTkFCTEUgfCBQUl9DRklfRElTQUJMRSB8IFBSX0NGSV9MT0NLKQpAQCAtODgsMTAgKzkwLDEx
IEBAIHZvaWQgc2V0X2luZGlyX2xwX2xvY2soc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBib29s
IGxvY2spOwogCiAjZGVmaW5lIGdldF9hY3RpdmVfc2hzdGsodGFzaykgMFVMCiAKLSNlbmRpZiAv
KiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgKi8KK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBp
c191c2VyX3Noc3RrX2VuYWJsZWQodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KIAotYm9vbCBpc191
c2VyX3Noc3RrX2VuYWJsZWQodm9pZCk7Ci1ib29sIGlzX3VzZXJfbHBhZF9lbmFibGVkKHZvaWQp
Oworc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGlzX3VzZXJfbHBhZF9lbmFibGVkKHZvaWQp
IHsgcmV0dXJuIGZhbHNlOyB9CisKKyNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgKi8K
IAogI2VuZGlmIC8qIF9fQVNTRU1CTEVSX18gKi8KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5k
ZXggNzNkNWUyNTY3N2E1Li5hOWFhMWUxOTM4NDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpA
QCAtMTQsNiArMTQsNyBAQAogI2luY2x1ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KICNpbmNsdWRlIDxh
c20vdWFjY2Vzcy5oPgogI2luY2x1ZGUgPGFzbS91bmlzdGQuaD4KKyNpbmNsdWRlIDxhc20vdXNl
cmNmaS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4
dGVuc2lvbnMvbWlwc19od3Byb2JlLmg+CiAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25z
L3NpZml2ZV9od3Byb2JlLmg+CkBAIC05Nyw2ICs5OCw5IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVf
aXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJaWYgKHJpc2N2X2lzYV9leHRl
bnNpb25fYXZhaWxhYmxlKE5VTEwsIFpJQ0JPWikpCiAJCXBhaXItPnZhbHVlIHw9IFJJU0NWX0hX
UFJPQkVfRVhUX1pJQ0JPWjsKIAorCWlmIChpc191c2VyX2xwYWRfZW5hYmxlZCgpKQorCQlwYWly
LT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aSUNGSUxQOworCiAJLyoKIAkgKiBMb29wIHRo
cm91Z2ggYW5kIHJlY29yZCBleHRlbnNpb25zIHRoYXQgMSkgYW55b25lIGhhcywgYW5kIDIpIGFu
eW9uZQogCSAqIGRvZXNuJ3QgaGF2ZS4KQEAgLTEyNyw3ICsxMzEsNiBAQCBzdGF0aWMgdm9pZCBo
d3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWkNMU0QsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2Fp
bmZvLT5pc2EsIFpDTU9QLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaSUNCT1AsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKLQkJRVhUX0tFWShpc2FpbmZv
LT5pc2EsIFpJQ0ZJTFAsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2FpbmZv
LT5pc2EsIFpJQ05UUiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWklDT05ELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7CiAJCUVYVF9LRVkoaXNhaW5mby0+
aXNhLCBaSUhJTlROVEwsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKQEAgLTE5Nyw2ICsyMDAsOSBA
QCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQxKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWly
LAogCiAJcGFpci0+dmFsdWUgPSAwOwogCisJaWYgKGlzX3VzZXJfc2hzdGtfZW5hYmxlZCgpKQor
CQlwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aSUNGSVNTOworCiAJLyoKIAkgKiBM
b29wIHRocm91Z2ggYW5kIHJlY29yZCBleHRlbnNpb25zIHRoYXQgMSkgYW55b25lIGhhcywgYW5k
IDIpIGFueW9uZQogCSAqIGRvZXNuJ3QgaGF2ZS4KQEAgLTIxMCw3ICsyMTYsNiBAQCBzdGF0aWMg
dm9pZCBod3Byb2JlX2lzYV9leHQxKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkgKiBj
b25maWd1cmF0aW9uLCBhcyBubyBvdGhlciBjaGVja3MsIGJlc2lkZXMgcHJlc2VuY2UKIAkJICog
aW4gdGhlIGhhcnRfaXNhIGJpdG1hcCwgYXJlIG1hZGUuCiAJCSAqLwotCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWklDRklTUywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWklDQ0xTTSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwogCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWklDQ0FNT0EsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKIAkJRVhUX0tFWShpc2Fp
bmZvLT5pc2EsIFpJQ0NJRiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwotLSAKMi41NS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
