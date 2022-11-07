Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF6DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 02:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyWl0L6SiVz5m4l+knzRkaUmkS8TtV6SzLjbkN3RM88=; b=AKmcYeX6v43tm3
	b//9bjZ30OrI81mqnO7+YPhc2rvjA/P5oD3gKRonpqsKQgnlcLEEfftm+vkhx8JE1ImlqVAdddEZV
	qS+DUjzZUrCducBS1kttsWj5+aO1Oe0KSovZalOUN4iiU440ZPllXcGeNjKKjxkiEqQRRzAO8P14s
	gDXvKU04IhlVcvKUu3FLSIiNBX7ZQ5tFWQfUXPYu4c37S0136/MvlwkiqUP/bj76j/Ud1bXlGPMGg
	XDVlo0vY6oFdyFhuGQSChshQ1S4JjVOTJ1NRxr3yrIv5dc28bihZ+R68jtGOfg+1o0ic63ewfIzJK
	WtupmIoKkvWCZ9vRZjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsIX-00BCI4-Dh; Mon, 07 Nov 2022 02:55:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsIU-00BCHW-FU
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 02:55:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b11so9319437pjp.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWOoCPraIwKfT3TJ2UGqA8BagIEiXV7VcCLfAdgHcas=;
        b=h5CuqOt9UMbb8pINbacScKFwgI4Ki3Ph8JYaNPx52uZwSKkj6zmSJoWfBasg9PZN/y
         AvHz7nbYC1DsbeUpFs/cgkfHaCBsW9iHbZ4pRMWI0K0snMMtFoDgtjpQvvOrCY79HMcH
         clHQhYqiSrPbqDUqDai7SWgYVbChL6dcUearVCGuPinzZKT5TDUWO52kbGJYqGTCiWKQ
         8zr+vGYFkY6K6tTrDMDktCPxTRcLpMvRZ4GO5g4UtQ/2shNCq5uyFxomNXoCeFKbhsEg
         w8zi78RKDrpnWwvTtP/NFyWtA2BuEr06V9OuuMo92LdyOj8wBRvpACMtbzKRzkSntv3L
         zs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWOoCPraIwKfT3TJ2UGqA8BagIEiXV7VcCLfAdgHcas=;
        b=j8srHtbj2JiEYeaXTP9he9uYKjHsIKzQsrQE2iLVJDP8uBLWikCkwKDlnWWwjA8iwF
         zOy5knMpCMfYtMw9TjpXxv75A3W9MsPnMUBnf+mTB6sc3WGkGZRdEhjTOWlvry9+HSqW
         j11ANsCQJ5ijqyFcu+GeAxO/d4Utbrm4b+YN0nvBaD3R0+CRqAtbeOyt/rBrdpAYJUAp
         Xb185AcgCA9bWcQV9SleqqkqIhEOodXudjKHZ/x2s/88w2svt9UKpVS9r0oylq2F0+WO
         zwMfWxsRq8u8xR5RQU4jzuzvHeomdu3aCbibltHDs8p5q9pLH32O771R3heTi7yUt6Qm
         wrOQ==
X-Gm-Message-State: ANoB5pmfapM/m8V2I9+YY6wLmaQMCA4YDIXQo9Sw467gVNDUO+IoiUeV
	rjiivbCDyEf7K5Raf4xLbJ/w4hpmwgMJsQ==
X-Google-Smtp-Source: AA0mqf5jDapJui4VBzarerUQi6R4XZ5/ZzYjPi4B3w2KuxTJKcAjPn9b+PpNdbqfiFQ2iY9N1B0xCA==
X-Received: by 2002:a17:902:bc49:b0:188:760f:d843 with SMTP id t9-20020a170902bc4900b00188760fd843mr8958398plz.111.1667789736161;
        Sun, 06 Nov 2022 18:55:36 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-14.three.co.id. [180.214.232.14])
        by smtp.gmail.com with ESMTPSA id v126-20020a626184000000b00565cf8c52c8sm3315179pfb.174.2022.11.06.18.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 18:55:35 -0800 (PST)
Message-ID: <aebae1eb-ed56-00a9-101f-c4e5ab0af91a@gmail.com>
Date: Mon, 7 Nov 2022 09:55:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] Documentation: riscv: tableize memory layout
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
References: <20221106100239.53704-1-bagasdotme@gmail.com>
 <Y2eY+LulWaKm7MHl@spud>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y2eY+LulWaKm7MHl@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_185538_570870_B655E0CB 
X-CRM114-Status: UNSURE (   8.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/6/22 18:22, Conor Dooley wrote:
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>> +   |    Start addr    | Offset  |     End addr     |  Size   | VM area description                                      |
>> +   +==================+=========+==================+=========+==========================================================+
>> +   | 0000000000000000 |    0    | 0000003fffffffff | 256 GB  | user-space virtual memory, different per mm              |
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>> +   | 0000004000000000 | +256 GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical      |
>> +   |                  |         |                  |         | virtual memory addresses up to the -256 GB               |
>> +   |                  |         |                  |         | starting offset of kernel mappings.                      |
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>> +   |                             Kernel-space virtual memory, shared between all processes:                             |
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>> +   | ffffffc6fee00000 | -228 GB | ffffffc6feffffff | 2 MB    | fixmap                                                   |
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>> +   | ffffffc6ff000000 | -228 GB | ffffffc6ffffffff | 16 MB   | PCI io                                                   |
>> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>                                                         ^
> Will these numbers remain right-aligned in the formatted doc? They were
> aligned before in the text form & no longer appear to be.
> 

These numbers also become wrapped in their cells.

However, in order to fix alignment of these, custom CSS is needed, similar
to one in StackOverflow [1].

[1]: https://stackoverflow.com/a/7351383

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
