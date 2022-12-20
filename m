Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E28C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 01:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AW+LDxzeE9ZfZJJriKqMLnWA/eQ8aBe9I9IRl9fLYvc=; b=bdapC93Ci9UdSoe1y1LuqbzZ4q
	LQURRnMJS2n50DhsJ/q5KBuA/kRAbDqq4OPX03DgqPxGu6u+xPgEigEVmTYFaVFUf0uTB42YRsM6w
	DRK37pn+Q+KJidfxghqxvI65dOz/d/1mrcNZHZnvn6r/RAt3p0ZJQHZu8/PaHYdTIYcTRVFGxx/0B
	lRN1KcHdopFwTRcerAn6cdf4KrRhCDlGaTlcNHMSpMK20wHPHAmS/MyMeH8vdFU4TMHKRJdEA69jz
	l/E6EFOX/qhaSQiYX067yyOhf1cG7jrdzcCPXY+jjItQUNa0MgAIF4Pu9toyWbKydHMsMMxxWJ0EC
	0om28y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7nrj-006yPv-EQ; Wed, 21 Dec 2022 01:25:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7irX-003gfT-T3
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:05:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so17648656pjp.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjlGiQymfgNFaSDRU7MTWJA3KgG1bYOFFqzVae4upcY=;
        b=WNSLJF/wrnm7xE9/TBvv2Rp7kRSRFbBqF6V4jCiwsJosFqCWDiMI0JjQp4tWJrSf6I
         fo/qY1mCNvFOM0KhtfK6T06B9HFDBmMHkGEGaKyWo06l/keZhtOGNxso5J3cT5Hp3H0D
         gqtLDGMkR32MUvmZs2DtSfeffHnogbRK7NIM5qbnYyCt4IfbjPTizsvvPHrQivRZCL6T
         ZKNYtmtM4vbz5SSXabW0ltHlVuxc1NpKKYkoSCBoyqdsDg8z12o4/yu3p3FtJd/uk7rc
         fggFdCd3MJ8kATRIla6sSTYq6D+WICb6r5CPEF615tDEp6DRyLPs1kNEcA9+OpD93wQ7
         YY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WjlGiQymfgNFaSDRU7MTWJA3KgG1bYOFFqzVae4upcY=;
        b=uikV7greSQExwBfdMMtTja5tvmoNUZpzE35FrH9yljZZKFif/JRHTKQnYoY9Og3Erq
         aSJzLlPiGoP+It41NIco5zLHfKCdB2ng1oIFWM08fMPpJPoGpvhCqWAf4SOyljz9FuKK
         2/cP0w6E9Q5yYWfsjCrXuNzB9IX6YDLEsvrfl56EPuyEm4ZOH4j1SbB/SsdZFcd8d7AJ
         45Z11a4sBgVkMjrXoPzgl3WW3TBHtG8emm3RlCNUsbmsbFpdEiGvhVojnT0UFq4jv+Jr
         ILQI29GZRMwAQ+jF0A2CCdh9fYpz3QS4vbpJEZ9ivFtZ39ywgYeTGnp3nDwOeEZul/PM
         QjMg==
X-Gm-Message-State: ANoB5pkt6kKuKEUjzgkDl4txp+cYCE2+swrM7u6q7oKyWvA0WL0XE972
	iC2Wd/BAPwGARkStLplv66AcDg==
X-Google-Smtp-Source: AA0mqf7iy0K9meOMUZc2rofCFCVAm869yECMXan8MJuBfss3FoB4gh0jF3CY0GkiQ1ipXl+JbxQQvg==
X-Received: by 2002:a17:902:f64d:b0:189:603d:ea71 with SMTP id m13-20020a170902f64d00b00189603dea71mr48419138plg.58.1671566714891;
        Tue, 20 Dec 2022 12:05:14 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b00189c93ce5easm9700826plw.166.2022.12.20.12.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 12:05:14 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------nALqI4I4M3qayzseUAxgdj3g"
Message-ID: <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
Date: Tue, 20 Dec 2022 12:05:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
To: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
In-Reply-To: <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_120520_233838_CAABD5CE 
X-CRM114-Status: GOOD (  48.85  )
X-Mailman-Approved-At: Tue, 20 Dec 2022 17:25:50 -0800
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------nALqI4I4M3qayzseUAxgdj3g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi folks,

Apologies for the extraneous CC (and the top post), but I would really 
appreciate some feedback on this to close on the V-ext plumbing support 
in kernel/glibc. This is one of the two contentious issues (other being 
prctl enable) preventing us from getting to an RVV enabled SW ecosystem.

The premise is : for preserving V-ext registers across signal handling, 
the natural way is to add V reg storage to kernel struct sigcontext 
where scalar / fp regs are currently saved. But this doesn’t seem to be 
the right way to go:

1. Breaks the userspace ABI (even if user programs were recompiled) 
because RV glibc port for historical reasons has defined its own version 
of struct sigcontext (vs. relying on kernel exported UAPI header).

2. Even if we were to expand sigcontext (in both kernel and glibc, which 
is always hard to time) there's still a (different) ABI breakage for 
existing binaries despite earlier proposed __extension__ union trick [2] 
since it still breaks old binaries w.r.t. size of the sigcontext struct.

3. glibc {set,get,*}context() routines use struct mcontext_t which is 
analogous to kernel struct sigcontext (in respective ucontext structs 
[1]). Thus ideally mcontext_t needs to be expanded too but need not be, 
given its semantics to save callee-saved regs only : per current psABI 
RVVV regs are caller-saved/call-clobbered [3]. Apparently this 
connection of sigcontext to mcontext_t is also historical as some arches 
used/still-use sigreturn to restore regs in setcontext [4]

