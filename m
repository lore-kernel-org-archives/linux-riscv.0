Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7075B606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AOelp35e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpVNazB0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPRAf+VN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=28VZO8NNN1x20JvPeBI25W/azBnHTAG6Jeg4GtuRxLE=; b=AOelp35euZ12cDHJkshHiKU85t
	41TCRRi3inqogoAPUnu6DHFTFxYv+Vn3tc8aevPhG5/4W14KpfKC6aAgdSLqUc+QMFDjl2NwzVzFL
	QLQxWlUKAe5MAfMGWHvVF+q1G2WXJmXSCKEiWKOkouTVHfZmCBCxVIZI2pw/tg5/xE8I9pMnDL96W
	qq7nI7BaOi13KEgG9xrqM6ugv/kO+kz/RFASa4YkfiCr1JUL0je7S+3XX7BDS9/5obSfhqviFzt3l
	/AuR6039kFCb8BkAnrXT6bBPJAgIE3hb4Z2JD0H906H5mlwLtXYeZe8r9r+TM8yAPxzB79Y5eaYl3
	vH1CYK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3S6-0000000GESz-0fwG;
	Sun, 08 Nov 2026 14:00:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3S4-0000000GESe-1DRG
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 14:00:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8E01tV1645425
	for <linux-riscv@lists.infradead.org>; Sun, 8 Nov 2026 14:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=; b=IpVNazB0Yd23lsVb
	nbDKCCa29nEK45E5TJxpyar35VoEq2cuUMztLUTvtfIPSCtibDCkVm4wt3mgcIvt
	TU6tAlWabIo3+dH0tm5DX6QH0OaPklwmBlYQT/eoxqLbHQzu6r6eiWNv7fi8j4PX
	wKK2vRwKCz+Rn6v+KW0j772ELd64eN5mokPCPxF9yQI9bTxzkwN030vSC3m5/uQb
	e+BHDqdBZx462JOFDw0r79tIhcfPzigSyVBzOZSmePa6nN19S6BwDjaws9fOZlYX
	V89ee1aIXbXsxKLoVj71HRv1zC6dbpqZV3NJhjdBMytQDT45Su53KkFS3fY42Mof
	CFqIAQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2ub02j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 14:00:54 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67532014b2fso181058d50.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 06:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794146454; x=1794751254; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=;
        b=bPRAf+VNUSUiEbX85H6+zNVsAuPvom7B37wRMbjSNwcu8yq1hDT2PaApQHoZdLPzQp
         JZSTRKxim5LApfPF1bpI6sGicCCjVNuZxyLv+wOZDomIf1/XY+/YgHy2Y1gJYy2You7B
         vYj9RzQIjNdUlEHFBL+YkY88atUnAd2UOr8Gmoe5EjKrg7zJPYYePbGIhXfI4INhAjw6
         +5g1t80cEwefG+Sohh3sW1uU8K9tjNrQSFvPnbMu/+JkLNs/GHagr7BfAIuo3o38WCcW
         j1cIE+NRAka0s3QqpXlxf0R/ggNNwBghFimF5JWK7T2pOcSE5uN4VwRxyBy9MWKuPQtY
         /edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146454; x=1794751254;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=;
        b=z3hwpRZbkpTDf/h1yP/oB3WH/2m1+MQxp8z5mRvgMWJQleutsxaBNCX1qtlyiINKYM
         LwLraSD+RRvtUpVgn/vHRPD86M0MMY3UMqCNWW5z2q58VQf9540oRMNM/Fn8hLtFADtB
         /sh9JQWufXRAfm4KC5sbf9d2zznpq974nskB8lzs1GD1FwTYBMRrsyjW/hK83JvW7koZ
         jrI0cDk4mfIl77VcSVLzaaHITkhgbeUAdikPH5PmfTXsPcZ0QLHAbMDZ5+PKIH0DmUwI
         B0HspIZakrvqmyBmouvVjV5MzJJ14XYxxw75WuLmu+qF9HoUGK2Z04b3aiwYq+HVWEzR
         zCKQ==
X-Forwarded-Encrypted: i=1; AL+hErEOUQj/qgRlwmhkCSGzS9EO2457EHTaqQJenPykywgn2bhKgHQWQ091HXjn/N85OCpcEyFP+DcyUHbh4Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/tik4MvN+1Oy1fw+ZqEGnvqDF9rS2r0moBHNrc7dsbbGh1/2r9
	kPmMeY9qpLl95kRgxLFKP4aXmHTQWk65r8PLVvA1xOUPzMtqj6mB28dTIi9qi0DpAV5Fa4QfGKB
	ejaYwC1NVoXXslCAqcJi9lOBaArRHSVJxUGbigA4h6oPeU0Q7NJhlO1uIbqbjlA5ewklqNmU=
X-Gm-Gg: AYBFou2J72scKSW3WL+6JJF++9B9jS/Wg3w1gln5AUxcV6+l5PIDWQ+9VE1we6RqnqS
	EV3yp7ApQRtppjludyOaoNZPx20K8kIKJhj8qStB5KZv286RkcCine8of0vdFh8PfxTqzEuHtIl
	gGT1kd9p17qU+8mco1LyXBP3DAo0EK5DTnq+TGkA8rLWrLGSDOYjBJ6+L14v/oqWy/bYrjyNtT7
	+zLyXf383ssZY9BTmXZnDhOhJrIGZ9RDt5AVDRwQ9mU1KTiAJfdWi4OUEqfIRw+BtGgovRv4Lt+
	f1XwsaYCzDDYoWTdy+PQqIrzXFQ7kAPAf6x+OfP/mdfOmcE1TtXpmsQRM9KcE8dSRea4tX0IxTu
	4eaVZKAsjHcq/ItRz/ibfhGwMDPpOzLItdZdXnC3lQ9c1gpo/yECMksnZ9t77S94qegHSR4Xjer
	2EZrYEaasIuw==
