Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E54C88E66
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+HjN8GfK/EkMmjM8gayARvlfaQ1aixt4aCt7Ynvc4I=; b=P79rFLpZ4yoIYj
	7wtt4uY9nshAjkhX7OTXbYanXjcJSP6vydlEoqQ/sDe9G0ZUZ5EZnez2VZDvEZHmRE1x4yOzsRu7B
	DazNcodJ7DNAl+T8cvHl/ka566EMLtubkS3Opahdd6uykbxVsiWVHV/qQNypRbQTb1sS8T34PO5yL
	LYysHMrw5VCwKNjAaNzx39PAwpg4VQ4JEVX78JPEW3MpsnFDYtAjaJxUEqhFHDaeZr63FdnqSNAA2
	ZSiamjMKImmvy09wbiOBFyzBVbproSVGG5q80uHL9/kF3FSmGADvj0XU0LbN0oqzTjU0g1EHD1aM7
	laqaQAImuDJdt7RtpbBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lQm-00000001inU-3ipP;
	Sun, 13 Sep 2026 14:43:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lQk-00000001imu-4BR2
	for linux-riscv@lists.infradead.org;
	Sun, 13 Sep 2026 14:43:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE0CD51434667
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 14:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=; b=TSL789gOq5pq0OEL
	mPpWLg8wu0wB4YS2uFYCegeGt0/9p97h9+jSfsJdXCmgTPtJ7eYDLz/ZGByhHbrV
	fyeKvqNV5vVfi4biBdAR/LD9wAHgaGvrnWkWgsOVKxqRM2ARUf9O8zXiKyIDDILu
	D3alpKxJrW2fK/eOL9u8U1V4b2/fNsKx3LCmMeN+kGGUi0HvZlWdH3uAJa/JuMBi
	lxcTi2+svJcxw4glr+yBX2XKAF+qMeR9NpMwwDoLrI9llReJY3vxfzP3vSTBGsZL
	QwOL8mO7Etmg6A4jHUjI8UxmTIwnuR6iyAQtNlWgd2gmdXEVhMnkngiAoEBoHNXW
	LU9cGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3hga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 14:43:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so5389622a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310613; x=1789915413; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=;
        b=jrYGY3WfMpvBFoEgUW7U8MaSBjZbx4RMElea63atFJgvtAT1b4/srAv7fRzN6dazws
         yfVJV/spfW85u5K4IRxR5t7aGKokKYqoWvQ+sKtx5StptI8pvTfzdZ+QbW9VnZA8il+e
         079s8s0zwqZhihENbpqr1UNJIOBAVC4VfM6zJ274oXKAOrK/HTMt7n2yWKxGA3wIkOnh
         SOusvAz8yVijdMIiDQVhhAlTniCmYmuWr2KhlwBX+fP8UAJIR8iqAbdbYjZIWkLa7uLe
         KMbMduxg8yS+FtWfOW6PXvqM22DONqbLMgVBbk7w6iXO8svIfoLHnqgwcgZS/atEfeIa
         ckEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310613; x=1789915413;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug9C98lp7dxvXE0xHoDWZuW7wCnDxbIOXSGXdFquQ9U=;
        b=S2/6cFyxmsV4A54eLCMrtdUwEf2UUFL6rkjgxGB+oZJswpiTHrbFL3QRMBhGoM1uOV
         JG7eE+XP2jgcF4eOOzIF0kF8dPjHMunC9biXNS9SCVI1T+Mfbaklx6spBqq+FPlD90Ba
         bQYzSfkp+14E4+CjxMzlKdfsu+GzTeoKFkHLlE04dRO+gh1jphW/p4NsEM3x/E0QB3yV
         UnSYhd/A4t8qIzWhoSJTvAtw2q/wRHh8Oh7Cv4zFe9Io7QgLBnwAd2O0tMHKztSiflSy
         lLe2rKtByJj3TunpbOldxaXaNRQw1jV8jqTPznq/SKMAcCPQgrDXMdpwPnZuafZ4XEl7
         9YVw==
X-Forwarded-Encrypted: i=1; AKwUvBw99SMsVSlbPPo/uoqKpN5VYLnT7jGiHxc9NpFQGMdWSOfTmHmUNgyfZeQOJNsDRbESHZF9+uCOFplhAg==@lists.infradead.org
X-Gm-Message-State: AFuF++n8wzOqiYb1pdF//mblhhhQgPjzIj/b518RT6GNX4UcI30Xy+Zi
	eji+ZKUIKWBKNu1nmcq9O8EMozK995W8DZE4VvwkC0g3Rp8xs4DUtY7J2d8r2v+UFs6xJbtPJzZ
	aOGuhWadkeBnYS+99+Xl6oZYeiHBDos/bw7QTppU1Mv5Y8IqDIUyF4gqK7IeSmbTXaGZuLr4=
