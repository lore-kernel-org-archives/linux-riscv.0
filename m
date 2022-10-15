Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F1C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00+MRNOCjRwcfnsaZ1RFVpr+897FgsrbT+rddAs8Xgc=; b=a6R2VcUBbOlVgq
	uQEExMEyo/zNschBlqp8JBVTvnxlHa/CvFMyV+pOrx4R0wA341GH1G1YdseQ9UF5/YX0tRSCL5PhN
	F5Lfh9wPfNKkGojZbYB+tiWWuPeNQBwjOgkHZCnJT/kLSWjDgSyemBlaSzDaAJDCqAsl9d3GvRhBG
	TzVY5ITfgE7yDmqK7btVY1yC/c8pY5ZPaeqRhycJ7o36nXxcx/m3cbfk+K+AKl8rOAIpfNIlMfICn
	A78hzV+JZ+Yb6Aa5jc+YJOm6Bz2/EfByWMw4sr7NltAEiv25pO9buVbyI3uk3veOkUBgsKRtLessz
	a8sz73DkbVoAvmn+9tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojlal-00HOBL-ME; Sat, 15 Oct 2022 18:08:59 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojlai-00HO8w-Rl
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 18:08:58 +0000
Received: by mail-qk1-x735.google.com with SMTP id a5so4445817qkl.6
        for <linux-riscv@lists.infradead.org>; Sat, 15 Oct 2022 11:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wAaC7lbGaB3AX/Lsftuvb2OO1sJpQJ6Ykn9DFNJXY0=;
        b=FyRwiQ1Kkh2U3R7rwv/cUWgWbhnhVuRAkvLikv3swWoWi+Qni43MwmjlvAl7Qd5YWU
         e3eQ8r4coovbGUfjgmrmah9muM3lMIJqLMPtobpzhigxXHyNURqImNwciQiRzGsAHdHO
         qXOEVFqd/G+S/R1kNsVrId98EksJPTRvXw6S31DLxWwCE/s50meM1rY5rsjT96D1ObDy
         lCH7/wDPhN4Zl3js/rayUXV95GaO+0Ed0I7Aor4TcANC3GM2Q2PJASLmjnpLgyV/gbKH
         KXTHOpPBMJ9ORopJ3VS/8U3M5d4tTN/mU0ZQfTgvUx8AXj2lFRY2L268IjoNTL418YNj
         eMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wAaC7lbGaB3AX/Lsftuvb2OO1sJpQJ6Ykn9DFNJXY0=;
        b=VWAIbMITWEPUgV7xhZRU4NOS0Tr+XFM25jN7d4ZbFRBTT+keLnZXC6ghkXoa7oYng4
         hetYX5SgZ4atIea3jsUSIeuJKdQx/zMq9yWFv4SXkoOOToHWe1OciAl4lxMe/LdhPmVx
         mFyeP2LenobhO1E07SnwSxLtFheVfLASjg4+Gu2wK3DCgDbz2b3YlKdO+NBU13z63FQs
         grqLbEkNr4GkjzeJWQ+pUG7Xv+TrEjkgZBOkUUVCMoMRDGEc7zjppljg4R0vRgWZsi/H
         Igw7GpPOTUJuu8miuUyu8o0ucH+mgb0V7SNs8ftRXxZ77EjKEu5w37kkMU5rhkWibwHf
         S8Yw==
X-Gm-Message-State: ACrzQf388gX3sei0CXAmnUgUKjEuzUhTFWR0dSgn4CVMhY75a+iSszfT
	C83UBWJ5TpiBQtVmCw+Bzqs=
X-Google-Smtp-Source: AMsMyM6RKmR37GztXAcqofHNQn3klZzUQq+GK3VRFWmYfAI4qhzKm9L4cuQOR6HCO3RXlQARuABfrA==
X-Received: by 2002:a37:6303:0:b0:6ec:554b:131d with SMTP id x3-20020a376303000000b006ec554b131dmr2532393qkb.166.1665857330103;
        Sat, 15 Oct 2022 11:08:50 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:2b6d:8b98:c35a:4b7])
        by smtp.gmail.com with ESMTPSA id h6-20020a05620a400600b006b949afa980sm5294690qko.56.2022.10.15.11.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 11:08:49 -0700 (PDT)
Date: Sat, 15 Oct 2022 11:08:51 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Message-ID: <Y0r3M+WCMqugVoXf@yury-laptop>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_110856_905238_88DB05D2 
X-CRM114-Status: GOOD (  16.96  )
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

On Fri, Oct 14, 2022 at 05:58:43PM +0200, Andrew Jones wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
> 
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
>     
> which will issue the warning when reading /proc/cpuinfo.
> 
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
> 
> This series address the issue for x86 and riscv, but from a quick
> grep of cpuinfo seq operations, I think at least openrisc, powerpc,
> and s390 also need an equivalent patch. While the test is simple (see
> next paragraph) I'm not equipped to test on each architecture.
> 
> To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
> a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.
> 
> While the patches are being posted together in a series since they're
> for two different architectures they don't necessarily need to go
> through the same tree.

Acked-by: Yury Norov <yury.norov@gmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