X-Received: by 2002:a05:690c:660e:b0:8b3:b01:74b3 with SMTP id 00721157ae682-8b36cad8c4fmr9814067b3.58.1794146454195;
        Sun, 08 Nov 2026 06:00:54 -0800 (PST)
X-Received: by 2002:a05:690c:660e:b0:8b3:b01:74b3 with SMTP id 00721157ae682-8b36cad8c4fmr9813917b3.58.1794146453529;
        Sun, 08 Nov 2026 06:00:53 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm14438547b3.28.2026.11.08.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:00:52 -0800 (PST)
Date: Sun, 08 Nov 2026 09:00:46 -0500
Message-ID: <c1a723190b71b663d73be7cb9f5141d5.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when available
In-Reply-To: <asX9uMyiJMAzjIFF@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com> <179133089395.137225.16486951642128892687.b4-review@b4> <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com> <asX9uMyiJMAzjIFF@blinky>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: WsJDu2OyIQbUw4DHnf0SJ0rnlQ27yzsZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1NSBTYWx0ZWRfX4IDKdTchQugG
 qMNs9/42T0YgSVG5iCOcHbVKmYlF5BEHYZmh6VAG9itBmIpGkwR6I25qXm+Eh+rKkE+BRGPJIWh
 7fm4Qo2NjwZsyiNA5fJuzXEEpGvETzs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1NSBTYWx0ZWRfX2gCHpgdcgjIv
 2lz1m0Pva42+FawU+OMF0lFv+9Xn7U+RY2jJ0SLsK+I4g5lsPb3btS/bLSi4rS/kkcgcvt21u5S
 jBq9yn7NjA+srwnXB1/bNQXoCIX6oifmmPdkR6FKM3iNa4QIi2AQj6jdfSq/mW7zY6W0JQe98aj
 n8h7nfElqq0qmk903iYQjOlIGfmKSszsc035/FHbVt1ahq2y0vNCpPVwCYozphZ+bhHl6q+yCra
 jiJoj0oI3++ZaXWViXCcZrTW/bWXb7/BoBUD/R4tpbfCHN9wjju8BIEa58GhD8nXIpe50EzL1H/
 1oIQ5AKTCDglhY8MugFKnGc9iLxd/e8Sg3uj0ZKrVE7yzJ+A22W+DfTPvu4C6psYxFBQ3evaXuh
 kpoKunHB3kc57ggoXLIQNchiietTUwVpafgqO69vAi8a014pay6JwGSzkRNbdl1qP6ph/L3b3/L
 VZI3h5JQQbVp3U0CUjg==
X-Proofpoint-GUID: WsJDu2OyIQbUw4DHnf0SJ0rnlQ27yzsZ
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af08096 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=6dy-whiJEFYAl8_pB5EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_060056_469542_CC889CE3 
X-CRM114-Status: GOOD (  17.55  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgQ2hhcmxpZSwgUmFkaW0sCgpPbiBXZWQsIDcgT2N0IDIwMjYgMDE6MDc6MjAgLTA3MDAsIENo
YXJsaWUgSmVua2lucyB3cm90ZToKPiBPbiBXZWQsIE9jdCAwNywgMjAyNiBhdCAwOTo1OTozMEFN
ICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gPiAyMDI2LTEwLTA2VDE2OjU0OjUzLTA3
OjAwLCBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT46Cj4gWy4u
Ll0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSXMKPiA+ID4gaXQgd29ydGh3aGlsZSB0byBtYWtlIHRoaXMg
Y2hhbmdlPwo+ID4KPiA+IEkgdGhpbmsgdGhhdCBpdCdzIHNlbnNpYmxlIHRvIG1pbWljIHRoZSB2
YWxpZGF0aW9uIHdlIGRvIGZvciB0aGUKPiA+IG5vbi12ZW5kb3IgZXh0ZW5zaW9uLCBidXQgdXNl
cnMgb2YgdmVuZG9yIGV4dGVuc2lvbnMgbGlrZWx5IGFscmVhZHkgaGF2ZQo+ID4gdG8gZ28gb3V0
IG9mIHRoZWlyIHdheSB0byB1dGlsaXplIHRoZW0sIHNvIHRoZXkgY2FuIGRvIHRoZSBzYW5pdHkg
Y2hlY2tzCj4gPiB0b28uLi4gSSBjYW4gZHJvcCB0aGUgbGFzdCB0d28gcGF0Y2hlcyBpbiB2Mi4K
Pgo+IEkgZG9uJ3Qga25vdywgaXQgc2VlbXMgYmV0dGVyIHRvIGtlZXAgc3RhbmRhcmRpemF0aW9u
IGlmIHBvc3NpYmxlIGFuZAo+IGxlYXZlIHRoZSBjaGVjayBpbiBoZXJlIHRvIG1pbWljIHRoZSBz
dGFuZGFyZCBleHRlbnNpb25zPwoKKzEgdG8ga2VlcGluZyBwYXRjaGVzIDUgYW5kIDYgaW4gdjIu
CgpIYXZpbmcgdGhlIHZlbmRvciBrZXlzIGZvbGxvdyB0aGUgc2FtZSBydWxlIGFzIHRoZSBzdGFu
ZGFyZCBvbmVzIGtlZXBzCnRoZSBtZWFuaW5nIG9mIGV2ZXJ5IGh3cHJvYmUgYml0IHVuaWZvcm0s
IHdoaWNoIEkgdGhpbmsgaXMgYSBtdXN0LgoKR3VvZG9uZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
