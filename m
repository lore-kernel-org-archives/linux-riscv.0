Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B3CA5FD9
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cu32DpYQThetVUR4p8O3jJu5T/HNUyogU/A+YWnvP28=; b=c05BKkN3g/cgnd
	Cz8FVvl2I1l3W9TxIVdpYvARfp0Do3spmsJszTmII2uj+CahST9ZyEXvaxkz/31s3tZdlBSYiB4wt
	hSdILUnkJwIayoQIMY0HKbi6Y6NOL0VuM0E9irIZSii3dZNbvAhJ9ZcsznH5gSwoWJrytbfgeJfza
	YcD/TcK3qFfFVbtBCNFWxyWXVkwBMy0VEiZLp19l6qzXdzYqN72WOauC4h8hqMh308/ZwieGYeQGH
	b4bHzuLy6YDXSkRC+V5o6kWLMnpHzMdqnHkSLkxiZ1DDUGoHJ0KEY1g7ZId44Wc5K9ELnRlvMKpAQ
	3Ix1Ovt+ANTwZd2X9BUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYpD-0000000B1HT-05u5;
	Fri, 02 Oct 2026 08:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYpA-0000000B1Gy-2YxU
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 08:41:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925j9Tp1543458
	for <linux-riscv@lists.infradead.org>; Fri, 2 Oct 2026 08:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=; b=I+XTzA3+iRDxGOSA
	N9/9ZBRzW2HXfCTAgVwjZe24AnIhhUaKp0G3zfrQr2YFnpI7ViDv7Hi/7K+dZAEa
	qbQe6bmSKZn4Bns3FZ9pNcVJN1//Exrhqp+t/1dW86qQNbMc8tJcagKBjFRPJ6Ml
	yiWGxKiVSEVgdWizKlR+BLNaoKKSEFW4wRLsT17wMMlXlCKsAaXmhDKxyfg3fe7+
	8VPCDHi9Pkr3imA/unPMcsjZ+R26yh+te1hedKCneUMgWYvRzMYEQyjIqtsiOWb2
	Xx1onrV3oEtZv31ruToPiyZ1ZNcVocEtN9CdCbcclX3ZfHYMwAYVmKCFHQ9kv5LH
	vl3JVg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mrsjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 08:40:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d95d6e08so557659a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790930459; x=1791535259; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=;
        b=ay2ctRXsu8IgGxnhzaHi2ubykSmLARq7kD7pCcV/eIEWOYIQX2zHowxXBFzlNNy0uT
         SnTU6TU2ahqftPfuZeIW7mmCl4qL0qLKiuiAvMFmemZ4L30pWhB6M5GXgm9V90aHCBXA
         ytAKblzALH16miwr+LWoY4XPlHf3e43/zEXsGTFpXxew1x6GLcTLAk+g7uJzy5qtuTdu
         Q86mTvnLL1JqKEg9HPlQTrMj5QkRsBA/HujUyYOWqaWeNKGkjiIE+kgkJF4UVGaomI13
         pY69u9hPz0h9SK1jbvXa0NXhYs6XhkGX5b35Lmnq2TVIaAVVTBg7T8ALWWMA4/sh7jpW
         PjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930459; x=1791535259;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRt1xEPKkLyIuVd9CabpyHFvvXu/eoMAADR7BossydM=;
        b=Jn1w5iG5U/Jte+YsoFPAJgW+W+XAZiWpvAA112FkOga2aTQy9Jkmer/Gr2UtueLWqY
         1jPEqxT2xXoTzDwXJ6+AUhZAgdM+zz7Q2sNqaf8rk+JfRO2/8trMSRZvt35EyMslfufs
         tHAunsaj9qIAyt+mEzgzJlzUBghr65IJMgzCsXyTmjQx2vHDoVXpiXk9+kbgsuh9CjVA
         eh2kOGzrJ78lAIY4HwY3RgfIOrGZuLr0ZZMwn0RMEmAh7KvZIEG5f4uNv33Of7lr07N6
         dT45OMmvH0DrFCjY18La0RY5M+HmhjWtJJ1/2P0TS09O7lxO7ed62F7srVDo2PIgK4P1
         UVHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsYr4AUFgiCN8gKmltZmcEo1LNfilv9v+lCSBlCImBc1sQL3PbkPtPw7rZ5Mj8iRK/jY3ifU0LZ0cZiQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKz4a8W9NnwnB642CNrcOeHWkWbvzxPL9pJWzA5muSLaOg+INCy
	ZLJA8pQQYi9aZSZ38eiknJQeTjiKtmS/ZyWC/MRCw2Ukw6I11x1GFuo9cDT9vHz2YfFNcaTZhwX
	zhHqsFGbQ53j5IG5gn7epR3SzvDmacoeB8tzU9DXdTf0KcXAiYqjnQvSzveCGZ2yIGi6KeqI=
X-Gm-Gg: AYBFou0fe5v9ubxPbHBYV9Hxe4lcCBg6SNp8a6e+Z45HwKPoK9tVTDYYVLBuPcSePCe
	O8dHo7OgXvQnsq+i15mJLkyNNPgIrZ1D5rTAD6eFJDTc6S2p6HTHGKxuaFJbtDy0A1hyvXrXUgU
	7gorkq9u8zISRMGygadMRyfTfgv8p28iDs5OqhHl7Puw7IXzPyJO2KTxJdu8zgtdWm6yk2IkiX3
	fg2gSdmU9CzQcgNV2A4dXER3Cce+3kV83j31FdKLUW/9fl1xqqMRJKloTRAmLXePTx1wLQjVDlt
	nmi6gAGkTB7rp8W2aFFLBFacNETeZ5ay7fXJYGwycbslomk5BLuTLuVCmnEOgwvu0fqpicTec2W
	FZqDaygeaomf8
