Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D75E9A02C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 01:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kghNp+Wco4tfOONtO7WUVhmSDmE7d69iedoa6QoG1NE=; b=ysv/B3PxkrOP06xqxppb35Jeps
	zWDIHM5PFneW330A8tlYNWMO1Ib+Z8OfJhRoLhfYbcNOPO7iAW2xwSxsvQv8e+XKPxp6FN2ZLLBFs
	zEsenEoGZJTCD3U3r5Mk/2w2o/M4n3ursaEinJTVPfqdb6ACzuAr2CXqddSWtUifm6nurTjJVP3v3
	t05H2PZAAQfA0TqF3zQkIt7ZKlORB1hRfQYeqvsGDOUg1qAN0cNWjuYkh2YVgAaosg5gDiBgahMYm
	YW49A2ixR1EoHeD0bHh7b4jqzOM+FUoZ6eQEbiR32bfjT4AoTU9zEjZXIcOV0ruH9k3jNkpho9WJs
	9XcDqtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vssqF-0000000Ah0h-0qlt;
	Thu, 19 Feb 2026 01:28:31 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vssqC-0000000Ah0K-3lEj
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 01:28:30 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2ba68df3687so241970eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Feb 2026 17:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1771464508; x=1772069308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eG8n8o11kd739DAqJsN7UrreqZfhA3AkNym6Pn0NffI=;
        b=QUqwE6rzOMJgYU1YnJSQq5vLrZ25YPfTVXiCjsVKuoyWzLAIH6K5j+iblZ+mhKFENT
         7denW7U/V8stvB8B85swLnDckh2cj2Mr95q+UUSnCfh2rXC35TFfVqW6t59r96J+8aYI
         r7xzMVK36wJVuFDyua9QTLzQIb0cE+jPoSN4m6O72fEo3CtvdxxPVIQAwJio8LqkvTMU
         +JPxa8KOy/2WN3vwsSNgbIwBMZj8WXXYDnfcUHqVb3+hvdj2j7XRdh5v6EMaRJLV/Zfc
         7zUjGnriDldqi7BXI5Vp/VPbtOvigvmY3dqDTP+p8PnbqpoNpJ+LyDlSArPzyOP/evAz
         Hd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771464508; x=1772069308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eG8n8o11kd739DAqJsN7UrreqZfhA3AkNym6Pn0NffI=;
        b=MIsB1voUTGDqtq07PbfGP2Vt/OJx0l39Oqo8gBtt2vQyzfJbJQ18c/veQshHHIaTJa
         tr6BS4JNtxRTgxCMEXxuyZvX44W7wN56atw/+OIdKI0oh3ChYJrB+wLXQgM0eRExHFUU
         ZCmzwOddHDPX1cqIvENM/4MjO/DQBv7dRpbi7NFIIf7Gl1ZnEIe/Ie9y64ZrAw1C4JE7
         saf1jNwkWVlEtqsldZm/Em9gfuSV15JViahkBCI0VEAMt8Rvmw3EL1i5y68nM5mskQmW
         SbreH5MZoEaPM8mDaWUfqWRWj/UZRzACsAnqTVhveXOfgSzcM2zsRfbyLjGNlpoZg2I3
         DCNA==
X-Forwarded-Encrypted: i=1; AJvYcCUPv4MbPGEVMus/E70kwC9KPgKVmjBsyHIZXycxwSHo4I6dJxJ4hebuBOXqHzbyMWAf80PxoWo6EvXgWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtWOk3v6qZaHD2AEaQKLLJBY2E/rkV18pcbfZbECcr8zV6+0fK
	s+NCeIQ5Rm/KN+Nfgq6gSORH4440KcGGB2SVbujIxZlTwqmMP5CB013GtnGPWDijmZA=
X-Gm-Gg: AZuq6aJGXrTU/jFk3QTuAQaP82JfHA6xi+gz3xfxSvutIDlgsPDsIlurWduHfjuqqik
	AkibfeJmC/f4LlNfiWZfxMR0Aro+kstD9WDbkrPKUDtwEiLa7hAOtfdGIMsISPJzTHtnLf2J77W
	Lwc8aIIoVxAfBCbzBSqTN/LsmS1UmcziY0RN1KCerEspVpF8e2oVY4bwlRwRaELADt8fd79GzQj
	JtTsR8U86LTgot4ZclLYLjACdGQUrYQ+hrKttaLgkj4kgG6v/ZgPFMbBai86/dSYw/wM5Ya7ZZU
	Fk6vQ7ZMmmhSMKlkPF6976AWs7ARPM0Hi7S2HC3VR3XBxDzk/WsZet+ApYKOmAJcD7Y4URc1ucO
	+wq7f4OXQQpShID9XybGn3XH5lm0H0RUGVnFM7iqTOZV0ydTTgRa5jpzNdKtHFnq/gUws1nL/+f
	VfOAEC14wgJzHTpncjJosnz7kSuyS0InJO
X-Received: by 2002:a05:693c:60c2:b0:2b7:f145:a94 with SMTP id 5a478bee46e88-2bac97c4fbemr6096925eec.30.1771464508085;
        Wed, 18 Feb 2026 17:28:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658509sm18729216eec.19.2026.02.18.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 17:28:27 -0800 (PST)
Date: Wed, 18 Feb 2026 17:28:26 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <aZZnOt_gbmNFks7Q@debug.ba.rivosinc.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
 <7db68a59-3259-40df-ae9a-09ebccec16df@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7db68a59-3259-40df-ae9a-09ebccec16df@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_172829_096224_B80BCE64 
X-CRM114-Status: GOOD (  15.80  )
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

On Thu, Feb 19, 2026 at 12:01:10AM +0000, Mark Brown wrote:
>On Wed, Feb 18, 2026 at 09:58:41PM +0000, Edgecombe, Rick P wrote:
>> On Wed, 2026-02-18 at 11:57 -0800, Deepak Gupta wrote:
>
>> > If we land arch-agnostic prctl for enabling branch tracking for userspace as
>> > part of risc-v patches, I am hoping we can leverage that for x86 "branch
>> > tracking enabling" as well. I don't know if "BTI" is enabled for userspace in
>> > the arm64 world but if it isn't then it can use the same prctl. This creates
>> > symmetry and convergence as well between major 3 arches for branch tracking
>> > support.
>
>BTI has been available to userspace for quite a while now.

Noted.

>
>> Arm already uses PROT_BTI to enable their landing pad like thing. It doesn't
>> need a prctl AFAIU. Peterz had been suggesting we do a similar PROT for x86 user
>> IBT. Although an additional prctl might still be required for x86. We'd have to
>> actually start taking the patches upstream to see.
>
>Yeah, for arm64 BTI the control is all per page rather than per thread
>or process.  Unless I'm forgetting something there's just not a global
>control for this in the hardware, it's all keyed off the page tables.

Aah this makes sense. This is different from x86 and risc-v. Since BTI is on
per-code page basis, kernel enables if loader (interpreter for executable) and
then likely loader sets PROT_BTI for rest of the user space dependencies.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
