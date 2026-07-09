Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CD9C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9x4iMUQ3riImBsibIc8HhWFm67flbxQ5+lLDLIgxIE=; b=rB7OlEP+UVHXDk
	H5Rt8N160ce0+mAI8b0E16iek4/D+ligWbMMWdcYo8LUV2ppx4X41E+YHCnLi52RFz5/xakpnUUem
	9HKF1mIdvD6fHULF1WiE8XywpYqcBdsBgKSu8t6iAaYXHWnlnP35h/bRbi7C6gnhA/X8XuamWnWM0
	XnERaIwzq1UW8eeb9KJinldbybuB24uUddJr3Vgi5ggbev89dFWPfVvoTjN+qSlEtyuyBuvurkNIk
	7ls2e7EKUw/qFRz4Am5lL27SVqjTKsH/cklEjWysBWoqjoJMu88jlaM3BzxAWZsxwz2qTdqz5cUnS
	n8hTPxe3zb+LMVrwWNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmk2-000000027ZZ-1HhL;
	Thu, 09 Jul 2026 11:16:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmjz-000000027XC-2FCD
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:16:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax67x1570919
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=; b=i6Z+l6cz0ADxMir5
	PP7gquUEvOGqieG+lf85k6tqb18XN99Vb/XbQueU32Nh4DFYdvrk7j7dFspHsXdS
	Cy7w+CsZ/lI338HKy004q1RoAkSXUYbZGedzGtf6/R1/0ogaog7QiT/r0AH6uhhW
	EGub/EAkoHwsQwiSwXadb/oYPAyoLb8nSMPbvA5/LtqwV8trHzPhgOS4T3OKYTVp
	y5/p6PBjRcCgw7xpwdmKpUFT5d7kIO23k48hxSlZ8uRGHGGnWe45xji+gjzdUnc9
	Wyi3IdVy9kYk4bNta4UN3ybii4hmT7hogdBdgOfzXklVyIt2UwzF5HAMNiWsF/IF
	edCxbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq348n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:16:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso18449751cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595786; x=1784200586; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=dRvZk4vC2hQEd/7eCjIOOrXm/MEWVOnnjdbFTLxihiHkjuWdhVu25tjiQwWIfwiMWa
         fNSkcZR/Of2Psr2O+mfkCeP7fJT7wDKHS7tBtxiOd4R1xO0ih4rbljuOLlSKApSQvkrE
         c88w56obiTK55QvVCheTJk3jPmv2E5cYPFNVGKtwnbl1JsJh0bXnxXTLQrMh7TWF3KBk
         hZEwWl66OHceQJielw62MJleMqPRMoElMy+n4lLy8vkS/mDIXhhsxlL2V14w7RZPrZfl
         dbaBeot08A0NIiTmrnhzLWRaQn2Hn/nfptedjYHqbZGd3yRGu7J5U5L+LQZpZP0xz7Mf
         ZV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595786; x=1784200586;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=NU+wcJ5mSKpa9I1XXburZDH2ZIHK2gazFEFNJk2owxfcqPfgChSyrqeAp8q9Pwxjfo
         92MTEJccjvQyvGYK/ZTJYDsUOS4a4nsg7//Hjwyf5HIf34eOjTSPHVjlLAyk5JTEahk9
         Kex2ckfqck8qqBUNtlXfWzDCOUJ/DbKJrsLLYtER7WyDYV4Vs+SSbHxZacEXSbdaUJya
         dReUVVZJH1WdZtDZlRYs8pVSvFmPQ5kH55Aq0TiFuIvF78Onhz/bAG4O1Ksc64sezWeC
         jEy3fB3tIR3iBkzFtt1mH2GdC4+Gbzeip23nRgjWxUwpz1PvP9KlZ9wVCqMhSXbEePXm
         bGNw==
