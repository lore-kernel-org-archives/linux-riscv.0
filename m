Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBE4C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eJwBYbXkwS/QbEeQId4NevpPJBxUzgTLh6NgxgvzoA=; b=2tkdNJto3cKUHA
	tEyO3l3+7x7JJtFxY/qu9AH1QYUKMyl09i8wyJzlqB+/bAENw3b3vEKLNY9VyhHvTnLoRk9VE0v+/
	66NUZy4zQmV8M+2EnYukc5ZPI1MZbcga0YyX3CHgUCgGaIsnsYUAjc1tyzOXejsnbgK9Oc1i9Uf9/
	+AqfCFL6DWUTH77PYvrfkKeu8nPQm1a385dS7NFy0bHXJNQj932GMvA+0ZTd5csX1yVrVNop2BJsa
	4osIdndOrrvuBpeC6f/xD7QnTndyluE67xLuv6iZEkq2n7JjekVVCeqCi6ec94SVfrmhpm7jOD+dC
	uPe6K8AbkkyuTw8NS6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmq0-000000029Us-1PmE;
	Thu, 09 Jul 2026 11:22:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmpy-000000029St-0nOm
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Jul 2026 11:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=; b=WO8p+5Z6eQgK6snmjm+efT62Qr
	XVNXoWyA2jJSKzr2Rf3oBM8PKDLt1muqDZNjIQ+w62TDjKZgUcmjqhZFOqUxb05VB0wlMpOO7dIg5
	wnCbR7nMMCZtYRPB9npwg6fYSYf3Uyrbnpz3N6Zt+GdWM6pLyyrZb2rXd/mZJLiCMigmMqWDdJgrP
	RHf2UJ3TNSnIpOHiGRqD/cRMGU2RXZp5bwrgs2f2Udx64sWpcsMJI9NdI59IPmanb7M18LiNVyVtu
	wfCrASBiALqhbjedO46Oi4iZQGsJtZZSETz3cDkkwtha1ANDF1rPHpRSFo0QmSXUDsmNW5TcY7uV2
	iZxYBlDA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmpu-0000000984N-1Aoz
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 11:22:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax4IG1661223
	for <linux-riscv@lists.infradead.org>; Thu, 9 Jul 2026 11:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=; b=jTI7fkXQl7cmfY8u
	/6bNS+Fwu0N0JYJjqKlpNE/bUkl2mhzeMCIy9YTKs/eoShIUpl8OQCJgxUcCe1Qs
	3cJw4qK9vv+hDmJX2IozRyra6X37WE8v8Vxl6bxaUL0j5/MLQKzhvIKs34reKXrh
	QWs1Vb41u8wIG/o9knrL4GgKq2/ZBNYGTwPnHTuT5u7jJ3EMLnaiRdEBXGlLErlS
	QMBDjPbvcSMQgesyK7qkf9Xbt4GVvlCDF7pU0Ep4e6tiqGpO14UiKVK+WJIifgMb
	eFDVUlYtLgbk+5e07s9PeDWnBLvsQTPHVnHxEKk6PFxWS/VH6saUNZqOsHQv410+
	3wCVHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vugu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 11:22:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so14787501cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596150; x=1784200950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=B9b6LhShy8NFKbrYlFawzpA9BW5sL3WZIaor3JjJN5dijFUSLMn4TTHJBumJ1jHmLB
         4pkeQ3NABLEWGRyxm0d4IuZnWvzE5LtJYPUfbihACAZon1Z6AqGPttvlnU0QV9H5jHNN
         RIgLUe2B8o3Qgk0ROk8+MybzDAzgqFINgGSsz7yrr5hsqLqLUMxNUD9C1oElwqIAfvxM
         JleHAL9jT8ewb18K92fVCE3GT20YSxSVCK8zdsIUGJip5Lu8rf6fxnmixj40lGvhqq/X
         UNkXjhP2l3bG069E9FgKnVGCDin6v52/TCUh7BwYIHk8ih237Y0IfkUzecjrUdtEiBkG
         HOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596150; x=1784200950;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=TmGFtoueUsx9mQ9l082YgArrBuOC1pEWNhiTKq0D3EgkuPz7VYYkdRHP6IcBh/skw/
         ynrgXwxCvjwM8JYFKPdjCKluUnrMybKt1cn3u3FN/7C33Ei/aQIfciCOaaxMID7M3NNO
         nuctPMsC0xLXhlWzKXGMwX3JS/MgKSl6fARSScF0nY0Bs80PQPWzpxehvmnXfOjfrL5/
         o4Kkjh3ZyGgS6YSeHVziqqW/l3t9nOdibCkBrpcgH1JjXfTxMtavbsX6JLIaNnUbotsY
         UwJ0ICFRUXK/3mbo5VwzBthEcw2blIvmFZMfO4NppPiBi8blWH6VqS2Lw7G5ZB2MPlYg
         PSeg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1tfktFv3Km9hIeo6YMqBIP/pg/W8vi53ztWK0V5Z0+VAnhGxl6RYsoxcrxCJy5aAiD1yTBAKwAUbJ6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXjZGKneptIXMqQIuTpk95Dc/7hfJK+r4WfL0Cq8GD5VkRwi+e
	H7pUl+fONf2h6Kb37K5B5Cd0420eYRhL6z0wNT4Ir/7urKge+my6eR7IY7TdMHo1SksfJMgjZm9
	DmFnYTOF8qJcl+/vlmLKv99+uQ6MBsfd64pppL0ZFsp77NnGSdVmfd6qJahJ8zjO07j5+HGI=
