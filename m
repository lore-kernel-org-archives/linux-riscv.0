Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20430606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lT52gJQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ICc+l5m+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J68+rggU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Vbn9kSGCu+nvqQi4t048oj/9wF6liM6y6wjNWzApL0=; b=3lT52gJQSWnHh76GDMltDHEjcq
	qhjpQ/I6aKGQIypKFOC28YelZV07O/0wgV+3UVQPz851RvkNGR+BYEw9QiHSiFhZVqPh8+F8+XjYH
	yz9DrSVjHJUt9KwZRfSdLL8ulsfa8YZF77Mye5p5M1aum14fFslp3cPxhGiAzu9XbdqBuviZsyG1i
	FtPSLXA/0eqsXqih5bNg48CFmfwFQph3jIRpF8kH7A+O2HsmQQo4oiS8h1dgd0CYwhNdEhMJ1ETsq
	crQbWR+vma0Z435tVZNRp+g1BOy0rhZEeIlEnEW3CxFHjHhTKGCSkV8M13ImYqGofPg9jhhBjlree
	4s0JTV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Pf-0000000G03l-0BIu;
	Sun, 08 Nov 2026 10:46:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Pb-0000000G03D-3H7C
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:46:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgIrU903728
	for <linux-riscv@lists.infradead.org>; Sun, 8 Nov 2026 10:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=; b=ICc+l5m+pY5tpSrZ
	ImKh3a/FI+7u1IUTMilvwcWXcJikvmfDnarNobPEE3BQJ46JVsg10TFmSba+pQOS
	bP9Rq2nEbjyb3eZssVLssBjtNCr6yYuF/7SQZRzxBp7JcPibY4M4V0L34aLzNyZH
	EtYEkRfQZQAqkfkgOyc5Ja+Du0/zxrppAxJD0SgT7FKgEZcO03r4xedi8Elkl3Wg
	K5OMAkRVgqyRN9dki4f6wxQTKOgCNNABTi4EZDAQCR0js1QxVh/c0yg2gdd1ITEX
	pc0zAUIG76I2H6AI2G29MXhg7PgEnudVc25K9dYlrOeWazdoLkQjMBwYehTqcU61
	nXvsEg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagtu77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 10:46:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67c041acd09so577896d50.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794134770; x=1794739570; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=;
        b=J68+rggUgddLxg8ZUyXWgNuQT+xTU8xuJdThB4BHmBBRNGpz9YPrOQUlH2FHxtRzfN
         /igkInPf20ou6/WJ8xS15NHJGeCqEm3vX2sLt1OJzi4LB5eqTACEtXqpdxxt/aCthYEI
         QHwyMVaGbw+lqLC/iH5fJ29UOXDJpvXnP3AzT8WuKLZRRYqNmfkCSmGfH4FeIOpkfmZ8
         066718kqEYpQr1C4X4MreM8scXs7RiwuXhtLZ6ZUxDlvv47mzKzQlXSIOILtfntKXUJr
         PIlMuT9z+ZhhNmXfz56RWsAmflb+YeIjzZBNQ6ABVhdMh+9kLWOduVeW7hb4t1+5Qvyp
         LUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134770; x=1794739570;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=;
        b=X0kBHohqoD6awbuXuTv5P68GzDLPHUkWLLxt+3y2ixWcz5YRh/26CY8gGBU8+Bf5BE
         aRZy8Nxak2kc5fvpfxGqy2ANU7a7VjcrJ6xPe9rGf1eSnVO16k9xgM0yJ/ixbRkrn8Nv
         NDTnEUGudzY3SJMF86zFC/rlEPoIhXlCUo/dSIIJ2K3mmaxAlS90bLVNBoobbcVXycTF
         uDCxZmF4OdxzX+pQ3xqdhdds2wCpdpizEL4Fg+h+NE+H965B2MYUg7Bx79t3hWf+yt8b
         zIzIp7UWATWwWfqxKum6XPcZxIzCJNFRRoSKwRXUkkG1hpET3z+IIz94AlWSKsu7jEhJ
         RjZg==
X-Gm-Message-State: APuU4Z+JPbOiiObUroJbVa0sOV9lpPVf8/e+f1zto2q5t3HNfKej8aL+
	goPetotqo1tEqed2lH0gygysOXDPdaxzv4ClJkjQSZwPu2S03cXXorhEO+xfJ7p/XgDNvSVbsTE
	ZmfbUG5Lt+J2T7vyvpU22Z0RMxxaHJJQ66uS5XZph2moA7Tbv8qC8axdfSol1poF3DJdqqZQ=
X-Gm-Gg: AYBFou16XKY6gk/V4pMrDQ7CaBSoghJReGOV3J1DDeU+9xJIKXZAsDeA7mwLLlnjvAT
	jPWkX6YnvDJVb9NcP5/d7JoKEmWuXsEhBZq/yEwQvagX2GI0EPdu8hVuqXhS6IxbmAgOD1jGT2O
	CNsgUSQX9RSmPE4CYFffRlzqWNt2GpjClrpkAt5VbEPeNZlv/77HPVf4TfA7ML8mVMARnHWZ4Q1
	Tcl5IWGGmQfx3IWHIrpsU4DRrpQ2lcV3O5PGZLKH5hiuZqlzT3MPODKzvMrNKLcjRsDaaESMl9k
	bBQEtb++0K5K6l4ZHcneDWzq2q5wsIcXEZrhQ7QqxrP4jX32TuQigm6wzoH5bd5tsQy2+fNJ8kT
	fm4GBChMnDWrdBMcWFmpk1v9+iu4/YNVJXwcx+CfDcEGJqulBnMXxBlsH06Mx3m/x4zS4dRz+Nv
	eF8jwil0mAOQ==
