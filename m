Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F60BC531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OxlrP+aU9x1IpHLhmwzWJKSumIVpFM+waBIyo49zN0=; b=u+MQgm/qY/5IY1
	gipejxi1TNAXzP55Al6Dy1fQDXqOwbCFqDMSgKACpo/G0cvM2XEhp+WE7TKC8AR+WRBxuOmPQI4Rx
	zZSNVQPhggZGxg4V782og5ZqAfWC7O1HZFLH7YPyrr+cQQ5CQAsw91Ckl3aAaDEx8WPXPqjd57Taa
	bnmQ3jTFX7lysNKjJZubLCZskDAWjeLY899V3P5Z7wfmID8uUExbOjpz4dbYU1QXB2dO+RwFFM8mC
	3rKjfoLtjEP03zajQcvp6MKJI+c/LLi40AL9kM28y7MBfUH/oUfb8JZ4i8e6k1ZoGRejC9mEKKRQ7
	+R8jRtIFTLCvVZN71psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNzV-00000003HTL-0Gjo;
	Mon, 27 Jul 2026 16:15:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNzS-00000003HQu-0W4k
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 16:15:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlmvd4035379
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 16:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	01uf0ozUmvtrTJrhTmPisVy7/+W4ZFG6gU0p14z4C18=; b=MTACrS3ZeZWTYsvb
	3XlpQTyePD9Ykl0028/CXqWWC13sHfNa2j1LthMIuyNX3J6ofxCcNH/4adbaRsud
	uWJBT887qaMVnZBVPHBiJ9EC1mZH/FGMzSVZF1jxY0bpdIBEnIznUpDPwjjc1iwo
	tRbp9jLVd24sH5KUb3xEAcxOUnhsEm0lNTKQ68+ctIkTJCLt4QXgliEwhZGQmQFJ
	FSqTJ2pF5UI+foa7nfRW1Ch+tnH3NkSbz18w1vq/EOPWvx3Y7iOTaiDP7Y3+S03u
	gZAR9H+Qtu92n20L3YowIvE29silSAcwD/m0Mkbvw/A+wjQ9EWJaBqsrekRZcA9D
	eaWEMg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g26ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 16:15:41 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a17dafd042so1969310eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 09:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785168940; cv=none;
        d=google.com; s=arc-20260327;
        b=poDFNNInpUuJmka8gsfQK9A2x2+A+ojQKNkLUG9HXV/uC5XyuGNNfeKfUGelvqoRUI
         craORb8QA3jIxPWJ3G0rk6aSiSq1d0e+jgujcTu8kSYVaZInMpWgy2arkJW+ovYc945g
         TtX8+m7U2mHFxyUV631UOm6KaauD8Q07IxzTQzpqw4Yq9QHtKeZ5YmloqQAqfNEjJAwN
         sxTmB6r4PHGe+/1QYZ3BiskxNFB+rqHDpIk+X63mH/SDEOQWzyp3T9DzDR9kcOW98Oeo
         4HKK9TZUPXX6Paj7T0XddQzAa8143DS2GVV8JhxyyVH50YAZXZO8c1ai7UCZaBkzQYt4
         7NSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=01uf0ozUmvtrTJrhTmPisVy7/+W4ZFG6gU0p14z4C18=;
        fh=CdUMaEJu13I/KoDFc9XjfiChftCRG3UAgwdnp9tfHMU=;
        b=k4yossIS+2RoPSCXCLpDz2GCALxtO9CNToUbwJK3p7lT33ccuxwrpWWqS3lLnGAXza
         Mu44uljNz7hBstrDOOTpPHwCdo0ZJ9Eje5pFd3oMaT6M5QEiwyzToF54rZ1r946y+ngH
         jnvFBn1O47pr5WxFKD/UkTGa5lgtJekrvussz3pMbrm7XQWBHN21M/AtM/t1VQ18LMTr
         sfN/dfm8kLP+Dm1TopbkXsXrBgTgC2gFZBmYqCEyqRqBJSXWRFzGIHAxWGa33OGFg4UD
         hzwML/FEWLXdnw3nYHFFcEJihtMgGZDSVudn0bffa7evKROOYtJ7mpK/fNpumRsG5jzN
         DwiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785168940; x=1785773740; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=01uf0ozUmvtrTJrhTmPisVy7/+W4ZFG6gU0p14z4C18=;
        b=AglGiEu42l0UzydTsmHKNcCpNsUlzVUPIYOMUyGN1TuRhoE5gEeNkpPOEllb8qUsGe
         wJwzAnC+GkHOtJcHFedmkQgmAFqLGcTWCdFN7PUees9Fu83zM7ggJN+IiZTGkU077TIL
         Xpwd5eU1sx9kOa7NNcmUTY3hvoCUdjbz7RElvTkCwzUMzb4arjoU2kPGMj+OylUQe5o4
         KslUaHvYGR94E76VlZ+Wc3Inc4KquUaTuHBaZsvGv0AqBLERLufNu8Z3dybwZZuSumVo
         ASuh2/j3OcSnJOa5EKcm5nFRwLz/2g6tz89ImnsZ49JhBSLKL5lLXUU/3xLJLEpd48V5
         VUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785168940; x=1785773740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01uf0ozUmvtrTJrhTmPisVy7/+W4ZFG6gU0p14z4C18=;
        b=b0Kbk6XlYjwTkj0XIP1M6sTgxwCFjtOBrTm/0fzWCdRB3KX68mCYQq+ScMjKp9WkTE
         pKOMMyncj5wiFTrSSP34bIv2cIKB2BVZfrjC2e4TjHO4mTkA07U0qp6V+VGwvo3tS3AB
         Bw0krL8rqNCkUOQdCfbv63wOrJElYOFifE4TpsctNGJgx5A8Y7abGJo1+59YJrH7taNP
         7zxgBRqY9fbWIe8y0ktjicOlqTeeBKrDa2j4kBaa5rONHpFfX47hqgENsR4jmxXXWFZ+
         UWOOPVkePvSBWlGnYU9v86NgYJbFy38uOtnFHO8eUgRPOcDLwf4Pb8T1K2+Dsa8zprKc
         NWHw==
