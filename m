Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AD7606A31A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 04:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YsNmwocW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ee7cb9wC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=boZvZR7T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7w2sr90YgmG8LXt0t3W0aHcqNqhoWjFxBPPrZH1OziQ=; b=YsNmwocW+6rSS52lqreAl52Qf/
	gGPwU89wIaHpPQp14UuxCsJH60vPesfa2+qlY9FyKh2SNwOOlCmPw2AXVmC0auA5WCoGKWvVb7TW7
	WQVzU7lokNETIxAzX5SqgRSoCnTA/R0O1B5FHIy96iWsXiYVpeQZWdFHF1D30EgphpfPY95yYDoBt
	Q/7zYDnHsQSXjlbgQXgs33YVFBg5BB7JuYMVEzCP8dHyjKSB+3EeyGhGe2rdQME2Py0pDd3f6lukh
	bdp+YzBVHvHCEcM5lUGsber7A0rTR9oDNL61Vzef/wogNDLmJwYz/Q/UoBXzD1GlqsuPsXEN0yz26
	mMD/sbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPuKX-0000000FevR-1gDF;
	Sun, 08 Nov 2026 04:16:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPuKV-0000000Fev6-0XWa
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 04:16:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A81PX7j3368559
	for <linux-riscv@lists.infradead.org>; Sun, 8 Nov 2026 04:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=; b=Ee7cb9wCS4xOkNZZ
	06ssCAvMsvhGZvDwjBrszKltQbNveFITvqXXe5wq8JNkcGfvjwC4Y1JF/+ovoqc6
	uL11dNiBxYn8+4wD7HLdantcZEXWccAmu+o8BnBi2hH5/C7wNKMcTfzzJy/LEDX/
	fpLr7qEoApFfken6e6u1e1ejElEntt4qhYSZgJVF7kpLCJM+Dq/nVNiSnvfmLT3c
	wRp1URZSUCYfc38DC4Q7AzpNk75nwzcbg3Yjhf9tnrhmcmAi7gH3QIR3LyA04aPM
	ML9wZDPyHvrkGFDvSDgf20GjkI4QtX5dAn3aDBIy5CMQ5iQquP9ECui09h3493/y
	T26mSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99j361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 04:16:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so124144a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111389; x=1794716189; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=;
        b=boZvZR7T3it8E3gD7K/wAhYfrD0/Bf0FxZvvzf38FvdP16DMnQqhGHcZtDteNt/EAK
         Foj5iGNxcQt38r3fUbB4JSdJtzY+ZULLxr6UsZIfv6ZaDSQynjI8LZdGSEJ/EOZHhi0h
         /K28MvQ60Q8TEqXWKj0taeta2HcAltoNmekLB3GU0h7oJS738NRPm3UbXzMJ6UPcEuCH
         9Xm6Yg3/Be94Yn0kHwwVzINxbOGg35PGZ4F+X2dUjQkW0fQvEJ5/S39tYmRIKaAzKJve
         0HEeuOW3XfTYVwYi5PY6MKVl7ZWgPitlXKMc6NwVjKtDJTNNYLvsstLRLN925UDEsd2q
         rSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111389; x=1794716189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EpQgNuheJiOIWw9pJZR9WmQ1BgytiRu9Rd4D/3xkxN4=;
        b=VgeA4vWJ2m0xe44bBAomRb3GpClGwR+1Mr2aKpnnW2rFJNhf7ZW38et1UwkUPUA6tY
         M2ZizJ2KwuQlEYnGEMS+iWMmeRArussc3tkv6/v1cJoKKXJugOuRYv+3WNwcp0b5vABT
         ZUjnH1K43eTpPi1Mow455EXOxAGIHtsQq8f2zPGCSc3fZhAAWvBtfvLfi74rcAKR9kMi
         v3yswRkBjZMg7DaOUNpN4d1OGbFY6iKGUu/bz/GoQdW6b1EfTfRdpswG2TAnun+BPSwB
         O/oNqM06cdMFIa4DFPXS6NzQJyVuIxNrGnr1QopDQAKppOZWfbOI0mztckzcglc6ZH/m
         92DA==
