Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF9606A31D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mYq+hu/8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XCdQFuvA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7YPNpis
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QHst3rhFnGyYCIe79ZHydQCYjzqbSBKYQ5Q4h6PCNao=; b=mYq+hu/8Sn3xu8YjhrEYwOBC/E
	LTkeKTY0XRIvhCTU9Ghp73gWW7VznuT0pWhhZO7Lcjmz2VXvdEj5PaGMpJ/Fp112lXG7hMJQW8aZa
	r5PSnQ3OKo/r3aIp6zmAw4ndCeS2wON036Y6Z7KbbyzL1dCg3NuXVSttDO+GQW3uvKddC98tawZEo
	j1U12HA8QfOMGRwt1TAOkkpHvCJPcHXGvhqYK9uMh+BUPt1G122Dz47+FzAzgCvrK/9Q4+kdWDJV4
	+FU6prShi7HJPBvNcMIX0oAz6Nsf/2CqKO3l8WfKumKXw6uloXUE5xco5sPL9TucSV2ntjKaMADNc
	0oULz+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPDx-000000098pb-0lU6;
	Thu, 29 Oct 2026 12:27:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPDt-000000098pD-2k0I
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 12:27:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vACq119922
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 12:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=; b=XCdQFuvASFXh+8rQ
	oOalrMlz6pRA93tAckZW4YxX9TE6+WhfnTsmQ7EVc/lNrFsUbVlzKYCOCG3aAqhB
	qezpYjrJVS2Gkz/FR+4oKosvN1aBSmSM0ya2xQQz42S/WhegH/uB2RqEUn4rdgN8
	LqgLa2Xz/s1geaIJTxulPAhnIgSZMr5nD1mACiX6FFiRjrSp8Xs+cG3BWmevAjWl
	c4u3+fjmo/R2Cff5S+hBzl7UU4VXbQfIwVp05CPMlGqP9d6nQExtlpvDjyAvwAPX
	uEIPHQfXvUArIqZ2OqUknqtqHTlHARY1VkDVbjQxbWJyKHCUNlSdtHRDsAsXHeoY
	6knizw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmpakc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 12:27:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so8279674eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 05:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276831; cv=none;
        d=google.com; s=arc-20260327;
        b=M2YuDLGfFohMHnuH8f/mPweX0J1x68yzFQFyS4Lj2r0nvKnc59gyEnHnbmd4Q2ReNM
         lGKLlh22V3TS5zzpueNfpi/yphKgZyCPggOhCJM29nz9IRa8X9+NJ6ifpvwRaGCRUzP8
         sX8q/9mCLV8mKYcRxfjSZSwI+lM0aNkbsLz92saA+s1hEnyk3nVRAB4Ej0pSE5SUNzfn
         /OGkldjcXp9M2Ri0R3tbhNHtjqflk+DQvJiQ6e5xqSGL0yOQeJuuTqei6xLj41VCnQFL
         2R6xTsJ72zB/GQ9tFdfTujbcVqv4B8pn8dlvryGbP4594rXOy5K3mHxxGI+ZfuM56Ent
         KW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        fh=ls1tjx2eThazAtVY8HFSJWfHKf1RiSZdhoDR2p3VZLI=;
        b=mdWxlR0z5wzO1NzJQWDvcsMMCEMzGDCFAdybdLxWZJQW5mxy3O8mvFybfiBNPEDBpu
         NBO3eTCWKRmFjANSk2Vz8DvZl4HrMgtn8CsPhJLRDFQfaJ83DeUSYbCdy93omT4GJViS
         1As87MpQZN3tXFRRFhcrOJ13w8L0bSExa7PEV9TH6vsf1z3Ks9q3hPnx9EuFtbNpIsA/
         u5iSxplxgdDtgLAlFWymqUI2x5TI6WciJV1t1tHfivksqwHW7PDwg6GIN0Ar7FrClFRV
         aZlHMzXubWIvTJKD0cWa/bPeBx9qvjUdK2Vxv78cJ26OD1RTf8g53SBmD2Gp0XvFchss
         PRFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793276831; x=1793881631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=Q7YPNpisyHzU7NW+YcNKFJRHCg1zsekbuetxBC7ASiOPvtqVPURsLMytvT9XaDiTG5
         8DbFtca9Biac7JcMI9zZ408NJEkLVfmUKhmcTkPxjHTV6aqv22OQlzeBF5qXQr7ALr4q
         HTPk4mGnyfKXGYHZd5c6Ms+5VHpbBxMPMYWqDaWAHLzqpR3xuYoXaAPXvJvkJBQqytCd
         t796mmcXjLY8j6rfsuhNfZYin6LGu/SLThJEL31I0cOb27aoIPgqiJhKUb6pvrhzc+pb
         bytMxg9ghq9m6tq3ochefwEdm7qnSFsXOThVTKlAnlke18G1DotmEEglj5yQTDd9GUq2
         2q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276831; x=1793881631;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fC8hi/16c2Tuk4TI6xeTYKFbOzyPbvhJgiM6+5Rs4s=;
        b=2t1YdjjrB9n7mSe6OKdcDov5nhU/KjYUIy+VkcUkDKtd7XXuxSBXzSK4N0a1k5lbsD
         xtyaLGlCkeNKliu2E6wFE11/Q6PEUAj/FtecTFIGpr34pqJ3sfgskGQs2Axu1LVrx99v
         kjg0IDiMjkSonBxIjPMI0hLqz1wNJj0grQ9h/YSrPCJ/QxDPQYcwG7voFRD48RHQOjOy
         5j98X4jao18JEeK1jzuuTkSnlSjhC+I9iteE8C3nJyBRX897E7eo9G5AbXkasHjBF3E+
         PWKb+NY1LelMpswpGmk39hLb13j1cI2Pl6z5U5+qzyj677xwENS5oD7AxWeTR691BHoN
         R5/A==
