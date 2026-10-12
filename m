Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57643CA9ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PBr+N7PdXRFxbnayaGgwKwzCocU9FnqQw+RQ0r8AFk=; b=ykUETR1pntC5Ty
	2aSZaxp+OA0E4AH382opm9IWMGr9E5rZIpWTCc2cWY/x5GjZgDBCkupsGWY8lMk6TsoGRg6eExoey
	vioQjjJCc8gvh1phqBfcb9MzUyn0+FEMUOl3aD4xw5MgJ1iHvwKvowhfS44mBSbWIKgchi6PSwQr8
	ijwpkstMbPqBBrJfiU5Xq+82cXACvZrhZD9ZtOzBVtWUAXA4P+zR420WRXxMp3QVEdB4yquw3OyEk
	Amk5KxJoEjIC9vSPuAV0bPisuKeBpX1MdJT9KGbQMOPYogG3KJoI59UghRNFXlp3ion1VRjAQ81bM
	vZ9eNLHT7tIdy5vyRerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJKy-0000000B2Nd-3IEW;
	Mon, 12 Oct 2026 16:57:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJKx-0000000B2NJ-1JJQ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 16:57:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf0191290966
	for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=; b=cM
	DcUL45gRuVzE+jNsv8a6qBEwW0YUaXRh4vF8WElxOOIgmMZzaRhY7ruPaoFvy6Lj
	qDSvQ0X0lFxTBwq6zbVb2UUqBCDF+64fcrSBck2BgsxfSY0aPjBI59yBV9SemnuF
	jg4xUoWeLZnUS8rUWRyWRBQFNxDXxI+uZPwLVKKE6Kt+ibWKP7ABv1Vqabb8hEvt
	LktCsN/FQJeSEwTezqgfkoea1A8vPmr2HuWNFVu5BbJA0I7kjDSw9H39g0Z1+HjA
	trgQ6uybg3jafppp73YBth9ts2UVWUjjpterLmYN7VhiHYf/TQTofM+iER1ldPCv
	VDxuL8ErBKA16yDFyp5w==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcstb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 16:57:18 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6713ebbca2dso2382336d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 09:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824238; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7wbi4h2usIDxrD64iWU45k+fxdAZ5AIgv8vj28bB3XqQtqV74wmCzuarJP25sABGD
         19gzUbpFTZeEF2wvxcPDD4T0/t5VDyWgK5VA//YaZc/m+eB8O7xRVPocK1SP5MD2mPrQ
         HdU832sP6ec4/0Un5+dxL7+8BN8tte9jZDgQrKSsJPiHi6o6GbnWQDeIjp8R/a3kxArw
         z59Bty7VhouLKShagyn1wYS/hF+b87aq/613Hc6d5Ifm6D4WaQeStnnLOdi5R1AWX6sJ
         bU4x4E7NIsInWq7LpU7QtWXSqUJ6ajwUWS8zb05TEyd0gV3kvU7hYVVFSUaSxvB1U6CO
         BqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        fh=BWrXM/u1T3tuyqw51F13CtOIvwGx7PSGlGlPVlbAl4s=;
        b=fcWnfeJ/LLII8jsV+2VQIRiDTMEomYc7l0q4bo394sDGkQ3fzKe8dKth7+1OusVSHR
         /buAKbccRd90yjhEHkSmGm1qkkn6F+Dg3Wug2pgKtYzQnSz56AHPZ5+cMWaiTXa+zd/b
         LrdaGPgMDxHaTl7E9DyW48vzJee/K8jD7iBNY40LQ92Y+ySknsFy5BuCUutXxyAV2sa6
         3N11Qgj62cVEZn3+ID70V3mGKBt8jg/LRsNvO5M3hqilZhjRYXb2KJ5MpsLVfftWFQX9
         cONkvgiIXZbyDrcSAnpHJL/ftdhw4rIUw5r8HrYb4t9p5upBWmfxnbYxUX0ag7U+fBu5
         zwrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791824238; x=1792429038; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=Ck1eMzX4EfwfKzUvqtLkIDzOvSyJvEbczkcHB0E4KoROnjwZKQy1d83zXMHbEsiK2S
         ANtKm6VnCEawBvpeomxF/VPFgwZKaZOXLXLxNceMni0rNxGbD4Ln9J465WXQCPkxJy61
         MGdJq9NMyxs2JJfI19oYxeuVNd5cN5nWWOyuM96L1CygmKoMqQM8kHUDckMRCR5g9F2p
         0qttVk4qQiosXJX2x4zv8CkyaLRIBNvOWfI4HPuZkCXu5qkKQN1eqRQ5BlZk4ywq664w
         QV0sQ0Af+VuFKsEknPgVne8ttaJpb9/GU+8jlbLfFmbDdrYg2ryJwm4S4iu7P8n6tvoH
         D5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824238; x=1792429038;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47NuF1ZKqF7d8RYJGYljqA1U0z0Tidrq15wAPG9h8b0=;
        b=AknrWMtrHRXer1QEiNPwg+BuleagNyXm15LXPOe8R4zrbtwt83mOFnKXkHR4btPV36
         Z67OcMCvLW3+wslZbJmV834avokWi3ez4GrsdA1ASeSKA0TubWnkGgHnDDGzIpIp5kSh
         uKxZ5J3IJ1Va3r1yQEJfr8Ea2pT5QEygJbV5k8lfZYlrDurFzKvpaVVr4OLAO6Itwxjc
         Db7+/PyrCKmmt60Yb7HxDPqHD5JvbWsAatVCy/KaGm3S4wVTZPC3Q7zvnrIvwh7e6Vsz
         zDTyfGQIEUiydRD2LkCUp/7BUYZa9kDZAHzk7oRfXWDQsqdBlxYVFXZR3mo+96xHS2B0
         DFnA==
