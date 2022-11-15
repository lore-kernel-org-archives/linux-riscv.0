Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 18:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xtGHTWdJoxCpRA6mBFOWCfCIbOC6uY0kONq0bZN1Xo=; b=Z3arK2M/MrhgRpffJwN0Qn/YNO
	6vHFQJ8RZV7Gx9JdcuCXoGI3SyIInqjhzuH3IxWm0NCXqzDgcVpZUFZ6RGpDBkhL3kcT5SCB9FkQe
	C72gxEHQ+PHliTmC7ga7Mm5NZ27X6PyYA3XiS5b+5G10uEmKC9Ukk2fKj6Frn3X5kPuw7KNPdJ6OA
	xR1O0MCLdzSVNYiNf08J7EKYwo+oyzDHR0M1oKqS6cwKzYE7b+UCmcVuMAnak39kW59lRzmOVRTba
	pRxt8RzFzW2t5ellJO5HAlIYPzR+5WaEP0KW4lMLLf7xpP9VS6AwYxNJ1KxirmOsZQKNWHLD4PIJ6
	XWENXC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0uZ-00DpVU-R2; Tue, 15 Nov 2022 18:43:55 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0uW-00DpTv-7L
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 18:43:54 +0000
Received: by mail-pj1-x1033.google.com with SMTP id w3-20020a17090a460300b00218524e8877so925618pjg.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 10:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00+9Ilghhv3lntMm+1aRi6kvIbEPCefmRGEhAjVwcJw=;
        b=OZtxlOh99Bx9s9c9BOyIAwuhOJfZgo7d/mcaeLE7mxKJVeKdeFD6fM5Ks/7o9MbZhn
         Pn2LhYcnwWw18985f5iOtI1gjTuYMXf9MTEU1Kq44fEMb5O2QipDHJRW+VeivUyO2QSb
         oh+pVsMBb4skurDKdwSPDo8/2M+KyLJitjSpgUYx++8t5EO6at8ECEWKKJjtZAYRan1A
         dQktsTJnNwcaLHw6mMXc7WsfYiBcWTW31/iABj3+/ybtor2a3Lxm0Fref6r9GvBQGwpI
         mp4/AG2nJPtGj6Sg8jmPH4HCl53a286b7bN9qxGofT3M1xe2AusCSHxSwWTMjoNJ+Qd1
         NaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00+9Ilghhv3lntMm+1aRi6kvIbEPCefmRGEhAjVwcJw=;
        b=2qJNTrmbfvZEzRM+p5SZZArSglPyDxSGw+GlmRNZLQ2PgG1FIoufUdhBJxhqGzmbqA
         5Xf6ptwRC8qiNxMtryiQAoQGvDzHEa7SLhpbLKsBML+ZwTJbKDEeLeNInEB7Bx9rgE4O
         o/qy+TP9ot3YPiKcH6inI01+Hum2N5TkHS3yBPIFI3p2OBqTCghQOj7CIIvdDc/f4b26
         SY36If8jxe4mMhBtRUIstsNBlQJcyhsnEWAWy8OFqgjSlSA8Kc5Cw0pfEFCh4eRtMnlD
         2k2RFCJkICCYw7APlEWwgKphmdiRTw3XjIc0iJ1GVrD3lszgIauLDBvvTSvLIB5pjYwq
         63QA==
X-Gm-Message-State: ANoB5pm1HjN+l334GNt3GmiNtyc6YJAxc8Nv3KKYJb6tpJjbulho4CL1
	+meI55/yeNTZK7t+iWrmuzDYiA==
X-Google-Smtp-Source: AA0mqf5twos0SU2IewJ7K9NEb95p/NVrr2KpeNPsORRYgK4dUVM1q4PEdD2VQ3toOdN4t6keDEkZsg==
X-Received: by 2002:a17:902:9a01:b0:185:3ecb:d464 with SMTP id v1-20020a1709029a0100b001853ecbd464mr5393170plp.78.1668537830742;
        Tue, 15 Nov 2022 10:43:50 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 132-20020a62188a000000b00571dda13fafsm6990296pfy.163.2022.11.15.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 10:43:50 -0800 (PST)
Date: Tue, 15 Nov 2022 10:43:48 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Conor.Dooley@microchip.com
Cc: aou@eecs.berkeley.edu, jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org, bjorn@kernel.org,
	atishp@rivosinc.com
