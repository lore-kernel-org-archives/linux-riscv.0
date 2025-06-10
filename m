Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505FAC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KuFWXp1zUz6L+hQcZnaVdDR6oISafwWbwPYBjYG5aqQ=; b=o6oQ4izMWKGqhhzCAFMl7SMi6S
	TBFgkatLI2HPrKn99IImNFyARzqvTbTXGDLzwm+aa5PKVM65hDRO3hbunl8kcaNmgrx+j9Ffo/692
	pssRscb5eV2WEE/31NSbtdaV/o/TnTSPgoBExvtVRxO/YEpSjQuo5U8cykbOI+Qh4Bw2DcPxr9zae
	UyUTiihkKigKY65tTYMkieQP4rBN9yRE7unhttZ4lo2+fok/4DJtFF5l3RIoiQcoy5O+9vbXPfEen
	+80vFgMgAVNN5DNd9i/l4WVXoaWnXEt4yL1HT8fZaGyXWs/RF4A4xspp+3X8Pk4f5Qi3MmTVLrZC1
	M1XMiw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7ml-00000008HTW-34ls;
	Tue, 10 Jun 2025 22:49:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Fl-000000080DJ-0DOV
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 20:07:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23539a1a421so51236905ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749586044; x=1750190844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9ivsrx9S86u8HBiaynDXVu9vEEgacXBDB8VknWbxl8=;
        b=HLwYh28bsN7K//SvtHALioOjROACYiiS+gy5d5OiJogNJnrogDp/UZZSQYm1CA16uo
         SzpU+XOAxBNEhQpE+xYsdvHRau2It6vxKsrDq+lIZk+gThn7iyq7aG9Zd6MQrgsuiD+4
         TgJxwQOWaiWp5Z+yK/toFK9qYWLyAxG1KyrixVIeOrNsnav0SIUzbJGc9KEaHj16NFwf
         /6VZeW+wP1kJlSw5ZE4p6/7Mno2DLVVYC6oTRg2orraSLt3owxjDXR9y32/ZCtq7JbWr
         K7vR0WbA/MSBaWqljS0ESzd73EA20OmhUYlr4hEWP+pZoJuwnhu3Z6IvewCLgEN0jwnZ
         O7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586044; x=1750190844;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9ivsrx9S86u8HBiaynDXVu9vEEgacXBDB8VknWbxl8=;
        b=OibAaxNZKynmZBm0q6YvxuIH3kYc7PnWGfuIcehgM9eYo2UmuciRwV7wSV9XS/4828
         UJQ3oE/+BjPT5uNhYfXCiIL9+o9/v75T7z3OV7hHkY47yQF+vgXQK/xcVxWFao8PocNr
         2JwCEtAga4G3FSGeiXPFj9veDfbaYXLmSSTaqFDYUaTNOvqwi2YP5VwpHD23A26+k7gE
         QaDPAS40jvGsZPKgjfMc7RE8Z1NlxoNZeCvXWg7MLtLSu6TzUsSP702a+CnBWy0uWYUb
         cYoB+0dQMwrrugecPahrgSHdk+F5yv+7LqH8D8vVvwe4IE9TJSbgsRnsBlBbviI4Lmrx
         b3zA==
X-Forwarded-Encrypted: i=1; AJvYcCVpORmfdlrW4QnxoaJpFBsqe24gnOwk8q1SPtoSKS3MlD8njzDj5FS371R7ePBTIvbVQjBAaN/4kGShpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSInl9Q8VnMTQ2ZSF/koV0zVhB5JFC2+cYzWDYxHXaMZvxBFW8
	ntCLuXJXGY94zSVh8kai+WSDuQRcTel+OHMgTgslvot9Xye5g1oTFHkvJL0mVbjGS/Q=
X-Gm-Gg: ASbGncv+YHreps7hgP8oSAoGx2PIBuEo3IGXixNhEVTOxc0PT6RT0nzvIuLrSCgJUai
	I0sHqUSCUG72xnLQNSOEL0FkpxbVX9XCxuYMsT9goBiauTjFbrmkxwtt059elxi+RUPBCmvs46Q
	y/Mdg0Fb9Xix/Kkqt009JHNhba3S60OEuXmtc7ztfW1/gRoLnfLf2IDNie37bUueZa3rt0789tl
	9aCXEWDCjf/E0QxJx0dwIUmP5vMA1SAddxOO3bwutWo2abB7gectR0j5DBZvim70EjxnZT1BSqG
	8lr7119EKY1gaBhYP6LEKRtmH1JVkWLYozmz0IGOYzryWac2ivYAtG4x5Frb
X-Google-Smtp-Source: AGHT+IHEbTLkjhkPgVR7LBY0WE0PQew4VX94TRVLTFzVkKHWIErfOlXv0qU9OV/7D6BdyLmWtWCVwA==
X-Received: by 2002:a17:902:cf11:b0:234:8a4a:adac with SMTP id d9443c01a7336-23641a99f5fmr7343495ad.20.1749586043748;
        Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603078121sm75380565ad.27.2025.06.10.13.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 13:07:21 PDT (-0700)
Subject: Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
In-Reply-To: <20250603215218.GA3631276@ax162>
CC: i@maskray.me, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-417C3662-1666-4A7D-9800-0F68016C1D9C@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130725_257706_A03C0E14 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, 03 Jun 2025 14:52:18 PDT (-0700), nathan@kernel.org wrote:
> On Mon, Jun 02, 2025 at 08:48:44PM -0700, Fangrui Song wrote:
>> .rodata is implicitly included in the PT_DYNAMIC segment due to
>> inheriting the segment of the preceding .dynamic section (in both GNU ld
>> and LLD).  When the .rodata section's size is not a multiple of 16
>> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
>> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
>> readelf and llvm-readelf's -d option decodes the dynamic section using
>> the section.
>>
>> This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
>> ("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
>> placed .rodata directly after .dynamic by removing .eh_frame.
>>
>> This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
>> specifying the :text output section phdr.
>>
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
>> Signed-off-by: Fangrui Song <i@maskray.me>
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks, I'll pick it up (might take a bit to show up on fixes, I'm 
trying to sort out another amdgpu stack warning...)

>
>> ---
>>  arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
>> index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
>> --- a/arch/riscv/kernel/vdso/vdso.lds.S
>> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
>> @@ -30,7 +30,7 @@ SECTIONS
>>  		*(.data .data.* .gnu.linkonce.d.*)
>>  		*(.dynbss)
>>  		*(.bss .bss.* .gnu.linkonce.b.*)
>> -	}
>> +	}						:text
>>
>>  	.note		: { *(.note.*) }		:text	:note
>>
>>
>> ---
>> base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
>> change-id: 20250602-riscv-vdso-13efdee34a24
>>
>> Best regards,
>> --
>> Fangrui Song <i@maskray.me>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
