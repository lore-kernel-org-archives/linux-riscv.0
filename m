Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45186C4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkU8Fg8+v+3XhkxhevNiLs99gOVKk7veVYAZ1Y7sx80=; b=igzfhVNjnK7/kY
	giSSltHIUJAuPa7ZQ1VqZ4oegZQvVoZ2uLT5oPZTpdXTHG0DXioh5JvhyPdRYdU79fqxhE42yUY5u
	Dm3zKlSFPlj/COqvVe8TQB4uIeQ3z0ZL039DvBN0QRAPFJm7hRfo+E02yfl2/swInDA8YOsPTpCXe
	aQCy3dc4QeKxH7whnCWQML0cx7fX0oAYOlwvE2bySxJXgqGf+GPFczUcuLu8ymUxv3D6Bg4pGuSr2
	PHu1vQHuG+wQQtL3iECa1kcg8GXtvncwdpVhN+EsTQeDvQrkf3By6sXQ5Uh2enLdzySpA5xRJKh53
	+T07I4Epiv1QOKRAMAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGOm-00BA7T-2v; Sun, 27 Nov 2022 12:04:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozGOg-00BA66-5m
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 12:04:38 +0000
Received: by mail-ed1-x52d.google.com with SMTP id f7so12009382edc.6
        for <linux-riscv@lists.infradead.org>; Sun, 27 Nov 2022 04:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=De+5l1xEgoXB7FNa4tg4HfrVAuuxUoNVJkryeDf0EOs=;
        b=0R4ABPMda0JKrV6c2Z7FSfz2HeRwIqis3ahHt3e2bNFs04gENMcHGKm538cKYbwU2q
         CvScJMbfoGvowwcwjjY8XPQAXJdKgaJIcniIYt2R0ZUP1qJi6FyQdeGiEKnmxUCWm3N1
         kPIUKWCeWRChnYFhm2D1ePsWkyZFCWZp2Ff1hiIwTF5iHVoyANvJqgo1QpbV83OenrXv
         Zz/vC48dUCuFfadbkFlX/2ypf8ZV6u7o3HPfqmyBWh4NU9EKldYRFjcwL7E+qzdGp1uM
         DAYdVwEvZVf2yB4bRUivUCM3thYOV40EiZsb8HZkaQu2lxBZ6YnELg/GW4LqZRMhhoeo
         6zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=De+5l1xEgoXB7FNa4tg4HfrVAuuxUoNVJkryeDf0EOs=;
        b=SdXF57w6CcSnzJxxofm0Ts6UbWywelsIA6w44SHF11Im98H4s45GxBl9nkDlnhMUJv
         F5OQLLdHwHaMei2afrnxmuA1UcEi9EW+XV1yefb5cd8x89eVCFvMNDu+IDvRShuHh4oL
         5E+V5wGKXCQ36L5sPnHzuPVIGfR9l5xumIt/GDkYw1YzWNb06YGYp0vMESmzg845a537
         150lVO3v3Ww/dWY5KKHuZ86Ldfxys3OIJmn6Ok8M5Cwo09jlmFOOho6bkEj5m5CjfU5m
         QhohLzXdQw/J9EzZhThrTFyOB6T+ZrVCk4NSj1YxJXA8sK7o9S8VmTRNiwl/wqhzbaRh
         yeNA==
X-Gm-Message-State: ANoB5pnbk+VIWhyNDodaIBlybsFDKc+v0KHpLVKiK9HoSYE0MWggkpsz
	sOcxNcasA9gLnYRZDkF0W/j++BRhfHn/Jz9vGVYwqg==
X-Google-Smtp-Source: AA0mqf66R2SJvhmt7UjDg/avS8f9xHQnlUWA0xIT+F9M17TPUZQlaiwzfJuCRCRQs8kCMs6pNIRPgGyJfCOvWzRVS1s=
X-Received: by 2002:aa7:c859:0:b0:461:17e9:4ea3 with SMTP id
 g25-20020aa7c859000000b0046117e94ea3mr43421493edt.49.1669550667865; Sun, 27
 Nov 2022 04:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20221101053811.5884-1-liubo03@inspur.com>
In-Reply-To: <20221101053811.5884-1-liubo03@inspur.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 17:34:15 +0530
Message-ID: <CAAhSdy0t1XGTENidgNQkQ5m5emZOes+-2RXTPLEJ0tEZXuX2hA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
To: Bo Liu <liubo03@inspur.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_040434_220350_8FD9B90A 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Nov 1, 2022 at 11:08 AM Bo Liu <liubo03@inspur.com> wrote:
>
> vma_lookup() finds the vma of a specific address with a cleaner interface
> and is more readable.
>
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Looks good to me.

Queued this patch for Linux-6.2

Thanks,
Anup

> ---
>  arch/riscv/kvm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 3620ecac2fa1..5942d10c9736 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -632,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>
>         mmap_read_lock(current->mm);
>
> -       vma = find_vma_intersection(current->mm, hva, hva + 1);
> +       vma = vma_lookup(current->mm, hva);
>         if (unlikely(!vma)) {
>                 kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
>                 mmap_read_unlock(current->mm);
> --
> 2.27.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
