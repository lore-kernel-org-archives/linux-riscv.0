Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48BE105F7A8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glIaPRfUbPkcCLXtPwP7e+NtxLnsIcMTtVoKYlFp+MA=; b=tgmExQJ1oBN9Rr
	Hbz599sO0rWCJ7WOLbGdtNwcEDI7KTG2umWrKo/FqonM+bKndV6umc7F8IO2/9a/w+eC9jbsGPdLY
	PPwuIAbedMKyDh2ek3o7v+FiBMXLq/VldGGc5JgiznZg+kIokXK6tlTnzKCmsvyzG8KeafMOHmvdI
	JwY5qmzfgXeCnqkt8iA01A8KMe2+xiVzaYXEVFUv6qjwUnHFlIeylDL4oCJAwczMNWZMDAsc9icTr
	LRGg7fzFgdq9pqug8z5kUWnjcyz70RzdPHhc9VIk05tPiXZ6k8mTAuFRbzzX++HS0pKFsFrExMNia
	u/cbvM7I11lNmGLeILkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12tq-00000000JxC-3cFC;
	Fri, 13 Mar 2026 13:49:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12tn-00000000JwI-3Yln
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:49:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8Rw481451
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=; b=gwa5/QgNmnjGMtis
	1DLfyxp4IOGciKAHlnvjwVKArh/JmfSv2dzbFD9PsC9FOok6BxWUQQKm9nn3YqLF
	sgPI3FaOqQokp45U2VsAjcbRK5D8uIR/U6TVlzsilmdYg8iUGAIqsPO0at9ZoArs
	bFddhUpzFxBwFaDPrq2CP3ZgZBSbSyOE70pBsDW0txkXhTeFhratTt/MPA0cOLcn
	bcmUpbe/+jPeHXYhBNP42KsGooXPmEnO5XytciLNTRSebgXIE1mD5o20t1eTz4Ys
	Z5FGrCMokCA0rXX5wOEfIEhAUW852wp/oGmy0hBoZTTBDs0G2DTvKXxIJn+0drUI
	ywqqeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rya6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:49:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1205438085a.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409794; x=1774014594; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=JTY97muySXmJ6HzqK+kfsGiwEbitD6HsbUM4De3/B3v1peGF0EeMkmreGKYMNIWg6z
         o0Kt1beGwmOQoR2XXOCaYpqb84hwfRwBslzyL8iUzDq9G8gRQ9tVV9j4NmONDgeJg0t9
         IuZXfoTd3hieY8pgbbm+yRUELsB7Ueslul9TlyaWbmt+F1p1FxtDStmRUXQ4YRnWsrSu
         2fDO4yV+W4OzZTf+IcLT6gniq2ampDrecYEEDUZK1FbcLgUZI1M8j90RBB8AGULS9q6h
         TEHElzTVHze5YG3e7HXrz3ybpqRtY/tlJ5TIktFVo38ZdUjFxRFDzb9qylOBU/bgYxPy
         zaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409794; x=1774014594;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=p/jJaVAbtlW0QzUrxp3cQdSWgOoydWysacWElRPGduBKmHFBBaW/g2MDKArbkmFGSg
         BIhFJLy5a5283GUdTDJoPLcR61Ab2fy9cfRr0TXSQ/rFJjutf8/ObLdu03RkFgmPkDnR
         wWun7kYE63yz6XUNqUyyaJj5jwTIVQs6VHdu9v7CAuvLawGQCcGMrw+Gg5PBP449v3Q8
         Rfi+HavIo9vcOHardnfz1G9Me6kxivcNo4DxzpWnyG+gZr4iOXYx4ihmTS58bag4ATRN
         JuF+5hAMt+h78twdGA3agcptfbptPsDx8Bw29HEq9hIC/CotxsxMbKiOytW6ohfeXtTF
         32Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV4chm6d4X815WYZjj4ZjLvkkAzESKJgf47ZQg5bK+WwuzpsWRnuhdjj2POyQBGBngo8B/Wy8JWHEealg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo9ajEkG6wNBMnn589Rgmmo6fX6XGva0PZE6AzWw3N+MGaEwis
	cA1Y8D3/UAcIJ9U2yuLTqBJJWO5Z3kLJbDCkAGOtjbw0idjn/vqSh7I77gzHsjBgFYrgacI3tV3
	hCoaxUhiFDsUbOMj0mu1VZ6At7SsK69ZT4NFKNKqpSgWBR6APeBngy1v0JDp4ZqpHT9PV1Qg=
