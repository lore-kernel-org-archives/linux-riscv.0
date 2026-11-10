Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4C60A3825
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SusO7FGV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agHZXiMj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bo6iEdbL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XGFL/snSkQErsfuEGRv+rlTEzEqmpjvUwLlEbUsVCvw=; b=SusO7FGV7LA78QYp+uoVTtMjPn
	F8x05p5W1Cj66G0n5ulHK4oksyho+rQthTQBZ2RKNSNOUXfVkb5O/d2lbzhzWa15+Iams/bnFKGty
	aGiBfcS4L1c2/K94yatxRU+4smXgzblanEQcn/j8x7ZyksnbvoKsPaZJlEILeAIuSs++jnS9Bfah1
	xUCkS+e0Lnv8UeIYceWjVgdQsW4QyrDxJYm5RpAAxpOtyfLoMfKejgFX9WGx7x3NWarjoorTdA0s/
	JyfanHIcEJm6KjxvgitcZ6SbvDJlOC2lvqUftRtCrKb0134PDaQ8YkEdutZyVxQcWcSPUdHePN1j8
	kO31gw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3Q-00000004jFV-36Jl;
	Tue, 10 Nov 2026 17:54:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQq3O-00000004jEl-21gq
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 17:54:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAExrv92748320
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=; b=agHZXiMjSbtGZ3+p
	oLWaYb4+Ht8wrmMVEYN9i/vdz/68dWWnyyG0tSyLkiWgzx3j8zEhQzUoNhuPfUCu
	CXeUd4EV87YWQ6EYW/sq/tsZ2ZJtoK3z84XJbLa4TcZI446q6EKPmCsJJl11Hm0j
	VfAtPQ7CPb/yZmxJzscbM9zr18VMLwVdNZ+0oBkU98jsX5KPytUYgarGdezL3s/d
	vqE4YLObv3FhSbc4RM2hRCvpMeDr+foxsZmIRVINcfaOERgBG038JQLtG6CNhNbd
	x4QL4MT0/WDvYIFX8gmB4+p0sBfc9Wqn910Q04w+DfMjDzFzflzOqhCFxOBPHZ2E
	iiiIrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4a362-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 17:54:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so559293985a.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 09:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794333281; x=1794938081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=;
        b=bo6iEdbL3TcV0lUEEhQe03ml50EpRxg8p+YiATleQzyJxTxDPF67VemezEABwOk4xP
         wtVTKMvNiQ042cT1s9gfi1Pw3HSVmiMTVVKGfXHykAanWCW8jcT9AztZE8aZ/VnV62zE
         axNra7R74WH+05KZUd7V5kxZ+YZ+AWgogq1lYFNe4xQhAEnXJKyWdbMyyucJWCqPGXPk
         NaGRd9ui3ckllFKBC3oM3Gl+NH7IR7xuxpZ4TJji2dDxFNBvaoPwVBu/yOS0YKNS3z53
         NnLaje41mWhQ3PKOBqKJ8I1SdYYQcPpErNjMiQVCp5tAtfKWw9wzodKFf7ENDPmUsacG
         uUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333281; x=1794938081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNfFbu6s/BZW9iz7NJgytU4XNo4CC64HLsVPRfXICtw=;
        b=2k/cAnffU6/P1aQq/pPYUyd5CcdGbvpfQ4ZukWqmJ9WZxns9y5b9gG67JIVgnDn4/I
         h1sjh9isMD04HK9FgG8247OLYUidLkncd4CZr5L4P9xPr4uXsY6iXvSe2EP9h8O5dKTS
         eAcsE8tUFpnLOVB7TEx6M1rLWSGqBsgUwmQkpgdmPpIznS9nL3TWXhL6tR53eLefiXA5
         hO94t5kF1MNILFpTf64bWJcqcZCBpu3xuZoVcinj6/32BItPQXOXGqHXwXd/Zc9joKIC
         cNuCx0Sqkz7TwNcItU9WaH6IQQ5FP1NsHpeMtML8jkDeTgQuutdCoH2GgNIFu1SEuUkx
         ccqw==
X-Gm-Message-State: APuU4Z9vTTNK5Pat6VuCU6LNG+I5qrOfcxtaLulhBhzn0oEvWk241sBN
	gF85SpUUajZqooCSZqnlOlWt6WVXzpXCcKam+9oIENK1BTgazeT5pB++8diCeumNmqc/qZrXnUT
	Yonxi+FAFua/2oYGnkj0y4kYg448Eb/ZrfR9kSG/FyfmloGq7IT76mUOjKD3C4/5+6Cu7cySb5c
	zGvg4=