X-Received: by 2002:a05:690e:134b:b0:67c:3162:810b with SMTP id 956f58d0204a3-67c3d7ccbb4mr694348d50.4.1794134769988;
        Sun, 08 Nov 2026 02:46:09 -0800 (PST)
X-Received: by 2002:a05:690e:134b:b0:67c:3162:810b with SMTP id 956f58d0204a3-67c3d7ccbb4mr694343d50.4.1794134769325;
        Sun, 08 Nov 2026 02:46:09 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb45d0asm12198977b3.9.2026.11.08.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:46:09 -0800 (PST)
Date: Sun, 08 Nov 2026 05:45:55 -0500
Message-ID: <db17b70b6b6e4da56513d8886a5ef51b.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0MiBTYWx0ZWRfXyDb0g4I5WOpH
 y7IR4yrqOp0RoCRe5HeC8786CsRFnV0Y27R+jg7LvjN7iJKTqfJyN0bavSqSSPbiOs+ApwaftIS
 AfcUCJge+2Wu7DoV7NyRhPp1fNTQpT45X7xQ+qaob0dtcIE2rHNi4LM1Lnnor3/IXYgPQVXcHqG
 L9Xnpxjn0zHUKvk+IauNLeMwX7w4Hwbg4EelL9J1BAhkLuVRJN/llh3mYZvgVNEhW3R/MgsQTCq
 yRNRnMkT7v5x/OGM+CV3PY95tagSy8a+6oQO5ZU82XVE7PD31FHBuNk5qWfQLa+n0cujVyq2y94
 LbFrj5DquXeIvyI12flFUtzOYYC0M70NOftOXWVOR6ECae91xikF4KJM/aMqxDuvSeoxviZ02W7
 V8vJPjVd5lJkZt9BR0XUW8QT4+wQZH5rfR4BDln5oCgLPIQaRbNHk8otKC2pB8pcaHBWiDk/Dpd
 4zeyBJ/QPeSqvQuIFKw==
X-Proofpoint-ORIG-GUID: BBwkiXraxkNVC4RH5LtOL1TFEp3slzco
X-Proofpoint-GUID: BBwkiXraxkNVC4RH5LtOL1TFEp3slzco
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0MiBTYWx0ZWRfX1agaPSth3u3f
 qm7adjDoDoz8xMA6Q8gA9oGfku3T7C2/zlDNNf/bzrVVhifQsFduScdsDwrkC+wSBhoeShUIBlL
 jueyqQ6gsWo5sZSNeL8MXXvOCJY6wlU=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af052f2 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dPE2jY588YNDLkUElm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_024611_941620_1328AB49 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAyNi0xMC0wNiAwOTo1MiwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+VXNlci1tb2RlIHVz
ZSBvZiBaaWNib20gYW5kIFppY2JveiByZXF1aXJlcyBzZW52Y2ZnLkNCQ0ZFIGFuZAo+c2VudmNm
Zy5DQlpFLCByZXNwZWN0aXZlbHksIHdoaWNoIHdlIHNldCBvbmx5IHdoZW4gYWxsIGhhcnRzIGhh
dmUgdGhlCj5leHRlbnNpb24uICBod3Byb2JlIHJlcG9ydHMgdGhlIGV4dGVuc2lvbnMgZnJvbSB0
aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMKPmFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGV4dGVu
c2lvbnMgdGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluCj51c2VyLW1vZGUuCj4KPlJlcG9ydCBj
b3JyZWN0IGVudmlyb25tZW50IHRvIHVzZXItbW9kZS4KPgo+Rml4ZXM6IDFiNTc3NDdlOTc4ZiAo
InJpc2N2OiBFbmFibGUgY2JvLnplcm8gb25seSB3aGVuIGFsbCBoYXJ0cyBzdXBwb3J0IFppY2Jv
eiIpCj5GaXhlczogZWIxMDAzOTcwOTQwICgiUklTQy1WOiBod3Byb2JlOiBFeHBvc2UgWmljYm9t
IGV4dGVuc2lvbiBhbmQgaXRzIGJsb2NrIHNpemUiKQo+U2lnbmVkLW9mZi1ieTogUmFkaW0gS3LE
jW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KClJldmlld2VkLWJ5OiBHdW9k
b25nIFh1IDxndW9kb25nLnh1QG9zcy5xdWFsY29tbS5jb20+CgooUmVzZW5kaW5nOiB0aGUgZmly
c3QgY29weSBvZiB0aGlzIG1haWwgYm91bmNlZCBmcm9tIHRoZSBsaXN0cyBiZWNhdXNlCm9mIGEg
Y29ycnVwdGVkIENjIGhlYWRlci4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
