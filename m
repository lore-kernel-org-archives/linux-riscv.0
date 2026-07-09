Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1567DC44506
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVbgj+AQguIGDpgQsfbfJZKsEPjMuLEsqBGYcT9/BZE=; b=uisOFaXcLjzX0s
	NcozZK6FevhUrUXOL3IDzAw/40eyJG0Wr7g05kgTNaN0FhGZ/pxfccNNV0mhszMHgfdPNH19EN2gH
	1YAGV/UxRZirVnGJujx6NDec9uMhI8+mUarS5QTvzQnwiK7JHbwt9lRVNqllZZ6cjsJWujyz+OQrH
	dBakKeYjUcMZBd6bTUsAU8sfWzkkRuNsu0JzJoG5PDnw+o7RePUCKM8WBz/QdZnu4gICumGSKqsoa
	4X/ScQA7B+R7n5U4pH6+1H+EcgHCVUzSvz5Na6SuJYQOPddY1if3kqbJ6Gps5ICuLeOEN1WKP90mE
	nAm9I0ACNG1VVGyydwjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmiu-000000026ue-421b;
	Thu, 09 Jul 2026 11:15:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmir-000000026rC-3YI5
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:15:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxhX71614728
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=; b=QY+QAjG7JhI01DOL
	wrAWMBSfa2EsIJlZOBwNOpqR74GzzqMsWGKTL1nRLElce+kxLmPXGSEYyErRT9bs
	jrNUZ5qVhOMFlBS0g8+r8Lj5pkWx0HY2wr4Y4a6rA/soxkxGEv/GhwH6BfRMk7jC
	wxIkHw7CzIPD4C4hy06RY+nKd1hJsp9iQzkVAWdtTEM+7XcTYBvK6npbb6yBBaJ1
	CW4Qj8HEgGXE+RZq1+7fNu0Wd4ijs3A5FZcUaa9zPvqhQLDRRhC6VCASBWFqdB7d
	2iZ0nRAY5gwJd6YOiD4NmrqJffwjsCb4nFAr/D46CSDxbk0OC7RRzM/ZY22CoVf3
	XPhT6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kde8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:15:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so16981361cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595716; x=1784200516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=;
        b=b9AQLgvIMl5VebszQdlXHqlcx9PfDZlDxjA3oKPjsGLvhN+wJideAnKg7dp0R8UC2B
         tgKYVzDdANCIraGCDZagNobbg7epAZGuPDSkdbYgM2Wjw+MBxgbgGcoj1hBjFl5hijhC
         s9gj2SWpm/LhdD33G4C17xSxLf37KIDnWktY0gotZWkH3yHFnXBXl8+ry21TyPPSkg6j
         tD/A7gnvoaMlCNQrrEmOcN1fEH9Egk5mMxyrR9dqGZ7jpDFNEH1S0BQD6xrM2exKz32T
         O00ODYxGvYE7MOCPecKIiknbedd6ZnJDXgE/BezmivGh9iWAu8ZJkCDEieQ0NpnUO4oE
         1M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595716; x=1784200516;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+HMbGg4SL+5U70oYYJ2l7pisY/QrLqdUOSZy/EbODI=;
        b=rOeqofnfwhgfExIY3ZWDfkEUXblZ6Cw9FwD+Q0e1zKoAa4fBtgSTM8EKXe8Pfcu0oV
         iebyB8Tks7VMx9qWTYL5mapC7tS6O566ZOzz/rro+O4HxrfRbehtATiYgtQYPHRuqDPw
         5N6p1zPgoALQR1+QdxEyfOzWgsKt3ywO7n1ZxL8jce4plW8VSeO25Y8pWH84XEGLP6sv
         iqeClwQKlQL6GGegxkbAnGvOUcXY0Vi/QvFOCUyOsAM/W7o/uEnWqFoj5aFMgR09XNnA
         b8FxVZAapiTO3N0iv9KzN0Zunn8P+dE5NMB/+TsAxUMRO/OYwb3XNOWL6UTCr15jamsd
         CrXw==
X-Forwarded-Encrypted: i=1; AHgh+RqCUuHBV+h68ZHWNxdPF2K6/f4lT6C0L5Jyx4VbX5m1XEu1pVEOeJV4Jf3pLoV3i0gWpr3tUT6/EbQRRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWnvOhQbzrGWXJuc2kZGtx27TIajsz5OyI/vtpI3NbcOsh1stU
	IW5sp5WE87SQMX4N4LDvRhp3xSEh3GxdmbP0OmXzTdoW8UlNXPdZMQs5ZTnZhOs+8au1VFL0ZSY
	40o52DogcCVR6+vKSJ1tCn59jyWTnCFTHbJnhU/HnPIKwtOKNwLdRAEE2bJtKnlGVn/WWTkY=
