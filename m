Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACBAC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLZ0JqMbJuZyOB6NJy+eOXtpec9Ta7q+V+f1JSFsqJ8=; b=l3Fiugm81FN0pq
	jBoaUqKcePYDdhA8eeyz2ZuY1asKE5kfwyx99toB5SaA/24qPfjN5Odyre0rPj3n+0K4pY3t+T/nL
	6/M+M61BehAkSSLM1IoFBDWNpDRt80W7oBgDYFUYGq7c0oYuxSFMYhQaXpowJX6ZdC2FL80GqYZd7
	aMAV51tAKMkEuRK1PdGrg469jWBltrp8moqJ6Vtal02DdwV9fsaHGeDYnCvsZttRMkm4nYFmGq4ac
	IQi7USok22RAV+E7pCJujkx21jugXagbNOmmoqHRW/V/vPH8lH5H5KK0Sl9tRqAYsgEVxpS1EPoc7
	CEHQTFhONtV28DjqE9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqcsk-00000003tnL-1FPk;
	Sat, 30 Mar 2024 17:52:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqcsf-00000003tla-34fQ;
	Sat, 30 Mar 2024 17:52:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-56bf63af770so1494225a12.3;
        Sat, 30 Mar 2024 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711821154; x=1712425954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd1Ju+LCh2MPv5vAR1VJsB6sgx1pw4Hx1J299NMUFnM=;
        b=m3XPukv2g8ZHIiNHjbZuTGb5xkSDCzzZt2vyMBbNXiHjOy77CSSjq0g8Ii3YPD0MCB
         SAvycctBDVelhej6gkTXYbHSe5LabyrtdQyPW4aP5IZ4dl721iV+048CZFYdYXeM75tp
         rZHE8INnrDq/oCd08tZ0VTvhgzqfFMasztggEDIofga5tUsLSIYHy/L7laY1HzFz6SXq
         NMJcIS4JT/ItnQg8j9Ynw1oWdM42mt3fQZzx5wnvEQ2pfI4MVjBiy2rEqwW0jVFyvEUA
         A94l7Kh7AKjW0UNSROs5Q9srSou6Fu9x8bDxjesHaFfQE/b/z/1c2se2O1v7pd9LhAAv
         vDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711821154; x=1712425954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd1Ju+LCh2MPv5vAR1VJsB6sgx1pw4Hx1J299NMUFnM=;
        b=j9iMUDUal2hGDBL0GSVuoIFSvPVkyrDCuBNPaAKN2vejbn5Sz39kc9VVIYWtOnKGqC
         6qsw6tBytsZ4hCV8xVmUwGqeJw03dFU3r5JpUrnsBNMk6OT/lRAklwrgOC+8fwjQub7g
         ROx6VyLHBr2WPXkBDMXzww7Bdzi/Y4SeoyXMsstmd+AoMHkFzTBEBwNFO1D4PLoeMrzQ
         KbH1vnkZAmN4d6tpFFjRYuydYAz4sys886uqy7Df3BobJ0hGo/yGekLMAsph/jykeJz1
         YezAbFUFhTk5FzwupyQrCCbe1m2mxmELkxOVGKJQ2cxLURbVwiA1VNPNtzOZ+Df3oERU
         Q7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZsjubRd+DAiX64irVcIO+vYPofjiNwk6sd6ajeJWprtf7e0o4iiN4WKEQPuiU2HNuLJgg+dFZ4WO82trcQjAn0ygPmijtQP/h45xi6fG/7eTW2r3SNZXpAKLFEj6PsGJZOdAy77VVNYN6ePHaB3vOUeV5deo=
X-Gm-Message-State: AOJu0Yzy3gJUTSggCz90My5eP0Zwf5v9+WCSjYcD1QAlpVQNWkotsho0
	+/KO7EO4n1xIhTfj/SM9EUCjzA8OHkPrpllF3BjtxQtVzsc0inmp
X-Google-Smtp-Source: AGHT+IEGAmf0kvvH3dm+5STvdXDGmaMLsXGzvzIXptUqdCRcniCaiSzPtCwt9Qd53mlg93swhXFVXQ==
X-Received: by 2002:a50:8ad9:0:b0:566:b09e:8d24 with SMTP id k25-20020a508ad9000000b00566b09e8d24mr4080922edk.12.1711821153955;
        Sat, 30 Mar 2024 10:52:33 -0700 (PDT)
Received: from krava (ip-94-113-247-30.net.vodafone.cz. [94.113.247.30])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7cd14000000b0056bf9b4ec32sm3516637edw.78.2024.03.30.10.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 10:52:33 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 30 Mar 2024 18:52:30 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	=?utf-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
Message-ID: <ZghRXtc8ZiTOKMR3@krava>
References: <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home>
 <CAEf4BzYgzOti+Hfdn3SUCjuofGedXRSGApVDD+K2TdG6oNE-pw@mail.gmail.com>
 <20240330082755.1cbeb8c6@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240330082755.1cbeb8c6@rorschach.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_105237_803120_16F63AB9 
X-CRM114-Status: GOOD (  14.67  )
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

On Sat, Mar 30, 2024 at 08:27:55AM -0400, Steven Rostedt wrote:
> On Fri, 29 Mar 2024 16:28:33 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
> 
> > I thought I'll just ask instead of digging through code, sorry for
> > being lazy :) Is there any way to pass pt_regs/ftrace_regs captured
> > before function execution to a return probe (fexit/kretprobe)? I.e.,
> > how hard is it to pass input function arguments to a kretprobe? That's
> > the biggest advantage of fexit over kretprobe, and if we can make
> > these original pt_regs/ftrace_regs available to kretprobe, then
> > multi-kretprobe will effectively be this multi-fexit.
> 
> This should be possible with the updates that Masami is doing with the
> fgraph code.

yes, I have bpf kprobe-multi link support for that [0] (it's on top of
Masami's fprobe-over-fgraph changes) we discussed that in [1]

jirka

[0] https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/log/?h=bpf/session_data
[1] https://lore.kernel.org/bpf/20240228090242.4040210-1-jolsa@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
