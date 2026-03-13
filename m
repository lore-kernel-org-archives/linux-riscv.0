Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5650E105F7A8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTwiFAB0Yd7n9SWvT8nG+CPKHwutv8J9ek0i5zzMd/o=; b=CSqxYi6rlK1s5q
	vB7N9icIVm01CHRlAy7Omh9SOaW/woK9jlXGwaAYGD32pGPSMW9L25zMM2FPdOeMEUzZjXUeGppJ/
	9M/iCbnee7BFysVk1hAdbra4lgIpDSjN1XG/Hqwujtnhf6HlcgEj7/LPGOlyswPpACSUksrm0jdSn
	rcAjB/adENUxcHR9t/sq/VFs81ObksmJRMm8MnuyKsEKrCVJmWrU473XY6Guuuszn5SnVQla9z1C1
	yPHKc+hHz5am+cPQ1An6o/EOgYsfO3kE/IWlH8Yf/ROck30WYiTdlvoxAaG+iNQW2NZaX7cXRn1Uk
	YuJPsKDT/3uXKO04QjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12qP-00000000Jaq-2ife;
	Fri, 13 Mar 2026 13:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12qN-00000000JZx-00Zy
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:46:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8kW481447
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=; b=LNOLWocu4MuP/OQS
	jEmTj2CrWERHrbNAoxG40KFmyvHUAOcfLnNxCom1H0yTtsdf80KJ2VaDllPUepaD
	+U+3YPNcwCVdFS9MueQzv+9d5Tl7RQAiqsSBaYjU7ZASqqdayNPCD++hK2RUlIzc
	zSa9VGUDZXHI8qh/SSKhGCoIoTfG5O6bn6+TIh1dpuzeQpPGLb42CJ9u7ki/tALm
	1FjXiL7fCCZGJr8E643gE/nahHPrSufOieECPTfSuKHI35rOAEDbpxUvuWKtKdyg
	UwnSJHMR6t5cfv5SbKZGVRRxyJJZxSDY/y3ySl2f/Q3bAjXZqdQlXjFEysvC0YdA
	+817tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rxx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:46:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1182215085a.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409581; x=1774014381; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=Ukr5nNhF9MFi0iz/fzNZ1jI0ctedO8cTQ0F8prgk5+4Q2t3zKAsqQTZP1Xv55gIpsm
         PsiN9Kb+tcGiQ9bN53+mpq9hRWNGK4NrZgNHEKOBQNNCmd5WTJWt3RMArc0oDDFaM1/B
         HXl0DgWBTB0XklWYn2frREkW5ZPhjKy1L9J+LUk/VSKsF8tjoI4qttX2nzt+c1lMGXHl
         YkzWhlYrYV2srOBOlOBnG38D+WeolHckNmi9sDPdHBykMz/tY9HPlpI1h1MwSd+Nhkyc
         FpmCgTL0llVY2NE6WPyw+Owk1/pCCeXSnXSOUhg8e6VCX2kaZ3JaEbNtXuSaxbVwyPiH
         Ozzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409581; x=1774014381;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=VEZemkrmb3gYsmPyCmf7aidpLVZkjC+hY3dGfdaW24nnVpoB60LNMqGFyREi5ra6+u
         12hgtbUhYzLWHWiBpLp5s98TuRQWJ5aJE2jFF6Yf9tFJ5nmXs74fWr1s7UGP9VjPpEId
         cTURjmzR28lBQVmHTL/Vw4CgUaSxKozJpMOO7w+wlAwMhGpCp1yekLaIxr1J0Q362siA
         0y7KS+rAwrGTyXjBMz7PCrXR6J+kXJF0gU6sfsg4OXjdVdpMhCJT73j/s4SB3uWWIX4a
         Sn9oY4WLSuZ/311w+3gWYt1gpT3dcYjOxsCSDR+NwVNu2FzZp1LUC37nsHuG9Jn+di5b
         LEOg==
X-Forwarded-Encrypted: i=1; AJvYcCWDVpaZrJ0dKmj0wU5v4n/rL1bnRVl0lBtI/S8CwAQgRA6qEquc/tPh0DIgeNWqYduO/vzALTuJO0gyHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB2woPVROxTgdQglsL/C93nXHqrZcYgd8O4uXAY9993xEI56Ir
	+8HqqOaME8V1nKljE5PyMA3kA5ffn1Bs8BYEixRSGONZEQM3vnJOEGYj29f5JWyq6tbtbi3PHhV
	ZhxtNiDJPivjlqik8L2WA23xuIiRvx1KWOLivU3kdozP9DuQ0WFXZ8xZ+AIO7ZuCK/BRU4NS/Ff
	+655U=
