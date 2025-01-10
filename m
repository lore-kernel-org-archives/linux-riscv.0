Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C33E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 03:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpYyJuU1pCVhf6VuaGFvLv87E6uEI/P6gnISG0ldNUs=; b=DnUhJy9tKQS+Wr
	bW19YTe07OMVrarB8wUGKVmXjUCTwTGtCgvXfAWR4NwiaD9U8+Xvou1EALeKeYjlxCRQq1yf/SkyV
	5QF3SRMjG5Cri0i+QAiVWY4UmTpspzdx5MIYhq3q7OM5pWLkH5H1jX7iLuHOPwmOzwuG80PYk96u6
	p/X68gmYZ4gr+RkS6hKDeuT3CfDWaxhAYU5O3MfLscakT+65Ck3uNdptuIM9pvdiPac38m89OAlPk
	/efeR4iKgBssY/ICkQXiCP009XfalkX+/JsP8DJpCeVxUqLsCR9L8d8hyS/Q2dI6icdxxaD7VGCAx
	E6+6+oT3stCynwampXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW5n5-0000000DvJL-3ri8;
	Fri, 10 Jan 2025 03:34:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW5n2-0000000DvIV-3D9n
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 03:34:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21675fd60feso34929785ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 19:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736480068; x=1737084868; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Viayt1DprygJVfkBr8f2Q096yWM1X8ypOSSUQGDK3YM=;
        b=OPVusdXWNZrIzxwGYyBNc2nRihxtSHzVfFc26M7Onel60/6XhGUJ+RZJEJYdTeo+Rd
         ZjOOSxERUCrgnTZFLZwXAL9lasvntFGB9k4/0XEHLCT5+E+Uy22+BHl0EGtTI1nCnmdw
         fbBOV8Kh+pDemSRDARjStkt3jGxdPdZPfXc6TEy6vxmEkDeH2JmSwZmxiLVTUi01r2ZW
         4GTpECsBvjyl50lQlYkVgopqJOL9uV7XCP2octtp7OSkdCoGubYSHQ5cJ55ERNEQZa+s
         ndE+9oKZurbZtWjR8P9M0V0Vv/zQ2rBcKkHIqk4zLsCo8wdcIglvB4pL4QoT2a2Qjy1l
         TDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736480068; x=1737084868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Viayt1DprygJVfkBr8f2Q096yWM1X8ypOSSUQGDK3YM=;
        b=aib2/5rQyagCUf9hdTfs+TN8UOqlyT0Wolt5tTlXuIwuQzeF3glOUwQxEK+vxbsKCs
         7YDtXMjihl9wbmDRSo42IFOUDYkghPgfhJSGo9btE4EEa95EX2vivrbJxxge3I41oMWF
         Y2FKID+HG1UKz68u2UgaNywaruypcQpm9WHKvv6wF+eD/gtlB20zarsPAeydk9vP6iLN
         2MZMlJMdMN2mFrRwuhY0a/fMTPPLCRH/uLAXy6sfH+fCxXHFnjH6ZRR90si709GwtSfD
         tyTOPhAYsO9DqpRSs5YJwmVWbH3JS1n23qnXW6fg+yCPReiouEb5cozh6335eckZuCIt
         z6og==
X-Forwarded-Encrypted: i=1; AJvYcCX/QQwH1e+5TJBaMowDtsmCPm8wFfO/gAkaNSHYin4RwVwwbpupIjEY35eVjzq8FdtXcHAbFRoOBTQLVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKkGZqOS3+TZFhOg/OEWuD9GtNf19dAAh0bmr6FShjv1Yq4n2N
	BDLOEmY5AVMF71uPw7MYaKvweVc1M1I5B29UZ7CnyjCihNoue6NsMiwdBxKINCc=
X-Gm-Gg: ASbGncuTMiiN+7y/KkPBSXyjAKw7JEaR7oIuL+G4sZU4RmzPUy5yB4VUQP/0qpiS2sF
	gWuMPyjA+fMDZNtEhEADv6vFOD1GJpkofAjucDMdPiFPS6MzHdMDiMozKlSjlBhkjpDCblfXrbr
	ElPQmZRcnCUaN4vdmkSjYER4X1+CQvNy0YaP1/nqhc2NAoJ6XOJxaGD5nqOW1HusCxK45eTnDm7
	EIfsewVI3hOzCeMBJPPNJC/4aMgK80Jsi6l4O86kJI3Eo+Oln4Q
