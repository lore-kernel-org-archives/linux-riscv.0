Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527C2CA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 07:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCryADJkeepOmNVOQHg5lsFIqFfZ0inxym164J432f0=; b=4/fuh+60CnWATa
	C4ntn3BlOw/HUcfiW7WhxPpjVZGasZS9oP0BbeYaE5ZWFGGS060gd2lKg5RYz8aMJ/YDtUaGzx0XF
	RcrY0nHGP8M3yfRFv5EP1zCNOZnml4X0wGlj/uLoVEvHaZRWVhzC+lZ+0aji6QB7gd3USjtcXNTRt
	L5Q5l4nxPnyEA6NBYysOSTvsoGcIWsof3KQg1ivz58PVhAHxVk5LF2H6Oqu5W0/oaV3xeuXSno44n
	9kPA6BRkBLVnlNA0HVgEuSS6T4r3zqVOCzfdtGPoQLGuSk7R9tSjbMHgGnJ2xF2NNnk8rie9fDG43
	m/uJvtDyqtSa0kVCZk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMMI-00000001tNR-0ZjD;
	Wed, 07 Oct 2026 07:46:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMMG-00000001tN6-1P39
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 07:46:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jZsU1873483
	for <linux-riscv@lists.infradead.org>; Wed, 7 Oct 2026 07:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=; b=Z5XW3jfCgBXiO8j8
	nmpF/YlCkyqLFK66UB6EDbwH91A5PRXytP2X7lNYDJhb9xQzdLIUGsBxWjgOdYTZ
	uXc7d+7nvmXZK1E/AkGD9p9n+RUK3SqppZtRjdbIiN614TcHhuboQmKrit+4/9K3
	TV1FAh5fa7oWlFNc6kk6Y42iKtUXd4ePQYHt24G2LcigvjF8kAEi2IlmLI7ulUEO
	p6fCDY4yvxfzwlT4MmPwl6NL+rGXe49pp3eS2umHo5h/cuQ97msjHFUI+tX/N3RS
	sGZrs7HPcQkrOoXe16IGQuNpiWQKXZBicFzxJhbe3MC6QGkoLboeJ/KltjLQxx8K
	gA2jAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rdxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 07:46:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so809416185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791359195; x=1791963995; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=;
        b=cIUCl6EJwLHCel8U0+0YI74F8d74lvHQ5YU44fogsEzS4mr5x7DJ27AQNW1rwZjyhK
         lc+AfTghAqqszGfWqMiBg1ZXduafFuLDR21Ex3xezvV+t1rr+U0nfFY9OjrjpniJssfT
         ve/jAr+X4fE1jLlqrVadKzWQi/agzNI2TAl+hgn2wvo4hx59r388wqscjfFS+h7K0dzt
         8hTA+QFbf2Nt2KJmZHBiEVb0uJE2LkabyX87larfg1Y3UEEwgq5RdhrgYCcI6odIi0hR
         WxNdE25jaIBFl1q0zijTYGvkfcyg80MexRjc4ypL9XYwFZ8w8OaJMv+x0stOcCJaLhhl
         D0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359195; x=1791963995;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nB9iwTZpWNJOzWkXU/G8faBI0c0O5OddMDPslkUTVWM=;
        b=WKmmeP1hC9x0LTQovtHZ/g/GZqQrsFeloEOmc68svsUKVNwNA/RyZ0LQttuStTlrhh
         mgfC8cAbU1+RYv283MgGcqGEWxCY8KTc308u28D5MIQho/zbdOwuMkqs0iBERhIwdaQz
         A4r/8hUR14XDWrSwA0UXWh36XB5yIxU8IPe3XOl1ecW9TvVyMmlVr6D23Tc3IrCBA7wx
         Xjam8PmvstIHcZGLyEw95Feneil9Kd2t0vV2U2770UU1khbesL0J/7tTktVOGssHQ/gu
         a7MfqbYAaOQGhHNTEencU9bBZXxf38BIudk+FpgfHoVF8nIi7m/mH6qb4+RNZ42Tx0xm
         KdQg==
