Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B5C88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 00:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+w0zRf8yp/N/E6MJiuD+229zD3qopBYinGaFFbJB4A=; b=ELUPGCQoPoVMhZ
	7wtSFuYHB2BZR5J/ZVuei3ZK20wDrFi39myNMHAs+yK41ceyxfP+ets8d3tVvpWCSSo6PknlfJv0e
	yjQTjkpFhMRcbeIl762rtspOyuYtGJNbq2bvznC/6SqkdeLXrSht8wXbsDYkblJFfIC/kUAkkXXlB
	oO6ik9F1Qc5bo9+6H2+u5baKKOBpdExmzagD4YXGY37ZYC8peU3f/RyXRmvXqLEvLRauZ5co/wqqs
	6AAhDrAvWWGUo6bKyuumwCQEhIiNCn7qSYlH3c3QRMhclmFE4ZSAaQAP/VpqV3fJMpgVbdTa2rx9/
	obYKZDL7ajIiTgzjhBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dz4-000000088c2-001K;
	Wed, 16 Sep 2026 00:58:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dz2-000000088bk-24Yt
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Sep 2026 00:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=; b=VByryASeWaQ3HIMah/GmfPybbW
	dgifDffzL3yYlLQEIQICgtxYNz9fwVriEOyymWkd8cgBCYu4SlDkouaFZf7EGIhlWAKxoQpv6PzD/
	FNq14agWLzJJ0C8M3SzjmYPxwsl/WZARLabc6IcvZd/kD/HdeIKAzpSt0UocAEr1Obaitr1wP7QMx
	qfPWaoEgl9nZZedfx3K8dCwELLFleADk6/qcSmXMyAI8VxKMjdYK6iS8cof1wyTLgDDXXOd9DQSMI
	Ze8WBao50eUNehN2uSRw4/LbuHNLMlLwxgobGCMiB1gu7OT5EpbYegAKGMo/FVS/5rvOoOdvP1dCa
	gN9E9ZKQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6dyy-00000007MsB-3Myv
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 00:58:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYdZM1668137
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 00:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=; b=at6MwSFeH2UU+Qbt
	avXfJKaWEz3MTEGbhMin+yr+fjN7xJ7PuyP3Hb3VydpnW0zAtbF7e6YevQsqEw1P
	NAj65PoZyRzBDx/sYHq9Os7fA04cm4KSnBfgztumBdzKcKxRbsyeNg7aIX9Waeu2
	it4O/bXcLjNh37LnuIr05HJpwH/+nxPQ3hnoJqyA1hcZv2XBV79iIVqo0Nu1jZqF
	4zFnk6hcdEycTb9RV9PYdXmgG+Nyij7pf7DA/mzWPFyJdePzVG5csnttftzPQQzg
	HSyKR37Ta9zSwAUyxZE01GRJqsFmqGyQkCjevT9g/FuZ5cvpXl5PqNhIVGUieWZO
	WF8BtQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc36q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 00:58:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so6817565a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 17:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789520317; x=1790125117; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=;
        b=dyyOS4Pt4zexUvTrWs2pOWozjQLGZka4ER+Wy2aTWU3Wdc7WrGYY3Ddecm53YCk/LW
         FToYxvSyBAaL5nGp8t6RxzRM9mtErjRuppN4RPDliPkcPUrv8Cetihgxt83LjJZY0Zuu
         zJSUe8HUCd8+wRo0ZefZ0jbTYV6zupARoCfvh1iJ0habkrNgZ+K1qMSdF3yWXysFl1u2
         VX6vfQSEKM3pFs13eZSJmXOcLl473czZLorP0PXhtHclBcpA/pqXFIdUXT+Pf3NcfMuP
         XJHJQyyxRdCSWvOBuya/SnYl0N+bN6IhnTqk6VxW122dxfbU0bxWmKRdlXeQev5HGluI
         eaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789520317; x=1790125117;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ3DI7FftBvPAGhc+A7UsjCVB7Utq8qEnzmdR09+mfY=;
        b=E+o5uwQRYNve7Xqbgiw1iSO6dyiaSQDHHC0cbLpArDzKvQdcrqpQUh7E+hZXFxSOZE
         B+tgk23bZg0bLoM+eJrIf979KI3S6hkdF0RxMtiXJi6KLqRD/aC6E5HOHJZpYhYcEctH
         EsDQAfSAnIClZx7TPD0ApeaCEKjMp1eyOZyRjGjsLTFaaXXsNRIDUn5f4VaS4Mjtzhei
         mCKh+KeYXi7dfqLEBrwb2ltBFF3O4eANfPj7eawAD6fiH06rdJ73gT19sekvOPCK3TkF
         LZh2gqoyzTdJUNSAjpSI8pAuTYlzkUtfMOIIK4C2BvA3CZ8kH1j7fxOQohf5TE02zuMt
         9ZVA==
X-Forwarded-Encrypted: i=1; AKwUvBzEBxv4BPC1izDfUWAo7w3fG0G3qpDbUPm0caNAQNVNB4KYwgpj9J1I65/PFTthOzcWIQdjTdNEDwivJQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mpqcHoZw+EwEOatwpV2B7lEH79vTUgiFo8VWseDqggLZ23qOEg
	6x7k+WO35axHEukjYA3RoALB50TIo8cee63+xS/+8pXvz6d32FevL6/Xx/ddPNnR60uC4lWUm+6
	6PXejkNQ3nf7yZ4B7HDP3yb1CmR3RDr/JwRKl9JPeROU3qNjLnvz249U4P3PspbRn7cFrz5M=
