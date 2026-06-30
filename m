Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B00C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAlyGH7kGSS9BrarWGCT+bWk5eyrfHldZVO0F77JV4E=; b=fkQwVFdztM7m8e
	6Z47a92Qd7dkkB57Jd8QP5sLXPX5JH3+afUb2KE13KwzgN7On5K0n3htj4eTAmMB/X1LUQquJ0p4q
	KA7kUlvKl1f97k0S2tHcL8UGKV85tZnNnLSGW4pQF8IjF0oTiHedsUKhoNTj9cPqpIqf0WXk7v4QD
	5FDgeNKcC9fZw0rruGBH6zLUH6N+S25gTg1JkOCRefKthY+JIUWflza+Mrl+57goYIM9dQkxxuDYR
	SOGPH6iE8Mo4L7rSVFiUM3wOaHB3Mqxcib5NWVxqVsC1FVIiNH3xHbz1dP9/ZUDi9JbyDp8J5PXQy
	DgDjnIX2C+C9nXF1EOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webaz-0000000HWB8-2AQL;
	Tue, 30 Jun 2026 16:46:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webau-0000000HWAN-1AX6
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 16:45:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDDTf2213505
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 16:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=; b=WlcIYofd0TKj1RFi
	Zc7FOeuvtbaXqFV9DaLqiXBNIcqumqfqD4GexonA6tW3Huf28vM7ZG8fNFlHXGRM
	/npCa7edFxUWcfiDgU3Ljty3RvtQ/9txAzgk7ERROWi9mjbYBlnHxVi3JiAUbVhA
	xoGOQKy3Dk8AKfdwFb2YON7dwiQ+JIc70Xbh8vkDqqmQKaocD2PCgYZz8NLo5jiy
	BT2lvL9UTToezbIJ/nv11m7nB9c1hS66R+K4j1TVUtnrWAJUa00ZyEIcjEhYSBLi
	xTqPoJNEfotMTYYGR7IkiyyVuZ9ngBZR5YlbhfI4T3zToGCka+FT1sKo5tX6S7bX
	uTJUmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fkb94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 16:45:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so527080085a.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782837954; x=1783442754; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=;
        b=TdF+rEhHvpUPF0ocFwbEJOeyWYxyugBTXHJmkODMuj+jGzCLh81uYSO5DpFW2026ue
         PY6dFN4WuwObNKw+to25fyabXWDMj2m8moTmnjemdgkL2qw/xkD9IDqECdFemHvOAnV+
         CxW2P857U6rpJbOd08vkn5C9RbKTjN4aJXgyrsvInKmaT7JbfWv+A++ESfkuzeznMiKP
         phtczU1fYm0vc8v4QooJpl+3joAwb+LMIadZZV43xr+SkoinJE5+qAaUdma+OO4Po8gb
         5oInW3YBE7Z9A3ORLwHgWlUhIqiCjNvF9cIHp6b2SIAddtbCEUVASRoPE3xHUC7WypF7
         yFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837954; x=1783442754;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=;
        b=df12nYxySurcQPLV72ak6P6HCQeqrX7gMR2K4GSR8Bgz/95oRlQOjMWdX/w7WPlVb/
         s3t2CP+rhtOaPPJ6Oq0at/6BX5ft++2YJYCO9HLTXtZhbMs1xO8q/9JvkZz/EDb2gNhj
         COhAG9vNC4XBNOxclGRxmPBl/tYObqoNMTMOTj8l27vvsUA2BhlkTf6CYP3vDzOvixcl
         BFdWI4vUpVSHYI/4S+rfEZG+D1JFbNS2QluZ/Kl1uTNsuT/SfIHB+5pCa1zmq5AIANBg
         VtYg1ULlm9Uy1eQ8gov9WH7O8QNdNbwuC1sOakB/8m55/V0CZSHwke1PufeD4qAoZdpv
         eyXw==
X-Forwarded-Encrypted: i=1; AFNElJ8rlqwdxpbWfThORcYiFq9HOgEWqqTYPpfkNImJSS/ydigri/UHtyDp99lO62UrhVgUrFPIeJ4kskwAqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuy/8hCLrPJt6BCn3i1Sk/+UQdZxxNN/xpeceO2vVoah43t+D3
	QztrDGXQ+IDX0IaKJBujCZRtzVbppdQ9ExFk/rqCiHlckBhF7IDVTtSYhor80YHcbpiyXQIKJXN
	cyfPT2MGMI6EIlrniBpvkz6lW4f0hqKh9J9NtoI5R7lw/ipv+BwHEpJAGoXka8wQ5zSHhLOI=
