Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCDFC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UvRZM2qmbgElcgmzTi0GnDdXw47H6ESQIPXwFCqsej0=; b=4m/9yXkvwRaJFvtZE53Qz8UwqP
	uEwFrb40fds4wIo4VicHoCXNPJ/NtU4RUDJN0dFhOzjHx8nUwcTEr+gAse5Ctj2RtpMJKhaOsr4ia
	5pI9ALlxRvv+6v/kqzFqRhkncOwX7ViZQU9rIA7Yawbh9aAdAvMp8TcYuUqvaqShptGD90Sm8r4L2
	CEzazxNoE4jrHI8VcEZ97pZb1kEX7VdBFzMNYDW2IFZrzvpZwTfA8vgj3a/WdpZe/j0ilvxIhoPtP
	4O60t6mSDDCTy6SbBcHTSMbjEQVwQwmnTdZxOpAzSapq8D6ahotRJduZbGbDDmkkIH0QrTSN2kodq
	kZvKcJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7x4g-005Hoj-22;
	Tue, 28 Nov 2023 12:20:22 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7x4d-005HoI-1r
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 12:20:21 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E6403F888
	for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701174017;
	bh=OT/NwsH1EQXh9JcSfkf9fcMEMOIOKJX9g5y0v1tHEp4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wGxxCfO6l48oWfGram5U4q5jvFu2XPhYHkjJuVZgUNFLTexjlWXc7oi34lOqxDzgS
	 kw9OzuX0v6Mnh0H11MXEyOCXHj9xT0ltOXLl6HJ4FdihnWe5pPfvri7m5vvleF0xzA
	 1o8a8RK3JAbNHW9kYQ5dMDB6K66ggXHkJg8j54i3c8VdSrFrf8fwmg6LAjUuxaEaaC
	 G73O9e0BW0wvDUsdOTNkaz7SjcJTPCT1mUQdb1P1l6TzfierSvje6dPlAL++hfNeFv
	 n2MRYMz9qywY0aE8/jX4zHPHrWhTRmdAEZBKm99MnHU3sxfVxJrwp9XJ+4TN+fA29I
	 pSJd7BN9LTTGQ==
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-77d78a58352so708717985a.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 04:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701174016; x=1701778816;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OT/NwsH1EQXh9JcSfkf9fcMEMOIOKJX9g5y0v1tHEp4=;
        b=pJJQBR2QZGXw3Dudq7JnmjIrcEouZGWOuxPltJWxN5mnxMVPb/+h+kFZgEijPFu+Yi
         R47uMPMDFB1n5UC7oun8WJ9PPUh5+AKE6kdZ4GiteoA5YBuOz55vN9HHay3vtB2FTuUh
         8TUYqC95dntkR7qyDFe7Vuk9Ydnqv+voLrAe+kOAzuMLeUQy6iaxGPk5g9G2EN1Qn3Xj
         vhN9D7/H2PDw8vrgLl2nI1JadgI66WRNrlrnomTO/7cEpqMAXfLJhKFmdu6SD0UtyLKM
         dVuk75S+JvWn/SYxSR9ErmKrySIF15RZOVJ7wWeLj05Spuzp3khyzFzuXdk/gYMqhpQd
         JuCQ==
X-Gm-Message-State: AOJu0YwbBlIZbRq3mZ1HQIaBu/CT0ZjOyutURFmVQSB/ACMVD1y3/4fW
	ddwa5bEd3kW9R9monYIaXTMd5GxRFeDtZwl4Tu/Fj8Pfrm7BVKbKJQ7erkozVS9x/L6EwacNZXD
	8xOTMlUi4/qwbZrWmaFbP6F/4Gj5VMEeNP8N93NTV+bIBHmsCNUT+cILgLxdqjg==
X-Received: by 2002:ac8:4907:0:b0:423:d888:39ea with SMTP id e7-20020ac84907000000b00423d88839eamr2065878qtq.46.1701174016635;
        Tue, 28 Nov 2023 04:20:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX8bkt+j0O9kxUuQrWnAv55U9ri4Y/ATTBeecMJhL7NOkDwIFVgEbHZBWwRkC97Z5i8wlZCnBCN4rS4NVDfkk=
X-Received: by 2002:ac8:4907:0:b0:423:d888:39ea with SMTP id
 e7-20020ac84907000000b00423d88839eamr2065864qtq.46.1701174016427; Tue, 28 Nov
 2023 04:20:16 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Nov 2023 13:20:16 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231126151739.1557369-2-masahiroy@kernel.org>
References: <20231126151739.1557369-1-masahiroy@kernel.org> <20231126151739.1557369-2-masahiroy@kernel.org>
Mime-Version: 1.0
Date: Tue, 28 Nov 2023 13:20:16 +0100
Message-ID: <CAJM55Z9f7zd8W9hm+XO+cNTRkyH9HDmRqoNoKsfVQe9OB-6NYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: replace <asm-generic/export.h> with <linux/export.h>
To: Masahiro Yamada <masahiroy@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_042019_746455_32770C37 
X-CRM114-Status: UNSURE (   5.41  )
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

Masahiro Yamada wrote:
> Commit ddb5cdbafaaa ("kbuild: generate KSYMTAB entries by modpost")
> deprecated <asm-generic/export.h>, which is now a wrapper of
> <linux/export.h>.
>
> Replace #include <asm-generic/export.h> with #include <linux/export.h>.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!
/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