X-Forwarded-Encrypted: i=1; AKwUvBzHUJdazLZGOOV+MaBNNVDx7wjQ/WEiZJrZOykqeN3j6po5INgsKpCGEnXzb49BwoBGVexGNtFpfa0p8g==@lists.infradead.org
X-Gm-Message-State: AFq9FYIoydCU0h7x9aLz+Os0vfmkiKFLdbTtwQ+zK7H8e2qGuuj0f0pT
	Hnnrw/Yt7tnr9oCzwm+eXl0HNpE4GlWQSEe1cYG/LH4inXfmJxn9h9TMZH7Lbnr4OWb0G/obdb7
	spoHp/82gzX2sAlabKuwYBvs5R3pbt2HSXAHgCBf68spt6o8MW3K5fGJYP6T5HWMr4sQprG/xC2
	YGRiPGpB5+MxPeBeU5OCBwK+P4IfMve9MzOt57KJBGqxaT9A==
X-Gm-Gg: AYBFou0KX0SKKFdESk7oLNEX1eCueM6aGtR5k0Vh4UMRppRfgw/scw7fNA96eQnBW81
	9BKDyCPy2Jx3WuCY1HNySsewLAzJTvuRig9rBn2OqdQVbr6CfVlfstdOEaDFj/TmtzVGYCCKlNH
	6BsW5s7Cqg6oIMvadE+ldBFUclVaNop0vT4Zg7pJpQKFmoSiwInuE5C1qEWWg=
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id 956f58d0204a3-679360586ebmr2314630d50.64.1791824237735;
        Mon, 12 Oct 2026 09:57:17 -0700 (PDT)
X-Received: by 2002:a05:690e:4101:b0:676:88cd:477a with SMTP id
 956f58d0204a3-679360586ebmr2314577d50.64.1791824236864; Mon, 12 Oct 2026
 09:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org> <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
In-Reply-To: <20261003-dfustini-atl-sc-cbqri-dt-v9-3-52fd8be98dcf@kernel.org>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:27:04 +0530
X-Gm-Features: AclHuK96lmXU1FySMYulXru_-us2zCYXg_c0cpE2EJ1bHEgD2VYJgCcz2mj0Iv8
Message-ID: <CAB19ukFNjO-J7YaLh3_1dAziMtELkvu6mmVbcES=WFWYQxgnSQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>,
        Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>,
        Chen Pei <cp0613@linux.alibaba.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
        James Morse <james.morse@arm.com>,
        =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Peter Newman <peternewman@google.com>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Rob Herring <robh@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>, Tony Luck <tony.luck@intel.com>,
        Vasudevan Srinivasan <vasu@rivosinc.com>,
        Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
        yunhui cui <cuiyunhui@bytedance.com>,
        Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
X-Proofpoint-GUID: lGgund2wwRBNi0_mM0RxJfGAVNdJzZOz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX3KwjnEWLNNU1
 KqQZxUu7E5FxO/3MnetbBP5igsF+zB4iYHUhY59Cw44nIkbKNhULlUimr5RmNfpTiZTMcGJPZb7
 LbNFtDNE3RGXabBkPCvo1/AtpwK+TYQ=
