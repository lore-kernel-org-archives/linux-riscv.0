Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB19760A2612
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZHpgKeyJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kgATETlH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTaGdLKf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9hkqKB878kv5n1aqKdE08sOwkpeqRuQBDvAWZ0l7Uug=; b=ZHpgKeyJWuAGbmTwnIQq1ocJho
	nfhZRr8AFZlU5ULdvSC2cSBDQy+0Ymw3Y220C4ZyKnKEfYtOhzHdvH+fg7HrEwFbmQAsxOc116TIN
	WGbqD/SVwG4PL8S5+GRWDsWwHG5MrKLoMxNTtZACPtKlpC4JeqSpprGp0CmSO1KdU++aeA5kldzdj
	Ww7dX6RpbOELNif+IOPnljGBMU/l4btOkt/nt2B6WeXZF7Mrj/iLmQsFOh4EcnWmzJGQtxK0KRAHi
	UMjjkFAtoAMTl7DhamQgsws2N+7kH7pvpF8KEDZHN6KrGUrnjm7S9VOqN4KnKnPhJWpEI/C2xlKiL
	lmBNihTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3O-00000004jF0-2fBO;
	Tue, 10 Nov 2026 17:54:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3M-00000004jDr-3iEr
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0WCi3725783
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=; b=kgATETlHuJduGH32
	VWDGbcDeiywG90BY71yrQCHJ3wAtDNVx+6zM7wdLerN+yiR2A1eqN8gvXf65pwwK
	x0uTQ/evzNOVV5S59OAVUWeXsbMwyEcMmtDFEFXnhvZtUgpt4woHEiVMNohW6pqz
	ONXAeUFF3kY7dtOt0x6z2F1REZkJzl1YtOkIr6MYXdmtJAXDlbCR6VgMqLm+7N7Y
	7ZfkG+KbHioKqGiDI4cYc3CXD7g+oY3GIL8Do0YFKzLhWmmLtggo55ooNXlW8SwT
	FNbh68yUOo+rlM9v3UgNFySvZTyrRunr3x/J6L1xCxRjRf6XZsVCd1iENT/CH0Bu
	IOfCXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5da9e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945c60b470dso346189085a.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333279; x=1794938079; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=;
        b=UTaGdLKflA8QDN89owY75U8+JQ1Qp/j4pjOd1VSX1pAbBgCknAHvUr3tnF7T1+Attb
         1KMdsj9Ug7noM2jVTSX1b6Gq9/u7o47NwhcmWKQrRshGYP7aOpmVMCoiNWDfPi/vPhE1
         IEkRYkp1S81/fPeCortmKM2iVnoLPWtBZ3qjHKYoaw6v7hFKJwVTupikHedpM5QEfs1W
         vA3I35VR7L4kL7bPVAlGKNDHHBP0W0JDEmdrErZCjWvZhemRz0/ljLptb8NGvfMCWEXu
         wiMwTAVd7ZQZUNFJPxbNKZ/tZV23RZmRpc1/eEMCxqmhw3W5s6b/ufMd1go7M0v2JEoH
         aIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333279; x=1794938079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDVDDTqM7qW9WUKRjzUggikRl97rZJtI3Mq2et/Up5Q=;
        b=FFyUtSJwWJjpJqH4G/ZN1sVtDvQr0c4VDdl1S/6dUwme5NcG/k4FgsXlkbl3V9W6DZ
         Z7oNm+vWCwRNQzbJ1WX4npTjZdV6HNqx4qtBZhUITc0N5LXmc+otQDTqgsli8NSwo6F2
         93/dLylRNfzGBuc0ZPSKE8TtlFBObfX8fUHX8OoAA84p6fHBB4RMnp7gp6FeM119i/WS
         PgbT2RY2uXCNhq94qq/Vv4rHkzFqRdOGGc6OGpNZ2AD4Ytm92aPsM7ap/4JHD/SnuPWy
         Xnfl0ZZJONSsQ/i6Q9KflitxpLhr3raHCYIRpcyUV/vQRN0E1Wls9f2zxcQaurD+s6ff
         gVLg==
