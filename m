Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B76C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5aNX7cPmSqOW5MurExF45Ji5R32fnUU2hTWSnHWlFY=; b=nQppGvjK+n3F9K
	teD0V1Hrv6eC9WVBNYkkFErRi8U9kxVek5AtEZTR+Of//jQTDtlNPg2YP9ZNafXWa0h2hqqOiZV7W
	ABIH0/IqjNpNovVO+a6haesRTYeKGnbllZa0jUAL4X3rWJznsmqkRQtIO8NlEbpvALXhKzjxta5N3
	g2uirWhnQUsU09ADbjbFH+hIHMmd40P7Xp9YH6WElFU9gGaamdorCaLZphQk9eqjbUyBEZXFrsjQj
	BbMdqipSRdbf5Cep0iyUx8JhrU23rFXVk7ah4081fN8lCJg7YmbnxrGhhIsPCzvo4ISQ28iMqMS1g
	1yuZtIuQuYxnDF+3bTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmEy0-0000000931Z-3Ri7;
	Mon, 18 Mar 2024 15:32:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmExp-000000092wj-2j0e
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 15:31:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33ed4d8e9edso1801861f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710775906; x=1711380706; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7ee4IZGh1w8Etxfltsuz10HHo5VpRb9SE3+2/8S71Y=;
        b=XNmcc0LKgCS+6GHk2K3JasTvirM25TiCkekacj/uQEpxgZ/+kJ53JMbtnmq/NLFyMi
         sHkxWAkDsiFayj0qvNio2ioHecvphidkUNPFVT0YmbzKboZMAJ3++4n0WbwfZI8HyQqL
         eMrvj+bVkfMfcbqq9rL86n/ZtBsqd+sbm9EgFyizAAHioavYT15XdbLM8nAJF1NlwKqb
         zNYz7cPz7q/7kt0pYoGAdX+kMUeHBGR6JNP8bipbdb2i8QP9z4bmbR5doWilEvlUfeOZ
         MnsLJMBFEyJZcKw4u8/oETOS+x/1gjE1iCgRjko7s343Zq7wlk7wA4sihOXPQeyZh26e
         1jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775906; x=1711380706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7ee4IZGh1w8Etxfltsuz10HHo5VpRb9SE3+2/8S71Y=;
        b=Hg0bbI54kPZYk8EZR2SfqHCYW/uk6RzPnZssP3IeUtoCRvOhadbdtkHR31FVmqIfv6
         O5fVvZolbloFZmdwO8Z8diFmEsPWsll1EgUlBFF5TG3lDXeJ+hPDIMfkYCFhAIXI+geL
         /grksCy9dCcJDmu/wIgpjr5PKGTCFOJ641/mBiLEmIy3K2sZ8aTtbewvIU7cp/hRlz/d
         GRJ0DS1kpoInTWC5qEsKJoXZiC981fwuj94E0s8b7W5we1Jb8UE77Wa/iQ5IKLuZvgik
         KQG6O1/G8zfo1szpOkwljxBbGYOujRswo9/HaUPDVU1l7rYBeK5xfBrH85/iuyg4dGSS
         5Pkw==
X-Gm-Message-State: AOJu0Yy5kEPpprWlm38Vnj8C12qChEO42V05wO8EjmSbw/DHtm//OV9f
	D4UTNk7oYeXP+7EZdv5FGM48YyWRqUiyo1a9mX5im+tYVmks/I5HVhvrXB+LDeHXzAV7M5eOe8h
	f
X-Google-Smtp-Source: AGHT+IGxYV+9SE/8vggcDk9nqJQ+mvB+crRtGWmSWjvVJtqUXPCq0MXSnahNi/5GykKiiWIveiLsvg==
X-Received: by 2002:adf:e88c:0:b0:33e:a1e3:87b3 with SMTP id d12-20020adfe88c000000b0033ea1e387b3mr10281501wrm.41.1710775906391;
        Mon, 18 Mar 2024 08:31:46 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bo16-20020a056000069000b0033ecb111a5csm9949902wrb.83.2024.03.18.08.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 08:31:46 -0700 (PDT)
Date: Mon, 18 Mar 2024 16:31:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, anup@brainfault.org, atishp@atishpatra.org, 
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com, David.Laight@aculab.com
Subject: Re: [PATCH 0/5] riscv: Apply Zawrs when available
Message-ID: <20240318-b4b5fb6b806fdae244142a32@orel>
References: <20240315134009.580167-7-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240315134009.580167-7-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_083149_859312_9FE7C0C7 
X-CRM114-Status: GOOD (  28.92  )
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

On Fri, Mar 15, 2024 at 02:40:10PM +0100, Andrew Jones wrote:
> Zawrs provides two instructions (wrs.nto and wrs.sto), where both are
> meant to allow the hart to enter a low-power state while waiting on a
> store to a memory location. The instructions also both wait an
> implementation-defined "short" duration (unless the implementation
> terminates the stall for another reason). The difference is that while
> wrs.sto will terminate when the duration elapses, wrs.nto, depending on
> configuration, will either just keep waiting or an ILL exception will be
> raised.
> 
> Like wfi (and with the same {m,h}status bits to configure it), when
> wrs.nto is configured to raise exceptions it's expected that the higher
> privilege level will see the instruction was a wait instruction, do
> something, and then resume execution following the instruction.
> Currently, it's not expected that M-mode will configure and handle
> exceptions for timeouts (so it's expected that mstatus.TW=0), but KVM does
> configure exceptions for wfi (hstatus.VTW=1) and therefore also for
> wrs.nto. KVM does this for wfi since it's better to allow other tasks to
> be scheduled while a VCPU waits for an interrupt. For waits such as those
> where wrs.nto/sto would be used, which are typically locks, it is also a
> good idea for KVM to be involved, as it can attempt to schedule the lock
> holding VCPU.
> 
> This series starts with Christoph's addition of riscv smp_cond_load*
> functions which apply wrs.sto when available. We then switch from
> wrs.sto to wrs.nto, add hwprobe support (since the instructions are also
> usable from usermode), and finally teach KVM about wrs.nto, allowing
> guests to see and use the Zawrs extension.
> 
> We still don't have test results from hardware, and it's not possible to
> prove that using Zawrs is a win when testing on QEMU, not even when
> oversubscribing VCPUs to guests. However, it is possible to use KVM
> selftests to force a scenario where we can prove Zawrs does its job and
> does it well. [4] is a test which does this and, on my machine, without
> Zawrs it takes 16 seconds to complete and with Zawrs it takes 0.25
> seconds.
> 
> This series is based on kvm/queue and also available here [1]. In order
> to use QEMU for testing a build with [2] is needed. In order to enable
> guests to use Zawrs with KVM using kvmtool, the branch at [3] may be used.
> 
> [1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v1/
> [2] https://lore.kernel.org/all/20240312152901.512001-2-ajones@ventanamicro.com/
> [3] https://github.com/jones-drew/kvmtool/commits/riscv/zawrs/
> [4] https://github.com/jones-drew/linux/commit/2e712b19b7bb78634199bf262e6a75e09e1c87d2
> 
> Thanks,
> drew
> 
> 
> Andrew Jones (4):
>   riscv: Prefer wrs.nto over wrs.sto
>   riscv: hwprobe: export Zawrs ISA extension
>   KVM: riscv: Support guest wrs.nto
>   KVM: riscv: selftests: Add Zawrs extension to get-reg-list test
> 
> Christoph M??llner (1):
>   riscv: Add Zawrs support for spinlocks

I see I also forgot to add the patch for the entry in
Documentation/devicetree/bindings/riscv/extensions.yaml

Will do for v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