X-Gm-Gg: AfdE7cngbmgzikAvyNEJi8WiaJvWfAVqhtAMA+yyvMpL+pxNc/LzXVPZ7dK+WvoMk4N
	C5kSH/htla9QZ5jiq7kGMnvpGPHdz8/mAo8UcSHXjJRMboycBhIDm1lzK0mPa88I/6lrpbBNtLy
	hBzg7vdAG1lawbFvaH4Fuz+wA2ii2aDBXvDgptg9F+q/wJrC/GCJafygn0HlpwxC7wYDSDukccV
	OAgw1Px+iE8noRyaqHVlt+RIA62IApyE6x97x78mYui5bVv331DZMl5TPmMqWask8mgrm8/UJ6y
	37akck6lSItHYtr2KodnhinXetQR6VUeRp3SintzQ66EGH0qgFN/d6dPto7kL8JkwOHlq3AKTbC
	KqCamzbR3S4ZPLKPu8ulXqTJJPYfMtRPuaX55hazepe8dEYV6lIVxuE4tqYfhag==
X-Received: by 2002:a05:622a:58cd:b0:51a:89db:95a4 with SMTP id d75a77b69052e-51c8b2bdfecmr69627121cf.6.1783595716202;
        Thu, 09 Jul 2026 04:15:16 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:51a:89db:95a4 with SMTP id d75a77b69052e-51c8b2bdfecmr69626741cf.6.1783595715754;
        Thu, 09 Jul 2026 04:15:15 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm49838232f8f.14.2026.07.09.04.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:15:14 -0700 (PDT)
Message-ID: <954fe87d-9d43-4819-9f5a-eb0e5e5affea@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
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
 <20260707190253.816918647@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.816918647@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXzH5VrC8YliiB
 038LYqkJo2U8E0iLpYFz05Y3tzq8TszKytik5pecr3ytxw+G25pa2gwAHE99b/FHPBoYPJUKnLA
 9vLQZpPWzPdPO8u9xiud+8rjLX0w4HE=
X-Proofpoint-GUID: KtiSkRYBwJnMdlzzisZZpbB5PYmJJ3K-
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f82c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vLKI4MkW7k7maJ7H7gsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KtiSkRYBwJnMdlzzisZZpbB5PYmJJ3K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX0A19MSkRq8XE
 vNnAGWd1jnuHG2b4bPWXgRcUoblNDAofn+Qy4y8i1+FMJAv9aeolhIAAlVwCwJbXFMbiRH5KjyR
 z7MCPMyNPK9HsQWv3NnL6QgT5+25PYrGOoyoKZ5tQTQiYLX/GfnmY/Johv4ss2BQSVIEDmuxqmb
 iMZrQZZQ1oFFR6Xne8r+EjrrgqVLXMg0224WFXrxPinfl4Pyu3C+fpug1RlFrwgABulaJ8n0EPA
 cNzk7C0KtstYqPN8n+L38KETDDuqJd7fdXfvLb+lBugm+mVWEinxNn6spyhrRttT0su428ucT4f
 nNjPw5MrPZ6bZAoPPHEl2uc29lyML/klUu3TzPKBxiQMrfUi0st4Kc/VvgETFJiUuuyxlTJ1a3l
 9NumSxY2kbPxvnwjrIwutVZY09irWjB3MqlKOUNYI2pgQsBX4ir3SyEW58Un8SwMe0cSdtLwpnH
 YfAMUBJvZDyEfDmwGSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041518_014391_7B4DB66C 
X-CRM114-Status: GOOD (  14.56  )
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

T24gNy83LzI2IDIxOjA2LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gUmFuZG9taXppbmcgdGhl
IHN5c2NhbGwgc3RhY2sgY2FuIG9ubHkgaGFwcGVuIGFmdGVyIHN0YXRlIGlzIGVzdGFibGlzaGVk
Cj4gdmlhIGVudGVyX2Zyb21fdXNlcl9tb2RlKCkgb3Igc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJf
bW9kZSgpLiBUaGUgZWFybGllcgo+IGl0IGhhcHBlbnMgdGhlIGJldHRlci4KPiAKPiBQcm92aWRl
IHR3byBuZXcgbWFjcm9zIHRvIGNvbnNvbGlkYXRlIHRoYXQ6Cj4gCj4gICAgLSBlbnRlcl9mcm9t
X3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKQo+IAllbnRlcl9mcm9tX3VzZXJfbW9kZSgpOwo+
IAlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXRfaXJxc29mZigpOwo+IAo+ICAgIC0gc3lzY2FsbF9l
bnRlcl9mcm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKQo+IAllbnRlcl9mcm9tX3VzZXJf
bW9kZV9yYW5kb21pemVfc3RhY2soKTsKPiAJc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZV93
b3JrKCk7Cj4gICAgICAKPiB0byByZWR1Y2UgYm9pbGVyIHBsYXRlIGNvZGUuCj4gCj4gVGhvc2Ug
YXJlIG1hY3JvcyBhbmQgbm90IGlubGluZSBmdW5jdGlvbnMgYXMgdGhlIGxhdHRlciB3b3VsZCBs
aW1pdCB0aGUKPiBzdGFjayByYW5kb21pemF0aW9uIHNjb3BlIHRvIHRoZSBpbmxpbmUgZnVuY3Rp
b24gaXRzZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJu
ZWwub3JnPgo+IC0tLQo+ICAgaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaCB8ICAgNTYgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
