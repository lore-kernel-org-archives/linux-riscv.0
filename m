Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD49D5E12E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW2vjXGWFOL1q5qdH1cZNukArRL3+x6jEY8cYyDD6Bw=; b=yr2vwQmAbvLbGs
	g136E6rKIwC2mhVyp+xXJJe8lvBCcWvU2mYXUiv7gKf+qaW/TLIRz5GV5voe/RmrrVdsoSHM93yb1
	M3skoEHwCgnEWCgkLK3iz3US9nAHevuMFomGYvo4irU4GnkRPQ+UmJaaK0jygo0d0G4y08UVJu1nl
	8W8XMVjR+m55L6sGuhkr+WQt9zIMaSrkC/wUlgIOrdtHn8A3UjUXP53q9uz9p8snUDnvsmrjwjLKU
	IUEOLUmRThD4g5EfxyJnar1CCZ9hKiW5hcZvSJYWfS5BlH4/iNIeS0F0rM5N/PnXjVpPewFCJTki1
	5GlvSw+eWuXQkXdllRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSit-000000054Uk-3Mxp;
	Tue, 16 Dec 2025 10:56:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSio-000000054Tt-0TpW
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 10:56:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAXXOt3598207
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 10:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oki31/DgsZ6+KzPwIohVz4qvXrFW1AnimENJ+INjaho=; b=b6OHuUgqaipIg7eX
	o/zFibA/JMxcrYY9VhNBSzvv3mhwSXg746mvpGhlxcSROS8WY0AK11hjXyO5yi4T
	kfZ/iSpIrksabGpPOGG9K43FIQHb/mqUxs5S1PjBw4UlL0OZnC6ndYNeqOdFtu29
	EEKKcae0N1ZqrqWT2urRO/UCkWb0Rjqm8L4YiMTaE3vYbhg76zVwYqwBl8qQHI9H
	m6DJxVn1rVpeHGTc+zYWQUpS6u6bN71IFc5kNbmTXskRxWanTOaFtAJvzJxSqMQo
	Jjkng4fq0kk/Nig3dMr+EhTtn6Ie5+YXt56GaACMiEhY8HeCl9witxpvipnu+utz
	br/WoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35se03qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 10:56:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c5d7865e4so3799881a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 02:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765882560; x=1766487360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oki31/DgsZ6+KzPwIohVz4qvXrFW1AnimENJ+INjaho=;
        b=e9J4ALRBbGICyvSR9yPcywNyaZ2kovvDJ4zurJxvXQbcxytcMJ6sEerzuZFjmDNyH2
         +ILgVa/SepRUebD3ADt8DGEh1DXvB2xpqjjN1M+UF+wIQ45FoPy0Kj6S/0/UgJVXWpL/
         D6YOgX/oZsv/VYXX55GZ5f8Q6KvWcyJjAKT3iCfpv6z9IGCupuHOeDZSJtE3828Z/Jn0
         mynmloUMGGUS1MfV3APhyPRAkuBG06R5lfh0LP2XoFVox+ojg+nf94g6DyuM8obeg3sj
         eb9LLfMqXP7mre4kyPtHNIsXL0T3iHqqyknbbatf1I06YkBxBsUoJ0o08ihRLmPDvb75
         hlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765882560; x=1766487360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oki31/DgsZ6+KzPwIohVz4qvXrFW1AnimENJ+INjaho=;
        b=JciZK4HI4Zyh3/C+WsE3/z1j4k37+FBzKknp1fLRhbSogWdi0l8CVHPupMhw056ixL
         dFKanloqNcA3JSQiIkgrinNFoYM/6CcPbsPiNSY0Rgq3xt/gUha5o11L1wNCdk9ynrBm
         6VpVyt2cts8OMGKNJ0p+8vKa/zYEQlhPHM2sHhVo+vca7re4002j71bkfklX4KfZ+2ll
         3fJQnKfILgkqRej8yGljgDxCxPH/srt4JumF+jV/X58qJw7JfKlXHchPBBvhOdPzVN8H
         s/MGJQjOVWj2bx1o3NRNqCWY08V9NWhXV54Ihth4NdYh5Ibhgw5dQIFzHAGwYjHIW+GU
         FN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3phu4EIx91kAqZRDqRcRJ39KxfUcOlgnwUgOkK6cRyQRnTasahwHcBqHDE863KzQekm0mSplYB/87VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3BLBrZjferMndbYGCpIENwQp6N8ZpjBu8Y/s7WRSnvTKnzGy
	ID2AB/lta+wL1L3gDqLHVE2kWUtk6QE+sSySyYQOuJqeRVF378GVnzzQxrFkoGv1BAP9tsHNRAD
	gc/wp4JgAM3Fry71Fkiey/GAzWc0LMJintc0/PfLdo1tnDp+CaRbqpmuLMtVR7MY6zB5m4Hg=
