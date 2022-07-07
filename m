Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA05C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzjI3TTaoV6EgMEMyacvt6eRMcEnOuqYboy/G1hsddA=; b=fbXD2qmdTkRYN0
	8EJZuzJwLNBMITGwT2MUI0V7Q8yFcjuck1OwXTBYU3I/Yyjpf+WUNmA9HDGIwJ8wuYozzXB7vSrol
	OJjFRDQtfrYAYfYOD1EGWtm4JeOwHd2mbup02TLS+7GQ7zrs6b6eQqw9xoISeOh8/ON3dsdhC4PH/
	KbsADCaQtp4NSPhgRd5HPeBfY3cPPJazVzAAiE2PCJ/y+W5u1MqtPxIgcVCTbZDvigpqQ/Fl0Yzfx
	EVW7iFtDBgPqP3XIDmAA7H97ZEBwooxBojmcye50JTSeFRJ1J+DzjGo1qJv79hagna7PjGoolFTML
	gZNtkuWYnbK5AkoT74uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NGs-00FJDy-If; Thu, 07 Jul 2022 08:54:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NGp-00FJCG-Do
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 08:54:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id g26so31233928ejb.5
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1sF2XMDrDIrENLmTg4wc3PUzzEIGHwWP0RdjfbNF4lU=;
        b=Tipu+mACDJpfXKSnaW5K+Bae9J+VXyid2QbSKIzCY36ylzUgygJUMlyzlOJ7W5J9KB
         a7e99nMEN+Kj5vj+iRqPMaQk2huetI7/o0KcvJd8sc6F8GxYQ3kHonTzN7cSnevw4jvd
         CyWYOuWAwyrwax3q1GUP9Ja6JZMtrHy/dOFKX+oL5FgPSDdffYRdeGoxUrDuQcIe/XlL
         jfg8grvmMwY4Namhj370L/8zaws4upCqPxXLyHnTjFAzmhHZnmvEvCXtSGL41QrrYBdg
         112SNwX53GXV/h6gGjudwU8HzPe6OjpKltDH5FwX8KsdF6qGlLDOt7O10zJs0Y833yGE
         tH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1sF2XMDrDIrENLmTg4wc3PUzzEIGHwWP0RdjfbNF4lU=;
        b=u5B+Q8DALRHhQJhp9AfuOXW7nbat3Xybtoj+uFECay4eKhQwuXudfm58Fk8roTGvvY
         aoRSf5LJrwSFSvI7MBMy2iFhHjY3phTSDWhJZ6DUba2kMRm53LGxsFzgb91gL5sgbj60
         mExq389mZNXliMa36dHslsERgVhSvYeChocm2xGKkYIQeCp23yog9VXzuhet2XUU62WJ
         J7VunKntXREFNoqs8kkWTij/5PBWBD/hqHlW3LMx/7J7wKgEdopQFVgT8rlitmQAgnG/
         hsmqnj6u0RGJ8pEp2R8UFhi1+W2Bfssfgz5KMzdiVg0UIXm0YuDblsjoteSaDU7Yo3AI
         ZXRQ==
X-Gm-Message-State: AJIora+/fsxXYrlWE/j3k/cXnYcB7UCwaYAoblb0jVAFZu5qKzL/Et/o
	CdPHz/tmCf3ZCEb4uIKnu446DAJP5r2QS6qdZCA=
X-Google-Smtp-Source: AGRyM1vM5Wx+tHUl816pkMM1jdinhboCATvqb9d5XTmfPVkbQDVr0gJD0Y56NU/auYtfxmWQvHPngfVpcf8xJE3zPYA=
X-Received: by 2002:a17:906:794a:b0:722:efd0:862f with SMTP id
 l10-20020a170906794a00b00722efd0862fmr43121355ejo.650.1657184036035; Thu, 07
 Jul 2022 01:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220706140204.47926-1-dlan@gentoo.org>
In-Reply-To: <20220706140204.47926-1-dlan@gentoo.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 7 Jul 2022 10:53:44 +0200
Message-ID: <CAJ+HfNgvw344Gy4a1uOt1DeSsQ8aDRK8NXqJrS9_gxcVMrFRiA@mail.gmail.com>
Subject: Re: [PATCH] riscv, libbpf: use a0 for RC register
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bpf <bpf@vger.kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hengqi Chen <chenhengqi@outlook.com>, Netdev <netdev@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_015359_497765_50059360 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCA2IEp1bCAyMDIyIGF0IDE2OjAzLCBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4g
d3JvdGU6Cj4KPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0MtViBjYWxsaW5nIGNvbnZlbnRpb24gcmVn
aXN0ZXIgdXNhZ2UgaGVyZVsxXSwKPiBhMCBpcyB1c2VkIGFzIHJldHVybiB2YWx1ZSByZWdpc3Rl
ciwgc28gcmVuYW1lIGl0IHRvIG1ha2UgaXQgY29uc2lzdGVudAo+IHdpdGggdGhlIHNwZWMuCj4K
PiBbMV0gc2VjdGlvbiAxOC4yLCB0YWJsZSAxOC4yCj4gaHR0cHM6Ly9yaXNjdi5vcmcvd3AtY29u
dGVudC91cGxvYWRzLzIwMTUvMDEvcmlzY3YtY2FsbGluZy5wZGYKPgo+IEZpeGVzOiA1ODlmZWQ0
NzliYTEgKCJyaXNjdiwgbGliYnBmOiBBZGQgUklTQy1WIChSVjY0KSBzdXBwb3J0IHRvIGJwZl90
cmFjaW5nLmgiKQo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgoK
TmljZSBjYXRjaCEKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