X-Gm-Message-State: AFuF++kno3XRrtP5J9IRXm3NYqgMZCh/MDaDGOpOnKwN8l3EdN2UP0uv
	U/pmmgJSx11bOJ6oZVysevGCM3HScY4tkj0H7swR94V9cstqesPQGNabpI/SsGwj8hMqa3q8DkZ
	xC0TL5La743SWymqlMwP87vgVjJQZnStjW4ddyi7jely4/YqH7Kpz9c8g65asfLf26YiCB4E=
X-Gm-Gg: AYBFou31Q3jNbxtx2ZhgqxOVo46azXjL0z36pRyHla65uqi2F1dDzzv2CgD57ocxHfU
	k5zWfuwcNBXAQ/9uEQ2euf13v1hqOiEmMrolbebFAJYpSijTSNDjF/oUu0OaiWmPnHH6+smKOFZ
	42RJdZutb/aZD8QXzUnTTv/mqCDXNeWw6Cy67G+wx1YqxgyQI3lEt6qnYhfUdUxONDyBlcPbOPx
	gtpVcOlTuIbvYiK9YrB8Nmn7RQI9+00cwMQX0hv45d2h3f10p324hcAnntnqXCefQFHGVhRxYs4
	0WebMCJgiD5fDlZWH/Vq7AWNVQ54kCaJsaG3IbkHmGN5cpb50DzTCfaA6WlnlpUVZ94/rEJF5Rz
	CL5f7ylZuG0G8zKW7ojx6j4/O48lC/MJxV1kwwA==
X-Received: by 2002:a05:620a:4693:b0:93e:980a:88b7 with SMTP id af79cd13be357-93e9b893306mr288028385a.70.1791359194691;
        Wed, 07 Oct 2026 00:46:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93e:980a:88b7 with SMTP id af79cd13be357-93e9b893306mr288023285a.70.1791359194049;
        Wed, 07 Oct 2026 00:46:34 -0700 (PDT)