X-Gm-Gg: AY/fxX7bf4Wcp2CZY0bYFZURb5RdUIxxYoi+6OfJ43RYXzepRzrZPMVFX7s1pMp1TeT
	5vkERDwMtGlKMgnJPr5C9PAFLLfBCadV3tctUdYAiNDvaVPzX4f37Krt0l0wUwxAP7AU9LQprYj
	+WUalkQ8yyNbphCM2uLhwxXY2HPn0uCH04RSxMd6GyM+Y9kDG4Jxt6XacQazVsUjBW5P+AvbWva
	4mYxt5MWrMkg8yZEdHV0L8aX327gW3LBJNB3KsgSZAu+rrWgoN6xBQd1arjH5fO9UzQbQkWjf40
	zBz/C5wlH+kjNloYA5PL6sDmg/Rp4W5HPx7TiW4Zngs8tdIN1Lu60j4PFVRIm24EBszzlXh7EQK
	heLcIZzXNEUFBOnB0eL9oRoWRnnz+xZCIecj5F80=
X-Received: by 2002:a17:90b:2e0c:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-34abd6cc4ccmr11105465a91.8.1765882559607;
        Tue, 16 Dec 2025 02:55:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrvhxL/1OIe2D/GBuAobttB7vmHPJWOQlRriLy1UbuK0EuA2bfX1PNz1XLE0mXVVGn4xs3Zg==
X-Received: by 2002:a17:90b:2e0c:b0:34a:8e4b:5b52 with SMTP id 98e67ed59e1d1-34abd6cc4ccmr11105452a91.8.1765882559165;
        Tue, 16 Dec 2025 02:55:59 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe294a00sm12076710a91.12.2025.12.16.02.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 02:55:58 -0800 (PST)
Message-ID: <ba8554b7-499b-4fb8-b792-471d83cf3893@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:25:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Randy Dunlap <rdunlap@infradead.org>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251204101730.1036671-1-arnd@kernel.org>
 <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com>
 <aTbCqyOuprPOyU4X@sumit-X1>
 <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com>
 <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
 <CAHUa44GO-D1YcQ_36pe-vQ83fB9rcOkny+M7a=CThAxWb6TLTQ@mail.gmail.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <CAHUa44GO-D1YcQ_36pe-vQ83fB9rcOkny+M7a=CThAxWb6TLTQ@mail.gmail.com>
X-Proofpoint-ORIG-GUID: c5MVo1qm3zhJb8yLHBTQv0N3DQ9AInfZ
X-Authority-Analysis: v=2.4 cv=ar2/yCZV c=1 sm=1 tr=0 ts=69413ac0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=ZhWf7fvzcGQh0Gx6-UQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: c5MVo1qm3zhJb8yLHBTQv0N3DQ9AInfZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4OCBTYWx0ZWRfXwmBctqc79OOq
 madBWN0LPg2WfiR/rdphaCMM2bxHFjhqY+3BQ4NKSjQ29l2arGfmjVER60UCl73y9fOXkYS9SsW
 p5i0cjVk6nBWjHlAQckImXLbY6CbK9t3E+KL3BL1nlGumD0S72O4BeadU8cWuBUq7lictiD20Ox
 SG8Nk24w+Kyl3czUji1MYRAj+Ddp0YyqtT1HgkYUpvmjQA27YMtqgwt7qZxOZEm9PZW1kzbHCXJ
 Ek6EUSs5CNlDLzRd9Ae670U912kd2aAEzOxVu0DfEAJSX71KO66xKO6Fnw96uR+Cpqi2w3BA018
 n8CTxiAtEnegdDuFEixXovx2nfs0PK+6LX1UGsM1EDAVhzofb1vq5OSXHadvwOY1FSVwiOB92N0
 TfqYrUdh6TLfVRif7RutEwFv4QcIOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_025602_279152_ACC75C5D 
