Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52469C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFmTzNwAu+ctsw/CuDNTjEK++F0HI6x+le5IxbsR52Q=; b=cdyT6Q2bXZb63q
	bVMvgmBZ6QeVXZzBlZ/eTG3BBcbOXHx3xUdH57qFyMHIX6aWy/igXHrSS8yxgdGGsR5Bz+LuMLMBx
	SUIOTy3bBWowb5dOs7v8bv+P6sck1LddNHJ371ZkNHEwX+woDxkg7icxyPwTQgNRAIQiuzK03rJ4T
	NguPG+Fy4Mwf7kDnI7lxS6PLvrBYdMDUk7AUfSkiPhv7olb2LBRZAIiSdM2B0O7sB3cS64eku/ijX
	ckT5Z99gRgOQsRni+dpVF9N2noD5kzO8wb7YLO55tBgiZ5tUivA6DePBLZvqxnvsmNX/bCNjmQWBY
	GF8RK2ZNkw2mUGMscCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n25rL-000FjM-Ak; Tue, 28 Dec 2021 06:21:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n25rI-000Fhl-Rk
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 06:21:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so9459517wme.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 22:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fz/c6/4SGSYodrgD5AdFvdel0zxLs/yQs8FyjZNs4tQ=;
 b=g8BS2gkO3Z2Uowvmo4A8Ijgd4KkngqwKudZDouJ64O4ICZF4AftTAzILir3ldPIGRP
 2HtEyL5f891oVMB3m6gVXI8/xD1r9NhLBSZsFfQuUVHpX/86kWDNC++lz59nfmN9z/W0
 cMKGrJdmbUvqHhvU1uxqsv7X0U86JVXp0NZhYr17K0KjlFtwAJ0woa3kCEAcWHHRNp4Q
 35crBEvFtatsX2esBh7evM8EU1IF6zgU2G4YA4Bk2lfvnaVhgRO9jMGtIs/OuczxQIK4
 +HRFBI8MPTcGcGjwSaIrpk2xLO2TLW5r2PgSRa5rGLTK4duDOuLK22GrkaX9kuABwEbP
 H+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fz/c6/4SGSYodrgD5AdFvdel0zxLs/yQs8FyjZNs4tQ=;
 b=E8Yr7GXf9bRMdy7M0WmFlIi5OU5Xtpcj4BWRcrpsDI2LmtsPIlF4VYkriRse7bp36P
 vKsG4BP/LmtAZEPH329hj3Rh9FqIuGMbk/Qd6tHVQyXg9Gn4ZHLbXLA4fZO+B3RzdUAs
 6goGI4cFcgMqgH9Wt4GQ9fMmBx29+6GZTeYDuhUzhTATuHAvk2872ht3cng0orzYOrpQ
 hGfJkmGvVgBP/MbzSaM4F8DNY/5T+Z9AjaUdqmq8wJFtBiQaTVgR6EsY9Gk5g3vynNTU
 sgkIyGhFP+WLy5uhSXqJy0hCoXgb+PyDUmrmNHGtYQ1e2Ue1xnRcnCoUreKjP0FqykzG
 kVrw==
X-Gm-Message-State: AOAM531KsPAMTs45UcBWPDgQCAVTIDG2LwpYcBfXOowgH1aLMYEOCTxR
 n6yVZ06+mXobiZ+eL9ug363SAc0xblQBrnM7Ujiptw==
X-Google-Smtp-Source: ABdhPJzwphhcZ5/970ADxXH2bibdTOzzfkGmRBRlIOXuEZmGT+1EFTP2zwlDZkGJmzwPLY/AU7Qe3W3uiVvJgPUspkQ=
X-Received: by 2002:a05:600c:4f08:: with SMTP id
 l8mr16128758wmq.59.1640672475272; 
 Mon, 27 Dec 2021 22:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20211224073604.1085464-1-anup.patel@wdc.com>
 <20211224073604.1085464-4-anup.patel@wdc.com>
In-Reply-To: <20211224073604.1085464-4-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Dec 2021 11:51:03 +0530
Message-ID: <CAAhSdy0jN-Nz_jWXgvrfRVzS5=vRPWjBp+hytU1fA0nyVsq20w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_222116_911058_972C6040 
X-CRM114-Status: GOOD (  13.21  )
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

On Fri, Dec 24, 2021 at 1:06 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile which will
> allow users to pass additional compile-time flags such as "-static".
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-and-tested-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-and-tested-by: Sean Christopherson <seanjc@google.com>

Queued this patch for 5.17

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index f307c9f61981..3c839c01d4fd 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -132,7 +132,7 @@ endif
>  CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
>         -fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
>         -I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
> -       -I$(<D) -Iinclude/$(UNAME_M) -I..
> +       -I$(<D) -Iinclude/$(UNAME_M) -I.. $(EXTRA_CFLAGS)
>
>  no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
>          $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
