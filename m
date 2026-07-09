Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDBBC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6FpWRckOuF6TyItpxAu/sCHKmSdkBlGfW9Lt81wDag=; b=aqC05l8kA8+rmL
	6i78JLtRTWpv64V2aeHD47PBB5Li06XCWHgstP+cFzVquGox0YUJBmGWnk0pcmdYsO2zdaU+Sxsnt
	MHt8gpB20ypwLq62tQy6hzH6Wk8jPFhMF6FaT099ki+/zHepxjXF2/lhlDwXxvZXHYs6wEneyuI0t
	FUiV4qpQQNo5LQo97fsjZ9z9Ryj0Q6oFU76VSNYOXXumepMVtz4uCsUn500587hgBnkGq2eBlw+MH
	kNhavRlAkVW1SWy/eda+MP9CjOUouRj5rMYBEg3aWHGnh5kHW0XOGlR17EsI7IUb/ksILYIA3hod6
	C8ML3fw5Xbr5fw63/mug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmjd-000000027KK-0JPf;
	Thu, 09 Jul 2026 11:16:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmjY-000000027Ge-34O7
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:16:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxakN1619441
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=; b=ULLpdAqjhcPbhl+a
	9wkFVF2/lY0nTNUibaezE3oRQ6lteQ4HDVcOfqHDE7vtflCsPuubuaBt22suHv5C
	J/GboNexxusvk46SeLD4YSCgJibhGpTyBp7Ew2CmZmE5Kc85FL5xmUGbwX2SNRRm
	AUKTk+C5LBwuGwFJB3/1RH6SX3HPCEtPeI30OoMKGubID5ux/F8g5HbF1COPW79s
	OzhxWi76MMCFcorNKYBBg01ItlLF46P4rAQRFOMzzGhz1/Bz8zCwIh87EUtM9Vze
	DADpxILacbIASbBx5FZNfW6HGEmYrVnOynweeKBYk1Yd0I8v8nqfQQ/58XsDZx94
	8Wm00w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsbxc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:15:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso12259881cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595759; x=1784200559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=gkGZ0zRwByyK6jHOZJyDyA1Ubci/8ux+OVvT0CjddBXFopYpuj5NyCxxAQTrMQRaut
         qhyPoSpuhZARUID3HlOWjCh4GXgqu/Ipz4Ue59KYU5vBGfylwIQZmIvtEDdfpL6g3sAM
         epPI9wdmBOq395eRaifc7YTaO3NsHdsGoXbfWqI70132vZY/b7WWo+Ze/rVfbI78U30h
         4Cg5sHuFAT85vY0eT6GWPrjVZohvUDzEhnDHw13a5VFW7MloTj2O5VaIhivfMx4ujjwT
         MZb6gyK3OxbFtQzIWQW613isB5cFxPqVE4H8DwOoPUR/KN4mF0sU+CHlRcwClgi9u19W
         J/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595759; x=1784200559;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/QNMVWz2zbU62zSNYrI+1kG+0GMg+VxTcjcEiOFHtg=;
        b=Jq8azmR+ICk/tHbbwTWDAefbHm5c1K/zxCf2lML8PNXGedXlUv6xWuEzqKQJTHky56
         A4rOQEgwxldRdWZAXQM3eKIQLAhf+FoWypCDh09cYXjWJS1ri4zMWcl9TsMy0iGTGHDh
         O/Rtx8xl4ffpSFMFiPuDbAfO/wB/wBpnSRAypykgVPRWRhQcrGHoW9+vQxoE03vaNnmz
         qsyxDVUWYzUZvRp6kB1yGS1Tv1MCrVAfTHKYgYVO8cIZ00fl9Sc6G4obK88W+I8/dsJk
         UKrfLtqephgwoDhr3evTKmAOAe9R8CP7AhEt3V5vrRR0G+SnkL3TbF0gjaHuX8YCE/5o
         iRuw==
X-Forwarded-Encrypted: i=1; AHgh+RqS1+0UIFLOFv8fYFyse2b1BKRRrRXcr/0S4SAS+XrPi4PE2XrxJu/Yp79u3oeC975wN7UfoBSO792Iwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+E5kMC9oA3k9FqekY8xs6HN26EfbGB+CjKoa7zKxLVUbfZA6B
	bBAeKJdEt9AUm/gc19NSPiFH0Mn6UYj1YNe+URkXFmgwr6SNdzn6ynGP796cY4f6KfEnOuOvqO6
	XXnud7Ero/FBQgk0YNIU4wgOXYr9x+P6ys98qFJJsVYg6qgsSyxVrvd6oW+cGIIoYkbChCdA=