X-Forwarded-Encrypted: i=1; AHgh+RoVUnIRr7U77WMNVQMNw2Bn8/KCjJ29p9Me/Uy83DlO489EHYvmBjOQXaX5WkhycP0GMwLhNRQpLuwbNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJdNu8JNc5626Gg77HZcHfWqmi2Ai9zjGwAkbOIcxxUalq0sy
	pWFTCQB0Q8Ws8yX5FEP8JNiR/Crx22FhUdpH/16CMGcmy96XybBPBaALiGXkileqd4V5lyBw6Hk
	wcYLc8WooVne2qhheR2s6xZe6yCr92pTCUfDiD2vxu9T8ycTC9imuROtuhiZe25hEjqT/xOc=
X-Gm-Gg: AfdE7ckMwo4EHupktFVhiwFchY1lPlIeUCldQ0azezvcKsRE97KMlV6voigJUs0DmUG
	d9ZiMHm7uN7E+UgV3UogezEh6NuGq+KgeqOWdPMx4rN5tYNsNhiBjO6BRWnXh9Qr49WLYtYk5VX
	o3ex7yP+jKXU1mj0UZTWFrlQVYPod4YZx1duqJu4QJpjdZKZk4GOv0sI2jZRkpMHK0jmFGmnf1L
	CLJNd9jANhkHf9ulkZweoZDEA309QhPr/61NLzEGDPTUMAn4caTUdStayZJj9Y7Kn64hwqCfmu9
	fxZlWJQh8cBWienPG8aSlCDpLHeVR+iYoTwCvtqWA+F57gRauKuLuXJNHTJYdLHbPOC61JX8wXb
	0zw4yKT95gXbQYMKV1/0le2uV6uERurQt6DBo5K2lFHA1BLlpvN7FoXaGJAoC2Q==
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72818351cf.28.1783595785872;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72817641cf.28.1783595785396;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm54261424f8f.1.2026.07.09.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:24 -0700 (PDT)
Message-ID: <b45abac8-0e8a-4005-a050-a0d37e1c8e2a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
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
 <20260707190253.918861529@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.918861529@kernel.org>
X-Proofpoint-ORIG-GUID: 1vGs1ZT0S3aoBleFLUjgimdQHbvvArkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2+VyeOAocxfj
 22LtC50QKFod26JXqfSiuM99Yw6zzz4f44DsybLM2XYXXpbp5TmXPrQNInag2tklsOfLVScpR3N
 QaU5w9EZoFmyl98rJ2IF2fC3sxlHfdqz7mQJbYnNrct+kGEWwa9pwcdg7+W1FjRYx2/uD5FCNmb
 fo/3In58fmaTtcr1RCJXPVfP1VLF9WGYSTr7J/VNUV6CyqkkJW9rLajXrX3yBXZc2+YFSm2mWug
 7JgwIjw7yLkZcouhrpAjSy3Iv+nN3dS0/bAuVT9eCL7qfdOQx9PeticFeh5/Wnir36Wxh1S2rgj
 nd1r2MeSLqTRMiqj6lrIAPDdVo1hg3GJ3T3lHysz1k/DVBgcZnD3ZpgTOj8fd/Z9aYIcgy2bxhQ
 UqvZdZd32eZWGnOoRIx4oWOhwjevQxyAWElVu4GZFmTilagwtgyZDmVXySVUGo+uS0J7ypwJY8+
 Lpj31TF5W3t7SfGftPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX4WLxnt8ztHA6
 1RHWKOLiXZsZYRRJ3TE6WufDZ0o791f5MGz51l9Zv0Fx+wluoaE1HcJQsyjklCJzWRHDE68h3Lk
 FvQOqJgv1H7kIr/2BlooQ8TMEuxR0dM=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f830a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: 1vGs1ZT0S3aoBleFLUjgimdQHbvvArkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041627_693591_A8F7850D 
X-CRM114-Status: GOOD (  14.16  )
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
eG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJt
YW4uaWQuYXU+Cj4gQ2M6IFNocmlrYW50aCBIZWdkZSA8c3NoZWdkZUBsaW51eC5pYm0uY29tPgo+
IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IC0tLQo+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9zeXNjYWxsLmMgfCAgICA0ICstLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
