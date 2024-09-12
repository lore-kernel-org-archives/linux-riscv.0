Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513F1EE57CC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 00:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kb51/QfWXM7dmGynoqLDw4Roc65vLww8Lt1WC1mvgOw=; b=Zi2NRbVP7kAsjPAw+GJStfH09q
	x3f35I3VIWMR+dfcxYdStrTy/dXPVRWiyt3F3FZMThSK6IcBcIkQ8UXs8Ben4Em6sjFQgXMtKGPj8
	SGDZbObFFHgOHJWg/IMBnO4jmWuAweZnUZ8BHic05qGhyn+HG1K9xzNyqRLY1fRDSksS6ZEj/DM/w
	zGUt82uw/pQu88AbB717TjTsAXbJJHgjqA/nd1/m1ZcQiOqXw+gvNjsLmNvF5xTAt8cqWYfoYu1U1
	OPjUtV1rPhZcvNYv57roujuGBqq+R1Okjg7XBYfM8wqLVJDQVMs6+Se7DqrYjKl1A4fkGhEplt1vO
	457vEENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soXaE-0000000BPaa-08WT;
	Thu, 12 Sep 2024 00:21:14 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soXZ9-0000000BPQZ-14SU
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 00:20:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6d9f0cf5ae3so4581057b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 17:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726100401; x=1726705201; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6gfaXOaocGV5N/sXdVJlpTgJOtMKxsPAOrOzp4Kg5Zo=;
        b=MRSxAkbNno125scQ/ie/kJRnDpK9rqTM/bBNE9RM+eMihGV6fmrjURlD3MlLazL5zX
         sZYRbvAN1pqkAW10D3BrjX3R7ajN5kwoK3Gmddq9eWIkAC6hn2heX7uDIPlCElxqJNzq
         BQoP90ro177VsPpwSfUOza5XCbgKYbYPBzqUDinHHM/rZxH2omf0GX1+JdZIONUZC8wc
         AWn7J+g7C1/US/NF0x579MoSyG7aD5E11yMcGrKCYfQAfl2qkLHDNv9gMaHdNHi6OhqE
         fx2xWavXQkkM1QhquU8NhAaGKMg2x+o73RSgve84hU7+Ok7sT+wErWZFJQ67ShYi539d
         c+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726100401; x=1726705201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gfaXOaocGV5N/sXdVJlpTgJOtMKxsPAOrOzp4Kg5Zo=;
        b=s7UNNpqSAbPLW8bHdcugizqeauV967+p1peaFRqg76Uz9HeLX3KFyhg/j1O6yy3MOf
         W6QrYl/emu5K63vmwhe4cKI/YowTG1p9PGfter2UQ1OAxI69O12axWULmU462nRzmj5p
         ucBZMKkZU9/okY8/Uwn5sBPdpUAsAx0vPSY+Nnpz8+Q6wtQ68FTYbmTPoCEMnABVWQHS
         rDsNZYcpYa/N/301TDJ0Fg+1vNvlnb4atkB32CAY0GEXpbfS6Y3EMW3+/unORc6vM6OI
         DCGXTrrV45E5E2C6E7v+PAWrtYSutW5Ch4KRw9Dr1pXx28epM8j3JlzVJb3WI6zFQVj7
         jqng==
X-Forwarded-Encrypted: i=1; AJvYcCWC7JwSXNLvXV/6LJq8GPJkijWwdpFnTcO8GalzwUCQAtabDvJX/EvjV/aijnckJV8Z9WMils/pQ1m87g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSQk+YzQJKTxz6a+cWY5roFJsRkAykn1m9AzCkwNYwDj+cjSmu
	kYNfG5BG2Dopei04XJIrRK5CbuB3f72v5Hn9Y1ObgdLUY2NR+HjzXGtqiR7Le+ZY4VuCZJqyPj+
	apguPrj1hxE7oC5iyS4EDnxABUYO0kANzPl1Q+g6heaCg3vzS8Q==
X-Google-Smtp-Source: AGHT+IFCSQW9OkhxWu5GixWfZA3Akz697w6Am0RhcKLgULCV/kD0mPJsOAT48WevjQEwyJGw4vOMbwN8aQtB8tw8odU=
X-Received: by 2002:a05:690c:ec8:b0:6db:b1d5:5116 with SMTP id
 00721157ae682-6dbb6add2fdmr14504987b3.9.1726100400935; Wed, 11 Sep 2024
 17:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-14-seanjc@google.com>
In-Reply-To: <20240911204158.2034295-14-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 11 Sep 2024 17:19:24 -0700
Message-ID: <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000003f3d950621e1110c"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_172007_326673_61DC24FF 
X-CRM114-Status: GOOD (  29.48  )
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

