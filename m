Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFC606A322
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xU1XTJXf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hdrCX9YA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SGLFjdZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cN65r0wfRsIbr6UT+/wmhNtBhGCfGlQWoamxxbM6yoM=; b=xU1XTJXfjUUkvKwSQbA2iDln8K
	b0bDYpJE2S71WSl/jttC/lT9is+rIpXQyvoT594RWUy7lcuGdDjId46CLGkSZ9hj+eg6t8dgS+oco
	TAeF7PZvtOV7Vahev/x8kkTETh0lrt9bIGFrAEfUmL7cPUfVveMR1R5NytTbIRsRcdVBAV++oEOb4
	FAg0Dd3NsUhFFnv/eamaD83XQHy2nBhLXa0jo7puNNfxMKbCYzjuPnpNnNG0nJi/KNyyTMCrG7fel
	FEjf/gup2veZTiEPeKZAqEfRVvezToC2Ep6nvJoZPMKeftdbxFxP1YSFrKxlWQcDO/c62OnNFikA3
	YF038xSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPbz-00000000qtI-2L3J;
	Mon, 09 Nov 2026 13:40:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPbv-00000000qsV-1A5w
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 13:40:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFJAg022951
	for <linux-riscv@lists.infradead.org>; Mon, 9 Nov 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=; b=hdrCX9YA6cZwmDEV
	8pCCwfb3TOFQOmMDaBAJ14wtdNnPy82Ng0SrJ94iNW4l6ihxDz3eEvLvT3wjwUdO
	8q3bXYEUrMxDouNKs5s6B866vYVquxMuq6f+qZsZByg4W9WtKSRAN4wmDjc2S7qv
	e4hgOliiJL6I+8lBSCQeoVWBROTyA5vMdu8HA7W77m4LKqmJ3sf6SkNNuqFsgktS
	p1hcfeQBmVIT9uga0DvzcZJYmTRP9AyB8neJWCzGZcBY274rDpXaCKO7wUjdDteJ
	W9atcgrfuPQ3RPRhjOCwq5I34fvSwjcI3GpjBJjKnFswnlU9mGmROBXZL8eJt3eX
	0/CviA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydghqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 13:40:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso822773137.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 05:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231633; x=1794836433; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=;
        b=SGLFjdZXWOfzRx7wXeTbuPnaoG7TkmLI+AB2UkiBtzBTqxCpn2uxnXHafhWcSEtqWm
         LGDOg09fTT2EQB0OAkiEz8/du6u6/S/Aeab3o15liHStIssC8dMz2lmzv2PQ4i3t8ihb
         qnU3zVAuCPmVRawr8rXD759Ada9iuB8CytT/5SmNVc1K/jeTINsmJeR6Vq2DFKRrf7k7
         MWgKnJzKPrCsMp/3CZh+yw3rbeSpWlFHLZr/enzS6ANR322tQRXKYNaGc4s+uTVy5k7m
         U/qw4ko5tsrpw+tCQyCK7uI3k2xi0qBZ9zGNXvWi2DeG2Nv4D19fyuqOqZX/+/TqMaNb
         YjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231633; x=1794836433;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stL1JKpLENIa1vUmHvq30/7t5g3i5/ptiQmFu/xq4lY=;
        b=oKCSD5Z2kDxyCGRdREJS1b7KB2BO92rm2YloB9OT4gSWT0XFrg+ZsTFIGzuNEJPvj8
         0LgT4UaxahmovK1KXE7vm9o4pTr4nedwRos5vjY7GrOrYIGn5cN2LapXnSlwAuxOg5jt
         sls19a9gGEc2bxnI3OjTRSefttuTzKg7blJLN8fPwll+Otn30vUrhxJnnyJ+F92Yf7lk
         YqutLNbKlv32bUwoUyB0JABRL9l35ui93grskVnB6Kz0+1XjihosXInGSZNCu8iPC5zz
         WrMN2sAVT6I6BEI0wiSDbF2g0B6av6ssV+b28p6Kmq6xpxcka4rrQYGaL5OjlQXGYVI/
         CXqg==
X-Forwarded-Encrypted: i=1; AL+hErEb11PqFFOMSQIO2Kt468ZyppTI49mVWipp7ygOCKzcMyxGDBbo4UZQUBXnypHzDLweRgQVPeYrdVqrRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8nfsM4euXqLntqkxFm7WfFga0JoE+la9XtVvjzPmLPJ++eU8Ou
	ZdHG2h3tKKZ216YPU2dY2zVoBT0Qgp5EjChTFhWt9RApWgDpA9Yk3m9wttt1F8VyYa6wc1FTMpO
	imiTSv1XN9Nt+xj9u0nVPJ9iHEUw2i5r8CCTMWQhUWlRWwvFkLyETidbgZMly3Kka8dcuxvM=
