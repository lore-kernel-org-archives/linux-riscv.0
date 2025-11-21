Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACD0CFA468
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfdwm44qLLQLjuc5pRI0QgPgrUFBHJwYA63iNXRfLQ8=; b=xbEMf/eis9f78f
	ubTSYcuTynnFrWcGbi3rq4PsB4D0s0T/xTKXpeIS76AZcq+ypCwt17HnpSqA/5CQtOF9dUI4QcSpH
	a1jpUPkdKaeQ+5RorDhBBrqo7UEOdjkjSwp5wC66qs5ZTLjcylvI/kTO9GGFGBaF9TbtRTUwfA1CT
	r7uRovKCdj2hAnOSwQTnEu6s8PMhY9zG0llyKW+e+pv8Cp4olnlvSFAWqb4O5tRXnRx3mP7i/Z90O
	HecwOCYwVsDYnZ59OSXhUXdWemrrVQOKeAHpgx3U5C4z1N5U8si/Fg/iI5f05NQqLWROXXftlgvzs
	FQwLKXyglaVSzzs2CMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMR6-000000083dp-0vm8;
	Fri, 21 Nov 2025 08:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMR5-000000083dW-3AnJ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 08:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC2EC6022D
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 08:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF97C19424
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763713446;
	bh=HDm+cQ3E57Rw/aW22/2o/8DFD56OTcZLebchCcKA30k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EwfTg4N66L5B8/nM+2BVV2mkYqrpKTvpzjVCrNXZsdKP4fIaAaxOQEC5mVNn5iUBF
	 kd69Z9TklSKdY4Rb3w+Wiohjp5m9aV3E6qX9UBRbMcVjGGnkjbxBfwpyHOJDQMdHvd
	 rp1nkMrJ/TIHEYrwTEkzDOCqDq5BogoP4ZwQB1O7EoMvRB0WdokHeD693br30F1fB/
	 I1Q8u1Yt+6hz8jsLqS59MY0mTOVLfAMlccV2ZqXuZT6IlnKkidYlF/VQhXODM8ujlo
	 RwOfeu0C4FL47dw7dgeFEFjCBYs1hepbUcnPtG0axIyL31Or4GjKYQXG4P1OXYg2LT
	 NqHJe05O01bUQ==
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1407578f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 00:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVddwIikmfigkTvy4DUFaWvgj9RIy8c1ziPu+NnDsf6do5XkA/5JpJnVY1SJHOo8sKaJlrd3+LJo1PPXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YystU4o4VI3l8sycxCi0jcxhdXgNAr4dItrFUMZ3kNv/dBnsaTX
	xSmb1q6dmIyi8Z5HlvUVAvwhJ9AUINMIfjU6PbSpK/Y4xA1EHjg1pnFr7yhRvqDyiuvU9lN0HjW
	7fDmYsUhAK5ATqkvajKUJDXJMbP4clfI=
X-Google-Smtp-Source: AGHT+IF50+ZT25khXCr5BWbB5f955K3EzGSR5+akTKTO8ruIBzLrBr5HyMTCxBOFOObMcHXPXDQuQGeq69WN85GtTKY=
X-Received: by 2002:a05:6000:144c:b0:42b:2f3d:2967 with SMTP id
 ffacd0b85a97d-42cc1d3a3cbmr1162815f8f.51.1763713445114; Fri, 21 Nov 2025
 00:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20251121063439.2545-1-cp0613@linux.alibaba.com> <20251121063439.2545-3-cp0613@linux.alibaba.com>
In-Reply-To: <20251121063439.2545-3-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Nov 2025 16:23:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ2SLj0hhQ0PXYECd+soKGN0TNmx38sVpO0iN_mHEXyRQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn6YgxX0unEboOo_dGjgAu7Fy2rOtRVLHuIL5-VjcuP9Bd0OZCqE0sqPbE
Message-ID: <CAJF2gTQ2SLj0hhQ0PXYECd+soKGN0TNmx38sVpO0iN_mHEXyRQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: riscv: Add XuanTie C930 CPU compatible
To: cp0613@linux.alibaba.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, james.clark@linaro.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgMjozNeKAr1BNIDxjcDA2MTNAbGludXguYWxpYmFiYS5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4K
Pgo+IFVwZGF0ZSBEb2N1bWVudGF0aW9uIGZvciBzdXBwb3J0aW5nIFh1YW5UaWUgQzkzMC4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBpbmRleCAxNTNkMGRh
YzU3ZmIuLjU4MWE5NWViYTkzMiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC02NSw2ICs2NSw3IEBAIHByb3BlcnRp
ZXM6Cj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTA4Cj4gICAgICAgICAgICAgICAgLSB0aGVh
ZCxjOTEwCj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTIwCj4gKyAgICAgICAgICAgICAgLSB4
dWFudGllLGM5MzAKWWVzLCBjOTMwIGJlbG9uZ3MgdG8gWHVhblRpZSwgbm90IFQtSEVBRC4KClJl
dmlld2VkLWJ5OiBHdW8gUmVuIChBbGliYWJhIERhbW8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwu
b3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
