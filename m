Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB1C5475B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khKWqcKMqzAg2Qzm/a0ZKtirjZeYfM/mh/6XNrPEhHo=; b=34+TUD2yRFUc0Y
	tPjqyyGqw9Hc8fdvT63i8frJzeE+hVMItY+4Dd/YV2DpMmw304F1EDzpyEuImzTJXg9Nrx0BQFW7T
	g9uRAHId74T7Uo/1ax0eEr+V2C9ClkZFLm+csOTHnXjMBJ3PJYNbEYCMmO789HnRGa7dh3f2vjN+i
	SVkAKpMM8RvYUZkynVqxKgcktfu/vb8GA34VhIAIFYEIh9oCjytZDDXFhoXH/Q0USx2+RNIbURjDc
	rAnLVZqkD4slczGqJh7BP56ZgNprLva+wQI93IUC5ctERsdzCps11pljd4OW9TCpr0Ds+u+UXBo7L
	WgYv/exjoLQvNw1P5eAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2jG-00000002YC4-0vjO;
	Thu, 07 Mar 2024 01:39:26 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2jC-00000002YBb-2arE
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 01:39:24 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7882177f683so23889285a.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 17:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709775561; x=1710380361; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0SbDUA41eUP+9zdTARSNuV/ete68uPUC1r8MIz84hU=;
        b=Uluh1encEHK1jL+xKw1nBGQOKMfN5clkh41gruG8XV0t1atS3xLyqXUMYOwP6OfGF+
         1v2DFRphVCTlPh4gauXLqFb3rCLCHhdphcCeChGvcB2O97ZFqahr5nlNKRM/mldsiV+x
         h1LdgP1P4vgfNBd/UwUWrR4/gijhBpmcJJJ4K8TCBSVwt8QH3rnpxTLd19B/Lh26fjvC
         6oqVrdKfL6Q8wIBDzsUL9EjwnxPx0tk/xhuPkiWrcHHQ4R9eMwSzQpsTEcmW/qxgKbz3
         Iha4uDyveYXzXZ3EIJVtR5WsfJkx/UIaNhtyh097bAYg+UfkVylbF07+DWf1rTewcrpw
         wegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709775561; x=1710380361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0SbDUA41eUP+9zdTARSNuV/ete68uPUC1r8MIz84hU=;
        b=ULeKVAeYX2oZ8p/vSBsbKmPgFGJqbALJ0eqoQW/ZqDyb+V5tKOraF+zWlOi1B8ZQgO
         g3VrxmEnX9uQM6FfUGyIwmL896UR2uZKqRIhjxHhzy+4r5LqzOVPzhDaKml51MLIJge+
         V/0TWmeNcJHnyJlF+MgusT0BiZg0DzpPzo8VZ2AXH/y+nclzpfByEMEWbJds/SSwslRe
         36c80LwpeJdjq12Y8gYN/oqJ5tuc0Dz1imL2dVazqr/aR4JbOy2xOAKF+3WNbC9z0P3C
         QL63vhJ3PQzkcurv8O9o0bfQsDRBRGQOE5A6vTzznArvBJ9PFXDk8Avyr0wmDt8CvcCY
         gLxw==
X-Forwarded-Encrypted: i=1; AJvYcCVSOg00wRS5mvdF3WGspkcO3vPJyov3D0hdMvteADkCJtXbuJuSArAIyLBl2Cz6VmlwA32gChKG1l/KAkSqsInM76gLQynyr5lKzgTZjJm8
X-Gm-Message-State: AOJu0Yy+VekbkVjKMNDPnzpzrKVCYalymn410Q0UJ5qonLMRPU17QBEv
	gyQ9nWU1vyafCa8P94EB+Mig4zkp261/ZZdfHUb+kqMXZvJe34kW7FFZfW4NvNiqxLNJXHOszGg
	k
X-Google-Smtp-Source: AGHT+IFf4x9Pki+DLL/Ppvd38GvUMxQXysG3pCfvxlDIle3QnJYGBL2zBqSfeuh5GWFIcMGvQW1/Qw==
X-Received: by 2002:a05:620a:244a:b0:788:2cc6:1232 with SMTP id h10-20020a05620a244a00b007882cc61232mr7778482qkn.16.1709775561159;
        Wed, 06 Mar 2024 17:39:21 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id a21-20020a05620a02f500b0078833092600sm2649809qko.30.2024.03.06.17.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 17:39:20 -0800 (PST)
Message-ID: <ddf63d8b-7818-4c25-a83a-255ea45ea027@sifive.com>
Date: Wed, 6 Mar 2024 19:39:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] serial: sifive: Use uart_prepare_sysrq_char() to
 handle sysrq.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
References: <20240301215246.891055-1-bigeasy@linutronix.de>
 <20240301215246.891055-13-bigeasy@linutronix.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240301215246.891055-13-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_173922_752567_56293312 
X-CRM114-Status: GOOD (  10.87  )
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

On 2024-03-01 3:45 PM, Sebastian Andrzej Siewior wrote:
> The port lock is a spinlock_t which is becomes a sleeping lock on PREEMPT_RT.
> The driver splits the locking function into two parts: local_irq_save() and
> uart_port_lock() and this breaks PREEMPT_RT.
> 
> Handle sysrq requests sysrq once the port lock is dropped.
> Remove the special case in the console write routine an always use the
> complete locking function.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/tty/serial/sifive.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Acked-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