X-Gm-Gg: AYBFou01qFhnHBdbESA1wsBdMLtmc+UpJV5DHHrukBfBd00XQ4ormowl4Fxtb9XGKKI
	qGuZ5W/7eGrsRVCy9b70kU98V45pSTxxsfE02w5gR5kcACktQXSXgjaRbeNHxC8aIdM8i8NsSDy
	8uuhHopEyW9vAJhqxHbedB9aH1ykQ3PIT71FWWrWSeblhHoC+Qf2pDMtde7w4QPNU8ubAwqqi2O
	8UQtvEtQ51JMtQsj2859mF4+QeTMA1PYydGdDEJUEByX5xZoxw+rGjfOxJlFIcD6r+AEn9XHxgX
	TbI5HyS0Eu3cQShRrbOBqUoU9rJXBro8bjwI9r8xd7O8Q5b8S0/DHiVT+ulhp0+yDBI4e19v0P7
	rveA3G5g5SQxH3E/slhs7W78JVM4Gfu08nUFKF9oBniL+bVF49il1maGOEaQoo2ThMzNNFo/36J
	RWwLrZlnuIuR8=
X-Received: by 2002:a05:6102:54a4:b0:7d2:d570:4742 with SMTP id ada2fe7eead31-7d2d570570cmr1011053137.32.1794231632732;
        Mon, 09 Nov 2026 05:40:32 -0800 (PST)
X-Received: by 2002:a05:6102:54a4:b0:7d2:d570:4742 with SMTP id ada2fe7eead31-7d2d570570cmr1011045137.32.1794231632134;
        Mon, 09 Nov 2026 05:40:32 -0800 (PST)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbe9e31sm198493265e9.2.2026.11.09.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:40:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 14:40:30 +0100
Message-Id: <DMQQ13TNRXGA.3KQXWTOX8OMCI@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Cc: "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Zong Li"
 <zong.li@sifive.com>,
        "Guodong Xu" <guodong.xu@linux.dev>
To: <guodong.xu@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
 <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
In-Reply-To: <qqvfduegawuoerrzwnj7drxkev63gxj4ddqaw4eqtrhsalugrd@sodih7ytwhos>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfX7BRRDjG4Sj16
 5EbiHKK4RCj5l7CqLGrxFQ8cOkyD79vWRv04fFOo6frJEQZGiiq5LSSjB/ZhfFAJwq5Yq+2dScY
 WFjCIuj7wS0QH5Fm7OlHuXczMs86umc=
X-Proofpoint-GUID: T5ao9Rzjyi-lVjVYEi4Kf-Wapsk_QubM
X-Proofpoint-ORIG-GUID: T5ao9Rzjyi-lVjVYEi4Kf-Wapsk_QubM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NCBTYWx0ZWRfXyNCi3AJIqPIr
 x/YSb1n1zZ+a8lfNcCP7OI1KU8rokRoEOOs/YmlAu1qFrWU7k4lzf8BYjfJ7u84gJbFb6GicBGR
 L+xEEU2M1ErXv4XMVFX7smp74A3HfJIYdMbEIztXKRMmfP+Gq0wqfqdei9S/DClWSi1Ypn5ad5A
 ShgXv0cvM3jK7PSZoAZYywaMwqKZ1gKphx+NJAolQEHp7fgFnLzvsOn+IgVTEn8c+nDubCURM3W
 5uFJq9Bl8biq5NXGxb9Qfvzy8uZ0a19HiEJf900HJ7rWbjcayjMaGPlNQSjN1H9pu5Dd773aoka
 w4DHh3VKhPFNAMF1vjnOdCZtLnoVRyRsAdKCdCQ6g68G5i3tZUDs7sDLbaFEwiAMN9+8gDPhsyv
 fa5PuHUCEtDM/YfkEfnQk8kb8ZoEUDW0bdlj0f9D7COlluQ7dqFaYmWugzfI+jFUESwM/uPfIMW
 kKtjF7xueXuo5DhSscw==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1cd51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=7zOU-n4moG5dCeRVheEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_054035_435115_E4615808 
X-CRM114-Status: GOOD (  17.86  )
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

