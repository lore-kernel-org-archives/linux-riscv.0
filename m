Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4678DC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ngpJTMrDRKul0Ruivu0aMaLwWb42SFPTUpImRITejo=; b=eCFB9jzDNdHoKF
	SVzDSnARZebay9dImANl4IRPmxPuPNEAaGqVt6hQTuQTJZIoTh7zTol8jicZXQdF6soblnu6uuSaS
	2wPdGK053WNB4p70DxHVFFR/LzqWUgl8D1Lq1q59XAvimMN7GSDfbiVJe64WpI6k85a0q+x5ve+Lf
	nbk7v+D8mpnjTWrjCRwzzsLaGZRZMIRqM5WWm70+ICpbZmZfNb9yX2hZ5Yx7+nj5MGvTksC4lHHEh
	WGDLfXb1lQA+r/K/LlynlxhzUPnDx4Q1uvRRzjAs0XASYhout4RLNUfmd29uWKr5Gp6q3F11HpmyP
	BYpYbsvMTTVBYdm1zMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmkY-000000027ny-0iwI;
	Thu, 09 Jul 2026 11:17:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmkT-000000027l1-1HTU
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:17:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AwxRx1660749
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=; b=bZBcJAam+ibbXFwx
	fYme4cr8sBqjGZ8/bhY813m3zZdemgRcv+ZZn5hEkMKaS7vw0Lsk0C+lZaMW/4N7
	48Ti3b9W5djrMW6C6sRvr/fRMwvlr3Xwdk0O8mST92o98b2JRkz34WzfXmdlRdyc
	+GNzKHdNyJRx4XFA9Y/FW2dL+68kjj0jsC9rEzLvB9U2wtPREHvCZncHnjBH0nco
	DqfIf8EOVkC/PQXn3R9FFwNfO+c4fAiAxBDB9r3vKIUe0k0qjSg4thZ00H8jr+97
	7VzXtBysfy4u+kGoa711kKXXJoacuD/Fbabaj49b91/ZVeI4dz7AgvccLaeW9YDn
	oHnuIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vug1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso10817511cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595816; x=1784200616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=Mm6+MDzC4XSOzyF/BU87cVEU5DQi4Us5FswUTOiB4exVOzb5b5ZXAEmUbFABuMewsE
         HrmWHWfmI+HbbR7wUbBL5rn0dUDKstCPczdZIFrt2LV0Aa3DQZCCcmFHN89tLwZvZ/Tl
         FeEtSdUpDF6KhumFo9v1A1acNHb74zuC8rq5aF+jLngzs4mFroVqBlX/zd+FEML3AjmA
         EMgjEf4gLFeGaq5iK10tjtlE8kbj+sgk17XxHMq9L01QqAEwdZJhIOJ+5VzCWF4B7f3Y
         hfz5SccOI1OBFaFkFvVENO05yLoza40b/37pJg/ZGKwxc2b5fIxDBx1+HhZfKeMuR9jt
         lcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595816; x=1784200616;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=JhuvV/uzJ8Ebjd020JIlXnhP0VjqTJUd13KKkDmjlQdFzT9yGO8lMPc6KicfFKlymh
         nhg1KrlM2ou9RyrOb9gDYJdYbfiiy26Z28hGNYRvkylLsT7AUHEspjpfaUpcDDNqMTTI
         rQ/WtIV6XsJKUy9x1E9zbLlIXBMetGPh8gCuyQC+t3eWJJmF1/z2zfcmhMxvOK6VKjQa
         mWv4hZeTcZIC9z/vrcTFT16AnYFZVBF7hgW1QKLvjsZjdM98Cck8wM4G/PAJz5uSGMCT
         FURv792X60BSHZndP7oWZ9cF/ZYptgeGK83wNjOppt7er+y7yItReulwEyWmU7yoZ7+j
         d9QQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRW/ebqNH/Jwwr3tx39c9pNB1RgTHBGMMv3lQjuFjDWvN+0122MjLKbckKGBNtRgahoLsCoSOrbmdFGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4AmwpOaE/Fw0qYnnioFwNOZxjvUXcj2dLyr4vT6DUiGJXoUlt
	OsiOk6x7oOwh/yevwZs63np6VtIzZJHTzmVR/ScuRfryi/WOkES74phESCqER4KzNE7JTq9SXjs
	WX7IAj0sl5/APt1qbIY2uUhsjtbDGkSK43MBKqc52DS9pje9v2VZFHduVXJyHwiqO/Y9vIl4=