Received: from localhost (ip-78-44-132-10.bb.vodafone.cz. [78.44.132.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2d563sm3896568f8f.41.2026.10.07.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:46:33 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 07 Oct 2026 09:46:31 +0200
Message-Id: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Samuel Holland"
 <samuel.holland@sifive.com>,
        "Andy Chiu" <andybnac@gmail.com>, "Guodong Xu"
 <guodong@riscstar.com>,
        "Zong Li" <zong.li@sifive.com>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
In-Reply-To: <179133089395.137225.157195939155119911.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX1Df/ml0LD2pX
 kX+avVZPUj81M3C+HEy5zrHwfGBaN+1Ru0YWDbB+h8ugg+nRTuooDE+KeZhWA2lb20Pvkq+aipP
 L339RnTgzra97/pbRbWWE6FGPFr/8Mc=
X-Proofpoint-ORIG-GUID: buze3bkOeMifbLT9fZSgSfvoyYhDVx_y
X-Proofpoint-GUID: buze3bkOeMifbLT9fZSgSfvoyYhDVx_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMCBTYWx0ZWRfX0uBhZKLjtVMC
 DHApwGdFU1AxKDDmi6YxbX+1NX1IJNzjk+dfA03qmrNZQ6oHGVLDI7jj5YR2plwb2XkxHIKbtL/
 GvNRp9bpwxT8oW5U2jBKjwBGJTUpXC/V0sphfw5aaQxVHPdv1mh9UchUI4tK+flxaab8JpvGYyT
 0xS5X9KVr0qukVHBO32aIuZQcIW43gXq/fLP9Wo/+ybAzTwYVduyRsob45lNT1rYa9LzxBbZpMR
 lghwJajqiYRt1PB7m+KdbsFO311gLsaLQ5zBGcsTyx2wEH3Pm9DSDcOAXXbUd7D87+IoqmDGMb7
 Jl8xvD2UqO1h0XekB/8u1EHEz7QZzpKh01SjsugFZ2+9v6UYQ3L2OQOrQjub476QJ9SzUVjsjUN
 eRgacf2saXowZKgGqqDExLhEWEOrgtS5MtAGHFimQ+8uan+L5PIGwJK/ymAYfu+FbhvfdjZwFI0
 0q1wIJi6SLTHvAwBuJw==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac5f8db cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=kVq+qqu7synz0czdOrlqmQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_j74ZTOZETwGzg2yP1kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_004636_380791_A8756CEC 
X-CRM114-Status: GOOD (  15.72  )
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

MjAyNi0xMC0wNlQxNjo1NDo1My0wNzowMCwgQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVu
a2luc0BnbWFpbC5jb20+Ogo+PiBVc2VyLW1vZGUgdXNlIG9mIFpjZCwgWmNmLCBaZmEsIFpmYmZt
aW4sIFpmaCBhbmQgWmZobWluIHJlcXVpcmVzCj4+IG5vbi1PZmYgc3N0YXR1cy5GUywgd2hpY2gg
d2Ugc2V0IG9ubHkgd2hlbiBoYXNfZnB1KCkgKENPTkZJR19GUFUgYW5kIEQKPj4gb24gYWxsIGhh
cnRzKS4gIFRoZSB2ZWN0b3IgZmxvYXRpbmctcG9pbnQgZXh0ZW5zaW9ucyBadmUzMmYsIFp2ZTY0
ZiwKPj4gWnZlNjRkLCBadmZiZm1pbiwgWnZmYmZ3bWEsIFp2ZmggYW5kIFp2ZmhtaW4gcmVxdWly
ZSBpdCBhcyB3ZWxsLCBidXQKPj4gaHdwcm9iZSBnYXRlcyB0aGVtIG9ubHkgb24gaGFzX3ZlY3Rv
cigpLiAgaHdwcm9iZSBvdGhlcndpc2UgcmVwb3J0cyB0aGUKPj4gZXh0ZW5zaW9ucyBmcm9tIHRo
ZSBwZXItaGFydCBJU0EgYml0bWFwcyBhbG9uZSwgc28gaXQgY2FuIGFkdmVydGlzZQo+PiBleHRl
bnNpb25zIHRoYXQgYXJlIGFsd2F5cyBkaXNhYmxlZCBpbiB1c2VyLW1vZGUuCj4+IAo+PiBSZXBv
cnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1vZGUuCj4+IAo+PiBGaXhlczogMmUyY2Y1
NTgxZmNjICgicmlzY3Y6IGNwdWZlYXR1cmU6IGFkZCB2YWxpZGF0aW9uIGZvciB6ZmEsIHpmaCBh
bmQgemZobWluIikKPj4gRml4ZXM6IGRlOGY4MjgyYTk2OSAoInJpc2N2OiBod3Byb2JlOiBhZGQg
enZlIFZlY3RvciBzdWJleHRlbnNpb25zIGludG8gaHdwcm9iZSBpbnRlcmZhY2UiKQo+PiBGaXhl
czogNWRhZGRhNWU2YTU5ICgicmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4
dGVuc2lvbnMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21h
ckBvc3MucXVhbGNvbW0uY29tPgo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4gaW5kZXgg
NzgxOGUxZDMyNjIyLi5iNTdjY2QxMTZiYjEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
Ywo+PiBAQCAtMTQ2LDE1ICsxNDYsOCBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0
cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+PiAgCQlpZiAoaGFzX3ZlY3RvcigpKSB7Cj4+ICAJ
CQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZCQiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiAg
CQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWQkMsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPj4g
LQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkUzMkYsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsK
Pj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkUzMlgsIHBhaXItPnZhbHVlLCBtaXNzaW5n
KTsKPj4gLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NEQsIHBhaXItPnZhbHVlLCBtaXNz
aW5nKTsKPj4gLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NEYsIHBhaXItPnZhbHVlLCBt
aXNzaW5nKTsKPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NFgsIHBhaXItPnZhbHVl
LCBtaXNzaW5nKTsKPj4gLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkZCRk1JTiwgcGFpci0+
dmFsdWUsIG1pc3NpbmcpOwo+PiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJGV01BLCBw
YWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZGSCwg
cGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkhN
SU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VktCLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4+ICAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WlZLRywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiAgCQkJRVhUX0tFWShpc2FpbmZvLT5pc2Es
IFpWS05FRCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiBAQCAtMTYzLDE0ICsxNTYsMjYgQEAg
c3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwK
Pj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktTRUQsIHBhaXItPnZhbHVlLCBtaXNzaW5n
KTsKPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktTSCwgcGFpci0+dmFsdWUsIG1pc3Np
bmcpOwo+PiAgCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWS1QsIHBhaXItPnZhbHVlLCBtaXNz
aW5nKTsKPj4gKwo+PiArCQkJaWYgKGhhc19mcHUoKSkgewo+PiArCQkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaVkUzMkYsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPj4gKwkJCQlFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWlZFNjRELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4+ICsJCQkJRVhUX0tF
WShpc2FpbmZvLT5pc2EsIFpWRTY0RiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiArCQkJCUVY
VF9LRVkoaXNhaW5mby0+aXNhLCBaVkZCRk1JTiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+PiAr
CQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3Npbmcp
Owo+PiArCQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkZILCBwYWlyLT52YWx1ZSwgbWlzc2lu
Zyk7Cj4+ICsJCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkhNSU4sIHBhaXItPnZhbHVlLCBt
aXNzaW5nKTsKPgo+IFRoZSB2ZWN0b3IgS2NvbmZpZyBpcyBnYXRlZCBvbiBGUFU9eSBzbyB0aGUg
dmVjdG9yIGluc3RydWN0aW9ucyBjYW4ndAo+IGV2ZXIgYmUgZW5hYmxlZCB3aGVuIEZQVT1uLgoK
UmlnaHQsIEknbGwgbWFrZSB0aGUgY29tbWl0IG1lc3NhZ2UgY2xlYXJlciBpbiB2Mi4KKFp2ZTMy
eCBhbmQgaGVuY2UgaGFzX3ZlY3RvcigpIGNhbiB0ZWNobmljYWxseSBleGlzdCB3aXRob3V0IENP
TkZJR19GUFUsCiBzbyBmdXR1cmUgaW1wbGVtZW50YXRpb25zIG1pZ2h0IHJlcXVpcmUgdXNlIHRv
IHJlbW92ZSB0aGUgZGVwZW5kZW5jeS4pCgpJIHRoaW5rIHRoaXMgY2hlY2sgaXMgYWRkaW5nIGEg
Yml0IG9mIHNhbml0eSwgYWx0aG91Z2ggdGhlIHBsYXRmb3Jtcwp3aGVyZSBpdCBjb21lcyBpbnRv
IHBsYXkgYXJlIGFscmVhZHkgdmVyeSB3aWxkLgoKaGFzX2ZwdSgpPWZhbHNlIGFuZCBoYXNfdmVj
dG9yKCk9dHJ1ZSBpcyBwb3NzaWJsZSBvbiBoZXRlcm9nZW5vdXMKcGxhdGZvcm1zIHNpbmNlIHRo
ZSBmaWx0ZXJpbmcvdmFsaWRhdGlvbiBvZiBmbG9hdGluZyB2ZWN0b3IgZXh0ZW5zaW9ucwpoYXBw
ZW5zIG9uIEYgZXh0ZW5zaW9uIHN1cHBvcnQgb24gdGhhdCBoYXJ0IGFsb25lLgoKSWYgb3RoZXIg
aGFydCBkb2Vzbid0IHN1cHBvcnQgRiwgYWxsIGhhcnRzIHdpbGwgdHJhcCBmbG9hdGluZyB2ZWN0
b3IKZXh0ZW5zaW9uIGFzIG1zdGF0dXMuRlM9T2ZmLCBhbHRob3VnaCBzY2FsYXIgdmVjdG9yIHNo
b3VsZCBzdGlsbCB3b3JrCmJlY2F1c2UgaGFzX3ZlY3RvcigpIGlzbid0IGtleWVkIG9uIFYgc3Vw
cG9ydCwgYnV0IG9ubHkgb24gWnZlMzJ4LgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
