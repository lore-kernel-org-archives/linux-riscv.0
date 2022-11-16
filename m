Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB7CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqcPtkPPGBPOTuniE4xHrp3u3socYVoexeaO4J4SBrM=; b=k+mdFVyBgyV1ZZZaPbT5RPqrFU
	cN1z3JJZuujdm9QKaRkKT/5j+o257AwmOHhIdwKNQY2nQL0bR8sAtRAt3uWIOlkQnVF69fE1sdnHx
	e0GnQrMijv4yRSrkrPngHAeQ5FbCgtV2uauKVlAGDGbss+bJB0bNwybxsPvnRB2TnQJ3+cr5bnqdu
	tMSxusjNc8JTyWyF6Mf8Y2l3ta5G0CZvNgRyqsqVY3eHwCyGLy1kRQK0KSsfwAbGiDIp4a4StY5ta
	Ui9V8PTkI169owlYYw2Vbj13cH1UxbyHy78StOk6l62cSFsK8TF359RN1KbJL88X8kjOfH/c3x7DY
	3+g5BKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovQq1-008OD4-US; Wed, 16 Nov 2022 22:24:57 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovQpz-008OBO-Jx
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 22:24:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso158053pjt.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 14:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPgbpEvrPuVtV0uX0POuwrvgxgpF8WubiM0vzcaA4so=;
        b=IuJerhKF+yKKQ/RvTJicnq9jnKBtZEWexD+46jyVy8nzQF5qAOdY1A78s0uTKYWGDN
         yvC/vIdJJ+I8AR3/AntyR/1SWO/Zx0Vcpp3RPrLMkdVRZE9dGCHUQaAI09vc1lC98mqo
         8d0MZ/CtZJ8Z+F8Z87auOnZ+8eYSAQUCvluwEqgr/Eydal6QynNPOEFu+1xxWnAJcjMp
         iEwILb/QGi2TnxMnJHMClym4i/o7H3T2SU0Wu0mYi5H+Kn5bsbBSlScr47TF14gLhsTb
         N7KaoJ579MLL4pfnhRrvRnhtCTztsUk+dzB5rdPiLzuShw7gc61tSeBfd7Qb7rzfTzvG
         HcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPgbpEvrPuVtV0uX0POuwrvgxgpF8WubiM0vzcaA4so=;
        b=005AB1g3UASZWl8DKbFRd+01DqBWFl2hEKUyPtqnr+VXj5pgELat1tdWl47uDI6rmz
         zQW/5k2OtGPpymsqIsXVXzkYVQB3/iqSlROpJ1doG9WePlyapsWYES2a2W800B4lcz0y
         uTsfNXxrZir4Z0UX/+PjY+CEJoxmjP9fmQFoKOG2djbPFdlHc9FjLy3CUysELPdqDMsL
         kp/IoE9neF9rRQIu3qoR11PQCgDEpGzS8w2VaLNijFESbg5xuOMeUQcTrd+x9bqFBde9
         8mZMPQTR4MO4UHCSYClIIH+qZv7Je86y8vodFRHa+2IVIjAIMm2SqoYfMLKtsQeUJ8R7
         OJdA==
X-Gm-Message-State: ANoB5pnHiGiirQo9NxDwIIwzMXCug5mL5n1J+F9Tncne/xNieQSu/K0d
	pB8Z54PIA56kFBZhC9e4y4whPQ==
X-Google-Smtp-Source: AA0mqf5PnssZ+mPuqr2OAj2bkbk6JmM/+qfPN1Sfe8blCYJF791mmbSYKurUWVMooFwHnAgH2mzggQ==
X-Received: by 2002:a17:90b:48cb:b0:213:f2c9:ce71 with SMTP id li11-20020a17090b48cb00b00213f2c9ce71mr5742149pjb.62.1668637490993;
        Wed, 16 Nov 2022 14:24:50 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 192-20020a6217c9000000b0056c04dee930sm11315551pfx.120.2022.11.16.14.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 14:24:50 -0800 (PST)
Date: Wed, 16 Nov 2022 14:24:48 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: conor.dooley@microchip.com, aou@eecs.berkeley.edu,
	jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v5] scripts/gdb: add lx_current support for riscv
Message-ID: <20221116222448.GA2103144@debug.ba.rivosinc.com>
References: <d65bddf3-c58a-1420-bff9-8333c10edb56@microchip.com>
 <20221115221051.1871569-1-debug@rivosinc.com>
 <20221116081649.yq7cy7isxj3nmzr3@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116081649.yq7cy7isxj3nmzr3@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_142455_846191_D43293B3 