X-Gm-Message-State: AOJu0YwcrliabmMUetg2Y8WfKbe6fBpyepgzm+yRTbiOwBBpNmw9K5q0
	ajLGtY01IUVsDwZfUJusCi9naiMJosZxSrkPpz6ZgckXmh79c6YpK90snET26Bk2ZMVqQYnz0mN
	hltALepEUEWUzMI7EhhjuVroI2zxDkRqNCewdUn8LGyT7RqjvBxpBxSk2lhcpQRuigECok+teV2
	PMoj/ejESCJT2Y4j06PTnokuEKk/CEJuC4+Bc5ElbK6GYxuA==
X-Gm-Gg: AR+sD10moOD76qoJpNXhNnpx829SdJDwfpvukGI1/ib14BxPNRUdUBZ/0QdXuUpDEUn
	iVJhcEfNCnMNTZcRXPbU0bf8rqNWxLGh3QmtIjPphFTVkXgd1IQZLsBBQmo5Jhva0gXE/Ryp57n
	mZAS8110lH0nk75Ouj9Q126DMDEzL4dlA1Vn6/6Yq1aOgsqtc96Gc3bjPWAg==
X-Received: by 2002:a05:6820:2903:b0:69e:98c0:4bd6 with SMTP id 006d021491bc7-6ac90c4ee52mr205472eaf.1.1785168940359;
        Mon, 27 Jul 2026 09:15:40 -0700 (PDT)
X-Received: by 2002:a05:6820:2903:b0:69e:98c0:4bd6 with SMTP id
 006d021491bc7-6ac90c4ee52mr205435eaf.1.1785168939870; Mon, 27 Jul 2026
 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
 <CADRr4bcoS6pFw8VQcNORJuOzOnD-MY4ggauzoiO6FqJ410f5ag@mail.gmail.com>
 <CA+Ht8=aGnAioD0_jCkoJ4eoS4G0tbKiJ9dA-wJ--N1L9kxRRXg@mail.gmail.com> <CADRr4beVYKC64HEXGgSy=A-5cjfpDE+J14RHUYofQdMNE2MCkA@mail.gmail.com>
