Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F85C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHWVfH/l/odAH+7CX4NB1TG35neRIV9WSZ0MHeg9/Gw=; b=ojrezf5yJQU+eX
	8wIgBml4xWyNy/8Pp/0NOeGOFwPLhOikD7K5TJT/q20+d07GyCgS9BPh0D6Uxt5/FG6g6FJD49nV6
	12OlXkzMaT9uLqUZaS3mUyg8aLUG6vn8lx7Zn3uOIVybB0dULJyHvNnWiVs7ToDxHrGXQulokPtuz
	BphOawkg1beqnbfVCl3OUr8D+Fk0YMHmmiM1d+A0g6A186Qrq8eySfdf/Zss9o9/5EblAtCPLsoVX
	rWmUG9z5nR3LA/FJNdDpZM2s+ReAC7zN9F7wPjuGAsIV8HC/CJbMJOQwtM4yT3iusHwbTHv3+LjLp
	6qfiFSevjAr0HPWPagyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujavS-0000000EqJu-0ckR;
	Wed, 06 Aug 2025 09:59:14 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujavQ-0000000EqIK-2ohn
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 09:59:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b34a8f69862so3922726a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Aug 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1754474351; x=1755079151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVGDM3I4SAq4IdauxFBCdAq636kZPPhTHlfXhatdxwg=;
        b=i+34DQNZCmsx9C0LA8zjNNT3wq80ddG/ATPUTNgafpIE80/LqQEhW9zI9uNqnRvFuR
         tw438YSbEA7G7U/ih9cyATlck4WvKODA3RQSCw+/QbW/hQmEnpFXKbDsf/m4srLUWDDf
         1anUSkN2wvx4wNqOowbqdDv9e2uZ2ajQeHa9TppELBaJ5peotnwW2f4r0ikB7EKpYUyn
         R7xiXE1bCnjQREG7IsC523cMSmvDrVHWf84S3pXgbaMVXgJa3Ff77YTwPH/ydEtv7PjU
         aFXYuco7Ca/Bfu/TLL9+MwI8K38SuEb87WnVvkC2+lRKLzhY7QmrHicsQfvoxdb4wKh0
         CDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754474351; x=1755079151;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVGDM3I4SAq4IdauxFBCdAq636kZPPhTHlfXhatdxwg=;
        b=HO6aspEYhhc3diXi5pIM7pt20Jrr1NC3APVbwcCIysVGhutwSdQnXS9Cv69yMUopgz
         fU2oJTKwnF5D1Kz2dEas5H1JyRBa71efsvCLk22sbnWKiEbTN2hVH14GGIAjucbnE6vq
         zUvsSsROTVmG2KTU5GXv1bTF8cfe9YfTKDFmelf8hSm3b6qn11APvrE+p102x8RtgsOD
         OFl6ihWQXu9RrCiU0BydRj4vZochGAGsLEJjTdlkuvB2HabrHn0PpyapylZx2Wiu2hGw
         ugOZUPaHeL82L1EwjX21Sl420RSklavP6alJAPFbNo+EaxzHdPzGaO4x6cXaN8tu0iVD
         OkIw==
X-Forwarded-Encrypted: i=1; AJvYcCXVy8kMZXtGkNg1meCnpQy6Dwqec9pCvIrzqHbjO0p/7lzu8TZ5af6kJBRQXJDWMjb1FQbntvuXUDnw7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwujLuHyMN+Rv5tSt2Pq6tvlgIEaroNcAajU4DiE57ArjMgbpYf
	gn+MYyFWgxHt1o+WPW2I05IR+c9DgpyXYNpaiYNNq7eJpGb1Wchd3KVkaoYXE4jXgH0=
X-Gm-Gg: ASbGncs3KpgFfKxnBBhZdjClMis8L//0dG+IE6rne5OATGuz0SlCh59Q3U5IuJOKAPH
	lwkPlg2MRlq3QPn1IfZ+rk/DC5uzhOfNgPIJHdHLi5y7TOl+7xr4RvCfxORUiaoHJGXWaNcnffp
	9E7+VwCa9FtIwu/E6mluPeEv+02b+M5VaG5bT70cSasD4TWHy8ZgNPqyJ7LJwmvoD7BnRgbvppm
	OKNDod7AfOpuUcYR+F5tLOEMZXwSwviDUpJUoBMmMokVwjeFKQHEIzcwjZoAIlDMt+ndQqUaZLt
	FjXVV9Le2sVQMtWPpRsZvfn06Am+dy/N8CoA7OMU+XXAVMS4NOUgSNy7TkbqLZSqk7qvt3moRU1
	VpUAM6nAdThQDQLgHW8QzTp2jkLrdgAMB0Pg=
X-Google-Smtp-Source: AGHT+IFDQkiy8dEal9JGcheFb4DCeMC/D2uxTEcourcA4xojZOo5yHWKjW3OBM8sYPB5X5rv1iZYAg==
X-Received: by 2002:a17:903:2302:b0:240:25f3:211b with SMTP id d9443c01a7336-242a0beacd1mr26147005ad.51.1754474351119;
        Wed, 06 Aug 2025 02:59:11 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.244.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c03sm154551605ad.97.2025.08.06.02.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 02:59:10 -0700 (PDT)
Message-ID: <953d2f4c-d82f-4e8f-a905-b7dfbf690ef7@ventanamicro.com>
Date: Wed, 6 Aug 2025 06:59:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 stable@vger.kernel.org
References: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_025912_708594_AF96D7BD 
X-CRM114-Status: GOOD (  11.41  )
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

CgpPbiA4LzUvMjUgNzo0NCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IFRoZSB1c2Vyc3Bh
Y2UgbG9hZCBjYW4gcHV0IHVwIHRvIDIwNDggYml0cyBpbnRvIGFuIHhsZW4gYml0IHN0YWNrCj4g
YnVmZmVyLiAgV2Ugd2FudCBvbmx5IHhsZW4gYml0cywgc28gY2hlY2sgdGhlIHNpemUgYmVmb3Jl
aGFuZC4KPiAKPiBGaXhlczogMmZhMjkwMzcyZGZlICgiUklTQy1WOiBLVk06IGFkZCAndmxlbmIn
IFZlY3RvciBDU1IiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KPiBTaWduZWQtb2Zm
LWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KClJl
dmlld2VkLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFAdmVudGFuYW1pY3Jv
LmNvbT4KCj4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIHwgMiArKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+IGluZGV4IGE1
Zjg4Y2I3MTdmMy4uMDVmM2NjMmQ4ZTMxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTE4
Miw2ICsxODIsOCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3JlZ192ZWN0b3Ioc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgCQlzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4ID0gJnZjcHUt
PmFyY2guZ3Vlc3RfY29udGV4dDsKPiAgIAkJdW5zaWduZWQgbG9uZyByZWdfdmFsOwo+ICAgCj4g
KwkJaWYgKHJlZ19zaXplICE9IHNpemVvZihyZWdfdmFsKSkKPiArCQkJcmV0dXJuIC1FSU5WQUw7
Cj4gICAJCWlmIChjb3B5X2Zyb21fdXNlcigmcmVnX3ZhbCwgdWFkZHIsIHJlZ19zaXplKSkKPiAg
IAkJCXJldHVybiAtRUZBVUxUOwo+ICAgCQlpZiAocmVnX3ZhbCAhPSBjbnR4LT52ZWN0b3Iudmxl
bmIpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
