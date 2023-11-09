Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4290C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5nH6/PuArDBwq3nU2umIqAhIYpRDLugQySZwnvWat8=; b=Lky7GAyGYqqjbp
	Sd9phGAjnuhTZqzwqG32gwy6LtQOjQZZSJVWGeGYhgX0kTBniNoYDL1EKY51PtFZ90e5sLe3ilHXm
	8luz3n9ATdWF4a0c6PWFCmwW2aHbFXud2WeF3qsql+GC/5xF0O7PZojQ8bHBSvaJaBraRADd1TwtL
	UVqsuZX1UkQsvodUFXhDRyx3U8bsaQkfkAEGcvPA2Fb2vSiKs/Wo3FL13CcUO6Ks2malUkn/jjyIy
	f8fJpszm9fwpn9suppkajAlUfRxo2hcM5LpOBFeSK3OovY5oDllb5tSOC6V0z+iinHknP+3PqqQUV
	ylcfdlGAvyFEPY90AIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1AmW-00779r-2d;
	Thu, 09 Nov 2023 19:33:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1AmU-007796-0q
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 19:33:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so1303389b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1699558411; x=1700163211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmQUwtKqBsbUaMBDQyLDzBgdhUAqOrOc7yxWsj82q/k=;
        b=igWt2+txPzHI627AHitzhvfduqDkyOdi26ibF5SZ7EYz/saKk+t2s76zbtbR0GTfRk
         /CzpGYDpe/dfrxL7nOCZsnp4m8/yBOGcVB942S9QYs7Qmjm9xwPhNKseoG6gBAlYJpqc
         fH66kq+lEtitf2zF+jWrtDq4gXpy4XxaMPkBGnoHDzU9IUstnEMiZLHeHGPvhfqeGO4e
         28JMVJ+/dliJEfLMAQ5HjPNipCwRViaBkjqMeVo+QVff+sQFj6iaFDS6pMXAO93a2tX4
         6Y6+GBZeEH4Jj4esaXh88VqMtk7hG0+iQ2EhthxBqRzBZmssbkTmMw/XzAJ7bezw/r6N
         iYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558411; x=1700163211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmQUwtKqBsbUaMBDQyLDzBgdhUAqOrOc7yxWsj82q/k=;
        b=BtI1xRkSH0J5FL9lghOvoqu3ezNMoLNRqk8c0CSxWR9x5s4MYVXcC3fZ1eZk2kWBvK
         XsRufRJoKr5Xw3OuKdI0F7lUf9Hxn/zyT7dvUniB0Zqo8LkX3L55B+pXWRVbXRwrXQAL
         3oGSbVq4IUhDKtFhaAUsenVjlVAADrw/FWD9U+B+FDz8da9DfZsrcPsMDFd3mrwZGpf8
         mmZesw9hB+tX2YRDNVX4rAteziREev9tfDdmGPFS3fa7Yyhx8twAdGzAJfiXiq5JBQyY
         8JOqFRY9aGRfUdxp8v9Klu0FUTnw8g20LM2+8w1YtjE8lKdm3C/YUQB2bVUvBD+hX40K
         rIZw==
X-Gm-Message-State: AOJu0YzQmuW8WZummhbD87OK6cCHa+a7XE1GZBE8wPxxHS8vPPL3nqoZ
	FzRt4g2DLSbNtZscluaRZ7jN9Q==
X-Google-Smtp-Source: AGHT+IGH69bRWqdVbLK+NVzUA93eXn4nsYO4Al4pSQgrJlCb5OqnjuN8XHVwkFHQJEaiAPcbiFvo0Q==
X-Received: by 2002:a05:6a20:3955:b0:15c:b7ba:6a4d with SMTP id r21-20020a056a20395500b0015cb7ba6a4dmr7445798pzg.50.1699558410754;
        Thu, 09 Nov 2023 11:33:30 -0800 (PST)
Received: from [192.168.68.107] ([179.193.10.161])
        by smtp.gmail.com with ESMTPSA id fi20-20020a056a00399400b006c4d0b53365sm138627pfb.88.2023.11.09.11.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 11:33:30 -0800 (PST)
Message-ID: <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
Date: Thu, 9 Nov 2023 16:33:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg is
 unknown
To: Andreas Schwab <schwab@suse.de>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org,
 ajones@ventanamicro.com
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-2-dbarboza@ventanamicro.com> <mvmr0kz469m.fsf@suse.de>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <mvmr0kz469m.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_113334_326824_B168CC9A 
X-CRM114-Status: UNSURE (   7.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/9/23 06:37, Andreas Schwab wrote:
> On Jul 31 2023, Daniel Henrique Barboza wrote:
> 
>> Existing userspaces can be affected by this error code change. We
>> checked a few. As of current upstream code, crosvm doesn't check for any
>> particular errno code when using kvm_(get|set)_one_reg(). Neither does
>> QEMU.
> 
> That may break qemu:
> 
> $ qemu-system-riscv64 -cpu rv64 -machine virt,accel=kvm
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1

Which QEMU version are you using? This is a problem that was fixed upstream by:


commit 608bdebb6075b757e5505f6bbc60c45a54a1390b
Author: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date:   Tue Oct 3 10:21:48 2023 -0300

     target/riscv/kvm: support KVM_GET_REG_LIST


If you're getting this error with upstream QEMU let me know and I'll take a look
there.


Thanks,


Daniel


> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
