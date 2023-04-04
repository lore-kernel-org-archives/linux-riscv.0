Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D44C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u22qNyUFmGAefa+V69gzfGXAvXNT4M0IW0UL48VKUhs=; b=QwAeFGi+TLz+KI
	Yb42UJELrFgL7HKSjcMegKI8mpw4EImM0sjPCr1CqfVaAVmYA9op1S0NPanJVTOMjf2KMIwvybN+n
	fXr3mae92D94eWVOJgBEVdp93p/TxoKqD22ieC12XI1yAoM7ZcyOXyweVl52olmkloXpqZYdPEcZO
	vYi+6+h5+t3lgWZyJfsw60Sp6y6xrlYTlCN8AiuQtp5tB73qd+HA97BRX961ch7TqWrf9sexRNCTI
	j6OAv/T4lhkDe+GskADOwk02vStBoiI/pVVe6XIdCTt4uW3NbuXtALJKAz8zgTmKj48Bh87JsNuyO
	cSVgMOGL6uQniTziBR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjx2-002I9k-1J;
	Tue, 04 Apr 2023 16:56:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjwz-002I7E-0e
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:56:06 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cn12so133315193edb.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680627361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDkPzCPbOwFeM8pNdOTQrKFLlnDQsoU1nXWtiK+e4mA=;
        b=iqVXNb1R8IhevzghcBO7gutyLdEil8JOM8mrMNUbzoGbutuR4NhoydBe6+ztX7RaJ4
         ZcbQM2+TDOSHPyJg0o9hN/vcHilQk0aOrtGsH3kDLRy6qXniIe+VaEYeA3ejGLWJSUEU
         Q+ZwU6x/YAT/pVpnQApEznh4Qdj6GtTBWOi3A3S6nNa3ZptUSEY0Z8KENFgytfb8SBmx
         2Fc6eOj6GTEc8LBZb08sVY2ZOeR74va24Ca910/PYw/TUfYAwMYEx3bDCkM2IHGk8G/b
         rrYX9wGAkcGnDkUCv5w6XXbhRbtX4UIoLG/qoC2VU/Ad8KTe41EaYV00qzZPoIr/85iq
         tyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDkPzCPbOwFeM8pNdOTQrKFLlnDQsoU1nXWtiK+e4mA=;
        b=19AMB5UdeyQp8mU9V3iIy6rwF3Pc39f9GR7EmdI1PdVOqKwzoLsny9VeErLrrmib5J
         ZbqZz0BQ/BA6E7V2Zl7dHNNNzp1FQWJ3jiw9NKHi+vUtq7cq8LALTj0CewPAuebdqVS/
         3c9oKxMR854HNVFO0ukU58ahVvlgfH1VLSph49bFcE6CI8gqU2Gn9dMAdtBlx2DXGoja
         +ZGVLU5xcF6X6Kt9u0dUbYDiB5qG28AC9YTcSpGa5/JVtZzbJlB1SSNCqYsNa927Jfgq
         XKVEQjHWc8wxktR75qfLbqkUq2GCj9U0RXrkGEnXwwtqZ9E8Bu5EaJMMalTvnOUpbw/R
         2fxw==
X-Gm-Message-State: AAQBX9eKQ1i1AoeFzZF89VjISiX3UVA0iqgxb9USVAyRqtAorM7mXPyi
	BdvyLN9HwTsUVfXUeURjT+9RgRn7IVQRiFNdUmdyNmGLayfQAiBU
X-Google-Smtp-Source: AKy350b+i1ZaHEs6KA4tVR+ORII+g9X7ahgaAwofvUDz5ArlGO5oyFewenVOA2gJs50Nil3n4pEW5ATyQv1fgM49iYg=
X-Received: by 2002:a17:906:3e54:b0:8b1:780d:e43d with SMTP id
 t20-20020a1709063e5400b008b1780de43dmr103679eji.13.1680627360948; Tue, 04 Apr
 2023 09:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-3-apatel@ventanamicro.com> <20230404-facecloth-curdle-f2d5d46e1375@spud>
In-Reply-To: <20230404-facecloth-curdle-f2d5d46e1375@spud>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Apr 2023 22:25:49 +0530
Message-ID: <CAAhSdy1Qk2offdz3zn0gNQKbhBy6a5MmRG0i0pgRCDZBH3dn6g@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] RISC-V: Detect AIA CSRs from ISA string
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_095605_432522_3A1A3001 
X-CRM114-Status: UNSURE (   6.40  )
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAxMDoxNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KPgo+IFRoYW5rcyBmb3IgZml4aW5nIHVwIHRoZSBvcmRlciBBbnVw
LgoKSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGlzIGluIHRoZSBjaGFuZ2UgbG9nLgoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