X-Forwarded-Encrypted: i=1; AKwUvBy6qEdkBugomPwXHNIlo/gm2xmf4rZ+s71HqP3HRgwTkja/WJvDRbyaUoisHWk7yRrxz24OvQP44Anw/w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJR2cYQjDcMWoZ9w82CVVybnWhPkRo4a7pN+An7h5l+rhWnc6C8
	2B+zsgS7DCIB9YUdhSOsvKxuEfoMaDXr1QpAECfJm9SniHIKlc0YDTfOsBrm6mhOcyZUM+BWCoW
	oxk42rM5IxSFypyWS2uMVTqpHd0tQgvmVMAYRyCJYfO9BU1/SAziG5OnFMeDYPXkrJUsPsUMeUW
	npf89iqJ0/FCkqgTnjfs2iCK+CoWtPEpP9aHc6KmLjC+y8+w==
X-Gm-Gg: AYBFou3IN8U1sTHLCUDS2PogulkYvknBsFWegwZBjPNhmmJZu91MpOWsiksD7tjOLhw
	qHOysKltojZhv0/AxnihRnoXfgiinF+qpYMawNPZKQMSpAWJXSBs47NxV9W/9CSqAs0ZHakQjsA
	Z9rnW4K7Iv2PmbQ8ZFkEo/kg2iP6A5g1OMUgXqeaJhVTSc4bT2X43Kjqpo+g==
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-36a202bdba8mr7838946eec.4.1793276830561;
        Thu, 29 Oct 2026 05:27:10 -0700 (PDT)
X-Received: by 2002:a05:7301:df49:b0:36a:1e0c:e28d with SMTP id
 5a478bee46e88-36a202bdba8mr7838905eec.4.1793276829977; Thu, 29 Oct 2026
 05:27:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
In-Reply-To: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:56:55 +0530
X-Gm-Features: AclHuK_K8FAHAaVvZrkLzUN4-2TI6UfFRWFLq4Lv-UCwiDI74MI7EZMWtDjZvCE
Message-ID: <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Himanshu Chauhan <hchauhan@ventanamicro.com>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX/DmfhVeibv1x
 LTia88h/MZvsXI6L8j/dZBu6NE/PxcUDDxM+ikCxcebp1/GI65NqLjKFHZGo6PnqLaij28CcFXB
 sIHj8dQZ0DjeJqo+sWxcNvyqZ1a0VlcB62+fkZfqwtbxuWM0QrKq3nqRCYj6nPgVU5xU3JytxOu
 NzonvANIwNtT6LI+1EdM7oyDbHJN33HH/u/8g2cRCDm+K38EThj29IAK6i3NY368SRDf4+kPr/d
 sMgGq3QGp3wB+YYeS4UCp8xpEaS2uyB3s0wjtvMobyap/ypEsOhIQHXxEV2V3hcW6ughmiFrRLE
 XhE92ke8UsDp5SB4wAYWfkB6reEIylCJhhhmJRwl5lS2NE/XMXrWLpqrIOEm70Fh+tDeqJlco4I
 5lmRTho41Q9AR1kPlajtb7gEv96e6Vc0rh5cqV9Dl0rNX4H9T/TpHPv+7zjYVNuu0E7svjhQRLX
 KLyp3erMaJ95Oo5HBsA==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae33b9f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=B1sphXeUGUYvUChdj8sA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfXy1VXihUkdSY6
 vM3cvnSiChcTiq/IbEOnsD766li09lvRQjUTZ4x/8Fb6z30UlQInHngpqwd+c95iNKMzxiph6Dh
 IAV7HVhFZDdjPJrjRgaLCCg4ebzEIIY=