X-Gm-Gg: AfdE7ck0uckkScLWBSei50fWgnZEwFWewVVobO7AQrBdx43wgLRRevo+ynb9ZL4CMbH
	9tilG6BxiLFNSlN8ARE35IhP2IarA1tGkwTNysb54SsaC/AG0tee84njTWLjd5L4A/aTgxXF+HZ
	ZYIdYZ73uswYSa5WiWHcLpmZGwsp1llUc87zkysOCxs/HHfLqtP3vqLsfY2/XlktetaVVsSU+T5
	bnYo20m5Tn8j3yfs5lm6l4uzHu/bKJJDsVYJL++wgERX7Qb1Nk15BZ3Q5hKoVwmQ/D8ZIWPMLTR
	5ERHlW55g82jugpDX+XywYBvJvK9eh3wjEkwEfpTUJIV1BNeIWMuUmg+SoQ6E1F29RTuD+n4DeC
	rUtsbPtBgnAcTQWFwIMeHAdht+9rQuouVg9mvwom7eGK5SZtWYIw5hYiUWLpTWw==
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236541cf.41.1783595815670;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236071cf.41.1783595815288;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm51612968f8f.15.2026.07.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:54 -0700 (PDT)
Message-ID: <b2ca1416-e2c1-46ac-8a26-ce671c76883f@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, x86@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
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
 <20260707190253.974626922@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.974626922@kernel.org>
X-Proofpoint-GUID: tqtRysDLqGenFEc6D_zXPJXJMOPU3KZe
X-Proofpoint-ORIG-GUID: tqtRysDLqGenFEc6D_zXPJXJMOPU3KZe
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8328 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX1VRnAy4xndPs
 Fu002d+lPuoZ+wI14rR7YRKOZkT4rGw/xk/vg9PlfYBcPZhEetMTHpA8Z9J5QuyC9eTFsjjvgYk
 cslvgriy/HXp3f0RVBTZKvBiidBf0ttBVgtGvViWX3DxMe5K7lFwAw/keDDC0/4v+ZLmJykn0fs
 /4XBmt3AKIrAWQy94CKeWDQdRn9BYiQuTTvDZbd7fXQo1dijuGLebBEoS8EPbdU2iOL9MIZpi16
 j+ogxf3gqCaQS9+CvosjOnzbvDeRNvncUS/s29QTjTvXbZSN+mulO+U3qtMxZfUO75nR2zJdGaC
 0dKeeKCGixKeIneXEKG/NGqpuzKx5y10UXCHQ+E9I/i4G3MCcF9Zu2NntIf9Nv7bp6LuWV7J/Hd
 cL4hsk1fei6yJbSKLFyqzke4THOa5oBS2ooLXxQQRPM7JU1zpqyzKNS3pdqgseVoNCY6utofP2u
 IL7AKng6G1hFdolV2SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX/2/gBhw50wXG
 9CYaBB5jy8TpIW6t8fB5Fa7a0gLfmj74m/pNlRxFhoJVnYMiIwUthubxe8AyVcxJfKYsgzpn/Q0
 ykgMPniHSHHJpaVoGP0g1H1edpOivp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041657_344911_540D4D89 
X-CRM114-Status: GOOD (  13.86  )
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
eG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9y
Zz4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0tLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyB8ICAgIDUgKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