X-Gm-Gg: AfdE7clBb1mcVoNG7NmFsejBPHHKOIRJr049wB17r87Wjt4e24nZ2AAq6eDQPQCuLQ1
	Q8krtXP2l+0OtHC4oLwyiuMfYN2p/tIVnradN4ixMVs1dT6AoKuLFpiiWM0CpeXnwZsvWwrDw3j
	UlwGE9BsVO+3LuKQ3Wd/CQxVsqUb1QjCQ53yLDlQaBCNl8svAb1sOuN0lb/xx7r/dD5G9e2CwSH
	zGcKjKw5rMb62EN57btr5o7ogMC9hMRT/RbgU4uqU1k+xMv/cAmAYM+1f7h58O0tzKGYBmJWPe0
	Jzd3Ei0GA3qcInucC5mr8CjGjLhSJh7LYYH9nl8NfMzaJEOFLpiSa5J+4h6fZimopYR0IMY2dSb
	vW4oSjJyFjA09ou46Q8Za8uW6EdQ53tnsegvTa/vqgPFHeZ8O96FYtxx6bQNLCw==
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191921cf.28.1783595759116;
        Thu, 09 Jul 2026 04:15:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:1b3d:fe62 with SMTP id d75a77b69052e-51c8b2dbe87mr68191231cf.28.1783595758685;
        Thu, 09 Jul 2026 04:15:58 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm50274140f8f.24.2026.07.09.04.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:57 -0700 (PDT)
Message-ID: <cf26fe68-5a8d-4d6e-b9f9-d69faa8a6012@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.865955911@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.865955911@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2+UJ811CjJl7
 cPKxd2A7mgLMz5taYEgHptsLnGpbFqUbZ5RcVtKWPwmTAFZkknn+PY+t+vAYfDYPuRT5IvmQqYN
 zHuj+IThjlOjzpVp4OJsYyPYqH59O2s=
X-Proofpoint-GUID: bC2w3HZpf5B-A0-m0Erx6FDZOxb1RklB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX1N787K+6OYlM
 9qMEaUbU1KrfHgcKQ3BBKSboNFeRsxHh/ZBsgzPhwv1UAzGhPDH2Ksi4HyAY2HQ8qi0v90Ziz4y
 rAWYMFw96WX3lpNwbzGekE4KC47xx+VqpWG2aMKShjKWHv9t6SLXiw3X5gUwChBbrgQoyDuDNoa
 6WK05XePTUf3doJe6boFYCr174Y9YubNhK0nuJKNtF0xNc7ZuO0xJ+qptnhieEYvUUR3hzu/EcI
 O2FhpsyimnhJiuVzs/u9N73D4MnaPiDgdK79mN/rH0DODXlFDs/8MuKq2qDCUZZZWuVotaSJMBZ
 ytMXsforOdnd6qv72s+dIYReOjcANS0SLJkvoHk9+E2Km/U/iOEVCLPAdaClFGPZR2x3kDOwBJ0
 nH/ARAm9tBzxv3j7fU/OE5h9EwXwY2wVzMWmm6YRVQIVDs66o14UhykchxEu202PN3Py3UqybqO
 ewxanwv62l1Nf32luuw==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f82ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bC2w3HZpf5B-A0-m0Erx6FDZOxb1RklB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041600_900378_CE3C41A2 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy83LzI2IDIxOjA2LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKSByZXBsYWNlcwo+IHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlIHN1YnNlcXVlbnQgaW52b2NhdGlvbiBvZgo+IGFkZF9y
YW5kb21fa3N0YWNrX29mZnNldCgpLgo+IAo+IFRoZSBhZHZhbnRhZ2UgaXMgdGhhdCBpdCBhcHBs
aWVzIHRoZSBzdGFjayByYW5kb21pemF0aW9uIHJpZ2h0IGFmdGVyCj4gZW50ZXJfZnJvbV91c2Vy
X21vZGUoKSBhbmQgdGhlcmVieSBhdm9pZHMgdGhlIG92ZXJoZWFkIG9mIGdldC9wdXRfY3B1X3Zh
cigpCj4gYXMgdGhhdCBjb2RlIGlzIGludm9rZWQgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVp
eG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJu
ZWwub3JnPgo+IENjOiBsb29uZ2FyY2hAbGlzdHMubGludXguZGV2Cj4gLS0tCj4gICBhcmNoL2xv
b25nYXJjaC9rZXJuZWwvc3lzY2FsbC5jIHwgICAgNSArLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6kgPHBoaWxtZEBvc3MucXVhbGNvbW0uY29tPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