X-Proofpoint-GUID: EJAS7-V1DFErOssBp4YSsiH62jtQ-C4W
X-Proofpoint-ORIG-GUID: EJAS7-V1DFErOssBp4YSsiH62jtQ-C4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_052714_133265_470C0F4B 
X-CRM114-Status: GOOD (  23.06  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSmFzc2ksCgpPbiBNb24sIE9jdCAxMiwgMjAyNiBhdCA1OjUy4oCvQU0gSmFzc2kgQnJhciA8
amFzc2lzaW5naGJyYXJAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDMwLCAyMDI2
IGF0IDEwOjA24oCvQU0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPiB3
cm90ZToKPiA+Cj4gPiBGcm9tOiBBbWlycmV6YSBaYXJyYWJpIDxhbWlycmV6YS56YXJyYWJpQG9z
cy5xdWFsY29tbS5jb20+Cj4gPgo+ID4gU29tZSBtYWlsYm94IGNvbnRyb2xsZXJzIGNhbiBjb21w
bGV0ZSBhIHRyYW5zYWN0aW9uIGVudGlyZWx5IHdpdGhpbgo+ID4gdGhlIGNhbGxpbmcgY29udGV4
dCwgd2l0aG91dCBnb2luZyB0aHJvdWdoIHRoZSBxdWV1ZWQgVFggc3RhdGUKPiA+IG1hY2hpbmUg
b3IgYSBUWC1kb25lIGludGVycnVwdC4gQWRkIGEgc3luY2hyb25vdXMgc2VuZCBwYXRoIHNvIHRo
ZWlyCj4gPiBjbGllbnRzIGNhbiByZXF1ZXN0IG9uZSBhbmQgd2FpdCBmb3IgdGhlIHJlc3VsdCBk
aXJlY3RseS4KPiA+Cj4gPiBDb250cm9sbGVycyBhZHZlcnRpc2Ugc3VwcG9ydCB2aWEgdGhlIG5l
dyBzZW5kX2RhdGFfc3luYygpIG9wIGFuZAo+ID4gY2xpZW50cyBvcHQgaW4gYnkgc2V0dGluZyB0
eF9zeW5jIHdoZW4gcmVxdWVzdGluZyB0aGUgY2hhbm5lbC4KPiA+Cj4gPiBDaGFubmVscyBib3Vu
ZCB0aGlzIHdheSBtdXN0IG5vdCBjYWxsIG1ib3hfY2hhbl90eGRvbmUoKSBvcgo+ID4gbWJveF9j
bGllbnRfdHhkb25lKCksIGFuZCBtYm94X3NlbmRfbWVzc2FnZSgpIGFuZCBtYm94X2ZsdXNoKCkg
bm93Cj4gPiByZWplY3QgdGhlbSwgc2luY2Ugb25seSBtYm94X3NlbmRfbWVzc2FnZV9zeW5jKCkg
aXMgYSB2YWxpZAo+ID4gdHJhbnNtaXQgcGF0aC4gVGhlIGNsaWVudCByZW1haW5zIHJlc3BvbnNp
YmxlIGZvciBzZXJpYWxpemluZyBjYWxscwo+ID4gdG8gbWJveF9zZW5kX21lc3NhZ2Vfc3luYygp
IGFnYWluc3QgbWJveF9mcmVlX2NoYW5uZWwoKS4KPiA+Cj4gU2VlbXMgbGlrZSB5b3Ugd2FudCB0
byB1c2UgbWJveF9jbGllbnQudHhfYmxvY2suCj4KCkFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5ZWQg
cmVzcG9uc2UsIHRoZSBwYXN0IG1vbnRoIEkgd2FzIHRyYXZlbGxpbmcKZm9sbG93ZWQgYnkgdGhl
IExpbnV4LTcuNCBtZXJnZSB3aW5kb3cuCgpXZSBoYWQgdHJpZWQgbWJveF9jbGllbnQudHhfYmxv
Y2sgbWV0aG9kIGluIHRoZSBwYXN0IGFuZCB3ZSBoYWQKZm91bmQgaXQgdG8gYmUgbm90IHN1aXRh
YmxlIGJlY2F1c2UgdGhlIG1ib3hfc2VuZF9tZXNzYWdlKCkgd2lsbAp1c2Ugd2FpdF9mb3JfY29t
cGxldGlvbl90aW1lb3V0KCkgd2hpY2ggY3Jhc2hlcyB3aGVuIGNhbGxlZCBmcm9tCmFuIGF0b21p
YyAobm9uLXNsZWVwYWJsZSkgY29udGV4dC4gT3VyIGV4aXN0aW5nIG1haWxib3ggY2xpZW50cyAo
c3VjaAphcyBzeXN0ZW0gbXNpLCBjbG9jaywgZXRjKSBkbyBtYWlsYm94IHRyYW5zZmVycyBpbiBh
biBhdG9taWMgY29udGV4dC4KRHVlIHRvIHRoaXMgcmVhc29uLCBjdXJyZW50bHkgd2Ugc2V0IG1i
b3hfY2xpZW50LnR4X2Jsb2NrID0gZmFsc2UgJgptYm94X2NsaWVudC5rbm93c190eGRvbmUgPSB0
cnVlIGluIGFsbCBvdXIgbWFpbGJveCBjbGllbnQgZHJpdmVycy4KClVzaW5nIG1ib3hfY2xpZW50
LnR4X2Jsb2NrID0gZmFsc2UgJiBtYm94X2NsaWVudC5rbm93c190eGRvbmUgPSB0cnVlCnN0aWxs
IGRvZXMgbm90IGF2b2lkIHRoZSBzcGlubG9jayBzZXJpYWxpemF0aW9uIGVuZm9yY2VkIGJ5IG1z
Z19zdWJtaXQoKQpmdW5jdGlvbiB3aGljaCB3b3JrcyBmaW5lIGJ1dCBhZGRzIHVubmVjZXNzYXJ5
IG92ZXJoZWFkIGFuZCBwcmV2ZW50cwpwYXJhbGxlbCBtZXNzYWdlIFR4IGZyb20gbXVsdGlwbGUg
Q1BVcyB0byB0aGUgc2FtZSBTQkkgTVBYWSBtYWlsYm94CmNoYW5uZWwuCgpUaGUgU0JJIE1YUFkg
bWFpbGJveCBjb250cm9sbGVyIGRyaXZlciBzaW1wbHkgc2VuZHMgbWVzc2FnZXMgdG8KaGlnaGVy
IHByaXZpbGVnZSBmaXJtd2FyZSB1cG9uIFR4IHVzaW5nIFNCSSBjYWxscyBhbmQgd2hlbiB0aGUg
Y2FsbApyZXR1cm5zIHRoZSByZXNwb25zZSBkYXRhIGlzIHJldHVybmVkIHdpdGggaXQuIEFsc28s
IHRoZXJlIGlzIG5vIFR4IGNvbXBsZXRlCmludGVycnVwdC4gVGhlIGhpZ2hlciBwcml2aWxlZ2Ug
ZmlybXdhcmUgbWF5IGZvcndhcmQgdGhpcyBtZXNzYWdlIHRvIGEKbWljcm9jb250cm9sbGVyIG92
ZXIgUlBNSSBxdWV1ZXMgT1IgaXQgbWF5IGNvbnRleHQtc3dpdGNoIGFuZCBmb3J3YXJkCnRoaXMg
bWVzc2FnZSB0byBhIHNlY3VyZWQgZG9tYWluIChlLmcuIE9QLVRFRSkgdG8gcHJvY2VzcyB0aGUg
bWVzc2FnZS4KVGhlIGhpZ2hlciBwcml2aWxlZ2UgZmlybXdhcmUgdGFrZXMgY2FyZSBvZiB0aGUg
c2VyaWFsaXphdGlvbiBhbmQgYWxzbyBhbGxvd3MKcGFyYWxsZWwgU0JJIE1QWFkgY2FsbHMgZnJv
bSBtdWx0aXBsZSBDUFVzLgoKVGhlIE1CT1hfVFhET05FX0JZX1JFVFVSTiBhbmQgc2VuZF9kYXRh
X3N5bmMoKSBjYWxsYmFjawphbGxvd3MgdXMgdG8gYXZvaWQgdGhlIFR4IHF1ZXVpbmcgYW5kICJj
aGFuLT5sb2NrIiBmb3IgU0JJIE1QWFkgbWFpbGJveApjaGFubmVscyBzaW5jZSB0aGlzIGlzIGFs
cmVhZHkgdGFrZW4gY2FyZSBvZiBieSB0aGUgaGlnaGVyIHByaXZpbGVnZSBmaXJtd2FyZS4KClJl
Z2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