In-Reply-To: <CADRr4beVYKC64HEXGgSy=A-5cjfpDE+J14RHUYofQdMNE2MCkA@mail.gmail.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:45:28 +0530
X-Gm-Features: AUfX_mxfopP7mOjJamIgWKFqwNWiNWjTAEZwOgeTiMlGcry6DTh9PxxUgastYPg
Message-ID: <CA+Ht8=ZduxHX8C-MJ-OxQYZrDuxV=y5RX-suXnWj75k-h=x5aw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] riscv: Introduce support for hardware break/watchpoints
To: Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, qingfang.deng@linux.dev, alex@ghiti.fr,
        aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org,
        shuah@kernel.org, linux-kernel@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a67842d cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=h0uksLzaAAAA:8
 a=V1jnuoLLAAAA:20 a=JfrnYn6hAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=roF0PJykcigPeCAS5WcA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=MSi_79tMYmZZG2gvAgS0:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfXz0KGv5F0rOu/
 pOVvSZyVIWMo3hZ5pj5p8tKEUYLiPgOGGikrGLRdeZNXkwIwOq6Tmr9Cq81tKYD7ScwoaYI13Rf
 4B1kM7PqqRbK1XQZNwmHfc957Fprfuo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfXyAIsXqIV7Bml
 m593OSDzf821siYrX7UcKeUfN9KnymuE10Cze93/+M0kdyff0iDeRp5HnagzuWbd7wPCAGr1vLn
 QR9gYPyxEFy982NrT51IwHIZKMCFVL7taIsVNYZR57DYAPdYPvsqiqLa4j4HeGTiXDydpcKMMuy
 TfayCuefis1dPSsDhQ8aI3tCtqy4oiBR/AsJkEorKetxXkFZBXNIdNHD9pTnGLkw4SXkAL9NkfI
 U+Uwm7geEgd6S6o/rUFzS4k2VFKcAG8NZsw8XKiOEBDSynBnzQ3f9qb9fOC/OBgmDe41odgtieO
 jgi72AQaTLofl2TjqhsfoYZvGRfT6Q/rWgjCXdDpx1Ev3i4P53juIpmF18Csia2Z6dGeok7CXJL
 2gnJhZg7Qe9oe8K2utZ+orOhgSdiWx4RcFelkmv9Xj5uP51dC7KYSLhTxEApYJGelZmM48g9CEg
 BICcrm5nUub4rOIH3Gw==
