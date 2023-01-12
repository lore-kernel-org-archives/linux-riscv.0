Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFB0C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5Lv1JWzJqzrY4n+HqlT0KUqYX74SgH5+DR5JID2rjE=; b=YveCAjnCFlulqu
	sd+dr5RJRc6o/i7tDZoOjlNwq+bEA1TC4cifF2iAxqDqO5i7bctQpPaY+ktu8u4ZYj/N1rryEtlsB
	UX87XL2beER7HPEuU6ssdPGELZ8wlHC82JlEb3pDjFemCzHrXe/D63hFzeH44XiKIn/w+gbou3LX6
	/BbBTX0dk8RpGOPYK5c0dWYOrHcWZOmdehSEJEvhBJMUCT3y7IAJCUG3l+Rr5SSA8L6WB6L8laDJY
	KTw/EBsON7rZ5ydWbHjsy5iyFZd8w7WzXXlvDykovcqb0OYAuTi3n3U8Rj+7PmEh0egIe9rOiuIIY
	y2K/uSDIpFBiokDvrQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4LU-00GynL-02; Thu, 12 Jan 2023 20:38:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG45X-00Grjq-O5
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 20:22:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id b17so13845268pld.7
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 12:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhBH0AUTeetrtAjmnA8xJ1rYb8bPDUkKnc3BqPH+Vr8=;
        b=rS3mhpphBBIIxk5efj6bYbJSvFcdarRdauFmIAECEk+U8um3aioM3xJFMomZKzs5Ym
         QTiJoJfRUiobmPocwwp3gFiPmOcizwCmDtfHmVfC3Z4z0meQoicctg4rlYhReVuBRfSi
         PlcP0BXZIRhttkwXPMD6Tmz7nZ809RRSJhgazEHhTw4zST9zr8dG3dutGtbjcJKM9mMp
         po2znQbMwmtxPuFknb4PAzWQPCGcGXPeU0tfCbULINN3vU0hFYSQKHLuEcMj3WCUopki
         3C68lHyxwIoAKaUx2rYY76SGAkwU/+b5Y18lx0WgKG0VNqJ0SL8bpARSIKVcy67fxU7f
         04mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhBH0AUTeetrtAjmnA8xJ1rYb8bPDUkKnc3BqPH+Vr8=;
        b=zqy5oq3qkp9kOYFS02YVg8USH50V1uyUjOkhPI2Uh0//LWWbOUieDUIGTyThaliTOT
         QPdSiEQzIka2AIRe+MgqPsMnm7OznhkYDwkMjnzbkuuRZZgDaJZVHKKBQsYBU5xLjHbI
         0GGVxub5Y/xt8mKmjnkitOLozeSxUm6jJI6jbMI5MnFoValQETAvRFPtXsJiGkvynjZq
         OsrmG+UFEePIyMxSmY3SVi97Yc1pFQDs/Ed2yN/1kPlmFjrVyxNUt8C6cJYUwSQYZxUu
         qZXZm6i3XGvjIsfQJl79Irgmah3J34BqWMA6Zqupwm2GaBeOg9bPFVnwGrSIYBiNq3yH
         a/FA==
X-Gm-Message-State: AFqh2krMBfwqf5iTWpgIqnhdgWw+/4ckuLX+RaLJZ/RlRrwsAreV4XQ4
	hl7Sb7dbvOY9rvMSne+I70SUNA==
X-Google-Smtp-Source: AMrXdXtT63SbStIpg8XEgeo2gFaUX48+aGc6t7ddQ3Zf+rQcJyfjpTq3GQYl21aDOke9bBgtlk+iYA==
X-Received: by 2002:a17:902:8484:b0:192:d631:be14 with SMTP id c4-20020a170902848400b00192d631be14mr33496852plo.13.1673554932452;
        Thu, 12 Jan 2023 12:22:12 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id b11-20020a1709027e0b00b0018982bf03b4sm12587498plm.117.2023.01.12.12.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 12:22:12 -0800 (PST)
Message-ID: <1c0412a7-7544-9398-c4fa-657b7ea59b94@rivosinc.com>
Date: Thu, 12 Jan 2023 12:22:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Content-Language: en-US
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <87tu0xko6g.fsf@email.froward.int.ebiederm.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <87tu0xko6g.fsf@email.froward.int.ebiederm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_122216_054107_7925E88B 
X-CRM114-Status: GOOD (  13.66  )
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



On 1/11/23 08:53, Eric W. Biederman wrote:
> Vineet Gupta <vineetg@rivosinc.com> writes:
>
>> This implements the elf loader hook to parse RV specific
>> .riscv.attributes section. This section is inserted by compilers
>> (gcc/llvm) with build related information such as -march organized as
>> tag/value attribute pairs.
>>
>> It identifies the various attribute tags (and corresponding values) as
>> currently specified in the psABI specification.
>>
>> This patch only implements the elf parsing mechanics, leaving out the
>> recording/usage of the attributes to subsequent patches.
> Why does the kernel care?
>
> Unless I am mistaken the kind of information you are describing is
> typically dealt with by the dynamic linker, rather than the kernel.
>
> As a general strategy I think it is smart to leave as much to
> userspace and the dynamic linker and possible intead of asking
> the kernel's elf loader to care.

That is true in general. But in some cases we might have to do stuff 
before kick starting usermode such as setting up a shadow stack with 
special permissions etc.

> That allows more rapid
> prototyping and reduces the impact of parsing bugs.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
