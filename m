Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F4CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ns8+srjTzN8s7vyvf2VEpTVHnXd5bVMkMTd8ynMakpE=; b=uVGJVLKUeNlctO
	42h0bK4Gmmx9MGwBuSAWTv9S/i7QoQ0Dr28928mX+B7vpobH4RjZw56tRZgBh8PA6pmf0aBCnhwJe
	mWtFwK1q9h8XtHN4ff9TVrV/jJzhD0pQCWWoLaYhz0gJT52RaVKdjMkmNoFpN1JriMW1e1lW5Ctig
	hbyUMAXVCcIqtswamG/+0buTj0btSi0zJ0dTazTnHFRK+LlGDtDLUqfM6DWNWBRo8ozw7neSUIX+c
	kBAtJI/BilThDotssyjUGKhAJlJQKhmrEr6T7l/hrDwd8YSjHidGe+JgFRjQvCE7d7svEBzCeeCVc
	wKGmia6LucS9w7Ya8kQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzsJ7-0096DK-0p; Wed, 22 Dec 2021 03:28:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzsJ3-0096CQ-Qp
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 03:28:48 +0000
Received: by mail-wr1-x434.google.com with SMTP id d9so2043972wrb.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 19:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwGmaz0czI4/jq/c3gNLjgrvk2T0ZPOGYi2vGZRAgJ8=;
 b=Jt4H1fUdCEMOLQHX3j8EBBqo9BuEi+lYppPytwWRaVi0mDh8ODMpWedLRWd3H7rBfJ
 AQ5fHBfcUpWYc5BinZTMZtuYyjBr4pkV/mECZlvDJKg0fbo9/CqScbYQrjzunNsD10ws
 R4GC78RSk9bHWAowN0oXp4B+4QcZm1bP1oWOhyPirxW+IdhskSQteDzfNLrSW1UQATzC
 mL5RHZSW7E3tEYfaWw1uFkp/B9IaBmJS4cHPJkxrdDesqtq3ZHdbYUAm1D60lrU4wM7M
 0N/jdAsLtiQ+OARU0DHfXhoDcm6KRc9DVTm2PcVKTwiueoZYle3k8QGZxCEcvc5uziZL
 GXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwGmaz0czI4/jq/c3gNLjgrvk2T0ZPOGYi2vGZRAgJ8=;
 b=FoKI4SeoUODvcbp24gVgTDN3YgAWCzLrH1ZArrtW/l+E5WKmomFU1UjpNueAlGyZW6
 6vllmlzFdI8165xSFdNZlkaXzVwr9xnJqEVqnUl9PqKd+f7vQoc7wnzv1VukyOvM/rEC
 8zJXYfdwpuJLh9SJNZnFymxhfWRhrA2rfNzgvja9O9q/jBob1jG7MChfHQ2U4L+c7dcG
 M/Mf81zJZLR6GakbmvkB1VgoJsdjVKnS3soJ67aOOSAFac6DWWITL2TiH14bCqEoU+nV
 +407GbEnDb33YGT8Q1ucUOJoXexNokO35gRT5gP8Gt9WO1wiCGwAk3VIxIGMhSF1oCrU
 Kc5Q==
X-Gm-Message-State: AOAM533mKdpc03rzOZTaSsySh9p+sTu8gHgkkSuLCAJE9mqUX6OtUlIy
 vvVmJ8fUbfJZrPsH6n4S9pfDYgRJJnFEW7Ki2pLrQQ==
X-Google-Smtp-Source: ABdhPJyUK9DbRMSBUpws7YF1ETrsADtGZwEQdEB0A/0NZqBFbMnOmeP9lttyWY0swzgjdJ4wCDf6AlQTOuCU5OY1CEk=
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr655955wrw.313.1640143724222;
 Tue, 21 Dec 2021 19:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20211221125617.932371-1-anup.patel@wdc.com>
 <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
 <4d739c28-e07d-f921-8a8d-a5343139e234@redhat.com>
In-Reply-To: <4d739c28-e07d-f921-8a8d-a5343139e234@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Dec 2021 08:58:30 +0530
Message-ID: <CAAhSdy26_a6RBTQB7FYrEAkZNcQ4xH+GkV-iv4yR9LuNEE_CmQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Anup Patel <anup.patel@wdc.com>, 
 Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Sean Christopherson <seanjc@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_192845_973934_B80EDCA7 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, Dec 21, 2021 at 10:53 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/21/21 18:22, Shuah Khan wrote:
> > On 12/21/21 5:56 AM, Anup Patel wrote:
> >> The inline version of vm_compute_max_gfn() in kvm_util.h directly
> >> access members of "struct kvm_vm" which causes compile errors for
> >> non-x86 architectures because lib/elf.c includes "kvm_util.h" before
> >> "kvm_util_internal.h".
> >>
> >> This patch fixes above described compile error by converting inline
> >> version of vm_compute_max_gfn() into a macro.
> >
> > Thank you for the patch. Please include the actual compile error in the
> > change log and send v2,
>
> Hi, a similar patch is already queued and should get to Linus today or
> tomorrow.

Thanks Paolo, I missed Andrew's fix for this.

Regards,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