X-Gm-Gg: ATEYQzw2Mn5QbdH0RGbC6kS3JTQGoJr6U/F1rEloXXRBCXashbzwBOVlkuSo90Dj9L5
	92XlyLVKhtFwUSjLiz2jefVKaTScpuL5stYNzgomyQeXhyUiuCzyvAO8/wIBnir8VddkUtHCVWH
	5F/yxF6UNd54j+WG2BctjXd+hrZpkUsOKIZMdF0tF4ZVEqk+uVx/QuYejyZWkOUQ2xtB7Osbq/I
	x4TCu+zgUFr1Qoy6YNtLoQuJ9hci6wtswEh2AVBCEx94RpDhVwZC9KCw7hDANAXhE2nAcj+Bmtj
	EkSEdRGpI+kYKPlim5xMrWUbAmamBUfyKxWiYUfRK9XE5xyHaH7XRaTN/KlqXPoQ9ulxyo3xFEn
	TKP21FUW5pgSzQB5pKxSkACEafwO+tT6un0wzh85lBI0WNM/4sSm+4QEBb0Se
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310879085a.44.1773409794203;
        Fri, 13 Mar 2026 06:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310876185a.44.1773409793700;
        Fri, 13 Mar 2026 06:49:53 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm29514875e9.8.2026.03.13.06.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:49:52 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:49:51 +0100
Message-Id: <DH1PAZDT90GE.2JU59DI89M0UD@oss.qualcomm.com>
Subject: Re: [PATCH 07/27] RISC-V: KVM: Add hideleg to struct
 kvm_vcpu_config
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
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: osjWuqcz7NzSiGdXJwnh8YHhiWBOA311
X-Proofpoint-GUID: osjWuqcz7NzSiGdXJwnh8YHhiWBOA311
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMCBTYWx0ZWRfX14vVcKMunsh2
 8/MUkOrL4Cr0WZh0VqpMwaJxr+uwlkaw5xqUTu7iLtY1tSIG+3bXxDd9/SdcnZwfPFvQTcEew5n
 b1rBSbmkRXm9EGx/aYYApbbdPbiWja6ayR4MCcD6TWM2uAF240nN3SEdVUxhV3dZ66z6Jrp23ip
 y8dknLdqMAoXEASRehwxWc7Jb836QOmq9YSNrb+6OPkp2deVQ6J5yagQn6Y2sasrKEkeOvhE111
 xopPNGLffBDKPv7Mkm3MHom38PA2J2N8FZ7TWojdmqgbVn0HdLhW7KA8nas97RbwK3wL9BTcnRH
 tKg53f/WdJ9DFjnUvRCFj/ONsS1zuXN2/5dfPFhBq9JsSjeDH4KexkehTPJ5tKsWQg68IQg5ZVc
 IZE2keSXtgMc7sP3OA2wAXl7TtheXrhw9irH6kmCYt9ByWQdhs5b+l9rf2elHNPoaFxl2+1POKM
 nivrQH0x8ci76nYvVrA==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b41602 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064956_001636_BE83E5D0 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

MjAyNi0wMS0yMFQxMzoyOTo1MyswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgaGlkZWxlZyBDU1Igc3RhdGUgd2hlbiBWQ1BVIGlzIHJ1bm5pbmcg
aW4gZ3Vlc3QgVlMvVlUtbW9kZSB3aWxsCj4gYmUgZGlmZmVyZW50IGZyb20gd2hlbiBpdCBpcyBy
dW5uaW5nIGluIGd1ZXN0IEhTLW1vZGUuIFRvIGFjaGlldmUKPiB0aGlzLCBhZGQgaGlkZWxlZyB0
byBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnIGFuZCByZS1wcm9ncmFtIGhpZGVsZWcKPiBDU1IgdXBv
biBldmVyeSBrdm1fYXJjaF92Y3B1X2xvYWQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
