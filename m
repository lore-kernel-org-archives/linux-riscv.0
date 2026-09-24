Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105BCC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Z8N6/bF9cZB5GzttGDfdDxGdSWaYrNMGPRyq4jvN+4=; b=G7U+KsB0npQDiY
	c+8TbU6/YXS1z4KdrD03hCnmmvNYV+2gdl5DDAnKFYG5ZIxss62ceyuHSXyfByxS5mDtGgAgjEs++
	E5fTADIvVPdHdHjW8iXYhdJdHA9S+DmLaW2SmiBkFlKJ3fG6pI0pWbnhHC3g97d95pwUqxYZgZymi
	UEaOqk4wzgxSX99Zo8jqp3LSQEVHKqotyxSanAB8TMqG5BgQTj6eZ0eiYkXzIbPzyBsnltlckhdn4
	XrAJaKiBB3igPTH9P9ryKftZKua7yHzWLeNVFdCBgoAapd94fHhcrYF+QMi12+oXLrL+h1rcfK1+d
	956wFjJzbSMlipz6TleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gqb-0000000AkyY-1mGu;
	Thu, 24 Sep 2026 10:38:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gqY-0000000Akx8-1f9U
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 10:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=mIMtj1POMrzw2azIeWBw9wkx7h
	BckJghCOx1Cx/Zex9lJpDXC2ShMCN1YL5E/BWgUjVZi/PFNqYeGcQHbQRPXz68SxOvxfHQIAApdQO
	xhbpSRC8N3c0NSu88mhQ/99XVEyBoj+3AU8TusaY+KM1AJfU0oeXgWgprK2sirTs+WKaX1VshgNhz
	/WcTC+GACrBs9kKfiscJrXNl1GWNW6tAfj9gt5mFnZ2PrkHf26WQA43t+fbwSVNtKQaZFkgYpdrBU
	/0DbbzDQmLQ/gWDN24EKAF5R/J7Xd2CHAk03/kQRNRKCcU7kDPUvDitgpExFL9C5LYtQlNsaXM6Ww
	Q7Wh+eSA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9gqT-0000000Fr8p-43TO
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 10:38:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pg1T1270206
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=; b=Jvz+aEYXV7Apcmn+
	vkfNaEKwF0eu+xAlptFyaL/dkXTPeYDhmrqrZLuhpNAXELbL/lJgXsqlOi8zFTa4
	Q6/qou+pPsUxkWlb1zrNHBtOg+IZKhPqsTr7VgozrgFjRGOebms+0BhhUy3EFOcD
	yYT9yO/vd14VNxVoyZ0uJkkF0f2bI6CYtsPH8KlghzAhoqXbmC581JoG4aLU1M/S
	GZ28uDcLPkDcBh7SMfUxZQ84V4H5EzqkU0kSwH2kU+XWqGxTYsYLrf7FzoUDIwFE
	9ev5oRCIecUoWpi20Z0tcSHyDifoPLgy1JWCOUhmbTLN7ebQueJtmCus/XUcgyQK
	R6lILg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90ajjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 10:38:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso1631936b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246302; x=1790851102; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=eM3HYhcS6osqGsZvGhecP+AHhPWs0snNKUW4x1QEABjb0Qqlb0oZDapXDWuKzTIou/
         b2aDeJyvoYK+RazjpvUGc7TiaTu8r3i7vGfeaU19nB6icTK5i06OZEbQuEqXx/EDJLRZ
         2L2xLQi4LX3MnT2UtSbUq5BFlgYoJz3J6/FQD2dmRT8KRgdEy3TktABwGUBxGNQsnxEE
         PP5ol5ND3xpzw64c0OsK5o0GlIxrVNDMsdAUSeGomOoJug8dreJsq+TrkoHamkAO14a2
         G62deaTgbIGBe9Q8d2u9YTmkVOwGdVUFAf2Vs76/uZF3ERdVSecVuQBtvxYhaWikWVW2
         CmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246302; x=1790851102;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrSo/RizloQR2pl+BpnGDNCY4lNIYPbbQAtFDpAnTZw=;
        b=kDBrnnIc7i2tU+zGOWHEtjJCn1jB6fWmk9xnR4xNd48NqRmEdQf4UPcobUHqJ3pRLI
         nCrAGHEQgkffXRd5LmVl9W1b18oV8ulWvVjtkFUFDEkUYQjSYXOu1rVoBO/Ug4uZuJOa
         ujPvnogTP/1/yYDTTk9ChOtcprp/6JrNjW2Wod45UWtMpH5K8oMuEb4H9qwPR8AE83d8
         DTyNAxliHWlpNH9OaUszEWapLmqaM2SuQ6QsbJQskK23DTPQ5vA29UmnlcFaqiq/AiDv
         jbpYjpsSQopDiqsYuAXGgZEEnEo11iWtn0qKGardYHFPjIaRpn/k2fvczFuRKomEsuCQ
         RkoA==