Does anyone disagree that 1-3 are not valid reasons.

So the proposal here is to *not* add V-ext state to kernel sigcontext 
but instead dynamically to struct rt_sigframe, similar to aarch64 
kernel. This avoids touching glibc sigcontext as well.

struct rt_sigframe {
   struct siginfo info;
   struct ucontext uc;
+__u8 sc_extn[] __attribute__((__aligned__(16))); // C99 flexible length 
array to handle implementation defined VLEN wide regs
}

The only downside to this is that SA_SIGINFO signal handlers don’t have 
direct access to V state (but it seems aarch64 kernel doesn’t either).

Does anyone really disagree with this proposal.

Attached is a proof-of-concept kernel patch which implements this 
proposal with no need for any corresponding glibc change.

Thx,
-Vineet


[1] ucontex in kernel and glibc respectively.

kernel: arch/riscv/include/uapi/asm/ucontext.h

struct ucontext {
  unsigned long uc_flags;
  struct ucontext *uc_link;
  stack_t uc_stack;
  sigset_t uc_sigmask;
  __u8 __unused[1024 / 8 - sizeof(sigset_t)];
  struct sigcontext uc_mcontext;
}

glibc: sysdeps/unix/sysv/linux/riscv/sys/ucontext.h

typedef struct ucontext_t
   {
     unsigned long int  __uc_flags;
     struct ucontext_t *uc_link;
     stack_t            uc_stack;
     sigset_t           uc_sigmask;
     /* padding to allow future sigset_t expansion */
     char   __glibc_reserved[1024 / 8 - sizeof (sigset_t)];
      mcontext_t uc_mcontext;
} ucontext_t;

[2] https://sourceware.org/pipermail/libc-alpha/2022-January/135610.html
[3] 
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc
[4] https://sourceware.org/legacy-ml/libc-alpha/2014-04/msg00006.html




On 12/8/22 19:39, Vineet Gupta wrote:
> Hi Florian,
>
> P.S. Since I'm revisiting a year old thread with some new CC 
> recipients, here's the link to original patch/thread [1]
>
> On 9/17/21 20:04, Vincent Chen wrote:
>> On Thu, Sep 16, 2021 at 4:14 PM Florian Weimer <fweimer@redhat.com> 
>> wrote:
>>>>>> This changes the size of struct ucontext_t, which is an ABI break
>>>>>> (getcontext callers are supposed to provide their own object).
>>>>>>
>>>> The riscv vector registers are all caller-saved registers except for
>>>> VCSR. Therefore, the struct mcontext_t needs to reserve a space for
>>>> it. In addition, RISCV ISA is growing, so I also hope the struct
>>>> mcontext_t has a space for future expansion. Based on the above ideas,
>>>> I reserved a 5K space here.
>>> You have reserved space in ucontext_t that you could use for this.
>>>
>> Sorry, I cannot really understand what you mean. The following is the
>> contents of ucontext_t
>> typedef struct ucontext_t
>>    {
>>      unsigned long int  __uc_flags;
>>      struct ucontext_t *uc_link;
>>      stack_t            uc_stack;
>>      sigset_t           uc_sigmask;
>>      /* There's some padding here to allow sigset_t to be expanded in 
>> the
>>         future.  Though this is unlikely, other architectures put 
>> uc_sigmask
>>         at the end of this structure and explicitly state it can be
>>         expanded, so we didn't want to box ourselves in here. */
>>      char               __glibc_reserved[1024 / 8 - sizeof (sigset_t)];
>>      /* We can't put uc_sigmask at the end of this structure because 
>> we need
>>         to be able to expand sigcontext in the future.  For example, the
>>         vector ISA extension will almost certainly add ISA state.  We 
>> want
>>         to ensure all user-visible ISA state can be saved and 
>> restored via a
>>         ucontext, so we're putting this at the end in order to allow for
>>         infinite extensibility.  Since we know this will be extended 
>> and we
>>         assume sigset_t won't be extended an extreme amount, we're
>>         prioritizing this.  */
>>      mcontext_t uc_mcontext;
>>    } ucontext_t;
>>
>> Currently, we only reserve a space, __glibc_reserved[], for the future
>> expansion of sigset_t.
>> Do you mean I could use __glibc_reserved[] to for future expansion of
>> ISA as well?
>
> Given unlikely sigset expansion, we could in theory use some of those 
> reserved fields to store pointers (offsets) to actual V state, but not 
> for actual V state which is way too large for non-embedded machines 
> with typical 128 or even wider V regs.
>
>
>>
>>>>>> This shouldn't be necessary if the additional vector registers are
>>>>>> caller-saved.
>>>> Here I am a little confused about the usage of struct mcontext_t. As
>>>> far as I know, the struct mcontext_t is used to save the
>>>> machine-specific information in user context operation. Therefore, in
>>>> this case, the struct mcontext_t is allowed to reserve the space only
>>>> for saving caller-saved registers. However, in the signal handler, the
>>>> user seems to be allowed to use uc_mcontext whose data type is struct
>>>> mcontext_t to access the content of the signal context. In this case,
>>>> the struct mcontext_t may need to be the same as the struct sigcontext
>>>> defined at kernel. However, it will have a conflict with your
>>>> suggestion because the struct sigcontext cannot just reserve a space
>>>> for saving caller-saved registers. Could you help me point out my
>>>> misunderstanding? Thank you.
>
> I think the confusion comes from apparent equivalence of kernel struct 
> sigcontext and glibc mcontext_t as they appear in respective struct 
> ucontext definitions.
> I've enumerated the actual RV structs below to keep them handy in one 
> place for discussion.
>
>>> struct sigcontext is allocated by the kernel, so you can have pointers
>>> in reserved fields to out-of-line start, or after struct sigcontext.
>
> In this scheme, would the actual V regfile contents (at the 
> out-of-line location w.r.t kernel sigcontext) be anonymous for glibc 
> i.e. do we not need to expose them to glibc userspace ABI ?
>
>
>>> I don't know how the kernel implements this, but there is considerable
>>> flexibility and extensibility.  The main issues comes from small stacks
>>> which are incompatible with large register files.
>
> Simplistically, Linux kernel needs to preserve the V regfile across 
> task switch. The necessary evil that follows is preserving V across 
> signal-handling (sigaction/sigreturn).
>
> In RV kernel we have following:
>
> struct rt_sigframe {
>   struct siginfo info;
>   struct ucontext uc;
> };
>
> struct ucontext {
>    unsigned long uc_flags;
>    struct ucontext *uc_link;
>    stack_t uc_stack;
>    sigset_t uc_sigmask;
>    __u8 __unused[1024 / 8 - sizeof(sigset_t)];     // this is for 
> sigset_t expansion
>    struct sigcontext uc_mcontext;
> };
>
> struct sigcontext {
>    struct user_regs_struct sc_regs;
>    union __riscv_fp_state sc_fpregs;
> +  __u8 sc_extn[4096+128] __attribute__((__aligned__(16)));   // 
> handle 128B V regs
> };
>
> The sc_extn[] would have V state (regfile + control state) in kernel 
> defined format.
>
> As I understand it, you are suggesting to prevent ABI break, we should 
> not add anything to kernel struct sigcontext i.e. do something like this
>
> struct rt_sigframe {
>   struct siginfo info;
>   struct ucontext uc;
> +__u8 sc_extn[4096+128] __attribute__((__aligned__(16)));
> }
>
> So kernel sig handling can continue to save/restore the V regfile on 
> user stack, w/o making it part of actual struct sigcontext.
> So they are not explicitly visible to userspace at all - is that 
> feasible ? I know that SA_SIGINFO handlers can access the scalar/fp 
> regs, they won't do it V.
> Is there a POSIX req for SA_SIGINFO handlers being able to access all 
> machine regs saved by signal handling.
>
> An alternate approach is what Vincent did originally, to add sc_exn to 
> struct sigcontext. Here to prevent ABI breakage, we can choose to not 
> reflect this in the glibc sigcontext. But the question remains, is 
> that OK ?
>
> The other topic is changing glibc mcontext_t to add V-regs. It would 
> seem one has to as mcontext is "visually equivalent" to struct 
> sigcontext in the respective ucontext structs. But in unserspace 
> *context routine semantics only require callee-regs to be saved, which 
> V regs are not per psABI [2]. So looks like this can be avoided which 
> is what Vincent did in v2 series [3]
>
>
> [1] 
> https://sourceware.org/pipermail/libc-alpha/2021-September/130899.html
> [2] 
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc
> [3] https://sourceware.org/pipermail/libc-alpha/2022-January/135416.html