X-Gm-Gg: AfdE7ckXoUeEQK0U7sNnVxDYz0+jMU7Rewn9ByDKu042OZfnVTW1x6zpNdLGtTplhow
	p2g3X7a2lVQA4Ftu8DqU5lY3uGUlXvgiRwCt6BYVSWnGxK6uNEVn6k4elyDg+EdzjScLFIAKSmC
	jVEuQZ6sqy5p2IHM4dDUU0pE8jmuikG6Dim/j0fBhnBkhf0kaL7ItpYoVcU89mjNqJEyNuq8VhH
	j1dMHN2WpYFZ4YbEY1GeC3QTuqXSI5G8m/BpL4wWQPJ3OlBBlNXLyva3fbaHTIQbNtuvUOkz3gf
	YXB8F8CYxCSXqS5MO3ufRoYVvGUYfcAe1Shp/LItWejeL4HCThVJkClpdDpvKTge74Vl/u8dFY+
	yFcUIcf/SfvCsr144IUB/y9ONcb+Uao/xmNGHIigc30whgxaelcsHneu55t3RlQ==
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987721cf.71.1783596150576;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987351cf.71.1783596150195;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm50814277f8f.5.2026.07.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:22:29 -0700 (PDT)
Message-ID: <ea24e611-91e0-4397-a49c-1493966094f9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <20260707190254.181086755@kernel.org>
 <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
In-Reply-To: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
X-Proofpoint-GUID: tBU1-JPwn92TiLRqXVFM6KxEwlFFCzGy
X-Proofpoint-ORIG-GUID: tBU1-JPwn92TiLRqXVFM6KxEwlFFCzGy
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f8477 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX4U3kcCsClAQz
 n7KJ0mKGg+V+MzSS5f1qff7BLvlOaqXwzgZYevuPYs0a2GjHgj/DnbihxRzJHHyHMveBixDyLGH
 RzTZT2+rfuaN7M64qoS/HqEPsGEghr66Mr8Bx3mlTAWdYSkKaHh0zomC3PAwrnhvqVe7270Fsr3
 OHtYQiihSfmo9l6qxP5emnAhEtrtAbyDuOHtggVB3Cu3AxznSLKNZTmfy9ilQBsqhUkTlrA4vjp
 g9NK5hHTR1OvXo2Gs8S2jHMnKPXDM/gAPd23c4zSsN1HrQ3MkS04akfKxZCopH2tNgF2GAfWVF9
 SU0xq3WtEf2/V5YaszIcr2Bys5eFLNkLjXzy586EVP4pFFACUBdQHvS1d2C2k8qzHgDo/BgCa8d
 7cRSJ6X+8fhOk8VVl1temeuUoGlwY62XY5QvDZNDVSyvJKDAAYtxdpSNMjbr2dL6OIrsH002hTQ
 L9sKsgQLXSS5PbZhezw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX8WW8VB0h0lrL
 JKNm6Yw3nzuU/Gf94O7++9dWuqQhE37CyW+vgDWbx2hkVn3t5M+iGqwI/RE4AL8wQyAoeIgRtsw
 LM4MV1kkfMU+f4SYpt89RyD1uBg+maQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122234_838205_9B9D5F84 
X-CRM114-Status: GOOD (  11.86  )
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

T24gOS83LzI2IDEzOjIwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDg8KpIHdyb3RlOgo+IE9uIDcv
Ny8yNiAyMTowNiwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiByc2VxX3N5c2NhbGxfZW50ZXJf
d29yaygpIGlzIGludm9rZWQgYmVmb3JlIHRoZSBzeXNjYWxsIG51bWJlciBjYW4gYmUKPj4gbW9k
aWZpZWQuIFNvIHRoZXJlIGlzIG5vIHBvaW50IGluIHJlcmVhZGluZyBpdCBmcm9tIHB0X3JlZ3Mu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+
PiAtLS0KPj4gwqAgaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaCB8wqDCoMKgIDkgKysrKyst
LS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBvc3MucXVhbGNv
bW0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