X-Received: by 2002:a17:90a:d64b:b0:3a4:6f87:c0cf with SMTP id 98e67ed59e1d1-3a6ce84bc31mr1544724a91.53.1790930458850;
        Fri, 02 Oct 2026 01:40:58 -0700 (PDT)
X-Received: by 2002:a17:90a:d64b:b0:3a4:6f87:c0cf with SMTP id 98e67ed59e1d1-3a6ce84bc31mr1544697a91.53.1790930458256;
        Fri, 02 Oct 2026 01:40:58 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd59187csm3397134a91.10.2026.10.02.01.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:40:56 -0700 (PDT)
Date: Fri, 02 Oct 2026 04:40:53 -0400
Message-ID: <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: "rkrcmar@qti.qualcomm.com" <rkrcmar@qti.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
 <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfXzzeod/1UHgz8
 oLX+WbVT/XLQVYt425vShz1gLcGXkRY9V6Nco4YRKp3CzQsOtKyIbBBLWKjHK8ZzUfL2RFPjzAs
 agD6YxEaP3IQxblI5iNJYbZ30vaAGXg=
X-Proofpoint-ORIG-GUID: XyEjnny_SltSbTK98EDG2_yHg8FNyFH2
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf6e1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=9U0Ts4Z4qhTHMBCqQIgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-GUID: XyEjnny_SltSbTK98EDG2_yHg8FNyFH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNCBTYWx0ZWRfX6sflMYKYt6Ui
 4woKJ1xA9FtbJXRbFqURfyMGFHOKbKmN6BUOmoKE8BsuD8fD7NV+HoQvt8EFqtJz65DYoCzsE7Y
 WHxTFATP8py7rsVQ2o2KHG0kt9meW9SZh32i32ijSjKCa2qYPBZEOkUrgRiryYLoG03wdPpBs1S
 yVS59kI+7F7sREiknc8+RrT4a7HUSNDbG8hPxP5y9wrA9tIRmaiTri2hH/wVJEWe9IF44ZDJHf/
 DRLgNMNO8bj1ujKOaUGtooUkYCFnkK9JhGVMG7Jfud+6YH/1GU7WHg8V6rZ/+UrS6k1tpTOGHlb
 3+P3D9Gc3cr1/qSruIILZ2mLLHDXGitWCW9cCJMGPSCI35kWrkT21tM9bnYyOJeRtq+GtD9G2l6
 ZEfR5q/usS/3JKCHgk+RbKG7APfiVi7PbGDKR3gxde/v7kN8kF9hgka/CCuQgBFYS1Q7sLP+c5j
 qwARkCDRgRMgPVG+xgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_014100_687267_BCE2B540 
X-CRM114-Status: GOOD (  18.95  )
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

Hi Radim,

On Tue, 29 Sep 2026 16:00:22 +0000, Radim Krcmar wrote:
> 2026-09-20T03:18:31-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
>> [ ... ]
>> +	int cpu;
>> +
>> +	for_each_cpu(cpu, cpus) {
>> +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
>> +			return false;
>
> I think that extensions like F or V might be present in the ISA, yet
> actually disabled in user-mode and this loop would misreport that
> RVA23U64 is present.

Only V has a way to be disabled by user-mode, through
prctl(PR_RISCV_V_SET_CONTROL) with PR_RISCV_V_VSTATE_CTRL_OFF. That
interface is questionable, and obsoleting it was discussed on the
RISE Platform WG call on 16 Sep. And I plan to take this to LPC26
next week in Prague to see what the community says.

Besides, since you mentioned hwprobe_isa_ext0() below: actually, today's
per hart hwprobe_isa_ext0() doesn't honor that prctl(V OFF), IMA_V stays
set. Refer to [1].

There is no way for a user-mode application to disable F/D.

> Is there a reason to diverge from how hwprobe_isa_ext0() does the
> extension detection?  (has_fpu() and other global checks)

Anyway, back to the RVA23U64 isa_base bit. In this design, I mean to
report the per-hart RVA23U64 base, which is derived from hart_isa[cpu].isa.
That bitmap has passed the validate callbacks in riscv_resolve_isa(), so
it "matches kernel configuration as well as correct extension
dependencies".

There can be a mismatch on a system with heterogeneous harts, where
has_fpu() is false globally but this particular hart has F/D. On such
a system Zfa and Zcd are still reported for that hart today, which is
the same mismatch. Same reason, because Zfa/Zcd passed validate callbacks
per hart.

So the isa_base bit RVA23U64 behaves like the per-hart keys do today,
while IMA_FD, IMA_C and IMA_V at the top of hwprobe_isa_ext0() are
host-wide. My take is that when user space queries over all CPUs, it
gets the intersection, where RVA23U64 is not reported in such a
heterogeneous situation. Per hart, I want to keep the kernel config + ISA
string truth.

[1] https://lore.kernel.org/linux-riscv/20260725001614.2578617-1-tchiu@tenstorrent.com/

Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