X-Gm-Gg: AYBFou1/QW2zmyAN1ozWKgezCZ6ll9C5dNkuOkX1kKs6H/nn1O5BRDjneFwH1EoiQdT
	w23Iq3/jpIQ6/yCZQJoCeKiIbmF1haOzaaq6xO/ETcU0MOpvK9x+Iij5AwNEWnKJs50cXqcVPGh
	siqRCh4ms/eERyH2Gfnkpm3jdL+sxfi6+uetsdyujnvBztDFAhC7PyZdzkQwgBVBXrVHMUPKPR4
	eC9cnkAQPMadblFivkGjn8pB95n0jlPhcogbjU1QIutZWHjhlEPsdaLhOFRq1D70JsmONzsSlvu
	e5hWecq2pPP3E8b+fj+MXLhazu38Mi/d1C020ej5mJF+sDUfYM9JlCDtALhCgVwvQq7Ux75eLYe
	5PJbC/0zPUjo74Lak3pK+9AliiUonshMt/iDMeXRcr/n8nla0DIVcQWTwUH/wbMm8FNo5U20H6C
	Cz8+ex8aMM9SA=
X-Received: by 2002:a05:620a:2949:b0:93f:3576:d43c with SMTP id af79cd13be357-9479f2fb19amr552187985a.19.1794333280953;
        Tue, 10 Nov 2026 09:54:40 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:93f:3576:d43c with SMTP id af79cd13be357-9479f2fb19amr552185085a.19.1794333280525;
        Tue, 10 Nov 2026 09:54:40 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4982eedfb36sm6541759f8f.0.2026.11.10.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:54:39 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>
Subject: [PATCH v2 6/6] riscv: hwprobe: Report SiFive vector extensions only when available
Date: Tue, 10 Nov 2026 18:50:48 +0100
Message-ID: <20261110175048.82208-7-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
References: <20261110175048.82208-1-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX+pjyxTGqSZow
 B3pFWoVCyz7QkJySF9X9E5KoxLukeWihILlWh9O2UqMjvOJtO2y4n/+9m8jZVGiCLYAnUYEnqy/
 ShsFDL+lvIo5yPEGYBdWhAXaeXhwz64qO3gxfkZaLBflNlkcAS4aAhb44sWXx+1tLRQV5SF8VT/
 sIIhMCo+YZyJAWiKAmmG52Ya+uN+NAej6Fluy6eq3Ak6IERWmZFhHKJneom1kChkojInsGJTWrw
 5Xo/i8SzsWOKh8maKXzoJFTpB4a4Z4UcL+tupkTxBl7qbrFeEVeGUl3O2BAzK1AhNZHPC9hCoUq
 Nb3Z0EPoKt33PHeyXjiBPs7orcL+tdf7ycjXUV4SguvZ0aSWLi6+BVqbh3+ja/oowv4t3wcr3fp
 EiNZRysj5hRGT9Q0xi4u4r5/mbvzo0nEEbbcdzChWe5wJ6lyBZYOjDCb4L9vEqvQdneV6q0qxHC
 3uAkmqIJJn2s4GtRpsQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af35a62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=o7KgkvQ512dmKa9T_xgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MSBTYWx0ZWRfX/Y4e4M1MCTTQ
 BFlNEIQFJEtoX9RV9e20TbXZ5YJxCdMyGPwwwDyPJYKx7ktq94iASR8iWZLsiFYn85gGG57t9Si
 lLoeb8yc5DkWXR9HbTB+hecXuKTeWcA=
X-Proofpoint-GUID: 1Va1VD_ZoHltW2mmaV4Fecnmcgh9VB2Q
X-Proofpoint-ORIG-GUID: 1Va1VD_ZoHltW2mmaV4Fecnmcgh9VB2Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_095442_525004_A842E1E1 
X-CRM114-Status: GOOD (  13.87  )
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