MjAyNi0xMS0wN1QyMzoxNjoyMC0wNTowMCwgPGd1b2RvbmcueHVAb3NzLnF1YWxjb21tLmNvbT46
Cj4gSGkgUmFkaW0sCj4KPiBPbiAyMDI2LTEwLTA3IDA5OjQ2LCBSYWRpbSBLcsSNbcOhxZkgd3Jv
dGU6Cj4+MjAyNi0xMC0wNlQxNjo1NDo1My0wNzowMCwgQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFy
bGVzamVua2luc0BnbWFpbC5jb20+Ogo+Pj4KPj4+IFRoZSB2ZWN0b3IgS2NvbmZpZyBpcyBnYXRl
ZCBvbiBGUFU9eSBzbyB0aGUgdmVjdG9yIGluc3RydWN0aW9ucyBjYW4ndAo+Pj4gZXZlciBiZSBl
bmFibGVkIHdoZW4gRlBVPW4uCj4+Cj4+UmlnaHQsIEknbGwgbWFrZSB0aGUgY29tbWl0IG1lc3Nh
Z2UgY2xlYXJlciBpbiB2Mi4KPj4oWnZlMzJ4IGFuZCBoZW5jZSBoYXNfdmVjdG9yKCkgY2FuIHRl
Y2huaWNhbGx5IGV4aXN0IHdpdGhvdXQgQ09ORklHX0ZQVSwKPj4gc28gZnV0dXJlIGltcGxlbWVu
dGF0aW9ucyBtaWdodCByZXF1aXJlIHVzZSB0byByZW1vdmUgdGhlIGRlcGVuZGVuY3kuKQo+Pgo+
Cj4gRG8geW91IG1lYW4gZHJvcHBpbmcgImRlcGVuZHMgb24gRlBVIiBmcm9tIFJJU0NWX0lTQV9W
PyBUb2RheSBpdCByZWFkcwo+IGFyY2gvcmlzY3YvS2NvbmZpZzoKPgo+ICAgIGNvbmZpZyBSSVND
Vl9JU0FfVgo+ICAgICAgICAgICAgYm9vbCAiVmVjdG9yIGV4dGVuc2lvbiBzdXBwb3J0Igo+ICAg
ICAgICAgICAgZGVwZW5kcyBvbiBUT09MQ0hBSU5fSEFTX1YKPiAgICAgICAgICAgIGRlcGVuZHMg
b24gRlBVCj4KPiBUb2RheSB0aGF0IGRlcGVuZGVuY3kgYWxzbyBnYXRlcyBadmUzMngsIFp2ZTY0
eCwgWnZiYiwgWnZiYyBhbmQgdGhlIFp2ayosCj4gbm9uZSBvZiB0aGVzZSB0b3VjaGVzIGZsb2F0
aW5nLXBvaW50IHN0YXRlLCBidXQgdGhleSBhcmUgYWxsIGJlaW5nIGdhdGVkCj4gYnkgQ09ORklH
X0ZQVSwgdGhhdCBzZWVtcyBub3QgY29ycmVjdC4KPgo+IEkgbm90aWNlZCB0aGF0IHRoZSBfdmFs
aWRhdGUoKSBjYWxsYmFja3MgaW4gdG9kYXkncyBjcHVmZWF0dXJlLmMgZm9yIHRoZXNlCj4gbm9u
LUYgKG5vbi1EKSByZWxhdGVkIGV4dGVuc2lvbnMgYXJlIGNoZWNrZWQgYWdhaW5zdCBWIG9ubHks
IGJ1dCB0aGF0Cj4gZG9lc24ndCBjaGFuZ2UgdGhlIGZhY3QgdGhhdCBDT05GSUdfUklTQ1ZfSVNB
X1YgZGVwZW5kcyBvbiBDT05GSUdfRlBVCj4gKGZyb20gYSBjb21taXQgMyB5ZWFycyBhZ28pIGlu
IEtjb25maWcuCgpWIGV4dGVuc2lvbiBkb2VzIHJlcXVpcmUgRiAoViBpcyBadmU2NGQgYW5kIGF0
IGxlYXN0IDEyOCBiaXQgdmxlbiksIGJ1dApadmUzMnggdGhhdCB3ZSB1c2UgZm9yIF92YWxpZGF0
ZSgpIGFuZCBoYXNfdmVjdG9yKCkgaXMgYSBzdWJzZXQgb2YgViwgc28Kd2UgY291bGQgaGF2ZSBh
IGNvbmZpZyBmb3IgUklTQ1ZfSVNBX1pWRTMyWCB0aGF0IFJJU0NWX0lTQV9WIGRlcGVuZHMgb24u
CgpJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFuZXIgdG8gaGF2ZSB0aGUgaWZkZWZlcnkgdXNlIFJJ
U0NWX0lTQV9aVkUzMlgsCmluc3RlYWQgb2YgcmVpbnRlcnByZXRpbmcgUklTQ1ZfSVNBX1YgdG8g
bWVhbiB0aGUgYmFzZSB2ZWN0b3IgZXh0ZW5zaW9uLgoKQXQgdGhlIG1vbWVudCwgSSBkb24ndCBr
bm93IG9mIGEgcmVxdWlyZW1lbnQgdG8gaGF2ZSBMaW51eCBidWlsZHMgd2l0aApWZWN0b3IgeWV0
IHdpdGhvdXQgRlBVLCBzbyB3ZSBjYW4gcG9zdHBvbmUgdGhlIGNvZGUgY2h1cm4uLi4KV2UgZG8g
c3VwcG9ydCB0aG9zZSBGLWxlc3MgdmVjdG9yIG1hY2hpbmVzIGV2ZW4gbm93LCBqdXN0IHdpdGgg
YSBtaW5vcgpvdmVyaGVhZCBvZiBkZWFkIEZQVSBjb2RlLgpNeSBwYXRjaCBpcyBvbmx5IGZvciBt
YWNoaW5lcyB3aGVyZSBub3QgYWxsIGhhcnRzIGhhdmUgRi4KClRoYW5rcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
