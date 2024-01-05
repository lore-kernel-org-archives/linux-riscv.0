Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268ECC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mr76eDJb7TEMjiWQ/awJ7U0+HbeDtnjI8rnr7DSspXQ=; b=uX1z9n3GzadEYD
	s/I9ZCHsC8V7jSuDrkICUroKvX2XPtzgMSHD06wQdiVIQzY2OEmpDR0IrpOAZHc76QjamSBndw0XU
	sR9lm5TFTE0ee+NuPHgMb3IVJWlVsMA/ikFd7Ccwuu+vox4ABoDlWd2SwbLMhj/cciS9yUVBaH4qc
	Cd4E/Jb4/41H+oqfhvi96zW5IEDgPwWoPB6UG7zkgbepiluPqUiR7mhbM++Erizv+NSEOnNIkBA9n
	kvSPpwzCOgd0pE6ACQyOIPcCW7DpvAVm87t+fFpG+rVO/0K2/O6E7Q8pUy/jr6+cjxv5eyo/5W6Tf
	kG7czDQHFXh4B0QuCepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLb9L-00FsEr-2L;
	Fri, 05 Jan 2024 03:45:35 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLb9J-00FsES-1x
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 03:45:34 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-67fdfed519dso5576356d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 19:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20230601.gappssmtp.com; s=20230601; t=1704426333; x=1705031133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8c3ESdi0IpZK01xiWxgeJ4UdiYi9dbopai5vRQAmfM=;
        b=I0YZQ45YgZGJGKFol0EdursRIvC+PhZr6/QNkeCl/tw4Gx1ZSh32U/BWnQgu/ztmCs
         1VxZColYdzuXtVq0HdKpIGUYC3JBlm6TsEl3naPften8BKsg6rukURW6LGvNRQp6T2xU
         t7IhXarC/6gOzI3JJt+vgtrue1P09bKS9p3QsqNPYvWGTmLqK99+DYLiJ/otcLFkJIiI
         Ztrtg6+b+C+IIVSkVKIUj2Hdn26bzKuFZMp8usMcAkYN8mwSpLZNlpkg2SvWVliPy7mi
         5x9ysgtpt5cSA2uF05VPwQlCk9KPWmxdykPRV2Nq09yUK/RIK0xmckc6p6SRcns0Ocv0
         aROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704426333; x=1705031133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8c3ESdi0IpZK01xiWxgeJ4UdiYi9dbopai5vRQAmfM=;
        b=hSgGqRFmD0DWBRWAJIBhd7keIZiCiIS+nzseXvTbegfcldmior9HYQnq02U2EL8NS3
         W9i4LYvq3c6mo911Nzu+pa/+e8upsA+9/yCBtnOsdY58O7RAyFxQqSnft0Z/UC+HgeH+
         EMBNfEgX8Fc2jMGMo8m1pGXqrx/sxs5NuftbjARAuGCUmgXqHNO0OSJLbtXU1Fa7Is/3
         itO4lFCD/aEoQ/MF3d5nlbOonUMLLRTyihlgwHEdii4nBsecvaVmVJgJJVPOfeYXFiEA
         aW6W3m0nAIXPS3RLhzpSnrVo5KioyRw/mnUso+fH7OSPZyaBNqbHj+8UnFF/ip3PIK17
         IBKA==
X-Gm-Message-State: AOJu0YzvULYLRHg1MDD4hPot32Ij0h2B8NoKVS2hmrbehcsrsSzvi2ua
	DVEGMKYdSzaV9wo14hn4V//gHlCBAnz11g==
X-Google-Smtp-Source: AGHT+IFbkA2aPU2aI39vcY4LyLCBENRrl6F3tJNOaay03B3PVHlOWcvhr88DceJ6bvJ0p4z3390ecg==
X-Received: by 2002:ad4:5742:0:b0:680:d233:9d7 with SMTP id q2-20020ad45742000000b00680d23309d7mr1637485qvx.125.1704426332729;
        Thu, 04 Jan 2024 19:45:32 -0800 (PST)
Received: from [172.16.32.83] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id n12-20020ad444ac000000b0067f75dbf08fsm307623qvt.11.2024.01.04.19.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 19:45:32 -0800 (PST)
Message-ID: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
Date: Thu, 4 Jan 2024 21:52:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Andrea Cervesato <andrea.cervesato@suse.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki>
From: Rob Landley <rob@landley.net>
In-Reply-To: <ZZVOhlGPg5KRyS-F@yuki>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_194533_645708_969644EF 
X-CRM114-Status: UNSURE (   9.19  )
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

On 1/3/24 06:09, Cyril Hrubis wrote:
> Hi!
>> I am not sure I agree with this series.
>> Removing support for UCLINUX from LTP is almost a guarantee for
>> not noticing when more breakage is introduced.
>> 
>> How exactly is UCLINUX broken in LTP?
> 
> As far as we know noone is using it and nobody is maintaing it for a
> decade,

Nobody is maintaining "uclinux" because that was a distro, but you can build
nommu support in buildroot and such, and people do.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