X-Gm-Gg: AYBFou1fQfUldiDm/F02asRkoIyDW9s6Gj4F1dzNmwjPAxpgLY0etgTayVTIz42StfC
	ENYQNtPvPZoJPqDGPHQY/XClOTWNQn1zHtBKl3nBkjUE66zUFt8XPDQYcdre/32Yci5j1u2mScM
	xebMgtrK27ojGiow+nbxExuJdQul4X3lvKyNOG2qH8mNqWIJAGrt4vtI6YxEVhaXrJKZ6SMpFq2
	TVw74t6ndusGesL/vTLvcMxV+xv6aAftEDiyzxv8xjx+Mim0l2gUbZx55VAwmQtPy/PNPJHbu10
	g5srZqa4BQtZ3D54fyC5I4xvwnN4O+mnLtZyzKt6OaKH83JPSHeCsuC5aA==
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr1568490a91.10.1789520317182;
        Tue, 15 Sep 2026 17:58:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr1568416a91.10.1789520316669;
        Tue, 15 Sep 2026 17:58:36 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1231229a91.10.2026.09.15.17.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:58:36 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:58:33 -0400
Message-ID: <b677f038a23d6cd0572b12053acaf3ab.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/11] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
In-Reply-To: <20260915-widget-defiling-e22497c228cc@spud>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-rva23u64-hwprobe-v2-v7-9-aa35ebd9ae96@oss.qualcomm.com>
 <20260915-widget-defiling-e22497c228cc@spud>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAxMCBTYWx0ZWRfX6zEWegYUH2h4
 dQ8e29iwbrSAlAOqPF8TIEGTfAQcs0K31ry7iF/IK2l4tsDAsfIlykByOYkZW8LeRKRWwBAWLww
 K6+D89FtQnggrlmmcmgFUSNpeK/zCdo=
X-Proofpoint-GUID: mN27HTv4x9S1niUyDyOxCoc8e2DQv5Ot
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aa9e9bd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0WmU45QFm0n7b77IdSEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: mN27HTv4x9S1niUyDyOxCoc8e2DQv5Ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAxMCBTYWx0ZWRfXzUzn5+hMl11v
 53+8jWyUIU7yToLgQUsanLjmxLGsfMDajmWbmLEIbAUWh7TJwbWjYUtQ2DWO1gPK64Cy+TTTe0o
 OHuRPbHB7sfnOyymlpbDaNVoFmbqT4hYUqowYDvdQ2wsbmrn+QFQT+7KV2H3Imk4rTXxbgojnku
 htCBqyBXvt7p3d0KxCVOVI1zf/iHRurUbN+a9zaDVhrJ3JnGTQXXR91hT3VUKUYUQFcBkzYAdl+
 M01GueQjbaLctkwj6ZqLD0+5OUeUT1675Ai/OOqFxN1oz1HVWLHqt12LpYzswaopkBLLmVQbXwf
 9Wh6nmr0MSdUYrYD8+cGW9do8s77gw+5OUqXRRZ9WJL6bewlbUkYX/sTvIH8Nk1OCgJw2L2KxRC
 pK11m8DHFlDCx85c7FwIiH2LU15pcvoNQ6HIEjBpS3+rc/KsTHUB9ATLpw2PZ5rHE2RnSqF4XrU
 MBgy3BrpyDClUPDiF0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_015841_467705_59DD49FB 
X-CRM114-Status: GOOD (  17.17  )
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

Hi Conor,

On Tue, 15 Sep 2026 17:52:23 +0100, Conor Dooley wrote:
> On Tue, Sep 15, 2026 at 03:15:35AM -0400, Guodong Xu wrote:
>> Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
>> (named profile-class sets such as IMA and RVA23U64), computed at init
>> time by riscv_init_isa_bases().
>>
>> Register riscv_init_isa_bases() as an arch_initcall. That is late
>> enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
>> populated have_user_pmlen_*; without that ordering,
>> riscv_have_user_pmlen(7) would still return its default false and the
>> RVA23U64 detection path would always bail. It is also early enough that
>> arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
>> when it snapshots the hwprobe values into the vDSO data page.
>>
>> Consider this as the cache that subsequent consumers (hwprobe's
>> RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
>> can read without recomputing, which keeps them consistent with
>> each other.
>>
>> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
>> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
>
> Something is wrong here with the signoffs here, Drew's probably missing
> either authorship or a Co-developed-by tag?

Thanks for the review. Yes, will fix in v8.

I didn't look closely enough at authorship (which I should) when I
reworked Drew's RFC into v2. His Signed-off-by was carried over, but
clearly it needed more careful handling than that.

Rechecking these three patches that came over from the RFC (09, 10, 11),
here is what I plan to do:

- Patch 10/11 (cpuinfo) is still mostly Drew's patch; I only switched it
  to the cached bitmap. v8 makes him the author.
- Patch 09/11 and 11/11 were rewritten in v2 (the detection moved out of
  hwprobe into cpufeature), but part of Drew's implementation stayed.
  I'll adds his Co-developed-by in v8.

Drew, please shout if you would like this split differently.

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