X-Proofpoint-GUID: rr087j0sKMTfDI_YdEHBFrFldGY_MHh4
X-Proofpoint-ORIG-GUID: rr087j0sKMTfDI_YdEHBFrFldGY_MHh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_091542_285985_4F77099E 
X-CRM114-Status: GOOD (  52.93  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgODo1MeKAr1BNIEplc3NlIFRhdWJlIDxqdGF1YmVwZUBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDI3LCAyMDI2IGF0IDEyOjIw4oCvQU0g
SGltYW5zaHUgQ2hhdWhhbgo+IDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+ID4KPiA+IEhpIEplc3NlLAo+ID4KPiA+IE9uIEZyaSwgSnVsIDI0LCAyMDI2IGF0IDc6
MjDigK9QTSBKZXNzZSBUYXViZSA8anRhdWJlcGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFRodSwgSnVsIDIzLCAyMDI2IGF0IDQ6NDnigK9BTSBIaW1hbnNodSBDaGF1aGFuCj4g
PiA+IDxoaW1hbnNodS5jaGF1aGFuQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgb2YgaGFyZHdhcmUgYnJlYWtwb2ludHMg
YW5kIHdhdGNocG9pbnRzIGluIFJJU0MtVgo+ID4gPiA+IGFyY2hpdGVjdHVyZS4gVGhlIGZyYW1l
d29yayBpcyBidWlsdCBvbiB0b3Agb2YgcGVyZiBzdWJzeXN0ZW0gYW5kIFNCSSBkZWJ1Zwo+ID4g
PiA+IHRyaWdnZXIgZXh0ZW5zaW9uLgo+ID4gPgo+ID4gPiBIZWxsbywgaXRzIG5pY2UgdG8gc2Vl
IHlvdSB3b3JraW5nIG9uIHRoaXMgcHJvamVjdCBhZ2FpbiwKPiA+ID4gY2FuIHlvdSBrZWVwIG1l
IGFuZCBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4gaW4gY2Mg
cGxlYXNlCj4gPgo+ID4gV2lsbCBkbyEKPiA+Cj4gPiA+IFRoaXMgc2V0IGRvZXNudCBzZWVtIHRv
IGJlIGEgY29udGludWF0aW9uIG9uIG15IHNldCwgYnV0IGRvZXMgaXQgcGFzcyB0aGUgdGVzdHMK
PiA+ID4gaSB3cm90ZSB0aGVyZT8KPiA+Cj4gPiBZb3Ugd2VyZSBidWlsZGluZyBvbiB0b3Agb2Yg
bXkgKHRoZXNlKSBwYXRjaGVzLiBJIGRvbid0IHdhbnQgdG8gcHVzaAo+ID4gZXZlcnl0aGluZyBh
dCBvbmNlLiBJIGxpa2UgaW5jcmVtZW50YWwgd29yayB3aGljaCBpcyBpbmRlcGVuZGVudCBhbmQK
PiA+IGVhc2llciB0byByZXZpZXcuCj4KPiBBaCBmYWlyIGVub3VnaC4gSSB3YXMgbW9yZSBzbyB3
b25kZXJpbmcgd2h5IHRoZSBmaXhlcyBmcm9tIG15IHZlcnNpb24gb2YgcGF0Y2ggMAo+IHdlcmVu
J3QgcHVsbGVkLiBRdWl0ZSBhIGZldyBvZiB0aGUgaXNzdWVzIHBlb3BsZSBicm91Z2h0IHVwIGlu
IHRoZQo+IHJldmlld3Mgd2VyZSBmaXhlZCwgdGhhdCdzIGFsbC4KPgo+ID4gV2hpbGUgSSBoYXZl
IHBlcmYsIHNpbmdsZSBzdGVwcGluZywgYW5kIHZpcnR1YWxpemVkIGJyZWFrcG9pbnQgcGF0Y2hl
cwo+Cj4gUGF0Y2ggMSB5b3Ugc2VudCBpcyBhIHBlcmYgdGVzdCwgbm90IGEgcHRyYWNlIHRlc3Qu
IERvIHlvdSBoYXZlIGEgcGVyZiB0ZXN0PwoKVHlwby4gSSBtZWFudCBwdHJhY2UuCgo+Cj4gPiBy
ZWFkeSBhbmQgaW4gbGluZSwgSSBhbSBwbGFubmluZyB0byBwdXNoIHRoZXNlIGZpcnN0LiBJIHdp
bGwgbWFrZSBhbGwKPiA+IHRoZSBwYXRjaGVzIHNlZSB0aGUgbGlnaHQgb2YgdGhlIGRheS4KPgo+
IFRoZSByZWFzb24gSSBicmluZyB0aGlzIHVwIGlzIGJlY2F1c2Ugd2hlbiBJIGJ1aWx0IHVwb24g
dGhlc2UgcGF0Y2hlcywKPiBJIGZvdW5kIHRoYXQgdXNpbmcgdGhlCj4gcGVyZiBzdWJzeXN0ZW0g
ZG9lcyB3b3JrIHdpdGggeW91ciBjb2RlLCBidXQgdGhlIHB0cmFjZSBzdWJzeXN0ZW0gZG9lcyBu
b3QuCj4gVGhpcyBpcyB3aHkgbXkgcGF0Y2hlcyBoYWQgdGhlIHNpbmdsZSBzdGVwcGluZyBhbmQg
Y2FsbGJhY2sgY29kZS4gSSdtCj4gbm90IHRvbyBrZWVuIG9uIG1lcmdpbmcKPiBjb2RlIHRoYXQg
d2lsbCBqdXN0IGVuZCB1cCBuZWVkaW5nIHRvIGJlIHNpZ25pZmljYW50bHkgY2hhbmdlZCBpbgo+
IGZvbGxvd3VwIHBhdGNoZXMuCj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUgb3RoZXIgdGVz
dHMgeW91IGhhdmU/IEl0IGRvZXNuJ3QgbmVlZCB0byBiZQo+IHBhdGNoZXMgc2VudCB0byB0aGUg
bWFpbGluZyBsaXN0LAo+IGp1c3Qgc28gdGhhdCBJIGNhbiB0ZXN0IHRoaXMgc2V0Lgo+Cj4gQWxz
byBpdCBtaWdodCBiZSB3b3J0aCBjaGVja2luZyB0aGUgb3BlbnNiaSB2ZXJzaW9uIGFzIHRoaXMg
Y29tbWl0Cj4gZml4ZXMgYSBtYWpvciBidWcgd2hpY2ggd2lsbAo+IGNhdXNlIHRoaXMgc2V0IHRv
IG5vdCB3b3JrLiB0aGVyZSBhcmUgYWxzbyBhIGZldyBtb3JlIGJlZm9yZSB0aGlzCj4gY29tbWl0
LCBidXQgdGhpcyBpcyB0aGUgbGFzdCBmaXguCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNv
ZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC82YTFmNTNiYzJkOTEzMTBhZGM0NGMxNTg1OTZkZDFj
M2VmYTE4MDgwCj4KPiBUaGFua3MsCj4gSmVzc2UgVGF1YmUKPgo+Cj4gPiBZb3UgYXJlIHdlbGNv
bWUgdG8gcmV2aWV3IQo+ID4KPiA+ID4gT24gcGF0Y2ggOCBpIHdyb3RlIHRoZSBjb21tZW50Cj4g
PiA+ICJUaGUgc2VsZnRlc3QgZmFpbHMgYXMgcmVnaXN0ZXJfdXNlcl9od19icmVha3BvaW50IHNl
ZW1pbmdseSBkb2VzIG5vdAo+ID4gPiBjYWxsIGFyY2hfaW5zdGFsbF9od19icmVha3BvaW50LiBU
aGUgdGVzdCBhbHNvIHNlZW1zIHRvIGZhaWwgb24gYXJtNjQKPiA+ID4gaW4gdGhlIHNhbWUgd2F5
IHdoZW4gSSB0ZXN0ZWQgaXQuIgo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA4MjIxNzQ3MTUuMTI2OTEzOC05LWplc3NlQHJpdm9zaW5jLmNvbS8KPiA+ID4gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xpc3QvP3Nlcmllcz05OTQ3
NTAmc3RhdGU9Kgo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IEplc3NlIFRhdWJlCj4gPiA+Cj4g
PiA+ID4KPiA+ID4gPiBDdXJyZW50bHkgZm9sbG93aW5nIGZlYXR1cmVzIGFyZSBub3Qgc3VwcG9y
dGVkIGFuZCBhcmUgaW4gd29ya3M6Cj4gPiA+ID4gIC0gUHRyYWNlIHN1cHBvcnQKPiA+ID4gPiAg
LSBTaW5nbGUgc3RlcHBpbmcKPiA+ID4gPiAgLSBWaXJ0dWFsaXphdGlvbiBvZiBkZWJ1ZyB0cmln
Z2Vycwo+ID4gPiA+Cj4gPiA+ID4gVGhlIFNCSSBkZWJ1ZyB0cmlnZ2VyIGV4dGVuc2lvbiBwcm9w
b3NhbCBjYW4gYmUgZm91bmQgaW4gQ2hhcHRlci0xOSBvZiBTQkkgc3BlY2lmaWNhdGlvbjoKPiA+
ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVh
c2VzL2Rvd25sb2FkL3YzLjAvcmlzY3Ytc2JpLnBkZgo+ID4gPiA+Cj4gPiA+ID4gVGhlIFNkdHJp
ZyBJU0EgaXMgcGFydCBvZiBSSVNDLVYgZGVidWcgc3BlY2lmaWNhdGlvbiB3aGljaCBjYW4gYmUg
Zm91bmQgYXQ6Cj4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWRlYnVnLXNw
ZWMKPiA+ID4gPgo+ID4gPiA+IENoYW5nZXMgZnJvbSB2NDoKPiA+ID4gPiAgICAgICAgIC0gUmVi
YXNlZCB0byB2Ny4yLXJjNAo+ID4gPiA+ICAgICAgICAgLSBGaXhlZCBydjMyIGJ1aWxkIGVycm9y
Cj4gPiA+ID4gICAgICAgICAtIEFkZGVkIHByX2ZtdCB0byBwcmludCBLQlVJTERfTU9ETkFNRQo+
ID4gPiA+ICAgICAgICAgLSBDaGFuZ2VkIHR5cGUgb2Ygc2htZW1fcGEgdG8gcGh5c19hZGRyX3QK
PiA+ID4gPiAgICAgICAgIC0gVXNlIHBlcl9jcHVfcHRyX3RvX3BoeXMgaW5zdGVhZCBvZiBfX3Bh
IHBlci1jcHUgYWxsb2NhdGVkIG1lbQo+ID4gPiA+ICAgICAgICAgLSBQcmludCBzdWNjZXNzZnVs
IHJlZ2lzdHJhdGlvbi91bnJlZ2lzdHJhdGlvbiBtZXNzYWdlIHdoZW4gbm8gZXJyb3IKPiA+ID4g
PiAgICAgICAgIC0gQWRkZWQgUklTQy1WIERFQlVHR0lORyBzZWN0aW9uIGluIE1BSU5UQUlORVIg
ZmlsZSBhbmQgYWRkZWQgbXlzZWxmIGFzIG1haW50YWluZXIKPiA+ID4gPiAgICAgICAgIC0gRml4
ZWQgY3Jhd2xlZCBpbiB3YXJuaW5ncyBmcm9tIGNoZWNrcGF0Y2gucGwgLS1zdHJpY3QgcnVuCj4g
PiA+ID4KPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjM6Cj4gPiA+ID4gICAgICAgICAtIFJlYmFzZWQg
dG8gdjcuMS1yYzMuCj4gPiA+ID4gICAgICAgICAtIEZvciB3YXRjaHBvaW50cywgY2hlY2sgdGRh
dGExLmhpdCB2aWEgU0JJX0VYVF9EQlRSX1RSSUdfUkVBRCBhbmQKPiA+ID4gPiAgICAgICAgICAg
a2VlcCBTVFZBTC1iYXNlZCBtYXRjaGluZyBhcyBmYWxsYmFjay4KPiA+ID4gPiAgICAgICAgIC0g
SW1wcm92ZWQgd2F0Y2hwb2ludCBtYXRjaGluZyB3aGVuIFNUVkFMIHJlcG9ydHMgdGhlIGxvd2Vz
dCBhY2Nlc3NlZAo+ID4gPiA+ICAgICAgICAgICBhZGRyZXNzIGZvciB3aWRlciBtZW1vcnkgYWNj
ZXNzZXMuCj4gPiA+ID4gICAgICAgICAtIFByb2dyYW0gZXhlY3V0ZSBicmVha3BvaW50cyB3aXRo
IFNJWkU9MCAobWF0Y2ggYW55IHNpemUpIHRvIGF2b2lkCj4gPiA+ID4gICAgICAgICAgIG1pc3Nl
cyB3aXRoIDE2LWJpdC9jb21wcmVzc2VkIGluc3RydWN0aW9uIGFkZHJlc3Nlcy4KPiA+ID4gPiAg
ICAgICAgIC0gVXBkYXRlZCBSSVNDViBzZWxmdGVzdCB0byBhdm9pZCBkZWFkbG9jayBieSByZXBs
YWNpbmcgdW5ib3VuZGVkCj4gPiA+ID4gICAgICAgICAgIHNlbV93YWl0KCkgd2l0aCBzZW1fdGlt
ZWR3YWl0KCkgdGltZW91dCBoYW5kbGluZy4KPiA+ID4gPiAgICAgICAgIC0gVXBkYXRlZCBSSVND
ViBzZWxmdGVzdCBicmVha3BvaW50IGZ1bmN0aW9uIHNvIGl0IGNhbm5vdCBiZSBpbmxpbmVkCj4g
PiA+ID4gICAgICAgICAgIG9yIG9wdGltaXplZCBhd2F5Lgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbmdl
cyBmcm9tIHYyOgo+ID4gPiA+ICAgICAgICAgLSBSZWJhc2VkIHRvIHY3LjAtcmMxCj4gPiA+ID4g
ICAgICAgICAtIEZpeGVkIHRoZSB3YXJuaW5ncyBmcm9tIGBjaGVja3BhdGNoLnBsIC0tc3RyaWN0
YCBydW4uCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VzIGZyb20gdjE6Cj4gPiA+ID4gICAgICAgICAt
IFRoZSBwYXRjaCB0aGF0IGFkZHMgdGhlIGV4dGVuc2lvbiBhbmQgdGhlIGZ1bmN0aW9uIElEcyBk
ZWZpbmVkIGJ5IHRoZSBleHRlbnNpb24gaXMKPiA+ID4gPiAgICAgICAgICAgYWxyZWFkeSBtZXJn
ZWQuIFNvIHRoaXMgcGF0Y2ggYnVpbGRzIG9uIHRvcCBvZiB0aGF0Lgo+ID4gPiA+ICAgICAgICAg
LSBBZGRlZCBicmVha3BvaW50IHRlc3QgYXBwbGljYXRpb24gaW4gc2VsZiB0ZXN0cyB0byB0ZXN0
IGRlYnVnIHRyaWdnZXJzCj4gPiA+ID4KPiA+ID4gPiBIb3cgdG8gdXNlOgo+ID4gPiA+IH5+fn5+
fn5+fn5+Cj4gPiA+ID4gT3BlblNCSToKPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
c29mdHdhcmUtc3JjL29wZW5zYmkuZ2l0Cj4gPiA+ID4KPiA+ID4gPiBRZW11Ogo+ID4gPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9xZW11L3FlbXUuZ2l0Cj4gPiA+ID4KPiA+ID4gPiBMaW51eCBLZXJu
ZWw6Cj4gPiA+ID4gWW91IGNhbiBwdWxsIHY3LjItcmM0IHRhZyBmcm9tIExpbnVzJyBUcmVlIGFu
ZCBhcHBseSB0aGVzZSBwYXRjaGVzLgo+ID4gPiA+Cj4gPiA+ID4gSG93IHRvIHRlc3Q6Cj4gPiA+
ID4gfn5+fn5+fn5+fn4KPiA+ID4gPiBGcm9tIHRoZSBMaW51eCBrZXJuZWwgZGlyZWN0b3J5IGlz
c3VlIHRoZSBmb2xsb3dpbmcgY29tbWFuZDoKPiA+ID4gPiBtYWtlIC1DIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JyZWFrcG9pbnRzLwo+ID4gPiA+Cj4gPiA+ID4gVGhpcyB3aWxsIG1ha2UgYSBi
aW5hcnkgbmFtZWQgYnJlYWtwb2ludF90ZXN0X3Jpc2N2IHVuZGVyIHRoZSBzYW1lIGRpcmVjdG9y
eS4KPiA+ID4gPiBMb2FkIGl0IG9uIHRoZSBtYWNoaW5lIGFuZCBydW4uIFNhbXBsZSBvdXRwdXQg
aXMgZ2l2ZW4gYmVsb3c6Cj4gPiA+ID4KPiA+ID4gPiAvICMgL2FwcHMvYnJlYWtwb2ludF90ZXN0
X3Jpc2N2Cj4gPiA+ID4gQnJlYWtwb2ludCB0cmlnZ2VyZWQhCj4gPiA+ID4gQnJlYWtwb2ludCB0
ZXN0IHBhc3NlZCEKPiA+ID4gPiBXYXRjaHBvaW50IHRyaWdnZXJlZCEKPiA+ID4gPiBXYXRjaHBv
aW50IHRlc3QgcGFzc2VkIQo+ID4gPiA+Cj4gPiA+ID4gSGltYW5zaHUgQ2hhdWhhbiAoMyk6Cj4g
PiA+ID4gICByaXNjdjogSW50cm9kdWNlIHN1cHBvcnQgZm9yIGhhcmR3YXJlIGJyZWFrL3dhdGNo
cG9pbnRzCj4gPiA+ID4gICByaXNjdjogQWRkIGJyZWFrcG9pbnQgYW5kIHdhdGNocG9pbnQgdGVz
dCBmb3IgcmlzY3YKPiA+ID4gPiAgIE1BSU5UQUlORVJTOiBBZGQgZW50cnkgZm9yIFJJU0MtViBE
ZWJ1Z2dpbmcKPiA+ID4gPgo+ID4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDkgKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3X2JyZWFrcG9pbnQuaCAgICAgICAgfCAzMzcgKysrKysrKysKPiA+ID4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rZGVidWcuaCAgICAgICAgICAgICAgIHwgICAzICstCj4gPiA+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
PiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYyAgICAgICAgICAgICB8IDcz
OCArKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPiA+ID4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvYnJlYWtwb2ludHMvTWFrZWZpbGUgIHwgICA1ICsKPiA+ID4gPiAgLi4uL2JyZWFrcG9pbnRz
L2JyZWFrcG9pbnRfdGVzdF9yaXNjdi5jICAgICAgIHwgMjE0ICsrKysrCj4gPiA+ID4gIDkgZmls
ZXMgY2hhbmdlZCwgMTMxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3X2JyZWFrcG9pbnQuaAo+
ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2lu
dC5jCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cmVha3BvaW50cy9icmVha3BvaW50X3Rlc3RfcmlzY3YuYwo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+
ID4gPiAyLjQzLjAKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiA+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4gPiA+
Cj4gPiA+Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
