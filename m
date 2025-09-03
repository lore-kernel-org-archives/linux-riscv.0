Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265BCCA1007
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 01:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjMCVh2FYI5AtZ77JP+06Jb0UuagXCTi8nDfAurt/fc=; b=UN+XD6MXOSXp5hnMjim0bk3eb7
	8EQym/Q3BKuMS2nsa6zpq5AuqOJdh8YIyuUVLUKJqaOZbHTo+aDRN93EPdr/C/geHygRrjaBgonxB
	Kipt0sIk5r7ggEmPHG7x0OrcYcJoz6bm+yRZPz9wfJSWxVoAVccHvKX9fYGOXQ3XOsnC1bkHEAcU+
	FFvb97ml5ElXFMna1MAoidgZSvGxLiT/GEx1Rn2XcvSosK2FONe7B7N/oUKuPFVj0b3qKJ8hKElxY
	TgHvPTQs0jZES1vt/l26RbEp61p8A59k2XLwzNxC6EqYpW9xG7vLVAn6wNk+1gAa5mpOW9Vkx91BX
	jdVhS2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbsu-00000002y7A-1iPf;
	Wed, 03 Sep 2025 01:02:00 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbqd-00000002xYi-1pT3
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 00:59:40 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e96d65194c1so4931738276.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Sep 2025 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756861178; x=1757465978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Y06vxPv1L9jWLGnaFGjZfi9MLlAl9lDUxU0w0jvdhE=;
        b=cI4trBLzbZfbINAy9iyOA2Ai0A/5KO4Q5vfqpaZvQ5WErDW/LqSTgUGJpKIzZPvrOo
         wI3WPaJcq1UgVPSPP95bBPapixasGjHcDS2Lc3QVIt2eYQQlh7IEnueyYj01RUdtfBW2
         kkwcDaHK63QY6YlaXcjLK0+5BGMg9Azh0Mx47qiPpVjpSnFe532sGrWmj76a6EPILvOG
         8JtSOw23ta5GtAGUC8XvaRlla/IStl/OcMNuFgHY5z3NnGH5bYN3H2dez6kR4Faak71e
         nO0b08eKrS63LTuDnYdpJm2c1k5qmsFFZ7NDl51le/gKo3uZoWWh9+umRqj66E+8iUKJ
         Ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756861178; x=1757465978;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Y06vxPv1L9jWLGnaFGjZfi9MLlAl9lDUxU0w0jvdhE=;
        b=Y9Es8UgsrzEo7dQZYnL4CfcnJ0CwzqwFnWX5xs7n4JOY45uZklfgemWzdSxHftTOhq
         Rg1D9nmIiVzepik8QKlJSQMNaa+PYU2sQxSBZCJszpsjrMlpmQO7QImLdqFt4KAXb5+5
         uxtTGMwMqhRkfG2VmNVn514vFIbwT0YfekIYqLZvEzJj9+iOcUWdWRWPRH8oPcJx8MX3
         X213vkcvK43U3mhzKus1EMGwWt8mGhnhB7Hh3ZYAQ5OQ6OE27TzQcKNCiYaCPcHudDgF
         Z8gToVfdTYGJN82AgG1hqx9bolfaqv8ZtLE28FxUiFDrIVMnsmrAYBCwBBAaFr5mEhJA
         ijVw==
X-Forwarded-Encrypted: i=1; AJvYcCVhRIlQeNDN2orDuLJjdOWZYZnYme+eLIlTMnbEJ1S9HtG91jfUuI1tEHGcB0zE9ajCbIdOzBYM32LUxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTJRVaJ/5rIMFqeWxO/fpv4WcziUtu/JGQnmp4+hGIqux/lq4
	D/f2gqkQlVHf3jyuY+sgWEClTt2+LyA0ECg+LZRoHCFwt35Xnd6ceK9r
X-Gm-Gg: ASbGnct04G6DGCUVGoZlH8JlZq6t99zBV516OZy2vlrfBJmgZIILG0Hqz9VxwNm/tao
	WzFI7W3boGhJHtOmtr/q69sPOymFzot6z1Ze79cAvSUWZ7ve1jkYpNlWaRmhtH8AXxy2UzX6Uj3
	FU09uDFGn31N3N/fhf54Tl4Ba2HlWoWqGd4RFBtzuBP1Bt2Nz9yV3eVL4QxY+tAeTocwhx+K35j
	V3AWQau7d2tkAhnJRTWL9LKrncLzxIZMvNtGY2+uiUf0e9LDejNPviG3RWzjuOxWeIXSYNkIlIl
	qAsPN9a9KY/azcLD+8BLxPB/uWISCwKiq4u2XZx7EVm0ADTWsy01o9MuWOFhVKmaYRdpy9IZ8EY
	vyaL1ujpe+z3Ir0WFDDigYRDl2+rCccx1WIskKPjnUQZms5tU0ayWez37Ydlw0nxbdldb0EpZ4w
	==
X-Google-Smtp-Source: AGHT+IEDe9TR4LaoFnfze7nZ8Z1pjnS+aIG/ZELW7ocNHanWUV2XSZY9wPTHficq3aOCAX7mED9jJQ==
X-Received: by 2002:a05:6902:2b83:b0:e96:f63c:9a1a with SMTP id 3f1490d57ef6-e98a5839e52mr14421464276.43.1756861177454;
        Tue, 02 Sep 2025 17:59:37 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf57cc0sm1043893276.13.2025.09.02.17.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:59:37 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <e48699fb-287d-42a9-ba6c-5edad86965f4@gmail.com>
Date: Wed, 3 Sep 2025 08:59:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V: Re-enable GCC+Rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
 <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250901-lasso-kabob-de32b8fcede8@spud>
 <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
 <20250901-unseemly-blimp-a74e3c77e780@spud>
Content-Language: en-US
In-Reply-To: <20250901-unseemly-blimp-a74e3c77e780@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_175939_487256_2682CE94 
X-CRM114-Status: GOOD (  10.93  )
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

> That particular one might be a problem not because of -mstack-protector-guard itself, but rather three options get added at once:
> 	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls		  \
> 				-mstack-protector-guard-reg=tp		  \
> 				-mstack-protector-guard-offset=$(shell	  \
> 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
> 				$(objtree)/include/generated/asm-offsets.h))
> and the other ones might be responsible for the error.


I still don't understand the problem here. `bindgen_skip_c_flags` in 
`rust/Makefile` contains a pattern `-mstack-protector-guard%`, the % at 
the end enables it to match all those 3 options at the same time, and 
`filter-out` function removes them before passing to Rust bindgen's 
libclang. Am I missing something here?


> Similarly, something like -Wno-unterminated-string-initialization could cause a problem if gcc supports it but not libclang.


Yes. However, this option is only about warnings, not architecture 
related and does not affect the generated results, so simply adding it 
into `bindgen_skip_c_flags` patterns should be enough, I think.

> I think you're mostly better off catching that sort of thing in Kconfig, where possible and just make incompatible mixes invalid. What's actually incompatible is likely going to depend heavily on what options are enabled.

Sounds better, I'll go down that path.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
