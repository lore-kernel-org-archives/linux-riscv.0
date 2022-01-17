Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4126DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 17:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wLK5EQpWOgVhVp1QbamkNc+iveZxveJe5oi4bEPYG0=; b=afQgWiCN7WA651
	aiuf7psxkX1cngU1grNPWJMzqtB5AvY4L/9nJnBUuSUZeoYgqSOMdORJ8PL+gvwDaphlqioWV2b3V
	uy6/Fu33N/k5CjO4iJ73S6+UKVK7bdORIpbGFnAFd3auDgeDmn0FEjAFuyC5YeMXAzdrJD0CepA1G
	wuvP9JcLdMg/rxVG0S6tZA0bIz8OuzhLNPK/5s3OQP8rLE2WKRR35ZcsIikaZwUCPU0KTJ7LkA1BZ
	+CoUtz1H7YQC50YVD8GjhIPh2bZa6yibDBs9BC0ADN+De5a3Vxe9m+SksvGYz0u8Tj28rOFoucJkc
	/ljNF4amdFdjtvLHqP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Vt8-00FwuT-3L; Mon, 17 Jan 2022 17:33:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Vt4-00Fwqp-Qv
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 17:33:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id c2so16521872wml.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fZgWPWOX9Mc6FibI4zRymEqtmZX2ottHTayO6iuSsq0=;
 b=OyzcBB+qy5rvsCZSRU/KkaPmbiHFhhrAtEzXEnoLEjKYvIWrJbt/DrsVNf5Z1udWOv
 PSad0frh2KtmWQkbt1/rDEfOhb3RaB0rMZ1kJZKXZ6/YDx5+9O+5lDpgPaPz82EFm9Cw
 +mSZuEhsmXaE6uZ1AI3nwGfVI2sPMZ3TDGHlMzEcMEX1bxBMCcvcAJZdU4L2ugw05agX
 ycMVOidCPnZLVBjLoCbG6RL/IjBrjuvV0YB33RQscWORkd9yZM1rqCOKATLkRMuWLOYj
 YWpuuJoS7kqqNfpCQNysX9au6OUkpuGzS149cxyNE/taSa8BU8E4D1/0jxqMI75I3ZTt
 +0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fZgWPWOX9Mc6FibI4zRymEqtmZX2ottHTayO6iuSsq0=;
 b=3NxDvyDLHj2y5lj7nV9IEEsibFRwCm1EDQjZv0E/MdMIpurgaqes6giNqMnxonSt09
 YEUSu3Ku94RjwzHnirsc5iHid0KGg3c8vqZorMERh+QchecOdowmAvSkrwTCBH86xIN9
 wNHB//6cQqSHvqlDr+ctafK5XHE0zTdsxlrJlFzNoRYfiWXZryztt6LPRY1Gn39Q66A5
 aqUpljx2bxK0PSwUuOYJLFErdkjlmEaNjaYGjvSEsYqVjz8VOQeG72C5aGJgIqzRTqgj
 p1kzsJdkMIdnqlcTMMtoFyQFWdGqpPtm9MTCL+t1pE7SxTCnB/ST748AOp3+KganRq9u
 YgbQ==
X-Gm-Message-State: AOAM531dydStWVRcvAjUUPsY7KeDl6WbwelwikjSn33f9xbtLuOzRsUF
 g4fdYpHwqDh4nmMP2leSyAxFKA==
X-Google-Smtp-Source: ABdhPJxqZx/+3nE4cUA+kCqTXZsj9eDyMdS0Rfo/QUBoPTF7miKiD/tyX72lD3xc48L8hcmTZg3B/A==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr20330024wrw.706.1642440821028; 
 Mon, 17 Jan 2022 09:33:41 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id b6sm8184682wri.108.2022.01.17.09.33.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 09:33:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220117154433.3124-1-changbin.du@gmail.com>
Date: Mon, 17 Jan 2022 17:33:40 +0000
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com>
References: <20220117154433.3124-1-changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_093346_977197_69688E70 
X-CRM114-Status: GOOD (  17.77  )
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

On 17 Jan 2022, at 15:44, Changbin Du <changbin.du@gmail.com> wrote:
> 
> I tried different pieces of code which uses __builtin_frame_address(1)
> (with both gcc version 7.5.0 and 10.3.0) to verify whether it works as
> expected on riscv64. The result is negative.
> 
> What the compiler had generated is as below:
> 31                      fp = (unsigned long)__builtin_frame_address(1);
>   0xffffffff80006024 <+200>:   ld      s1,0(s0)
> 
> It takes '0(s0)' as the address of frame 1 (caller), but the actual address
> should be '-16(s0)'.
> 
>          |       ...       | <-+
>          +-----------------+   |
>          | return address  |   |
>          | previous fp     |   |
>          | saved registers |   |
>          | local variables |   |
>  $fp --> |       ...       |   |
>          +-----------------+   |
>          | return address  |   |
>          | previous fp --------+
>          | saved registers |
>  $sp --> | local variables |
>          +-----------------+
> 
> This leads the kernel can not dump the full stack trace on riscv.
> 
> [    7.222126][    T1] Call Trace:
> [    7.222804][    T1] [<ffffffff80006058>] dump_backtrace+0x2c/0x3a
> 
> This problem is not exposed on most riscv builds just because the '0(s0)'
> occasionally is the address frame 2 (caller's caller), if only ra and fp
> are stored in frame 1 (caller).
> 
>          |       ...       | <-+
>          +-----------------+   |
>          | return address  |   |
>  $fp --> | previous fp     |   |
>          +-----------------+   |
>          | return address  |   |
>          | previous fp --------+
>          | saved registers |
>  $sp --> | local variables |
>          +-----------------+
> 
> This could be a *bug* of gcc that should be fixed. But as noted in gcc
> manual "Calling this function with a nonzero argument can have
> unpredictable effects, including crashing the calling program.", let's
> remove the '__builtin_frame_address(1)' in backtrace code.

Yes, this is a bug, that is always wrong. LLVM gets this right.

https://godbolt.org/z/MrhsoPPM6

Jess


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