X-CRM114-Status: GOOD (  22.95  )
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

On Wed, Nov 16, 2022 at 09:16:49AM +0100, Andrew Jones wrote:
>On Tue, Nov 15, 2022 at 02:10:51PM -0800, Deepak Gupta wrote:
>> csr_sscratch CSR holds current task_struct address when hart is in
>> user space. Trap handler on entry spills csr_sscratch into "tp" (x2)
>> register and zeroes out csr_sscratch CSR. Trap handler on exit reloads
>> "tp" with expected user mode value and place current task_struct address
>> again in csr_sscratch CSR.
>>
>> This patch assumes "tp" is pointing to task_struct. If value in
>> csr_sscratch is numerically greater than "tp" then it assumes csr_sscratch
>> is correct address of current task_struct. This logic holds when
>>    - hart is in user space, "tp" will be less than csr_sscratch.
>>    - hart is in kernel space but not in trap handler, "tp" will be more
>>      than csr_sscratch (csr_sscratch being equal to 0).
>>    - hart is executing trap handler
>>        - "tp" is still pointing to user mode but csr_sscratch contains
>>           ptr to task_struct. Thus numerically higher.
>>        - "tp" is  pointing to task_struct but csr_sscratch now contains
>>           either 0 or numerically smaller value (transiently holds
>>           user mode tp)
>>
>> Patch also adds new cached type "ulong" in scripts/gdb/linux/utils.py
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>
>> ---
>> Since patch has changed a little bit from v1 and I didn't include
>> changelog earlier, here it is.
>>
>> v1 --> v2:
>>  - added logic to locate task_struct irrespective of priv
>>  - made locating task_struct agnostic to bitness(32 vs 64).
>>  - added caching of ulong type in scripts/gdb/linux/utils.py
>>  - added more descriptive commit message
>>
>> v2 --> v3:
>>  - amended commit message and source line to fit column width
>>
>> v3 --> v4:
>>  - amended commit message and remove whitespace in source
>>  - added Reviewed-by for reviewers
>>
>> v4 --> v5:
>>  - changing the order of changelog and sign off/review tags in commit
>> ---
>> ---
>
>Everything looks good, but you've got extra ---'s here. They don't hurt,
>but if you're still ironing out your workflow you may want to keep in
>mind that you don't need them. You only need one, which goes above the
>changelog.
>
>Thanks,
>drew
>

Noted. Thanks.

>>  scripts/gdb/linux/cpus.py  | 15 +++++++++++++++
>>  scripts/gdb/linux/utils.py |  5 +++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
>> index 15fc4626d236..14c22f82449b 100644
>> --- a/scripts/gdb/linux/cpus.py
>> +++ b/scripts/gdb/linux/cpus.py
>> @@ -173,6 +173,21 @@ def get_current_task(cpu):
>>           else:
>>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>>                                  "while running in userspace(EL0)")
>> +    elif utils.is_target_arch("riscv"):
>> +         current_tp = gdb.parse_and_eval("$tp")
>> +         scratch_reg = gdb.parse_and_eval("$sscratch")
>> +
>> +         # by default tp points to current task
>> +         current_task = current_tp.cast(task_ptr_type)
>> +
>> +         # scratch register is set 0 in trap handler after entering kernel.
>> +         # When hart is in user mode, scratch register is pointing to task_struct.
>> +         # and tp is used by user mode. So when scratch register holds larger value
>> +         # (negative address as ulong is larger value) than tp, then use scratch register.
>> +         if (scratch_reg.cast(utils.get_ulong_type()) > current_tp.cast(utils.get_ulong_type())):
>> +             current_task = scratch_reg.cast(task_ptr_type)
>> +
>> +         return current_task.dereference()
>>      else:
>>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>>                             "supported with this arch")
>> diff --git a/scripts/gdb/linux/utils.py b/scripts/gdb/linux/utils.py
>> index 1553f68716cc..ddaf3089170d 100644
>> --- a/scripts/gdb/linux/utils.py
>> +++ b/scripts/gdb/linux/utils.py
>> @@ -35,12 +35,17 @@ class CachedType:
>>
>>
>>  long_type = CachedType("long")
>> +ulong_type = CachedType("ulong")
>>  atomic_long_type = CachedType("atomic_long_t")
>>
>>  def get_long_type():
>>      global long_type
>>      return long_type.get_type()
>>
>> +def get_ulong_type():
>> +    global ulong_type
>> +    return ulong_type.get_type()
>> +
>>  def offset_of(typeobj, field):
>>      element = gdb.Value(0).cast(typeobj)
>>      return int(str(element[field].address).split()[0], 16)
>> --
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
