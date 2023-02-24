Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB12DC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiX9I4BbBPH2zPSagVa33duG7cIePTrfc0eJUI3QFEU=; b=NN4b26QCNN1hHX
	hiaGh8zwhpT0d8zJeMiPnPrk4o0o8KWQ4neEDkiSDJgArDu5gKxGPWqG5xrp/BGLf+FJa0K8/6oc9
	PzuR5ZpY608hRyH9a/BvAZmaJT4NBAnzt08JCIhbAp9+O0/P2YNYrmOD/EP6Mfpx5r1Tj9u8Dh9EU
	PYfTFiLSz2CslnqrbFwuo1OtbLwgcCLKQnyUPCRL2VESRUL56nsNa6xp38oNqXgj3zB50ldNoy+4a
	J3oweZj37hnTQImDDbYdjpTZ3YvtySNQMQSUMOrAaEdEFn5MrkkZ3gb6Tn9Rd31IiXY53rICnrsat
	K4r8kfOiicK2xWVi2AnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgiC-004BBK-Gv; Fri, 24 Feb 2023 22:38:44 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgi9-004BAI-Fz
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 22:38:42 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536af432ee5so20866667b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 14:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IiZXfgYrspTV0X/zg/5bl8O+J9jjbguyQkrt9WII1A0=;
        b=bzK+Jq7kLQRRdxUfI3rrYPnfSI3JnEffWb9iDWXTH0zft44uEZTbkiVOJXDQdTrACx
         59XzqxmqHVQCjrcalYuHfMAMDZKQoxSe2WvnX0XCrmjwY/IdV9J+qg1BogLexreysUe/
         SokQYPWnZtnNi5IN3KBC6XGp6n88V1leOyFWNsyofCONgxYyK8yVnls6D6c15HzNTcPP
         jzTeweizmYsODUhNV63ps10xzbOpXTwQQGV+HGZen1SeStHtArDAsMd+sxc68prDIqlS
         bUM99cfGDG0fEihCtelGXCu922xUv5H42Pa6/jdLojJVOXzmFnr8QNaJ+entRlwl65be
         kCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiZXfgYrspTV0X/zg/5bl8O+J9jjbguyQkrt9WII1A0=;
        b=BLCM9bksCyBbZE9kLov943FLMEcIZNk60HlZqtpc41Sj67jxtrGkwfuXM6/1I2Og34
         vAji+3iD4PxitVQ2UpnqKrBMg3s7oOAjrzlQ4pthZ+sxp0PS7OdCNiKxwuBR0BrrgP/H
         SEl1ZBqnNaZqpEd6F7iW4Jweb4CfV+rwq5+Py7KJvOIM6+NLKmj16/tSST4KwB/OqFV3
         XMNhZx5MB5nPWvmQTbjSmR/1qvE9rlN2a5D/Ll13sDjPcReCfoRvt26fkBl141/qd6Po
         hTIc+WFFyn6cpEWxKQGyi7POcYR4AidXiprwgn8x+mVeYIaMEbKnz/XIe9LDkf7UJp+G
         iH6g==
X-Gm-Message-State: AO0yUKVlhs7Hxt35Lnwwz95BgCZeWApeRBOHB0KfWZAnOgPvV9bJPk9+
	1H/J9X4kAUJLNjErzvOkzHumj4CIM/qA6/MD9mg=
X-Google-Smtp-Source: AK7set+BcHZfCoW3YN7rlFFqlBxmBE2vpUFQA6KfIVb53xV/67tx3iho0pA7G0cJLfST92ibrVpx3iDHTpAZS3zFhwo=
X-Received: by 2002:a81:ac5c:0:b0:533:9b80:a30e with SMTP id
 z28-20020a81ac5c000000b005339b80a30emr5513757ywj.10.1677278319933; Fri, 24
 Feb 2023 14:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com> <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
In-Reply-To: <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 23:38:28 +0100
Message-ID: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_143841_613386_3DC0B38D 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 24, 2023 at 10:32 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> I'm fine with it, but IIRC the Rust support for most targets was pulled
> out as they weren't deemed ready to go yet.  If the Rust folks are OK

So we trimmed the original series from v8 to v9 as much as possible in
order to upstream things piece by piece, get maintainers involved, and
so on; i.e. they were not trimmed because they were not ready.

Having said that, for the architectures support in particular, what we
had is indeed a prototype: each architecture we added was able to
compile, boot into QEMU, load the sample Rust modules, pass a few
tests, and so on in our CI, using a couple kernel configs. But that is
just the basic support, and it does not mean it works for other kernel
configs, all hardware, all security features, and so on.

So it depends on how you want to approach it, whether you are
interested in the basic support or not, etc. In any case, I would
recommend having an expert on the architecture take a look to
double-check things look sane, run some tests on real hardware, etc.

> turning on RISC-V support then it's fine with me, but I think it's
> really more up to them at this point.
>
> So
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> in case folks want to take it via some Rust-related tree, but I'm also
> fine taking it via the RISC-V tree if that's easier.

Thanks Palmer! We are trying to get maintainers of the different
subsystems/archs/... involved so that they maintain the different Rust
bits we are upstreaming, so ideally it would go through the RISC-V
tree.

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