X-Gm-Gg: AYBFou3ZR3HzushbIyWv15c9SDX7jfGFxAYFnVWCRtZlkq+2EAFJL4Eiwm6F4MFFuYh
	8jr6BywqMx7nyRPrAaV/2iUYyviEc9LvG3bwWxg40fSymDrV2GMNSr30bwPTcJiPzlUEZTIwFkm
	fkOo4bkPG6zRmE2SlP9zlw9DlJyiRv4lw+8rR/4v+MEZNydZWxPwjTjEFoHHbCxBnMa9pyykMVC
	zbMxHnHl/cKDE7ipVbMWJGKA28TK6kSXiDGCK9UsjKt0r3HGEsrKKLtzK7DHagbT0vElshd55DZ
	jKoYNbt4v9VVY76vC6pE1HehWaJDczefn10C1taaElWwh4LyfJ4ON7xrSA==
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr21935964a91.25.1789310613402;
        Sun, 13 Sep 2026 07:43:33 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr21935918a91.25.1789310613011;
        Sun, 13 Sep 2026 07:43:33 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm16780590a91.14.2026.09.13.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:43:32 -0700 (PDT)
Date: Sun, 13 Sep 2026 10:43:28 -0400
Message-ID: <c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: Re: [PATCH v6 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
 <20260812-rva23u64-hwprobe-v2-v6-11-c985af3256b8@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6b696 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=0YUHzDklBslsgzCo5oAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXyDLnNdTeXN9V
 N3MVpFaTGTYCd1rwh3AoSTk/25CF6Rfcrz1IUmf2UUrWrts55OwDIOCeDzyd8SeXUx4JgK26PoJ
 IhNl1FP4pW/4791kgTtDlbSzmOeNYGsBcoGMrql5TqI2ylxLxQnj5c8c0w0LsOYKU7sAMylq94d
 g5ZHYmsAsoJbSBAhU+ZA12t6puDLDxD7haBef4v0MYN6ixvcho9WDPtxAbZFNiIksjR4wLxOsA4
 fpmVDan9+5QNsThyhqCTEd1p+Q72x1xD/U0X0G/+S8Zce8ieyRX7La/yxL4yDyt7yI7TTd9VcVX
 D8gZCV+XXnt8xbfbQPoSiISNLl0o9wQQ8/EFk/WmfBAx/iPxiCPQhqa6tDUzVNc+04mqbv5CU5Y
 4zqITqaWjVmUkG8Ql5lnIIvhJiU+ifhbN86+b5TOIK0pInF8w8bSv+U5umNdq5JKBCTcg+sai3k
 LLvNsK5kpzsrbpgtgDw==
X-Proofpoint-ORIG-GUID: D995KoIQD3Ly9OFVlo6zU55dEwcAJUlc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXxNEFLw+NUS/L
 EQHslDg34+ud7lmtBTA/DmBXSxpFPCmtFtc7sID3JFVJg07nRyW/i3L+/oLjFt5GVTwur3H4hPO
 TYyvjQfv3W3p6mevC5Xh43rciS0DwCA=
X-Proofpoint-GUID: D995KoIQD3Ly9OFVlo6zU55dEwcAJUlc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_074343_049664_6C84E0F6 
X-CRM114-Status: GOOD (  16.10  )
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

On Wed, 12 Aug 2026 19:33:57 -0400, Guodong Xu wrote:
> [...]
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 656cb100ac48..a18465e734b5 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
>
> [...]
>
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> -		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		pair->value = 0;

Today while testing this series with glibc's glibc IFUNC resolver on QEMU
(-cpu rva23s64), I found that this hunk introduces an initialization
ordering bug, which affects the KEY_BASE_BEHAVIOR valude in vDSO.

> +		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
> +			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> +		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
> +			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
>  		break;

Both bits are now derived from hart_isa[cpu].isa_bases, which patch v6
09/11 populates in riscv_init_isa_bases() at subsys_initcall. The vDSO
snapshot of all hwprobe values, init_hwprobe_vdso_data(), runs at
arch_initcall_sync, which is earlier. So the vDSO copy of
RISCV_HWPROBE_KEY_BASE_BEHAVIOR is taken from empty bitmaps and reads 0:

  raw syscall            : key=3 value=0x3  (IMA | RVA23U64)
  __riscv_hwprobe (vDSO) : key=3 value=0x0

Mainline returns 0x1 on both paths, so this also regresses the IMA bit
for every vDSO user of key 3. The selftests did not catch it because
they call the system call directly (sys_hwprobe.S); glibc's
__riscv_hwprobe() takes the vDSO fast path and did.

The fix is to register riscv_init_isa_bases() at arch_initcall instead
of subsys_initcall. That is still after core_initcall(tagged_addr_init),
which it depends on, and before arch_initcall_sync. It belongs in patch
09/11 and I will fold it in there in v7. With it both paths return 0x3,
and the hwprobe, cbo and which-cpus selftests pass on rva23s64,
rva22s64 and on mainline.

I will send v7. Thanks for your patience.

BR,
Guodong

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