--------------nALqI4I4M3qayzseUAxgdj3g
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-riscv-Add-sigcontext-save-restore-for-vector.patch"
Content-Disposition: attachment;
 filename="0001-riscv-Add-sigcontext-save-restore-for-vector.patch"
Content-Transfer-Encoding: base64

RnJvbSAxNjllZWExZWYwNzJjODQwMzI3N2E2NjMxM2IwMDI1ODA4MGFjOTJjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3NpbmMu
Y29tPgpEYXRlOiBXZWQsIDIxIFNlcCAyMDIyIDE0OjQzOjUyIC0wNzAwClN1YmplY3Q6IFtQ
QVRDSF0gcmlzY3Y6IEFkZCBzaWdjb250ZXh0IHNhdmUvcmVzdG9yZSBmb3IgdmVjdG9yCgpW
IHN0YXRlIG5lZWRzIHRvIGJlIHByZXNlcnZlZCBhY3Jvc3Mgc2lnbmFsIGhhbmRsaW5nIG9u
IHVzZXIgc3RhY2suClRvIGF2b2lkIGdsaWJjIEFCSSBicmVhaywgdGhpcyBpcyBub3QgYWRk
ZWQgdG8gc3RydWN0IHNpZ2NvbnRleHQgKGp1c3QgYXMKZm9yIGludC9mcCByZWdzKSBidXQg
dG8gc3RydWN0IHJ0X3NpZ2ZyYW1lLiBBbHNvIHRoaXMgaXMgYWxsIGRvbmUKZHluYW1pY2Fs
bHkgKHZzLiBzb21lIHN0YXRpYyBhbGxvY2F0aW9uKSB0byBjbGVhbmx5IGhhbmRsZSBpbXBs
ZW1lbnRhdGlvbgpkZWZpbmVkIFZMRU4gd2lkZSBWLXJlZ3MuCgpXZSBhbHNvIGJvcnJvdyBh
cm02NCBzdHlsZSBvZiAiY29udGV4dCBoZWFkZXIiIHRvIHRhZyB0aGUgZXh0ZW5zaW9uCnN0
YXRlIHRvIGFsbG93IGZvciBlYXN5IGludGVncmF0aW9uIG9mIGZ1dHVyZSBleHRlbnNpb25z
LgoKQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUu
Y29tPgpDby1kZXZlbG9wZWQtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2
ZS5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5j
b20+Clt2aW5lZXRnOiByZXdvcmtlZCB0byBub3QgY2hhbmdlIHN0cnVjdCBzaWdjb250ZXh0
LAogICAgICAgICAgd2lyZXVwIGluaXRfcnRfc2lnbmFsX2Vudl0KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmggfCAgMTggKysrCiBhcmNoL3Jpc2N2L2tlcm5l
bC9hc20tb2Zmc2V0cy5jICAgICAgICAgIHwgICAyICsKIGFyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMgICAgICAgICAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFs
LmMgICAgICAgICAgICAgICB8IDE3MSArKysrKysrKysrKysrKysrKysrKystLQogNSBmaWxl
cyBjaGFuZ2VkLCAxODYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCA5NTkxN2EyYjI0ZjkuLjg1NDg1NGIzNzdi
MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCkBAIC04NSw2ICs4NSw3IEBA
IGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwg
dW5zaWduZWQgbG9uZyAqaGFydGlkKTsKIAogZXh0ZXJuIHZvaWQgcmlzY3ZfZmlsbF9od2Nh
cCh2b2lkKTsKIGV4dGVybiBpbnQgYXJjaF9kdXBfdGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tf
c3RydWN0ICpkc3QsIHN0cnVjdCB0YXNrX3N0cnVjdCAqc3JjKTsKK3ZvaWQgaW5pdF9ydF9z
aWduYWxfZW52KHZvaWQpOwogCiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdjb250ZXh0LmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vc2lnY29udGV4dC5oCmluZGV4IDg0ZjJkZmNmZGJj
ZS4uNDExYmY2OTg1Nzg0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vc2lnY29udGV4dC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9zaWdj
b250ZXh0LmgKQEAgLTgsNiArOCwyNCBAQAogCiAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgog
CisvKiBUaGUgTWFnaWMgbnVtYmVyIGZvciBzaWduYWwgY29udGV4dCBmcmFtZSBoZWFkZXIu
ICovCisjZGVmaW5lIFJWVl9NQUdJQwkweDUzNDY1NDU3CisjZGVmaW5lIEVORF9NQUdJQwkw
eDAKKworLyogVGhlIHNpemUgb2YgRU5EIHNpZ25hbCBjb250ZXh0IGhlYWRlci4gKi8KKyNk
ZWZpbmUgRU5EX0hEUl9TSVpFCTB4MAorCisvKiBFdmVyeSBvcHRpb25hbCBleHRlbnNpb24g
c3RhdGUgbmVlZHMgdG8gaGF2ZSB0aGUgaGRyLiAqLworc3RydWN0IF9fcmlzY3ZfY3R4X2hk
ciB7CisJX191MzIgbWFnaWM7CisJX191MzIgc2l6ZTsKK307CisKK3N0cnVjdCBfX3NjX3Jp
c2N2X3Zfc3RhdGUgeworCXN0cnVjdCBfX3Jpc2N2X2N0eF9oZHIgaGVhZDsKKwlzdHJ1Y3Qg
X19yaXNjdl92X3N0YXRlIHZfc3RhdGU7Cit9IF9fYXR0cmlidXRlX18oKGFsaWduZWQoMTYp
KSk7CisKIC8qCiAgKiBTaWduYWwgY29udGV4dCBzdHJ1Y3R1cmUKICAqCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9hc20tb2Zmc2V0cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
YXNtLW9mZnNldHMuYwppbmRleCAzN2UzZTZhOGQ4NzcuLjgwMzE2ZWY3YmI3OCAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9hc20tb2Zmc2V0cy5jCkBAIC03NSw2ICs3NSw4IEBAIHZvaWQgYXNtX29mZnNl
dHModm9pZCkKIAlPRkZTRVQoVFNLX1NUQUNLX0NBTkFSWSwgdGFza19zdHJ1Y3QsIHN0YWNr
X2NhbmFyeSk7CiAjZW5kaWYKIAorCU9GRlNFVChSSVNDVl9WX1NUQVRFX01BR0lDLCBfX3Jp
c2N2X2N0eF9oZHIsIG1hZ2ljKTsKKwlPRkZTRVQoUklTQ1ZfVl9TVEFURV9TSVpFLCBfX3Jp
c2N2X2N0eF9oZHIsIHNpemUpOwogCU9GRlNFVChSSVNDVl9WX1NUQVRFX1ZTVEFSVCwgX19y
aXNjdl92X3N0YXRlLCB2c3RhcnQpOwogCU9GRlNFVChSSVNDVl9WX1NUQVRFX1ZMLCBfX3Jp
c2N2X3Zfc3RhdGUsIHZsKTsKIAlPRkZTRVQoUklTQ1ZfVl9TVEFURV9WVFlQRSwgX19yaXNj
dl92X3N0YXRlLCB2dHlwZSk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1
cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwppbmRleCAyZGZjNDYzYjg2YmIuLmFh
MGVlZGQzYjg5MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC0yOTksNiArMjk5LDggQEAgdm9pZCBf
X2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQogCXJpc2N2X2luaXRfY2JvbV9i
bG9ja3NpemUoKTsKIAlyaXNjdl9maWxsX2h3Y2FwKCk7CiAJYXBwbHlfYm9vdF9hbHRlcm5h
dGl2ZXMoKTsKKwkvKiBuZWVkcyB0byBiZSBhZnRlciByaXNjdl9maWxsX2h3Y2FwICovCisJ
aW5pdF9ydF9zaWduYWxfZW52KCk7CiB9CiAKIHN0YXRpYyBpbnQgX19pbml0IHRvcG9sb2d5
X2luaXQodm9pZCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKaW5kZXggNWM1OTExMjNjNDQwLi5lZTIzNGMz
MTllNWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCkBAIC0yMSwxNSArMjEsMjcgQEAKICNpbmNsdWRl
IDxhc20vY3NyLmg+CiAKIGV4dGVybiB1MzIgX191c2VyX3J0X3NpZ3JldHVyblsyXTsKK3N0
YXRpYyBzaXplX3QgcnZ2X3NjX3NpemU7CiAKICNkZWZpbmUgREVCVUdfU0lHIDAKIAogc3Ry
dWN0IHJ0X3NpZ2ZyYW1lIHsKIAlzdHJ1Y3Qgc2lnaW5mbyBpbmZvOwotCXN0cnVjdCB1Y29u
dGV4dCB1YzsKICNpZm5kZWYgQ09ORklHX01NVQogCXUzMiBzaWdyZXR1cm5fY29kZVsyXTsK
ICNlbmRpZgorCXN0cnVjdCB1Y29udGV4dCB1YzsKKwkvKgorCSAqIFBsYWNlaG9sZGVyIGZv
ciBhZGRpdGlvbmFsIHN0YXRlIGZvciBWIGV4dCAoYW5kIG90aGVycyBpbiBmdXR1cmUpLgor
CSAqICAtIE5vdCBhZGRlZCB0byBzdHJ1Y3Qgc2lnY29udGV4dCAodW5saWtlIGludC9mcCBy
ZWdzKSB0byByZW1haW4KKwkgKiAgICBjb21wYXRpYmxlIHdpdGggZXhpc3RpbmcgZ2xpYmMg
c3RydWN0IHNpZ2NvbnRleHQKKwkgKiAgLSBOb3QgYWRkZWQgaGVyZSBleHBsaWNpdGx5IGVp
dGhlciB0byBhbGxvdyBmb3IKKwkgKiAgICAgLSBJbXBsZW1lbnRhdGlvbiBkZWZpbmVkIFZM
RU4gd2lkZSBWIHJlZworCSAqICAgICAtIEFiaWxpdHkgdG8gZG8gdGhpcyBwZXIgcHJvY2Vz
cworCSAqIFRoZSBhY3R1YWwgViBzdGF0ZSBzdHJ1Y3QgaXMgZGVmaW5lZCBpbiB1YXBpIGhl
YWRlci4KKwkgKiBOb3RlOiBUaGUgYWxpZ25tZW50IG9mIDE2IGlzIEFCSSBtYW5kYXRlZCBm
b3Igc3RhY2sgZW50cmllcy4KKwkgKi8KKwlfX3U4IHNjX2V4dG5bXSBfX2F0dHJpYnV0ZV9f
KChfX2FsaWduZWRfXygxNikpKTsKIH07CiAKICNpZmRlZiBDT05GSUdfRlBVCkBAIC04Niwx
NiArOTgsMTQyIEBAIHN0YXRpYyBsb25nIHNhdmVfZnBfc3RhdGUoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MsCiAjZGVmaW5lIHJlc3RvcmVfZnBfc3RhdGUodGFzaywgcmVncykgKDApCiAjZW5k
aWYKIAotc3RhdGljIGxvbmcgcmVzdG9yZV9zaWdjb250ZXh0KHN0cnVjdCBwdF9yZWdzICpy
ZWdzLAotCXN0cnVjdCBzaWdjb250ZXh0IF9fdXNlciAqc2MpCisjaWZkZWYgQ09ORklHX1JJ
U0NWX0lTQV9WCisKK3N0YXRpYyBsb25nIHNhdmVfdl9zdGF0ZShzdHJ1Y3QgcHRfcmVncyAq
cmVncywgdm9pZCAqKnNjX3ZlYykKK3sKKwkvKgorCSAqIFB1dCBfX3NjX3Jpc2N2X3Zfc3Rh
dGUgdG8gdGhlIHVzZXIncyBzaWduYWwgY29udGV4dCBzcGFjZSBwb2ludGVkCisJICogYnkg
c2NfdmVjIGFuZCB0aGUgZGF0YXAgcG9pbnQgdGhlIGFkZHJlc3MgcmlnaHQKKwkgKiBhZnRl
ciBfX3NjX3Jpc2N2X3Zfc3RhdGUuCisJICovCisJc3RydWN0IF9fc2NfcmlzY3Zfdl9zdGF0
ZSBfX3VzZXIgKnN0YXRlID0gKHN0cnVjdCBfX3NjX3Jpc2N2X3Zfc3RhdGUgKikgKCpzY192
ZWMpOworCXZvaWQgX191c2VyICpkYXRhcCA9IHN0YXRlICsgMTsKKwlsb25nIGVycjsKKwor
CWVyciA9IF9fcHV0X3VzZXIoUlZWX01BR0lDLCAmc3RhdGUtPmhlYWQubWFnaWMpOworCWVy
ciA9IF9fcHV0X3VzZXIocnZ2X3NjX3NpemUsICZzdGF0ZS0+aGVhZC5zaXplKTsKKworCXZz
dGF0ZV9zYXZlKGN1cnJlbnQsIHJlZ3MpOworCS8qIENvcHkgYWRkaXRpb25hbCB2c3RhdGUg
KGV4Y2VwdCBWIHJlZ2ZpbGUpLiAqLworCWVyciA9IF9fY29weV90b191c2VyKCZzdGF0ZS0+
dl9zdGF0ZSwgJmN1cnJlbnQtPnRocmVhZC52c3RhdGUsCisJCQkgICAgIFJJU0NWX1ZfU1RB
VEVfREFUQVApOworCWlmICh1bmxpa2VseShlcnIpKQorCQlyZXR1cm4gZXJyOworCisJLyog
Q29weSB0aGUgcG9pbnRlciBkYXRhcCBpdHNlbGYuICovCisJZXJyID0gX19wdXRfdXNlcihk
YXRhcCwgJnN0YXRlLT52X3N0YXRlLmRhdGFwKTsKKwlpZiAodW5saWtlbHkoZXJyKSkKKwkJ
cmV0dXJuIGVycjsKKworCS8qIENvcHkgdGhlIFYgcmVnZmlsZSB0byB1c2VyIHNwYWNlIGRh
dGFwLiAqLworCWVyciA9IF9fY29weV90b191c2VyKGRhdGFwLCBjdXJyZW50LT50aHJlYWQu
dnN0YXRlLmRhdGFwLCByaXNjdl92c2l6ZSk7CisKKwkqc2NfdmVjICs9IHJ2dl9zY19zaXpl
OworCisJcmV0dXJuIGVycjsKK30KKworc3RhdGljIGxvbmcgcmVzdG9yZV92X3N0YXRlKHN0
cnVjdCBwdF9yZWdzICpyZWdzLCB2b2lkICoqc2NfdmVjKQoreworCWxvbmcgZXJyOworCXN0
cnVjdCBfX3NjX3Jpc2N2X3Zfc3RhdGUgX191c2VyICpzdGF0ZSA9IChzdHJ1Y3QgX19zY19y
aXNjdl92X3N0YXRlICopKCpzY192ZWMpOworCXZvaWQgX191c2VyICpkYXRhcDsKKworCS8q
IGN0eF9oZHIgY2hlY2sgZm9yIFJWVl9NQUdJQyBhbHJlYWR5IGRvbmUgaW4gY2FsbGVyLiAq
LworCisJLyogQ29weSBldmVyeXRoaW5nIG9mIF9fc2NfcmlzY3Zfdl9zdGF0ZSBleGNlcHQg
ZGF0YXAuICovCisJZXJyID0gX19jb3B5X2Zyb21fdXNlcigmY3VycmVudC0+dGhyZWFkLnZz
dGF0ZSwgJnN0YXRlLT52X3N0YXRlLAorCQkJICAgICAgIFJJU0NWX1ZfU1RBVEVfREFUQVAp
OworCWlmICh1bmxpa2VseShlcnIpKQorCQlyZXR1cm4gZXJyOworCisJLyogQ29weSB0aGUg
cG9pbnRlciBkYXRhcCBpdHNlbGYuICovCisJZXJyID0gX19nZXRfdXNlcihkYXRhcCwgJnN0
YXRlLT52X3N0YXRlLmRhdGFwKTsKKwlpZiAodW5saWtlbHkoZXJyKSkKKwkJcmV0dXJuIGVy
cjsKKworCS8qIENvcHkgdGhlIHdob2xlIHZlY3RvciBjb250ZW50IGZyb20gdXNlciBzcGFj
ZSBkYXRhcC4gKi8KKwllcnIgPSBfX2NvcHlfZnJvbV91c2VyKGN1cnJlbnQtPnRocmVhZC52
c3RhdGUuZGF0YXAsIGRhdGFwLCByaXNjdl92c2l6ZSk7CisJaWYgKHVubGlrZWx5KGVycikp
CisJCXJldHVybiBlcnI7CisKKwl2c3RhdGVfcmVzdG9yZShjdXJyZW50LCByZWdzKTsKKwor
CSpzY192ZWMgKz0gcnZ2X3NjX3NpemU7CisKKwlyZXR1cm4gZXJyOworfQorCisjZWxzZQor
I2RlZmluZSBzYXZlX3Zfc3RhdGUodGFzaywgcmVncykgKDApCisjZGVmaW5lIHJlc3RvcmVf
dl9zdGF0ZSh0YXNrLCByZWdzKSAoMCkKKyNlbmRpZgorCitzdGF0aWMgbG9uZyByZXN0b3Jl
X3NpZ2NvbnRleHQoc3RydWN0IHJ0X3NpZ2ZyYW1lIF9fdXNlciAqZnJhbWUsCisJCQkgICAg
ICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CisJc3RydWN0IHNpZ2NvbnRleHQgX191c2Vy
ICpzYyA9ICZmcmFtZS0+dWMudWNfbWNvbnRleHQ7CisJdm9pZCAqc2NfZXh0biA9ICZmcmFt
ZS0+c2NfZXh0bjsKIAlsb25nIGVycjsKKwogCS8qIHNjX3JlZ3MgaXMgc3RydWN0dXJlZCB0
aGUgc2FtZSBhcyB0aGUgc3RhcnQgb2YgcHRfcmVncyAqLwogCWVyciA9IF9fY29weV9mcm9t
X3VzZXIocmVncywgJnNjLT5zY19yZWdzLCBzaXplb2Yoc2MtPnNjX3JlZ3MpKTsKIAkvKiBS
ZXN0b3JlIHRoZSBmbG9hdGluZy1wb2ludCBzdGF0ZS4gKi8KIAlpZiAoaGFzX2ZwdSgpKQog
CQllcnIgfD0gcmVzdG9yZV9mcF9zdGF0ZShyZWdzLCAmc2MtPnNjX2ZwcmVncyk7CisKKwl3
aGlsZSAoMSAmJiAhZXJyKSB7CisJCXN0cnVjdCBfX3Jpc2N2X2N0eF9oZHIgKmhlYWQgPSAo
c3RydWN0IF9fcmlzY3ZfY3R4X2hkciAqKXNjX2V4dG47CisJCV9fdTMyIG1hZ2ljLCBzaXpl
OworCisJCWVyciB8PSBfX2dldF91c2VyKG1hZ2ljLCAmaGVhZC0+bWFnaWMpOworCQllcnIg
fD0gX19nZXRfdXNlcihzaXplLCAmaGVhZC0+c2l6ZSk7CisJCWlmIChlcnIpCisJCQlnb3Rv
IGRvbmU7CisKKwkJc3dpdGNoIChtYWdpYykgeworCQljYXNlIEVORF9NQUdJQzoKKwkJCWlm
IChzaXplICE9IEVORF9IRFJfU0laRSkKKwkJCQlnb3RvIGludmFsaWQ7CisJCQlnb3RvIGRv
bmU7CisJCWNhc2UgUlZWX01BR0lDOgorCQkJaWYgKCFoYXNfdmVjdG9yKCkgfHwgKHNpemUg
IT0gcnZ2X3NjX3NpemUpKQorCQkJCWdvdG8gaW52YWxpZDsKKwkJCWVyciB8PSByZXN0b3Jl
X3Zfc3RhdGUocmVncywgJnNjX2V4dG4pOworCQkJYnJlYWs7CisJCWRlZmF1bHQ6CisJCQln
b3RvIGludmFsaWQ7CisJCX0KKwl9Citkb25lOgogCXJldHVybiBlcnI7CisKK2ludmFsaWQ6
CisJcmV0dXJuIC1FSU5WQUw7Cit9CisKK3N0YXRpYyBzaXplX3QgY2FsX3J0X2ZyYW1lX3Np
emUodm9pZCkKK3sKKwlzdHJ1Y3QgcnRfc2lnZnJhbWUgX191c2VyICpmcmFtZTsKKwlzdGF0
aWMgc2l6ZV90IGZyYW1lX3NpemU7CisJc2l6ZV90IHRvdGFsX2NvbnRleHRfc2l6ZSA9IDA7
CisKKwlpZiAoZnJhbWVfc2l6ZSkKKwkJZ290byBkb25lOworCisJdG90YWxfY29udGV4dF9z
aXplID0gc2l6ZW9mKCpmcmFtZSk7CisKKwlpZiAoaGFzX3ZlY3RvcigpKQorCQl0b3RhbF9j
b250ZXh0X3NpemUgKz0gcnZ2X3NjX3NpemU7CisKKwkvKiBBZGQgYSBfX3Jpc2N2X2N0eF9o
ZHIgZm9yIEVORCBzaWduYWwgY29udGV4dCBoZWFkZXIuICovCisJdG90YWxfY29udGV4dF9z
aXplICs9IHNpemVvZihzdHJ1Y3QgX19yaXNjdl9jdHhfaGRyKTsKKworCWZyYW1lX3NpemUg
PSByb3VuZF91cCh0b3RhbF9jb250ZXh0X3NpemUsIDE2KTsKK2RvbmU6CisJcmV0dXJuIGZy
YW1lX3NpemU7CisKIH0KIAogU1lTQ0FMTF9ERUZJTkUwKHJ0X3NpZ3JldHVybikKQEAgLTEw
NCwxMyArMjQyLDE0IEBAIFNZU0NBTExfREVGSU5FMChydF9zaWdyZXR1cm4pCiAJc3RydWN0
IHJ0X3NpZ2ZyYW1lIF9fdXNlciAqZnJhbWU7CiAJc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
OwogCXNpZ3NldF90IHNldDsKKwlzaXplX3QgZnJhbWVfc2l6ZSA9IGNhbF9ydF9mcmFtZV9z
aXplKCk7CiAKIAkvKiBBbHdheXMgbWFrZSBhbnkgcGVuZGluZyByZXN0YXJ0ZWQgc3lzdGVt
IGNhbGxzIHJldHVybiAtRUlOVFIgKi8KIAljdXJyZW50LT5yZXN0YXJ0X2Jsb2NrLmZuID0g
ZG9fbm9fcmVzdGFydF9zeXNjYWxsOwogCiAJZnJhbWUgPSAoc3RydWN0IHJ0X3NpZ2ZyYW1l
IF9fdXNlciAqKXJlZ3MtPnNwOwogCi0JaWYgKCFhY2Nlc3Nfb2soZnJhbWUsIHNpemVvZigq
ZnJhbWUpKSkKKwlpZiAoIWFjY2Vzc19vayhmcmFtZSwgZnJhbWVfc2l6ZSkpCiAJCWdvdG8g
YmFkZnJhbWU7CiAKIAlpZiAoX19jb3B5X2Zyb21fdXNlcigmc2V0LCAmZnJhbWUtPnVjLnVj
X3NpZ21hc2ssIHNpemVvZihzZXQpKSkKQEAgLTExOCw3ICsyNTcsNyBAQCBTWVNDQUxMX0RF
RklORTAocnRfc2lncmV0dXJuKQogCiAJc2V0X2N1cnJlbnRfYmxvY2tlZCgmc2V0KTsKIAot
CWlmIChyZXN0b3JlX3NpZ2NvbnRleHQocmVncywgJmZyYW1lLT51Yy51Y19tY29udGV4dCkp
CisJaWYgKHJlc3RvcmVfc2lnY29udGV4dChmcmFtZSwgcmVncykpCiAJCWdvdG8gYmFkZnJh
bWU7CiAKIAlpZiAocmVzdG9yZV9hbHRzdGFjaygmZnJhbWUtPnVjLnVjX3N0YWNrKSkKQEAg
LTE0MSwxNSArMjgwLDI0IEBAIFNZU0NBTExfREVGSU5FMChydF9zaWdyZXR1cm4pCiB9CiAK
IHN0YXRpYyBsb25nIHNldHVwX3NpZ2NvbnRleHQoc3RydWN0IHJ0X3NpZ2ZyYW1lIF9fdXNl
ciAqZnJhbWUsCi0Jc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCisJCQkgICAgIHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogewogCXN0cnVjdCBzaWdjb250ZXh0IF9fdXNlciAqc2MgPSAmZnJhbWUt
PnVjLnVjX21jb250ZXh0OworCXZvaWQgKnNjX2V4dG4gPSAmZnJhbWUtPnNjX2V4dG47CiAJ
bG9uZyBlcnI7CisKIAkvKiBzY19yZWdzIGlzIHN0cnVjdHVyZWQgdGhlIHNhbWUgYXMgdGhl
IHN0YXJ0IG9mIHB0X3JlZ3MgKi8KIAllcnIgPSBfX2NvcHlfdG9fdXNlcigmc2MtPnNjX3Jl
Z3MsIHJlZ3MsIHNpemVvZihzYy0+c2NfcmVncykpOwogCS8qIFNhdmUgdGhlIGZsb2F0aW5n
LXBvaW50IHN0YXRlLiAqLwogCWlmIChoYXNfZnB1KCkpCiAJCWVyciB8PSBzYXZlX2ZwX3N0
YXRlKHJlZ3MsICZzYy0+c2NfZnByZWdzKTsKKwkvKiBTYXZlIHRoZSB2ZWN0b3Igc3RhdGUu
ICovCisJaWYgKGhhc192ZWN0b3IoKSkKKwkJZXJyIHw9IHNhdmVfdl9zdGF0ZShyZWdzLCAm
c2NfZXh0bik7CisKKwkvKiBQdXQgRU5EIF9fcmlzY3ZfY3R4X2hkciBhdCB0aGUgZW5kLiAq
LworCWVyciA9IF9fcHV0X3VzZXIoRU5EX01BR0lDLCAmKChzdHJ1Y3QgX19yaXNjdl9jdHhf
aGRyICopc2NfZXh0biktPm1hZ2ljKTsKKwllcnIgPSBfX3B1dF91c2VyKEVORF9IRFJfU0la
RSwgJigoc3RydWN0IF9fcmlzY3ZfY3R4X2hkciAqKXNjX2V4dG4pLT5zaXplKTsKIAlyZXR1
cm4gZXJyOwogfQogCkBAIC0xODAsMTAgKzMyOCwxMSBAQCBzdGF0aWMgaW50IHNldHVwX3J0
X2ZyYW1lKHN0cnVjdCBrc2lnbmFsICprc2lnLCBzaWdzZXRfdCAqc2V0LAogCXN0cnVjdCBw
dF9yZWdzICpyZWdzKQogewogCXN0cnVjdCBydF9zaWdmcmFtZSBfX3VzZXIgKmZyYW1lOwor
CXNpemVfdCBmcmFtZV9zaXplID0gY2FsX3J0X2ZyYW1lX3NpemUoKTsKIAlsb25nIGVyciA9
IDA7CiAKLQlmcmFtZSA9IGdldF9zaWdmcmFtZShrc2lnLCByZWdzLCBzaXplb2YoKmZyYW1l
KSk7Ci0JaWYgKCFhY2Nlc3Nfb2soZnJhbWUsIHNpemVvZigqZnJhbWUpKSkKKwlmcmFtZSA9
IGdldF9zaWdmcmFtZShrc2lnLCByZWdzLCBmcmFtZV9zaXplKTsKKwlpZiAoIWFjY2Vzc19v
ayhmcmFtZSwgZnJhbWVfc2l6ZSkpCiAJCXJldHVybiAtRUZBVUxUOwogCiAJZXJyIHw9IGNv
cHlfc2lnaW5mb190b191c2VyKCZmcmFtZS0+aW5mbywgJmtzaWctPmluZm8pOwpAQCAtMzI5
LDMgKzQ3OCw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgZG9fbm90aWZ5X3Jlc3Vt
ZShzdHJ1Y3QgcHRfcmVncyAqcmVncywKIAlpZiAodGhyZWFkX2luZm9fZmxhZ3MgJiBfVElG
X05PVElGWV9SRVNVTUUpCiAJCXJlc3VtZV91c2VyX21vZGVfd29yayhyZWdzKTsKIH0KKwor
dm9pZCBfX2luaXQgaW5pdF9ydF9zaWduYWxfZW52KHZvaWQpCit7CisJLyogVmVjdG9yIHJl
Z2ZpbGUgKyBjb250cm9sIHJlZ3MuICovCisJcnZ2X3NjX3NpemUgPSBzaXplb2Yoc3RydWN0
IF9fc2NfcmlzY3Zfdl9zdGF0ZSkgKyByaXNjdl92c2l6ZTsKK30KLS0gCjIuMzQuMQoK

--------------nALqI4I4M3qayzseUAxgdj3g
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--------------nALqI4I4M3qayzseUAxgdj3g--