X-Forwarded-Encrypted: i=1; AL+hErEMpfGEEA0ohnKcciA12hS27GIzk3kZdIWuufnjXrLtkA2JhuEahxXpbMes0Hd5onSnKx1hybmia+gorQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/4G8ayv+8oWAnMm3BoSf3OCfepRSrh4dQpa5Yjljggj/34drS
	3kT4v+aytkzdgJG1KMbEZtFQFGcCNT+2a4yps9QWGP5Z/O8Nb0jUxSql51UODsWJDRIhZ6DSNGB
	L+b/cbfmKegvRf79jzgQvhXxUJ1tDQS/MUhuIVb8m2ga9UyoPWYfdl0biwPBCN+gKl/1uZjs=
X-Gm-Gg: AYBFou1cdqNS8kfZwkZV3DVudsfW7FtwZic76VgWfxoBhPi0NB0myqmmOK97onp2O7C
	4tyz6iU+BhoFr0apnRZz0wX1xvTAORodWuifzO0C0dfMYfA+DJq85L6nCvHX3JzpkNlELx5zdD4
	Vgmj9aXPqHYIsbpPOJmmfvNskb2Ih3XeUllEerUesVIeNFeCOOSAbosJ9yQEMQILfBOi/P83FCo
	NLpDi6xPdGSxxV/hZittMd7petOeINBeRjXfqnUJ4nG9+j8TK2ZQM3llQSQXwlTHfaRBSCVvBjA
	PvTzD8R87+5YRNHB0Om/0Lms7/61a2wajkUw/CQpzK0fBYB/UHoT9oyfB4t3I7La2FsjaTGiNaq
	mk2CmZ+fOW8oiAIlFXq7ktRrliNuDE29ZbI+xv35WFnTMuBNIYmxLMEuSD4SZcpNrnYtqzEvpLv
	YQYIyRux9C
X-Received: by 2002:a17:90b:4fcb:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b12d305c87mr431258a91.33.1794111387621;
        Sat, 07 Nov 2026 20:16:27 -0800 (PST)
X-Received: by 2002:a17:90b:4fcb:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b12d305c87mr431235a91.33.1794111386835;
        Sat, 07 Nov 2026 20:16:26 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278cb8e4sm1391223a91.9.2026.11.07.20.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:16:26 -0800 (PST)
Date: Sat, 7 Nov 2026 23:16:20 -0500
From: guodong.xu@oss.qualcomm.com
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Guodong Xu <guodong.xu@linux.dev>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UW38koQv7zlRABQlfWjCgbXIqkMY4wuL
X-Proofpoint-GUID: UW38koQv7zlRABQlfWjCgbXIqkMY4wuL
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6aeff79d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=DETRMP3d-7gSuzmK8icA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNiBTYWx0ZWRfX3kt9KrQX/ZzG
 C+fopmfl2S1FTj3z0rbmXyB29J88n1vSBd5T8iAmmsL52oDFYJ/tjkKdpGBBA9JOznm0o+OmGIc
 jAxnSJegAtVd/WIPplQd5aA/2q6gXBZ970/Hd19xdFuhnxUp6X2t465xg9x37V3Qk3KRUZlAz8+
 SXxBDXMxJzmZ1gD95epuTLv6fsyZWqeUKtWmNgbwran2DKYsUZ9KkWGQ602HEUrmXq7Yq99o+oc
 2upzCsCTF0Fsxw4h1+s1aOkLdyfqUPPLG8POkkcnvlK6MZMxSdLpYpRSjkTF5BLBnf+KnJNRLPK
 CtmM9FQThB6qDyL1vSsjX2t6BFh0M7FGBrxXaWujzxv4jRKa868Yd28CTjrWh9FO4XErcn6BUK4
 0Jp3hbbu+9nTtbtDnr8xYxaiNQgB/ToPUufdCM6HOmtWXdq4lwBqc/A9OOLM3Vx5FbkGdyBiLre
 4EEikWTd0AcvnyIz73g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNiBTYWx0ZWRfXzS4p1DrKxc2y
 /4cYd7Igbc1zqIw8W5YUrn98jCw0G331hmEtsXos2giv5yWAcXngSxoObrFPCSHJGYQMfkw5hv6
 dDyrovtgJe0Q4LBLK5vM1AOnWq0PcXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_201631_188053_7EBF1E94 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUmFkaW0sCgpPbiAyMDI2LTEwLTA3IDA5OjQ2LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4y
