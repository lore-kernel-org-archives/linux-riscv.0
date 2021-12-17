Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E4C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 05:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYjPvUv+QmKV2Y+zhrlXnL0uwrwfp60qd+npZqTiEMY=; b=CXmH/fjR90juMZ
	5j1AEaFqixmdUmDDzL5BeiNtv/hlVazCK4wcVqpmccE/XTkOjblpIpEK205DFG3QdNeUC0doXrZ4U
	fXJZsvs3rAwGPwmmhc9KSIrxPWhJ0XAta4b0GJ4ujKeF4gjXiM4SZYR6HhxvtUC9GijU8q20DgyHw
	4GEqZ0V2nEMMfAyXz45ZxzMqXiE+eyhLF7dZf6v4rvx+UtPJk2Ae2HTHmfn0vjTfPwdY4DBR+JFcr
	S8MIeUfnLBr7BaojDGyMFI6D0p46qrkxdyDClwpfSPYfni5XsGtEumw80ahyzHfonygl5Z+pXm/yZ
	yuBoCk0dEjEmIu4oDeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my68R-008gBb-58; Fri, 17 Dec 2021 05:50:27 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my68O-008gAa-VC
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 05:50:26 +0000
Received: by mail-yb1-xb34.google.com with SMTP id x32so3208430ybi.12
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 21:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jbxYFuhXciRdXFUcsp1Eus+7OgrQ8HqeVPRIesPErvo=;
 b=CicHRuYsu9gQulT86tmfz9IDPjUyCOGgQ61C6jEChS1p35Ve3SiBo15EEzdpWSqG3y
 AQ17V2JgwbunVjVOx5nHRUlnjGwg4L1BEvZqzjEBtFagQk/zaPaYd/qYef/a/DWzA/X3
 3iPE4HKUtAcZlz705NyfyBPEZ22Mob+bXXxdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbxYFuhXciRdXFUcsp1Eus+7OgrQ8HqeVPRIesPErvo=;
 b=ubs1ZU0FtyceAVx0cLoWXsRmX8Slt+zCB+FI1QViYBryRpMq6wqJM7cCo8yw/W95C0
 DsSmkwaD6QwZnPuHkeHtvYf6xaSBIPJUO3nyicIoxqgBLD8EdhM0HO7V+rsbpAAho6UM
 7Snc4uIuZaW8oVnoVSEIAhnF5CpR59iI9/uKZYSCEFnMct/j4/359IRLeruihxgAJRvo
 3NzVeLVBgSetYQpc0/Scu9+vGcQ5xBRjSX7QGYwtBOqo+YDjES0tOFWD7qfetbpqdOd7
 CAeNkQzyPUSfefNv9VhpsBH3tJW4Nh8zzRqlhvWIgY5lJs3kWDfSUBgWJnwBg7RDJDj5
 o3PA==
X-Gm-Message-State: AOAM532ecUNJSqtJhBJtCUUFtwDlg9zfmmm1RABF2xHfB14bZb3Tvfqq
 J1XAn4sJKjqB8g1T8GngwpkOh7HSSsMmEARAJT4b
X-Google-Smtp-Source: ABdhPJySH+njHDMdSsHjZNNEk79KBchC3iVUT1MckIXEbQ7YXVj2esVyGamHDnSMMU0LlK81DUevSaIQmJ6P0mJOzjI=
X-Received: by 2002:a05:6902:568:: with SMTP id
 a8mr2423433ybt.472.1639720223901; 
 Thu, 16 Dec 2021 21:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-4-anup.patel@wdc.com>
In-Reply-To: <20211129075451.418122-4-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Dec 2021 21:50:13 -0800
Message-ID: <CAOnJCU+MvAj79Pyjg+pimPkcWTVbq9kwSaoUAXSCV9Y1odD+5g@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_215025_035742_2CA392CA 
X-CRM114-Status: GOOD (  12.78  )
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

On Mon, Nov 29, 2021 at 12:10 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
> which will allow users to pass additional compile-time flags such
> as "-static".
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index c4e34717826a..ee6740e9ecdb 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -131,7 +131,7 @@ endif
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>

--
Regards,
Atish

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