X-Gm-Message-State: APuU4Z9EH05XprHmW3j8a21uWUPZBjaDDXvON6SU7mqxUBN3QGk50JMq
	oykjB8qVOIDbNZgXBn07STPEJDTKSTbwn689J/CKkCCid16GfrSz2a19JZeJXc/xRUiAfLyDzTK
	zDdzHe5m84MjtVlaAfEST/lqEyw0eV9MfusuyrcwBIHnbUm0923Gdy4mxJwzUbOX/pFkNavmyLS
	37exk=
X-Gm-Gg: AYBFou0pfZtTHHbCsvWUB9987SjkVf5ureqhxQphmZcKxUcPWeDTTYYIpJ6Lc0b1qxr
	EgzERwXhWAMDUXlisqj4uNngKZ0PZf5As+VWxJZWdhOw8TG9OkcADnh7kEffQADQpWguEy41xj1
	QPQNdFnWXrnhKoGnWWzPwoSYhPyl9Kq9dVClZN9US9z8NH9t8NkB53/YJqYjQ2C6aITLM/LSwC4
	UUXDNh3QLOg+2nfZzf4W3MugtqOtELiPWLlwZmG1B8XpnK/qMEoIGGSXbGIt4rlh24hGMPTNlfM
	xiEZZYxzoI6FahAupSmjFCs0O3YUt39lRE5yn0fTfMKVhenFlViL/1V1cGMxoFCHWaOFuyx5UdU
	3I5PwvtCP+0h8C7XX0VI4be+0wfRM3n4d/VfG5RnhSePUv7d4P/nK107riYZGvTh+TFXIK9S7q4
	8JHuKFHZNXpmE=
X-Received: by 2002:a05:620a:4886:b0:93e:9508:8360 with SMTP id af79cd13be357-9479f2b5063mr586636485a.27.1794333279200;
        Tue, 10 Nov 2026 09:54:39 -0800 (PST)
X-Received: by 2002:a05:620a:4886:b0:93e:9508:8360 with SMTP id af79cd13be357-9479f2b5063mr586631685a.27.1794333278537;
        Tue, 10 Nov 2026 09:54:38 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm4713009f8f.13.2026.11.10.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:37 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 5/6] riscv: hwprobe: Report XTheadVector only when available
Date: Tue, 10 Nov 2026 18:50:47 +0100
Message-ID: <20261110175048.82208-6-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: wK5wiLoeZKPm9RG9sWtf322NSEnZzfRu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfXzVLPr0wJ9TAq
 kchB4tgA6TBaYewWnicKyqaqQc+rB4jGwCLHxfR/by8oibBQJSfEzct57bzvXlyhHlEmwZJo4/p
 eFzrz3z+nCbvOwbFAp3q9wXQ3DkLIm4=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af35a60 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=07GccxXRkLxfzaV0jD8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-ORIG-GUID: wK5wiLoeZKPm9RG9sWtf322NSEnZzfRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX7niB81m5sbQe
 MTbprCD4UL2ngyW51/7i5pq6AnO6ySX0rJhiZnU/Tdby5IFvB8DUubcxlfEX2H6/IT7bK2BJp7g
 +gjlFaxCNjYVUHB7Vq6rQPZjFfUDYZlgg9+t7vpN6l5fFmDp2ziDpk7ePbBaBbtPvQj+LKh/LBe
 PBzt1QpdwOm8l4IgsVA2MsJxttiVh+E2eNYwE8H1pNIV5qV1OFvFe+xydjPXoz5ry/LwjtOQPm7
 WzfMz3nqOuW+0NfQhhKj/10oRV6F4Yq5S45FYaL8bB9hJyXvScdBUssKSzy0Nk0ikJlm3pzgygG
 q2DOs+ZdEjfm5sXmqRgGCobBhpVOFmfnYS/GuOF6A2ZzAxhnApk4GxQfzVhdl+U4GiwoHvQIVo4
 P60t2lwW6z1josH7xpbo7lKGRc6FBZZunJJEbGN5PresKgwpn1CKKyOhHIz2jnh9r3qoC5qjjB9
 H0SFlYNu7h7DD6+lfpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095440_932776_639F71F7 