X-Gm-Gg: ATEYQzwabl7ZtvxGxD8UdyKOpBiIrw5xAjZjBVaKODCsmVAwEM13SAFHmc9iQz0DmQR
	3O55cWQ0hd3dTqKeiDungzZL2nAsFUZF56Q3py96Vr/kRQEyJKKWG2Vb7E0rJna0WvWdpn3pNEb
	6TxOIHX5eOtnnhPL8jcWaHgmq8gv2gUAWTeisawl2zF/D5wcnUDGTGIx5UpL88RPBbMgrrhux1w
	o2Y/uxIkUH9rjsW/puOtYvueIwqikGlDm5wFtFSCHXc0NGRIaegw2uhKOiv2JKzvXoYhmKJK+Z+
	7t337uRBJgVZdYB90yjpZM9mWg2R05wWxQB7oUwyPZdNj7rcZUDei02SmV4wl+usAfiGlwc08f1
	HyocfgvlslzvzpBWyJMRc80agdtgLLNOXbG7EOVMTGRhv9NNWak0oJdmeIzvT
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446721885a.54.1773409581032;
        Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446717985a.54.1773409580598;
        Fri, 13 Mar 2026 06:46:20 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm551207205e9.10.2026.03.13.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:46:19 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:46:18 +0100
Message-Id: <DH1P89I0A7GY.3K7UNNNSS7LT@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 08/27] RISC-V: KVM: Factor-out VCPU config into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B4lUGmTiwEKuLuWvQ8H9PauVpdJofHOZ
X-Proofpoint-GUID: B4lUGmTiwEKuLuWvQ8H9PauVpdJofHOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX5Lxca3XXjw5b
 +DAkvWxDxU4sJ8fqqKiL0rxkWMrNzy+F4N3A5Sxqs6SuA1qGXseoVwTFgOXmj6IBQs2SSg1dCWW
 0GKJwwdfWOfhF/B8t9kF76izyuS1WGEKSFZ6U1Gk8cFzzLVw/whWXRKOyIKF8AGKLQYfYG8pOzV
 2eVHBWcGPdGcbvDwtOJg6hCPlFiYJm1gJMOQkbBkHFXAG+vbp2KQCdZ+EQpXIE1/v7EE2Cb/ptw
 Y/9RXR6PVODDCsVh0PpvmAfl8/8u304FtYRELKk9nS29BjNZYdnjvXHkTOs/nh4WocAcuCZpRWi
 RXJrRsBZJWaJrYskqN5cBozSS1qQya53vI9/UlLGpWVLkgTXMJx7UVEEsSQrCgia1CK+7D8tIwH
 MO/7GxGIHx3LJAgabee3NWxZAiLbZ3pSCwHn79F3x6jcJonKvgSGzRn3MRhe5sAm5lR8Y3soi3V
 dZN8LaOuTi63k0WEm0A==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b4152e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064623_152007_5C83B1AC 
X-CRM114-Status: GOOD (  10.99  )
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

MjAyNi0wMS0yMFQxMzoyOTo1NCswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgVkNQVSBjb25maWcgZGVhbHMgd2l0aCBoaWRlbGVnLCBoZWRlbGVn
LCBoZW52Y2ZnLCBhbmQgaHN0YXRlZW5YCj4gQ1NSIGNvbmZpZ3VyYXRpb24gZm9yIGVhY2ggVkNQ
VS4gRmFjdG9yLW91dCBWQ1BVIGNvbmZpZyBpbnRvIHNlcGFyYXRlCj4gc291cmNlcyBzbyB0aGF0
IFZDUFUgY29uZmlnIGNhbiBkbyB0aGluZ3MgZGlmZmVyZW50bHkgZm9yIGd1ZXN0IEhTLW1vZGUK
PiBhbmQgZ3Vlc3QgVlMvVlUtbW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFu
dXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTg3MSw3ICs4MjAsNyBA
QCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAJ
c3RydWN0IGt2bV9ydW4gKnJ1biA9IHZjcHUtPnJ1bjsKPiAgCj4gIAlpZiAoIXZjcHUtPmFyY2gu
cmFuX2F0bGVhc3Rfb25jZSkKPiAtCQlrdm1fcmlzY3ZfdmNwdV9zZXR1cF9jb25maWcodmNwdSk7
Cj4gKwkJa3ZtX3Jpc2N2X3ZjcHVfY29uZmlnX3Jhbl9vbmNlKHZjcHUpOwo+ICAKPiAgCS8qIE1h
cmsgdGhpcyBWQ1BVIHJhbiBhdCBsZWFzdCBvbmNlICovCj4gIAl2Y3B1LT5hcmNoLnJhbl9hdGxl
YXN0X29uY2UgPSB0cnVlOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2NvbmZp
Zy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9jb25maWcuYwo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1
X2NvbmZpZ19yYW5fb25jZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCgpyYW5fb25jZSBpcyBhIGJp
dCBhd2t3YXJkIG5hbWUgc2luY2UgaXQgaGFzbid0IHJhbiBvbmNlLi4uCk1heWJlIF9vbmNlIG9y
IF9maXJzdF9ydW4/ICBOb3QgdGhhdCBpdCBtYXR0ZXJzLAoKUmV2aWV3ZWQtYnk6IFJhZGltIEty
xI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
