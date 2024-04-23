Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B89C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwKQZefhByiDjVbj6lQK8MBZyLshLpZhRXU9LVqBj88=; b=ujYgk47YJTfFkB
	dFTwnJ9Ewc9k/bs5ln0Z3+T3UaB4TwdXOp6CW4aUgZ7QeQoZZU9qQvxVWpXQrpwplkJV83O/bF1gG
	DIP4Dwlcg6Zt0q3TG/oOSPJC8t8gT9uaVTdyfYNX8o4JxZXFrIobY0y3A88/XUq3tUGZvSgHf2qRZ
	TjLw92JpT3rC7VLmdRWM6LFkM3fGsQu2I3xJw4jfGTl3VA/JuLtocj6FTXaXOh7kaKp2yrVILr9wN
	Q2N/gO9d40ndDYktScUTl4yvSWk6AxF2bRwcRbHppJszM2xdewRlQ++qdOGRsuNv/MJG2mmc+d6ld
	clz6P9w2gCxOdglky2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDpG-0000000GzH4-07Lk;
	Tue, 23 Apr 2024 10:56:38 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDpB-0000000GzEi-3rnG
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 10:56:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a524ecaf215so558174166b.2
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713869792; x=1714474592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7A3dJbrWY/9z1NTPLr/SP8VA+syiS13CnbQZQzTmh4=;
        b=Njw9+k5JfLwOveKwsO2ffH9L2V8k1jdTIIU/4lLOW31Om6IQKbP4EkJGMU6GNWYNnr
         VCCAmZvc/OOWcwSGjrj8nWa+870W3q0+njl8ry7yhjfRZ+POIwjJb/JQkNCg/cIgvZ3x
         JavWuhwhPD+6baJPDtukFRR9dVPc/mX8QnVuEIc8/tO6tgKYrFA4kHnaxghvkxWNyMmp
         mZXZzg5s5EZ2Qg+a02obww8WjJ1V8IEO5OcVsJEaSpsD8kLr/CjgdowYi9vWq2GFJIpo
         Zf0EQ3bJmPzBEGluRs9n74LI64CuyUM8GGEtg4MMFYo1vfIHMLMWqQiNNZLCcrW7H+VP
         CjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713869792; x=1714474592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7A3dJbrWY/9z1NTPLr/SP8VA+syiS13CnbQZQzTmh4=;
        b=ew+ko9MpYdIRLGJD2+xcfJWGkTYbqMSRbWWSdqPvlITjeCah5B2So/Yv9TbS80UGgt
         EBEiHNYwmz1RVH8Skve1cJSv66mIXQ8cpHCvzVdbogVQe/18fbFvDIhqfkuzQyzgJcE+
         9nswTZLb1hGpk08eL6LjtKtzqhru1PUxYM4YXxu9jOanuUtXYaYxttYwYr/ZcxncRQET
         aHicmvn4BeBKo7VBQzm/y8UnXfEohBDnA3Pz37lGNcViAsNJJt6aB+qL5M335NtQbrp/
         CFHbpO0rmLGScch95Rz1XdqiApje+Pse3+teM5B4+AfPKEJwmua3PZBMWEPb6BLz3aQq
         IEjA==
X-Forwarded-Encrypted: i=1; AJvYcCVW5Hw4wxEwU+xrNrpFpqHGIRznV/IbZh9JjcCw/q6P/LTddYsHYWPDEsFhAHrm5UJ6Bdp+4lgsY7RENvi4nmO6cay9oSc+lcDK28gQIXqW
X-Gm-Message-State: AOJu0YxF6twjQ0hXrc3df/qbLc15rQf+iT9mSNcuLZdUvuTOuQ+gm1ox
	8R1g3sutq/cyibjQiATD3xJ6XxrBckX/BzYEeOM0o8YOeJO69f6Zm2W4yuSkszY=
X-Google-Smtp-Source: AGHT+IGuxCj+bPVMezQTiiqaIkHubBLsXlhj+D610GPwkEGBc0PyN8R4nZYOrEBNLFuAizVxpXXs2w==
X-Received: by 2002:a17:906:3502:b0:a52:22c4:8158 with SMTP id r2-20020a170906350200b00a5222c48158mr8092139eja.56.1713869791624;
        Tue, 23 Apr 2024 03:56:31 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c27-20020a170906d19b00b00a5557bc8920sm6916846ejz.54.2024.04.23.03.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 03:56:31 -0700 (PDT)
Date: Tue, 23 Apr 2024 12:56:30 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
Message-ID: <20240423-b25d0b1540d2092f5370afa5@orel>
References: <20240420151741.962500-1-atishp@rivosinc.com>
 <20240420151741.962500-25-atishp@rivosinc.com>
 <724a4797-18dc-4011-ba48-445c1cb6a976@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <724a4797-18dc-4011-ba48-445c1cb6a976@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_035634_823668_8B209999 
X-CRM114-Status: UNSURE (   9.56  )
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

On Tue, Apr 23, 2024 at 02:03:29PM +0500, Muhammad Usama Anjum wrote:
...
> > +	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
> A little weird that we have pr_info named helper to print logs when it is a
> userspace application, not kernel code. I'll check it in the source who
> added it to the KVM tests.
>

It was me, as git-blame will easily show you. Why is it "weird"?
Applications have needs for pr_info-like functions too, and the pr_info
name isn't reserved for the kernel. The only thing weird I see is that
I didn't differentiate pr_debug and pr_info messages. I probably should
have at least given pr_debug output a 'debug:' prefix.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