VXNlci1tb2RlIHVzZSBvZiB0aGUgU2lGaXZlIHZlY3RvciBleHRlbnNpb25zIHJlcXVpcmVzIG5v
bi1PZmYKc3N0YXR1cy5WUywgd2hpY2ggd2Ugc2V0IG9ubHkgd2hlbiBoYXNfdmVjdG9yKCkgKFp2
ZTMyeCBvbiBhbGwgaGFydHMpLgpYc2Z2Zm5yY2xpcHhmcWYgYW5kIFhzZnZmd21hY2NxcXEgYWxz
byBleGVjdXRlIGZsb2F0aW5nLXBvaW50Cmluc3RydWN0aW9ucywgd2hpY2ggYWRkaXRpb25hbGx5
IHJlcXVpcmUgbm9uLU9mZiBzc3RhdHVzLkZTIGFuZCBoZW5jZQpoYXNfZnB1KCkgKEQgb24gYWxs
IGhhcnRzKS4KCmh3cHJvYmUgY3VycmVudGx5IHJlcG9ydHMgdGhlIGV4dGVuc2lvbnMgZnJvbSB0
aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMKYWxvbmUsIHNvIGl0IGNhbiBhZHZlcnRpc2UgZXh0ZW5z
aW9ucyB0aGF0IGFyZSBhbHdheXMgZGlzYWJsZWQgaW4KdXNlci1tb2RlLiAgUmVwb3J0IGNvcnJl
Y3QgZW52aXJvbm1lbnQgdG8gdXNlci1tb2RlLgoKRml4ZXM6IDFhNjI3NGYwMzUzNCAoInJpc2N2
OiBod3Byb2JlOiBBZGQgU2lGaXZlIHZlbmRvciBleHRlbnNpb24gc3VwcG9ydCBhbmQgcHJvYmUg
Zm9yIHhzZnFtYWNjZG9kIGFuZCB4c2ZxbWFjY3FvcSIpCkZpeGVzOiAxZDkxMjI0Mzk0YzkgKCJy
aXNjdjogaHdwcm9iZTogQWRkIFNpRml2ZSB4c2Z2Zm5yY2xpcHhmcWYgdmVuZG9yIGV4dGVuc2lv
biIpCkZpeGVzOiBkOTY2OWUzM2M4ZmEgKCJyaXNjdjogaHdwcm9iZTogQWRkIFNpRml2ZSB4c2Z2
ZndtYWNjcXFxIHZlbmRvciBleHRlbnNpb24iKQpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDx0Y2hp
dUB0ZW5zdG9ycmVudC5jb20+ClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+Ci0tLQp2MjoKKiBzbGlnaHRseSByZXdvcmRlZCBjb21t
aXQgbWVzc2FnZQoqIGFkZGVkIHItYgotLS0KIC4uLi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMv
c2lmaXZlX2h3cHJvYmUuYyAgICAgIHwgMTQgKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3NpZml2ZV9od3Byb2JlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy9zaWZpdmVfaHdwcm9iZS5jCmluZGV4IDFmNzdmNjMw
OTc2My4uYmNlYTRmN2E4MWM0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3Jf
ZXh0ZW5zaW9ucy9zaWZpdmVfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRv
cl9leHRlbnNpb25zL3NpZml2ZV9od3Byb2JlLmMKQEAgLTEsNSArMSw3IEBACiAvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAKKyNpbmNsdWRlIDxhc20vc3dpdGNoX3Rv
Lmg+CisjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgogI2luY2x1ZGUgPGFzbS92ZW5kb3JfZXh0ZW5z
aW9ucy9zaWZpdmUuaD4KICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlX2h3
cHJvYmUuaD4KICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvdmVuZG9yX2h3cHJvYmUu
aD4KQEAgLTE0LDkgKzE2LDEzIEBAIHZvaWQgaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF9zaWZpdmVf
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwgY29uc3Qgc3RydWN0IGNwCiB7CiAJVkVORE9S
X0VYVEVOU0lPTl9TVVBQT1JURUQocGFpciwgY3B1cywKIAkJCQkgICByaXNjdl9pc2FfdmVuZG9y
X2V4dF9saXN0X3NpZml2ZS5wZXJfaGFydF9pc2FfYml0bWFwLCB7Ci0JCVZFTkRPUl9FWFRfS0VZ
KFhTRlZRTUFDQ0RPRCk7Ci0JCVZFTkRPUl9FWFRfS0VZKFhTRlZRTUFDQ1FPUSk7Ci0JCVZFTkRP
Ul9FWFRfS0VZKFhTRlZGTlJDTElQWEZRRik7Ci0JCVZFTkRPUl9FWFRfS0VZKFhTRlZGV01BQ0NR
UVEpOworCQlpZiAoaGFzX3ZlY3RvcigpKSB7CisJCQlWRU5ET1JfRVhUX0tFWShYU0ZWUU1BQ0NE
T0QpOworCQkJVkVORE9SX0VYVF9LRVkoWFNGVlFNQUNDUU9RKTsKKwkJCWlmIChoYXNfZnB1KCkp
IHsKKwkJCQlWRU5ET1JfRVhUX0tFWShYU0ZWRk5SQ0xJUFhGUUYpOworCQkJCVZFTkRPUl9FWFRf
S0VZKFhTRlZGV01BQ0NRUVEpOworCQkJfQorCQl9CiAJfSk7CiB9Ci0tIAoyLjU1LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