X-Gm-Gg: AfdE7cmeKqNxikEvKMcoLIoJ/XiLN/QiYBQ7iqCQlz9D5DmqaPGHwAVpkS8B3LcV9gO
	b0Ffucn5Nec35N8S3hHfJKu3QTJgR1qBTgyIFvaVK5sgfiX3W/V1QwvvHHatZKsdh6qOuHWvrdT
	AMbXlgoarJ4dct7QKDXtWmc45dhPdVO1PHR7IlNKs80Cd8xm21alfY4QqD5xufGHIoME9ExBGtA
	qvGOZMslBKKxvIU8OfA9bJAEq1zt4SzuejxqQ16SRZPfIINSW1/ZNKQ8nGqiXShNW/z8Ifb9nq0
	uGZrXx7CCBOp/dRd4c+IjFVeGFsAiTxU87yoHTfUFu+WuzUgmoH/bwUrzd76wg41L4HJjmiNNav
	V3T9qql4ulWcDSNKAGeDnXcOOx2pKSuwBVfCsZeSkTxhuqYg=
X-Received: by 2002:a05:620a:2894:b0:92e:5028:dbe8 with SMTP id af79cd13be357-92e626718eemr717534485a.21.1782837954394;
        Tue, 30 Jun 2026 09:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:92e:5028:dbe8 with SMTP id af79cd13be357-92e626718eemr717529285a.21.1782837953875;
        Tue, 30 Jun 2026 09:45:53 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm153934166b.38.2026.06.30.09.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 09:45:53 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 30 Jun 2026 18:45:51 +0200
Message-Id: <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/16] riscv: Introduce instruction table generation
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Nam Cao" <namcao@linutronix.de>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Conor
 Dooley" <conor@kernel.org>,
        "Paolo Bonzini" <pbonzini@redhat.com>,
        "Andrew
 Morton" <akpm@linux-foundation.org>,
        "Shuah Khan" <shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1OCBTYWx0ZWRfX5PZDJkQurL3Q
 ril/tPSPkVw8VLvf3B3wkLF/lGpCfAr6ugKuXFWfpfETk/ru7N143V0tlmIB0+UAlbCy0uEFptO
 17kX6GidrfBpI6Zut2QH3aySzyUsdf1Mss6e0dCn4fC3kcZelTKYS8drQmkPWbBen1LzG8+qBAr
 0AkI7/d1aS27ZKmkcdLiZbJ53aMRr1HGvgIv+SHFiY6MYRPTzR/yh0oDS8gvS6iUxKM7DtBGrGT
 X+MyOoTF07DYUdQONuw6Y5CzulMnGUbLg0gTZAIm0fVoRR4cjjPQp+nSuoqUKa4mVX3rbd7tFaJ
 r+gtbwudzUMKGJWBV6xLSOWfvbBaI5lymaVdpWT+QX3pRr6MnjG12H6ThyTJaiee+95gj1du9Y/
 Wv9ugV5tqEM7YXHDj5tXPvu2yWOdIkG0unXRW38SoeI/tFng3JTjaU5VNv8v7P93Oy6vQV7X2KJ
 madggNu+1wDgYi3QJ3Q==
X-Proofpoint-ORIG-GUID: NwkxasUVP3_9G_DVF-1YL-9SxuauW7So
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43f2c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Hg8iMh3NijzzsoxLLcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NwkxasUVP3_9G_DVF-1YL-9SxuauW7So
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1OCBTYWx0ZWRfXzDJiXwRW9I34
 U9/vtHtPhn8UZyB2zJHnB3McvhsOa+L64daaV1dGd3X30TjyaxzExenoxBphJjey6v3Z0VFbgQK
 cW6X0vRkuWOAzzGjKkHjZsnZz78AT7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_094556_317667_56B9309C 
X-CRM114-Status: GOOD (  16.73  )
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

2026-06-21T21:01:19-07:00, Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> Eliminate the need to hand-write riscv instructions by using a shell
> script to autogenerate a header from an instruction table. This is modeled
> after the syscall table infrastructure.
>
> The table is generated externally by riscv-unified-db [1], but is
> in a simple format to make it possible to use other tools or modify
> manually.
>
> [1] https://github.com/riscv-software-src/riscv-unified-db
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> ---
> diff --git a/arch/riscv/tools/insn.tbl b/arch/riscv/tools/insn.tbl
> @@ -0,0 +1,1392 @@
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
> +#
> +# GENERATED WITH https://github.com/riscv-software-src/riscv-unified-db
> +# "./bin/generate inst-table -o test_table.txt"

I checked out the repo, ran the command, and got a different table:

> +andn common 0100000<25|111<12|0110011<0 xs2=24-20 xs1=19-15 xd=11-7
   andn common 0100000<31|111<14|0110011<7 xs2=24-20 xs1=19-15 xd=11-7

I assume there were some recent changes in the output format...

I think it would be nice to use their latest format and also note the
UDB commit that was used, so it's easier to reproduce our file.
Hopefully there won't be breaking changes too often. :)

Thanks.

---
Sashiko seems to have noticed a plenty of other issues, so I didn't
review more...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