X-Forwarded-Encrypted: i=1; AKwUvByeBd/hi0e2icGDOcJxQlb32DOUdnHbD6r/bI191ARR1K7L+hzaL8jrfgG5eH/0ALdyt6QflXOcuz/0lQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mG/N48nhtUOkGZVlbfkLWNa/MUkkx7GqOFCWy9GAgDTMvZjIjT
	7+obkArzbw8njfh4iPjWuvNDtBycCee0IBeVMjcUrP8E0cxWEjlduvlkdVSCZb8n3QCqfemvbV5
	IkrK22AY3SQPN4mxxZ4jUcV5ObCbWpcBDtryD0E8QQuMRbdcvTuF4W3SHospCATjhT6v7iGg=
X-Gm-Gg: AYBFou1MJGBTskXhCgF7EVoa3/CkpUYcPpXh87VClERe3ZOHOUdDvNPCex8gYAaPIFf
	fbPYDXNWkonRjaW+xy2/2ZuWOc0EG01F6sYI38j3MuE8gHjcRau0mpIV8jm7B5OdTlm1Z2RDo3L
	TYCHX+EgHXnNPn/EZSzoKh/X5iQTZybXeQT+yam4U5KU9kAdr7jv4PqUCNkloB1xWCNsN/PaXjm
	CiOrif0mb0pzC5D8IQjph8qvcfREXDyZqQZdtbam81s7Zc1wXLVdlBcRu6dcynarjDSjwgYM3Qe
	P+yrMWCg4J8WPm90gpW7xwamh1BKepscq/P0PIvlxv0OkimYOm5XXaL+
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904818637.22.1790246302096;
        Thu, 24 Sep 2026 03:38:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f06:b0:3d3:ae40:51e2 with SMTP id adf61e73a8af0-3de0e75067amr1904783637.22.1790246301600;
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dadae09sm2691132b3a.38.2026.09.24.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:38:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 06:38:17 -0400
Message-ID: <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
In-Reply-To: <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXwSa6KW7cxKJy
 qJs9ZOqYxPlYQ/zYDxDx5Ht6OBT0Qvg3BIknhgG1TB8jskAUS6gcH+Y8moyzg5+P1lhYvBGqN0z
 26qfyrSzTOX1Is0AGkVKQ1imtbUSzrM=
X-Proofpoint-GUID: GuOW5qhdl10MILTOqhDrcCLRFosNffJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5oZpRHHQQgNt
 +GSS9n6bAAyTb+4fDWcx2m0Mew/H333kE0U1XftAbWQH8OJzXX4Vxo+ofQNVvw72pk4oP5cZ50t
 MsSkokhC+M4rCG+otRk7kV8OcyIt7OkZY7rbNxBzYSmAQ+XxUrpFFVCxK14yGHuwNNpmahk+coy
 jPmHYR4fPmxXQvP48fNeyZBigDxokgz3mw6/7c3DHm/g6CiWbO3aiWoId0lGwFDt+6LcxkXVthf
 F1+Id23rnhVSiH5wUmSHIbAZcCAi1faO0UgcF4tZ5zH0VDHlMPdU+Vq+mENRbSYC1sAu4AUYXrp
 +14BFTBFAKW5W/it3HnR/gWhz8153m6uS5mle/8Dt4mozeEC7boGLM6rM7OqWDFrZOQ/C8jmJw4
 LUfxXlaAAOpPHB4Fe3m3quyjciPU4Sgh/EigCo9CdS8um1NsUhHlYBSyxCmlXz/ADg9qwgBJ4rc
 Jy+EGj6mG2I7f3sRCIw==
X-Proofpoint-ORIG-GUID: GuOW5qhdl10MILTOqhDrcCLRFosNffJd
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4fd9e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=TMGBcqugHITK_y5VCRUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_113830_554832_EE4C8D71 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Heinrich,

On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
> On 9/20/26 09:18, Guodong Xu wrote:
>> [ ... ]
>>   	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>   	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>
> Hello Guodong,
>
> The RISC-V Unpriviledged ISA specification has this description of 
> extension B:
>
> "The B standard extension comprises instructions provided by the Zba, 
> Zbb, and Zbs extensions."
>
> __RISCV_ISA_EXT_SUPERSET would imply that something else but 
> riscv_b_exts is in B. But such an extra seems not to exist.
>
> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further 
> change may be needed to set extension B if riscv_b_exts is fulfilled.

Thanks for the review. Intentional, and the difference between the two
macros is whether the extension gets a bit of its own.

__RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
the name only sets the bits of its parts. That fits zk, zkn names, which
are shorthands with no identity of their own beyond the ISA string.

B is different: it is a single-letter standard extension with its own
misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
of exactly those single letters, so the kernel needs a bit for B itself.

A is declared the same way; with the spec defines A in the same words as
B. If I can take that as a precedence.

IMHO, "superset" in this table means "also sets these subset bits", not
"contains something extra".

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