X-Google-Smtp-Source: AGHT+IG3bbMYbkS4jJPSzQ9p7FyUYg9x1B/aqRiSj2rt9ftAdecMCL/6FTOfSLcR8vnjUeA3BTKFRA==
X-Received: by 2002:a05:6a00:1c92:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-72d21fdfc66mr14107164b3a.20.1736480067688;
        Thu, 09 Jan 2025 19:34:27 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a4dddsm569643b3a.155.2025.01.09.19.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 19:34:27 -0800 (PST)
Date: Thu, 9 Jan 2025 19:34:24 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Eugene Syromyatnikov <evgsyr@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v4 2/2] riscv: selftests: Add a ptrace test to verify
 syscall parameter modification
Message-ID: <Z4CVQKkViqJycnaq@ghost>
References: <20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name>
 <20241226-riscv-new-regset-v4-2-4496a29d0436@coelacanthus.name>
 <20241226133459.GA30481@strace.io>
 <2e09aedc-44ba-40e3-ae93-1d6dc21b5eb1@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e09aedc-44ba-40e3-ae93-1d6dc21b5eb1@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_193429_073523_0AD113B8 
X-CRM114-Status: GOOD (  27.62  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 26, 2024 at 11:21:59PM +0800, Celeste Liu wrote:
> =

> On 2024-12-26 21:35, Dmitry V. Levin wrote:
> > On Thu, Dec 26, 2024 at 06:52:52PM +0800, Celeste Liu wrote:
> >> This test checks that orig_a0 allows a syscall argument to be modified,
> >> and that changing a0 does not change the syscall argument.
> >>
> >> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> >> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> >> Co-developed-by: Charlie Jenkins <charlie@rivosinc.com>
> >> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> >> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> > [...]
> >> diff --git a/tools/testing/selftests/riscv/abi/ptrace.c b/tools/testin=
g/selftests/riscv/abi/ptrace.c
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..023695352215bb5de3f91c=
1a6f5ea3b4f9373ff9
> >> --- /dev/null
> >> +++ b/tools/testing/selftests/riscv/abi/ptrace.c
> > [...]
> >> +	if (ptrace(PTRACE_GET_SYSCALL_INFO, pid, PTRACE_SYSCALL_INFO_ENTRY, =
&syscall_info_entry))
> >> +		perr_and_exit("failed to get syscall info of entry\n");
> >> +	result->orig_a0 =3D syscall_info_entry->entry.args[0];
> >> +	if (ptrace(PTRACE_GET_SYSCALL_INFO, pid, PTRACE_SYSCALL_INFO_EXIT, &=
syscall_info_exit))
> >> +		perr_and_exit("failed to get syscall info of exit\n");
> >> +	result->a0 =3D syscall_info_exit->exit.rval;
> > =

> > I'm sorry but this is not how PTRACE_GET_SYSCALL_INFO should be used.
> > =

> > PTRACE_GET_SYSCALL_INFO operation takes a pointer and a size,
> > and in this example instead of size you pass constants 1 and 2, which
> > essentially means that both syscall_info_entry->entry.args[0] and
> > syscall_info_exit->exit.rval are not going to be assigned
> > and would just contain some garbage from the stack.
> > =

> > Also, PTRACE_GET_SYSCALL_INFO operation returns the number of bytes
> > available to be written by the kernel, which is always nonzero on any
> > PTRACE_GET_SYSCALL_INFO-capable kernel.  In other words, this example
> > will always end up with perr_and_exit() call.
> > =

> > I wonder how this test was tested before the submission.
> =

> Oops... It seems I forget sync the code to test board so it runs with the=
 old code...
> The code is completely not tested...
> I'm so sorry for my mistake.
> =

> I will correct it and test it carefully later...

It would be great to get this into 6.14. Let me know if you would like
any help!

- Charlie

> =

> > =

> > =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
