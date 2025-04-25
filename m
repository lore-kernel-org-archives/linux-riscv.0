Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48347C369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6iGuC5CJDntKvEmfPyfrqS5GRjmJls8RYzsLQijPns=; b=JRrP3mO4ga1/co
	RtXJvzy+sinJnVqbFDE6PxC7+b+1oq9TbCI+LKtx4rnGLYEm79iOc6lYuIyxp5r/d47tFQefABD6G
	RkZTKUmYhtfHhcCi7/TchgMJq3tn0PfrtL1rHPPoV7PJfThKRaEBJdsPc+kEovz89Gl8QBHDOco2s
	16VLRVIqOH4M9kNQe+n3BKQF64T71GZ4+/trsih6gGrhq3fjtggQAtYhKDe5Yusu8fxVENLjfdI7m
	xzg5jdd/jCcMhPKXm2S8Su8G52L4ETOtk+rq2sgxEd46kseJY5UN6YRwhKq2WqyX8TfBlyyfyL7sZ
	FVgH96Rm6US80Lv5+68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JEy-0000000HJIj-1EzA;
	Fri, 25 Apr 2025 13:37:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ibi-0000000HCBY-2eTI
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:56:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ede096d73so16186875e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585801; x=1746190601; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=exjSBJuZHHW8S2I/3j9mRH7f48W7VnAQ9ip1yJvpyG9x6nfKUBov13CyWcropz92fH
         X9e+jJzMGiybWiWcS5qGLCXd4gm4zMVfy+wPO0Gonj9RtihzAUzZfz6pJAA7mkRuAaZI
         /cnSrHSLBhf/Y4zEhE5ogYeKPcOYwqIv3tw4zsVHArLZJJuJZAxRxLEkMLJKH9UxcBrk
         wlVzbyMTrQfsbVKJWZW98OGBcmrkye5wU3EYFApEpKONv3gjF36aTFSoIUtq1lKEOqWM
         dnjftzX+u6qOx4RmzG5kkDS554vvQ1g+MYlm3YBiGKzzZXnBdmG1hoQqM3Qe85bGVkT/
         hNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585801; x=1746190601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=AwHkWWkzo9Ts0TbDhDxNPx+vLOVXbAs/5BJJKDp5pLdHDuHwoNgP87xvFFBNnyCeIg
         CxMPMYteQfDe+sjee4ZTaAWKUMYcX8ZFsMMzUAoT/B6NgbsGzun1Kiyy74GNZAjVWlS6
         8M0AvNsB5k1SuzO9eXC5/6dsCh7Bh+pb/0WooyWRfiMnCdJRibBrCroEni1Za0suMdtd
         meXPsP+q9uT61kreQv0lwblVc5opXqpCTpua3XP1B51y4d/g8s37+J/6yJsRT53JhhAJ
         JA/u5pscVsUHMxf9dWHA0H4Qnfh/hL89iOb5tjdS1EmOghA4ytgH/K3E58Fn3xJAklfF
         RhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1CT6jN7eFzKfsknn+5Sbrmx6rqp9db6Rof6nnrzRRgVavg5kviWHVXBX3EDx3whpWGgvHanRIV3Zcrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdoSBOKrPeIaS2/QnAXXH/qkWETc83LFfki3lx1QuIXM8XRciK
	JXRJaj89kAc2ddmdSQmSI1TFNFa0peO1FD9FTIWzhTBfnmY2VF3ntUUI+VXkzo0=
X-Gm-Gg: ASbGncvjl6mx4dV8MhDWEbyrkI+llYdjbkzUeqNUGCSmckRjn2gw+tME3OGZ86V5ctF
	Lc4uDFN822IFbR8FCr3CQHaTEnoHV3/WeZJpdfyHz98Uy2R4OlEgMcF0ESdABxT8qxyvqIiVo5U
	KdhhC4rjla7CZeXPx721jAxgGXst0taLt8BEsyIhlGqslG4KiHSlJOfEeZPcmyvEaWIHC9NeT14
	JQLD/lfQH8iz/5Txo00Mmjk0Kur5JWTgVOuOCJj29EtSQtKmv12q2TeD2LzUS5aeOWT0cFagLuT
	SvZ+W2vf7PAqlFbaulHgcG+TaR5ceBKAhNMXjsA=
X-Google-Smtp-Source: AGHT+IFmUXNw7ABwk1AMQuio7wlOtcBFgvt+8iHk6nXh+9b35mkhblHJxA2ykHiHusAsYgEzWN0GCQ==
X-Received: by 2002:a05:600c:1c1a:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-440a66aca3fmr17281115e9.29.1745585800956;
        Fri, 25 Apr 2025 05:56:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm55907865e9.17.2025.04.25.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:56:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:56:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
Message-ID: <20250425-657823a94b7228b742cbe122@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055642_666343_B65A1C63 
X-CRM114-Status: GOOD (  11.16  )
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

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjBQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IERvIG5vdCBkZXBlbmQgb24gdGhlIHJlc2V0IHN0cnVjdHVyZXMuCj4gCj4gdmVj
dG9yLmRhdGFwIGlzIGEga2VybmVsIG1lbW9yeSBwb2ludGVyIHRoYXQgbmVlZHMgdG8gYmUgcHJl
c2VydmVkIGFzIGl0Cj4gaXMgbm90IGEgcGFydCBvZiB0aGUgZ3Vlc3QgdmVjdG9yIGRhdGEuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmggfCAg
NiArKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICB8ICA1
ICsrKystCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgICAgICAgICAgICAgfCAxMyAr
KysrKysrLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4KClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