--0000000000003f3d950621e1110c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 1:42=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Add two phases to mmu_stress_test to verify that KVM correctly handles
> guest memory that was writable, and then made read-only in the primary MM=
U,
> and then made writable again.
>
> Add bonus coverage for x86 and arm64 to verify that all of guest memory w=
as
> marked read-only.  Making forward progress (without making memory writabl=
e)
> requires arch specific code to skip over the faulting instruction, but th=
e
> test can at least verify each vCPU's starting page was made read-only for
> other architectures.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/mmu_stress_test.c | 104 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testin=
g/selftests/kvm/mmu_stress_test.c
> index 50c3a17418c4..c07c15d7cc9a 100644
> --- a/tools/testing/selftests/kvm/mmu_stress_test.c
> +++ b/tools/testing/selftests/kvm/mmu_stress_test.c
> @@ -16,6 +16,8 @@
>  #include "guest_modes.h"
>  #include "processor.h"
>
> +static bool mprotect_ro_done;
> +
>  static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t st=
ride)
>  {
>         uint64_t gpa;
> @@ -31,6 +33,42 @@ static void guest_code(uint64_t start_gpa, uint64_t en=
d_gpa, uint64_t stride)
>                 *((volatile uint64_t *)gpa);
>         GUEST_SYNC(2);
>
> +       /*
> +        * Write to the region while mprotect(PROT_READ) is underway.  Ke=
ep
> +        * looping until the memory is guaranteed to be read-only, otherw=
ise
> +        * vCPUs may complete their writes and advance to the next stage
> +        * prematurely.
> +        *
> +        * For architectures that support skipping the faulting instructi=
on,
> +        * generate the store via inline assembly to ensure the exact len=
gth
> +        * of the instruction is known and stable (vcpu_arch_put_guest() =
on
> +        * fixed-length architectures should work, but the cost of parano=
ia
> +        * is low in this case).  For x86, hand-code the exact opcode so =
that
> +        * there is no room for variability in the generated instruction.
> +        */
> +       do {
> +               for (gpa =3D start_gpa; gpa < end_gpa; gpa +=3D stride)
> +#ifdef __x86_64__
> +                       asm volatile(".byte 0x48,0x89,0x00" :: "a"(gpa) :=
 "memory"); /* mov %rax, (%rax) */

I'm curious what you think about using labels (in asm, but perhaps
also in C) and *setting* the PC instead of incrementing the PC. Diff
attached (tested on x86). It might even be safe/okay to always use
vcpu_arch_put_guest(), just set the PC to a label immediately
following it.

I don't feel strongly, so feel free to ignore.



> +#elif defined(__aarch64__)
> +                       asm volatile("str %0, [%0]" :: "r" (gpa) : "memor=
y");
> +#else
> +                       vcpu_arch_put_guest(*((volatile uint64_t *)gpa), =
gpa);
> +#endif
> +       } while (!READ_ONCE(mprotect_ro_done));
> +
> +       /*
> +        * Only architectures that write the entire range can explicitly =
sync,
> +        * as other architectures will be stuck on the write fault.
> +        */
> +#if defined(__x86_64__) || defined(__aarch64__)
> +       GUEST_SYNC(3);
> +#endif

--0000000000003f3d950621e1110c
Content-Type: application/x-patch; name="labels.diff"
Content-Disposition: attachment; filename="labels.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m0yjcx7b0>
X-Attachment-Id: f_m0yjcx7b0

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9tbXVfc3RyZXNzX3Rlc3Qu
YyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9tbXVfc3RyZXNzX3Rlc3QuYwppbmRleCBj
MDdjMTVkN2NjOWEuLmE3Y2NlZDVjM2U2NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL21tdV9zdHJlc3NfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9tbXVfc3RyZXNzX3Rlc3QuYwpAQCAtMTYsOCArMTYsMTMgQEAKICNpbmNsdWRlICJndWVz
dF9tb2Rlcy5oIgogI2luY2x1ZGUgInByb2Nlc3Nvci5oIgogCisjaWYgZGVmaW5lZChfX3g4Nl82
NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQorZXh0ZXJuIHZvaWQgKnNraXBfcGFnZTsKKyNl
bmRpZgorCiBzdGF0aWMgYm9vbCBtcHJvdGVjdF9yb19kb25lOwogCisKIHN0YXRpYyB2b2lkIGd1
ZXN0X2NvZGUodWludDY0X3Qgc3RhcnRfZ3BhLCB1aW50NjRfdCBlbmRfZ3BhLCB1aW50NjRfdCBz
dHJpZGUpCiB7CiAJdWludDY0X3QgZ3BhOwpAQCAtNDAsMTggKzQ1LDIxIEBAIHN0YXRpYyB2b2lk
IGd1ZXN0X2NvZGUodWludDY0X3Qgc3RhcnRfZ3BhLCB1aW50NjRfdCBlbmRfZ3BhLCB1aW50NjRf
dCBzdHJpZGUpCiAJICogcHJlbWF0dXJlbHkuCiAJICoKIAkgKiBGb3IgYXJjaGl0ZWN0dXJlcyB0
aGF0IHN1cHBvcnQgc2tpcHBpbmcgdGhlIGZhdWx0aW5nIGluc3RydWN0aW9uLAotCSAqIGdlbmVy
YXRlIHRoZSBzdG9yZSB2aWEgaW5saW5lIGFzc2VtYmx5IHRvIGVuc3VyZSB0aGUgZXhhY3QgbGVu
Z3RoCi0JICogb2YgdGhlIGluc3RydWN0aW9uIGlzIGtub3duIGFuZCBzdGFibGUgKHZjcHVfYXJj
aF9wdXRfZ3Vlc3QoKSBvbgotCSAqIGZpeGVkLWxlbmd0aCBhcmNoaXRlY3R1cmVzIHNob3VsZCB3
b3JrLCBidXQgdGhlIGNvc3Qgb2YgcGFyYW5vaWEKLQkgKiBpcyBsb3cgaW4gdGhpcyBjYXNlKS4g
IEZvciB4ODYsIGhhbmQtY29kZSB0aGUgZXhhY3Qgb3Bjb2RlIHNvIHRoYXQKLQkgKiB0aGVyZSBp
cyBubyByb29tIGZvciB2YXJpYWJpbGl0eSBpbiB0aGUgZ2VuZXJhdGVkIGluc3RydWN0aW9uLgor
CSAqIGdlbmVyYXRlIHRoZSBzdG9yZSB2aWEgaW5saW5lIGFzc2VtYmx5IHRvIGVuc3VyZSB3ZSBj
YW4gY29ycmVjdGx5CisJICogYWRqdXN0IHRoZSBQQyB1cG9uIGZhdWx0aW5nLgogCSAqLwogCWRv
IHsKIAkJZm9yIChncGEgPSBzdGFydF9ncGE7IGdwYSA8IGVuZF9ncGE7IGdwYSArPSBzdHJpZGUp
CiAjaWZkZWYgX194ODZfNjRfXwotCQkJYXNtIHZvbGF0aWxlKCIuYnl0ZSAweDQ4LDB4ODksMHgw
MCIgOjogImEiKGdwYSkgOiAibWVtb3J5Iik7IC8qIG1vdiAlcmF4LCAoJXJheCkgKi8KKwkJCWFz
bSB2b2xhdGlsZSgiLmdsb2JhbCBza2lwX3BhZ2U7IgorCQkJCSAgICAgIm1vdiAlMCwgKCUwKTsi
CisJCQkJICAgICAic2tpcF9wYWdlOjsiCisJCQkJICAgICA6OiAiciIgKGdwYSkgOiAibWVtb3J5
Iik7CiAjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQotCQkJYXNtIHZvbGF0aWxlKCJzdHIgJTAs
IFslMF0iIDo6ICJyIiAoZ3BhKSA6ICJtZW1vcnkiKTsKKwkJCWFzbSB2b2xhdGlsZSgiLmdsb2Jh
bCBza2lwX3BhZ2U7IgorCQkJCSAgICAgInN0ciAlMCwgWyUwXTsiCisJCQkJICAgICAic2tpcF9w
YWdlOjsiCisJCQkJICAgICA6OiAiciIgKGdwYSkgOiAibWVtb3J5Iik7CiAjZWxzZQogCQkJdmNw
dV9hcmNoX3B1dF9ndWVzdCgqKCh2b2xhdGlsZSB1aW50NjRfdCAqKWdwYSksIGdwYSk7CiAjZW5k
aWYKQEAgLTE3MCwxMCArMTc4LDEwIEBAIHN0YXRpYyB2b2lkICp2Y3B1X3dvcmtlcih2b2lkICpk
YXRhKQogCQlURVNUX0FTU0VSVF9FUShlcnJubywgRUZBVUxUKTsKICNpZiBkZWZpbmVkKF9feDg2
XzY0X18pCiAJCVdSSVRFX09OQ0UodmNwdS0+cnVuLT5rdm1fZGlydHlfcmVncywgS1ZNX1NZTkNf
WDg2X1JFR1MpOwotCQl2Y3B1LT5ydW4tPnMucmVncy5yZWdzLnJpcCArPSAzOworCQl2Y3B1LT5y
dW4tPnMucmVncy5yZWdzLnJpcCA9ICh2bV92YWRkcl90KSZza2lwX3BhZ2U7CiAjZWxpZiBkZWZp
bmVkKF9fYWFyY2g2NF9fKQogCQl2Y3B1X3NldF9yZWcodmNwdSwgQVJNNjRfQ09SRV9SRUcocmVn
cy5wYyksCi0JCQkgICAgIHZjcHVfZ2V0X3JlZyh2Y3B1LCBBUk02NF9DT1JFX1JFRyhyZWdzLnBj
KSkgKyA0KTsKKwkJCSAgICAgKHZtX3ZhZGRyX3QpJnNraXBfcGFnZSk7CiAjZW5kaWYKIAogCX0K
--0000000000003f3d950621e1110c
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--0000000000003f3d950621e1110c--