X-Proofpoint-ORIG-GUID: lGgund2wwRBNi0_mM0RxJfGAVNdJzZOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NyBTYWx0ZWRfX5PV/GyicJ0/S
 /+PRJzdsOVnoBNF9mnwx8rxepwoA4BfYOPL2B4BQTDNgReQEdyu6/9tOdyp36pmjw4j1Ab2qmRQ
 rZPEvvwAmUcmIw+DY23dH3OtPwjcpDPqTCS/+7txJA7WnAhENu9B1L3HNvN6so6DmoEufKXWufy
 Z8ogrN2OAPbHnc845j6oGkgh1omoqnZwUpyRf9c/Yqx+N7v/NNswMpTCjoLQOJ4Pfyf7nnpMSzf
 8UQEXH9xYUd6XfRx12rjGvhTxKiUt0JxcC3zHabF3IlwM8JnaS5F+hrNw7JQe9Y2ZEvn7Lmw/DG
 pEtyVPZTfAmjesgHF8KQhLE5ixVKyXJAZ0yHWYU5VLwM2Re4ie3gay3TV4QaJIRx44co7KpMagA
 E41QdHLtXkLofAatZKzhlW4QTs3xhAYh5wX83Zch128ECOXW/AG5q55U7TpySusWEfckEUIjc5d
 KEvndi1SWn9QLAbWNSA==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd116e cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=WVtwwdpmd8cHSuz7VWcA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_095719_355029_69CF27FC 
X-CRM114-Status: GOOD (  18.09  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBPY3QgMywgMjAyNiBhdCAxMjo0NeKAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEVub3VnaCBDQlFSSSBzdXBwb3J0IGlzIG5vdyBwcmVzZW50
IHRvIGVuYWJsZSBBUkNIX0hBU19DUFVfUkVTQ1RSTC4KPiBIYXZlIFJJU0NWX0NCUVJJIHNlbGVj
dCBpdCBzbyB0aGF0IFJFU0NUUkxfRlMgY2FuIGJlIGVuYWJsZWQgb24KPiBSSVNDLVYsIGFuZCBk
ZWZhdWx0IFJJU0NWX0NCUVJJIHRvIHkuIFJJU0NWX0lTQV9TU1FPU0lEIGlzIGRlZmF1bHQgbiwK
PiBzbyB0aGlzIG9ubHkgYWZmZWN0cyBrZXJuZWxzIHdoZXJlIHRoZSB1c2VyIGhhcyBhbHJlYWR5
IG9wdGVkIGludG8KPiBTc3Fvc2lkLCBhbmQgb24gdGhvc2UgdGhlIENCUVJJIHN1cHBvcnQgaXMg
d2hhdCBtYWtlcyB0aGUgZXh0ZW5zaW9uCj4gdXNlZnVsLgo+Cj4gVGhpcyBpcyBhIHNlcGFyYXRl
IHBhdGNoIHNvIHRoYXQgbm8gY29tbWl0IG1ha2VzIFJFU0NUUkxfRlMgc2VsZWN0YWJsZQo+IGJl
Zm9yZSB0aGUgcmVzY3RybCBnbHVlIGl0IGRlcGVuZHMgb24gZXhpc3RzLiBFbmFibGluZyB0aGUg
cmVzY3RybAo+IGZpbGVzeXN0ZW0gaXRzZWxmIHN0YXlzIGEgdXNlciBjaG9pY2UgdW5kZXIgTUlT
Q19GSUxFU1lTVEVNUy4KPgo+IFRlc3RlZC1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGli
YWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9y
Zz4KPiAtLS0KPiAgZHJpdmVycy9yZXNjdHJsL0tjb25maWcgfCAyICsrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2N0cmwvS2Nv
bmZpZyBiL2RyaXZlcnMvcmVzY3RybC9LY29uZmlnCj4gaW5kZXggY2FjMjNkMjAxMjRiLi42MTdi
ODEzYjk4MDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9yZXNjdHJsL0tjb25maWcKPiArKysgYi9k
cml2ZXJzL3Jlc2N0cmwvS2NvbmZpZwo+IEBAIC0zMyw2ICszMyw4IEBAIGNvbmZpZyBBUk02NF9N
UEFNX1JFU0NUUkxfRlMKPiAgbWVudWNvbmZpZyBSSVNDVl9DQlFSSQo+ICAgICAgICAgYm9vbCAi
UklTQy1WIENCUVJJIHN1cHBvcnQiCj4gICAgICAgICBkZXBlbmRzIG9uIFJJU0NWICYmIFJJU0NW
X0lTQV9TU1FPU0lECj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfQ1BVX1JFU0NUUkwKPiArICAg
ICAgIGRlZmF1bHQgeQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBDYXBhY2l0eSBhbmQgQmFu
ZHdpZHRoIFFvUyBSZWdpc3RlciBJbnRlcmZhY2UgKENCUVJJKSBzdXBwb3J0IGZvcgo+ICAgICAg
ICAgICBSSVNDLVYgY2FjaGUgUW9TIHJlc291cmNlcy4gQ0JRUkkgZXhwb3NlcyBjYWNoZSBjYXBh
Y2l0eQo+CkxHVE0uCgpSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxzdW5pbHZsQG9zcy5xdWFsY29t
bS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