X-CRM114-Status: GOOD (  23.40  )
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

SGkgSmVucywKCk9uIDEyLzE2LzIwMjUgMToxOCBQTSwgSmVucyBXaWtsYW5kZXIgd3JvdGU6Cj4g
SGksCj4gCj4gT24gVHVlLCBEZWMgOSwgMjAyNSBhdCA0OjU04oCvQU0gQW1pcnJlemEgWmFycmFi
aQo+IDxhbWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiBIaSwK
Pj4KPj4gT24gMTIvOC8yMDI1IDExOjU0IFBNLCBIYXJzaGFsIERldiB3cm90ZToKPj4+Cj4+Pgo+
Pj4gT24gMTIvOC8yMDI1IDU6NTAgUE0sIFN1bWl0IEdhcmcgdmlhIE9QLVRFRSB3cm90ZToKPj4+
PiBPbiBNb24sIERlYyAwOCwgMjAyNSBhdCAwNDoyNDoxN1BNICsxMTAwLCBBbWlycmV6YSBaYXJy
YWJpIHdyb3RlOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gMTIvNS8yMDI1IDEyOjI3IEFNLCBK
ZW5zIFdpa2xhbmRlciB3cm90ZToKPj4+Pj4+IEhpLAo+Pj4+Pj4KPj4+Pj4+IE9uIFRodSwgRGVj
IDQsIDIwMjUgYXQgMTE6MTfigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pj4+Pj4+Pgo+Pj4+Pj4+IFRoZSB0ZWVfaW9jdGxfb2JqZWN0X2ludm9rZV9hcmcgc3RydWN0dXJl
IGhhcyBwYWRkaW5nIG9uIHNvbWUKPj4+Pj4+PiBhcmNoaXRlY3R1cmVzIGJ1dCBub3Qgb24geDg2
LTMyIGFuZCBhIGZldyBvdGhlcnM6Cj4+Pj4+Pj4KPj4+Pj4+PiBpbmNsdWRlL2xpbnV4L3RlZS5o
OjQ3NDozMjogZXJyb3I6IHBhZGRpbmcgc3RydWN0IHRvIGFsaWduICdwYXJhbXMnIFstV2Vycm9y
PXBhZGRlZF0KPj4+Pj4+Pgo+Pj4+Pj4+IEkgZXhwZWN0IHRoYXQgYWxsIGN1cnJlbnQgdXNlcnMg
b2YgdGhpcyBhcmUgb24gYXJjaGl0ZWN0dXJlcyB0aGF0IGRvCj4+Pj4+Pj4gaGF2ZSBpbXBsaWNp
dCBwYWRkaW5nIGhlcmUgKGFybTY0LCBhcm0sIHg4NiwgcmlzY3YpLCBzbyBtYWtlIHRoZSBwYWRk
aW5nCj4+Pj4+Pj4gZXhwbGljaXQgaW4gb3JkZXIgdG8gYXZvaWQgc3VycHJpc2VzIGlmIHRoaXMg
bGF0ZXIgZ2V0cyB1c2VkIGVsc2V3aGVyZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiBkNWI4YjBm
YTE3NzUgKCJ0ZWU6IGFkZCBURUVfSU9DVExfUEFSQU1fQVRUUl9UWVBFX09CSlJFRiIpCj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+Pj4+PiAt
LS0KPj4+Pj4+PiBUaGUgbmV3IGludGVyZmFjZSBzaG93ZWQgdXAgaW4gNi4xOCwgYnV0IEkgb25s
eSBjYW1lIGFjcm9zcyB0aGlzIGFmdGVyCj4+Pj4+Pj4gdGhhdCB3YXMgcmVsZWFzZWQuIENoYW5n
aW5nIGl0IG5vdyBpcyB0ZWNobmljYWxseSBhbiBBQkkgY2hhbmdlIG9uCj4+Pj4+Pj4gYXJjaGl0
ZWN0dXJlcyB3aXRoIHVudXN1YWwgcGFkZGluZyBydWxlcywgc28gcGxlYXNlIGNvbnNpZGVyIGNh
cmVmdWxseQo+Pj4+Pj4+IHdoZXRoZXIgd2Ugd2FudCB0byBkbyBpdCB0aGlzIHdheSBvciBub3Qu
Cj4+Pj4+Pj4KPj4+Pj4+PiBXb3JraW5nIGFyb3VuZCB0aGUgQUJJIGRpZmZlcmVuY2VzIHdpdGhv
dXQgYW4gQUJJIGNoYW5nZSBpcyBwb3NzaWJsZSwKPj4+Pj4+PiBidXQgYWRkcyBhIGxvdCBvZiBj
b21wbGV4aXR5IGZvciBjb21wYXQgaGFuZGxpbmcuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyBjdXJy
ZW50bHkgb25seSB1c2VkIGJ5IHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIHFjb210ZWUgYmFja2Vu
ZAo+Pj4+Pj4gZHJpdmVyLiBTbyBpdCdzIG9ubHkgdXNlZCBvbiBhIGZldyBhcm02NCBRdWFsY29t
bSBwbGF0Zm9ybXMgcmlnaHQgbm93Lgo+Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIHRh
a2UgdGhpcyBwYXRjaCwgYnV0IGxldCdzIGhlYXIgd2hhdCBvdGhlcnMgdGhpbmsuCj4+Pj4KPj4+
PiBZZWFoIHNpbmNlIGl0J3Mgbm90IGFuIEFCSSBpc3N1ZSBvbiBhcm02NCBwbGF0Zm9ybXMgd2hl
cmUgUVRFRSBydW5zLCBzbzoKPj4+Pgo+Pj4+IFJldmlld2VkLWJ5OiBTdW1pdCBHYXJnIDxzdW1p
dC5nYXJnQG9zcy5xdWFsY29tbS5jb20+Cj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+
PiBKZW5zCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIGFncmVlLiBXZSBzaG91bGQgdGFrZSB0aGlzIHBh
dGNoLiBBcyBub3RlZCwgdGhlcmUgYXJlIG5vdCBtYW55Cj4+Pj4+IGNsaWVudHMgcmVseWluZyBv
biBpdCB5ZXQsIHNvIHVwZGF0aW5nIHRoZSB1c2Vyc3BhY2Ugc2hvdWxkCj4+Pj4+IGJlIHN0cmFp
Z2h0Zm9yd2FyZC4KPj4+Pgo+Pj4+IFlvdSBzaG91bGQgcmF0aGVyIHRlc3Qgd2l0aG91dCBhbnkg
dXNlcnNwYWNlIGxpYnJhcnkgdXBkYXRlIHRvIHRlc3QgaXQncwo+Pj4+IG5vdCBhbiBBQkkgaXNz
dWUuIEp1c3QgZm9yIGNvcnJlY3RuZXNzIHNha2UsIHlvdSBjYW4gdXBkYXRlIHRoZSBsaWJyYXJ5
Cj4+Pj4gdG9vLgo+Pj4+Cj4+Pgo+Pj4gSSdsbCB0YWtlIHRoZSB0aW1lIHRvIHRlc3QgaXQgYXQg
c29tZSBwb2ludCB0aGlzIHdlZWsgYm90aCB3aXRoIGFuZCB3aXRob3V0IHVwZGF0aW5nCj4+PiB0
aGUgbGlicmFyeSBBQkkuCj4+Pgo+Pgo+PiBTdW1taXQsIHRoYXQgd2FzIHRoZSBwbGFuIGZyb20g
dGhlIGJlZ2lubmluZywgdGhhdCdzIHdoeSBJIGRpZCBub3QgYWRkICJSZXZpZXdlZC1ieToiCj4+
IGluIHRoZSBmaXJzdCBwbGFjZS4gVGhhbmtzIEhhcnNoYWwgZm9yIHZvbHVudGVlcmluZy4KPiAK
PiBBcmUgd2UgZ29vZCB3aXRoIHRoaXMgcGF0Y2ggbm93Pwo+CgpZZXMsIHRoaXMgaXMgZ29vZCBm
cm9tIG91ciBzaWRlLgoKVGVzdGVkLWJ5OiBIYXJzaGFsIERldiA8aGFyc2hhbC5kZXZAb3NzLnF1
YWxjb21tLmNvbT4KCj4gQ2hlZXJzLAo+IEplbnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
