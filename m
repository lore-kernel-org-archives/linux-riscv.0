Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58CFC47258
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jan 2024 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kNpHZlzhXOJd8BDzxCL3zvqyOI4YkiJ7j85TSP4xXAQ=; b=H71CcguHndB5hl277zFEwL4yKz
	9HjaUB63JI7kVEWWog2/QQwgxJP+Dysn3xYdh6R0BQ+JsFyGMw8bj3viRtFlLK/TZAZosUuNxU3Fm
	zNw27K5/TQL0deCD759GqiuF2W8cZP+MILC0RuH3xWsSKaAEEzXv224yJc4BWPQOXIcF687qM5aQg
	g851SUWCEBLwGVUDBoPHEIr3LO1TU7iRoEaWfZZnDaWD2KmgPYe30KmJqLgRSDZ+x3qZhnIFJa+oz
	QTNVYt5j1p0j2bkX5tazBzZPTuDup2+0VGKe1JSgrHak5gH7WvN1ArajdKiAB2wUkXx+0TYjUgn2y
	Fc1+VEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRNzX-008ox8-2k;
	Sun, 21 Jan 2024 02:55:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRNzR-008ovy-2c
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jan 2024 02:55:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d427518d52so14839085ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 18:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1705805714; x=1706410514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3B+/NUEVrUEstAbkh74NA2n7DEd6z8SVAOvTWJSJMNk=;
        b=LgijJWjKC2RLMjcxEoXHNHDyevoU7Wm8Y+2Non7IPDdUiiicey89BP5ZQR+INon7eH
         k04O60CN4Hx5X1mz0TTGK36zTu/gv4Y0+lO+CcTiNWvb9SQ8PvAfpxqDMLX4wIGwTNNq
         zn2xg5bv8nX2aau1aHuq1qhVexV9RCdM14i6V88OGPPw76uiFQVCg62qB3WyBUTuNJQ3
         N7dZvVbxKVTxPs+b+RKvywA1EhhSEzOuHb8ACt5KxWnKow44uGiu9FF5DbunZYLM1WQC
         ZJFrSyOk13YQxwJmT6pVLOeeloc6ZoGeE4Hlzy8swpIMj+giT4lO9e6T42tD0icG2qnU
         7TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705805714; x=1706410514;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B+/NUEVrUEstAbkh74NA2n7DEd6z8SVAOvTWJSJMNk=;
        b=OuSQNNaPDwPeN4Rixvq+5YDOFJi09vhH8vMaY0Tj632foRJR8I+n3gCYN7o7J8Inho
         zyIJhYoZROBy6uiK20ylC24xanNS1Nf6XfGkM3xeCC+aAr73oC+v1VFjgRfnJrYgp4zY
         HhL8ktmDV+WSjgiGq5ePdLll1jXPqHw2WwsNlG5J0EOM/LfAW85D+3aVH7J/NyWhEIkb
         psfBY0bwmGfzEFCBscOKFgL8LhSPsy7seXcMbIFkDwXsdD97tN0R1iFrrn/pI7MF/Vf2
         WC+2L4gcKMPDvzOo9yH7w0kxZvU3c9ZLTcPmlrtFIWE1Y42jTLZw54l5rxUhOcdpgMLD
         OHaw==
X-Gm-Message-State: AOJu0Yzh8omQqjPqAFciu2688mkVqZRNNX40f7bfheCnxLX/+LaTGbKt
	Q+sWOatiETBbM4lNfV1NjqxxUAOX4ePvuyF/stb5aCyLQGSP3Ixki8cA5rRN/ro=
X-Google-Smtp-Source: AGHT+IEmqx0ENeontMtkchq1XVGHG78UCHTB+fp+wDGW92tw3dHtI2r8XaVNfgbNubWhYGDtXt8/kA==
X-Received: by 2002:a17:902:efcc:b0:1d0:4802:3b6c with SMTP id ja12-20020a170902efcc00b001d048023b6cmr2278000plb.4.1705805713519;
        Sat, 20 Jan 2024 18:55:13 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id j17-20020a170902f25100b001d70e83f9c3sm4577091plc.242.2024.01.20.18.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 18:55:12 -0800 (PST)
Date: Sat, 20 Jan 2024 18:55:12 -0800 (PST)
X-Google-Original-Date: Sat, 20 Jan 2024 18:55:11 PST (-0800)
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for .option arch
In-Reply-To: <20240121011341.GA97368@sol.localdomain>
CC: andy.chiu@sifive.com, linux-riscv@lists.infradead.org, anup@brainfault.org,
  atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
  trix@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org, Nelson Chu <nelson.chu@sifive.com>
Message-ID: <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_185518_285812_04314101 
X-CRM114-Status: GOOD (  16.74  )
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

On Sat, 20 Jan 2024 17:13:41 PST (-0800), ebiggers@kernel.org wrote:
> Hi Andy,
>
> On Mon, Jun 05, 2023 at 11:07:20AM +0000, Andy Chiu wrote:
>> +config AS_HAS_OPTION_ARCH
>> +	# https://reviews.llvm.org/D123515
>> +	def_bool y
>> +	depends on $(as-instr, .option arch$(comma) +m)
>> +	depends on !$(as-instr, .option arch$(comma) -i)
>
> With tip-of-tree clang (llvm-project commit 85a8e5c3e0586e85), I'm seeing
> AS_HAS_OPTION_ARCH be set to n.  It's the second "depends on" that makes it be
> set to n, so apparently clang started accepting ".option arch -i".  What was
> your intent here for checking that ".option arch -i" is not supported?  I'd
> think that just the first "depends on" would be sufficient.

I'm not sure what Andy's rationale was, but de3a913df6e ("RISC-V: 
Clarify the behavior of .option arch directive.") in binutils-gdb 
stopped accepting `.option arch, -i` along with fixing a handful of 
other oddities in our `.option arch` handling.

If that's all this is testing for then we should probably add some sort 
of version check for old binutils (or maybe just ignore it, looks like 
it was a bugfix and the old version was never released).

+Nelson, as he probably knows better than I do.

That said: what does LLVM do if you ask it to turn the "I" base ISA off?  
I'd argue there's no instructions left at that point...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