MDI2LTEwLTA2VDE2OjU0OjUzLTA3OjAwLCBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5r
aW5zQGdtYWlsLmNvbT46Cj4+Cj4+IFRoZSB2ZWN0b3IgS2NvbmZpZyBpcyBnYXRlZCBvbiBGUFU9
eSBzbyB0aGUgdmVjdG9yIGluc3RydWN0aW9ucyBjYW4ndAo+PiBldmVyIGJlIGVuYWJsZWQgd2hl
biBGUFU9bi4KPgo+UmlnaHQsIEknbGwgbWFrZSB0aGUgY29tbWl0IG1lc3NhZ2UgY2xlYXJlciBp
biB2Mi4KPihadmUzMnggYW5kIGhlbmNlIGhhc192ZWN0b3IoKSBjYW4gdGVjaG5pY2FsbHkgZXhp
c3Qgd2l0aG91dCBDT05GSUdfRlBVLAo+IHNvIGZ1dHVyZSBpbXBsZW1lbnRhdGlvbnMgbWlnaHQg
cmVxdWlyZSB1c2UgdG8gcmVtb3ZlIHRoZSBkZXBlbmRlbmN5LikKPgoKRG8geW91IG1lYW4gZHJv
cHBpbmcgImRlcGVuZHMgb24gRlBVIiBmcm9tIFJJU0NWX0lTQV9WPyBUb2RheSBpdCByZWFkcwph
cmNoL3Jpc2N2L0tjb25maWc6CgogICBjb25maWcgUklTQ1ZfSVNBX1YKICAgICAgICAgICBib29s
ICJWZWN0b3IgZXh0ZW5zaW9uIHN1cHBvcnQiCiAgICAgICAgICAgZGVwZW5kcyBvbiBUT09MQ0hB
SU5fSEFTX1YKICAgICAgICAgICBkZXBlbmRzIG9uIEZQVQoKVG9kYXkgdGhhdCBkZXBlbmRlbmN5
IGFsc28gZ2F0ZXMgWnZlMzJ4LCBadmU2NHgsIFp2YmIsIFp2YmMgYW5kIHRoZSBadmsqLApub25l
IG9mIHRoZXNlIHRvdWNoZXMgZmxvYXRpbmctcG9pbnQgc3RhdGUsIGJ1dCB0aGV5IGFyZSBhbGwg
YmVpbmcgZ2F0ZWQKYnkgQ09ORklHX0ZQVSwgdGhhdCBzZWVtcyBub3QgY29ycmVjdC4KCkkgbm90
aWNlZCB0aGF0IHRoZSBfdmFsaWRhdGUoKSBjYWxsYmFja3MgaW4gdG9kYXkncyBjcHVmZWF0dXJl
LmMgZm9yIHRoZXNlCm5vbi1GIChub24tRCkgcmVsYXRlZCBleHRlbnNpb25zIGFyZSBjaGVja2Vk
IGFnYWluc3QgViBvbmx5LCBidXQgdGhhdApkb2Vzbid0IGNoYW5nZSB0aGUgZmFjdCB0aGF0IENP
TkZJR19SSVNDVl9JU0FfViBkZXBlbmRzIG9uIENPTkZJR19GUFUKKGZyb20gYSBjb21taXQgMyB5
ZWFycyBhZ28pIGluIEtjb25maWcuCgpJIHdvdWxkIGFncmVlIHdpdGggeW91IHRoYXQgc2hvdWxk
IGJlIGZpeGVkLgoKQlIsCkd1b2RvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
