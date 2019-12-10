Return-Path: <SRS0=1Sxd=2A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAC6C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 06:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B544620663
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2019 06:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BVwA5ds5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tQOU0We/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B544620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iJIcIsuvyaKuPCjR081dtZXW++oZ7hj1JifXMC1F5Q=; b=BVwA5ds5QsMyxt
	/X04RNssq3chzMD1GsD15E5l53Mvri0VKGJoq2PDWJhsVPhjAhsjromQLW/ewRGp0cY43dgWnnxr+
	UkbRa1UiO028R7XSvkrYABToBZ+hpE0jtD3uf9pZU2orXWicy6jqEGDczWh7xkXVgxfmSB8pNMktF
	iAujjiONZjtAyPTBYlTR2YkSMwRD4pBqB9hM1WVS+2AWL2GBs8+6NLCQVoTYWZpj+/aFpefmk/d0H
	L+vuvJYOsDRqDN9Y3Sz0m10aN53N0fJx+cWcZ7tSdVY3WorjO9mUyy7wIfWdAqKVq/8BhmFDGcLA+
	HsYbwerX6TZOy5K8Q0SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZ3d-0002qw-Pw; Tue, 10 Dec 2019 06:31:41 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZ3b-0002qU-LF
 for linux-riscv@lists.infradead.org; Tue, 10 Dec 2019 06:31:40 +0000
Received: by mail-qk1-x743.google.com with SMTP id w127so3712669qkb.11
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 22:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9iJIcIsuvyaKuPCjR081dtZXW++oZ7hj1JifXMC1F5Q=;
 b=tQOU0We/iItFc8KG52IjN8yKcohDPXKl7RkDmRCr0JGDbwrqD739SRmZx4HGmE4duI
 J0XY+auZyepuaZAvGnbKX4M4p+YIq7Efv67rta+b3j+CyjCd0EZT1RCxCvBb+60Gb9Ck
 VLYhzDBNSrWqlwtit3o2w9SpLFsUDQIwDXzOQFY8+fcGXIIx6EA1NKNgIaDameUMHFSF
 ybar8inmlhJw+69UVINPdq2Q/SvHrsAqgN5f/8AuSxN7phLbDq8Ew0FR+p9hZiy1Bc+T
 dYDqmR70lInb3Av9ACUArifbaKLjrHCfEIaJ1aPxVQlPLmvw3vD97UJBHAGiOHoxK+n+
 YHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9iJIcIsuvyaKuPCjR081dtZXW++oZ7hj1JifXMC1F5Q=;
 b=Rd2mg7eWARNWnD0gBeN1xU6qn/6m1KAytJilkRPueoC5O4QtL9lUQnGR2z6VwAumMv
 mLUhqQpYVaMCvdsU9/IJZam9EJsxQ/Wf+Z+G9XFBjNCax3ip4QVIaD1GQ5BcrCeCupWX
 +018qB+wS5sywGSk4Y/OXranAyH0lQ+zEf06C4hAHHlZORUbJ/+si4YC8kbSlWpWXHcc
 CG43AF7CO5gQQn2faTMGv2PUbrQL0uCh1VPmUXsExPQpjqI9/4FKG9xckQxbelL3JnNX
 bdfVwx+z9BXvjJbG19tr4kkt4zSMbcb2OJ0Bx9eABb5YUs5Ry68jlQG/Qxl9s+ybHDN7
 Ty4w==
X-Gm-Message-State: APjAAAX71c0d0vKVQ74EHsNj4cjmweaz7I/yR8TMyf1EobeTCcyvgaUJ
 TBpCftGBjxViH7FLE19cQ4VVwFoom+rtb+3Tlac=
X-Google-Smtp-Source: APXvYqx3F+LQFuqQ022bdlz/MnN6T1zHXpSEHoXO3K+x8qu9cpOaRxwv+CVqGdE058LR7mSeqLWqg50/WQvlj45HWMQ=
X-Received: by 2002:a37:9c0f:: with SMTP id f15mr31583276qke.297.1575959497981; 
 Mon, 09 Dec 2019 22:31:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575916815.git.paul.chaignon@gmail.com>
 <966fe384383bf23a0ee1efe8d7291c78a3fb832b.1575916815.git.paul.chaignon@gmail.com>
 <CAJ+HfNgFo8viKn3KzNfbmniPNUpjOv_QM4ua_V0RFLBpWCOBYw@mail.gmail.com>
In-Reply-To: <CAJ+HfNgFo8viKn3KzNfbmniPNUpjOv_QM4ua_V0RFLBpWCOBYw@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 10 Dec 2019 07:31:26 +0100
Message-ID: <CAJ+HfNiqtF9T-C7a1NoSekSAW+Fpr2kH2EghLDiRmf_+-Uat-w@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf, riscv: limit to 33 tail calls
To: Paul Chaignon <paul.chaignon@orange.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_223139_697240_943100F2 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paul Burton <paulburton@kernel.org>, paul.chaignon@gmail.com,
 Netdev <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <kafai@fb.com>,
 Yonghong Song <yhs@fb.com>, Mahshid Khezri <khezri.mahshid@gmail.com>,
 Andrii Nakryiko <andriin@fb.com>, bpf <bpf@vger.kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 9 Dec 2019 at 20:57, Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com> =
wrote:
>
> On Mon, 9 Dec 2019 at 19:52, Paul Chaignon <paul.chaignon@orange.com> wro=
te:
> >
> > All BPF JIT compilers except RISC-V's and MIPS' enforce a 33-tail calls
> > limit at runtime.  In addition, a test was recently added, in tailcalls=
2,
> > to check this limit.
> >
> > This patch updates the tail call limit in RISC-V's JIT compiler to allo=
w
> > 33 tail calls.  I tested it using the above selftest on an emulated
> > RISCV64.
> >
>
> 33! ICK! ;-) Thanks for finding this!
>
> Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com>
>

...and somewhat related; One of the tailcall tests fail due to missing
far-branch support in the emitter. I'll address this in the v2 of the
"far branch" series.

