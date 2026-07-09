Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55A3C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmBLddDxS3xog/jPR4rzIyHV6DVv2uHlGev0oxIweX0=; b=rlhH6G3vvO3yN6
	p9PlxEo26stXDI0WeYAthCQQgIDIIKkat4pz0eVyTNGarsFfU7spHq/kqCc8sEAs0DhyJF4BY8T5+
	ZuBB5cCWzgKgycCIJK8rZYVNWbEK+scO5MqeoCv2ex+ZBIMDZOaMJooOmfVJYH5wk9/ESUjR8hIza
	X4//roqwNhhzRDs7F9hINM6xreiG7X0LiY+94yPuzRa+T4spcx/XxMc6EjdFLEblyUxADAohkec5n
	dFpFrbGgprlB9r+I5JFgfHULoIe1cuW2i3agyYd2uZum3bmHbj2mYaJ0FhukCMw7RzmRMvbkFJssx
	7LgCRWt5KW0XkMPsirqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmgn-000000025mH-0fL6;
	Thu, 09 Jul 2026 11:13:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmgj-000000025k6-2q9L
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:13:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxPZ01614095
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=; b=jqvWJK8PLEi8s+Po
	PkAhOcF1EZ0TGn8umnL5kgryJ/tFquXm2xFzKz63mEvAAckXJG2v/bBhmyd/J+vv
	w606gHPQkOOhu8auM9bbQnd68PLYN5DhMVRn/TQO3SYM9ZXEOEAB8F2FTaHvyyzL
	/gj6GXZOaZ7Kqn5MccKMlGU9Y/8NaD7WUS1XOInbClq4x0wSv71WFJfHopsmfL88
	joRiOO1NBxKuiVXV4p/tSPunQ9pAf4nwUwhwVoGhXqa2d3YUXy3NiFuuL84Sr5z0
	sFBM3VIfsHX5R32LvKrkWCid7sj7it6qPECFAQp6EaOHyXV68SwSVXRcZbVTi1ag
	vIF6OQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kd48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:13:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso11918511cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595583; x=1784200383; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=HvkWKGmINyLQn8uruWt3PXTqRVsBzouPvOmn5ILcxcmwx63JfDfyL7ibW+fmXY21b3
         D5TA/8N8Yfypd8Gt2BSHXj6a2XQC+tO1LsSxpP4fa79HAq6s4XuppIIR9g24mwykac4y
         sm5kn4S1zrEUVpWnkbr5bORRMRoVHYpSaZKVdXi48QjSvv/D0U+7OmIQ2qPDMhLYqKTW
         KEf3UPPgaRyduTktJB4eoodiQIu4QFhBH2E5TncUsnOiwuSm5zyQh0ED0rhd9OJIO5o0
         BDRuR8MdZ/zTl1xMwlDJDfm7kDhhjoCMHCHB+23xOviw6F9ECP83n5DEZE2BfUVC+y8O
         3fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595583; x=1784200383;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx1kSZXz579iItxHsi1/8Nt3maK8vpLohSpfVXF4Ysw=;
        b=ZPZ83WTbjH9sTsd4/b9+N67etSNroTCAPTVcuyW6Yt2VNJgqnnSxf8GsTo5FUHPOzR
         fxnifiWCNsFI5S8yhXz8+WduxjVtzOg7LpEDcNY4C5sdDC8eJzSRmoS+Mz5c9k77JGUp
         XOt/hCD/sJk83jwBiK5FteY+rZIvBA3pIGVdO8ieIWVXBC/IS+LmQA3ZHOgIw+lysoaC
         Vl+wC26dNEAkGquqwNhtDSa6ezdjgGq/NbT7wpYjfaxSlUZ+wLJXZMHYrV2JDmWeafcp
         xn00Noa3o1E9XkDRdE15wBnfU1FIWIKETFfSwp5prvCdoURHuH5K7ch0S5HPD77OanyA
         vnyw==
X-Forwarded-Encrypted: i=1; AHgh+RqIb28lp5QTXuW6gTdSFFSYzNRgynIjLXSxfwQbXOc1siyV3LUmFF2kOvVc4JMTkxxPxVFxN3Gk0pyfYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK/a2XJNBz/UsbDTGVbmgYOxhO+xgMPIwJxL484Vj4PuVPPDSg
	PfVu1TjDSPlvHgxABIzQgl8kFKIuDwnaK0iH9x7QbRbyhgRSmI4vVS1JXMDrA0Fim17Ftx6h1Z8
	87Fe152gUIGeF1R0fmkNl4dtT2LbxcfvQDtj/mYcgUO8cCWjocRndifv7hwbUNH01UnRNnyo=