Subject: Re: [PATCH v3] scripts/gdb: add lx_current support for riscv
Message-ID: <20221115184348.GA1854852@debug.ba.rivosinc.com>
References: <20221115012917.1781185-1-debug@rivosinc.com>
 <20221115084923.1822572-1-debug@rivosinc.com>
 <Y3OkY6myfea00BaK@wendy>
 <CAKC1njRi9C0m3JKpu0ebAFCC25161EST=tFFWiAj1yZBbnak6A@mail.gmail.com>
 <4f293c39-6a0e-dd25-9ed2-10088bb971e1@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f293c39-6a0e-dd25-9ed2-10088bb971e1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_104352_482871_0EE1BCD2 
X-CRM114-Status: GOOD (  37.51  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 15, 2022 at 06:06:34PM +0000, Conor.Dooley@microchip.com wrote:
>Hey Deepak,
>
>On 15/11/2022 17:49, Deepak Gupta wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know t=
he content is safe
>> Since I am new to all this. I've had some oversight=A0and am still learn=
ing=A0the flow.
>> Rest inline.
>
>No worries chief. Worth noting is that this mail came in html
>form, which the mailing lists reject. Noone outside of the
>direct CC list will see this mail. May be worth asking some
>of the other Rivos lads how they do their plain text emailing.
>
>ik Palmer's got his hand rolled stuff, so maybe he's not the
>best to ask - but try Bjorn or Atish?

Sending this time from mutt. Hopefully no bounces.

>
>>
>> On Tue, Nov 15, 2022 at 6:38 AM Conor Dooley <conor.dooley@microchip.com=
 <mailto:conor.dooley@microchip.com>> wrote:
>>
>>     Hey Deepak,
>>
>>     On Tue, Nov 15, 2022 at 12:49:23AM -0800, Deepak Gupta wrote:
>>     > csr_sscratch CSR holds current task_struct address when hart is in
>>     > user space. Trap handler on entry spills csr_sscratch into "tp" (x=
2)
>>     > register and zeroes out csr_sscratch CSR. Trap handler on exit rel=
oads
>>     > "tp" with expected user mode value and place current task_struct a=
ddress
>>     > again in csr_scratch CSR.
>>     >
>>     > This patch assumes "tp" is pointing to task_struct. If value in
>>     > csr_scratch is numerically greater than "tp" then it assumes csr_s=
cratch
>>
>>     nit: s/scratch/sscratch/ ?
>>
>>
>> Will fix it.
>> =A0
>>
>>
>>     > is correct address of current task_struct. This logic holds when
>>     >=A0 =A0 - hart is in user space, "tp" will be less than csr_scratch.
>>     >=A0 =A0 - hart is in kernel space but not in trap handler, "tp" wil=
l be more
>>     >=A0 =A0 =A0 than csr_scratch (csr_scratch being equal to 0).
>>     >=A0 =A0 - hart is executing trap handler
>>     >=A0 =A0 =A0 =A0 - "tp" is still pointing to user mode but csr_scrat=
ch contains
>>     >=A0 =A0 =A0 =A0 =A0 =A0ptr to task_struct. Thus numerically higher.
>>     >=A0 =A0 =A0 =A0 - "tp" is=A0 pointing to task_struct but csr_scratc=
h now contains
>>     >=A0 =A0 =A0 =A0 =A0 =A0either 0 or numerically smaller value (trans=
iently holds
>>     >=A0 =A0 =A0 =A0 =A0 =A0user mode tp)
>>     >
>>     > Patch also adds new cached type "ulong" in scripts/gdb/linux/utils=
.py
>>     >
>>     > Signed-off-by: Deepak Gupta <debug@rivosinc.com <mailto:debug@rivo=
sinc.com>>
>>
>>     I noticed when looking into patchwork complaining about checkpatch
>>     errors in v2, that b4 had actually downloaded v3 but I could not see
>>     this patch on the RISC-V list.
>>
>> =A0
>> I'll make sure to add the risc-v list on the next spin up.
>>
>>
>>     I don't see a changelog anywhere here
>>     from v2 either
>>
>>
>> I had been taking inputs and squashing commits on my end.
>> You want me to send a changelog of changes between versions of patches.
>
>Yeah, it's nice to say something like:
>v2 -> v3:
>- reworded commit message
>- fixed compile error in bar.c if !CONFIG_FOO
>
>Makes it easier for reviewers to see what changed between
>versions.
>
>> =A0
>>
>>     , nor did you pick up Drew's Reviewed-by.
>>
>>
>> I should've done that. My mistake and apologize.
>> I'll fix it in my next submission.
>> =A0
>>
>>
>>     What's the story there?
>>
>>     One really minor thing below. Should be able to fix it up trivially =
up
>>     & submit a v4, CCing the linux-riscv list.
>>
>>     > ---
>>     >=A0 scripts/gdb/linux/cpus.py=A0 | 15 +++++++++++++++
>>     >=A0 scripts/gdb/linux/utils.py |=A0 5 +++++
>>     >=A0 2 files changed, 20 insertions(+)
>>     >
>>     > diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
>>     > index 15fc4626d236..ca5215a660c7 100644
>>     > --- a/scripts/gdb/linux/cpus.py
>>     > +++ b/scripts/gdb/linux/cpus.py
>>     > @@ -173,6 +173,21 @@ def get_current_task(cpu):
>>     >=A0 =A0 =A0 =A0 =A0 =A0else:
>>     >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raise gdb.GdbError("Sorry, obtaining=
 the current task is not allowed "
>>     >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 "while running in userspace(EL0)")
>>     > +=A0 =A0 elif utils.is_target_arch("riscv"):
>>     > +=A0 =A0 =A0 =A0 =A0current_tp =3D gdb.parse_and_eval("$tp")
>>     > +=A0 =A0 =A0 =A0 =A0scratch_reg =3D gdb.parse_and_eval("$sscratch")
>>     > +
>>     > +=A0 =A0 =A0 =A0 =A0# by default tp points to current task
>>     > +=A0 =A0 =A0 =A0 =A0current_task =3D current_tp.cast(task_ptr_type)
>>     > +
>>     > +=A0 =A0 =A0 =A0 =A0# scratch register is set 0 in trap handler af=
ter entering kernel.
>>     > +=A0 =A0 =A0 =A0 =A0# When hart is in user mode, scratch register =
is pointing to task_struct.
>>     > +=A0 =A0 =A0 =A0 =A0# and tp is used by user mode. So when scratch=
 register holds larger value
>>     > +=A0 =A0 =A0 =A0 =A0# (negative address as ulong is larger value) =
than tp, then use scratch register.
>>     > +=A0 =A0 =A0 =A0 =A0if (scratch_reg.cast(utils.get_ulong_type()) >=
=A0 current_tp.cast(utils.get_ulong_type())):
>>     =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^
>>     extra space here?
>>
>>
>> I don't see the space in the patch. Can you clarify which space you're t=
alking about here?
>
>There's a double space between the > and current_tp.
>I put a ^^ under it, but if you've not got a monospace font, which since
>you're replying in html you probably don't, it may not align for you.
>
>Hope that helps,
>Conor.

Yes can see it now.

>
>>
>>     =A0
>>
>>
>>     > +=A0 =A0 =A0 =A0 =A0 =A0 =A0current_task =3D scratch_reg.cast(task=
_ptr_type)
>>     > +
>>     > +=A0 =A0 =A0 =A0 =A0return current_task.dereference()
>>     >=A0 =A0 =A0 else:
>>     >=A0 =A0 =A0 =A0 =A0 raise gdb.GdbError("Sorry, obtaining the curren=
t task is not yet "
>>     >=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"support=
ed with this arch")
>>     > diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.=
py
>>     > index 1553f68716cc..ddaf3089170d 100644
>>     > --- a/scripts/gdb/linux/utils.py
>>     > +++ b/scripts/gdb/linux/utils.py
>>     > @@ -35,12 +35,17 @@ class CachedType:
>>     >=A0
>>     >=A0
>>     >=A0 long_type =3D CachedType("long")
>>     > +ulong_type =3D CachedType("ulong")
>>     >=A0 atomic_long_type =3D CachedType("atomic_long_t")
>>     >=A0
>>     >=A0 def get_long_type():
>>     >=A0 =A0 =A0 global long_type
>>     >=A0 =A0 =A0 return long_type.get_type()
>>     >=A0
>>     > +def get_ulong_type():
>>     > +=A0 =A0 global ulong_type
>>     > +=A0 =A0 return ulong_type.get_type()
>>     > +
>>     >=A0 def offset_of(typeobj, field):
>>     >=A0 =A0 =A0 element =3D gdb.Value(0).cast(typeobj)
>>     >=A0 =A0 =A0 return int(str(element[field].address).split()[0], 16)
>>     > --
>>     > 2.25.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
