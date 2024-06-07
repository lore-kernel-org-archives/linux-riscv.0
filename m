Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C8AC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mjvr1e8WB/LBeRjLAlH7R/mBE7GR1sbG/WtBooionY=; b=vvF/7mF5222Ts1ugVzronO1vsb
	x+9AL/K3fJMdHFMgNcouva9yvc1ZnoHB1mtNp1THTWRQKn+8SQiGFYuYABMHwxjLFy6jkBJ3qrLNd
	zWhR2dt+Jw0Iy5dDbtw+8tLODl2EHF+OXAI0C8vnHWY90aURJ7XxLJOPm9r4e1g9owfOsEEW4HUn0
	9cz7H63/QZ7/IjERAqq9/e9KGnSoB1ZsrQorBnccthufvWgkW2N/Rwuq5W8Q3h+IIp98ecmAL9C+X
	DTvv9Jo/YLNcx1Av5Av5UuC8QacWD2H66C2tj0WfyMt/jXLtPVaHjjgleRHUF106a8sPy+lsm3ZPi
	16PwXX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFegI-0000000FJvu-3Pu6;
	Fri, 07 Jun 2024 18:51:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFegF-0000000FJvQ-0cZ0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 18:51:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6e183f084so5537705ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2024 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717786270; x=1718391070; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=spdlnQosYbgxz0z1aI+nHwJdAm4uQJgtsueSAk82Hto=;
        b=Hv+lYCCQIEuQOGoWr6wsCGOUgB7U0l3W3NhWsv7M6PFnxwrLeIkpPsGf4M5x7G5ol5
         REmFoPfCaqsIHeYWdEWFcFs02TJPIaBxX1MsYEudldLPZCedgJxkNz8MWVIiWiivvuAX
         piIkQCjzL6htN/pBAOqMqiOPR37eBNnDCMKdCWaG5LT4fEvIZA6FTfdnQfHxNb2UMovY
         wkye9a4prkuFAhyYpD7kPz7dVOYaFzNCX40yBEuFPzGw0AfpfbRiHU78wyDDsZTwmFdv
         11BjsP4FBpXK/dGlqYg2OAm431u5af4E3bGrbomfjWPn/KxUwxmmtvpqQ+WQNsh6iTDn
         hjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717786270; x=1718391070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spdlnQosYbgxz0z1aI+nHwJdAm4uQJgtsueSAk82Hto=;
        b=TcV0wrFglcusyFIBZAEidu+VnwjwqInnhOszJPhePjGZrEQpWts+PON2tUSxOK+eON
         eJawciGS3scnPZPMDO17bzuijRKjvY9WON9u5dNo6ZmSN+4JJElf/eRMLQmoCqsUcbqi
         TqSVUQdb+3DgYir2tvkllz0sQ/XUXwOgTlNOV9Aj0sOTxayswltK7imybe/UGsi2ShRM
         l3FYgD7stOnVnknhJ/ieN2Kw6/RqFb2QJWbva8D/kmmLgscFhVCIgIkTfdWOak8mMQvj
         UJ53T0LXIMD1qdX1ptexMjPGvNeW8qGVDuEdVxHlc6/bdWzxfIwHN1ei+14A7j5hY9PA
         Caww==
X-Forwarded-Encrypted: i=1; AJvYcCVX5qYaBjIp03t1itUbGcwBsXJsdUHvON+00uepDwO2ifS/QBBRoma5hOb1VrJUeM0Ly86ILuRBp+aZTqh43hO4ldg3yjAFKnPDr0IV1tMs
X-Gm-Message-State: AOJu0YyB09hwmq16yQWWApJz9ZpNboJupd0NT9Gs9kPLfZ0Qxi9Mv6af
	2iEWGUgLr+AjVdSyUWKQBzqpjvBxHbtmB2MWBL3yCWgHFv0n2YDrFftsboiVjlU=
X-Google-Smtp-Source: AGHT+IGMjAuAS3XI2gD8/NyTDV8hJlKEUmolHeTNHvKFVpM0ZupPk3AuvNMIhwwVwTDX8d6lLV85Cg==
X-Received: by 2002:a17:902:e887:b0:1f6:8081:6818 with SMTP id d9443c01a7336-1f6d03c0e1dmr36550955ad.52.1717786270083;
        Fri, 07 Jun 2024 11:51:10 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ea2d17c5sm7512365ad.46.2024.06.07.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 11:51:09 -0700 (PDT)
Date: Fri, 7 Jun 2024 11:51:07 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240603-stinking-roster-cfad46696ae5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_115115_323719_9681907F 
X-CRM114-Status: GOOD (  27.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>> Hi Conor,
>>
>> On 31/05/2024 19:31, Conor Dooley wrote:
>> > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>> > > Dectect the Zkr extension and use it to seed the kernel base address.
>> > >
>> > > Detection of the extension can not be done in the typical fashion, as
>> > > this is very early in the boot process. Instead, add a trap handler
>> > > and run it to see if the extension is present.
>> > You can't rely on the lack of a trap meaning that Zkr is present unless
>> > you know that the platform implements Ssstrict. The CSR with that number
>> > could do anything if not Ssstrict compliant, so this approach gets a
>> > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
>> > it, so you're stuck with getting that information from firmware.
>>
>>
>> FYI, this patch is my idea, so I'm the one to blame here :)
>>
>>
>> >
>> > For DT systems, you can actually parse the DT in the pi, we do it to get
>> > the kaslr seed if present, so you can actually check for Zkr. With ACPI
>> > I have no idea how you can get that information, I amn't an ACPI-ist.
>>
>>
>> I took a look at how to access ACPI tables this early when implementing the
>> Zabha/Zacas patches, but it seems not possible.
>>
>> But I'll look into this more, this is not the first time we need the
>> extensions list very early and since we have no way to detect the presence
>> of an extension at runtime, something needs to be done.
>
>Aye, having remembered that reading CSR_SEED could have side-effects on a
>system with non-conforming extensions, it'd be good to see if we can
>actually do this via detection on ACPI - especially for some other
>extensions that we may need to turn on very early (I forget which ones we
>talked about this before for). I didn't arm64 do anything with ACPI in the
>pi code, is the code arch/x86/boot/compressed run at an equivilent-ish point
>in boot?

cc: +Clement and Atish

I don't know all the details but on first glance it seems like instead of ACPI,
may be FWFT is a better place for discovery ?
https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479571

Supervisor could query if Sstrict is implemented and then it can check for
lack of trap on CSR_SEED or straight-away check for presence of Zkr.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