X-CRM114-Status: GOOD (  14.88  )
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

VXNlci1tb2RlIHVzZSBvZiBYVGhlYWRWZWN0b3IgcmVxdWlyZXMgbm9uLU9mZiBzc3RhdHVzLlZT
LCB3aGljaCB3ZSBzZXQKb25seSB3aGVuIGhhc194dGhlYWR2ZWN0b3IoKSAoWFRoZWFkVmVjdG9y
IG9uIGFsbCBoYXJ0cykuClhUaGVhZFZlY3RvciBhbHNvIGJ1bmRsZXMgb3BlcmF0aW9ucyB3aXRo
IGZsb2F0aW5nIHN0YXRlLCB3aGljaAphZGRpdGlvbmFsbHkgcmVxdWlyZXMgbm9uLU9mZiBzc3Rh
dHVzLkZTIGFuZCBoZW5jZSBoYXNfZnB1KCkgKEQgb24gYWxsCmhhcnRzKS4KCmh3cHJvYmUgY3Vy
cmVudGx5IHJlcG9ydHMgWFRoZWFkVmVjdG9yIGZyb20gdGhlIHBlci1oYXJ0IElTQSBiaXRtYXBz
CmFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIFhUaGVhZFZlY3RvciB3aGVuIGFsd2F5cyBkaXNh
YmxlZCBpbgp1c2VyLW1vZGUuICBSZXBvcnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1v
ZGUuCgpGaXhlczogYTVlYTUzZGE2NWM1ICgicmlzY3Y6IGh3cHJvYmU6IEFkZCB0aGVhZCB2ZW5k
b3IgZXh0ZW5zaW9uIHByb2JpbmciKQpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDx0Y2hpdUB0ZW5z
dG9ycmVudC5jb20+ClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFy
QG9zcy5xdWFsY29tbS5jb20+Ci0tLQp2MjoKKiBzbGlnaHRseSByZXdvcmRlZCBjb21taXQgbWVz
c2FnZQoqIGFkZGVkIHItYgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25z
L3RoZWFkX2h3cHJvYmUuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3Jf
ZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0
ZW5zaW9ucy90aGVhZF9od3Byb2JlLmMKaW5kZXggMmViYTM0MDExNzg2Li5mMDdhYTFjOGFjYWMg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3
cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9o
d3Byb2JlLmMKQEAgLTEsNSArMSw3IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiAKKyNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+CisjaW5jbHVkZSA8YXNtL3Zl
Y3Rvci5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZC5oPgogI2luY2x1
ZGUgPGFzbS92ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZF9od3Byb2JlLmg+CiAjaW5jbHVkZSA8YXNt
L3ZlbmRvcl9leHRlbnNpb25zL3ZlbmRvcl9od3Byb2JlLmg+CkBAIC0xNCw2ICsxNiw3IEBAIHZv
aWQgaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF90aGVhZF8wKHN0cnVjdCByaXNjdl9od3Byb2JlICpw
YWlyLCBjb25zdCBzdHJ1Y3QgY3B1CiB7CiAJVkVORE9SX0VYVEVOU0lPTl9TVVBQT1JURUQocGFp
ciwgY3B1cywKIAkJCQkgICByaXNjdl9pc2FfdmVuZG9yX2V4dF9saXN0X3RoZWFkLnBlcl9oYXJ0
X2lzYV9iaXRtYXAsIHsKLQkJVkVORE9SX0VYVF9LRVkoWFRIRUFEVkVDVE9SKTsKKwkJaWYgKGhh
c194dGhlYWR2ZWN0b3IoKSAmJiBoYXNfZnB1KCkpCisJCQlWRU5ET1JfRVhUX0tFWShYVEhFQURW
RUNUT1IpOwogCX0pOwogfQotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