X-Gm-Gg: AfdE7cm2rlQqE7vgHcDMlLuPLsVt/6cCESBdfNymNx+mcpcS5RzmU1Ms/BHnzGYZsoU
	zoQtKEU5G76IWkx88k/kJP6DeGqluU4E8DIMM70RASfVSENf+3zScRGFhRfNtthdLWVKYawt2LW
	kIVwKDt3zIpp/K5eRGfeoBVmh52Pte9Y/xpKDLN3EmBvxFEYJGHRHPWMiqP7WW6dPVOyic2un8S
	UdzVSR2T98M5QV/hrD084rt+Ce3OlVxH+XKRS75zBfBF3yt5WOJ3romXYXl5+PPj8KDfWwFFMls
	81rNPN2uKL0LYoQQd2msd2enFvEniD0eRhoUyIdzCueaBvdqa6D/JuzPMyFb5zmumIIcVkfM395
	CW4T2M67hc4HiGOQFkepEiYhRinCm7Mmk4ZXQ/FlZM3ZCNBZnjoW+BlhAav04BA==
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63974581cf.56.1783595582892;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51c8b4d596amr63973951cf.56.1783595582395;
        Thu, 09 Jul 2026 04:13:02 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm48543085f8f.34.2026.07.09.04.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:13:01 -0700 (PDT)
Message-ID: <835e2f62-3b66-45d4-a614-dc2198a715ad@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 01/18] powerpc: Move stack randomization after
 syscall_enter_from_user_mode()
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
 <20260707190253.718191130@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.718191130@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX/2YIyuBVSarv
 aIQAqgP2/BAZff7C0MF9AheKtOo1KGAwUY7LQ7km2Eisj6NyqA4wgDRa0QL6ZC5+6m/T6b05vuj
 usKLnBrMvvo9P0Fwz/wGQiKwihJnQcE=
X-Proofpoint-GUID: Ab6CuitcDoKKCBmzafGNZbVco6UqTX6Y
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f823f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=63ny2n9c4_t8xnV3ltYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: Ab6CuitcDoKKCBmzafGNZbVco6UqTX6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX9en/UEKV1SEZ
 fFwoyg2yNjzMps/FGmlB8n+CWKHXBxEiqM3RNK4nEQYjREhwqsDkDsJPVo4p57gafrrJqXdR0FW
 vZpejLCqWZrkTyqoKkGPA0tOTA2TSpkGVCjLYp45DQZ7LGTl7uUMshV4QgRORj3oEyC6h0Ry6ob
 kTbAe8lK8YAn50hhj638Qh8dQoG6yiS6b/IbLYzmJS1vnjuteSX9/5/V/G7+5jwB5eyxGP0AHbN
 5kePdGEYtNCpj3NaA3vGskkwYZrPpsfW5cKieewy2h+J8/XrWDOI9DQXJtBui9Dia4s00iGfHCR
 CgSzoiSPIlgTzqXS0jAh5Wzv/CmyToIOpz9jgql8OwOyhRiVyH76L00w3UAb6nEFlpzQAjtKVxt
 G/AJDRH85SVxPzBDnVhBr9ZHoUFuOR2vBIE+N5WNTrQV2VfKyNuwA8WUoLb/BHMox89BzV7wjyk
 qIq9wyctyX0FvpuLLpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041305_827798_26C3B3B0 
X-CRM114-Status: GOOD (  16.46  )
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

T24gNy83LzI2IDIxOjA1LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gYWRkX3JhbmRvbV9rc3Rh
Y2tfb2Zmc2V0KCkgaXMgaW52b2tlZCBiZWZvcmUgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZSgpCj4gZXN0YWJsaXNoZXMgc3RhdGUuIFRoYXQncyB3cm9uZyBiZWNhdXNlIGFkZF9yYW5kb21f
a3N0YWNrX29mZnNldCgpIGNhbGxzCj4gaW50byBpbnN0cnVtZW50YWJsZSBjb2RlLgo+IAo+IE1v
dmUgaXQgYWZ0ZXIgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIHRvIGVuc3VyZSB0aGF0
IHN0YXRlIGlzCj4gY29ycmVjdGx5IGVzdGFibGlzaGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IFNocmlrYW50aCBIZWdkZSA8c3NoZWdkZUBsaW51eC5p
Ym0uY29tPgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IC0tLQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxsLmMgfCAgICAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiAtLS0gYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL3N5c2NhbGwuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbC5jCj4gQEAg
LTE5LDggKzE5LDggQEAgbm90cmFjZSBsb25nIHN5c3RlbV9jYWxsX2V4Y2VwdGlvbihzdHJ1Ywo+
ICAgCWxvbmcgcmV0Owo+ICAgCXN5c2NhbGxfZm4gZjsKPiAgIAo+IC0JYWRkX3JhbmRvbV9rc3Rh
Y2tfb2Zmc2V0KCk7Cj4gICAJcjAgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3Ms
IHIwKTsKPiArCWFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOwo+ICAgCj4gICAJaWYgKHVubGlr
ZWx5KHIwID49IE5SX3N5c2NhbGxzKSkgewo+ICAgCQlpZiAodW5saWtlbHkodHJhcF9pc191bnN1
cHBvcnRlZF9zY3YocmVncykpKSB7Cj4gClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
