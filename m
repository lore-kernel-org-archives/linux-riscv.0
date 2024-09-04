Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F23CD4F24
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhXdqXLo4Bp/wmkHk+M2w2D9OsnSmCKRTrW3DHttdis=; b=nmOx0PJmZZAzf8
	KjK70isOUJzq2lwbTQT1Wn0rayjqTBrMk+kvTGd1TKJLTrIinmYnsozmD04290mx9t2egsExShOeh
	aL7s89bNqaDFvP7R+gdPOeooOab48fCVgeANpNkfXp82J+KMeo9TEoUvjLYAtZjUeYIc/d1AAfJgU
	19f0ZSzmHFsRdwipgnkQiwK2SU+RPn2RquAZt6a4zZDp0WhZqMpGsJUu+SZCKHdyxHD+4gfXeRKBg
	zOTs3e05rQiIhTqzfM4mc6bGPcJ8d0Joc07ML83LSw5KTqz0PPQ3k594dqPP0VrdPVuzjPXOHRrIj
	Sk0Gs93Uxd0n271R4bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvhH-00000005o8k-1LvC;
	Wed, 04 Sep 2024 19:29:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slvhE-00000005o8M-18EC
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 19:29:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7178cab62e6so76287b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 12:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725478179; x=1726082979; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umdFtTlAWj8D6491w1Cn+lrTO8LaHN5Nsaig1rhVMFY=;
        b=joW4tB1jMiItcseJufxEJyzwxonKDJGncBniauj9jVvIPYgKkBVhFLFF8E0OVE90kl
         O+hy4d61rMMz5IcOu6PrRjeCcss3uxz/wBqKj0QQx2Wr1yRPrSZKrB/fgCt1eKOlDuku
         10GwPX6aLdiJvJjF2OT049AOq0XajJlZu2kr+yPn0C4zLHuN+6NMxELdvPZ5Cl6UDjqD
         qqqNxxLAg6JvdjrDzj92Zy+Ax2su/eK8muIbbdBTxhuzrLlMcySgGiaxgHKcTs9Cj5Mx
         BOzplkJh9260s+or/tk7J5+j1UCrAywxSgIm5XkB7nth9/d1McswnKpRWUCpD1Wf5Veg
         cMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725478179; x=1726082979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umdFtTlAWj8D6491w1Cn+lrTO8LaHN5Nsaig1rhVMFY=;
        b=wurnnXWoWMeC4UWw+kGJ1oK7aXWflWgodv85mvuzUri03s3oy2O/dPcrCkDV2sSvAZ
         J/yaH19eD13NYT3Y+VQbKmoRzKFCxU3jMttatNwzN6aTV/mzUu6UUEGhOgTFlR/Aw39w
         X6r/WSWOdXBbTVYOXlPIuX7iYcABKa41rhQEIY+Ysbim5jmSijqHkHsDAGuAcY2C4SmO
         lFgfIiH3xJ4ihdO+3XCeFkcCHpcD7lsiqDkcyb58zh+Zn68Ef7J85wSCypgGRBW9HS6y
         ZJODSulwzEqV4WC8+2ygMkXhmdRPKdK4RaeQv3i4qbb9d3Xq7EjjYJjJGKiELOGs94JO
         Mttg==
X-Forwarded-Encrypted: i=1; AJvYcCWOuIhHvr+tgcLjmgbKzaETiB+0zF16vwCH3/0UgikH3Cj7vrIpkQk65nuhSzDrORbhfa3PBoFj4Fj9BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFrRLBb8g+9aWfNlMCpxtYfgM9sSvHsUN8NGgoA/vA2fqbXHPV
	p1LAUn0HVTtnmrRnaI2hc6K9s2WqMJ0qyuvTNOWa458EltWD6OCd
X-Google-Smtp-Source: AGHT+IGA+X6axjpJX2VU9G8Ebr6TmrtuSAEq2O+0Rssv2+hY/YGT0Q2PHCZbsrYcd7742d+TlLIYOA==
X-Received: by 2002:a05:6a20:2d2c:b0:1cf:126c:3f6a with SMTP id adf61e73a8af0-1cf126c43b8mr636264637.27.1725478178880;
        Wed, 04 Sep 2024 12:29:38 -0700 (PDT)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e66sm1980240b3a.21.2024.09.04.12.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:29:38 -0700 (PDT)
Message-ID: <19101f0b4dbbc933e59ce545bb9f5d719c4e5024.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 01/10] selftests/bpf: Adapt OUTPUT appending
 logic to lower versions of Make
From: Eduard Zingerman <eddyz87@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Pu Lehui
	 <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko
 <mykolal@fb.com>, =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, 
 Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
Date: Wed, 04 Sep 2024 12:29:33 -0700
In-Reply-To: <CAEf4BzaW6UfJGFK5hy5JQYsf3qwiqQ81h4Awtkj3XtKv-HKRrA@mail.gmail.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
	 <20240904141951.1139090-2-pulehui@huaweicloud.com>
	 <CAEf4BzaW6UfJGFK5hy5JQYsf3qwiqQ81h4Awtkj3XtKv-HKRrA@mail.gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_122940_331775_494CB5D0 
X-CRM114-Status: GOOD (  10.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDI0LTA5LTA0IGF0IDExOjQ5IC0wNzAwLCBBbmRyaWkgTmFrcnlpa28gd3JvdGU6
Cj4gT24gV2VkLCBTZXAgNCwgMjAyNCBhdCA3OjE34oCvQU0gUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpY2xvdWQuY29tPiB3cm90ZToKPiA+IAo+ID4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpLmNvbT4KPiA+IAo+ID4gVGhlICQobGV0IC4uLikgZnVuY3Rpb24gaXMgb25seSBzdXBwb3J0
ZWQgYnkgR05VIE1ha2UgdmVyc2lvbiA0LjQgWzBdCj4gCj4gRWR1YXJkLCBzZWVtcyBsaWtlIHRo
ZSBteXN0ZXJ5IGlzIGZpbmFsbHkgc29sdmVkLgoKVGhhdCB0aGlzIHRoaW5nIHdhcyBzaWxlbnRs
eSBpZ25vcmVkIGlzIG1vc3QgcGVycGxleGluZy4KCj4gV2Ugd2VyZSBhY3R1YWxseSBjb25zaWRl
cmluZyByZW1vdmluZyB0aGUgRkVBVFVSRS1EVU1QIGZ1bmN0aW9uYWxpdHkKPiBmcm9tIEJQRiBz
ZWxmdGVzdHMsIGJ1dCBpdCdzIGdvb2QgdG8gaGF2ZSBhIGZpeCBuZXZlcnRoZWxlc3MsIHRoYW5r
cyEKClB1LCB0aGFuayB5b3UgZm9yIGZpZ3VyaW5nIHRoaXMgb3V0Li4uCgpBY2tlZC1ieTogRWR1
YXJkIFppbmdlcm1hbiA8ZWRkeXo4N0BnbWFpbC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
